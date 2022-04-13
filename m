Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBD4FFEB8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 21:09:52 +0200 (CEST)
Received: from localhost ([::1]:38490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neiND-0002fc-D0
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1neiM6-000214-Sg
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 15:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1neiM3-0003CB-SA
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 15:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649876917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGsrwxf37gsF9105m/NoMHfBzR9vbTBr+g0OSU5rjNA=;
 b=IkP9OPj1KZuJDLQLf7FY0nx1j1maM39W8CPsGdAG8Z5PubGcKTOdv7f+s8cT0w9Zj9Z0+6
 JMQSZsXhHM6ziiDEiZiX08S006gQCWKTeIBmbAVq1QyJbxBUwnFtpoiuwXYsaH3QVdKkNY
 fYZqNRsrUUPQl0357Acq5LjMCtw453w=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-HWs2w7yiMm-ZnpAYebwNVg-1; Wed, 13 Apr 2022 15:08:36 -0400
X-MC-Unique: HWs2w7yiMm-ZnpAYebwNVg-1
Received: by mail-io1-f71.google.com with SMTP id
 g11-20020a056602072b00b00645cc0735d7so1694931iox.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 12:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bGsrwxf37gsF9105m/NoMHfBzR9vbTBr+g0OSU5rjNA=;
 b=EJMUGAXF6mYoTkukZ44MVy0tdKXtlyvu4R3l9MQBAZBs5VKaJtdG6FSPH5ynHkTlQ7
 ePK39yb1CwWQ75BsLY5MVK9vChAHiPv45uzLtfNeUCPsBSvC4nJKKxbhW+g7PGXLZqpW
 bAlzixdoNQDDc5i5iVlt2y1vscMU+ULTNyGAlboJuX/TlK4TGdOTXRE59JpYQxqTs3VU
 Ydhes62Ixp+zcYqFpsUPkbbD9tzuLKEFr7CaHC5MxYwTW1Cs9GY+DCLLjsjyCktv/DPJ
 RAvgxmc1NsXgeLxduvbTNiP2rUmzM9Zy1Txu4Pl4frJPHaJsmomTg0fiGniNu1lf3zK4
 3y3Q==
X-Gm-Message-State: AOAM530ybhAFjYX/XI0ekcaTj9sYCoIhMpstAH93NmhLBSzifls7IUnS
 OgtJE9DCV+8Ept/6A4vc3nWDhByzYFufchW0CDm/z/QUdBhEoVChnCIcp3LBfFuoSr/Z8aixeLo
 Wph6TBQCrD9HP0+M=
X-Received: by 2002:a05:6e02:12c6:b0:2ca:c0e9:df8c with SMTP id
 i6-20020a056e0212c600b002cac0e9df8cmr6203396ilm.232.1649876915943; 
 Wed, 13 Apr 2022 12:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvXco4Q+8zCJfxFIW9hqMzRzhjoFSsmUcDmI9hxSZQ6qBW2+0ktxU10JR3p312XrDpEvg9hg==
X-Received: by 2002:a05:6e02:12c6:b0:2ca:c0e9:df8c with SMTP id
 i6-20020a056e0212c600b002cac0e9df8cmr6203371ilm.232.1649876915672; 
 Wed, 13 Apr 2022 12:08:35 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a056602150e00b0064d30c94155sm487839iow.37.2022.04.13.12.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 12:08:35 -0700 (PDT)
Date: Wed, 13 Apr 2022 15:08:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YlcfsWyiRKPKmJUV@xz-m1.local>
References: <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
 <YkRSvDscyY+c+9yM@xz-m1.local>
 <YkSAeJTGAdYkYC09@stefanha-x1.localdomain>
 <YkSPnw2Z+980+dhF@xz-m1.local>
 <YkV4tfgh3yD3uGMG@stefanha-x1.localdomain>
 <YkWhXUI/Vr7++1ru@xz-m1.local> <20220413163735.5321c2ec@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220413163735.5321c2ec@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Apr 13, 2022 at 04:37:35PM +0200, Igor Mammedov wrote:
> On Thu, 31 Mar 2022 08:41:01 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > On Thu, Mar 31, 2022 at 10:47:33AM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Mar 30, 2022 at 01:13:03PM -0400, Peter Xu wrote:  
> > > > On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:  
> > > > > On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:  
> > > > > > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:  
> > > > > > > This makes me wonder whether there is a deeper issue with the
> > > > > > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > > > > > Per-device IOMMU resources should be freed when a device is hot
> > > > > > > unplugged.
> > > > > > > 
> > > > > > > From what I can tell this is not the case today:
> > > > > > > 
> > > > > > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > > > > > >   address spaces but I can't find where they are removed and freed.
> > > > > > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> > > > > > > 
> > > > > > > - hw/i386/amd_iommu.c has similar leaks.  
> > > > > > 
> > > > > > AFAICT it's because there's no device-specific data cached in the
> > > > > > per-device IOMMU address space, at least so far.  IOW, all the data
> > > > > > structures allocated here can be re-used when a new device is plugged in
> > > > > > after the old device unplugged.
> > > > > > 
> > > > > > It's definitely not ideal since after unplug (and before a new device
> > > > > > plugged in) the resource is not needed at all so it's kind of wasted, but
> > > > > > it should work functionally.  If to achieve that, some iommu_unplug() or
> > > > > > iommu_cleanup() hook sounds reasonable.  
> > > > > 
> > > > > I guess the question is whether PCI busses can be hotplugged with
> > > > > IOMMUs. If yes, then there is a memory leak that matters for
> > > > > intel_iommu.c and amd_iommu.c.  
> > > > 
> > > > It can't, and we only support one vIOMMU so far for both (commit
> > > > 1b3bf13890fd849b26).  Thanks,  
> > > 
> > > I see, thanks!
> > > 
> > > Okay, summarizing options for the vfio-user IOMMU:
> > > 
> > > 1. Use the same singleton approach as existing IOMMUs where the
> > >    MemoryRegion/AddressSpace are never freed. Don't bother deleting.
> > > 
> > > 2. Keep the approach in this patch where vfio-user code manually calls a
> > >    custom delete function (not part of the pci_setup_iommu() API). This
> > >    is slightly awkward to do without global state and that's what
> > >    started this discussion.
> > > 
> > > 3. Introduce an optional pci_setup_iommu() callback:
> > > 
> > >    typdef void (*PCIIOMMUDeviceUnplug)(PCIBus *bus, void *opaque, int devfn);
> > > 
> > >    Solves the awkwardness of option #2. Not needed by existing IOMMU
> > >    devices.  
> > 
> > Looks all workable to me.  One tiny thing is if we'd like 3) we may want to
> > pass over the PCIDevice* too because in this case IIUC we'd need to double
> > check the device class before doing anything - we may not want to call the
> > vfio-user callbacks for general emulated devices under the same pci bus.
> > 
> > I think we could also fetch that from PCIBus.devices[devfn] but that's just
> > not as obvious.
> > 
> > Option 4) is as mentioned previously, that we add another device unplug
> > hook that can be registered per-device.  I just didn't think thoroughly on
> can you expand on why per device hook is needed?

