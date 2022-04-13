Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A534FF917
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 16:39:37 +0200 (CEST)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nee9f-0000YE-V4
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 10:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nee7r-0007tv-Pc
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nee7p-00071n-Kz
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 10:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649860660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z6nP4REsayRJXlFBLR0SOCWOJQ3prc3YUwxd1Mvd4G4=;
 b=CazfkLW0+cP/Ii2TlZTOZr4szLB8STIy1BmTc4Gdk2lYDIk+7Jl1t7qHdPo4DZcPgxD+ju
 iBpqTNJQHXXcQXAKNdfwXY//xG2jp5olMB1iMjHBAneMzNdI2F6uGe5swnWgBAeG8Hb3cm
 GkLnPAWY0d+j9VGXUrxrWnRjwl6f1QQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-32alYlYhMM-zrmgRcgarWQ-1; Wed, 13 Apr 2022 10:37:39 -0400
X-MC-Unique: 32alYlYhMM-zrmgRcgarWQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 n4-20020a5099c4000000b00418ed58d92fso1209057edb.0
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 07:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6nP4REsayRJXlFBLR0SOCWOJQ3prc3YUwxd1Mvd4G4=;
 b=F4qlZ52YCnedtTlBoYyLpY124hARnc2durkYYEDmy/oUwrKn6ldbqbnBUbo56d3oPf
 Z8vV7pkudY98OkuN/YKeDvctrd2LIFGt+AcUJVHu1oFSvQeI8leAVy77FA48WZIoknci
 gqaLOvNSKC3ZuTvLRE/N3ktdS0NFRJZC1bVqo/hbGknpcnGjd0L6QJAjzEKp/47ZBQtb
 Tb2JVrsi6MxG3UQ7EGS65Y3i7x8a2BbHqkFa7Jdwhi00fEvVbkwnLusNMxdLdySypUTY
 wOgXGaadJA9bNex2dxA9mHhEypC3yt4fPA8IGzXgD11qvDLeEiYEFX9OjkLPioZmudVN
 XxzA==
X-Gm-Message-State: AOAM531igSa2jFazmVLmffGPBnbuzngZyV8af6DjLJvW+Ew11Pnsp8j0
 RoP1vrSK0zkjkD2mF6HYq/erolWgUyhaqDTSYcgzxm1qi7xqc4m67f4P0grNNMVelTDswp8g3op
 0xkQE1Q6bKArqhN4=
X-Received: by 2002:a17:906:c092:b0:6cd:f3a1:a11e with SMTP id
 f18-20020a170906c09200b006cdf3a1a11emr38217140ejz.185.1649860658159; 
 Wed, 13 Apr 2022 07:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyEKmwUQepaB3lXmbhRJKw9GYimEi9TFKKQgWhbBgUgLjqzP69J+KsN4eJ0m3kPWAuWVv0Gg==
X-Received: by 2002:a17:906:c092:b0:6cd:f3a1:a11e with SMTP id
 f18-20020a170906c09200b006cdf3a1a11emr38217095ejz.185.1649860657827; 
 Wed, 13 Apr 2022 07:37:37 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1709063bc800b006e898cfd926sm49493ejf.134.2022.04.13.07.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 07:37:37 -0700 (PDT)
Date: Wed, 13 Apr 2022 16:37:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <20220413163735.5321c2ec@redhat.com>
In-Reply-To: <YkWhXUI/Vr7++1ru@xz-m1.local>
References: <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
 <YkRSvDscyY+c+9yM@xz-m1.local>
 <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
 <YkSPnw2Z+980+dhF@xz-m1.local>
 <YkV4tfgh3yD3uGMG@stefanha-x1.localdomain>
 <YkWhXUI/Vr7++1ru@xz-m1.local>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 08:41:01 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Mar 31, 2022 at 10:47:33AM +0100, Stefan Hajnoczi wrote:
> > On Wed, Mar 30, 2022 at 01:13:03PM -0400, Peter Xu wrote:  
> > > On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:  
> > > > On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:  
> > > > > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:  
> > > > > > This makes me wonder whether there is a deeper issue with the
> > > > > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > > > > Per-device IOMMU resources should be freed when a device is hot
> > > > > > unplugged.
> > > > > > 
> > > > > > From what I can tell this is not the case today:
> > > > > > 
> > > > > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > > > > >   address spaces but I can't find where they are removed and freed.
> > > > > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> > > > > > 
> > > > > > - hw/i386/amd_iommu.c has similar leaks.  
> > > > > 
> > > > > AFAICT it's because there's no device-specific data cached in the
> > > > > per-device IOMMU address space, at least so far.  IOW, all the data
> > > > > structures allocated here can be re-used when a new device is plugged in
> > > > > after the old device unplugged.
> > > > > 
> > > > > It's definitely not ideal since after unplug (and before a new device
> > > > > plugged in) the resource is not needed at all so it's kind of wasted, but
> > > > > it should work functionally.  If to achieve that, some iommu_unplug() or
> > > > > iommu_cleanup() hook sounds reasonable.  
> > > > 
> > > > I guess the question is whether PCI busses can be hotplugged with
> > > > IOMMUs. If yes, then there is a memory leak that matters for
> > > > intel_iommu.c and amd_iommu.c.  
> > > 
> > > It can't, and we only support one vIOMMU so far for both (commit
> > > 1b3bf13890fd849b26).  Thanks,  
> > 
> > I see, thanks!
> > 
> > Okay, summarizing options for the vfio-user IOMMU:
> > 
> > 1. Use the same singleton approach as existing IOMMUs where the
> >    MemoryRegion/AddressSpace are never freed. Don't bother deleting.
> > 
> > 2. Keep the approach in this patch where vfio-user code manually calls a
> >    custom delete function (not part of the pci_setup_iommu() API). This
> >    is slightly awkward to do without global state and that's what
> >    started this discussion.
> > 
> > 3. Introduce an optional pci_setup_iommu() callback:
> > 
> >    typdef void (*PCIIOMMUDeviceUnplug)(PCIBus *bus, void *opaque, int devfn);
> > 
> >    Solves the awkwardness of option #2. Not needed by existing IOMMU
> >    devices.  
> 
> Looks all workable to me.  One tiny thing is if we'd like 3) we may want to
> pass over the PCIDevice* too because in this case IIUC we'd need to double
> check the device class before doing anything - we may not want to call the
> vfio-user callbacks for general emulated devices under the same pci bus.
> 
> I think we could also fetch that from PCIBus.devices[devfn] but that's just
> not as obvious.
> 
> Option 4) is as mentioned previously, that we add another device unplug
> hook that can be registered per-device.  I just didn't think thoroughly on
can you expand on why per device hook is needed?

> how it would interact with the current HotplugHandler design yet.. it looks
> quite similar but so far it's either for the machine type or pci bus, not
> capable of registering on one single device (and it's always a mistery to
> me why we'd rather ignore the per-bus hook if the machine hook
> existed.. that's in qdev_get_hotplug_handler).

machine hook is there for bus-less devices mainly, if it's not defined
code will fallback to bus handler if any exists.

However machine hook can also be used to override default hotplug chain
to do to implement non trivial plug/unplug flow.
for example see pc_get_hotplug_handler(), corresponding
pc_machine_device_[pre_plug|plug|unplug...]_cb() where
plug/unplug chain is altered for some PCI devices types.
Perhaps the same can be done for vfio.

> 
> Copying Igor too.
> 


