Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FD714E4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 11:19:41 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpqxQ-0002T0-MJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 05:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hpqxC-00022x-V3
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:19:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hpqxB-0004PX-0v
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:19:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hpqx7-0004Mw-D7; Tue, 23 Jul 2019 05:19:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 75A2F3066779;
 Tue, 23 Jul 2019 09:19:20 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A625D60BEC;
 Tue, 23 Jul 2019 09:19:18 +0000 (UTC)
Message-ID: <0cebba14c64e1c6c35ccdfdf8f86e5d203626e6f.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 12:19:17 +0300
In-Reply-To: <20190723071342.383909-1-sgarzare@redhat.com>
References: <20190723071342.383909-1-sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 09:19:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v3] block/rbd: add
 preallocation support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-07-23 at 09:13 +0200, Stefano Garzarella wrote:
> This patch adds the support of preallocation (off/full) for the RBD
> block driver.
> If rbd_writesame() is available and supports zeroed buffers, we use
> it to quickly fill the image when full preallocation is required.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v3:
>  - rebased on master
>  - filled with zeroed buffer [Max]
>  - used rbd_writesame() only when we can disable the discard of zeroed
>    buffers
>  - added 'since: 4.2' in qapi/block-core.json [Max]
>  - used buffer as large as the "stripe unit"
> ---
>  block/rbd.c          | 202 ++++++++++++++++++++++++++++++++++++++++---
>  qapi/block-core.json |   5 +-
>  2 files changed, 192 insertions(+), 15 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index 59757b3120..d923a5a26c 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -64,6 +64,7 @@
>  #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
>  
>  #define RBD_MAX_SNAPS 100
> +#define RBD_DEFAULT_CONCURRENT_OPS 10
>  
>  /* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
>  #ifdef LIBRBD_SUPPORTS_IOVEC
> @@ -104,6 +105,7 @@ typedef struct BDRVRBDState {
>      char *image_name;
>      char *snap;
>      uint64_t image_size;
> +    bool ws_zero_supported; /* rbd_writesame() supports zeroed buffers */
>  } BDRVRBDState;
>  
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> @@ -333,6 +335,155 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>      }
>  }
>  
> +static int qemu_rbd_get_max_concurrent_ops(rados_t cluster)
> +{
> +    char buf[16];
> +    int ret, max_concurrent_ops;
> +
> +    ret = rados_conf_get(cluster, "rbd_concurrent_management_ops", buf,
> +                         sizeof(buf));
> +    if (ret < 0) {
> +        return RBD_DEFAULT_CONCURRENT_OPS;
> +    }
> +
> +    ret = qemu_strtoi(buf, NULL, 10, &max_concurrent_ops);
> +    if (ret < 0) {
> +        return RBD_DEFAULT_CONCURRENT_OPS;
> +    }
> +
> +    return max_concurrent_ops;
> +}
> +
> +static int qemu_rbd_do_truncate(rados_t cluster, rbd_image_t image,
> +                                int64_t offset, PreallocMode prealloc,
> +                                bool ws_zero_supported, Error **errp)
> +{
> +    uint64_t current_length;
> +    char *buf = NULL;
> +    int ret;
> +
> +    ret = rbd_get_size(image, &current_length);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Failed to get file length");
> +        goto out;
> +    }
> +
> +    if (current_length > offset && prealloc != PREALLOC_MODE_OFF) {
> +        error_setg(errp, "Cannot use preallocation for shrinking files");
> +        ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    switch (prealloc) {
> +    case PREALLOC_MODE_FULL: {
> +        uint64_t buf_size, current_offset = current_length;
> +        ssize_t bytes;
> +
> +        ret = rbd_get_stripe_unit(image, &buf_size);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Failed to get stripe unit");
> +            goto out;
> +        }
> +
> +        ret = rbd_resize(image, offset);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Failed to resize file");
> +            goto out;
> +        }
> +
> +        buf = g_malloc0(buf_size);
> +
> +#ifdef LIBRBD_SUPPORTS_WRITESAME
> +        if (ws_zero_supported) {
> +            uint64_t writesame_max_size;
> +            int max_concurrent_ops;
> +
> +            max_concurrent_ops = qemu_rbd_get_max_concurrent_ops(cluster);
> +            /*
> +             * We limit the rbd_writesame() size to avoid to spawn more then
> +             * 'rbd_concurrent_management_ops' concurrent operations.
> +             */
> +            writesame_max_size = MIN(buf_size * max_concurrent_ops, INT_MAX);
> +
> +            while (offset - current_offset > buf_size) {
> +                bytes = MIN(offset - current_offset, writesame_max_size);
> +                /*
> +                 * rbd_writesame() supports only request where the size of the
> +                 * operation is multiple of buffer size.
> +                 */
> +                bytes -= bytes % buf_size;
> +
> +                bytes = rbd_writesame(image, current_offset, bytes, buf,
> +                                      buf_size, 0);
> +                if (bytes < 0) {
> +                    ret = bytes;
> +                    error_setg_errno(errp, -ret,
> +                                     "Failed to write for preallocation");
> +                    goto out;
> +                }
> +
> +                current_offset += bytes;
> +            }
> +        }
> +#endif /* LIBRBD_SUPPORTS_WRITESAME */
> +
> +        while (current_offset < offset) {
> +            bytes = rbd_write(image, current_offset,
> +                              MIN(offset - current_offset, buf_size), buf);
> +            if (bytes < 0) {
> +                ret = bytes;
> +                error_setg_errno(errp, -ret,
> +                                 "Failed to write for preallocation");
> +                goto out;
> +            }
> +
> +            current_offset += bytes;
> +        }
> +
> +        ret = rbd_flush(image);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Failed to flush the file");
> +            goto out;
> +        }
> +
> +        break;
> +    }
> +    case PREALLOC_MODE_OFF:
> +        ret = rbd_resize(image, offset);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "Failed to resize file");
> +            goto out;
> +        }
> +        break;
> +    default:
> +        error_setg(errp, "Unsupported preallocation mode: %s",
> +                   PreallocMode_str(prealloc));
> +        ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    ret = 0;
> +
> +out:
> +    g_free(buf);
> +    return ret;
> +}
> +
> +static bool qemu_rbd_writesame_zero_supported(rados_t *cluster)
> +{
> +    int ret = 1;
> +
> +#ifdef LIBRBD_SUPPORTS_WRITESAME
> +    /*
> +     * When "rbd_discard_on_zeroed_write_same" is not available, rbd_writesame()
> +     * can discard requests with zeroed buffer.
> +     */
> +    ret = rados_conf_set(*cluster, "rbd_discard_on_zeroed_write_same", "false");
> +#endif
> +
> +    return ret == 0;
> +}
> +
>  static QemuOptsList runtime_opts = {
>      .name = "rbd",
>      .head = QTAILQ_HEAD_INITIALIZER(runtime_opts.head),
> @@ -378,6 +529,7 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>      BlockdevCreateOptionsRbd *opts = &options->u.rbd;
>      rados_t cluster;
>      rados_ioctx_t io_ctx;
> +    rbd_image_t image;
>      int obj_order = 0;
>      int ret;
>  
> @@ -406,13 +558,23 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          return ret;
>      }
>  
> -    ret = rbd_create(io_ctx, opts->location->image, opts->size, &obj_order);
> +    ret = rbd_create(io_ctx, opts->location->image, 0, &obj_order);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "error rbd create");
>          goto out;
>      }
>  
> -    ret = 0;
> +    ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "error rbd open");
> +        goto out;
> +    }
> +
> +    ret = qemu_rbd_do_truncate(cluster, image, opts->size, opts->preallocation,
> +                               qemu_rbd_writesame_zero_supported(&cluster),
> +                               errp);
> +
> +    rbd_close(image);
>  out:
>      rados_ioctx_destroy(io_ctx);
>      rados_shutdown(cluster);
> @@ -433,6 +595,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(const char *filename,
>      BlockdevOptionsRbd *loc;
>      Error *local_err = NULL;
>      const char *keypairs, *password_secret;
> +    char *prealloc;
>      QDict *options = NULL;
>      int ret = 0;
>  
> @@ -451,6 +614,16 @@ static int coroutine_fn qemu_rbd_co_create_opts(const char *filename,
>                                                     BLOCK_OPT_CLUSTER_SIZE, 0);
>      rbd_opts->has_cluster_size = (rbd_opts->cluster_size != 0);
>  
> +    prealloc = qemu_opt_get_del(opts, BLOCK_OPT_PREALLOC);
> +    rbd_opts->preallocation = qapi_enum_parse(&PreallocMode_lookup, prealloc,
> +                                              PREALLOC_MODE_OFF, &local_err);
> +    g_free(prealloc);
> +    if (local_err) {
> +        ret = -EINVAL;
> +        error_propagate(errp, local_err);
> +        goto exit;
> +    }
> +
>      options = qdict_new();
>      qemu_rbd_parse_filename(filename, options, &local_err);
>      if (local_err) {
> @@ -770,6 +943,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>  
>      s->snap = g_strdup(opts->snapshot);
>      s->image_name = g_strdup(opts->image);
> +    s->ws_zero_supported = qemu_rbd_writesame_zero_supported(&s->cluster);
>  
>      /* rbd_open is always r/w */
>      r = rbd_open(s->io_ctx, s->image_name, &s->image, s->snap);
> @@ -1089,21 +1263,16 @@ static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
>                                               PreallocMode prealloc,
>                                               Error **errp)
>  {
> -    int r;
> -
> -    if (prealloc != PREALLOC_MODE_OFF) {
> -        error_setg(errp, "Unsupported preallocation mode '%s'",
> -                   PreallocMode_str(prealloc));
> -        return -ENOTSUP;
> -    }
> +    BDRVRBDState *s = bs->opaque;
> +    int ret;
>  
> -    r = qemu_rbd_resize(bs, offset);
> -    if (r < 0) {
> -        error_setg_errno(errp, -r, "Failed to resize file");
> -        return r;
> +    ret = qemu_rbd_do_truncate(s->cluster, s->image, offset, prealloc,
> +                               s->ws_zero_supported, errp);
> +    if (ret == 0) {
> +        s->image_size = offset;
>      }
>  
> -    return 0;
> +    return ret;
>  }
>  
>  static int qemu_rbd_snap_create(BlockDriverState *bs,
> @@ -1256,6 +1425,11 @@ static QemuOptsList qemu_rbd_create_opts = {
>              .type = QEMU_OPT_SIZE,
>              .help = "RBD object size"
>          },
> +        {
> +            .name = BLOCK_OPT_PREALLOC,
> +            .type = QEMU_OPT_STRING,
> +            .help = "Preallocation mode (allowed values: off, full)"
> +        },
>          {
>              .name = "password-secret",
>              .type = QEMU_OPT_STRING,
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 0d43d4f37c..ff55171f8d 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4346,13 +4346,16 @@
>  #                   point to a snapshot.
>  # @size             Size of the virtual disk in bytes
>  # @cluster-size     RBD object size
> +# @preallocation    Preallocation mode for the new image (since: 4.2)
> +#                   (default: off; allowed values: off, full)
>  #
>  # Since: 2.12
>  ##
>  { 'struct': 'BlockdevCreateOptionsRbd',
>    'data': { 'location':         'BlockdevOptionsRbd',
>              'size':             'size',
> -            '*cluster-size' :   'size' } }
> +            '*cluster-size' :   'size',
> +            '*preallocation':   'PreallocMode' } }
>  
>  ##
>  # @BlockdevVmdkSubformat:

I think I don't see anything obviously wrong, but note that I don't know ceph yet,
thus I might have missed something.

So:
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



