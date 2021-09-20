Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7C1412055
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:53:01 +0200 (CEST)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNTQ-0005Gj-NR
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQZ-0001ii-Nt; Mon, 20 Sep 2021 13:50:05 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQX-0008QJ-5i; Mon, 20 Sep 2021 13:50:03 -0400
Received: by mail-qt1-x82b.google.com with SMTP id a13so2291512qtw.10;
 Mon, 20 Sep 2021 10:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=PQWKIB4S0Zxvt1It95Sesq/Q74CrDLcV81sw18LPMvThIewANb9HxZWpV8ll6E+jIA
 /b5ruzU9craQVCeRYQuMUa0YFE7FYMxqsum7hYhWp9qj7Vj0zGOpOn9Ed3wFe95lkKjf
 JKi2CfAcN3hclwQY5VLbyXAULbqN4pYZ9XaLtIqEmQbi/oqwpVengLt64b9a9t6fd+ZX
 UpHx/n+FHXVadtSNXzNzxLem4YbDk5AWeyF7rpKlZf2xNsRQ/63slSWxqsfGadVIgCky
 Jkj4oaJN162SJkS6+829415929S0iTa1Gptrz9W52TzcfPWBGXGWG0ClSX0Y/n10Zzri
 xvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=HM9JMe9SMxOtGJNGWVU7Rn82R362PRJFLfDOg6FdR6dyedhkvEpnONtHsjhH3sGANf
 eQx6oe2mFbhxDlE0jlcoQBJ9Kqpwq3qqB/VDzK9RKld56LnuBwesVTUCNL+uqxdAEY3t
 bqcTG62f85wvyiwkeHovCoVW4gyOOb4eA49zWtsYLtceHhNtq7wY05S1nfUP7ep01S+Z
 kh5U8yQEGi3HcMvp5OMGFR4yhwG/dbx2tlCO5ESBb4lcyqFDMR5o8GR6iZYwWbUPWCMP
 HJ48OFHjCItsxhCl7shKxJ/Xu2xM6XYaRBxocwxshr9kvG0DRKER2bfotH2r872KpyGn
 fZ4w==
X-Gm-Message-State: AOAM530AscGQJhMvG/AyLEE366wzW/6kgiqycNMam7KXg/eyUwvh0B8K
 tnlYHEn6UUsRmFQgyYLlWyhtT1TJgPE=
X-Google-Smtp-Source: ABdhPJyfBIBB0Tg991s6zFfIXX/XKeTv50Hg1dYwsADcm3q1CaAMFLbCfMH5UwecSZsmyFREOWWILw==
X-Received: by 2002:ac8:5796:: with SMTP id v22mr24013805qta.373.1632160199880; 
 Mon, 20 Sep 2021 10:49:59 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:49:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/7] spapr_numa.c: split FORM1 code into helpers
Date: Mon, 20 Sep 2021 14:49:41 -0300
Message-Id: <20210920174947.556324-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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

The upcoming FORM2 NUMA affinity will support asymmetric NUMA topologies
and doesn't need be concerned with all the legacy support for older
pseries FORM1 guests.

We're also not going to calculate associativity domains based on numa
distance (via spapr_numa_define_associativity_domains) since the
distances will be written directly into new DT properties.

Let's split FORM1 code into its own functions to allow for easier
insertion of FORM2 logic later on.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 779f18b994..786def7c73 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -92,7 +92,7 @@ static uint8_t spapr_numa_get_numa_level(uint8_t distance)
     return 0;
 }
 
-static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
+static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 {
     MachineState *ms = MACHINE(spapr);
     NodeInfo *numa_info = ms->numa_state->nodes;
@@ -155,8 +155,11 @@ static void spapr_numa_define_associativity_domains(SpaprMachineState *spapr)
 
 }
 
-void spapr_numa_associativity_init(SpaprMachineState *spapr,
-                                   MachineState *machine)
+/*
+ * Set NUMA machine state data based on FORM1 affinity semantics.
+ */
+static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
+                                           MachineState *machine)
 {
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
@@ -225,7 +228,13 @@ void spapr_numa_associativity_init(SpaprMachineState *spapr,
         exit(EXIT_FAILURE);
     }
 
-    spapr_numa_define_associativity_domains(spapr);
+    spapr_numa_define_FORM1_domains(spapr);
+}
+
+void spapr_numa_associativity_init(SpaprMachineState *spapr,
+                                   MachineState *machine)
+{
+    spapr_numa_FORM1_affinity_init(spapr, machine);
 }
 
 void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *fdt,
@@ -302,12 +311,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
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
@@ -365,6 +370,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
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


