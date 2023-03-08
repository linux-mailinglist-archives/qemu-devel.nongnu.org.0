Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC36AFBF3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiO3-0005Uy-QC; Tue, 07 Mar 2023 20:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNy-0005Bk-Uz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNw-00024I-M5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JiQyBH5vvYnrxd9UFWpoF/hKiImKzIRaFV619s3+oeQ=;
 b=cEkzax7fgTBJvS//i3qsD7gUt3TfX49DnrlDHMgb62IWu/4zi3r2/22/5DSgvoyZicg8yH
 qytIY4tVznvAvjgM7DpcQnnxsYb9C/2fZZx/fwohG7xU0eK8/lskG3WsPyoe4hYVl4w7+y
 22MwczR8LTlm4ykL4NI8Oc3jUQmTU7w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-OVZZJQfFMc-GwrgrXZ6ePw-1; Tue, 07 Mar 2023 20:14:24 -0500
X-MC-Unique: OVZZJQfFMc-GwrgrXZ6ePw-1
Received: by mail-ed1-f72.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21295873eda.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238063;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JiQyBH5vvYnrxd9UFWpoF/hKiImKzIRaFV619s3+oeQ=;
 b=HXDZ41LL6mmbI4zdYSolskXeabtpGBBC1jqK0qdkL13DUz667x91lmV2IpSdZ4owgY
 nF+3WV5wvZF7eBUa1SPUAT2OMr2TMh1fOJIIPVm0c4xF6WfKDoy0+4XA1PeYKI9Qnioh
 xfYXwjZTI2BcZ5e7zb4FP7q9dnjKxW1HvCDSV0q3mlOKG1Mim2EStADD+0sSD/jjB8dR
 CW3lyY853EdNBVzvYldmqZfFYpfH2rizY8aFeg8RrtPFJQp+XE8Fvg/2DYMnrmJV5xyS
 C6ItkfdGsrOyng106epKsPcc4+ooHPWLJPXKme5HZaZY8q5S+slHNJoso8ji+futb8o1
 /Lrw==
X-Gm-Message-State: AO0yUKW6/0XdMHpyU2AfiD9KhnvUOM/ggl88ibDHn2CCjdzmevjzTryy
 UjPooy4XPeM5DHk5oCRZ2vI+EbBxXohAyufk5ToZSUYNEjxws3Jkrci1oWZWmpf0wUh8H8XjYmS
 /dpmz081UAtQxdLX2DCMvkiIyUj1ySW3pFkpT0L38CoacG8Mxfk/zNuIMYM7vTDri084S
X-Received: by 2002:a17:907:8e88:b0:878:7cf3:a9e7 with SMTP id
 tx8-20020a1709078e8800b008787cf3a9e7mr18901732ejc.65.1678238062947; 
 Tue, 07 Mar 2023 17:14:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9AfKUXmKVlp/7CSUI+0trg4mzPaH6IuLs9HZwZKLSUvmTnwv8iZOuJ0Fqj6trlU49kbhzFlw==
X-Received: by 2002:a17:907:8e88:b0:878:7cf3:a9e7 with SMTP id
 tx8-20020a1709078e8800b008787cf3a9e7mr18901710ejc.65.1678238062596; 
 Tue, 07 Mar 2023 17:14:22 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 k12-20020a50ce4c000000b004c0459c20f9sm7424936edj.66.2023.03.07.17.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:22 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders unless
 overridden
Message-ID: <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The CXL r3.0 specification allows for there to be no HDM decoders on CXL
Host Bridges if they have only a single root port. Instead, all accesses
directed to the host bridge (as specified in CXL Fixed Memory Windows)
are assumed to be routed to the single root port.

Linux currently assumes this implementation choice. So to simplify testing,
make QEMU emulation also default to no HDM decoders under these particular
circumstances, but provide a hdm_for_passthrough boolean option to have
HDM decoders as previously.

Technically this is breaking backwards compatibility, but given the only
known software stack used with the QEMU emulation is the Linux kernel
and this configuration did not work before this change, there are
unlikely to be any complaints that it now works. The option is retained
to allow testing of software that does allow for these HDM decoders to exist,
once someone writes it.

