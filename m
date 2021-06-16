Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698C3A8E5D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:29:36 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKN5-0007nq-9L
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDr-0003FN-Sn; Tue, 15 Jun 2021 21:20:03 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKDq-0004Ev-1l; Tue, 15 Jun 2021 21:20:03 -0400
Received: by mail-qk1-x72e.google.com with SMTP id k11so994753qkk.1;
 Tue, 15 Jun 2021 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=YZtgJWh99NgYWFpDKsnPgduJMkYDAIof+Z6BzcWYf5ABL1LvjwFyLbPKZTHyJtsIM4
 OX5CZhvFGwiy0L8Mvbpc0btwAk8qT9jEhDqPQYcdb1rxeaJUWY7pqQRA1Gx+BOOnBqDv
 D07n+cj/R49TlEsEoYALB52wJjCPOU6ZpxyQElvBTBX1vTZHzoLhOtl0Pga/jINzFVaZ
 M7AJ7csAzxPm93bh8BcyfCNYXA/sMJDoPRpxY33RvIHV2njeSFb/CgEcdtxL2lWeiLVe
 s5NVPiA2iUj1yujDov89ku5tLDcHTmw60pG+w2jDSZiLaFo1icAydQoY0PQHPlM9L6qd
 awtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=gyYaTIDC/XPdUCn1VaF2KjhS/+2ZHDN1MbTnRNo9Pot16SiHDSSZ9J27curfpp4p3U
 TxQlHoO0X0Rg3NnpFExXT+c6zJWpkjOAYFWQ1XD8KDe4nQCLPSUwRgwOQ332rBOuuv7U
 6bG35Zko25ko2Ckjdh/9A9fOxM6IXLoara4oK/jFQsHlc8+wjO8idbAv1acwoEhBCjAa
 uRO3vXBbegbI4zpzK0WqbafxxL4dLwhEeghHxFTDh1hsQS5F7ObtgKRkifnSHWX/OfU2
 w51Na6CvUAFRMfcJcwJa3GK299gIrJG71q+VAeGMvTKwi8jEuJboZYTDxMxy7h85sch0
 cjmA==
X-Gm-Message-State: AOAM530cxTXd0IUhV22UmCu5itCI/+9mM2wB0dBuj1SHmOpdw2b13vxX
 TCXJXpqlxuWIJHjSHS8wQofV2Rlx4uE=
X-Google-Smtp-Source: ABdhPJzMTSkCr8et+f/QjsKhXhavnF1mCTf2JtvG9KPYzqroVzpP3w8sApX6sh0z9FPLsUkj94nesQ==
X-Received: by 2002:a05:620a:1129:: with SMTP id
 p9mr2632100qkk.163.1623806399735; 
 Tue, 15 Jun 2021 18:19:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:19:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/7] spapr_numa.c: split FORM1 code into helpers
Date: Tue, 15 Jun 2021 22:19:38 -0300
Message-Id: <20210616011944.2996399-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The upcoming FORM2 NUMA affinity will support asymmetric NUMA topologies
and doesn't need be concerned with all the legacy support for older
pseries FORM1 guests.

We're also not going to calculate associativity domains based on numa
distance (via spapr_numa_define_associativity_domains) since the
distances will be written directly into new DT properties.

Let's split FORM1 code into its own functions to allow for easier
insertion of FORM2 logic later on.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 61 +++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 779f18b994..04a86f9b5b 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -155,6 +155,32 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
 
 }
 
+/*
+ * Set NUMA machine state data based on FORM1 affinity semantics.
+ */
+static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
+                                           MachineState *machine)
+{
+    bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
+
+    /*
+     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
+     * 1 NUMA node) will not benefit from anything we're going to do
+     * after this point.
+     */
+    if (using_legacy_numa) {
+        return;
+    }
+
+    if (!spapr_numa_is_symmetrical(machine)) {
+        error_report("Asymmetrical NUMA topologies aren't supported "
+                     "in the pSeries machine");
+        exit(EXIT_FAILURE);
+    }
+
+    spapr_numa_define_associativity_domains(spapr);
+}
+
 void spapr_numa_associativity_init(SpaprMachineState *spapr,
                                    MachineState *machine)
 {
@@ -210,22 +236,7 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
     }
 
-    /*
-     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
-     * 1 NUMA node) will not benefit from anything we're going to do
-     * after this point.
-     */
-    if (using_legacy_numa) {
-        return;
-    }
-
-    if (!spapr_numa_is_symmetrical(machine)) {
-        error_report("Asymmetrical NUMA topologies aren't supported "
-                     "in the pSeries machine");
-        exit(EXIT_FAILURE);
-    }
-
-    spapr_numa_define_associativity_domains(spapr);
+    spapr_numa_FORM1_affinity_init(spapr, machine);
 }
 
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
@@ -302,12 +313,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
     return ret;
 }
 
-/*
- * Helper that writes ibm,associativity-reference-points and
- * max-associativity-domains in the RTAS pointed by @rtas
- * in the DT @fdt.
- */
-void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
+static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
+                                           void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
@@ -365,6 +372,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
                      maxdomains, sizeof(maxdomains)));
 }
 
+/*
+ * Helper that writes ibm,associativity-reference-points and
+ * max-associativity-domains in the RTAS pointed by @rtas
+ * in the DT @fdt.
+ */
+void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
+{
+    spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
+}
+
 static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
                                               SpaprMachineState *spapr,
                                               target_ulong opcode,
-- 
2.31.1


