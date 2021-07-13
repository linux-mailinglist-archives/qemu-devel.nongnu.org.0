Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C33C7762
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:42:31 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OIY-0003CP-P8
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OH8-0000oO-Ic; Tue, 13 Jul 2021 15:41:03 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m3OH4-0006Oq-AU; Tue, 13 Jul 2021 15:41:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c15so11582980pls.13;
 Tue, 13 Jul 2021 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=jslYnNe23rnzuLK8IeGxfLkHlaFfq/mslSwvTCgLzkAOkB/d9vSK7H5MrYJ7V/7M9d
 cvpuGgJUjtNFQBjxDDNjj1ZIs/BW0o2j0b3bzLIfvkWswkdD1mGDF7qeVhcyeoH750fq
 b0DmpFXc7+ESKlKlUW9DU3sWxvbWMqIpxjwV6JfalHlvxDCJl+56j9CL9UTdz3mMCPX9
 +jStBUQ1htmAQcfFpVTsZBQULiGAtkM2FLhgDBCnP5ym9ZLJuLcrEoeUrrAPoboFxjhF
 gDTFmpemcypuIY5x1sngTgiwXEPcLtLdZ08U4qSsCXEotMbqxynSDr/fhe8sWSSNbGDw
 xj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AqJ/CANn+mLhqYcCkmI2qej991jLbuz2Di1qLnOGcV8=;
 b=en9XufI89iVsbMzwGntTmrcz6VDKArtDOw7uFj0yZDZ7sK53icCjSkiY0YMvJ3htBu
 re2KwIQ103oQ+jOkUcU3iTEK3AE+1doRRopNou8zKFP4n1ToXm0RM18zD8fJ9x1fwkDr
 CsxR176DBDRy0gFpFuCqgYb1V5eSUj3nE7i9+xIjDz0b/TId0IAYnwfeDQS0bnY8q6eE
 TdWT7tyelE/tRlTsM5BE9+3QCADYEahpXJrMyW6JRgFhXDXksDlPiS/yfVduj+a2oxEx
 BjHjtr0wF/TJi0VyMml0W+uMzalwYt3XaGLIx9Lvholsj/SwvGNEuW+4rUJMstkgRVqZ
 t8VA==
X-Gm-Message-State: AOAM5308CPFfnWeKDM/JcnPrWiJzFonh0vEzAtyAR4f2hR2VccXmpi5K
 ygwcDWRSnc1A6z/YbU5GWKcEDFcXTlw/nM7Ym8E=
X-Google-Smtp-Source: ABdhPJy1ygD8BGqH1wcEl3/9jyja7tI88yO9NbvUGLPj33M583r0x5FFi9c1d9DR86yMOZI56sOrVQ==
X-Received: by 2002:a17:902:864c:b029:10d:8c9e:5f56 with SMTP id
 y12-20020a170902864cb029010d8c9e5f56mr4866182plt.8.1626205256185; 
 Tue, 13 Jul 2021 12:40:56 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id o72sm20077506pfg.44.2021.07.13.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:40:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/5] spapr_numa.c: split FORM1 code into helpers
Date: Tue, 13 Jul 2021 16:40:41 -0300
Message-Id: <20210713194045.916263-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713194045.916263-1-danielhb413@gmail.com>
References: <20210713194045.916263-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x62e.google.com
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


