Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F766958E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 12:32:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGIHd-0003Pv-Ol; Fri, 13 Jan 2023 06:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pGIHZ-0003Pj-Tw
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pGIHY-0001V0-01
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 06:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673609495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAXhwmHNW4hQ1OA7aeyd8E25qLqKzy557pPjxPVuaI0=;
 b=ha9W/KsLG9bEcS2uJTo++IkNVbiDDvfQqfzfBk3X1DABiPdmafNuhGTS1eNJDzNfagl/Gh
 459dS5NQBEXmMFJ4x3wsW2fhGhG39mVYVGdpeEjtYlRBzSxR0IcHVxui3uDGvw46fYt4Lt
 3b3EbB5rqc1qKLGT4JDtw6qb8gy18Qs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-fy8M92GHMU6BPVxKPW3BJQ-1; Fri, 13 Jan 2023 06:31:32 -0500
X-MC-Unique: fy8M92GHMU6BPVxKPW3BJQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 m84-20020a1fa357000000b003bcb3e83df3so6486090vke.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 03:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAXhwmHNW4hQ1OA7aeyd8E25qLqKzy557pPjxPVuaI0=;
 b=IgQwEBeJote5D3o+4x2onOdEySSFxWPpO9Ijl+96UGEvcW9pbVY4aOwIbxXM1srYmx
 jb46EgDrv+e1s4zrSevlixif0yomlAcBFIwUmi2VmxRq399ohoK6y+Dmjit2buhwiMZJ
 Rkpy0whQeH/2EZeUTLAbWaOunTnwwhOdraY3wLZ42wiWW2oUDNm19a1HN0+K60Ti9kYt
 MBR25o53Ka8btEoDBY44lXESFSNGyZxBgkWEjZWPv6bGOzGKFJjmLNnLp3jXiE42cZ7n
 iU2/ZYgSlwAGUbmNnVKfKvYPcU8MEOXoB28muFtj0wShDd+77Z694eJyCC1zG/zSE6co
 5MLA==
X-Gm-Message-State: AFqh2kp3TwQCZ7gRorSF1BsuowaDaYGFO+DyUYbVYPEIBzVRYhUWe/30
 AwtusS2b4w7Ef4mOmLVQPdEDFS3a7F2yysavmvWdJcbeCQCy2/h/efwNa5ZnwFG76ioEM5bknhz
 vkz3qhaElxe6qLxo=
X-Received: by 2002:a05:6122:310:b0:3bd:45f6:7203 with SMTP id
 c16-20020a056122031000b003bd45f67203mr41360212vko.12.1673609491278; 
 Fri, 13 Jan 2023 03:31:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEeRKc9fa2h/kcLlQzGk0CLKKoM5czv/R9w9i9NYUYMKFXamS4R6T5BawY43l8F8SvorZd/g==
X-Received: by 2002:a05:6122:310:b0:3bd:45f6:7203 with SMTP id
 c16-20020a056122031000b003bd45f67203mr41360187vko.12.1673609490950; 
 Fri, 13 Jan 2023 03:31:30 -0800 (PST)
Received: from redhat.com ([185.199.103.81]) by smtp.gmail.com with ESMTPSA id
 b205-20020a1f1bd6000000b003d5f160e22asm2434430vkb.35.2023.01.13.03.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 03:31:30 -0800 (PST)
Date: Fri, 13 Jan 2023 06:31:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Qemu interrupt-remap fault support
Message-ID: <20230113062525-mutt-send-email-mst@kernel.org>
References: <aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Jan 13, 2023 at 09:08:38AM +0000, David Woodhouse wrote:
> I'm looking at interrupt remapping (because I need to hook into the
> translation somehow to add PIRQ support for Xen which translates guest
> MSIs directly to KVM_IRQ_ROUTING_XEN_EVTCHN).
> 
> Am I right in understanding that it doesn't report faults on interrupts
> which can't be translated? It attempts to translate interrupts at the
> time the table is modified (vtd_int_remap()) or when an APIC access
> actually triggers an MSI (vtd_mem_ir_write()) but in neither case does
> it actually raise a fault?
>
> The behaviour we want here is that we only raise a fault when the IRQ
> actually *happens*. But that's hard in our current model where it looks
> like we pretranslate *everything* in advance and just let it run.
> 
> Here's a proposal for a model which could make it work (using VFIO as
> the example since that's the more complex part but it works for
> emulated MSI sources too):
> 
> We consume the VFIO eventfd *both* in userspace and the kernel. (Since 
> https://lore.kernel.org/kvm/20201027143944.648769-1-dwmw2@infradead.org/
> we can just keep listening on the VFIO eventfd in userspace and the
> kernel will eat all the events so you never notice. On older kernels we
> have to manually stop listening in userspace.)
> 
> When a translation is valid and should be considered 'cached' in the
> IOMMU, that's when we actually hook it up to the irqfd. 
> 
> We can ditch the iec invalidate callbacks (vtd_iec_notify_all) because
> all an invalidation needs to do is KVM_IRQFD_FLAG_DEASSIGN for the
> corresponding GSI.
> 
> (
> You might consider abusing a spare field in the KVM routing table to
> hold a cookie like the IRTE# so that you know *which* entries to
> invalidate. I couldn't possibly comment.
> 
> 	/* 64-bit cookie for IOMMU to use for invalidation choices */
> 	#define ire_ir_cookie(ire) ((ire)->u.adapter.ind_offset)
> 
> 	/* Flags, to indicate a stale entry that needs retranslating
> */
> 	#define ire_user_flags(ire) ((ire)->u.adapter.summary_offset)
> 	#define IRE_USER_FLAG_STALE             1
> )
> 
> So when an interrupt happens and it's *untranslated*, that's when it
> gets raised to userspace to handle, e.g. in vfio_msi_interrupt(). That
> does the normal thing and attempts to deliver the guest MSI directly.
> We add a flag "bool delivering_now" to the X86IOMMUClass int_remap
> function, to allow it to distinguish between preemptive translations
> and actual delivery and to raise the fault in the latter case.
> 
> When the guest frobs a device's MSI table we can do the translation as
> we do at the moment, of course with the 'delivering_now' argument being
> false. And *if* the translation succeeds then we can install the IRQFD
> right away.
> 
> This model allows us to generate faults as the hardware would, and also
> improves the efficiency of invalidation by only invalidating what we
> need to. I haven't looked hard at how it works with an emulated AMD
> IOMMU, but I know that the Xen PIRQ support (which is where I came in)
> slots into it fairly trivially, using the PIRQ# as the 'cookie' for
> invalidation instead of the IRTE# that the Intel IOMMU uses.
> 

Don't see anything obviously wrong with this.
We really need Alex's input on VFIO though.

-- 
MST


