Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7843C53D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:32:42 +0200 (CEST)
Received: from localhost ([::1]:57140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfeMT-0001kt-3j
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfeKQ-0000wA-35
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfeKL-0006dq-FG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635323428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAJ0cBCoccNPd+jHwJfcXkY26hRom77CMQrMIcJUdZk=;
 b=bAUcFMHVCODZYjJIkfJtSProU8Sk+uYx2BRL/Qv6d0wrWvuntEnNNK3CLHpG/NPqQXVQN7
 NDmKo34B3liOCUBg2+aKfh5CkST5kGz++Cqk4QXPf4l4wii4wxym8fwhGBJyPaCKmXVdAT
 kOooR79JubYeEAzN7WO9c2ZBrJq/SIY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-he0NWMR_OTKsSHHChxDC3w-1; Wed, 27 Oct 2021 04:30:26 -0400
X-MC-Unique: he0NWMR_OTKsSHHChxDC3w-1
Received: by mail-pg1-f197.google.com with SMTP id
 r25-20020a63a019000000b002a20656994dso1249304pge.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qAJ0cBCoccNPd+jHwJfcXkY26hRom77CMQrMIcJUdZk=;
 b=7xv5exh+XvV2kXpXM0jwCWEp27SOaMvvW7KuzHQ+PiuR6A5EURPH+6v2md6I6BPsXu
 8Oj0v0+vQ1fcv4vAvKL8CNWMUpWNebv5F9zXSmAtzjrv5XjZqECSKEBhAmL6WTFvzGOK
 7m3+D90tuDQnG54j58ZxqcVH0DMIAuUqOviLmL9pkyGR8POGoAZoyAoXoa1xogtI2Dem
 ZG0lDL4cE6vUFWFf3Q5FbDPW867fXgIlZV6pcGUSjlpqf0mEDFdtDb9E70Br1ruSNzSO
 8H5Dq+uX+nTG5UDkorV25RZ3PTIf2IZK7mI4UNvwGtviN1jDsqfo3hvDMzrfglSX4eX1
 gtzg==
X-Gm-Message-State: AOAM5332++7S01rzff8C1scUky74XIWLY4Zi/Tp+8QiRvAouAN64NI8j
 bnmPZEFmYsylCVyigSTXH5Qdsh0Mni1Q/OdMBCEFjwJDtdejb5Xg9v5jW9iysmzXk4Kl6Jl/PgT
 0GB68TzCPdgdqyfU=
X-Received: by 2002:a17:90b:4a8d:: with SMTP id
 lp13mr4405652pjb.32.1635323425384; 
 Wed, 27 Oct 2021 01:30:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCUGRhYf/ozRbljxUOJvGG93URrbSAgxz6JMK7tfcqWAwFSmtE6KAoPhhlJMAPBTc1/WEHVQ==
X-Received: by 2002:a17:90b:4a8d:: with SMTP id
 lp13mr4405611pjb.32.1635323424959; 
 Wed, 27 Oct 2021 01:30:24 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id c25sm24937193pfn.159.2021.10.27.01.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:30:23 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:30:18 +0800
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
Message-ID: <YXkOGqA02mm/1vQv@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
 <20211021163039.324e92b1.alex.williamson@redhat.com>
 <YXIehUnQUZ/Odgw7@xz-m1.local> <20211026171139.30bf0c80@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026171139.30bf0c80@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 05:11:39PM +0200, Igor Mammedov wrote:
> On Fri, 22 Oct 2021 10:14:29 +0800
> Peter Xu <peterx@redhat.com> wrote:
> 
> > Hi, Alex,
> > 
> > On Thu, Oct 21, 2021 at 04:30:39PM -0600, Alex Williamson wrote:
> > > On Thu, 21 Oct 2021 18:42:59 +0800
> > > Peter Xu <peterx@redhat.com> wrote:
> > >   
> > > > Scan the pci bus to make sure there's no vfio-pci device attached before vIOMMU
> > > > is realized.  
> > > 
> > > Sorry, I'm not onboard with this solution at all.
> > > 
> > > It would be really useful though if this commit log or a code comment
> > > described exactly the incompatibility for which vfio-pci devices are
> > > being called out here.  Otherwise I see this as a bit of magic voodoo
> > > that gets lost in lore and copied elsewhere and we're constantly trying
> > > to figure out specific incompatibilities when vfio-pci devices are
> > > trying really hard to be "just another device".  
> > 
> > Sure, I can enrich the commit message.
> > 
> > > 
> > > I infer from the link of the previous alternate solution that this is
> > > to do with the fact that vfio devices attach a memory listener to the
> > > device address space.  
> > 
> > IMHO it's not about the memory listeners, I think that' after vfio detected
> > some vIOMMU memory regions already, which must be based on an vIOMMU address
> > space being available.  I think the problem is that when realize() vfio-pci we
> > fetch the dma address space specifically for getting the vfio group, while that
> > could happen too early, even before vIOMMU is created.
> > 
> > > Interestingly that previous cover letter also discusses how vdpa devices
> > > might have a similar issue, which makes it confusing again that we're calling
> > > out vfio-pci devices by name rather than for a behavior.  
> > 
> > Yes I'll need to see whether this approach will be accepted first.  I think
> > similar thing could help VDPA but it's not required there because VDPA has
> > already worked around using pci_device_iommu_address_space().  So potentially
> > the only one to "fix" is the vfio-pci device using along with vIOMMU, when the
> > device ordering is specified in the wrong order.  I'll leave the VDPA problem
> > to Jason to see whether he prefers keeping current code, or switch to a simpler
> > one.  That should be after this one.
> > 
> > > 
> > > If the behavior here is that vfio-pci devices attach a listener to the
> > > device address space, then that provides a couple possible options.  We
> > > could look for devices that have recorded an interest in their address
> > > space, such as by setting a flag on PCIDevice when someone calls
> > > pci_device_iommu_address_space(), where we could walk all devices using
> > > the code in this series to find a device with such a flag.  
> > 
> > Right, we can set a flag for all the pci devices that needs to consolidate
> > pci_device_iommu_address_space() result, however then it'll be vfio-pci only so
> > far.  Btw, I actually proposed similar things two months ago, and I think Igor
> > showed concern on that flag being vague on meaning:
> 
> (1)
> > https://lore.kernel.org/qemu-devel/20210906104915.7dd5c934@redhat.com/
> 
> > 
> >   > > Does it need to be a pre_plug hook?  I thought we might just need a flag in the
> >   > > pci device classes showing that it should be after vIOMMUs, then in vIOMMU
> >   > > realize functions we walk pci bus to make sure no such device exist?
> >   > > 
> >   > > We could have a base vIOMMU class, then that could be in the realize() of the
> >   > > common class.  
> >   > 
> >   > We basically don't know if device needs IOMMU or not and can work
> >   > with/without it just fine. In this case I'd think about IOMMU as board
> >   > feature that morphs PCI buses (some of them) (address space, bus numers, ...).
> >   > So I don't perceive any iommu flag as a device property at all.
> >   > 
> >   > As for realize vs pre_plug, the later is the part of abstract realize
> >   > (see: device_set_realized) and is already used by some PCI infrastructure:
> >   >   ex: pcie_cap_slot_pre_plug_cb/spapr_pci_pre_plug  
> > 
> > I still think that flag will work, that flag should only shows "whether this
> > device needs to be specified earlier than vIOMMU", but I can get the point from
> > Igor that it's at least confusing on what does the flag mean.
> 
> > Meanwhile I
> > don't think that flag will be required, as this is not the first time we name a
> > special device in the code, e.g. pc_machine_device_pre_plug_cb().
> > intel_iommu.c has it too upon vfio-pci already on making sure caching-mode=on
> > in vtd_machine_done_notify_one().
> 
> I pointed to specifically to _pre_plug() handler and not as
> implemented here in realize().
> Reasoning behind it is that some_device_realize() should not poke
> into other devices, while pc_machine_device_pre_plug_cb() is
> part of machine code can/may legitimately access its child devices and verify/
> configure them. (Hence I'd drop my suggested-by with current impl.)

I see, I didn't try that because I see that q35 even does not have pre_plug()
installed yet, so I need to add it in the same patchset, am I right?

Frankly I've also no idea why pc has the pre_plug() but not q35.. But if you
think that matters then I can try.

>  
> > If Igor is okay with adding such a flag for PCIDevice class, I can do that in
> > the new version.  I don't have a strong opinion on this.
> 
> Also, I've suggested to use pre_plug only as the last resort in case
> vfio-pci can't be made independent of the order (see [1] for reset time
> suggestion).
> So why 'reset' approach didn't work out?
> (this need to be cover letter/commit message as a reason why
> we are resorting to a hack)

As explained by Alex, I think that's more challenging and it was discussed
quite a few times before, so I didn't mention that in cover letter.

Sorry I should have mentioned some of it.

-- 
Peter Xu


