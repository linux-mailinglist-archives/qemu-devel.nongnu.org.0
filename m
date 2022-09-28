Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF15ED794
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:21:53 +0200 (CEST)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSKG-0003G1-NY
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odR1f-0006vD-JK
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odR1b-0005Y0-Rm
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664348310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJKn2XAnnFs3oFqtPMnrOuCS7ATHUzIPfaufqcrNcPI=;
 b=QCzBHgWTIi6iPg2hz7n3ZdyFsvc9r1gqmGjQZgSypuREaAUopNtuVO03JGWpvXeaGc0EWf
 i0N45BZcRAameUUWl8o/xdntxbuYqRXgHNilCA6Ib1YF6+DFOONQh8i3m7mtxQrOLLEkHb
 /BhZ0SCCMP7WYKUS6tetMKrTd5+X/gg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-plJVniv7MqS2Zuk_1HYdrQ-1; Wed, 28 Sep 2022 02:58:28 -0400
X-MC-Unique: plJVniv7MqS2Zuk_1HYdrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8903F101A52A;
 Wed, 28 Sep 2022 06:58:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 132E4492B04;
 Wed, 28 Sep 2022 06:58:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF81A21E691D; Wed, 28 Sep 2022 08:58:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4] block: Refactor get_tmp_filename()
References: <20220927130224.1982931-1-bmeng.cn@gmail.com>
Date: Wed, 28 Sep 2022 08:58:25 +0200
In-Reply-To: <20220927130224.1982931-1-bmeng.cn@gmail.com> (Bin Meng's message
 of "Tue, 27 Sep 2022 21:02:23 +0800")
Message-ID: <87k05o0yum.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present there are two callers of get_tmp_filename() and they are
> inconsistent.
>
> One does:
>
>     /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>     char *tmp_filename = g_malloc0(PATH_MAX + 1);
>     ...
>     ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
>
> while the other does:
>
>     s->qcow_filename = g_malloc(PATH_MAX);
>     ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
>
> As we can see different 'size' arguments are passed. There are also
> platform specific implementations inside the function, and this use

Suggest "the use".

> of snprintf is really undesirable.
>
> The function name is also misleading. It creates a temporary file,
> not just a filename.
>
> Refactor this routine by changing its name and signature to:
>
>     char *create_tmp_file(Error **errp)
>
> and use g_file_open_tmp() for a consistent implementation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v4:
> - Rename the function to create_tmp_file() and take "Error **errp" as
>   a parameter, so that callers can pass errp all the way down to this
>   routine.
> - Commit message updated to reflect the latest change
>
> Changes in v3:
> - Do not use errno directly, instead still let get_tmp_filename() return
>   a negative number to indicate error
>
> Changes in v2:
> - Use g_autofree and g_steal_pointer
>
>  include/block/block_int-common.h |  2 +-
>  block.c                          | 47 ++++++++++++--------------------
>  block/vvfat.c                    |  7 ++---
>  3 files changed, 21 insertions(+), 35 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 8947abab76..d7c0a7e96f 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
>  }
>  
>  int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
> -int get_tmp_filename(char *filename, int size);
> +char *create_tmp_file(Error **errp);
>  void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
>                                        QDict *options);
>  
> diff --git a/block.c b/block.c
> index bc85f46eed..b33bd774ae 100644
> --- a/block.c
> +++ b/block.c
> @@ -860,38 +860,27 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
>  
>  /*
>   * Create a uniquely-named empty temporary file.
> - * Return 0 upon success, otherwise a negative errno value.
> + * Return the actual file name used upon success, otherwise NULL.
> + * This string should be freed with g_free() when not needed any longer.
>   */

Suggest to add:

    * Note: creating a temporary file for the caller to (re)open is
    * inherently racy.  Use g_file_open_tmp() instead whenever
    * practical.

> -int get_tmp_filename(char *filename, int size)
> +char *create_tmp_file(Error **errp)
>  {
> -#ifdef _WIN32
> -    char temp_dir[MAX_PATH];
> -    /* GetTempFileName requires that its output buffer (4th param)
> -       have length MAX_PATH or greater.  */
> -    assert(size >= MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> -#else
> +    g_autofree char *name = NULL;
> +    g_autoptr(GError) err = NULL;
>      int fd;
> -    const char *tmpdir;
> -    tmpdir = getenv("TMPDIR");
> -    if (!tmpdir) {
> -        tmpdir = "/var/tmp";
> -    }
> -    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
> -        return -EOVERFLOW;
> -    }
> -    fd = mkstemp(filename);
> +
> +    fd = g_file_open_tmp("vl.XXXXXX", &name, &err);
>      if (fd < 0) {
> -        return -errno;
> +        error_setg_errno(errp, -ENOENT, "%s", err->message);

The actual error need not be ENOENT, and when it isn't, the resulting
error message is misleading.  Instead:

           error_setg(errp, "%s", err->message);

> +        return NULL;
>      }
>      if (close(fd) != 0) {
> -        unlink(filename);
> -        return -errno;
> +        unlink(name);
> +        error_setg_errno(errp, -errno, "Could not close the temporary file");

Yes, but which file?

Error message quality hardly matters, though, since errors are
vanishingly unlikely here.

Moreover, failing the function on this error is questionable.  The
temporary file has been created and is ready for use.  Even the file
descriptor is almost certainly closed; see close(2) under "Dealing with
error returns from close()".  Even a warning seems of doubtful value.  I
think we should simply ignore close() failure here.  Separate patch, I
guess.

> +        return NULL;
>      }
> -    return 0;
> -#endif
> +
> +    return g_steal_pointer(&name);
>  }
>  
>  /*
> @@ -3717,8 +3706,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>                                                     QDict *snapshot_options,
>                                                     Error **errp)
>  {
> -    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
> -    char *tmp_filename = g_malloc0(PATH_MAX + 1);
> +    char *tmp_filename = NULL;

Could switch to g_autofree while there.

>      int64_t total_size;
>      QemuOpts *opts = NULL;
>      BlockDriverState *bs_snapshot = NULL;
> @@ -3737,9 +3725,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
>      }
>  
>      /* Create the temporary image */
> -    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "Could not get temporary filename");
> +    tmp_filename = create_tmp_file(errp);
> +    if (!tmp_filename) {
>          goto out;
>      }
>  
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683..f9bf8406d3 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3146,10 +3146,9 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
>  
>      array_init(&(s->commits), sizeof(commit_t));
>  
> -    s->qcow_filename = g_malloc(PATH_MAX);
> -    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "can't create temporary file");
> +    s->qcow_filename = create_tmp_file(errp);
> +    if (!s->qcow_filename) {
> +        ret = -ENOENT;

I believe this error code will be misleading more often than not.  Can't
see an easy way to do better as long as GLib swallows errno.  Which it
really, really should not, but I digress.

>          goto err;
>      }