E.g. when the pci bus that contains the vfio-user device also contains
another emulated device?  Then IIUC we only want to call the vfio-user hook
for the vfio-user device, not the rest ones on the same bus?

Per-bus will work too, but again then the per-bus hook will need to first
identify the PCIDevice* object so it'll work similarly as a per-device hook.

> 
> > how it would interact with the current HotplugHandler design yet.. it looks
> > quite similar but so far it's either for the machine type or pci bus, not
> > capable of registering on one single device (and it's always a mistery to
> > me why we'd rather ignore the per-bus hook if the machine hook
> > existed.. that's in qdev_get_hotplug_handler).
> 
> machine hook is there for bus-less devices mainly, if it's not defined
> code will fallback to bus handler if any exists.
> 
> However machine hook can also be used to override default hotplug chain
> to do to implement non trivial plug/unplug flow.
> for example see pc_get_hotplug_handler(), corresponding
> pc_machine_device_[pre_plug|plug|unplug...]_cb() where
> plug/unplug chain is altered for some PCI devices types.
> Perhaps the same can be done for vfio.

It just seems non-obvious, no?  For example, if someone implementes a pci
bus with hotplug_handler() being provided, it will surprise me a bit if
it's triggered conditionally, depending on which machine type the bus is
attached to, and whether this machine type has get_hotplug_handler().

Thanks,

-- 
Peter Xu


