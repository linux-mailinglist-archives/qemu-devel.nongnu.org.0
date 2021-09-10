Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B440723F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:02:14 +0200 (CEST)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmiz-0005q2-Ve
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmd4-0005Vh-Bg; Fri, 10 Sep 2021 15:56:08 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmd2-0006DB-CG; Fri, 10 Sep 2021 15:56:06 -0400
Received: by mail-qk1-x72a.google.com with SMTP id bk29so3312035qkb.8;
 Fri, 10 Sep 2021 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yblo498m6P+waxUTZyt/YLrTpH6VQgxXC7Mf/1PG7x8=;
 b=NWQDIFVdYfAhfjMMDIc6UAv6t7949AlFfpVqMlTFy6L5/4H0nGMQ0r8qmzbhfQR/Mx
 F5gbPjyzo830uH+6dkRrRN5TaZdOJBsfvAnNw0OhP9wCaYaV/xnNfFwdi6u0nfIFzLuG
 J/2ntDW/zQjZ6igQ6h6HIKzBU/AiQ99jVLd7m3j6TgnhrZBOw7LTsWxDUFhMAMdszPTo
 nFT05OW9b7M49eWRbH3njv4tcXUue1jnOdRo9vGZzEu0jjlCwfopuAgQN57GEmegFdqy
 SJwBTlCJphHLPU6eRuWK4vYgBolhSbQSqtKWdhEZ3cndXRd3ENe/1Dg0C1caJNRXWTj/
 +UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yblo498m6P+waxUTZyt/YLrTpH6VQgxXC7Mf/1PG7x8=;
 b=2rjGvypWX0EJQ0tS0Boz4MPBPyZPoi+WbRtiqo8wohhO9TlPP1xSAS2tfJ/BE+4SXG
 kqQlDNX9IWNxeI0JaHcfnQz4NEYDYBY3tq0jibtQ3cPX3jbGyCpIkOQ1mYozVG4mPJSe
 DTwNost+KrGtsTsINlMhX93xfhlo4E0kSK1mCWvH7+PlczRlpK1YukkKz6tNmCdvevUH
 /piheLLeCWntSr6NEKG1PKANQ/39CGSyvKv8V5xFIgZjAjDQKgUz6/xOdnW5GyLGP+9T
 WIh+knfDYGz5xZFiFAiWdCwCgGKA4f3bK3Lw30JFTmWCNgAOZ0uD5rNK+bObbeT0Yzy1
 Mp9A==
X-Gm-Message-State: AOAM530yAUQFELqo9jrCAGl5pC/SdKPTCHAdIhWNIoWv3kDBS0S8EgLa
 MdTUnib6hGqvfbGN4CMtDOK8WIcclKw=
X-Google-Smtp-Source: ABdhPJzRJeAuQTwyoxgJPVcgwjf+IpPl+nL0xgGz2m9em2PKZkTIi0G2cRJyPwqOqc1oDXWrN50P4A==
X-Received: by 2002:a05:620a:1397:: with SMTP id
 k23mr9210949qki.380.1631303762915; 
 Fri, 10 Sep 2021 12:56:02 -0700 (PDT)
Received: from rekt.COMFAST ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id k10sm3873356qth.44.2021.09.10.12.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:56:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/6] spapr: introduce spapr_numa_associativity_reset()
Date: Fri, 10 Sep 2021 16:55:36 -0300
Message-Id: <20210910195539.797170-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910195539.797170-1-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing a new NUMA affinity, FORM2, requires a new mechanism to
switch between affinity modes after CAS. Also, we want FORM2 data
structures and functions to be completely separated from the existing
FORM1 code, allowing us to avoid adding new code that inherits the
existing complexity of FORM1.

At the same time, it's also desirable to minimize the amount of changes
made in write_dt() functions that are used to write ibm,associativity of
the resources, RTAS artifacts and h_home_node_associativity. These
functions can work in the same way in both NUMA affinity modes, as long
as we use a similar data structure and parametrize it properly depending
on the affinity mode selected.

This patch introduces spapr_numa_associativity_reset() to start this
process. This function will be used to switch to the chosen NUMA
affinity after CAS and after migrating the guest. To do that, the
existing 'numa_assoc_array' is renamed to 'FORM1_assoc_array' and will
hold FORM1 data that is populated at associativity_init().
'numa_assoc_array' is now a pointer that can be switched between the
existing affinity arrays. We don't have FORM2 data structures yet, so
'numa_assoc_array' will always point to 'FORM1_assoc_array'.

We also take the precaution of pointing 'numa_assoc_array' to
'FORM1_assoc_array' in associativity_init() time, before CAS, to not
change FORM1 availability for existing guests.

