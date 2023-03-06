Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4E6AC85B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDsQ-0005Vm-6H; Mon, 06 Mar 2023 11:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZDsN-0005JN-Iz
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZDsL-0005r7-Rt
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678120788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCoHfPlUz/5zP35W6Ct5KxJjOY9DIhJVEZPb5DtvIZw=;
 b=KR1HzDAKPzapMu5ybtWF4Ac2oeElOM0VwH1izdCbkTXD22P9j4+46qn7pa6ZFJrWkWcLba
 jVPn9tKSaweU+/y2QV968D8oFUyTbz6648PggUebUUoVld791mKw3XVO+Uep9GeXyMzsF6
 7psD+wTFAEqwVd0Ixaec7NtLeZpPASQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-i-FribvgN2SFXV0o0D6nOg-1; Mon, 06 Mar 2023 11:39:47 -0500
X-MC-Unique: i-FribvgN2SFXV0o0D6nOg-1
Received: by mail-qt1-f199.google.com with SMTP id
 p7-20020ac84607000000b003b9b6101f65so5480067qtn.11
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678120787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCoHfPlUz/5zP35W6Ct5KxJjOY9DIhJVEZPb5DtvIZw=;
 b=m0BFkCk5GxU5qfIM6gYLSm6XhnaMnI8arFHpz8tUYPDUlSksIMxM/C8Q6DTpjSHu04
 r/GkqQondyQ/jd0X9LV9VgKtI1wCVOiezP13xpaq/A/sr0b7puSYBaCnRNGTkyiQBMTG
 ar+K2ZDdWGLFMYEn9b2P9DD7IyXSJIQXFOy4zYqJFWyuka0rKXb2gdLmblVmqH34t/ZI
 HNto8ImCRPKX3nVHv1fYGhW/ElS6yNTVfCBDaq5QpoFTxv3VIKkU3fJAm9gOvr4BHEpV
 t2YZ2khAcBRZyrbMoafk6WxBhclRK3GbTsaOJU2diQMlYWoxP7GjahLWbIRcYhX5YIgA
 4mjw==
X-Gm-Message-State: AO0yUKWLYLtg9FyUDH4oLtneplQoeYHkHxA76jmmk5ZkFGsoT1YqeoCT
 t+dHwrO1mlZ0MdcA/05BGWCLiPFDMe/bQ5v8s0ehp0GwF755IMe7WuS22+hS0U4kzRK5iMBBnNx
 /FEQTUaLlmODuQPw=
X-Received: by 2002:ac8:5f4c:0:b0:3bf:b0c6:497b with SMTP id
 y12-20020ac85f4c000000b003bfb0c6497bmr21207340qta.2.1678120786672; 
 Mon, 06 Mar 2023 08:39:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9TReKw+aCJdnryHDYpheVUbA0Wj+ifVCu9khePNFZeoyJ6rh1QA19mfDQcKRscUnMCdNFm4w==
X-Received: by 2002:ac8:5f4c:0:b0:3bf:b0c6:497b with SMTP id
 y12-20020ac85f4c000000b003bfb0c6497bmr21207308qta.2.1678120786398; 
 Mon, 06 Mar 2023 08:39:46 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 a191-20020ae9e8c8000000b007423843d879sm7692119qkg.93.2023.03.06.08.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:39:45 -0800 (PST)
Date: Mon, 6 Mar 2023 11:39:44 -0500
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Message-ID: <ZAYXUKUtU9ipksUq@x1n>
References: <e1b97564a7728a5106134bc7063a8c62f134a45e.camel@infradead.org>
 <ZAUZYkChWfwCcfSn@x1n>
 <6E7EA2EE-382C-4345-9A2A-D61E0139FB65@infradead.org>
 <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34f494519d1921e8b62a6f3e709511a9467df54d.camel@infradead.org>
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

On Mon, Mar 06, 2023 at 09:25:35AM +0000, David Woodhouse wrote:
> On Mon, 2023-03-06 at 06:51 +0000, David Woodhouse wrote:
> > On 5 March 2023 22:36:18 GMT, Peter Xu <peterx@redhat.com> wrote:
> > > On Sun, Mar 05, 2023 at 06:43:42PM +0000, 
> > > > ---
> > > > Alternative fixes might have been just to remove the part in
> > > > ioapic_service() which delivers the IRQ via kvm_set_irq() because
> > > > surely delivering as MSI ought to work just fine anyway in all cases?
> > > > That code lacks a comment justifying its existence.
> > > 
> > > Didn't check all details, but AFAIU there're still some different paths
> > > triggered so at least it looks still clean to use the path it's for.
> > > 
> > > E.g., I think if someone traces kvm_set_irq() in kernel this specific irq
> > > triggered right after unmasking might seem to be missed misterously (but
> > > actually it was not).
> > 
> > Hm, not sure that's a reason we care about. The I/OAPIC is purely a
> > device to turn line interrupts into MSIs. Which these days need to be
> > translated by IOMMU interrupt remapping device models in userspace. I
> > don't think a user has any valid reason to expect that the kernel
> > will even know about any GSIs with any specific numbers. Tracing on
> > that in the kernel would making some dodgy assumptions.
> 
> I think if we want to fix the lack of IR translation faults from the
> IOMMU, we have to change this anyway.
> 
> At the very least, it can only use KVM to deliver the IRQ if there *is*
> a valid translation. And if not, it needs to ask the IOMMU to
> retranslate, with a 'delivering_now' flag indicating that the fault
> should be raised because this isn't a preemptive translation in
> advance.

I see that as a separate problem of what this patch wants to (rightfully)
fix.  I also agree we'll need that if e.g. we want to support ioapic in
kvm.

Sorry in advancie since I don't think I have the whole picture here.  Could
you remind me the whole purpose of having such?  Is that for part of Xen's
effort?

It was a long time ago, but IIRC such mechanism wasn't implemented when we
worked on vIOMMU IR initially, because at least at that time the "keeping
kvm irq routes always updated when IRQ entries modified" was good enough
for qemu to work with IR.

The only outlier was in-kernel ioapic, but there was a talk from Google
showing that in kernel ioapic brought mostly nothing good but more exposure
on attack surface.  It does sound reasonable since fast devices shouldn't
use ioapic at all to me, so IIRC the plan was split irqchip should be
always optimal hence no immediate concern of not supporting IR with
in-kernel ioapic.  But I definitely can miss important things along the
way.

Thanks,

-- 
Peter Xu


