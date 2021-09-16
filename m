Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5342940D13B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:33:21 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgH9-0001HB-Qu
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEK-0006ol-Ip; Wed, 15 Sep 2021 21:30:25 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:37820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEH-0004BI-2T; Wed, 15 Sep 2021 21:30:24 -0400
Received: by mail-qk1-x72d.google.com with SMTP id 73so680884qki.4;
 Wed, 15 Sep 2021 18:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=qmuVWrU+TMBQXERIC7Gf7G+6NBPIx6lkENmzyOXyTFWINyAEAWXJIG//wGZSmvHy+b
 f4F2t7HwuUyCXYtOStb4ECwlYWIrERTj9L1dItrarDpb6HSoJEOWihuBKcboh5Y0hdCG
 v6XGCgSVgzGwjtMtU4SnJzR8llfiblPoD8YMPopmTvvGTgzorr2HA3lJoxWciKJ7EU3a
 DLKyPgPTE3Z1UMEFpb8HjKvorgTTyKs9dsmeVzwwEGOIj8QpUtSZv59P8ZWpRwRTgdJi
 Q/AUjhnCF+7fAslV/RaoNgIPhZQN7nwIesE0sbQ8DjnQa4v6q/lTe81ZkpsRgpKYEZ/z
 j9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=V2RTjY4+zl+i/vn4vkq0mx+avddXieugL3q2zwL+tvPdyXMJVFvQjjOL/CecaTtFee
 FrZLY+GU21DeSZHcFHavVaOCfT8kKL33KxgMt4nB9HaGP9qSQ5ZbUGe+mRIhwRu0Wldg
 R9IqbB77mu+NWNc3unLrVBudL/DZQydSrtdjZMGu2axiORxWW/kP7PgjUQbQEps2QJDH
 zI14ACnhhCC9d7j64c6TOerzNa6NBNdCqQn0xVdzWERgWV9UzMVg4qszCb4Pm5WKJdiw
 RkKoBQPquuJhDjIhH1N84g+50wm2C/LZ5ZLTyEMwbAfJ7PFcjLmp5MAqPYT5psR/AtBo
 MYTQ==
X-Gm-Message-State: AOAM5306Aq+P26UcouxtnNO+J4L8TuWkERqTIEKnsKeQfWW/W4cI9AeH
 m7efh8BYuJ0RHjLKynDqmXt6gjAF3ZA=
X-Google-Smtp-Source: ABdhPJxxeeOtyWMevjtayT+ghd5zHVhw+d/nAQTIB2BDBRM+6+m3KVP1ZKydY8J42y6IrGVvIwmnlg==
X-Received: by 2002:a37:9cc8:: with SMTP id f191mr2894696qke.113.1631755818949; 
 Wed, 15 Sep 2021 18:30:18 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/7] spapr_numa.c: split FORM1 code into helpers
Date: Wed, 15 Sep 2021 22:29:58 -0300
Message-Id: <20210916013004.272059-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916013004.272059-1-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
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


