Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10240D13C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:33:21 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgHA-0001HU-CE
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEM-0006p8-6u; Wed, 15 Sep 2021 21:30:26 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEI-0004E5-2c; Wed, 15 Sep 2021 21:30:25 -0400
Received: by mail-qk1-x72f.google.com with SMTP id b64so5833295qkg.0;
 Wed, 15 Sep 2021 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9snP2SQ90EsaopUkwhiL3G+yqbxkthjiliUkz9xzmQM=;
 b=KocPYGQiQFi6KyhqwGdoPSLcrgGPTiCcJCxr8DZNpaIHBNl0OOPirySZ+QjCgcepBa
 naKZgM/RalfkkscnJ4gFGVYAotjlpKHufaRU2TCHmR457uV/nfYvn4UojaJpkTwoL1zb
 YzDySo7l4Pni2YDilgkz+hXbNyVSdUwGVIG6GfuRkNb7h+0m4FKAoHFiW1zQuOjegq0G
 gFbo+2ZpopnI/QiOJz6oEg9xerC7drsgRlPsZn7ybvLfOrXzidgHUEJpQv72OqA4qw1s
 oRQd+oWl0zJumJC9izcdfvcksjpPLaPpSluP0w6MwbY5xWGq3CABHKLx4s9LNG7ib3yF
 jTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9snP2SQ90EsaopUkwhiL3G+yqbxkthjiliUkz9xzmQM=;
 b=zb1s4Yq/pzLE9h6oeyxgb0Lq4abmWFJPNdvH0GCVEWc9709wIkq2GIw1RUmoJZMIua
 HSo6SRkGEz1v2HTyg4irc0q/p+CJZv5XYTHKfUupA9VI5/eDEXO9l4N+tntvNQgooPYc
 eLEUDyMnRrZCLgxcm+emMJVJHdBoUwcTnaPobo8w7jF3TwdTs4a6co8lc1Kzy33ynsr5
 c8NvS4PG2908fkllr4AbrDSzowfFnjMcA1fovB6FYKASy403resqIMHiNy28Tmv49yR/
 DQ6uLq4fwAbeXwrpbF/Qo0kNEg5T3uoqLbliU5g5R93A3eOlb9HFzgNFPnGUERH360Uv
 q6xA==
X-Gm-Message-State: AOAM533HZyV/f7spih3t7gpNykqzGMsE94ofj2RdLPto9u9guMMi4707
 KoH73mFDvWQSI1bfbYk7JAtUXRI9wqk=
X-Google-Smtp-Source: ABdhPJwImA6cMq2yk0vwdL2Csubxx0R9Ah89hSmrem7xavAzasmb/ztxXPmxLKERyUwmP63FepTuhw==
X-Received: by 2002:a37:43cf:: with SMTP id q198mr2938101qka.470.1631755820792; 
 Wed, 15 Sep 2021 18:30:20 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/7] spapr_numa.c: scrap 'legacy_numa' concept
Date: Wed, 15 Sep 2021 22:29:59 -0300
Message-Id: <20210916013004.272059-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916013004.272059-1-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
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

When first introduced, 'legacy_numa' was a way to refer to guests that
either wouldn't be affected by associativity domain calculations, namely
the ones with only 1 NUMA node, and pre 5.2 guests that shouldn't be
affected by it because it would be an userspace change. Calling these
cases 'legacy_numa' was a convenient way to label these cases.

We're about to introduce a new NUMA affinity, FORM2, and this concept
of 'legacy_numa' is now a bit misleading because, although it is called
'legacy' it is in fact a FORM1 exclusive contraint.

This patch removes spapr_machine_using_legacy_numa() and open code the
conditions in each caller. While we're at it, move the chunk inside
spapr_numa_FORM1_affinity_init() that sets all numa_assoc_array domains
with 'node_id' to spapr_numa_define_FORM1_domains(). This chunk was
being executed if !pre_5_2_numa_associativity and num_nodes => 1, the
same conditions in which spapr_numa_define_FORM1_domains() is called
shortly after.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 47 +++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 786def7c73..bf520d42b2 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,15 +19,6 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
-static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
-{
-    MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
-
-    return smc->pre_5_2_numa_associativity ||
-           machine->numa_state->num_nodes <= 1;
-}
-
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
@@ -97,7 +88,18 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
     MachineState *ms = MACHINE(spapr);
     NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
-    int src, dst, i;
+    int src, dst, i, j;
+
+    /*
+     * Fill all associativity domains of non-zero NUMA nodes with
+     * node_id. This is required because the default value (0) is
+     * considered a match with associativity domains of node 0.
+     */
+    for (i = 1; i < nb_numa_nodes; i++) {
+        for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
+            spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
+        }
+    }
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = src; dst < nb_numa_nodes; dst++) {
@@ -164,7 +166,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     int i, j, max_nodes_with_gpus;
-    bool using_legacy_numa = spapr_machine_using_legacy_numa(spapr);
 
     /*
      * For all associativity arrays: first position is the size,
@@ -178,17 +179,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     for (i = 0; i < nb_numa_nodes; i++) {
         spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
-
-        /*
-         * Fill all associativity domains of non-zero NUMA nodes with
-         * node_id. This is required because the default value (0) is
-         * considered a match with associativity domains of node 0.
-         */
-        if (!using_legacy_numa && i != 0) {
-            for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
-                spapr->numa_assoc_array[i][j] = cpu_to_be32(i);
-            }
-        }
     }
 
     /*
@@ -214,11 +204,13 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
     }
 
     /*
-     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
-     * 1 NUMA node) will not benefit from anything we're going to do
-     * after this point.
+     * Guests pseries-5.1 and older uses zeroed associativity domains,
+     * i.e. no domain definition based on NUMA distance input.
+     *
+     * Same thing with guests that have only one NUMA node.
      */
-    if (using_legacy_numa) {
+    if (smc->pre_5_2_numa_associativity ||
+        machine->numa_state->num_nodes <= 1) {
         return;
     }
 
@@ -334,7 +326,8 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
         cpu_to_be32(maxdomain)
     };
 
-    if (spapr_machine_using_legacy_numa(spapr)) {
+    if (smc->pre_5_2_numa_associativity ||
+        ms->numa_state->num_nodes <= 1) {
         uint32_t legacy_refpoints[] = {
             cpu_to_be32(0x4),
             cpu_to_be32(0x4),
-- 
2.31.1


