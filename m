Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5C442489
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:18:33 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhVY-0001TC-Di
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgz2-000263-M0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgz0-0004I6-EY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hQpOeuAFUR/YU+yLEEiQzjlSsfEbb0a1M35err53O2c=;
 b=OGYpZqdBuNXsmxiGgdvXdch14ocsrFIcHHVcklpqDlzrI5elMmodkVSXsNcftYNCxX7hu4
 8UDRUUZIt2Rqdsp6V13ivOFTyMjwlNVptI6JoHjjHFO6v84BS/unbJJb79w0pG//nKS/kM
 X0an77UMXMXx/Tbi79GdpAroSQmQg0s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-13ViE094M1-3BYis4mS7jA-1; Mon, 01 Nov 2021 19:44:52 -0400
X-MC-Unique: 13ViE094M1-3BYis4mS7jA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x13-20020a05640226cd00b003dd4720703bso17069404edd.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQpOeuAFUR/YU+yLEEiQzjlSsfEbb0a1M35err53O2c=;
 b=S0WJYVPnjEzyL9oLK/0MsD2TV3uyvDxaa+UYRGO1FYCSekpBITmq5QlR3TNwMXL7e3
 B11gAABW28baYicjTtquFHeqSAnT9pZIe40L1ryoguXugbu4ETKK5Bo8t9hwjSEin2nv
 HAn/QhjHWWZqj99I2dgVSxZJvqIX0FICapB94aI6zb4RfE63fBPPtCtaW7BsIMvTIDQY
 AjDWf7VCX9Xvp86KP6iUccASD7qC1vQxLmCB82bfqOV+euHT2O6xs8eNNpjr8yMv33Vh
 iB3W4ji176gXJoN6OgQnVDmfMlXk+ajZRXRmx4Npn8+mw14PRBny9aavAtffQrxTWEk9
 oDBA==
X-Gm-Message-State: AOAM5328hf0Xnj6fSbOfiOajODw880Hzg26xrLcxn06xfRSlEZ2aGuem
 jFAeNjqX40xFWoidAhvGrat381hgeDNjLKcA1+/Ohg/vkrBLOXFBrrLKi6owUMXuksfKyFdHR3g
 cI0uVfaLLvWTiifbqCqPySHCM+YPPjwUzyUsVJnZjLkAPeH6MvlGE9T0rGgPu
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr14408271ejc.133.1635810291148; 
 Mon, 01 Nov 2021 16:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwukbwhcUWvJJuqHH8/khRQQjZoqF2HrG8wBex3bhnCrcMlXkuR308ikOKPoGaR9Bmsmei6wA==
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr14408220ejc.133.1635810290860; 
 Mon, 01 Nov 2021 16:44:50 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id s4sm1603180edd.32.2021.11.01.16.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:50 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] pci: Export pci_for_each_device_under_bus*()
Message-ID: <20211101234358.582487-9-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Farman <farman@linux.ibm.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

They're actually more commonly used than the helper without _under_bus, because
most callers do have the pci bus on hand.  After exporting we can switch a lot
of the call sites to use these two helpers.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20211028043129.38871-3-peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/pci/pci.h       |  5 +++++
 hw/i386/acpi-build.c       |  5 ++---
 hw/pci/pci.c               | 10 +++++-----
 hw/pci/pcie.c              |  4 +---
 hw/ppc/spapr_pci.c         | 12 +++++-------
 hw/ppc/spapr_pci_nvlink2.c |  7 +++----
 hw/ppc/spapr_pci_vfio.c    |  4 ++--
 hw/s390x/s390-pci-bus.c    |  5 ++---
 hw/xen/xen_pt.c            |  4 ++--
 9 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4a8740b76b..5c4016b995 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -467,6 +467,11 @@ void pci_for_each_device(PCIBus *bus, int bus_num,
 void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
                                  pci_bus_dev_fn fn,
                                  void *opaque);
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque);
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque);
 void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
                                   pci_bus_fn end, void *parent_state);
 PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3ca6cc8118..a3ad6abd33 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2134,8 +2134,7 @@ dmar_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
-                                scope_blob);
+            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
         }
     }
 
@@ -2341,7 +2340,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
         if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
+            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
         }
     }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 17e59cb3a3..4a84e478ce 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1654,9 +1654,9 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0, NULL}
 };
 
-static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
-                                                  pci_bus_dev_fn fn,
-                                                  void *opaque)
+void pci_for_each_device_under_bus_reverse(PCIBus *bus,
+                                           pci_bus_dev_fn fn,
+                                           void *opaque)
 {
     PCIDevice *d;
     int devfn;
@@ -1679,8 +1679,8 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
     }
 }
 
-static void pci_for_each_device_under_bus(PCIBus *bus,
-                                          pci_bus_dev_fn fn, void *opaque)
+void pci_for_each_device_under_bus(PCIBus *bus,
+                                   pci_bus_dev_fn fn, void *opaque)
 {
     PCIDevice *d;
     int devfn;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d82903..914a9bf3d1 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -694,9 +694,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
         PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                            pcie_unplug_device, NULL);
