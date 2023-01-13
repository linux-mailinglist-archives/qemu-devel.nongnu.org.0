Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE98669F3B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNHP-00013u-7L; Fri, 13 Jan 2023 11:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pGNH8-0000x4-CF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pGNH5-0003BP-L7
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673628683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hB8vLrqGbvJ+aL3NQT7xZLQkZGANzFJSVkgxU0r2JgI=;
 b=AMoFrvC98Ks0+KFgw8U4TmsGwpD+DaoyuyYYEST8q0memIjsQt6lTeV0r8EymEZ8d96Kny
 m27x240ascdTk/rhOKRAdDnasd2SYHBCFThbhnocOsM0D50kMobOEo2q0s3jSVPYX4oD0g
 71Q2jKRB/XEIcfRFs9a/EpGBOZ4VJmU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-RTo1nRQMPg6gsES3CZwMGQ-1; Fri, 13 Jan 2023 11:51:22 -0500
X-MC-Unique: RTo1nRQMPg6gsES3CZwMGQ-1
Received: by mail-io1-f69.google.com with SMTP id
 k5-20020a6bf705000000b0070483a64c60so2623491iog.18
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 08:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hB8vLrqGbvJ+aL3NQT7xZLQkZGANzFJSVkgxU0r2JgI=;
 b=g1ASfxx5t22r3J9pdujSjp6W3HTjzz4HyxsjC1NYh1TV46lOAOQL5MSdahBdOZIczc
 XkBGM7lsIijNS395ebVSGn5HqfIR/gF4LDrux+13I9rZbQEaJJeX5KS5jWcgaArjrSNB
 KX1rjGjwSw5eek3i/FcXhe8VnWzCinBkIgENeK/wsP9TfmPLRzTg1OprNwE0ZsFuX0i1
 MqgJANQ/1y9fRxkaev7v7ZHAx/EJryaKk8xsShX9JxLhxne43S4KZ4oiMyc4ulNDM8vt
 oKqqP3kbuqgtT0eM2hMZjLXtkmMjHnO6hnaajPHqZhKUkH4nGmH8Gkdcag0l7EXbnUZC
 Zpbg==
X-Gm-Message-State: AFqh2kq2CWL3kGhAPeHav5Y14JTarPUQwzIhHNYLHfLXMvJbrFz4RkUo
 +UnvfFygJqZtbpG9BfUDM4LAjSTmKM9goFvT9sc/fjqLwttmMa7AccBmVL3KG8OQAqejhhLJHQU
 0aRWbaARS52P6oIA=
X-Received: by 2002:a5e:8401:0:b0:704:8128:3aae with SMTP id
 h1-20020a5e8401000000b0070481283aaemr3639890ioj.13.1673628681660; 
 Fri, 13 Jan 2023 08:51:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupxFFXKL+e8YFF2Rq/sczJBQV11Q7P8nLdSzDWP9ejULlJuTstoIyuPW5pwSSBnW1Tv9chNQ==
X-Received: by 2002:a5e:8401:0:b0:704:8128:3aae with SMTP id
 h1-20020a5e8401000000b0070481283aaemr3639880ioj.13.1673628681341; 
 Fri, 13 Jan 2023 08:51:21 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 n31-20020a056602341f00b006884b050a0asm7143384ioz.18.2023.01.13.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 08:51:20 -0800 (PST)
Date: Fri, 13 Jan 2023 09:51:17 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, Peter Xu
 <peterx@redhat.com>, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Qemu interrupt-remap fault support
Message-ID: <20230113095117.1d48c9c2.alex.williamson@redhat.com>
In-Reply-To: <aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org>
References: <aaef9961d210ac1873153bf3cf01d984708744fc.camel@infradead.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Fri, 13 Jan 2023 09:08:38 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> I'm looking at interrupt remapping (because I need to hook into the
> translation somehow to add PIRQ support for Xen which translates guest
> MSIs directly to KVM_IRQ_ROUTING_XEN_EVTCHN).
> 
> Am I right in understanding that it doesn't report faults on interrupts
> which can't be translated? It attempts to translate interrupts at the
> time the table is modified (vtd_int_remap()) or when an APIC access
> actually triggers an MSI (vtd_mem_ir_write()) but in neither case does
> it actually raise a fault?

AIUI, yes.
 
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

How do we determine if we're on a new/old kernel for this?
 
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

Seems ok, but it hinges on being able to detect whether kvm consumes
the eventfd or not since and un-consumed eventfd would then look the
same as an invalid translation.  Thanks,

Alex


