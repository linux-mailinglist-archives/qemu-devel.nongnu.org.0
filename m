Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA768626113
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiw-00086t-Sm; Fri, 11 Nov 2022 13:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-00081j-US
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005Eo-8h
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so6109765wmb.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQkeUKm1twXXfPfIsnilZFEt6yWHJgbyKag7n6UlDUg=;
 b=HFOjYdGFAuNM4YZNAUUFHveHGZNzttZNkm8Vl90uGkYyq6mZ+82ZBaNlXYEIwy6w1P
 tjO2ClvJ97Kq/kO8ETndzjhxMplXLBuQCSrgU2L2mexVunoOML53o2FOlf7WAX9YL80W
 /QYK+QoxVKEd/6xytKOBNOAU4v2fP1AQTZTKqS6mtAAbIlguFff7wuEpiR82+KAohspa
 N5267oQaz2YMtgX89KaJ9mhdwdURaakSQ2H5aplNFjevSho3KlrhP7/E3AT2KvQ97fRC
 t6q76/MGyJGC0FymF7bcngAtZqK9oLY0b2b7zIp7KY/SK4+VzWe7c/7KTL/ShcW88P7F
 7ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQkeUKm1twXXfPfIsnilZFEt6yWHJgbyKag7n6UlDUg=;
 b=JuND5P0c+ev+sBoCMPVJ3BA1iWmaL6t1kAdvVVUobnIUUn+9Qw8qdVIzAat/cVzdAV
 Z96ze8Ga2HOvaNn+NNCIvZR0dtIu95JtnC1Tn8J0fp1AHCYD0lHxzJ/U9H0aNWAvRSXv
 qNGkpePL9FR80nuXJwDY+1CqRwdMsYXedj5v/qMcUdooJnHOVlIV2eLpnG60ozkM2TLW
 oEKISr2mAa+TXZR+9TlTv6JahSEnk4LUdVllEyuAKdXrFneD3SI7qrVnR/hIpfI7XLaP
 kerWGkhD1lMukKvTojrNRuWqZvuRh+Wif/gDmxmrX4/smBjetyQG2pgKpBEdZKa80QZK
 YdlQ==
X-Gm-Message-State: ANoB5pkXp73PBDqzhW3pZJdIOkC0r7DEPxLbL7nwo8eNV0EBOiShBSs/
 C2kqXx80D+U79w722cWbv7F4cg==
X-Google-Smtp-Source: AA0mqf4GsWBkLPynIrb2kt8CffFWtI3/k8wNv4LSD/NHTsqhOsqF9IkmWUvZgafy8xItu28wDzJWzA==
X-Received: by 2002:a05:600c:5029:b0:3b4:c00d:2329 with SMTP id
 n41-20020a05600c502900b003b4c00d2329mr2073320wmr.124.1668191136805; 
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a05600c225a00b003c21ba7d7d6sm3431498wmm.44.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFE121FFB8;
 Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM PrimeCell and...)
Subject: [PATCH  v5 01/20] hw: encode accessing CPU index in MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:16 +0000
Message-Id: <20221111182535.64844-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Places that checked to see if things where unspecified now instead
check the source if what they expected.

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
v5
  - re-order so MTRT_UNSPECIFIED is zero
  - fix up comments referring to the difference between empty and unspecified:1
  - kernel-doc annotations for typedefs
  - don't impose source type tz-msc during transformation
  - re-order bitfields so requester_type/id at top
  - add helper for MEMTXATTRS_PCI
---
 include/exec/memattrs.h | 68 ++++++++++++++++++++++++++++++++---------
 hw/i386/amd_iommu.c     |  6 ++--
 hw/i386/intel_iommu.c   |  2 +-
 hw/misc/tz-mpc.c        |  2 +-
 hw/misc/tz-msc.c        |  6 ++--
 hw/pci/pci.c            |  4 +--
 6 files changed, 60 insertions(+), 28 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..8359fc448b 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,7 +14,32 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
