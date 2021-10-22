Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF8436FEA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:21:43 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdkBi-0006Kc-Kx
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkA1-0004PS-Lr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdk9y-0003sX-MY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634869194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cVyWNTvl6rvkKC2Sns2t/riGdeEzSbyRyGm983FDBzk=;
 b=OoxRdWAUP73xhMRPed3NzMLoOrWB9ZWIT0+yN4mdFIOnq60OFtXvncjLGNNL6wd9xOvZxL
 f6Q7IXZvfvY/nokwfO4p3F0/5irjExN0j8Z3dwneaKuIHB1zDhy/0QLk5I5F8uAINXu+2T
 M3WXLmyfiGe59AoOVPf7iWcRpmH516w=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-Sdajun_mP5SREhZlXubf8Q-1; Thu, 21 Oct 2021 22:19:52 -0400
X-MC-Unique: Sdajun_mP5SREhZlXubf8Q-1
Received: by mail-pf1-f199.google.com with SMTP id
 q202-20020a6275d3000000b0044dc3987ae6so1439844pfc.12
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cVyWNTvl6rvkKC2Sns2t/riGdeEzSbyRyGm983FDBzk=;
 b=JEd+z9vlBM6fFOJWv7AH6JiuAlsv4kkjY+dojZtBprHY4hq53hNaCW0Yq/sBqYc18z
 EVmTUgvDRLGghghBnMqsk8TuguKO2Mq+wfVDPitkGi/9SdwI59VeAMRU+4jqLKFBwWll
 +p0BP1Hjatd8eKzZB/KMgAgRp1TCEgMxnwlyLJP40xAimxef6eHU603SbcuA3PtTgUev
 Xm70SwMFH4dencU5dWUTU1FW72PORc0I6VryDnJlkgi3enQi8yylgibYJTONTCIk8ZIh
 77l1CCWjz4y776jICjzodyPgA+uTG1ydLVRkvoz5n5KHAGgzHTz/Pet8VtS9tOILYBz3
 N0IA==
X-Gm-Message-State: AOAM5336LyAHL4+lkbbEw3iRCvAaef8woaZzEmRFJxCCLReXTm9rYmOR
 jfrebrg9KoLu36o9RRY7NPIG0ZF2DUewMpZTS5GuZhskYxAcd3hc8nxcyL4Gqc8B6b25dxT9m01
 qDsywh4imAKFR0d8=
X-Received: by 2002:a05:6a00:179f:b0:44d:d603:dfc8 with SMTP id
 s31-20020a056a00179f00b0044dd603dfc8mr9403062pfg.49.1634869191149; 
 Thu, 21 Oct 2021 19:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyELm8XxqmMcG/qt5Duuzb++iEbWcELGbEU6cc0hvwxtetkLP6Yvo3yTjjeLdoIaTTYENNBEw==
X-Received: by 2002:a05:6a00:179f:b0:44d:d603:dfc8 with SMTP id
 s31-20020a056a00179f00b0044dd603dfc8mr9403023pfg.49.1634869190757; 
 Thu, 21 Oct 2021 19:19:50 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.50])
 by smtp.gmail.com with ESMTPSA id v22sm7615597pff.93.2021.10.21.19.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:19:50 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:19:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/8] pci: Use pci_for_each_device_under_bus*()
Message-ID: <YXIfuQvIVTrJIdGa@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-4-peterx@redhat.com>
 <f1bdd887-975f-8d23-e933-39b95843c2b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f1bdd887-975f-8d23-e933-39b95843c2b1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 01:34:07PM +0200, Eric Auger wrote:
