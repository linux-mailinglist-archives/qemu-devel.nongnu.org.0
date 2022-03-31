Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2113C4ED9D8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:48:49 +0200 (CEST)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZuEJ-0001ly-MD
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:48:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZu6v-0003yc-1E
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZu6t-0003An-9s
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648730466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uW3kbt2PXffiNu7InbMN1vNyvMAuF3A6GVvFMfh2k6Y=;
 b=dOSA0d09fnDYqBnlBpUdeB320Jzk/NA6NKnhDWpfP9qEdeCdBV3jHMzJ3hLbWH4ZSjcbEY
 4Tkt2+0zwaT3vHdofPBQWKPHnYwtqbr4G04VWPn0q1Oywv/P/3s7DVZRKpFGCsAiLdE3XK
 FvT/wMhQOHPGGXBnwoaEH2qEhX7udNU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-4grkiJqqM3ucrlw22WUSkw-1; Thu, 31 Mar 2022 08:41:04 -0400
X-MC-Unique: 4grkiJqqM3ucrlw22WUSkw-1
Received: by mail-qv1-f71.google.com with SMTP id
 t16-20020ad44850000000b00440e0f2a561so18413590qvy.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uW3kbt2PXffiNu7InbMN1vNyvMAuF3A6GVvFMfh2k6Y=;
 b=VPZfQYNEFbQocqE6D8N3h/lqZZi+5d54Jr/1Sxzo9pWzzg4SK9JcL24TZX7zHeVDQW
 y0iGD0Sdwk8wTjkx5Ni5/fPQdoJJvD0BbY0tUhJ/abnW6FRgODsl3vlBbz08IUUd+tH2
 xvJVFFOIG0n/mO6NYPnhCTGQPfHoDnip7R2jqyODtI8t71ttICXgZIYuAuOKOWGHuF08
 ZstQhxVc2NMn0laSmJAYb/VVCeaVI0h2BI7unasoaCY7A26rodKrvDQR4ybkgKSUAaSq
 2KBTTByD0J5X/GCZ9TW2+BMeLy/1IpemsobSOm4H75F41t444X7/ixgu/xJ/CBhbodE/
 Ao+g==
X-Gm-Message-State: AOAM5302Q3ONaPHGzVipxuQrhxwXcmSqG/Qm/WdqSOCGnzRjxSS2lfUt
 nV5gvbi44Nn2Uah0BtRdACAQUDJURcR/gge2Yr9uW3j1RXZb/LFnY60pQHdcIW5y9E6BgZ45A6x
 IASRHdzPgsaX6m8E=
X-Received: by 2002:a05:622a:178e:b0:2e0:64e4:9abb with SMTP id
 s14-20020a05622a178e00b002e064e49abbmr4116509qtk.374.1648730464224; 
 Thu, 31 Mar 2022 05:41:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ9AM9fNnPSgEmxykL2awOKyjuV0kIExva+QNzg2QmwdP2BpTZwhczw1/gpXLOYqIJmfErRw==
X-Received: by 2002:a05:622a:178e:b0:2e0:64e4:9abb with SMTP id
 s14-20020a05622a178e00b002e064e49abbmr4116484qtk.374.1648730463887; 
 Thu, 31 Mar 2022 05:41:03 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a288100b0067b1be3201bsm11975534qkp.112.2022.03.31.05.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 05:41:03 -0700 (PDT)
Date: Thu, 31 Mar 2022 08:41:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkWhXUI/Vr7++1ru@xz-m1.local>
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
MIME-Version: 1.0
In-Reply-To: <YkV4tfgh3yD3uGMG@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 10:47:33AM +0100, Stefan Hajnoczi wrote:
> On Wed, Mar 30, 2022 at 01:13:03PM -0400, Peter Xu wrote:
> > On Wed, Mar 30, 2022 at 05:08:24PM +0100, Stefan Hajnoczi wrote:
> > > On Wed, Mar 30, 2022 at 08:53:16AM -0400, Peter Xu wrote:
> > > > On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:
> > > > > This makes me wonder whether there is a deeper issue with the
> > > > > pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> > > > > Per-device IOMMU resources should be freed when a device is hot
> > > > > unplugged.
> > > > > 
> > > > > From what I can tell this is not the case today:
> > > > > 
> > > > > - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
> > > > >   address spaces but I can't find where they are removed and freed.
> > > > >   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> > > > > 
> > > > > - hw/i386/amd_iommu.c has similar leaks.
> > > > 
> > > > AFAICT it's because there's no device-specific data cached in the
> > > > per-device IOMMU address space, at least so far.  IOW, all the data
> > > > structures allocated here can be re-used when a new device is plugged in
> > > > after the old device unplugged.
> > > > 
> > > > It's definitely not ideal since after unplug (and before a new device
> > > > plugged in) the resource is not needed at all so it's kind of wasted, but
> > > > it should work functionally.  If to achieve that, some iommu_unplug() or
> > > > iommu_cleanup() hook sounds reasonable.
> > > 
> > > I guess the question is whether PCI busses can be hotplugged with
> > > IOMMUs. If yes, then there is a memory leak that matters for
> > > intel_iommu.c and amd_iommu.c.
> > 
> > It can't, and we only support one vIOMMU so far for both (commit
> > 1b3bf13890fd849b26).  Thanks,
> 
> I see, thanks!
> 
> Okay, summarizing options for the vfio-user IOMMU:
> 
> 1. Use the same singleton approach as existing IOMMUs where the
>    MemoryRegion/AddressSpace are never freed. Don't bother deleting.
> 
> 2. Keep the approach in this patch where vfio-user code manually calls a
>    custom delete function (not part of the pci_setup_iommu() API). This
>    is slightly awkward to do without global state and that's what
>    started this discussion.
> 
> 3. Introduce an optional pci_setup_iommu() callback:
> 
>    typdef void (*PCIIOMMUDeviceUnplug)(PCIBus *bus, void *opaque, int devfn);
> 
>    Solves the awkwardness of option #2. Not needed by existing IOMMU
>    devices.

Looks all workable to me.  One tiny thing is if we'd like 3) we may want to
pass over the PCIDevice* too because in this case IIUC we'd need to double
check the device class before doing anything - we may not want to call the
vfio-user callbacks for general emulated devices under the same pci bus.

I think we could also fetch that from PCIBus.devices[devfn] but that's just
not as obvious.

Option 4) is as mentioned previously, that we add another device unplug
hook that can be registered per-device.  I just didn't think thoroughly on
how it would interact with the current HotplugHandler design yet.. it looks
quite similar but so far it's either for the machine type or pci bus, not
capable of registering on one single device (and it's always a mistery to
me why we'd rather ignore the per-bus hook if the machine hook
existed.. that's in qdev_get_hotplug_handler).

Copying Igor too.

-- 
Peter Xu