-/* Every memory transaction has associated with it a set of
+/**
+ * typedef MemTxRequesterType - source of memory transaction
+ *
+ * Every memory transaction comes from a specific place which defines
+ * how requester_id should be handled if at all.
+ *
+ * UNSPECIFIED: the default for otherwise undefined MemTxAttrs
+ * CPU: requester_id is the global cpu_index
+ *      This needs further processing if you need to work out which
+ *      socket or complex it comes from
+ * PCI: indicates the requester_id is a PCI id
+ * MACHINE: indicates a machine specific encoding
+ *          This will require further processing to decode into its
+ *          constituent parts.
+ */
+typedef enum MemTxRequesterType {
+    MTRT_UNSPECIFIED = 0,
+    MTRT_CPU,
+    MTRT_PCI,
+    MTRT_MACHINE
+} MemTxRequesterType;
+
+/**
+ * typedef MemTxAttrs - attributes of a memory transaction
+ *
+ * Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
  * bus (such as the ARM Secure/NonSecure bit). We define them
@@ -23,13 +48,12 @@
  * different semantics.
  */
 typedef struct MemTxAttrs {
-    /* Bus masters which don't specify any attributes will get this
-     * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
-     * distinguish "all attributes deliberately clear" from
-     * "didn't specify" if necessary.
-     */
-    unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /* Requester type (e.g. CPU or PCI MSI) */
+    MemTxRequesterType requester_type:2;
+    /* Requester ID */
+    unsigned int requester_id:16;
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
@@ -43,8 +67,6 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
-    unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
     /*
@@ -59,12 +81,28 @@ typedef struct MemTxAttrs {
     unsigned int target_tlb_bit2 : 1;
 } MemTxAttrs;
 
-/* Bus masters which don't specify any attributes will get this,
- * which has all attribute bits clear except the topmost one
- * (so that we can distinguish "all attributes deliberately clear"
- * from "didn't specify" if necessary).
+/*
+ * Bus masters which don't specify any attributes will get this which
+ * indicates none of the attributes can be used.
+ */
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
+
+/*
+ * Helper for setting a basic PCI sourced transaction, it expects a
+ * PCIDevice *
  */
-#define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
+#define MEMTXATTRS_PCI(dev) ((MemTxAttrs) \
+                             {.requester_type = MTRT_PCI,   \
+                             .requester_id = pci_requester_id(dev)})
 
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..284359c16e 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -153,9 +153,7 @@ static void amdvi_assign_andq(AMDVIState *s, hwaddr addr, uint64_t val)
 static void amdvi_generate_msi_interrupt(AMDVIState *s)
 {
     MSIMessage msg = {};
-    MemTxAttrs attrs = {
-        .requester_id = pci_requester_id(&s->pci.dev)
-    };
+    MemTxAttrs attrs = MEMTXATTRS_PCI(&s->pci.dev);
 
     if (msi_enabled(&s->pci.dev)) {
         msg = msi_get_message(&s->pci.dev, 0);
@@ -1356,7 +1354,7 @@ static MemTxResult amdvi_mem_ir_write(void *opaque, hwaddr addr,
 
     trace_amdvi_mem_ir_write_req(addr, value, size);
 
-    if (!attrs.unspecified) {
+    if (attrs.requester_type == MTRT_PCI) {
         /* We have explicit Source ID */
         sid = attrs.requester_id;
     }
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a08ee85edf..12752413eb 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3517,7 +3517,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
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
index acbe94400b..e93bfc7083 100644
--- a/hw/misc/tz-msc.c
+++ b/hw/misc/tz-msc.c
@@ -137,11 +137,9 @@ static MemTxResult tz_msc_read(void *opaque, hwaddr addr, uint64_t *pdata,
         return MEMTX_OK;
     case MSCAllowSecure:
         attrs.secure = 1;
-        attrs.unspecified = 0;
         break;
     case MSCAllowNonSecure:
         attrs.secure = 0;
-        attrs.unspecified = 0;
         break;
     }
 
@@ -179,11 +177,11 @@ static MemTxResult tz_msc_write(void *opaque, hwaddr addr, uint64_t val,
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
index 2f450f6a72..1d0d8d866f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -319,9 +319,7 @@ void pci_device_deassert_intx(PCIDevice *dev)
 
 static void pci_msi_trigger(PCIDevice *dev, MSIMessage msg)
 {
-    MemTxAttrs attrs = {};
-
-    attrs.requester_id = pci_requester_id(dev);
+    MemTxAttrs attrs = MEMTXATTRS_PCI(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
-- 
2.34.1


