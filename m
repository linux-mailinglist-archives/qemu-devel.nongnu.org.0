Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA4354E834
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:00:22 +0200 (CEST)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sqz-00073C-8r
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soH-0004PY-0v
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soE-0001vG-UZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/flcdRkN4jdv9LZCU81PkiG7X5P2WUuDgQBiTM9iZJs=;
 b=iTZ6JsXBs7kl2eM8M+I4cVpMTkjI5RZkGFSPq7ZlJPWOYvlDs0Yp2IAPGqDvV8D5KLPxwF
 g9+4OJQaKaDBKCKTfdglICreEaE9aBYXDEezX4WQuRIzZCleKxpI5+EfZOMpIUR44f831S
 AiEJsS5o4edJuiH8aVKZqfWg3SdJ9AA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29--QhxSWv3NgKjjgox0xVxEA-1; Thu, 16 Jun 2022 12:57:28 -0400
X-MC-Unique: -QhxSWv3NgKjjgox0xVxEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r13-20020adff10d000000b002160e9d64f8so388328wro.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/flcdRkN4jdv9LZCU81PkiG7X5P2WUuDgQBiTM9iZJs=;
 b=kVK55/qUtR2UildtyyncKJpDcj31u7BC+vtizLEP0jWtb9U65uRuKBRvdMFKvCACZZ
 rFLP4PTBwa4bdQBuaBAIeEKLWHqpCpoKL0qB0Zazu6rUSeeTnTtUtbb4DI8SuLstj/rB
 I1X9sOKhGxL30FWLgvyyXPkwPb/rJ1l7A6+aYEYbCN29mHqyIVrak9En1XLahKVDc6T/
 kNK93sy3UKvQIPcKpkCdc8D0OLJ6xEbn0wUZKs0LMYwEdl1nAejHbs3/xxEv1jaTowz3
 rWFpW+Z4pPKl7H1bi0h2nMQOaxdrmXKtObsOseJMAXVjp//6MAd8sgkXY/NwZMzxlFM4
 DvTA==
X-Gm-Message-State: AJIora8lA1/CeCk0VKXZkFcZa9TeXxcy2Onh0pSJzXrptX63jKsqB1Vr
 rjjQ3fPWSPY4QmHKfymtOoOJYV5am7EFPbqDbt9ybi6tdrwO9JsABc4ON2b2o0wrb98ctlyzzLd
 jIaSwxju5wIMvuowi3LLkBfuHmgeXoPn/fe9+dEZooZhjZ842I2ABMNTGIKna
X-Received: by 2002:adf:e782:0:b0:219:f719:216c with SMTP id
 n2-20020adfe782000000b00219f719216cmr5632975wrm.613.1655398646503; 
 Thu, 16 Jun 2022 09:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbKkld6e7pXDjyU9EFitrClGwXKbnxdSOlHysb4tJFQTbSJJ9XL9UqrMWJJcidQlAvoPWIxQ==
X-Received: by 2002:adf:e782:0:b0:219:f719:216c with SMTP id
 n2-20020adfe782000000b00219f719216cmr5632948wrm.613.1655398646238; 
 Thu, 16 Jun 2022 09:57:26 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 v15-20020adff68f000000b0021576694d9dsm2416533wrp.97.2022.06.16.09.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:25 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 01/10] pci-bridge/cxl_upstream: Add a CXL switch upstream port
Message-ID: <20220616165703.42226-2-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

