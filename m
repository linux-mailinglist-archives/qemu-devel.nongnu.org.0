Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE73A1AD3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:22:34 +0200 (CEST)
Received: from localhost ([::1]:54188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0yP-0007Uj-Rn
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0pG-0002Rj-Ao
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:13:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0pE-0004qo-3b
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623255183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=broKGiBHn4Mrcqhd26WBYkZyDDh8lM2XHC1mQBH7Muc=;
 b=TEAGEHYzOJGrklKbYqx31UC0AGRTjkBxkyM/SMWJD37gx4b+faqgIbD5NBAZtYcxEYFENe
 kGWEBsuChdHm2X7mxF1lGdyzTE7H4zbnEeW8nuOL8NjoOZ+whPlGiJiByaGn5BTk8AIGDn
 c2A8qGgBXv9cfhqFcMRQVCFv/HjvOyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-6fWx9KHnNkGwh-LiHpM-HQ-1; Wed, 09 Jun 2021 12:13:01 -0400
X-MC-Unique: 6fWx9KHnNkGwh-LiHpM-HQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E573185060A;
 Wed,  9 Jun 2021 16:13:00 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05CD55D9C6;
 Wed,  9 Jun 2021 16:12:56 +0000 (UTC)
Message-ID: <9378247cb67d5b1afe7f4d83fab22a16ed610ae3.camel@redhat.com>
Subject: Re: [PATCH v4 3/7] block: add max_hw_transfer to BlockLimits
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 09 Jun 2021 19:12:55 +0300
In-Reply-To: <20210608131634.423904-4-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-4-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-08 at 15:16 +0200, Paolo Bonzini wrote:
> For block host devices, I/O can happen through either the kernel file
> descriptor I/O system calls (preadv/pwritev, io_submit, io_uring)
> or the SCSI passthrough ioctl SG_IO.
> 
> In the latter case, the size of each transfer can be limited by the
> HBA, while for file descriptor I/O the kernel is able to split and
> merge I/O in smaller pieces as needed.  Applying the HBA limits to
> file descriptor I/O results in more system calls and suboptimal
> performance, so this patch splits the max_transfer limit in two:
> max_transfer remains valid and is used in general, while max_hw_transfer
> is limited to the maximum hardware size.  max_hw_transfer can then be
> included by the scsi-generic driver in the block limits page, to ensure
> that the stricter hardware limit is used.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

This is mostly the same as my patch 

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768264.html

I called this max_ioctl_transfer, since this limit is only relevant
to the .ioctl, but max_hw_transfer is fine as well.

So this patch looks OK, but I might have missed something
as I haven't touched this area for a long time.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


> ---
>  block/block-backend.c          | 12 ++++++++++++
>  block/file-posix.c             |  2 +-
>  block/io.c                     |  1 +
>  hw/scsi/scsi-generic.c         |  2 +-
>  include/block/block_int.h      |  7 +++++++
>  include/sysemu/block-backend.h |  1 +
>  6 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 15f1ea4288..2ea1412a54 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1953,6 +1953,18 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
>      return bs ? bs->bl.request_alignment : BDRV_SECTOR_SIZE;
>  }
>  
> +/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
> +{
> +    BlockDriverState *bs = blk_bs(blk);
> +    uint64_t max = INT_MAX;
> +
> +    if (bs) {
> +        max = MIN_NON_ZERO(bs->bl.max_hw_transfer, bs->bl.max_transfer);
> +    }
> +    return max;
> +}
> +
>  /* Returns the maximum transfer length, in bytes; guaranteed nonzero */
>  uint32_t blk_get_max_transfer(BlockBackend *blk)
>  {
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 670c577bfe..c9746d3eb6 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1234,7 +1234,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>          int ret = sg_get_max_transfer_length(s->fd);
>  
>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_transfer = pow2floor(ret);
> +            bs->bl.max_hw_transfer = pow2floor(ret);
>          }
>  
>          ret = sg_get_max_segments(s->fd);
> diff --git a/block/io.c b/block/io.c
> index 323854d063..089b99bb0c 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -127,6 +127,7 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
>  {
>      dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
>      dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
> +    dst->max_hw_transfer = MIN_NON_ZERO(dst->max_hw_transfer, src->max_hw_transfer);
>      dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
>                                   src->opt_mem_alignment);
>      dst->min_mem_alignment = MAX(dst->min_mem_alignment,
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 82e1e2ee79..3762dce749 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -179,7 +179,7 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
>          (r->req.cmd.buf[1] & 0x01)) {
>          page = r->req.cmd.buf[2];
>          if (page == 0xb0) {
> -            uint32_t max_transfer = blk_get_max_transfer(s->conf.blk);
> +            uint64_t max_transfer = blk_get_max_hw_transfer(s->conf.blk);
>              uint32_t max_iov = blk_get_max_iov(s->conf.blk);
>  
>              assert(max_transfer);
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 057d88b1fc..f1a54db0f8 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -695,6 +695,13 @@ typedef struct BlockLimits {
>       * clamped down. */
>      uint32_t max_transfer;
>  
> +    /* Maximal hardware transfer length in bytes.  Applies whenever
> +     * transfers to the device bypass the kernel I/O scheduler, for
> +     * example with SG_IO.  If larger than max_transfer or if zero,
> +     * blk_get_max_hw_transfer will fall back to max_transfer.
> +     */
> +    uint64_t max_hw_transfer;
> +
>      /* memory alignment, in bytes so that no bounce buffer is needed */
>      size_t min_mem_alignment;
>  
> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index 5423e3d9c6..9ac5f7bbd3 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -208,6 +208,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag);
>  int blk_get_flags(BlockBackend *blk);
>  uint32_t blk_get_request_alignment(BlockBackend *blk);
>  uint32_t blk_get_max_transfer(BlockBackend *blk);
> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
>  int blk_get_max_iov(BlockBackend *blk);
>  void blk_set_guest_block_size(BlockBackend *blk, int align);
>  void *blk_try_blockalign(BlockBackend *blk, size_t size);





