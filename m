Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8307B4100BE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:33:23 +0200 (CEST)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLU2-0002Jr-LS
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLP7-00039T-TF; Fri, 17 Sep 2021 17:28:17 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:44851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLP6-0007lg-BT; Fri, 17 Sep 2021 17:28:17 -0400
Received: by mail-oi1-x22c.google.com with SMTP id o66so13145205oib.11;
 Fri, 17 Sep 2021 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=BqlgjChOOOscwUgTTA3JbZL2PZA8OtiRrwUtdKA1iKJAWzL7/EDNe4KmlG2M0MQo9b
 sAT3wP+QHmje9/9kFLA41bBpN/JtR39bsq57BynB1LU510kP6r8SqDk1K7gd7h2BP0P8
 x/h6ZrtnVMONznGxfydr8FYKOpDZAs69TB9UbIb1MV6PPRkjkY5hEkeQEdT41gIy7Ti2
 RD5rAN7PKCd2i0NCx6EKrom5PBGlnNJK+OqZ9rCIHr8DWSWhkP9bsBI7hJpSlOsD2OCS
 Du3WohD0IVJJ1PtJqo2GhNSOuSfzPd8hDHkRIB7dO6EwzzM9thB/DCGapX3dsOC9eebi
 +ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uCwUlAEuHu9NPWjIuULqWyr2j0RMt56Ie8slVpbbpAE=;
 b=6SU78E3VpL/gwvqTrKBs8pPr9d8/gSbelucK1+rKO9EEBfYALURzDYh2j300f8J1HU
 hqi5IPlclF5H3D9TmxOs5x2pMsN+d3nrHsm7qZ2JKqfH+V7cxOxr9mN8uPG473J5LrGf
 54j0Wje43q1H3xlB4Fcg1PrZVhUwC8dPv7Hrg64I/OdrGmwKq5fg6ucy5R94igEDF2Qy
 fprO3ssl47f0TBI1kFDdj/oMomZ7j6VzGHI4P7Y3phXt3Vg6OvFUoVEYng16zPj1ky/b
 oErQ7ELGpmbM9MeyfXgkcGSRYDQx9AQa/Yxc8O0biIQPvF7JxNVBAsh+ZfpAsr7sNIrX
 BMcQ==
X-Gm-Message-State: AOAM531eEONiyOZGj8I6dblkFqJHUK+70SukKvwNaToq0c7JBgUQksJh
 R8jmsF66ntETv6acsnRf27V/MG26iA0=
X-Google-Smtp-Source: ABdhPJyEf1P79Dr8JfytOHZG9lCn3XPKaHln8Oxrf867oP/LGs9y3G+lzWN9EzYN4+cJoyeXMfT6hQ==
X-Received: by 2002:aca:f108:: with SMTP id p8mr5575216oih.63.1631914093348;
 Fri, 17 Sep 2021 14:28:13 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id s16sm710560otq.78.2021.09.17.14.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 14:28:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/7] spapr_numa.c: split FORM1 code into helpers
Date: Fri, 17 Sep 2021 18:27:56 -0300
Message-Id: <20210917212802.424481-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917212802.424481-1-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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