An initial simple upstream port emulation to allow the creation
of CXL switches. The Device ID has been allocated for this use.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220616145126.8002-2-Jonathan.Cameron@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h         |   5 +
 hw/pci-bridge/cxl_upstream.c | 216 +++++++++++++++++++++++++++++++++++
 hw/pci-bridge/meson.build    |   2 +-
 3 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 hw/pci-bridge/cxl_upstream.c

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 134b295b40..38e0e271d5 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -53,4 +53,9 @@ struct CXLHost {
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
 OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
 
+#define TYPE_CXL_USP "cxl-upstream"
+
+typedef struct CXLUpstreamPort CXLUpstreamPort;
+DECLARE_INSTANCE_CHECKER(CXLUpstreamPort, CXL_USP, TYPE_CXL_USP)
+CXLComponentState *cxl_usp_to_cstate(CXLUpstreamPort *usp);
 #endif
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
new file mode 100644
index 0000000000..a83a3e81e4
--- /dev/null
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -0,0 +1,216 @@
+/*
+ * Emulated CXL Switch Upstream Port
+ *
+ * Copyright (c) 2022 Huawei Technologies.
+ *
+ * Based on xio3130_upstream.c
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_port.h"
+
+#define CXL_UPSTREAM_PORT_MSI_NR_VECTOR 1
+
+#define CXL_UPSTREAM_PORT_MSI_OFFSET 0x70
+#define CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET 0x90
+#define CXL_UPSTREAM_PORT_AER_OFFSET 0x100
+#define CXL_UPSTREAM_PORT_DVSEC_OFFSET \
+    (CXL_UPSTREAM_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
+
+typedef struct CXLUpstreamPort {
+    /*< private >*/
+    PCIEPort parent_obj;
+
+    /*< public >*/
+    CXLComponentState cxl_cstate;
+} CXLUpstreamPort;
+
+CXLComponentState *cxl_usp_to_cstate(CXLUpstreamPort *usp)
+{
+    return &usp->cxl_cstate;
+}
+
+static void cxl_usp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
+                                       uint32_t val, int len)
+{
+    CXLUpstreamPort *usp = CXL_USP(dev);
+
+    if (range_contains(&usp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC], addr)) {
+        uint8_t *reg = &dev->config[addr];
+        addr -= usp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
+        if (addr == PORT_CONTROL_OFFSET) {
+            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
+                /* unmask SBR */
+                qemu_log_mask(LOG_UNIMP, "SBR mask control is not supported\n");
+            }
+            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
+                /* Alt Memory & ID Space Enable */
+                qemu_log_mask(LOG_UNIMP,
+                              "Alt Memory & ID space is not supported\n");
+            }
+        }
+    }
+}
+
+static void cxl_usp_write_config(PCIDevice *d, uint32_t address,
+                                 uint32_t val, int len)
+{
+    pci_bridge_write_config(d, address, val, len);
+    pcie_cap_flr_write_config(d, address, val, len);
+    pcie_aer_write_config(d, address, val, len);
+
+    cxl_usp_dvsec_write_config(d, address, val, len);
+}
+
+static void latch_registers(CXLUpstreamPort *usp)
+{
+    uint32_t *reg_state = usp->cxl_cstate.crb.cache_mem_registers;
+    uint32_t *write_msk = usp->cxl_cstate.crb.cache_mem_regs_write_mask;
+
+    cxl_component_register_init_common(reg_state, write_msk,
+                                       CXL2_UPSTREAM_PORT);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
+}
+
+static void cxl_usp_reset(DeviceState *qdev)
+{
+    PCIDevice *d = PCI_DEVICE(qdev);
+    CXLUpstreamPort *usp = CXL_USP(qdev);
+
+    pci_bridge_reset(qdev);
+    pcie_cap_deverr_reset(d);
+    latch_registers(usp);
+}
+
+static void build_dvsecs(CXLComponentState *cxl)
+{
+    uint8_t *dvsec;
+
+    dvsec = (uint8_t *)&(CXLDVSECPortExtensions){
+        .status = 0x1, /* Port Power Management Init Complete */
+    };
+    cxl_component_create_dvsec(cxl, CXL2_UPSTREAM_PORT,
+                               EXTENSIONS_PORT_DVSEC_LENGTH,
+                               EXTENSIONS_PORT_DVSEC,
+                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
+    dvsec = (uint8_t *)&(CXLDVSECPortFlexBus){
+        .cap                     = 0x27, /* Cache, IO, Mem, non-MLD */
+        .ctrl                    = 0x27, /* Cache, IO, Mem */
+        .status                  = 0x26, /* same */
+        .rcvd_mod_ts_data_phase1 = 0xef, /* WTF? */
+    };
+    cxl_component_create_dvsec(cxl, CXL2_UPSTREAM_PORT,
+                               PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
+                               PCIE_FLEXBUS_PORT_DVSEC,
+                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvsec);
+
+    dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
+        .rsvd         = 0,
+        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg0_base_hi = 0,
+    };
+    cxl_component_create_dvsec(cxl, CXL2_UPSTREAM_PORT,
+                               REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
+                               REG_LOC_DVSEC_REVID, dvsec);
+}
+
+static void cxl_usp_realize(PCIDevice *d, Error **errp)
+{
+    PCIEPort *p = PCIE_PORT(d);
+    CXLUpstreamPort *usp = CXL_USP(d);
+    CXLComponentState *cxl_cstate = &usp->cxl_cstate;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    MemoryRegion *component_bar = &cregs->component_registers;
+    int rc;
+
+    pci_bridge_initfn(d, TYPE_PCIE_BUS);
+    pcie_port_init_reg(d);
+
+    rc = msi_init(d, CXL_UPSTREAM_PORT_MSI_OFFSET,
+                  CXL_UPSTREAM_PORT_MSI_NR_VECTOR, true, true, errp);
+    if (rc) {
+        assert(rc == -ENOTSUP);
+        goto err_bridge;
+    }
+
+    rc = pcie_cap_init(d, CXL_UPSTREAM_PORT_PCIE_CAP_OFFSET,
+                       PCI_EXP_TYPE_UPSTREAM, p->port, errp);
+    if (rc < 0) {
+        goto err_msi;
+    }
+
+    pcie_cap_flr_init(d);
+    pcie_cap_deverr_init(d);
+    rc = pcie_aer_init(d, PCI_ERR_VER, CXL_UPSTREAM_PORT_AER_OFFSET,
+                       PCI_ERR_SIZEOF, errp);
+    if (rc) {
+        goto err_cap;
+    }
+
+    cxl_cstate->dvsec_offset = CXL_UPSTREAM_PORT_DVSEC_OFFSET;
+    cxl_cstate->pdev = d;
+    build_dvsecs(cxl_cstate);
+    cxl_component_register_block_init(OBJECT(d), cxl_cstate, TYPE_CXL_USP);
+    pci_register_bar(d, CXL_COMPONENT_REG_BAR_IDX,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY |
+                     PCI_BASE_ADDRESS_MEM_TYPE_64,
+                     component_bar);
+
+    return;
+
+err_cap:
+    pcie_cap_exit(d);
+err_msi:
+    msi_uninit(d);
+err_bridge:
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_usp_exitfn(PCIDevice *d)
+{
+    pcie_aer_exit(d);
+    pcie_cap_exit(d);
+    msi_uninit(d);
+    pci_bridge_exitfn(d);
+}
+
+static void cxl_upstream_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(oc);
+
+    k->is_bridge = true;
+    k->config_write = cxl_usp_write_config;
+    k->realize = cxl_usp_realize;
+    k->exit = cxl_usp_exitfn;
+    k->vendor_id = 0x19e5; /* Huawei */
+    k->device_id = 0xa128; /* Emulated CXL Switch Upstream Port */
+    k->revision = 0;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->desc = "CXL Switch Upstream Port";
+    dc->reset = cxl_usp_reset;
+}
+
+static const TypeInfo cxl_usp_info = {
+    .name = TYPE_CXL_USP,
+    .parent = TYPE_PCIE_PORT,
+    .instance_size = sizeof(CXLUpstreamPort),
+    .class_init = cxl_upstream_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { INTERFACE_CXL_DEVICE },
+        { }
+    },
+};
+
+static void cxl_usp_register_type(void)
+{
+    type_register_static(&cxl_usp_info);
+}
+
+type_init(cxl_usp_register_type);
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index fdbe2e07c5..6828f0e08d 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -6,7 +6,7 @@ pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pci
 pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
                                if_false: files('pci_expander_bridge_stubs.c'))
 pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
-pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c'))
+pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c'))
 
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
-- 
MST


