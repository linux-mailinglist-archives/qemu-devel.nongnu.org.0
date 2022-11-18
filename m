Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A809162FDD4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 20:16:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow6pu-0007xn-6r; Fri, 18 Nov 2022 14:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6pd-0007ua-0u
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ow6pb-0007wp-2W
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668798917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JcD7g7WFsQ9LoD0UBCuMVgVYHnQjOt30NyHoEXSI+io=;
 b=DFUp/xZllIRkUbGG5AsMspuIcWpC21LTwcaJrBMPdzVlOGl/aWzYhuyok5r/6lZd8UsZzO
 oAhHgwBeeOt/fasgr3jPhlRmypimY9ILBY6WOarHC4c98JNU1oXfAvooR0JV3TMOiHSeO/
 m3Munq6n4/OkuvshPkCNiqKGgY2i788=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-tsyPjV9VNd2hMTfIOezcaA-1; Fri, 18 Nov 2022 14:15:16 -0500
X-MC-Unique: tsyPjV9VNd2hMTfIOezcaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC049811E75;
 Fri, 18 Nov 2022 19:15:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9042840C6EC3;
 Fri, 18 Nov 2022 19:15:14 +0000 (UTC)
Date: Fri, 18 Nov 2022 20:15:11 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/11] block-backend: replace bdrv_*_above with
 blk_*_above