-
+        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
         pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
                                      PCI_EXP_SLTSTA_PDS);
         if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd6314..5bfd4aa9e5 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1317,8 +1317,7 @@ static int spapr_dt_pci_bus(SpaprPhbState *sphb, PCIBus *bus,
                           RESOURCE_CELLS_SIZE));
 
     assert(bus);
-    pci_for_each_device_reverse(bus, pci_bus_num(bus),
-                                spapr_dt_pci_device_cb, &cbinfo);
+    pci_for_each_device_under_bus_reverse(bus, spapr_dt_pci_device_cb, &cbinfo);
     if (cbinfo.err) {
         return cbinfo.err;
     }
@@ -2306,8 +2305,8 @@ static void spapr_phb_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_enumerate_bridge, bus_no);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_enumerate_bridge,
+                                  bus_no);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, *bus_no, 1);
 }
 
@@ -2316,9 +2315,8 @@ static void spapr_phb_pci_enumerate(SpaprPhbState *phb)
     PCIBus *bus = PCI_HOST_BRIDGE(phb)->bus;
     unsigned int bus_no = 0;
 
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_enumerate_bridge,
-                        &bus_no);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_enumerate_bridge,
+                                  &bus_no);
 
 }
 
diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
index 8ef9b40a18..7fb0cf4d04 100644
--- a/hw/ppc/spapr_pci_nvlink2.c
+++ b/hw/ppc/spapr_pci_nvlink2.c
@@ -164,8 +164,7 @@ static void spapr_phb_pci_collect_nvgpu(PCIBus *bus, PCIDevice *pdev,
         return;
     }
 
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        spapr_phb_pci_collect_nvgpu, opaque);
+    pci_for_each_device_under_bus(sec_bus, spapr_phb_pci_collect_nvgpu, opaque);
 }
 
 void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
@@ -183,8 +182,8 @@ void spapr_phb_nvgpu_setup(SpaprPhbState *sphb, Error **errp)
     sphb->nvgpus->nv2_atsd_current = sphb->nv2_atsd_win_addr;
 
     bus = PCI_HOST_BRIDGE(sphb)->bus;
-    pci_for_each_device(bus, pci_bus_num(bus),
-                        spapr_phb_pci_collect_nvgpu, sphb->nvgpus);
+    pci_for_each_device_under_bus(bus, spapr_phb_pci_collect_nvgpu,
+                                  sphb->nvgpus);
 
     if (sphb->nvgpus->err) {
         error_propagate(errp, sphb->nvgpus->err);
diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index f3b37df8ea..2a76b4e0b5 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -164,8 +164,8 @@ static void spapr_phb_vfio_eeh_clear_dev_msix(PCIBus *bus,
 
 static void spapr_phb_vfio_eeh_clear_bus_msix(PCIBus *bus, void *opaque)
 {
-       pci_for_each_device(bus, pci_bus_num(bus),
-                           spapr_phb_vfio_eeh_clear_dev_msix, NULL);
+       pci_for_each_device_under_bus(bus, spapr_phb_vfio_eeh_clear_dev_msix,
+                                     NULL);
 }
 
 static void spapr_phb_vfio_eeh_pre_reset(SpaprPhbState *sphb)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 6fafffb029..1b51a72838 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1163,8 +1163,7 @@ static void s390_pci_enumerate_bridge(PCIBus *bus, PCIDevice *pdev,
     }
 
     /* Assign numbers to all child bridges. The last is the highest number. */
-    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
-                        s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(sec_bus, s390_pci_enumerate_bridge, s);
     pci_default_write_config(pdev, PCI_SUBORDINATE_BUS, s->bus_no, 1);
 }
 
@@ -1193,7 +1192,7 @@ static void s390_pcihost_reset(DeviceState *dev)
      * on every system reset, we also have to reassign numbers.
      */
     s->bus_no = 0;
-    pci_for_each_device(bus, pci_bus_num(bus), s390_pci_enumerate_bridge, s);
+    pci_for_each_device_under_bus(bus, s390_pci_enumerate_bridge, s);
 }
 
 static void s390_pcihost_class_init(ObjectClass *klass, void *data)
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index ca0a98187e..027190fa44 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -615,8 +615,8 @@ static void xen_pt_region_update(XenPCIPassthroughState *s,
     }
 
     args.type = d->io_regions[bar].type;
-    pci_for_each_device(pci_get_bus(d), pci_dev_bus_num(d),
-                        xen_pt_check_bar_overlap, &args);
+    pci_for_each_device_under_bus(pci_get_bus(d),
+                                  xen_pt_check_bar_overlap, &args);
     if (args.rc) {
         XEN_PT_WARN(d, "Region: %d (addr: 0x%"FMT_PCIBUS
                     ", len: 0x%"FMT_PCIBUS") is overlapped.\n",
-- 
MST


