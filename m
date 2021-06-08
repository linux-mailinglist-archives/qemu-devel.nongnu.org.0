Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4739FE28
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:49:28 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfqx-0005Sj-M8
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfpw-0004Ti-8p
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfpt-00034R-Ku
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2a1Ilsq2ia0qLKhsgELYUwVVLFZlky+6SCQ1edUCfk=;
 b=hfhoUn7GaaNC4hcEJSdfLyWNck07BSHn0SNdGpFnqDVYn+lqrnwLv/VjibNOSHIeYsqvFa
 QrvaJgJ162F1iAzbMDEsr1fNdvjYTSSplMITFeVJpojwjj/VXQMC/Ef3YTv8RpfdA57kh7
 FnUg0UO04S9UAIO0TWr5QWGjxfrbLPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-8Mdp_KOfO0GUoDsmILP2DA-1; Tue, 08 Jun 2021 13:48:19 -0400
X-MC-Unique: 8Mdp_KOfO0GUoDsmILP2DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B0C7107ACC7;
 Tue,  8 Jun 2021 17:48:17 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7C210016FB;
 Tue,  8 Jun 2021 17:48:16 +0000 (UTC)
Date: Tue, 8 Jun 2021 12:48:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 3/7] block: add max_hw_transfer to BlockLimits
Message-ID: <20210608174815.7qvut3es42ytrgtl@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 03:16:30PM +0200, Paolo Bonzini wrote:
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
> ---
>  block/block-backend.c          | 12 ++++++++++++
>  block/file-posix.c             |  2 +-
>  block/io.c                     |  1 +
>  hw/scsi/scsi-generic.c         |  2 +-
>  include/block/block_int.h      |  7 +++++++
>  include/sysemu/block-backend.h |  1 +

[you can use git's orderfile option to put .h changes first]

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

Since we have declared (elsewhere) that the maximum block device is
signed, would this be better as int64_t?  (Our reasoning is that off_t
is also signed, and we are unlikely to need to handle anything bigger
than what off_t can handle; plus it leaves room for returning errors,
although this particular function is not giving errors; see also
Vladimir's work on making the block layer 64-bit clean).  I'm not
opposed to unsigned here to represent lack of errors, but consistency
with the rest of the block layer may argue for signed.

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

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