A small change in spapr_numa_write_associativity_dt() is made to reflect
the fact that 'numa_assoc_array' is now a pointer and we must be
explicit with the size being written in the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c              | 14 +++++++++++++
 hw/ppc/spapr_hcall.c        |  7 +++++++
 hw/ppc/spapr_numa.c         | 42 +++++++++++++++++++++++++++++--------
 include/hw/ppc/spapr.h      |  3 ++-
 include/hw/ppc/spapr_numa.h |  1 +
 5 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d39fd4e644..5afbb76cab 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1786,6 +1786,20 @@ static int spapr_post_load(void *opaque, int version_id)
         return err;
     }
 
+    /*
+     * NUMA affinity selection is made in CAS time. There is no reliable
+     * way of telling whether the guest already went through CAS before
+     * migration due to how spapr_ov5_cas_needed works: a FORM1 guest can
+     * be migrated with ov5_cas empty regardless of going through CAS
+     * first.
+     *
+     * One solution is to call numa_associativity_reset(). The downside
+     * is that a guest migrated before CAS will reset it again when going
+     * through it, but since it's a lightweight operation it's worth being
+     * a little redundant to be safe.
+     */
+     spapr_numa_associativity_reset(spapr);
+
     return err;
 }
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 0e9a5b2e40..82ab92ddba 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -17,6 +17,7 @@
 #include "kvm_ppc.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/spapr_ovec.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-book3s-v3.h"
 #include "hw/mem/memory-device.h"
 
@@ -1197,6 +1198,12 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
+    /*
+     * Reset numa_assoc_array now that we know which NUMA affinity
+     * the guest will use.
+     */
+    spapr_numa_associativity_reset(spapr);
+
     /*
      * Ensure the guest asks for an interrupt mode we support;
      * otherwise terminate the boot.
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index fb6059550f..327952ba9e 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -97,7 +97,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
      */
     for (i = 1; i < nb_numa_nodes; i++) {
         for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
-            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+            spapr->FORM1_assoc_array[i][j] = cpu_to_be32(i);
         }
     }
 
@@ -149,8 +149,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              * and going up to 0x1.
              */
             for (i = n_level; i > 0; i--) {
-                assoc_src = spapr->numa_assoc_array[src][i];
-                spapr->numa_assoc_array[dst][i] = assoc_src;
+                assoc_src = spapr->FORM1_assoc_array[src][i];
+                spapr->FORM1_assoc_array[dst][i] = assoc_src;
             }
         }
     }
@@ -167,6 +167,11 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int i, j, max_nodes_with_gpus;
 
+    /* init FORM1_assoc_array */
+    for (i = 0; i < MAX_NODES + NVGPU_MAX_NUM; i++) {
+        spapr->FORM1_assoc_array[i] = g_new0(uint32_t, NUMA_ASSOC_SIZE);
+    }
+
     /*
      * For all associativity arrays: first position is the size,
      * position MAX_DISTANCE_REF_POINTS is always the numa_id,
@@ -177,8 +182,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
      * 'i' will be a valid node_id set by the user.
      */
     for (i = 0; i < nb_numa_nodes; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
-        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -192,15 +197,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
 
     for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
-        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
+        spapr->FORM1_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
 
         for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
             uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
-            spapr->numa_assoc_array[i][j] = gpu_assoc;
+            spapr->FORM1_assoc_array[i][j] = gpu_assoc;
         }
 
-        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
+        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
     }
 
     /*
@@ -227,14 +232,33 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine)
 {
     spapr_numa_FORM1_affinity_init(spapr, machine);
+
+    /*
+     * Default to FORM1 affinity until CAS. We'll call affinity_reset()
+     * during CAS when we're sure about which NUMA affinity the guest
+     * is going to use.
+     *
+     * This step is a failsafe - guests in the wild were able to read
+     * FORM1 affinity info before CAS for a long time. Since affinity_reset()
+     * is just a pointer switch between data that was already populated
+     * here, this is an acceptable overhead to be on the safer side.
+     */
+    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
+}
+
+void spapr_numa_associativity_reset(SpaprMachineState *spapr)
+{
+    /* No FORM2 affinity implemented yet */
+    spapr->numa_assoc_array = spapr->FORM1_assoc_array;
 }
 
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid)
 {
+    /* Hardcode the size of FORM1 associativity array for now */
     _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
                       spapr->numa_assoc_array[nodeid],
-                      sizeof(spapr->numa_assoc_array[nodeid]))));
+                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
 }
 
 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 637652ad16..8a9490f0bf 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -249,7 +249,8 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
+    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM];
+    uint32_t **numa_assoc_array;
 
     Error *fwnmi_migration_blocker;
 };
diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
index 6f9f02d3de..ccf3e4eae8 100644
--- a/include/hw/ppc/spapr_numa.h
+++ b/include/hw/ppc/spapr_numa.h
@@ -24,6 +24,7 @@
  */
 void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine);
+void spapr_numa_associativity_reset(SpaprMachineState *spapr);
 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas);
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
                                        int offset, int nodeid);
-- 
2.31.1


