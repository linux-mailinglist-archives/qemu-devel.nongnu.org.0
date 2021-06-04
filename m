Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01339C109
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:10:51 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpG9Z-0004ep-SU
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpG8k-0003pq-Ez
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpG8g-0003e7-7V
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622837392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d6xR/sBCAaJIInDwu3vNNh72oXkz4hJFFNkjS5Z++6w=;
 b=AB21EbtrIRm0PecV+3YPWtE4ej8CdegMlelV9m4GJMVYJs2b+Q18UxSZ3mMS8okhhCmHbW
 vef3Srg+bZC8Rolm38BqlhjTMCi/hJliuId8wjHzIkd4g7QlXwGGLnocri/KYP/mvVv9R+
 IEqH8wdoV3Ygag3VeMix/oRMo/GXhLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-DhIB3FJAPcewvRQPrnuH0w-1; Fri, 04 Jun 2021 16:09:49 -0400
X-MC-Unique: DhIB3FJAPcewvRQPrnuH0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67C5B1009446;
 Fri,  4 Jun 2021 20:09:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A658110016FC;
 Fri,  4 Jun 2021 20:09:41 +0000 (UTC)
Date: Fri, 4 Jun 2021 15:09:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v5 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
Message-ID: <20210604200939.2wcnh2spynqlbepb@redhat.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
 <20210505075001.45041-8-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505075001.45041-8-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>,
 "open list:GLUSTER" <integration@gluster.org>,
 Alberto Garcia <berto@igalia.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 qemu-block@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 10:49:57AM +0300, Vladimir Sementsov-Ogievskiy wrote:
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
> So, convert driver write_zeroes handlers bytes parameter to int64_t.
> 
> The only caller of all updated function is bdrv_co_do_pwrite_zeroes().
> 
> bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
> callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
> max_write_zeroes is limited to INT_MAX. So, updated functions all are
> safe, the will not get "bytes" larger than before.

they

> 
> Still, let's look through all updated functions, and add assertions to
> the ones which are actually unprepared to values larger than INT_MAX.
> For these drivers also set explicit max_pwrite_zeroes limit.
> 
> Let's go:
> 
> backup-top: Calls backup_top_cbw() and bdrv_co_pwrite_zeroes, both
>   have 64bit argument.

backup_top_cbw has uint64_t argument (at least on current qemu.git; I
didn't spot if it was changed in the meantime earlier in this series
or if I'm missing review of a prerequisite), but we're safe since the
block layer does not pass in negative values.

> 
> blkdebug: calculations can't overflow, thanks to
>   bdrv_check_qiov_request() in generic layer. rule_check() and
>   bdrv_co_pwrite_zeroes() both have 64bit argument.

rule_check() is another function currently using uint64_t.

> 
> blklogwrites: pass to blk_log_writes_co_log() with 64bit argument.

That, and struct BlkLogWritesFileReq, still use uint64_t.

> 
> blkreply, copy-on-read, filter-compress: pass to bdrv_co_pwrite_zeroes() which is OK

blkreplay

> 
> file-posix: both handler calls raw_do_pwrite_zeroes, which is updated.
>   In raw_do_pwrite_zeroes() calculations are OK due to
>   bdrv_check_qiov_request(), bytes go to RawPosixAIOData::aio_nbytes
>   which is uint64_t.

We also have to check where that uint64_t gets handed;
handle_aiocb_write_zeroes_block() passes a uint64_t[2] to
ioctl(BLKZEROOUT), handle_aiocb_write_zeroes() calls do_fallocate()
which takes off_t (and we compile to always have 64-bit off_t), as
does handle_aiocb_write_zeroes_unmap.  All look safe.

> 
> gluster: bytes go to GlusterAIOCB::size which is int64_t and to
>   glfs_zerofill_async works with off_t.
> 
> iscsi: Aha, here we deal with iscsi_writesame16_task() that has
>   uint32_t num_blocks argument and iscsi_writesame16_task() has

s/16/10/

>   uint16_t argument. Make comments, add assertions and clarify
>   max_pwrite_zeroes calculation.
>   iscsi_allocmap_() functions already has int64_t argument
>   is_byte_request_lun_aligned is simple to update, do it.
> 
> mirror_top: pass to bdrv_mirror_top_do_write which has uint16_t

s/16/64/

>   argument
> 
> nbd: Aha, here we have protocol limitation, and NBDRequest::len is
>   uint32_t. max_pwrite_zeroes is cleanly set to 32bit value, so we are
>   OK for now.
> 
> nvme: Again, protocol limitation. And no inherent limit for
>   write-zeroes at all. But from code that calculates cdw12 it's obvious
>   that we do have limit and alignment. Let's clarify it. Also,
>   obviously the code is not prepared to bytes=0. Let's handle this

to handle bytes=0

>   case too.
>   trace events already 64bit
> 
> qcow2: offset + bytes and alignment still works good (thanks to
>   bdrv_check_qiov_request()), so tail calculation is OK
>   qcow2_subcluster_zeroize() has 64bit argument, should be OK
>   trace events updated
> 
> qed: qed_co_request wants int nb_sectors. Also in code we have size_t
>   used for request length which may be 32bit.. So, let's just keep

Double dot looks odd.

>   INT_MAX as a limit (aligning it down to pwrite_zeroes_alignment) and
>   don't care.

Yeah, even when size_t is 64-bit, qed is not our high priority so
sticking to 32-bit limit encourages people to switch away from qed ;)

