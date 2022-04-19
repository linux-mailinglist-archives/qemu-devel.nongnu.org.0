Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC8E506733
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:52:04 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjac-0007FT-5F
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjXi-0006OO-JA
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjXe-0004tC-TW
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PotPscpFLlAQ5cKWmgd9V0wq3Pyfv3EhBGIQxeAoZ9I=;
 b=J3XnFhd/8QiuALcHA4UcU6sidIJ60NiJzK1qxRTmtWxhNt77KlV8FH0Pn5xLhjGWyyJTbk
 /y6K11PKqd5SdRLEkwZA0qfzYNITLEPLCGFtu45kVsypC23W47kX6H4bVzwa/wlSkOTl1S
 pXyA8cWTPpeLAH1UbL60y12OwtVpkXk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339--Ui2KNUUMSmAoUAFZ7P2Yg-1; Tue, 19 Apr 2022 04:48:53 -0400
X-MC-Unique: -Ui2KNUUMSmAoUAFZ7P2Yg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr36-20020a1709073fa400b006e88d626dc3so5641252ejc.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 01:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PotPscpFLlAQ5cKWmgd9V0wq3Pyfv3EhBGIQxeAoZ9I=;
 b=yZczmU1+qEzsf8PqmJGYRPgVKab6Sci/QMCPNVH13GMpdOAC+EyQvCGldsWIdbCbCl
 NAORXppdEok/MjncqGOSYE1znuw5MB0X66NJxutkCPKJ7vtYQwi3+CKm71D6lA+nB3+y
 Co8VSgEDB7umidLINBM78Ktda6wIMZmI98Z2k1NrNaWB/aTSvb8RVjTBBd29jtWyMaec
 5UO8km1K7RCEde+LI7y76vzzl32zY8YKM5c4eIIkTWeTAqD/j2v20Pklf8fOaQDgS1Bl
 L1k+7NJ7rBlF5yJ012otbU2n/TZ3iADkpkcgaURh963IKlMGgJx55WBVzr3JBqPPL+OP
 YGbQ==
X-Gm-Message-State: AOAM5339cRyq+biWWc/8lb+d1EWBuKVor7X5CHuwwdkc4MJoWe0+kTdD
 fnR+ihvo6RXB7HhZkzXZYpDEC3yicAounZWyJcEyKQsXgYbjNVGuEY44cW7gkxDqmCLmFTRkx8v
 IWlFVEu6eQ5CkaB4=
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr12317645ejc.619.1650358132124; 
 Tue, 19 Apr 2022 01:48:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuDS60kQPCzhjnkj4e4wcUQe8+i8PbYd/kA7C1HBBpz9cqJu/VasWMpa01zLBTl31atPaFsw==
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr12317608ejc.619.1650358131847; 
 Tue, 19 Apr 2022 01:48:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 fu13-20020a170907b00d00b006e8ae97f91asm5380430ejc.64.2022.04.19.01.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:48:51 -0700 (PDT)
Date: Tue, 19 Apr 2022 10:48:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <20220419104849.0afb875f@redhat.com>
In-Reply-To: <YlcfsWyiRKPKmJUV@xz-m1.local>
References: <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
 <YkRSvDscyY+c+9yM@xz-m1.local>
 <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
 <YkSPnw2Z+980+dhF@xz-m1.local>
 <YkV4tfgh3yD3uGMG@stefanha-x1.localdomain>
 <YkWhXUI/Vr7++1ru@xz-m1.local> <20220413163735.5321c2ec@redhat.com>
 <YlcfsWyiRKPKmJUV@xz-m1.local>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LONGWORDS=2.035, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 13 Apr 2022 15:08:33 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Wed, Apr 13, 2022 at 04:37:35PM +0200, Igor Mammedov wrote:
