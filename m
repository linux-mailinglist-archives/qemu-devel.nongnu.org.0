Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB56B2B48
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:56:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJYd-0002Nd-Ba; Thu, 09 Mar 2023 11:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paJYa-0002NO-3N
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1paJYY-0008Sq-8W
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678380953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IzWcm+ALm7G78JcValCYSXadpeg1tsboIb9bsFRK77M=;
 b=jDIyi8rVTSWdMRzNl5yr663G2iJ8YILC1+Mgi8vJGyM88amOoOeVesEiTP/LIC92eYEOFr
 td5asxvVSSjA49u/FjA53qN9MJFB2nukEb4dCiPY1rZF7PKyp+rjKfFHMqElzQT3JR2TW0
 MppNQWZfOkmLmcIRW8G+7FIqXXnVGVc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-WFoe9InIPx-fh1A3bp7lTg-1; Thu, 09 Mar 2023 11:55:52 -0500
X-MC-Unique: WFoe9InIPx-fh1A3bp7lTg-1
Received: by mail-qk1-f198.google.com with SMTP id
 c13-20020a05620a0ced00b007422bf7c4aeso1584078qkj.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678380952;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzWcm+ALm7G78JcValCYSXadpeg1tsboIb9bsFRK77M=;
 b=kGl4FadPcfi7cdSySc3JIoJ2hB7Nku6lt2Qdjc2DPHfJHMzK9D/9GPBnaFpe3TL0WN
 UbOitYP3WPkCHkbIJYo9jczpXR2+CCxcJ6uuB7zTDCJnWVUZHjObBsCNZlLwysMk7W5Q
 RLLrx39pMOPfyK1fVOnzY7P8E3R70U7Dm+5UIzjkMlcTXhUYfRRmIzEwSJuDeII4v5X1
 eDmS/DI8DIgXna8g4VEy91ZPacEvOtE+wo7nz46xGkzxa333m62utnusFyckHPKvBSRV
 BgJD176pCsyzTWnBkj/uP/xEsdtNGlK5rq6OkuvL2BTdMyn+F2WlyNjZVWxfl99R0dfR
 6qCg==
X-Gm-Message-State: AO0yUKXX10E4kHl64AAW/4AfvtLkRJwTtg2BGQXlBTh/6O/ZEbdQhVZY
 bf5mzg+YOdRN6FA2qobP66UQr7i014eU0EZf1wWh1H/iP/LesPDCaG3kvwz9VaC0W6sBlTYWICA
 8mTcxyqFUb9IKCR4=
X-Received: by 2002:a05:6214:1c4f:b0:56e:89b9:9a92 with SMTP id
 if15-20020a0562141c4f00b0056e89b99a92mr6600286qvb.0.1678380951998; 
 Thu, 09 Mar 2023 08:55:51 -0800 (PST)
X-Google-Smtp-Source: AK7set98JsTti0agLsVdw6v8Hdrhm94fP55YfyRp0iXv5P4elFhrozWpRY+fdO5ImvTyeLeP6z/AHw==
X-Received: by 2002:a05:6214:1c4f:b0:56e:89b9:9a92 with SMTP id
 if15-20020a0562141c4f00b0056e89b99a92mr6600256qvb.0.1678380951641; 
 Thu, 09 Mar 2023 08:55:51 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 191-20020a370cc8000000b007416c11ea03sm13865157qkm.26.2023.03.09.08.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:55:50 -0800 (PST)
Date: Thu, 9 Mar 2023 11:55:49 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Message-ID: <ZAoPlRMlcO4fm5rJ@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n>
 <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
 <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
 <ZAYXUKUtU9ipksUq@x1n>
 <55bab93ee00619ac5b5b7416c17aee175ada8a8b.camel@infradead.org>
 <ZAkVwunxmEfXu4+H@x1n>
 <0754a758a46549dccde7878282721fe3835dc4b3.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0754a758a46549dccde7878282721fe3835dc4b3.camel@infradead.org>
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