> 
> raw-format: Is OK. raw_adjust_offset and bdrv_co_pwrite_zeroes are both
>   64bit.

I probably already mentioned it in earlier reviews, but hopefully by
the end of the series, we clean up raw_adjust_offset() to take
int64_t* instead of uint64_t* to get rid of ugly casts.  Doesn't have
to be done in this patch.

> 
> throttle: Both throttle_group_co_io_limits_intercept() and
>   bdrv_co_pwrite_zeroes() are 64bit.
> 
> vmdk: pass to vmdk_pwritev which is 64bit
> 
> quorum: pass to quorum_co_pwritev() which is 64bit
> 
> preallocated: pass to handle_write() and bdrv_co_pwrite_zeroes(), both

File is named preallocate.c, the 'd' seems odd. Worth sorting this
before qcow2 in the commit message?

>   64bit.
> 
> Hooray!
> 
> At this point all block drivers are prepared to 64bit write-zero
> requests or has explicitly set max_pwrite_zeroes.

are prepared to support 64bit write-zero requests, or have explicitly set

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/block/iscsi.c
> @@ -1205,15 +1205,16 @@ out_unlock:
>  
>  static int
>  coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> -                                    int bytes, BdrvRequestFlags flags)
> +                                    int64_t bytes, BdrvRequestFlags flags)
>  {
>      IscsiLun *iscsilun = bs->opaque;
>      struct IscsiTask iTask;
>      uint64_t lba;
> -    uint32_t nb_blocks;
> +    uint64_t nb_blocks;
>      bool use_16_for_ws = iscsilun->use_16_for_rw;
>      int r = 0;
>  
> +
>      if (!is_byte_request_lun_aligned(offset, bytes, iscsilun)) {

Why the added blank line here?

>          return -ENOTSUP;
>      }
> @@ -1250,11 +1251,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>      iscsi_co_init_iscsitask(iscsilun, &iTask);
>  retry:
>      if (use_16_for_ws) {
> +        /*
> +         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
> +         * on our max_pwrite_zeroes limit.
> +         */
> +        assert(nb_blocks < UINT32_MAX);
>          iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
>                                              iscsilun->zeroblock, iscsilun->block_size,
>                                              nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
>                                              0, 0, iscsi_co_generic_cb, &iTask);
>      } else {
> +        /*
> +         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
> +         * on our max_pwrite_zeroes limit.
> +         */
> +        assert(nb_blocks < UINT16_MAX);
>          iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
>                                              iscsilun->zeroblock, iscsilun->block_size,
>                                              nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),

Thanks - these assertions and comments are indeed a lifesaver for
future maintenance.

> @@ -2074,10 +2085,10 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
>          bs->bl.pdiscard_alignment = iscsilun->block_size;
>      }
>  
> -    if (iscsilun->bl.max_ws_len < 0xffffffff / block_size) {
> -        bs->bl.max_pwrite_zeroes =
> -            iscsilun->bl.max_ws_len * iscsilun->block_size;
> -    }
> +    bs->bl.max_pwrite_zeroes =
> +        MIN_NON_ZERO(iscsilun->bl.max_ws_len * iscsilun->block_size,
> +                     max_xfer_len * iscsilun->block_size);

Works because max_xfer_len is 0xffff if we are stuck using
writesame10, or 0xffffffff if we are able to use writesame16.

> +++ b/block/nvme.c
> @@ -1266,19 +1266,29 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
>  
>  static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
>                                                int64_t offset,
> -                                              int bytes,
> +                                              int64_t bytes,
>                                                BdrvRequestFlags flags)
>  {
>      BDRVNVMeState *s = bs->opaque;
>      NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
>      NVMeRequest *req;
> -
> -    uint32_t cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
> +    uint32_t cdw12;
>  
>      if (!s->supports_write_zeroes) {
>          return -ENOTSUP;
>      }
>  
> +    if (bytes == 0) {
> +        return 0;
> +    }
> +
> +    cdw12 = ((bytes >> s->blkshift) - 1) & 0xFFFF;
> +    /*
> +     * We should not loose information. pwrite_zeroes_alignment and

lose (this is a common English typo; "lose" rhymes with "use" and is
opposite of "gain", while "loose" rhymes with "goose" and is opposite
of "tighten")

> +++ b/block/qed.c

> @@ -1408,6 +1409,12 @@ static int coroutine_fn bdrv_qed_co_pwrite_zeroes(BlockDriverState *bs,
>       */
>      QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, bytes);
>  
> +    /*
> +     * QED is not prepared for 62bit write-zero requests, so rely on

64bit

> +     * max_pwrite_zeroes.
> +     */
> +    assert(bytes <= INT_MAX);
> +
>      /* Fall back if the request is not aligned */
>      if (qed_offset_into_cluster(s, offset) ||
>          qed_offset_into_cluster(s, bytes)) {

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


