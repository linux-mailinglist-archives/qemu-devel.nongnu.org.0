Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9D3A1AD1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:21:08 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0x1-0005qy-Te
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0nM-0008TK-GP
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:11:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0nK-0004Dg-QP
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623255066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/IB00rftk7CMMqZGb5lSHQnnLcOQVMItBgMYEnAwvU=;
 b=AasrmrJWPt+2JicboU7HdqC3Yp/IIUnvu/Qz0Yxm6Yh3/b0HTmKyPtjsv+R811kboxhqz6
 8fOpEgfJUy3VlxwsY6Hp4GcUUvyj/uFFLSN7ZI88bA6hzed5qju6cw+WleairAWpOMoHVi
 B+2WDc0x8L9zHBGSnt2suEAbmUQKgIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-b2-F9cbxO-eJ6Q95Jhsm2Q-1; Wed, 09 Jun 2021 12:11:02 -0400
X-MC-Unique: b2-F9cbxO-eJ6Q95Jhsm2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FF5F8015D6;
 Wed,  9 Jun 2021 16:11:01 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 738185D6AD;
 Wed,  9 Jun 2021 16:10:59 +0000 (UTC)
Message-ID: <d6a97239620116ef3d677a86ef4e0195653cb961.camel@redhat.com>
Subject: Re: [PATCH v4 2/7] scsi-generic: pass max_segments via max_iov
 field in BlockLimits
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 09 Jun 2021 19:10:58 +0300
In-Reply-To: <20210608131634.423904-3-pbonzini@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-3-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> I/O to a disk via read/write is not limited by the number of segments allowed
> by the host adapter; the kernel can split requests if needed, and the limit
> imposed by the host adapter can be very low (256k or so) to avoid that SG_IO
> returns EINVAL if memory is heavily fragmented.
> 
> Since this value is only interesting for SG_IO-based I/O, do not include
> it in the max_transfer and only take it into account when patching the
> block limits VPD page in the scsi-generic device.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c     | 3 +--
>  hw/scsi/scsi-generic.c | 6 ++++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 536998a1d6..670c577bfe 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1239,8 +1239,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>          ret = sg_get_max_segments(s->fd);
>          if (ret > 0) {
> -            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
> -                                      ret * qemu_real_host_page_size);
> +            bs->bl.max_iov = ret;

Actually I think that both max transfer size and max segement count,
are only relevant for SCSI passthrough since kernel I think emualates
both for regular I/O, so I think that we shoudn't expose them to qemu at all.

In my version of the patches I removed both bl.max_transfer and bl.max_iov
setup from the file-posix driver and replaced it with bs->bl.max_ioctl_transfer
(you call it max_hw_transfer)

In my version the bl.max_ioctl_transfer is a merged limit of the max transfer size
and the max iovec number.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768264.html


Best regards,
	Maxim Levitsky


>          }
>      }
>  
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 98c30c5d5c..82e1e2ee79 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -179,10 +179,12 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
>          (r->req.cmd.buf[1] & 0x01)) {
>          page = r->req.cmd.buf[2];
>          if (page == 0xb0) {
> -            uint32_t max_transfer =
> -                blk_get_max_transfer(s->conf.blk) / s->blocksize;
> +            uint32_t max_transfer = blk_get_max_transfer(s->conf.blk);
> +            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
>  
>              assert(max_transfer);
> +            max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
> +                / s->blocksize;
>              stl_be_p(&r->buf[8], max_transfer);
>              /* Also take care of the opt xfer len. */
>              stl_be_p(&r->buf[12],