On Thu, Mar 09, 2023 at 09:16:08AM +0000, David Woodhouse wrote:
> On Wed, 2023-03-08 at 18:09 -0500, Peter Xu wrote:
> > On Mon, Mar 06, 2023 at 05:28:24PM +0000, David Woodhouse wrote:
> > > Indeed, I don't think we care about the in-kernel I/OAPIC. I don't
> > > think we care about the kernel knowing about e.g. "GSI #11" at all. We
> > > can just deliver it as MSI (for the I/OAPIC) or using KVM_INTERRUPT and
> > > the interrupt window as we do for the PIC. Which is why I'd happily rip
> > > that out and let it be delivered via the APIC intercept at 0xfeexxxxx.
> > > 
> > > The existing code which just keeps IRQ routes updated when they're
> > > valid is kind of OK, and well-behaved guests can function. But it isn't
> > > *right* in the case where they aren't valid.
> > > 
> > > What *ought* to happen is that the IOMMU should raise a fault at the
> > > moment the interrupt occurs, if the translation isn't valid. And we
> > > don't have that at all.
> > 
> > Right, that's definitely not ideal as an emulator.
> > 
> > > 
> > > As for why I care? I don't really *need* it, as I have everything I
> > > need for Xen PIRQ support already merged in 
> > > https://gitlab.com/qemu-project/qemu/-/commit/6096cf7877
> > > 
> > > So while the thread at
> > > https://lore.kernel.org/qemu-devel/aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org/
> > > was partly driven by expecting to need this for Xen PIRQ support
> > > (because in $DAYJOB I did those things in the other order and the PIRQ
> > > support ended up just being a trivial different translator like the
> > > IOMMU's IR)... I'd still quite like to fix it up in QEMU anyway, just
> > > for correctness and fidelity in the faulting cases.
> > > 
> > > We can do more efficient invalidation too, rather than blowing away the
> > > entire routing table every time. Just disconnect the IRQFD for the
> > > specific interrupts that get invalidated, and let them get fixed up
> > > again next time they occur.
> > 
> > I'm curious whether there's anything else beside the "correctness of
> > emulation" reason.
> 
> Nah, at this point it's just because it annoys me. I did this in
> another VMM and it works nicely, and I'd like QEMU to do the same. ;)
> 
> > I would think it nice if it existed or trivial to have as what you said.  I
> > just don't know whether it's as easy, at least so far a new kernel
> > interface seems still needed, allowing a kernel irq to be paused until
> > being translated by QEMU from some channel we provide.
> 
> It doesn't need a new kernel interface.
> 
> With IRQ remapping we have a userspace I/OAPIC, so how we deliver its
> MSIs is entirely up to us — we absolutely don't need the kernel to have
> *any* KVM_IRQ_ROUTING_IRQCHIP entries.

Oh so it's about split irqchip only..  Yes indeed it looks like it's
possible to not change the kernel.

> The only IRQs that are handled fully in the kernel are events arriving
> on some eventfd which is bound as an IRQFD to some IRQ in the KVM
> routing table. (Mostly MSIs coming from VFIO).
> 
> If we want to "pause" one of those, all we have to do is unbind the
> IRQFD and then we can handle that eventfd in userspace instead. Which
> is what we do *anyway* in the case where IRQFD support isn't available.
> 
> In
> https://lore.kernel.org/kvm/20201027143944.648769-1-dwmw2@infradead.org/
> I *optimised* that dance, so userspace doesn't have to stop listening
> on the eventfd when the IRQFD is bound; the IRQFD code consumes the
> event first. But we can live without that in older kernels.
> 
> Basically, it's just treating the IRQFD support as an *optimisation*,
> and retaining the 'slow path' of handling the event in userspace and
> injecting the resulting MSI.
> 
> It's just that in that slow path, as we're translating and injecting
> the MSI, we *also* update the IRQ routing table and reattach the IRQFD
> for the next time that interrupt fires. Like a cache.
> 
> And we stash an invalidation cookie (for Intel-IOMMU the IRTE index)
> for each routing table entry, so that when asked to invalidate a
> *range* of cookies (that's how the Intel IOMMU invalidate works), we
> can just detach the IRQFD from those ones, letting them get handled in
> userspace next time and retranslated (with associated fault report, as
> appropriate).

We can maintain a cookie per entry in the routing table in userspace, I
think, and ignore those when applying to KVM (perhaps need to regenerate
another table when applying?  As KVM won't recognize the cookies). Besides
that, do we need other infrastructures to link this entry / GSI back to
which device registers with it?  Since I assume we need to tear down irqfds
if there is, and rehook the event to an userspace handler here too.

There're four devices that can hook onto this, IIUC.  Besides IOAPIC and
VFIO, there's also ivshmem and vhost.  IIUC we'll need to change all the
four devices to implement this.

Besides the changeset (which seems to be still non-trivial to me.. without
yet evaluating whether that'll be worth the effort), one concern I have
right now is whether delaying the 1st irq would regress in any case.

I think you may have better knowledge here than me on how guest behaves in
IRQ subsystem.  For example, is there any case where IRQs can be modified /
invalidated frequently (perhaps mask / unmask?) so there can be a lot of
IRQs delivered slower than before? Because after this change the IRQ setup
/ cache overhead will be applied to the 1st IRQ being triggered rather than
when IRQ was established / unmasked.

This also reminded me (just out of curiosity) on what will happen if
without IR at all: say, what if a device setup a wrong MSI (with a messed
up MSI data register) on bare metal?  Then, does QEMU properly emulate that
too so far?

-- 
Peter Xu


