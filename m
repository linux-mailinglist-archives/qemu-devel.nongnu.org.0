Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5125D022
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 06:02:51 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2w6-0002qm-Gj
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 00:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2i2-0003et-Sn; Thu, 03 Sep 2020 23:48:18 -0400
Received: from ozlabs.org ([203.11.71.1]:55909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2i0-0004zB-G7; Thu, 03 Sep 2020 23:48:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsv1Ffmz9sWF; Fri,  4 Sep 2020 13:47:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191251;
 bh=XULsY1KQq35g6GNXDRirXo6GNLLyX2G9qfFOU3fwaQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QQn3bQCWnm6VUO7+p2gnpza1K2MyqeX42gjUBAG2Sg1PW0h1mJtgjYvLqbMkIAnSe
 Wy1wQ9+Se5ziwg1rKefLy79jwtwrJVyqF2/wSZ9BimdFh/Ydjb5+ugQ/8Hc1d/dpUV
 AuBzXUwIJg5fUhXfLG3SI5Hn4fJ+QEKOCoIOVT/0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/30] spapr, spapr_numa: handle vcpu ibm,associativity
Date: Fri,  4 Sep 2020 13:47:17 +1000
Message-Id: <20200904034719.673626-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Vcpus have an additional paramenter to be appended, vcpu_id. This
also changes the size of the of property itself, which is being
represented in index 0 of numa_assoc_array[cpu->node_id],
and defaults to MAX_DISTANCE_REF_POINTS for all cases but
vcpus.

All this logic makes more sense in spapr_numa.c, where we handle
everything NUMA and associativity. A new helper spapr_numa_fixup_cpu_dt()
was added, and spapr.c uses it the same way as it was using the former
spapr_fixup_cpu_numa_dt().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200903220639.563090-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              | 17 +----------------
 hw/ppc/spapr_numa.c         | 27 +++++++++++++++++++++++++++
 include/hw/ppc/spapr_numa.h |  2 ++
 3 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 1ad6f59863..badfa86319 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -202,21 +202,6 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
     return ret;
 }
 
-static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, PowerPCCPU *cpu)
-{
-    int index = spapr_get_vcpu_id(cpu);
-    uint32_t associativity[] = {cpu_to_be32(0x5),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(0x0),
-                                cpu_to_be32(cpu->node_id),
-                                cpu_to_be32(index)};
-
-    /* Advertise NUMA via ibm,associativity */
-    return fdt_setprop(fdt, offset, "ibm,associativity", associativity,
-                          sizeof(associativity));
-}
-
 static void spapr_dt_pa_features(SpaprMachineState *spapr,
                                  PowerPCCPU *cpu,
                                  void *fdt, int offset)
@@ -785,7 +770,7 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
                       pft_size_prop, sizeof(pft_size_prop))));
 
     if (ms->numa_state->num_nodes > 1) {
-        _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cpu));
+        _FDT(spapr_numa_fixup_cpu_dt(spapr, fdt, offset, cpu));
     }
 
     _FDT(spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt));
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index f6b6fe648f..1a1ec8bcff 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -45,6 +45,33 @@ void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                       sizeof(spapr->numa_assoc_array[nodeid]))));
 }
 
+int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
+                            int offset, PowerPCCPU *cpu)
+{
+    uint vcpu_assoc_size = NUMA_ASSOC_SIZE + 1;
+    uint32_t vcpu_assoc[vcpu_assoc_size];
+    int index = spapr_get_vcpu_id(cpu);
+    int i;
+
+    /*
+     * VCPUs have an extra 'cpu_id' value in ibm,associativity
+     * compared to other resources. Increment the size at index
+     * 0, copy all associativity domains already set, then put
+     * cpu_id last.
+     */
+    vcpu_assoc[0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS + 1);
+
+    for (i = 1; i <= MAX_DISTANCE_REF_POINTS; i++) {
+        vcpu_assoc[i] = spapr->numa_assoc_array[cpu->node_id][i];
+    }
+
+    vcpu_assoc[vcpu_assoc_size - 1] = cpu_to_be32(index);
+
+    /* Advertise NUMA via ibm,associativity */
+    return fdt_setprop(fdt, offset, "ibm,associativity",
+                       vcpu_assoc, sizeof(vcpu_assoc));
+}
+
 /*
  * Helper that writes ibm,associativity-reference-points and
  * max-associativity-domains in the RTAS pointed by @rtas
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index a2a4df55f7..43c6a16fe3 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -27,5 +27,7 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
+int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
+                            int offset, PowerPCCPU *cpu);
 
 #endif /* HW_SPAPR_NUMA_H */
-- 
2.26.2


