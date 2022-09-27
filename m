Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C65EC88C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:50:44 +0200 (CEST)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCr5-0006ge-C6
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMj-00055h-W8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMb-0005yA-50
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so895535wmr.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gjSZ32211XyjP4AalLHKuJrm0n7lepu/2c5c9y26d4M=;
 b=AXJ03JnSBVPdEv+bEq+TA5noChnaJ/wsrqKMP/E2M6ldjjqS1sOn8lchpS9yReDe5E
 RrjQyKIlFB1tkwL31vpwkZA3n5U0dept2PhnWtnAecb/6vlHg4JardXV6/lmMgc5wUsi
 WABnwDA2J7W7tDEEnhvFI5PrUjMgNFPlsHTOJZEIecI+Bu0TwUhmjcCBb26JINxgDbOK
 atn77v0EMoyQ848olTFVO/Z5KJeuR1ZWS5HrSYak/gxMiVG0HfyDBEV+K9+QFaz8vq5x
 T9cJ4EjdZXNXKKu0wSdZeVi/wxozWXTCixGqOwXCPWLjXMjSo4wcjeVhydCJG0X6Ijto
 8VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gjSZ32211XyjP4AalLHKuJrm0n7lepu/2c5c9y26d4M=;
 b=hg7Hr0h7inyTRbKHlEizw+SvsDMdcQ5lT/nZKg+P0J+xsSbTy3InlJ+zPl68w9fPL8
 799s5ZpMRuy+5iqn/TgDNbBNDH1uAn76lnbiWsc7eEGuOh6S94D1Uize3TZ/jdsYwiWf
 or7MW2kptmqEW2WYeYN48Rbn62yAySoliFVXHYrmK+kjIDZJ+sT5ulbzufQ394AHMiQR
 /MCKv/2gIVU2EKHhjiJ0nIZiss4+5wr0FSkjbYwfUEnXF0GdKhE8yQdijxj6FLwbyISr
 qF8R6ZCgJ0pUmI+cllEFnedSSUy+n4Qaz0TKD3p8QQWJTlTiWlFnTJcrqlYGJeRLbe5Z
 t+YA==
X-Gm-Message-State: ACrzQf2vj79drVsfji0OMuqRgiZsZMX+RlkRzdBi5yog5eW14r5lAIHX
 Ov1Jucur2f1w6HEgOu1zdBhcrA==
X-Google-Smtp-Source: AMsMyM4dUiZ+xRZwtkmyHQgzhd0Pz3yo1POTOmrmlBDcEDODq91mFBvwe5p3FyzvVIYMf1+ZWEh2LA==
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id
 f7-20020a05600c154700b003b4c56ba3a6mr2957201wmg.29.1664288106941; 
 Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5546000000b00228aea99efcsm1929458wrw.14.2022.09.27.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4445E1FFB8;
 Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:50 +0100
Message-Id: <20220927141504.3886314-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently have hacks across the hw/ to reference current_cpu to
work out what the current accessing CPU is. This breaks in some cases
including using gdbstub to access HW state. As we have MemTxAttrs to
describe details about the access lets extend it so CPU accesses can
be explicitly marked.

To achieve this we create a new requester_type which indicates to
consumers how requester_id it to be consumed. We absorb the existing
unspecified:1 bitfield into this type and also document a potential
machine specific encoding which will be useful to (currently)
out-of-tree extensions.

There are a number of places we need to fix up including:

  CPU helpers directly calling address_space_*() fns
  models in hw/ fishing the data out of current_cpu
  hypervisors offloading device emulation to QEMU

I'll start addressing some of these in following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use separate field cpu_index
  - bool for requester_is_cpu
v3
  - switch to enum MemTxRequesterType
  - move helper #define to patch
  - revert to overloading requester_id
  - mention hypervisors in commit message
  - drop cputlb tweaks, they will move to target specific code
v4
  - merge unspecified:1 into MTRT_UNSPECIFIED
  - document a MTRT_MACHINE for more complex encoding
  - ensure existing users of requester_id set MTRT_PCI
  - ensure existing consumers of requester_id check type is MTRT_PCI
  - have MEMTXATTRS_CPU take CPUState * directly
---
 include/exec/memattrs.h | 39 +++++++++++++++++++++++++++++++--------
 hw/i386/amd_iommu.c     |  3 ++-
 hw/i386/intel_iommu.c   |  2 +-
 hw/misc/tz-mpc.c        |  2 +-
 hw/misc/tz-msc.c        |  8 ++++----
 hw/pci/pci.c            |  7 ++++---
 6 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..67625c6344 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,6 +14,24 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
