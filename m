Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9EF37AF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:24:48 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXzr-0005Ab-8X
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgXyM-0003jD-BA
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgXyF-0005hH-Qw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620760985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kawnmsBra1VnVJVAGgMTjMc0p5VvtPSU5p5ZbPnIN1c=;
 b=dNyZYazy6YqVBOpvET5LUZ36ttuCKoD70e+scOL2L2OfBr7/AGucwvoakdWgiv/b8a2it1
 pbuOKciE93yOeCll+NtUOnUd4GSgHh3fbKRtzRIjGe2+8qnjruL5wPQCgOVjN58bl5QYmm
 0FNuASyTHD42475DXyQI7FrGzbL5/HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-zvC0RMyXOQaB5dwQ4uqO4w-1; Tue, 11 May 2021 15:23:02 -0400
X-MC-Unique: zvC0RMyXOQaB5dwQ4uqO4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEAAF107ACC7;
 Tue, 11 May 2021 19:22:59 +0000 (UTC)
Received: from [10.3.114.221] (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E6982B431;
 Tue, 11 May 2021 19:22:50 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-4-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v4 03/11] block: use int64_t instead of uint64_t in driver
 read handlers
Message-ID: <6d6b0719-4a43-7d2a-153f-cd19dfaa00e5@redhat.com>
Date: Tue, 11 May 2021 14:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210324205132.464899-4-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, pavel.dovgaluk@ispras.ru, sw@weilnetz.de, pl@kamp.de,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 ronniesahlberg@gmail.com, pbonzini@redhat.com, namei.unix@gmail.com,
 dillaman@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to convert .bdrv_co_preadv_part and .bdrv_co_pwritev_part
> to int64_t type for offset and bytes parameters (as it's already done
> for generic block/io.c layer).
> 
> In qcow2 .bdrv_co_preadv_part is used in some places, so let's add
> corresponding checks and assertions.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Unusual line, especially since...

> 
> block: use int64_t instead of uint64_t in driver read handlers
> 
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver read handlers parameters which are already 64bit to
> signed type.
> 
> While being here, convert also flags parameter to be BdrvRequestFlags.
> 
> Now let's consider all callers. Simple
> 
>   git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'
> 
> shows that's there three callers of driver function:
> 
>  bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
>    bdrv_check_qiov_request() to be non-negative.
> 
>  qcow2_load_vmstate() does bdrv_check_qiov_request().
> 
>  do_perform_cow_read() has uint64_t argument. And a lot of things in
>  qcow2 driver are uint64_t, so converting it is big job. But we must
>  not work with requests that doesn't satisfy bdrv_check_qiov_request(),

s/doesn't/don't/

>  so let's just assert it here.
> 
> Still, the functions may be called directly, not only by drv->...
> Let's check:
> 
> git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
> while read func; do git grep "$func(" | \
> grep -v "$func(BlockDriverState"; done
> 
> The only one such caller:
> 
>     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
>     ...
>     ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
> 
> in tesTS/unit/test-bdrv-drain.c, and it's OK obviously.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

...it is repeated here. I'm fine dropping the first.

> ---
>  include/block/block_int.h        | 11 ++++++-----
>  block/backup-top.c               |  4 ++--

>  35 files changed, 120 insertions(+), 89 deletions(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index db7a909ea9..e6bcf74e46 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -234,8 +234,8 @@ struct BlockDriver {
>  
>      /* aio */
>      BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
> -        BlockCompletionFunc *cb, void *opaque);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
> +        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
>      BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
>          uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
>          BlockCompletionFunc *cb, void *opaque);
> @@ -264,10 +264,11 @@ struct BlockDriver {
>       * The buffer in @qiov may point directly to guest memory.
>       */
>      int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
> +        BdrvRequestFlags flags);
>      int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes,
> -        QEMUIOVector *qiov, size_t qiov_offset, int flags);
> +        int64_t offset, int64_t bytes,
> +        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);

Lots of fallout, but I'm in favor of this signature change.


> +++ b/block/blkdebug.c
> @@ -614,8 +614,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>  }
>  
>  static int coroutine_fn
> -blkdebug_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                   QEMUIOVector *qiov, int flags)
> +blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                   QEMUIOVector *qiov, BdrvRequestFlags flags)
>  {
>      int err;

Still calls rule_check() with uint64_t parameters, but since we've
asserted the caller was within range, no behavior change.

> +++ b/block/blkverify.c
> @@ -221,8 +221,8 @@ blkverify_co_prwv(BlockDriverState *bs, BlkverifyRequest *r, uint64_t offset,
>  }
>  
>  static int coroutine_fn
> -blkverify_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                    QEMUIOVector *qiov, int flags)
> +blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                    QEMUIOVector *qiov, BdrvRequestFlags flags)
>  {

Similarly for the call to blkverify_co_prwv(), and probably elsewhere in
the patch.

> +++ b/block/crypto.c
> @@ -397,8 +397,8 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
>  #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)
>  
>  static coroutine_fn int
> -block_crypto_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
> -                       QEMUIOVector *qiov, int flags)
> +block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                       QEMUIOVector *qiov, BdrvRequestFlags flags)
>  {
>      BlockCrypto *crypto = bs->opaque;
>      uint64_t cur_bytes; /* number of bytes in current iteration */

We could perhaps change the type of local variables like cur_bytes and
bytes_done; but it doesn't affect semantics.

> +++ b/block/curl.c
> @@ -896,7 +896,8 @@ out:
>  }
>  
>  static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
> +        BdrvRequestFlags flags)
>  {
>      CURLAIOCB acb = {
>          .co = qemu_coroutine_self(),

Likewise changing the type of CURLAIOCB.offset and .bytes.  Cleanups
like that can be followups.

> +++ b/block/file-posix.c
> @@ -2033,9 +2033,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>  }
>  
> -static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
> -                                      uint64_t bytes, QEMUIOVector *qiov,
> -                                      int flags)
> +static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
> +                                      int64_t bytes, QEMUIOVector *qiov,
> +                                      BdrvRequestFlags flags)
>  {
>      return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);

