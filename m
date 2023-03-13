Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D86B7BFF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8d-0007Nr-Qt; Mon, 13 Mar 2023 11:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8Z-0007NV-UG
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:31:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8Y-0003fw-31
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p16so8298155wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68P9o5ttMw0mQyQty14BLwj3xt8sf0BeuG7uOwOm8GE=;
 b=RqUdSL9QoTykLoyL0fG2E8r5QiAhnqa3dCQ9XIYs10zVCWdOoKwRKRNs5zuqqCV4Jg
 ur1iv4Ll8pxSMQ5LvUJe92ukHNot0l7bMhi/c23+F0fosm8bSng12gu/xueScQ2cX0tu
 PhMa5Gk0UnPdyRbCp+083dXjjNb52PncBoMAMKR0YfMrAbyXHXOSDwKQXRKm2JY5ZVNh
 dPqRdZst0HKiL/sFYLZzCw7NTWGWFzZeZi0q0xd1FmzDbY905LTL2ex4bL+6EQVWCfhr
 P3TpOrzUVpkq5kfULVaFmlPAFBnr1wBBe8vQluYStnOJZqtZb3/Fn9uh6w0TI8Yq1Iqc
 MSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68P9o5ttMw0mQyQty14BLwj3xt8sf0BeuG7uOwOm8GE=;
 b=XXzTC0luLRZv8WF/By6D5w2xD0X7qqm0V3OAoxrRdzbOwJznGZE7O8JnPM72dyK9yw
 k+yPJl3ej2f0oD+QhQW09blxIClTOBpmxcou7x85WnOpcOwor2g2LdRSCmHjAtIzfzY1
 zStBT22sK35X+/LsIVmxonE3O+medN7OxkBLhcIHG+OHv3GGRV7NSfVZI4yFtaul9CM5
 DCE6bcQhgp25GfPfemoD6Z0f9SEnvOuktcgiUh6RtkJWGffE3ap7Ou71sEu7TmO15ajQ
 yEDRYFza7CiUfTZqI/dtJmyCFY/Y+FbLXXEuQs3lOC2yxyHGqzvfxwfrvgnPbSJhagzf
 /88A==
X-Gm-Message-State: AO0yUKUnHrx6dscbREs6raGVipbUBZCUa8nG9aiDHhc+HsyHhdEcAdeW
 UtH/tEcIrxOD36bt/s6vcwdPfg==
X-Google-Smtp-Source: AK7set9Jw/s0lRtEA2OxLgJ7dsJ1R+emMyhUsJJb3v9clVHXlX2mOXRhNQmE+Fd+swkxuObAJDOKuw==
X-Received: by 2002:a05:600c:3acb:b0:3eb:2e2b:ff3d with SMTP id
 d11-20020a05600c3acb00b003eb2e2bff3dmr11267919wms.20.1678721456700; 
 Mon, 13 Mar 2023 08:30:56 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a1c4b17000000b003daffc2ecdesm80332wma.13.2023.03.13.08.30.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/i386/amd_iommu: Move capab_offset from AMDVIState to
 AMDVIPCIState
Date: Mon, 13 Mar 2023 16:30:29 +0100
Message-Id: <20230313153031.86107-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
References: <20230313153031.86107-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The 'PCI capability offset' is a *PCI* notion. Since AMDVIPCIState
inherits PCIDevice and hold PCI-related fields, move capab_offset
from AMDVIState to AMDVIPCIState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.c |  2 +-
 hw/i386/amd_iommu.c  | 14 +++++++-------
 hw/i386/amd_iommu.h  |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a27bc33956..7f211e1f48 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2399,7 +2399,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                               object_property_get_int(OBJECT(&s->pci), "addr",
                                                       &error_abort), 2);
     /* Capability offset */
-    build_append_int_noprefix(table_data, s->capab_offset, 2);
+    build_append_int_noprefix(table_data, s->pci.capab_offset, 2);
     /* IOMMU base address */
     build_append_int_noprefix(table_data, s->mmio.addr, 8);
     /* PCI Segment Group */
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 19f57e6318..9f6622e11f 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1516,15 +1516,15 @@ static void amdvi_init(AMDVIState *s)
     pci_config_set_class(s->pci.dev.config, 0x0806);
 
     /* reset AMDVI specific capabilities, all r/o */
-    pci_set_long(s->pci.dev.config + s->capab_offset, AMDVI_CAPAB_FEATURES);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_LOW,
                  AMDVI_BASE_ADDR & ~(0xffff0000));
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_BAR_HIGH,
                 (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_RANGE,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
-    pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC,
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC, 0);
+    pci_set_long(s->pci.dev.config + s->pci.capab_offset + AMDVI_CAPAB_MISC,
             AMDVI_MAX_PH_ADDR | AMDVI_MAX_GVA_ADDR | AMDVI_MAX_VA_ADDR);
 }
 
@@ -1557,7 +1557,7 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (ret < 0) {
         return;
     }
-    s->capab_offset = ret;
+    s->pci.capab_offset = ret;
 
     ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
                              AMDVI_CAPAB_REG_SIZE, errp);
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 5eccaad790..1c0cb54bd4 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -308,6 +308,7 @@ typedef struct AMDVIAddressSpace AMDVIAddressSpace;
 /* functions to steal PCI config space */
 typedef struct AMDVIPCIState {
     PCIDevice dev;               /* The PCI device itself        */
+    uint32_t capab_offset;       /* capability offset pointer    */
 } AMDVIPCIState;
 
 struct AMDVIState {
@@ -315,7 +316,6 @@ struct AMDVIState {
     AMDVIPCIState pci;          /* IOMMU PCI device             */
 
     uint32_t version;
-    uint32_t capab_offset;       /* capability offset pointer    */
 
     uint64_t mmio_addr;
 
-- 
2.38.1


