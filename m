Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F193E6B163E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 00:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2vC-0006Vq-QX; Wed, 08 Mar 2023 18:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pa2vA-0006Vi-M3
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pa2v8-0005TI-OW
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678317005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r4oYqAlyLAmHEmllm9yvp4uwJMhMVjpJCCMizek1erg=;
 b=h5PuJ0rlUU08OXP0/KpjnFdhAhoUNE1RTffjVNaDL5tL79vQ/s4GklCOcs8q4qRx4SFAJi
 2wLZUpHmSM75fx9MGitHMpj6i6++riFKm+/lYyxMsSUA6vLDZHRxjs29Ryp9hUK4N4NtT8
 86G26Nqhl6Z/W63V1IQVwayJ4lgdF+k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-dNUvBRdVN0W5X0G8Te9h-A-1; Wed, 08 Mar 2023 18:09:56 -0500
X-MC-Unique: dNUvBRdVN0W5X0G8Te9h-A-1
Received: by mail-qv1-f71.google.com with SMTP id
 px25-20020a056214051900b0056f0794632bso227303qvb.18
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 15:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678316996;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4oYqAlyLAmHEmllm9yvp4uwJMhMVjpJCCMizek1erg=;
 b=EA60gG71BX4tUGA1nwFf0pL/KpxDRBlfnuBmLcNhtEGHXEwh7Sw5dzBKcyETqKdhAn
 jfYFDDNdwr+ftxAAklhfPZ23e7BhsknUS6SGRDINz0mZofeQs2yXfyaPh0EuF48zVCn7
 5lFmEgLMbLBSxQRYoq/X1h9mRROZoxjiaYd87t8LmSDbI1LAJYELA+qzNBLs2AngKKeY
 AoaXOG1KZRzlsznhIkZEdowZIXjpLoN04xNKmCxVu0hOiIyHfxP5r8zafO1M27Q1Wmb+
 9GLtnmvgvlBVYuIViBOELfpTsNyEc4KXABAEO72Yt8tFmTgL5LOqCXCnN5IDRt+iDl/J
 CBgQ==
X-Gm-Message-State: AO0yUKV14ZfXiL6bixatN2bi0I8PK2PrUmgefaoEh12jzvo9gl5P2yL8
 QN3BsNdEDyUZ553+f0amEyDQjBExooBO5d+eVT+d+xZyzu6JesCd5j0bM3seYH6rrnFnCa+VCKH
 0FJfEjHklRzicxjY=
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr1678192qtb.5.1678316996235; 
 Wed, 08 Mar 2023 15:09:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+iSdbImrmlIcmJXG2YP5jnMngXsknVUAcf5a+8AbjTSudmSCjtpbjXJ0W6AaUYXnlcA3iGfg==
X-Received: by 2002:a05:622a:1b9e:b0:3bf:a3d0:9023 with SMTP id
 bp30-20020a05622a1b9e00b003bfa3d09023mr1678170qtb.5.1678316995950; 
 Wed, 08 Mar 2023 15:09:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t62-20020ae9df41000000b0073b7f2a0bcbsm12252846qkf.36.2023.03.08.15.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 15:09:55 -0800 (PST)
Date: Wed, 8 Mar 2023 18:09:54 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Message-ID: <ZAkVwunxmEfXu4+H@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n>
 <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
 <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
 <ZAYXUKUtU9ipksUq@x1n>
 <55bab93ee00619ac5b5b7416c17aee175ada8a8b.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55bab93ee00619ac5b5b7416c17aee175ada8a8b.camel@infradead.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Mar 06, 2023 at 05:28:24PM +0000, David Woodhouse wrote:
> Indeed, I don't think we care about the in-kernel I/OAPIC. I don't
> think we care about the kernel knowing about e.g. "GSI #11" at all. We
> can just deliver it as MSI (for the I/OAPIC) or using KVM_INTERRUPT and
> the interrupt window as we do for the PIC. Which is why I'd happily rip
> that out and let it be delivered via the APIC intercept at 0xfeexxxxx.
> 
> The existing code which just keeps IRQ routes updated when they're
> valid is kind of OK, and well-behaved guests can function. But it isn't
> *right* in the case where they aren't valid.
> 
> What *ought* to happen is that the IOMMU should raise a fault at the
> moment the interrupt occurs, if the translation isn't valid. And we
> don't have that at all.

Right, that's definitely not ideal as an emulator.

> 
> As for why I care? I don't really *need* it, as I have everything I
> need for Xen PIRQ support already merged in 
> https://gitlab.com/qemu-project/qemu/-/commit/6096cf7877
> 
> So while the thread at
> https://lore.kernel.org/qemu-devel/aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org/
> was partly driven by expecting to need this for Xen PIRQ support
> (because in $DAYJOB I did those things in the other order and the PIRQ
> support ended up just being a trivial different translator like the
> IOMMU's IR)... I'd still quite like to fix it up in QEMU anyway, just
> for correctness and fidelity in the faulting cases.
> 
> We can do more efficient invalidation too, rather than blowing away the
> entire routing table every time. Just disconnect the IRQFD for the
> specific interrupts that get invalidated, and let them get fixed up
> again next time they occur.

I'm curious whether there's anything else beside the "correctness of
emulation" reason.

I would think it nice if it existed or trivial to have as what you said.  I
just don't know whether it's as easy, at least so far a new kernel
interface seems still needed, allowing a kernel irq to be paused until
being translated by QEMU from some channel we provide.

So, IMHO it's about whether the reason that "we want to have a complete
emulation of IR" can properly justify the complexity of at least the kernel
interface (I don't worry on the qemu side a lot).  After all, even if it
can completes the emulation, 99.99% of people will not use it. :(

-- 
Peter Xu