Reported-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Tested-by: Fan Ni <fan.ni@samsung.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
v2: Pick up and fix typo in tag from Fan Ni
Message-Id: <20230227153128.8164-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h                |  1 +
 include/hw/cxl/cxl_component.h      |  1 +
 include/hw/pci/pci_bridge.h         |  1 +
 hw/cxl/cxl-host.c                   | 31 ++++++++++++--------
 hw/pci-bridge/pci_expander_bridge.c | 44 +++++++++++++++++++++++++----
 5 files changed, 61 insertions(+), 17 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index b161be59b7..b2cffbb364 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -49,6 +49,7 @@ struct CXLHost {
     PCIHostState parent_obj;
 
     CXLComponentState cxl_cstate;
+    bool passthrough;
 };
 
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index ec4203b83f..42c7e581a7 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -247,6 +247,7 @@ static inline hwaddr cxl_decode_ig(int ig)
 }
 
 CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
+bool cxl_get_hb_passthrough(PCIHostState *hb);
 
 void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp);
 void cxl_doe_cdat_release(CXLComponentState *cxl_cstate);
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 63a7521567..81a058bb2c 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -92,6 +92,7 @@ struct PXBDev {
     uint8_t bus_nr;
     uint16_t numa_node;
     bool bypass_iommu;
+    bool hdm_for_passthrough;
     struct cxl_dev {
         CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
     } cxl;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 3c1ec8732a..6e923ceeaf 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -146,21 +146,28 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
         return NULL;
     }
 
-    hb_cstate = cxl_get_hb_cstate(hb);
-    if (!hb_cstate) {
-        return NULL;
-    }
+    if (cxl_get_hb_passthrough(hb)) {
+        rp = pcie_find_port_first(hb->bus);
+        if (!rp) {
+            return NULL;
+        }
+    } else {
+        hb_cstate = cxl_get_hb_cstate(hb);
+        if (!hb_cstate) {
+            return NULL;
+        }
 
-    cache_mem = hb_cstate->crb.cache_mem_registers;
+        cache_mem = hb_cstate->crb.cache_mem_registers;
 
-    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
-    if (!target_found) {
-        return NULL;
-    }
+        target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+        if (!target_found) {
+            return NULL;
+        }
 
-    rp = pcie_find_port_by_pn(hb->bus, target);
-    if (!rp) {
-        return NULL;
+        rp = pcie_find_port_by_pn(hb->bus, target);
+        if (!rp) {
+            return NULL;
+        }
     }
 
     d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index e752a21292..ead33f0c05 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci-bridge/pci_expander_bridge.h"
@@ -79,6 +80,13 @@ CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb)
     return &host->cxl_cstate;
 }
 
+bool cxl_get_hb_passthrough(PCIHostState *hb)
+{
+    CXLHost *host = PXB_CXL_HOST(hb);
+
+    return host->passthrough;
+}
+
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
@@ -289,15 +297,32 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int pin)
     return pin - PCI_SLOT(pxb->devfn);
 }
 
-static void pxb_dev_reset(DeviceState *dev)
+static void pxb_cxl_dev_reset(DeviceState *dev)
 {
     CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
     CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
+    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
     uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
     uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
+    int dsp_count = 0;
 
     cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
-    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
+    /*
+     * The CXL specification allows for host bridges with no HDM decoders
+     * if they only have a single root port.
+     */
+    if (!PXB_DEV(dev)->hdm_for_passthrough) {
+        dsp_count = pcie_count_ds_ports(hb->bus);
+    }
+    /* Initial reset will have 0 dsp so wait until > 0 */
+    if (dsp_count == 1) {
+        cxl->passthrough = true;
+        /* Set Capability ID in header to NONE */
+        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
+    } else {
+        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
+                         8);
+    }
 }
 
 static gint pxb_compare(gconstpointer a, gconstpointer b)
@@ -481,9 +506,18 @@ static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
     }
 
     pxb_dev_realize_common(dev, CXL, errp);
-    pxb_dev_reset(DEVICE(dev));
+    pxb_cxl_dev_reset(DEVICE(dev));
 }
 
+static Property pxb_cxl_dev_properties[] = {
+    /* Note: 0 is not a legal PXB bus number. */
+    DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
+    DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
+    DEFINE_PROP_BOOL("hdm_for_passthrough", PXBDev, hdm_for_passthrough, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc   = DEVICE_CLASS(klass);
@@ -497,12 +531,12 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
      */
 
     dc->desc = "CXL Host Bridge";
-    device_class_set_props(dc, pxb_dev_properties);
+    device_class_set_props(dc, pxb_cxl_dev_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 
     /* Host bridges aren't hotpluggable. FIXME: spec reference */
     dc->hotpluggable = false;
-    dc->reset = pxb_dev_reset;
+    dc->reset = pxb_cxl_dev_reset;
 }
 
 static const TypeInfo pxb_cxl_dev_info = {
-- 
MST


