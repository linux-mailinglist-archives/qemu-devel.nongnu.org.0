Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDCE407234
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:58:21 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmfE-00084m-Pr
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmcz-0005KY-Ij; Fri, 10 Sep 2021 15:56:01 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mOmcy-00068N-1n; Fri, 10 Sep 2021 15:56:01 -0400
Received: by mail-qk1-x732.google.com with SMTP id c10so3299566qko.11;
 Fri, 10 Sep 2021 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxtZtWDgZA6YJSxyyw3iHUi2LBO3kQ0MAQByjWcSlJI=;
 b=Fakp+l4wBbe3WQ8JxYsv9XRhbm0NEeswrGwSP6RxeE8whJBC8kCgmqUpAujGbc1x9r
 0MQDZ6ScaGbxD7HYIhqUwS1dVsmrfYNXH53pLwTRHCsdAYPLhqRHdwHWZ6go6Z986T3g
 euZnrvJSVw9rmyPtMD+9jmI+RVTKtw3raVo2aDo1fftNnGWG17rzrG1xWLyK9/bAKs66
 Yaa5lQj6siGYAftX1n9fwZSLvVGqiAvSQjnU5SOV9beMIEW9eySQhjZQ2RWz3/ptS+Uz
 H7fPHlLGpxd801Ge7P6YpniAbD8qsk2ZxpOd+X5fxxMLQ1Wqu/YG7GXq8UCEPnC7fE4P
 Fo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxtZtWDgZA6YJSxyyw3iHUi2LBO3kQ0MAQByjWcSlJI=;
 b=qZokLgs7eATHb4WiLVhq9nw3gY3zYDW4onr993QXq6dV+fqh5sGDrle9scuk2z0CnC
 rHK9KKXUBYHRBTxqeTnaO77xxsE+8MRuPbY/08a1XEkdTMbnTg3549pWZGUXCsyeGr3A
 OgnWxVmKVaonbx/QA3g8MnNhSU0F2R/uWl/dbRZAwPXR44SM9rzLCDjUkaI10gDK8O6+
 Kh3hdmTd1QEsfBOMnf3L/236MqHImrArGpnAu6vYIYKOWCegvYetRTA7n/HUcg2Hx1G/
 m8odm65XFUvN+TTkaaZY0yv3ilZ2CsfD1Ixv2pJkzYpXbZOtcc+CrJuz8PXyohhjpapj
 V1sg==
X-Gm-Message-State: AOAM531oeXIYo/XwjoCX2Enx1kd7KaM4SRA/gLndGLRq7E+0YD5vLSoA
 k1RFxnU59GEehx4AMqZ2fD40GLGdFyE=
X-Google-Smtp-Source: ABdhPJzNps809OPP3/klZuqq5FCc3izjBWqIdNeEgTIUy+eHUR1+Vw6ECsIJRTPDpO3vKInJqKhUXQ==
X-Received: by 2002:a37:f613:: with SMTP id y19mr9262483qkj.524.1631303758764; 
 Fri, 10 Sep 2021 12:55:58 -0700 (PDT)
Received: from rekt.COMFAST ([191.193.98.206])
 by smtp.gmail.com with ESMTPSA id k10sm3873356qth.44.2021.09.10.12.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:55:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] spapr_numa.c: split FORM1 code into helpers
Date: Fri, 10 Sep 2021 16:55:34 -0300
Message-Id: <20210910195539.797170-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910195539.797170-1-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
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