Similarly for fixing the signature of raw_co_prw() (after the
counterpart change to raw_co_pwritev)

> +++ b/block/nvme.c
> @@ -1221,8 +1221,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>  }
>  
>  static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
> -                                       uint64_t offset, uint64_t bytes,
> -                                       QEMUIOVector *qiov, int flags)
> +                                       int64_t offset, int64_t bytes,
> +                                       QEMUIOVector *qiov,
> +                                       BdrvRequestFlags flags)
>  {
>      return nvme_co_prw(bs, offset, bytes, qiov, false, flags);
>  }

And for nvme_co_prw().

> +++ b/block/qcow2.c
> @@ -2281,9 +2281,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
>  }
>  
>  static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
> -                                             uint64_t offset, uint64_t bytes,
> +                                             int64_t offset, int64_t bytes,
>                                               QEMUIOVector *qiov,
> -                                             size_t qiov_offset, int flags)
> +                                             size_t qiov_offset,
> +                                             BdrvRequestFlags flags)
>  {
>      BDRVQcow2State *s = bs->opaque;
>      int ret = 0;

Unrelated to this patch; the loop sets cur_bytes = MIN(bytes, INT_MAX);
but it would be smarter to choose a cluster-aligned max instead of
INT_MAX.  It doesn't matter as long as the block layer has pre-clamped
requests to be < 32 bit to begin with, and then our later call to
qcow2_get_host_offset() further clamps it down to actual cluster
boundaries.  But it does look odd, compared to computing the original
MIN() to an aligned boundary in the first place, whether or not we ever
change the block layer to allow individual drivers to opt in to reading
more than 2G in one transaction.

qcow2_add_task() is another internal function worth improving in a followup.

> +++ b/block/quorum.c
> @@ -663,8 +663,8 @@ static int read_fifo_child(QuorumAIOCB *acb)
>      return ret;
>  }
>  
> -static int quorum_co_preadv(BlockDriverState *bs, uint64_t offset,
> -                            uint64_t bytes, QEMUIOVector *qiov, int flags)
> +static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
> +                            QEMUIOVector *qiov, BdrvRequestFlags flags)
>  {
>      BDRVQuorumState *s = bs->opaque;
>      QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);

and quorum_aio_get().

> diff --git a/block/raw-format.c b/block/raw-format.c
> index 7717578ed6..e3f459b2cb 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -181,8 +181,8 @@ static void raw_reopen_abort(BDRVReopenState *state)
>  }
>  
>  /* Check and adjust the offset, against 'offset' and 'size' options. */
> -static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
> -                                    uint64_t bytes, bool is_write)
> +static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
> +                                    int64_t bytes, bool is_write)
>  {
>      BDRVRawState *s = bs->opaque;
>  
> @@ -201,9 +201,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
>      return 0;
>  }
>  
> -static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
> -                                      uint64_t bytes, QEMUIOVector *qiov,
> -                                      int flags)
> +static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
> +                                      int64_t bytes, QEMUIOVector *qiov,
> +                                      BdrvRequestFlags flags)
>  {
>      int ret;
>  
> @@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
>          qiov = &local_qiov;
>      }
>  
> -    ret = raw_adjust_offset(bs, &offset, bytes, true);
> +    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);

Ugly type-punning; thankfully it's transient until the counterpart patch
to driver write handlers.

>      if (ret) {
>          goto fail;
>      }
> @@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
>  {
>      int ret;
>  
> -    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
> +    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);

And now you should lose this cast...

>      if (ret) {
>          return ret;
>      }
> @@ -306,7 +306,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
>  {
>      int ret;
>  
> -    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
> +    ret = raw_adjust_offset(bs, &offset, bytes, true);

...like you did here.

>      if (ret) {
>          return ret;
>      }
> @@ -541,7 +541,7 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
>  {
>      int ret;
>  
> -    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
> +    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
>      if (ret) {
>          return ret;
>      }
> @@ -560,7 +560,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
>  {
>      int ret;
>  
> -    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
> +    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);

Also transient casts.

Easy enough to fix my nits for qcow2 and the commit message.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


