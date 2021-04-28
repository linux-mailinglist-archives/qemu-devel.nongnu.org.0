Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501436DFEC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:51:57 +0200 (CEST)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqE0-0006II-67
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lbq0M-0000ow-3V
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lbq0J-0006W3-9y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619638664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qk3p//70fwYTN4/xAeXKIEFda66iOqpWxzCmc1EPF98=;
 b=BcVmk6f93deYIqK0vukn1LDMOW7M3GpS4LGFPRzOA89xcOV61LV0MWweEZT3kXJj6zOTVI
 n4zSVxGFfJztW6ncxmi50GaflU1O0z1nA3Yu1nAAGnUv1CnyEkbCm0z5xcuBRH74C8jkSK
 5Kb/b0cW7bYp6A7rgdk0OEJF7Ap2j14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-mZT_LprYO0uzHegqexRfhw-1; Wed, 28 Apr 2021 15:37:42 -0400
X-MC-Unique: mZT_LprYO0uzHegqexRfhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8050918B9ECB;
 Wed, 28 Apr 2021 19:37:41 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49D3860E3A;
 Wed, 28 Apr 2021 19:37:41 +0000 (UTC)
Date: Wed, 28 Apr 2021 13:37:40 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <20210428133740.6ccbbba6@redhat.com>
In-Reply-To: <YIm0w2RgQgosIyiB@work-vm>
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
 <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
 <20210427121850.68d2a8dd@redhat.com> <YIhfWoRgJtaKZhh8@work-vm>
 <CANsN3OSs4GyT10P6xUp-s823U8VnWAmihWXQ1jSnF07wyYjxuA@mail.gmail.com>
 <YIm0w2RgQgosIyiB@work-vm>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Dev Audsin <dev.devaqemu@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 20:17:23 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Dev Audsin (dev.devaqemu@gmail.com) wrote:
> > Thanks Dave for your explanation.
> > Any suggestions on how to make VFIO not attempt to map into the
> > unaccessible and unallocated RAM.  
> 
> I'm not sure;:
> 
> static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> {
>     return (!memory_region_is_ram(section->mr) &&
>             !memory_region_is_iommu(section->mr)) ||
>            section->offset_within_address_space & (1ULL << 63);
> }
> 
> I'm declaring that region with memory_region_init_ram_ptr;  should I be?
> it's not quite like RAM.
> But then I *do* want a kvm slot for it, and I do want it to be accessed
> by mapping rather htan calling IO functions; that makes me think mr->ram
> has to be true.
> But then do we need to add another flag to memory-regions; if we do,
> what is it;
>    a) We don't want an 'is_virtio_fs' - it needs to be more generic
>    b) 'no_vfio' also feels wrong
> 
> Is perhaps 'not_lockable' the right thing to call it?

This reasoning just seems to lead back to "it doesn't work, therefore
don't do it" rather than identifying the property of the region that
makes it safe not to map it for device DMA (assuming that's actually
the case).  It's clearly "RAM" as far as QEMU is concerned given how
it's created, but does it actually appear in the VM as generic physical
RAM that the guest OS could program to the device as a DMA target?  If
not, what property makes that so, create a flag for that.  Thanks,

Alex


