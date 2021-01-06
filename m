Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25A2EB886
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:43:41 +0100 (CET)
Received: from localhost ([::1]:58426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzjY-0002rt-1Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0005jy-1x; Tue, 05 Jan 2021 22:38:48 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:41399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzej-0006IY-Mt; Tue, 05 Jan 2021 22:38:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG5Cxpz9sWD; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=rauz9a4LNjb2edZsFUYdJEWrFGe6tWNhNPFu8fymbZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O2IwOOGXanJCVRz8QtaEIc6pYU6zDczBzJeqa5ufhfAL8qNdxu1hF1qPPXW8/+IKw
 GJ1Iu2nPPW6QwauD+8ZCEdn4WSTe3jmTvFpXAtys3wq2px11E0qQpIVPb59+PVNu74
 cGnX/oXlWBDIBjUKcGl3jtE6L9eRwq5y5C57hTwg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/22] spapr: Fix DR properties of the root node
Date: Wed,  6 Jan 2021 14:38:01 +1100
Message-Id: <20210106033816.232598-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Section 13.5.2 of LoPAPR mandates various DR related indentifiers
for all hot-pluggable entities to be exposed in the "ibm,drc-indexes",
"ibm,drc-power-domains", "ibm,drc-names" and "ibm,drc-types" properties
of their parent node. These properties are created with spapr_dt_drc().

PHBs and LMBs are both children of the machine. Their DR identifiers
are thus supposed to be exposed in the afore mentioned properties of
the root node.

When PHB hot-plug support was added, an extra call to spapr_dt_drc()
was introduced: this overwrites the existing properties, previously
populated with the LMB identifiers, and they end up containing only
PHB identifiers. This went unseen so far because linux doesn't care,
but this is still not conformant with LoPAPR.

Fortunately spapr_dt_drc() is able to handle multiple DR entity types
at the same time. Use that to handle DR indentifiers for PHBs and LMBs
with a single call to spapr_dt_drc(). While here also account for PMEM
DR identifiers, which were forgotten when NVDIMM hot-plug support was
added. Also add an assert to prevent further misuse of spapr_dt_drc().

With -m 1G,maxmem=2G,slots=8 passed on the QEMU command line we get:

Without this patch:

/proc/device-tree/ibm,drc-indexes
		 0000001f 20000001 20000002 20000003
		 20000000 20000005 20000006 20000007
		 20000004 20000009 20000008 20000010
		 20000011 20000012 20000013 20000014
		 20000015 20000016 20000017 20000018
		 20000019 2000000a 2000000b 2000000c
		 2000000d 2000000e 2000000f 2000001a
		 2000001b 2000001c 2000001d 2000001e

These are the DRC indexes for the 31 possible PHBs.

With this patch:

/proc/device-tree/ibm,drc-indexes
		 0000002b 90000000 90000001 90000002
		 90000003 90000004 90000005 90000006
		 90000007 20000001 20000002 20000003
		 20000000 20000005 20000006 20000007
		 20000004 20000009 20000008 20000010
		 20000011 20000012 20000013 20000014
		 20000015 20000016 20000017 20000018
		 20000019 2000000a 2000000b 2000000c
		 2000000d 2000000e 2000000f 2000001a
		 2000001b 2000001c 2000001d 2000001e
		 80000004 80000005 80000006 80000007

And now we also have the 4 ((2G - 1G) / 256M) LMBs and the
8 (slots) PMEMs.

Fixes: 3998ccd09298 ("spapr: populate PHB DRC entries for root DT node")
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160794479566.35245.17809158217760761558.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c     | 21 ++++++++++++---------
 hw/ppc/spapr_drc.c |  6 ++++++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 08f57f9164..68a3ceb927 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1120,6 +1120,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
     MachineState *machine = MACHINE(spapr);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+    uint32_t root_drc_type_mask = 0;
     int ret;
     void *fdt;
     SpaprPhbState *phb;
@@ -1194,8 +1195,18 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
 
     spapr_dt_cpus(fdt, spapr);
 
+    /* ibm,drc-indexes and friends */
     if (smc->dr_lmb_enabled) {
-        _FDT(spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_LMB));
+        root_drc_type_mask |= SPAPR_DR_CONNECTOR_TYPE_LMB;
+    }
+    if (smc->dr_phb_enabled) {
+        root_drc_type_mask |= SPAPR_DR_CONNECTOR_TYPE_PHB;
+    }
+    if (mc->nvdimm_supported) {
+        root_drc_type_mask |= SPAPR_DR_CONNECTOR_TYPE_PMEM;
+    }
+    if (root_drc_type_mask) {
+        _FDT(spapr_dt_drc(fdt, 0, NULL, root_drc_type_mask));
     }
 
     if (mc->has_hotpluggable_cpus) {
@@ -1233,14 +1244,6 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
         }
     }
 
-    if (smc->dr_phb_enabled) {
-        ret = spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_PHB);
-        if (ret < 0) {
-            error_report("Couldn't set up PHB DR device tree properties");
-            exit(1);
-        }
-    }
-
     /* NVDIMM devices */
     if (mc->nvdimm_supported) {
         spapr_dt_persistent_memory(spapr, fdt);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index f991cf89a0..fc7e321fcd 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -832,6 +832,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
     GString *drc_names, *drc_types;
     int ret;
 
+    /*
+     * This should really be only called once per node since it overwrites
+     * the OF properties if they already exist.
+     */
+    g_assert(!fdt_get_property(fdt, offset, "ibm,drc-indexes", NULL));
+
     /* the first entry of each properties is a 32-bit integer encoding
      * the number of elements in the array. we won't know this until
      * we complete the iteration through all the matching DRCs, but
-- 
2.29.2


