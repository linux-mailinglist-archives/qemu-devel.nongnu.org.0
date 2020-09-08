Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA1260A17
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:32:07 +0200 (CEST)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFWEg-0002gK-Ir
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3u-0006uN-HA; Tue, 08 Sep 2020 01:20:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45295 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3s-00067F-3n; Tue, 08 Sep 2020 01:20:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkx2MX0z9sW6; Tue,  8 Sep 2020 15:20:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542409;
 bh=uXD1j989gi+UqljwaBJ4eXP5DEHu3m3tC+F0UdnctWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIGTpnh6gor0+Lfku1LL+LZRdWUs2u648aT5SkCsURWHKGjhJWtEduHu5B9yYVN/v
 D24V+tBhtW0BEXG0rYBOP3FX7YPvkWCWRbO1560mnna4gnqAhAY6cW5N1+MOI+Mkc6
 /uVMlKi70BL08ICYv/eSHr1JT3S5XhY2qHp6Rz1c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 29/33] spapr,
 spapr_numa: move lookup-arrays handling to spapr_numa.c
Date: Tue,  8 Sep 2020 15:19:49 +1000
Message-Id: <20200908051953.1616885-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:19:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

In a similar fashion as the previous patch, let's move the
handling of ibm,associativity-lookup-arrays from spapr.c to
spapr_numa.c. A spapr_numa_write_assoc_lookup_arrays() helper was
created, and spapr_dt_dynamic_reconfiguration_memory() can now
use it to advertise the lookup-arrays.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200903220639.563090-4-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c              | 25 ++-----------------------
 hw/ppc/spapr_numa.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr_numa.h |  2 ++
 3 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index badfa86319..9bce1892b5 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -535,13 +535,10 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
                                                    void *fdt)
 {
     MachineState *machine = MACHINE(spapr);
-    int nb_numa_nodes = machine->numa_state->num_nodes;
-    int ret, i, offset;
+    int ret, offset;
     uint64_t lmb_size = SPAPR_MEMORY_BLOCK_SIZE;
     uint32_t prop_lmb_size[] = {cpu_to_be32(lmb_size >> 32),
                                 cpu_to_be32(lmb_size & 0xffffffff)};
-    uint32_t *int_buf, *cur_index, buf_len;
-    int nr_nodes = nb_numa_nodes ? nb_numa_nodes : 1;
     MemoryDeviceInfoList *dimms = NULL;
 
     /*
@@ -582,25 +579,7 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
         return ret;
     }
 
-    /* ibm,associativity-lookup-arrays */
-    buf_len = (nr_nodes * 4 + 2) * sizeof(uint32_t);
-    cur_index = int_buf = g_malloc0(buf_len);
-    int_buf[0] = cpu_to_be32(nr_nodes);
-    int_buf[1] = cpu_to_be32(4); /* Number of entries per associativity list */
-    cur_index += 2;
-    for (i = 0; i < nr_nodes; i++) {
-        uint32_t associativity[] = {
-            cpu_to_be32(0x0),
-            cpu_to_be32(0x0),
-            cpu_to_be32(0x0),
-            cpu_to_be32(i)
-        };
-        memcpy(cur_index, associativity, sizeof(associativity));
-        cur_index += 4;
-    }
-    ret = fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", int_buf,
-            (cur_index - int_buf) * sizeof(uint32_t));
-    g_free(int_buf);
+    ret = spapr_numa_write_assoc_lookup_arrays(spapr, fdt, offset);
 
     return ret;
 }
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 523801fb14..42394f36e9 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -72,6 +72,40 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                        vcpu_assoc, sizeof(vcpu_assoc));
 }
 
+
+int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
+                                         int offset)
+{
+    MachineState *machine = MACHINE(spapr);
+    int nb_numa_nodes = machine->numa_state->num_nodes;
+    int nr_nodes = nb_numa_nodes ? nb_numa_nodes : 1;
+    uint32_t *int_buf, *cur_index, buf_len;
+    int ret, i;
+
+    /* ibm,associativity-lookup-arrays */
+    buf_len = (nr_nodes * MAX_DISTANCE_REF_POINTS + 2) * sizeof(uint32_t);
+    cur_index = int_buf = g_malloc0(buf_len);
+    int_buf[0] = cpu_to_be32(nr_nodes);
+     /* Number of entries per associativity list */
+    int_buf[1] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+    cur_index += 2;
+    for (i = 0; i < nr_nodes; i++) {
+        /*
+         * For the lookup-array we use the ibm,associativity array,
+         * from numa_assoc_array. without the first element (size).
+         */
+        uint32_t *associativity = spapr->numa_assoc_array[i];
+        memcpy(cur_index, ++associativity,
+               sizeof(uint32_t) * MAX_DISTANCE_REF_POINTS);
+        cur_index += MAX_DISTANCE_REF_POINTS;
+    }
+    ret = fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", int_buf,
+                      (cur_index - int_buf) * sizeof(uint32_t));
+    g_free(int_buf);
+
+    return ret;
+}
+
 /*
  * Helper that writes ibm,associativity-reference-points and
  * max-associativity-domains in the RTAS pointed by @rtas
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 43c6a16fe3..b3fd950634 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -29,5 +29,7 @@ void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
 int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
                             int offset, PowerPCCPU *cpu);
+int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
+                                         int offset);
 
 #endif /* HW_SPAPR_NUMA_H */
-- 
2.26.2


