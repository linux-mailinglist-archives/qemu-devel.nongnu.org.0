Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E829E2D32CA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:49:07 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiyw-00008e-UJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikZ-00050l-QY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikV-0004kV-2M
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sBbYqATIAnCNBcAAt91kqKRHx/wGJ4fEyCpCv6h89HQ=;
 b=KN3doU87QKLSHGZ49zlUKdcLWCp1vtFYLCqWvSF3AjblSF37CYfB2Qr5AIbUX5QHkLICM3
 kCqKkE5xdyhIiyMM97lyH2JuUag3RpCFxbmiWC97JR3T6W/OyIvb07EfY1rkm27OR7iTcC
 yaN4uF85vXiWKQ97NMCOY92i1hLwy4k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-oVhCh8MDNourpgw94_ApVg-1; Tue, 08 Dec 2020 14:34:07 -0500
X-MC-Unique: oVhCh8MDNourpgw94_ApVg-1
Received: by mail-wm1-f69.google.com with SMTP id d16so948218wmd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sBbYqATIAnCNBcAAt91kqKRHx/wGJ4fEyCpCv6h89HQ=;
 b=Ybr0idmZe2nGlNdoADTCspu0Rf4Owq/X07L8G+rQYodKKIXVuRlVYVRCA3H+J+wwqq
 3Wx54pJDSeKsvAP7xm/mN/pOon2hrzJJ5EMLdkiciojwqEcBy75ccbCvwLXL18ZjuUWY
 x/U0KSpvc0bE2HhLyku8vuO9hIKoJrPuq9sOMI6LhirBhj6u0XnyzLcCRUKqHnBY0s6M
 tz6F2KXIWJSRpu0Fy/BHap+v0ulzdaDdynT77llXshuV223SyKXBjGWU1OlnkW58xP1s
 S2wVbJjX/SwCF70t9GVrEMtrRyk5FS993AJYIep8cVJc5b6opDptWC+vjLgF1gl8EyaI
 Z46w==
X-Gm-Message-State: AOAM533HzaWLPf/RjQFm749j+sZHay74EWBu4jDKuYXpKwugBft7OI+6
 5QP38GFgcjxsoNSQZmSLPXfpMrQiTibeIF6DnrSi+iET7x2xXAtog7hkm1Z3DhKdKHPCDNCSndW
 wM1Ay3MPc79fkFyfgvsNmEP1cBQmLS4xjJDhfQXKHezqciMYg3bXhTR8o8kUf
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr5160297wmd.132.1607456045789; 
 Tue, 08 Dec 2020 11:34:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0uc1jhIjUuXn9fvAg6VQ8kiMV/KF2txYEitKptj4DIZRSxHexKPGW3EhOMJkYRmOi19Fixg==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr5160274wmd.132.1607456045465; 
 Tue, 08 Dec 2020 11:34:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id e17sm11589349wrw.84.2020.12.08.11.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:04 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/66] acpi/gpex: Extract two APIs from acpi_dsdt_add_pci
Message-ID: <20201208193307.646726-9-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yubo Miao <miaoyubo@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

Extract two APIs acpi_dsdt_add_pci_route_table and
acpi_dsdt_add_pci_osc from acpi_dsdt_add_pci. The first
API is used to specify the pci route table and the second
API is used to declare the operation system capabilities.
These two APIs would be used to specify the pxb-pcie in DSDT.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-2-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 112 ++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index dbb350a837..32a9f2796d 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -2,21 +2,11 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci-host/gpex.h"
 
-void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
+static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
 {
-    int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
-    Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
+    Aml *method, *crs;
     int i, slot_no;
 
-    Aml *dev = aml_device("%s", "PCI0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
-    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
-    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
-    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
-    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
     /* Declare the PCI Routing Table. */
     Aml *rt_pkg = aml_varpackage(PCI_SLOT_MAX * PCI_NUM_PINS);
     for (slot_no = 0; slot_no < PCI_SLOT_MAX; slot_no++) {
@@ -34,7 +24,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
 
     /* Create GSI link device */
     for (i = 0; i < PCI_NUM_PINS; i++) {
-        uint32_t irqs = cfg->irq + i;
+        uint32_t irqs = irq + i;
         Aml *dev_gsi = aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
         aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
@@ -52,43 +42,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
         aml_append(dev_gsi, method);
         aml_append(dev, dev_gsi);
     }
+}
 
-    method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_return(aml_int(cfg->ecam.base)));
-    aml_append(dev, method);
-
-    Aml *rbuf = aml_resource_template();
-    aml_append(rbuf,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
-                            nr_pcie_buses));
-    if (cfg->mmio32.size) {
-        aml_append(rbuf,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio32.base,
-                                    cfg->mmio32.base + cfg->mmio32.size - 1,
-                                    0x0000,
-                                    cfg->mmio32.size));
-    }
-    if (cfg->pio.size) {
-        aml_append(rbuf,
-                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
-                                cfg->pio.size - 1,
-                                cfg->pio.base,
-                                cfg->pio.size));
-    }
-    if (cfg->mmio64.size) {
-        aml_append(rbuf,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio64.base,
-                                    cfg->mmio64.base + cfg->mmio64.size - 1,
-                                    0x0000,
-                                    cfg->mmio64.size));
-    }
-    aml_append(dev, aml_name_decl("_CRS", rbuf));
+static void acpi_dsdt_add_pci_osc(Aml *dev)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
     /* Declare an _OSC (OS Control Handoff) method */
     aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
@@ -160,6 +118,62 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     buf = aml_buffer(1, byte_list);
     aml_append(method, aml_return(buf));
     aml_append(dev, method);
+}
+
+void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
+{
+    int nr_pcie_buses = cfg->ecam.size / PCIE_MMCFG_SIZE_MIN;
+    Aml *method, *crs, *dev, *rbuf;
+
+    dev = aml_device("%s", "PCI0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A08")));
+    aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
+    aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
+    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    acpi_dsdt_add_pci_route_table(dev, cfg->irq);
+
+    method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(cfg->ecam.base)));
+    aml_append(dev, method);
+
+    rbuf = aml_resource_template();
+    aml_append(rbuf,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                            0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
+                            nr_pcie_buses));
+    if (cfg->mmio32.size) {
+        aml_append(rbuf,
+                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                    cfg->mmio32.base,
+                                    cfg->mmio32.base + cfg->mmio32.size - 1,
+                                    0x0000,
+                                    cfg->mmio32.size));
+    }
+    if (cfg->pio.size) {
+        aml_append(rbuf,
+                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
+                                cfg->pio.size - 1,
+                                cfg->pio.base,
+                                cfg->pio.size));
+    }
+    if (cfg->mmio64.size) {
+        aml_append(rbuf,
+                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                    cfg->mmio64.base,
+                                    cfg->mmio64.base + cfg->mmio64.size - 1,
+                                    0x0000,
+                                    cfg->mmio64.size));
+    }
+    aml_append(dev, aml_name_decl("_CRS", rbuf));
+
+    acpi_dsdt_add_pci_osc(dev);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
MST


