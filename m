Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDD6AFBFA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNf-0004B8-T4; Tue, 07 Mar 2023 20:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNe-00045K-5U
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNc-00020Z-5f
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E+0DVMZ4W9/J1tN7ovW0ZkJvu2M3AxmaE/zD1Fzhx94=;
 b=jP6L1qHqar1uT2Bx32OhAiLUCvAMTUi1cvrsGxPgAcBA/fpGIiA7t7SpP+/jUAlO3OopW0
 t38ok7dEPyQp7n1iVe3Ras1aeva+vSTFcYDWbJesn9MnQ+TE9vVOtyXl4aghIYE2PndKGz
 dysFfCYght/c5FX4nGCIcS+eRJGzqUk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-CfzFdvfXOrG4d5iB2DLwJg-1; Tue, 07 Mar 2023 20:14:06 -0500
X-MC-Unique: CfzFdvfXOrG4d5iB2DLwJg-1
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so21470789edh.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+0DVMZ4W9/J1tN7ovW0ZkJvu2M3AxmaE/zD1Fzhx94=;
 b=sTEKoAaF5bZEFbCSh/0jom3BbhKaB+mT38O24Vv6s4VB383uQMuQ5fJd0YVgakmcQd
 u6/zi2K9Tdy78E4VZaOn0apqnsSo85nfwcTWpJvwlKUWE4Ve3mINBhjMVahg+JuEOn9h
 CePGtTW3xnqA8hXExANMMCbFnoHlRgfcF593ptiZryeT0JfhFBjrXcBLWOLpitZhfNpt
 tMlXPJiLJ0SLHy2OgFDF2R1Iez/eGFsW0McOKlfrTjJqH8twr3LGIRIbb+SlyUyYt3Hh
 /LVBoiAxFlq87c2K7bOC/WcG4nWHIzXv2jWlhxAEy1H31HwsDzvxXMvqotPdxRpNxKoi
 OoOA==
X-Gm-Message-State: AO0yUKWd3RATqbV0NFlcXD8shUHjO5o7bIWXWkLOTRyNWp0MnhXNjgz1
 IcvlKh1GzGqp763MLsLLIi/cTazZptDqgaSCWOQAsiJAPn9comukfY8jDuts80BrY6pxTMoHl0B
 OFRYjJhl2i0bmQEU+wvwroCa4mlXCRzUqnH+tsvTaA8xWwIpe20jPmdQebCclzyjibLys
X-Received: by 2002:a17:906:fe41:b0:8f1:949f:37b5 with SMTP id
 wz1-20020a170906fe4100b008f1949f37b5mr20114161ejb.32.1678238044759; 
 Tue, 07 Mar 2023 17:14:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9WfrZmx2ofKrazSHiqplQKdU3cloTCa9Ib0YmzrYeS4rMkyQKxt0jOwj+oa+bV9F/uzv52cQ==
X-Received: by 2002:a17:906:fe41:b0:8f1:949f:37b5 with SMTP id
 wz1-20020a170906fe4100b008f1949f37b5mr20114147ejb.32.1678238044532; 
 Tue, 07 Mar 2023 17:14:04 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v19-20020a17090606d300b008f100fd50e5sm6905559ejb.140.2023.03.07.17.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:04 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 64/73] hw/pci-bridge/cxl_root_port: Wire up MSI
Message-ID: <7e33517fdd25ce2dc95b22b8afd743a979d8dfb4.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Done to avoid fixing ACPI route description of traditional PCI interrupts on q35
and because we should probably move with the times anyway.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Message-Id: <20230302133709.30373-5-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 hw/pci-bridge/cxl_root_port.c | 61 +++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
index 00195257f7..7dfd20aa67 100644
--- a/hw/pci-bridge/cxl_root_port.c
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -22,6 +22,7 @@
 #include "qemu/range.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci/msi.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qapi/error.h"
@@ -29,6 +30,10 @@
 
 #define CXL_ROOT_PORT_DID 0x7075
 
+#define CXL_RP_MSI_OFFSET               0x60
+#define CXL_RP_MSI_SUPPORTED_FLAGS      PCI_MSI_FLAGS_MASKBIT
+#define CXL_RP_MSI_NR_VECTOR            2
+
 /* Copied from the gen root port which we derive */
 #define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
 #define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
@@ -47,6 +52,49 @@ typedef struct CXLRootPort {
 #define TYPE_CXL_ROOT_PORT "cxl-rp"
 DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_PORT)
 
+/*
+ * If two MSI vector are allocated, Advanced Error Interrupt Message Number
+ * is 1. otherwise 0.
+ * 17.12.5.10 RPERRSTS,  32:27 bit Advanced Error Interrupt Message Number.
+ */
+static uint8_t cxl_rp_aer_vector(const PCIDevice *d)
+{
+    switch (msi_nr_vectors_allocated(d)) {
+    case 1:
+        return 0;
+    case 2:
+        return 1;
+    case 4:
+    case 8:
+    case 16:
+    case 32:
+    default:
+        break;
+    }
+    abort();
+    return 0;
+}
+
+static int cxl_rp_interrupts_init(PCIDevice *d, Error **errp)
+{
+    int rc;
+
+    rc = msi_init(d, CXL_RP_MSI_OFFSET, CXL_RP_MSI_NR_VECTOR,
+                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_64BIT,
+                  CXL_RP_MSI_SUPPORTED_FLAGS & PCI_MSI_FLAGS_MASKBIT,
+                  errp);
+    if (rc < 0) {
+        assert(rc == -ENOTSUP);
+    }
+
+    return rc;
+}
+
+static void cxl_rp_interrupts_uninit(PCIDevice *d)
+{
+    msi_uninit(d);
+}
+
 static void latch_registers(CXLRootPort *crp)
 {
     uint32_t *reg_state = crp->cxl_cstate.crb.cache_mem_registers;
@@ -183,6 +231,15 @@ static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
     }
 }
 
+static void cxl_rp_aer_vector_update(PCIDevice *d)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
+
+    if (rpc->aer_vector) {
+        pcie_aer_root_set_vector(d, rpc->aer_vector(d));
+    }
+}
+
 static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
                                 int len)
 {
@@ -192,6 +249,7 @@ static void cxl_rp_write_config(PCIDevice *d, uint32_t address, uint32_t val,
 
     pcie_cap_slot_get(d, &slt_ctl, &slt_sta);
     pci_bridge_write_config(d, address, val, len);
+    cxl_rp_aer_vector_update(d);
     pcie_cap_flr_write_config(d, address, val, len);
     pcie_cap_slot_write_config(d, slt_ctl, slt_sta, address, val, len);
     pcie_aer_write_config(d, address, val, len);
@@ -220,6 +278,9 @@ static void cxl_root_port_class_init(ObjectClass *oc, void *data)
 
     rpc->aer_offset = GEN_PCIE_ROOT_PORT_AER_OFFSET;
     rpc->acs_offset = GEN_PCIE_ROOT_PORT_ACS_OFFSET;
+    rpc->aer_vector = cxl_rp_aer_vector;
+    rpc->interrupts_init = cxl_rp_interrupts_init;
+    rpc->interrupts_uninit = cxl_rp_interrupts_uninit;
 
     dc->hotpluggable = false;
 }
-- 
MST