+/*
+ * Every memory transaction comes from a specific place which defines
+ * how requester_id should be handled. For CPU's the requester_id is
+ * the global cpu_index which needs further processing if you need to
+ * work out which socket or complex it comes from. UNSPECIFIED is the
+ * default for otherwise undefined MemTxAttrs. PCI indicates the
+ * requester_id is a PCI id. MACHINE indicates a machine specific
+ * encoding which needs further processing to decode into its
+ * constituent parts.
+ */
+typedef enum MemTxRequesterType {
+    MTRT_CPU = 0,
+    MTRT_UNSPECIFIED,
+    MTRT_PCI,
+    MTRT_MACHINE
+} MemTxRequesterType;
+
+
 /* Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
@@ -23,12 +41,6 @@
  * different semantics.
  */
 typedef struct MemTxAttrs {
-    /* Bus masters which don't specify any attributes will get this
-     * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
-     * distinguish "all attributes deliberately clear" from
-     * "didn't specify" if necessary.
-     */
-    unsigned int unspecified:1;
     /* ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
@@ -43,7 +55,9 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester type (e.g. CPU or PCI MSI) */
+    MemTxRequesterType requester_type:2;
+    /* Requester ID */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
@@ -64,7 +78,16 @@ typedef struct MemTxAttrs {
  * (so that we can distinguish "all attributes deliberately clear"
  * from "didn't specify" if necessary).
  */
-#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
+#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) \
+                                { .requester_type = MTRT_UNSPECIFIED })
+
+/*
+ * Helper for setting a basic CPU sourced transaction, it expects a
+ * CPUState *
+ */
+#define MEMTXATTRS_CPU(cs) ((MemTxAttrs) \
+                            {.requester_type = MTRT_CPU, \
+                             .requester_id = cs->cpu_index})
 
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..8db2b6b692 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -154,6 +154,7 @@ static void amdvi_generate_msi_interrupt(AMDVIState *s)
 {
     MSIMessage msg = {};
     MemTxAttrs attrs = {
+        .requester_type = MTRT_PCI,
         .requester_id = pci_requester_id(&s->pci.dev)
     };
 
@@ -1356,7 +1357,7 @@ static MemTxResult amdvi_mem_ir_write(void *opaque, hwaddr addr,
 
     trace_amdvi_mem_ir_write_req(addr, value, size);
 
-    if (!attrs.unspecified) {
+    if (attrs.requester_type == MTRT_PCI) {
         /* We have explicit Source ID */
         sid = attrs.requester_id;
     }
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 05d53a1aa9..89b9b9a3e6 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3394,7 +3394,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
     from.address = (uint64_t) addr + VTD_INTERRUPT_ADDR_FIRST;
     from.data = (uint32_t) value;
 
-    if (!attrs.unspecified) {
+    if (attrs.requester_type == MTRT_PCI) {
         /* We have explicit Source ID */
         sid = attrs.requester_id;
     }
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 30481e1c90..4beb5daa1a 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -461,7 +461,7 @@ static int tz_mpc_attrs_to_index(IOMMUMemoryRegion *iommu, MemTxAttrs attrs)
      * All the real during-emulation transactions from the CPU will
      * specify attributes.
      */
-    return (attrs.unspecified || attrs.secure) ? IOMMU_IDX_S : IOMMU_IDX_NS;
+    return ((attrs.requester_type == MTRT_UNSPECIFIED) || attrs.secure) ? IOMMU_IDX_S : IOMMU_IDX_NS;
 }
 
 static int tz_mpc_num_indexes(IOMMUMemoryRegion *iommu)
diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
index acbe94400b..0b47972a46 100644
--- a/hw/misc/tz-msc.c
+++ b/hw/misc/tz-msc.c
@@ -137,11 +137,11 @@ static MemTxResult tz_msc_read(void *opaque, hwaddr addr, uint64_t *pdata,
         return MEMTX_OK;
     case MSCAllowSecure:
         attrs.secure = 1;
-        attrs.unspecified = 0;
+        attrs.requester_type = MTRT_CPU;
         break;
     case MSCAllowNonSecure:
         attrs.secure = 0;
-        attrs.unspecified = 0;
+        attrs.requester_type = MTRT_CPU;
         break;
     }
 
@@ -179,11 +179,11 @@ static MemTxResult tz_msc_write(void *opaque, hwaddr addr, uint64_t val,
         return MEMTX_OK;
     case MSCAllowSecure:
         attrs.secure = 1;
-        attrs.unspecified = 0;
+        attrs.requester_type = MTRT_CPU;
         break;
     case MSCAllowNonSecure:
         attrs.secure = 0;
-        attrs.unspecified = 0;
+        attrs.requester_type = MTRT_CPU;
         break;
     }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2f450f6a72..ccdd71e4ba 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -319,9 +319,10 @@ void pci_device_deassert_intx(PCIDevice *dev)
 
 static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
+    MemTxAttrs attrs = {
+        .requester_type = MTRT_PCI,
+        .requester_id = pci_requester_id(dev)
+    };
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
-- 
2.34.1


