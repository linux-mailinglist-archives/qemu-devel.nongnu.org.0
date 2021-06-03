Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A3B39A946
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:34:32 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorEl-0002TD-CR
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lorDe-0001Ll-9S
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lorDb-000161-Ch
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622741597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dMM6bNhLEKxZHetUzKOGQIe41YG57f9FE1odJgEss94=;
 b=Aqzk9Wd6LF+GFcJFl92RmrOuyIuWr0bkb7+WhfhrTCbfeLOgITK0qC+byq7M0hKZ+6t4Rl
 f97hWVU1mGXNYpuixBG5FN5X3k81MoBu9pknQHLio/AaAIg6yXbBbGNS4/h+BkTPXpodqC
 K0dbYASnQ+PlpisUUy0czG+IoUquZY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-yAXa2Z33PKORiFe_DbmsMA-1; Thu, 03 Jun 2021 13:33:14 -0400
X-MC-Unique: yAXa2Z33PKORiFe_DbmsMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D3518DD120;
 Thu,  3 Jun 2021 17:33:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFE75D9F2;
 Thu,  3 Jun 2021 17:33:12 +0000 (UTC)
Date: Thu, 3 Jun 2021 12:33:11 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
Message-ID: <20210603173311.abker673xq6qscww@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-4-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 03:37:18PM +0200, Paolo Bonzini wrote:
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

> +/* Returns the maximum hardware transfer length, in bytes; guaranteed nonzero */
> +uint64_t blk_get_max_hw_transfer(BlockBackend *blk)
> +{
> +    BlockDriverState *bs = blk_bs(blk);
> +    uint64_t max = INT_MAX;

This is an unaligned value; should we instead round it down to the
request_alignment granularity?

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

> +++ b/include/block/block_int.h
> @@ -695,6 +695,13 @@ typedef struct BlockLimits {
>       * clamped down. */
>      uint32_t max_transfer;
>  
> +    /* Maximal hardware transfer length in bytes.  Applies whenever

Leading /* on its own line, per our style.

> +     * transfers to the device bypass the kernel I/O scheduler, for
> +     * example with SG_IO.  If larger than max_transfer or if zero,
> +     * blk_get_max_hw_transfer will fall back to max_transfer.
> +     */

Should we mandate any additional requirements on this value such as
multiple of request_alignment or even power-of-2?

> +    uint64_t max_hw_transfer;
> +
>      /* memory alignment, in bytes so that no bounce buffer is needed */
>      size_t min_mem_alignment;
>  

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