Message-ID: <Y3fZv4yWHaHaM/As@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> Avoid mixing bdrv_* functions with blk_*, so create blk_* counterparts
> for:
> - bdrv_block_status_above
> - bdrv_is_allocated_above
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/block-backend.c             | 21 +++++++++++++++++++++
>  block/commit.c                    |  4 ++--
>  include/sysemu/block-backend-io.h |  9 +++++++++
>  nbd/server.c                      | 28 ++++++++++++++--------------
>  qemu-img.c                        |  4 ++--
>  5 files changed, 48 insertions(+), 18 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 742efa7955..333d50fb3f 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1424,6 +1424,27 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
>      return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
>  }
>  
> +int coroutine_fn blk_block_status_above(BlockBackend *blk,

Let's call it blk_co_block_status_above() to stay consistent with other
functions.

> +                                        BlockDriverState *base,
> +                                        int64_t offset, int64_t bytes,
> +                                        int64_t *pnum, int64_t *map,
> +                                        BlockDriverState **file)
> +{
> +    IO_CODE();
> +    return bdrv_block_status_above(blk_bs(blk), base, offset, bytes, pnum, map,
> +                                   file);

coroutine_fn calling into a g_c_w. As mentioned in the first patch, we
really want a bdrv_co_block_status_above() than can be called without
the g_c_w wrapper.

> +}
> +
> +int coroutine_fn blk_is_allocated_above(BlockBackend *blk,

blk_co_is_allocated_above()

> +                                        BlockDriverState *base,
> +                                        bool include_base, int64_t offset,
> +                                        int64_t bytes, int64_t *pnum)
> +{
> +    IO_CODE();
> +    return bdrv_is_allocated_above(blk_bs(blk), base, include_base, offset,
> +                                   bytes, pnum);

Again a g_c_w.

> +}
> +
>  typedef struct BlkRwCo {
>      BlockBackend *blk;
>      int64_t offset;
> diff --git a/block/commit.c b/block/commit.c
> index 0029b31944..9d4d908344 100644
> --- a/block/commit.c
> +++ b/block/commit.c
> @@ -155,8 +155,8 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
>              break;
>          }
>          /* Copy if allocated above the base */
> -        ret = bdrv_is_allocated_above(blk_bs(s->top), s->base_overlay, true,
> -                                      offset, COMMIT_BUFFER_SIZE, &n);
> +        ret = blk_is_allocated_above(s->top, s->base_overlay, true,
> +                                     offset, COMMIT_BUFFER_SIZE, &n);
>          copy = (ret > 0);
>          trace_commit_one_iteration(s, offset, n, ret);
>          if (copy) {
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 50f5aa2e07..a47cb825e5 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -92,6 +92,15 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
>                                     int64_t bytes, BdrvRequestFlags read_flags,
>                                     BdrvRequestFlags write_flags);
>  
> +int coroutine_fn blk_block_status_above(BlockBackend *blk,
> +                                        BlockDriverState *base,
> +                                        int64_t offset, int64_t bytes,
> +                                        int64_t *pnum, int64_t *map,
> +                                        BlockDriverState **file);
> +int coroutine_fn blk_is_allocated_above(BlockBackend *blk,
> +                                        BlockDriverState *base,
> +                                        bool include_base, int64_t offset,
> +                                        int64_t bytes, int64_t *pnum);
>  
>  /*
>   * "I/O or GS" API functions. These functions can run without
> diff --git a/nbd/server.c b/nbd/server.c
> index e2eec0cf46..6389b46396 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1991,7 +1991,7 @@ static int coroutine_fn nbd_co_send_structured_error(NBDClient *client,
>  }
>  
>  /* Do a sparse read and send the structured reply to the client.
> - * Returns -errno if sending fails. bdrv_block_status_above() failure is
> + * Returns -errno if sending fails. blk_block_status_above() failure is
>   * reported to the client, at which point this function succeeds.
>   */
>  static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
> @@ -2007,10 +2007,10 @@ static int coroutine_fn nbd_co_send_sparse_read(NBDClient *client,
>  
>      while (progress < size) {
>          int64_t pnum;
> -        int status = bdrv_block_status_above(blk_bs(exp->common.blk), NULL,
> -                                             offset + progress,
> -                                             size - progress, &pnum, NULL,
> -                                             NULL);
> +        int status = blk_block_status_above(exp->common.blk, NULL,
> +                                            offset + progress,
> +                                            size - progress, &pnum, NULL,
> +                                            NULL);
>          bool final;
>  
>          if (status < 0) {
> @@ -2141,14 +2141,14 @@ static int nbd_extent_array_add(NBDExtentArray *ea,
>      return 0;
>  }
>  
> -static int coroutine_fn blockstatus_to_extents(BlockDriverState *bs,
> +static int coroutine_fn blockstatus_to_extents(BlockBackend *blk,
>                                                 uint64_t offset, uint64_t bytes,
>                                                 NBDExtentArray *ea)
>  {
>      while (bytes) {
>          uint32_t flags;
>          int64_t num;
> -        int ret = bdrv_block_status_above(bs, NULL, offset, bytes, &num,
> +        int ret = blk_block_status_above(blk, NULL, offset, bytes, &num,
>                                            NULL, NULL);

Indentation is off now.

>  
>          if (ret < 0) {
> @@ -2169,13 +2169,13 @@ static int coroutine_fn blockstatus_to_extents(BlockDriverState *bs,
>      return 0;
>  }
>  
> -static int coroutine_fn blockalloc_to_extents(BlockDriverState *bs,
> +static int coroutine_fn blockalloc_to_extents(BlockBackend *blk,
>                                                uint64_t offset, uint64_t bytes,
>                                                NBDExtentArray *ea)
>  {
>      while (bytes) {
>          int64_t num;
> -        int ret = bdrv_is_allocated_above(bs, NULL, false, offset, bytes,
> +        int ret = blk_is_allocated_above(blk, NULL, false, offset, bytes,
>                                            &num);

Here, too.

>          if (ret < 0) {
> @@ -2224,7 +2224,7 @@ static int nbd_co_send_extents(NBDClient *client, uint64_t handle,
>  /* Get block status from the exported device and send it to the client */
>  static int
>  coroutine_fn nbd_co_send_block_status(NBDClient *client, uint64_t handle,
> -                                      BlockDriverState *bs, uint64_t offset,
> +                                      BlockBackend *blk, uint64_t offset,
>                                        uint32_t length, bool dont_fragment,
>                                        bool last, uint32_t context_id,
>                                        Error **errp)
> @@ -2234,9 +2234,9 @@ coroutine_fn nbd_co_send_block_status(NBDClient *client, uint64_t handle,
>      g_autoptr(NBDExtentArray) ea = nbd_extent_array_new(nb_extents);
>  
>      if (context_id == NBD_META_ID_BASE_ALLOCATION) {
> -        ret = blockstatus_to_extents(bs, offset, length, ea);
> +        ret = blockstatus_to_extents(blk, offset, length, ea);
>      } else {
> -        ret = blockalloc_to_extents(bs, offset, length, ea);
> +        ret = blockalloc_to_extents(blk, offset, length, ea);
>      }
>      if (ret < 0) {
>          return nbd_co_send_structured_error(
> @@ -2563,7 +2563,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
>  
>              if (client->export_meta.base_allocation) {
>                  ret = nbd_co_send_block_status(client, request->handle,
> -                                               blk_bs(exp->common.blk),
> +                                               exp->common.blk,
>                                                 request->from,
>                                                 request->len, dont_fragment,
>                                                 !--contexts_remaining,
> @@ -2576,7 +2576,7 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
>  
>              if (client->export_meta.allocation_depth) {
>                  ret = nbd_co_send_block_status(client, request->handle,
> -                                               blk_bs(exp->common.blk),
> +                                               exp->common.blk,
>                                                 request->from, request->len,
>                                                 dont_fragment,
>                                                 !--contexts_remaining,
> diff --git a/qemu-img.c b/qemu-img.c
> index a3b64c88af..4282a34bc0 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1730,8 +1730,8 @@ static int convert_iteration_sectors(ImgConvertState *s, int64_t sector_num)
>          do {
>              count = n * BDRV_SECTOR_SIZE;
>  
> -            ret = bdrv_block_status_above(src_bs, base, offset, count, &count,
> -                                          NULL, NULL);
> +            ret = bdrv_block_status_above(src_bs, base, offset, count,
> +                                          &count, NULL, NULL);

This one looks odd. Did you intend to change more than the line wrapping
here?

Kevin