> > On Thu, 31 Mar 2022 08:41:01 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> >   
> > > On Thu, Mar 31, 2022 at 10:47:33AM +0100, Stefan Hajnoczi wrote:  
> > > > On Wed, Mar 30, 2022 at 01:13:03PM -0400, Peter Xu wrote:    
> > > > > On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:    
> > > > > > On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:    
> > > > > > > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:    
> > > > > > > > This makes me wonder whether there is a deeper issue with the
> > > > > > > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > > > > > > Per-device IOMMU resources should be freed when a device is hot
> > > > > > > > unplugged.
> > > > > > > > 
> > > > > > > > From what I can tell this is not the case today:
> > > > > > > > 
> > > > > > > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > > > > > > >   address spaces but I can't find where they are removed and freed.
> > > > > > > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> > > > > > > > 
> > > > > > > > - hw/i386/amd_iommu.c has similar leaks.    
> > > > > > > 
> > > > > > > AFAICT it's because there's no device-specific data cached in the
> > > > > > > per-device IOMMU address space, at least so far.  IOW, all the data
> > > > > > > structures allocated here can be re-used when a new device is plugged in
> > > > > > > after the old device unplugged.
> > > > > > > 
> > > > > > > It's definitely not ideal since after unplug (and before a new device
> > > > > > > plugged in) the resource is not needed at all so it's kind of wasted, but
> > > > > > > it should work functionally.  If to achieve that, some iommu_unplug() or
> > > > > > > iommu_cleanup() hook sounds reasonable.    
> > > > > > 
> > > > > > I guess the question is whether PCI busses can be hotplugged with
> > > > > > IOMMUs. If yes, then there is a memory leak that matters for
> > > > > > intel_iommu.c and amd_iommu.c.    
> > > > > 
> > > > > It can't, and we only support one vIOMMU so far for both (commit
> > > > > 1b3bf13890fd849b26).  Thanks,    
> > > > 
> > > > I see, thanks!
> > > > 
> > > > Okay, summarizing options for the vfio-user IOMMU:
> > > > 
> > > > 1. Use the same singleton approach as existing IOMMUs where the
> > > >    MemoryRegion/AddressSpace are never freed. Don't bother deleting.
> > > > 
> > > > 2. Keep the approach in this patch where vfio-user code manually calls a
> > > >    custom delete function (not part of the pci_setup_iommu() API). This
> > > >    is slightly awkward to do without global state and that's what
> > > >    started this discussion.
> > > > 
> > > > 3. Introduce an optional pci_setup_iommu() callback:
> > > > 
> > > >    typdef void (*PCIIOMMUDeviceUnplug)(PCIBus *bus, void *opaque, int devfn);
> > > > 
> > > >    Solves the awkwardness of option #2. Not needed by existing IOMMU
> > > >    devices.    
> > > 
> > > Looks all workable to me.  One tiny thing is if we'd like 3) we may want to
> > > pass over the PCIDevice* too because in this case IIUC we'd need to double
> > > check the device class before doing anything - we may not want to call the
> > > vfio-user callbacks for general emulated devices under the same pci bus.
> > > 
> > > I think we could also fetch that from PCIBus.devices[devfn] but that's just
> > > not as obvious.
> > > 
> > > Option 4) is as mentioned previously, that we add another device unplug
> > > hook that can be registered per-device.  I just didn't think thoroughly on  
> > can you expand on why per device hook is needed?  
> 
> E.g. when the pci bus that contains the vfio-user device also contains
> another emulated device?  Then IIUC we only want to call the vfio-user hook
> for the vfio-user device, not the rest ones on the same bus?
> 
> Per-bus will work too, but again then the per-bus hook will need to first
> identify the PCIDevice* object so it'll work similarly as a per-device hook.

Question is if hook is really needed,
and why doing cleanup in vfio-usr.unrealize() is not sufficient.

also there are realize/unrealize listener hooks, that could
help to hook random code to plug/unplug workflow as the last resort
(i.e. avoid properly dividing responsibility between emulated
device models) on top of that it doesn't have any error handling
so hooks must not fail ever.

(also it's generic vfio issue as it's written as a mix of backend+frontend
code which is confusing at times and makes it hard to distinguish what
belongs where (unless one has an intimate knowledge of how it should
be working))

> > > how it would interact with the current HotplugHandler design yet.. it looks
> > > quite similar but so far it's either for the machine type or pci bus, not
> > > capable of registering on one single device (and it's always a mistery to
> > > me why we'd rather ignore the per-bus hook if the machine hook
> > > existed.. that's in qdev_get_hotplug_handler).  
> > 
> > machine hook is there for bus-less devices mainly, if it's not defined
> > code will fallback to bus handler if any exists.
> > 
> > However machine hook can also be used to override default hotplug chain
> > to do to implement non trivial plug/unplug flow.
> > for example see pc_get_hotplug_handler(), corresponding
> > pc_machine_device_[pre_plug|plug|unplug...]_cb() where
> > plug/unplug chain is altered for some PCI devices types.
> > Perhaps the same can be done for vfio.  
> 
> It just seems non-obvious, no?  For example, if someone implementes a pci
> bus with hotplug_handler() being provided, it will surprise me a bit if
> it's triggered conditionally, depending on which machine type the bus is
> attached to, and whether this machine type has get_hotplug_handler().

bus level handler is called anyways, with the difference that plug/unplug
flow could be additionally redirected to other relevant components.

It might be confusing at the beginning, the idea behind, having single
entry point to override flow at machine level, is that it's the top most
object that governs all other devices, wires them together and is allowed
to reshape default wiring between attached devices without violating
relationship between components. (drawback is that approach adds quite
a bit of boilerplate, but no one has suggested/implemented any other
idea for generic device wiring).

Adding specialized hooks to generic bus code for a random device quirks
might work too, but it's not obvious either, scattered through codebase
often polluting  generic code with device specific workarounds, dn it's
harder to review/judge if proposed hook is not just another layer
violation.
Well I don't know enough about vfio/iommu to make useful suggestion
but adding to generic PCI bus/device vfio induced hooks does look
suspicious to me.


> Thanks,
> 


