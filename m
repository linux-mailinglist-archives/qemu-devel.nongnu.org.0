Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8E43B5FF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:47:29 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOfg-0001TV-VJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mfOXR-0001HF-Sa
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mfOXO-0001J3-3d
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635262732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/bpDAAT9L+OKLWuEmhCJz2vYbwojbi+c837CgHwMao=;
 b=Ka4poDBKRIOQ4R8iszdKXcXRCsik/arXdKypiCE9MS/GkTBtHzc93XUMr5artOGQLUQJnt
 IipmQelBw70AohDh5rjThEGnVf3K4LRfM9uyPhOIYns/+4yyyp0kBx+uMO2igeX4dS30mN
 FV8n7CLluGodaHwdVNuJKnomg3ZeS5w=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-R_GfTvGwOxeFUEtWaxrQmQ-1; Tue, 26 Oct 2021 11:38:47 -0400
X-MC-Unique: R_GfTvGwOxeFUEtWaxrQmQ-1
Received: by mail-ot1-f71.google.com with SMTP id
 g17-20020a05683030b100b00552dffc33e5so9225181ots.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/bpDAAT9L+OKLWuEmhCJz2vYbwojbi+c837CgHwMao=;
 b=yenDcZDYQazTnTNuVOoNOX+r6S3RV07ky2t2DQSXqjA577tt5a5lDX85FR4uItMrkD
 bD0QweF2Y7wRHwB527o0mn3aalEw8NTcI5ciZHWs3mWRGv3xkcGTfHaKp06tdT9U7MVM
 qvsgzo0OoAA2pfjyrVrH5krfsNO3XNzeTZzLGOrbGXmuc1Kq+HZR6UO0lfL742qIe/cB
 RAsq/9GUze0+MCdpKcJ2DVdSvaCy1ipBtr9BeSY7QJgIzmGnzlGEKnP9qu2oY0vIdMPT
 tou9N6aMI5tZmErlXxUk1T8OyfJcIhEk2ByIhUjq+jLy6M+6AEph3HXyEwkXN7fMECWB
 SSiQ==
X-Gm-Message-State: AOAM531XMkOwLy3FqkW3TqHJPaqakoPUZRyeYxfhB9PwQI4N3ZYupTN5
 VZDt+KDs5iQlL0w4Pbfi4i8yBuiTT6AnozBy4TWflWHvhOFQsHvoFys1P2eBtY9AFy/G5msd/n4
 lVju9MwV0Jkol+D0=
X-Received: by 2002:a9d:5548:: with SMTP id h8mr7747362oti.241.1635262726942; 
 Tue, 26 Oct 2021 08:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSG66nu79Qg+Z1UF4cTdcnpqAelAhcK7HkHmLTuoyWutsdaFxNOfj6etPKUXsht15mE+dFyQ==
X-Received: by 2002:a9d:5548:: with SMTP id h8mr7747324oti.241.1635262726631; 
 Tue, 26 Oct 2021 08:38:46 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id a42sm2001909ooj.37.2021.10.26.08.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:38:46 -0700 (PDT)
Date: Tue, 26 Oct 2021 09:38:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
Message-ID: <20211026093845.0bdb0f5f.alex.williamson@redhat.com>
In-Reply-To: <20211026171139.30bf0c80@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
 <20211021163039.324e92b1.alex.williamson@redhat.com>
 <YXIehUnQUZ/Odgw7@xz-m1.local> <20211026171139.30bf0c80@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 17:11:39 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

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

Attaching MemoryListeners is not a lightweight process, that's where we
get the replay of device mappings and where the IOMMU will pin and map
all of the VM address space for the device.  Minimally, we'd need to
condition this setup based on the previous device address space such
that it's only affected on changes.  That probably leans more towards a
machine-init-done notifier to setup the listeners (assuming those work
correctly for hot-plug).

However, device address space is synonymous with the vfio container
used for a device.  In order to gain access to a vfio device, the vfio
group must first be placed into an IOMMU context, aka container.
Therefore that would imply that essentially the entire realize function
of a vfio device would move to a machine-init-done handler because we
can't actually access the device until we know the address space such
that we can place the group into a container.  Creating a container per
device which is attached to an address space at machine-init-done time
is also not practical as that incurs duplicate mapping overhead (time
and space) and locked memory accounting issues that we already struggle
with in the vIOMMU case.

There might be other issues, but that alone seems pretty impractical
for what seems like it ought not be such a taboo operation during
realize, to simply care about the device address space.  Thanks,

Alex


