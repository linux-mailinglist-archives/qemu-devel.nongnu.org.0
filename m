Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957163F778F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:41:23 +0200 (CEST)
Received: from localhost ([::1]:54164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIu5i-0001r8-KD
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4N-0007d6-Dn; Wed, 25 Aug 2021 10:39:59 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIu4L-00072Z-Ro; Wed, 25 Aug 2021 10:39:59 -0400
Received: by mail-qk1-x735.google.com with SMTP id bk29so21626264qkb.8;
 Wed, 25 Aug 2021 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=hCuLQTTJ5O/CsBctH00kZm/gTdl8ygj6ZL3VL3fiM3KkBAFDvdBTDlF5lceZjcbwvV
 6xq+eXQYuG4B/26JaEN/W9VcwhIOD9tS/7ZWn6FamzbrzcIiaPH7RzFKNyIc/hwAm+3t
 XB3DzDeqdnsmK+RSbyZkdHRFONd1UPMukossT5AeETJb98/VBnnQ0uAtuwmX8u3D42E7
 d8y2V/KuAec1ZWD8EYVmUwZdLvBDar2RzKi6ncw1C43jiNmhqjoAQHCUsJ3R3zEsSwjx
 +jvO3kxaEbiZz4PpZAFHXv22jCPSbCoSc9uxlkVVzXbua7CDPTiZXzLJSh/+aAZGhBix
 WdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=pyXEH1v/TVKrVaNY5oPhB50avGpZbzwzg4KZbSHi58lUF9s7/HhLeZxWjVxBijOYlE
 CF03ts8FnCP5wCjfQ0OEQOLcmQo7w6puoezIkE0abvuPfZMEgMYzUhHEXtr3DKWEjR4/
 9BQNeCTc7oZt9YMKWLaZM4bdaGa7cx+yXzlN04uDGJ24fRkBW4ZrBVQPTUD0o4TZAkq3
 GxbfrdpEKdeSF2DyEwDy2V2aG1XEYjmwm0jm+JbTxoEd441uYcSeIaK8l6jFvrzZzvbQ
 WH/anfZ4T1An9d25FosBkeGtWc1+uzt8DMac8p3Nsq04YTuVZg7bpj+J8nPuwh+n1xZc
 P17w==
X-Gm-Message-State: AOAM530z4EXqD530slqZ5/WivUBm+WPodzz27IfH6oQSveOGK4AChGPk
 wm3OLr0GsZrvBB5vQ3X5ZflgbzhPpkc=
X-Google-Smtp-Source: ABdhPJzSF46VbAI99bzEk5Ypk9YZvARiVIY95QwilG8gHWldKRdadNEYahxymh0dgpcqax/l1EJEzQ==
X-Received: by 2002:a05:620a:1aa7:: with SMTP id
 bl39mr18897995qkb.304.1629902396560; 
 Wed, 25 Aug 2021 07:39:56 -0700 (PDT)
Received: from rekt.ihost.com ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id 69sm129819qke.55.2021.08.25.07.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 07:39:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v3 1/5] spapr_numa.c: split FORM1 code into helpers
Date: Wed, 25 Aug 2021 11:39:39 -0300
Message-Id: <20210825143943.529733-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143943.529733-1-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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