> Hi Peter,
> On 10/21/21 12:42 PM, Peter Xu wrote:
> > Replace all the call sites of existing pci_for_each_device*() where the bus
> > number is calculated from a PCIBus* already.  It should avoid the lookup of the
> > PCIBus again.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/i386/acpi-build.c       |  5 ++---
> >  hw/pci/pcie.c              |  4 +---
> >  hw/ppc/spapr_pci.c         | 12 +++++-------
> >  hw/ppc/spapr_pci_nvlink2.c |  7 +++----
> >  hw/ppc/spapr_pci_vfio.c    |  4 ++--
> >  hw/s390x/s390-pci-bus.c    |  5 ++---
> >  hw/xen/xen_pt.c            |  4 ++--
> >  7 files changed, 17 insertions(+), 24 deletions(-)
> >
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 81418b7911..a76b17ed92 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -2132,8 +2132,7 @@ dmar_host_bridges(Object *obj, void *opaque)
> >          PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> >  
> >          if (bus && !pci_bus_bypass_iommu(bus)) {
> > -            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
> > -                                scope_blob);
> > +            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
> >          }
> >      }
> >  
> > @@ -2339,7 +2338,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
> >          PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> >  
> >          if (bus && !pci_bus_bypass_iommu(bus)) {
> > -            pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
> > +            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
> >          }
> >      }
> >  
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 6e95d82903..914a9bf3d1 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -694,9 +694,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
> >          (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
> >          (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
> >          PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
> > -        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                            pcie_unplug_device, NULL);
> > -
> > +        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
> >          pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
> >                                       PCI_EXP_SLTSTA_PDS);
> >          if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index 7430bd6314..5bfd4aa9e5 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -1317,8 +1317,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
> >                            RESOURCE_CELLS_SIZE));
> >  
> >      assert(bus);
> > -    pci_for_each_device_reverse(bus, pci_bus_num(bus),
> > -                                spapr_dt_pci_device_cb, &cbinfo);
> > +    pci_for_each_device_under_bus_reverse(bus, spapr_dt_pci_device_cb, &cbinfo);
> >      if (cbinfo.err) {
> >          return cbinfo.err;
> >      }
> > @@ -2306,8 +2305,8 @@ static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
> >          return;
> >      }
> >  
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        spapr_phb_pci_enumerate_bridge, bus_no);
> > +    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_enumerate_bridge,
> > +                                  bus_no);
> >      pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, *bus_no, 1);
> >  }
> >  
> > @@ -2316,9 +2315,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *phb)
> >      PCIBus *bus = PCI_HOST_BRIDGE(phb)->bus;
> >      unsigned int bus_no = 0;
> >  
> > -    pci_for_each_device(bus, pci_bus_num(bus),
> > -                        spapr_phb_pci_enumerate_bridge,
> > -                        &bus_no);
> > +    pci_for_each_device_under_bus(bus, spapr_phb_pci_enumerate_bridge,
> > +                                  &bus_no);
> >  
> >  }
> >  
> > diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
> > index 8ef9b40a18..7fb0cf4d04 100644
> > --- a/hw/ppc/spapr_pci_nvlink2.c
> > +++ b/hw/ppc/spapr_pci_nvlink2.c
> > @@ -164,8 +164,7 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, PCIDevice *pdev,
> >          return;
> >      }
> >  
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        spapr_phb_pci_collect_nvgpu, opaque);
> > +    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_collect_nvgpu, opaque);
> >  }
> >  
> >  void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
> > @@ -183,8 +182,8 @@ void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
> >      sphb->nvgpus->nv2_atsd_current = sphb->nv2_atsd_win_addr;
> >  
> >      bus = PCI_HOST_BRIDGE(sphb)->bus;
> > -    pci_for_each_device(bus, pci_bus_num(bus),
> > -                        spapr_phb_pci_collect_nvgpu, sphb->nvgpus);
> > +    pci_for_each_device_under_bus(bus, spapr_phb_pci_collect_nvgpu,
> > +                                  sphb->nvgpus);
> >  
> >      if (sphb->nvgpus->err) {
> >          error_propagate(errp, sphb->nvgpus->err);
> > diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> > index f3b37df8ea..2a76b4e0b5 100644
> > --- a/hw/ppc/spapr_pci_vfio.c
> > +++ b/hw/ppc/spapr_pci_vfio.c
> > @@ -164,8 +164,8 @@ static void spapr_phb_vfio_eeh_clear_dev_msix(PCIBus *bus,
> >  
> >  static void spapr_phb_vfio_eeh_clear_bus_msix(PCIBus *bus, void *opaque)
> >  {
> > -       pci_for_each_device(bus, pci_bus_num(bus),
> > -                           spapr_phb_vfio_eeh_clear_dev_msix, NULL);
> > +       pci_for_each_device_under_bus(bus, spapr_phb_vfio_eeh_clear_dev_msix,
> > +                                     NULL);
> >  }
> >  
> >  static void spapr_phb_vfio_eeh_pre_reset(SpaprPhbState *sphb)
> > diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> > index 6fafffb029..1b51a72838 100644
> > --- a/hw/s390x/s390-pci-bus.c
> > +++ b/hw/s390x/s390-pci-bus.c
> > @@ -1163,8 +1163,7 @@ static void s390_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
> >      }
> >  
> >      /* Assign numbers to all child bridges. The last is the highest number. */
> > -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> > -                        s390_pci_enumerate_bridge, s);
> > +    pci_for_each_device_under_bus(sec_bus, s390_pci_enumerate_bridge, s);
> >      pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, s->bus_no, 1);
> >  }
> >  
> > @@ -1193,7 +1192,7 @@ static void s390_pcihost_reset(DeviceState *dev)
> >       * on every system reset, we also have to reassign numbers.
> >       */
> >      s->bus_no = 0;
> > -    pci_for_each_device(bus, pci_bus_num(bus), s390_pci_enumerate_bridge, s);
> > +    pci_for_each_device_under_bus(bus, s390_pci_enumerate_bridge, s);
> >  }
> >  
> >  static void s390_pcihost_class_init(ObjectClass *klass, void *data)
> > diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> > index ca0a98187e..027190fa44 100644
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -615,8 +615,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
> >      }
> >  
> >      args.type = d->io_regions[bar].type;
> > -    pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
> > -                        xen_pt_check_bar_overlap, &args);
> > +    pci_for_each_device_under_bus(pci_get_bus(d),
> > +                                  xen_pt_check_bar_overlap, &args);
> >      if (args.rc) {
> >          XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
> >                      ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
> Maybe squash with the previous one?

Will do.

> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks,

-- 
Peter Xu


