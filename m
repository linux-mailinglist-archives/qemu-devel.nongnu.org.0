Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C866C3725E0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:38:09 +0200 (CEST)
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoh6-0007Sb-Q4
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0X-0006Ai-Ad; Tue, 04 May 2021 01:54:09 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0V-0004sq-6f; Tue, 04 May 2021 01:54:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CM1Nmwz9srX; Tue,  4 May 2021 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107599;
 bh=1d7nN6jGRx7ijwvK8kfjaNHQNkM9cCoWtEW4yFnwJIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qhw399nPrBz8j/LjhPVOwfb7jF6zziIHkCu6ZF/w9keaoYTa6R0yeD4X1wReBppBH
 y10x4x0VbBqT7HBFBbhuGoiFtOaGygeJNxvlx5Exkb/CZiVeWZnuFIA+fvDm+tTifM
 cvoVBnvWA9GtWVxLpJoZN2Yi/OW1wlASGnm6Ikbk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 27/46] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
Date: Tue,  4 May 2021 15:52:53 +1000
Message-Id: <20210504055312.306823-28-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

Add support for H_SCM_HEALTH hcall described at [1] for spapr
nvdimms. This enables guest to detect the 'unarmed' status of a
specific spapr nvdimm identified by its DRC and if its unarmed, mark
the region backed by the nvdimm as read-only.

The patch adds h_scm_health() to handle the H_SCM_HEALTH hcall which
returns two 64-bit bitmaps (health bitmap, health bitmap mask) derived
from 'struct nvdimm->unarmed' member.

Linux kernel side changes to enable handling of 'unarmed' nvdimms for
ppc64 are proposed at [2].

References:
[1] "Hypercall Op-codes (hcalls)"
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/powerpc/papr_hcalls.rst#n220
[2] "powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe"
    https://lore.kernel.org/linux-nvdimm/20210329113103.476760-1-vaibhav@linux.ibm.com/

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Message-Id: <20210402102128.213943-1-vaibhav@linux.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_nvdimm.c  | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  3 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index b46c36917c..252204e25f 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -31,6 +31,10 @@
 #include "qemu/range.h"
 #include "hw/ppc/spapr_numa.h"
 
+/* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c */
+/* SCM device is unable to persist memory contents */
+#define PAPR_PMEM_UNARMED PPC_BIT(0)
+
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp)
 {
@@ -467,6 +471,37 @@ static target_ulong h_scm_unbind_all(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                 target_ulong opcode, target_ulong *args)
+{
+
+    NVDIMMDevice *nvdimm;
+    uint64_t hbitmap = 0;
+    uint32_t drc_index = args[0];
+    SpaprDrc *drc = spapr_drc_by_index(drc_index);
+    const uint64_t hbitmap_mask = PAPR_PMEM_UNARMED;
+
+
+    /* Ensure that the drc is valid & is valid PMEM dimm and is plugged in */
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    nvdimm = NVDIMM(drc->dev);
+
+    /* Update if the nvdimm is unarmed and send its status via health bitmaps */
+    if (object_property_get_bool(OBJECT(nvdimm), NVDIMM_UNARMED_PROP, NULL)) {
+        hbitmap |= PAPR_PMEM_UNARMED;
+    }
+
+    /* Update the out args with health bitmap/mask */
+    args[0] = hbitmap;
+    args[1] = hbitmap_mask;
+
+    return H_SUCCESS;
+}
+
 static void spapr_scm_register_types(void)
 {
     /* qemu/scm specific hcalls */
@@ -475,6 +510,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_BIND_MEM, h_scm_bind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
+    spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
 }
 
 type_init(spapr_scm_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bf7cab7a2c..d2b5a9bdf9 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -538,8 +538,9 @@ struct SpaprMachineState {
 #define H_SCM_BIND_MEM          0x3EC
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
+#define H_SCM_HEALTH            0x400
 
-#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
+#define MAX_HCALL_OPCODE        H_SCM_HEALTH
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
-- 
2.31.1


