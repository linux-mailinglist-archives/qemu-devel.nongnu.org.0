Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D959BCCE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:27:36 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3iZ-0000SB-7w
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Q6-0001xV-Ck
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oQ3Q4-0007MC-LF
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:08:30 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so10586536pjf.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Uq7rnkz9r0R8TaOt9qWOib8IZqgaXtBX++KjATGxClI=;
 b=emH5I18MfDVk6nVXtbkg0ltvGgexHLRr7rmYUdqgJX9Tu8UZBWf1P+2yBOKRExRtjQ
 HsDH6WASnzW+yEhB2NztyOqHZJattCmujknYmvHlkZ39NWfUYO/spydSzR7opiEzkOlI
 fFyDDWXomyfP1z2fnKZV39LHE1RykYbbPbKCMPp/xprWMukT81EOgm5LWs7nHrlHzJ3u
 ft3hMmt6hn5P9HVPUGL+Er6CyoU3IL44Q5XlsGwB2ppwNxSMcorH1wTp++FDt7HbsWJr
 fXYmWE9jiIbqOhKi6tW6NKNPzKm98EtmDMTl4WS4Kp3CZXB38u20hd79Q2nn6mxwPeHp
 fMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Uq7rnkz9r0R8TaOt9qWOib8IZqgaXtBX++KjATGxClI=;
 b=cqlYGye2FdxBUGYQ4uL98hQOLXQ+8gmGjvtg3zsGnrL3YaygkjSrytV++UOVg9xRXL
 DDivyErh1hKEKOS7sl1DsJKfPdE0bAgipJqvXS1OjhAQK/G6XQPJ0n1uekhzYlxki5fU
 6a8YAzTtdqUvbB6By2Em8mOwCnC30FIRJNczJ0n9Npw0RTSlUaNnTOsjRlAO5s2XLLyy
 v51/ErZYaVZBh4bIfos3TUDKeA+e3gcBIeLvlzEwAjlAQZlnhC2b0meClzws0x5Kl6za
 4VtiBTyYL1ZgO20zjit7Tkuy9uTM8buFxVIr60f+1nWBx8RdXdFyyna/Gw8fK/W/5ur1
 nugw==
X-Gm-Message-State: ACgBeo1+7wuaRYwFU3naJNJfAdAN5qcPTGUUq/QH8Ovyw6GA+9UPzbp6
 M68msz8wtPCv3UAX5belcFnEmnpNyNKwqQ==
X-Google-Smtp-Source: AA6agR4czxh+37yHvsqYtfP1E/D1xdJ76s3L9U8jOSYBFBvjGu9tA7nqgWgh1FuNa+/B63A9c0v0Gw==
X-Received: by 2002:a17:903:32d2:b0:172:66e4:ba68 with SMTP id
 i18-20020a17090332d200b0017266e4ba68mr20180706plr.116.1661159306949; 
 Mon, 22 Aug 2022 02:08:26 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([116.73.134.198])
 by smtp.googlemail.com with ESMTPSA id
 a20-20020a62d414000000b00535e6dbda16sm7364539pfh.35.2022.08.22.02.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:08:26 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: yvugenfi@redhat.com, jusual@redhat.com, kkostiuk@redhat.com,
 ybendito@redhat.com
Subject: [PATCH 2/4] hw/acpi: set ATS capability explicitly per pcie root port
Date: Mon, 22 Aug 2022 14:38:09 +0530
Message-Id: <20220822090811.427029-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822090811.427029-1-ani@anisinha.ca>
References: <20220822090811.427029-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently the bit 0 of the flags field of Root Port ATS capability reporting
structure sub-table under the DMAR table is set to 1. This indicates ALL_PORTS,
thus enabling ATS capability for all pcie roots without the ability to turn off
ATS for some ports and leaving ATS on for others.

This change clears the bit 0 of the flags field of the above structure and
explicitly adds scopes for every pcie root port in the structure so that ATS
is enabled for all of them. In future, we might add new attribite to the root
ports so that we can selectively enable ATS for some and leave ATS off for
others.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Suggested-by: Michael Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0355bd3dda..9c5a555536 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -60,6 +60,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
 
@@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)
     return 0;
 }
 
+/*
+ * Insert DMAR scope for PCIE root ports
+ */
+static void
+insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    const size_t device_scope_size = 6 + 2;
+                                   /* device scope structure + 1 path entry */
+    GArray *scope_blob = opaque;
+
+    /*
+     * We are only interested in PCIE root ports. We can extend
+     * this to check for specific properties of PCIE root ports and based
+     * on that remove some ports from having ATS capability.
+     */
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT)) {
+        return;
+    }
+
+    /* Dmar Scope Type: 0x02 for all PCIE root ports */
+    build_append_int_noprefix(scope_blob, 0x02, 1);
+
+    /* length */
+    build_append_int_noprefix(scope_blob, device_scope_size, 1);
+    /* reserved */
+    build_append_int_noprefix(scope_blob, 0, 2);
+    /* enumeration_id */
+    build_append_int_noprefix(scope_blob, 0, 1);
+    /* bus */
+    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
+    /* device */
+    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
+    /* function */
+    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
+}
+
+/* For a given PCI host bridge, walk and insert DMAR scope */
+static int
+dmar_pcie_root_ports(Object *obj, void *opaque)
+{
+    GArray *scope_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            pci_for_each_device_under_bus(bus, insert_pcie_root_port_scope,
+                                          scope_blob);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * Intel ® Virtualization Technology for Directed I/O
  * Architecture Specification. Revision 3.3
@@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
 
     if (iommu->dt_supported) {
         /* 8.5 Root Port ATS Capability Reporting Structure */
+        /*
+         * A PCI bus walk, for each PCIE root port.
+         * Since we did not enable ALL_PORTS bit in the flags above, we
+         * need to add the scope for each pcie root port explicitly
+         * that are attached to bus0 with iommu enabled.
+         */
+        scope_blob = g_array_new(false, true, 1);
+        object_child_foreach_recursive(object_get_root(),
+                                       dmar_pcie_root_ports, scope_blob);
+
         build_append_int_noprefix(table_data, 2, 2); /* Type */
-        build_append_int_noprefix(table_data, 8, 2); /* Length */
-        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /* Flags */
+        build_append_int_noprefix(table_data,
+                                  8 + scope_blob->len, 2); /* Length */
+        build_append_int_noprefix(table_data, 0, 1); /* Flags */
         build_append_int_noprefix(table_data, 0, 1); /* Reserved */
         build_append_int_noprefix(table_data, 0, 2); /* Segment Number */
+
+        /* now add the scope to the sub-table */
+        g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
+        g_array_free(scope_blob, true);
     }
 
     acpi_table_end(linker, &table);
-- 
2.25.1


