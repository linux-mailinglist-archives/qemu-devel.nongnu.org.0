Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E43F96F5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:28:26 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJY9n-0001IX-TD
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6u-0004LI-HZ; Fri, 27 Aug 2021 05:25:18 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6r-00025y-Qs; Fri, 27 Aug 2021 05:25:15 -0400
Received: by mail-vk1-xa31.google.com with SMTP id 1so1689654vkk.1;
 Fri, 27 Aug 2021 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PIRb512kHljFyTVHOfkp/0Rx4tH71wszfCwzgotmw4c=;
 b=kbnSiwAmiM1bEVZOUiRwcYoGiJkIms6RDGYljWRctz2g8lviAigTDxujpzZ1awhkoj
 H/9yw1XvYOMMxY9i9G76h7acOELvPemskVwBclYRczBeHz9eemXO7/LgMyR/g11nSYnq
 afPRp9PKbpzIROf7GBXEq2x388WP7Eca4DDMR9PPri7JeHedmQyEl94YIxV5FKZ+6tCz
 4oDqxCy/rIkdjJiZf8k4MrXqORqA2mr+ulruVTNx+m4ZeeQdola7AtXr3LgWdzzaygWi
 ZORvMpc+sqGvlx1Fw5j9S3RFnjMz2tawjsjzp7+1+1b8RJXLrClnSLZzYCKaD/Fn2NlV
 fVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PIRb512kHljFyTVHOfkp/0Rx4tH71wszfCwzgotmw4c=;
 b=ZoQzjbrqRVJPXj882WGlDaz/L8XQsbX6bFrkncGMlwhIXcWwmEa7itTnbg5hWhlOtv
 ecppbvuP7nRkg8qZ5iiXq4p2yBY38PYA1cObc8ZmKirBBEVa85Iem9x8KdqbztY8hSwz
 vorbdd961RKTALL9Q8Pm/U52vUafsgDWgVFVHPmviMRaB8nZk4vvEWjuJyoICrTfMeIO
 1iI5XjoD7AhDU9XKlp68PY0ZpnR768H3V5b3hf6GKpyO43ToMZ2ZMc0GVQXfnN1o/ghy
 ewL3J/TbPYwJBQY5cdFtlNjPDcJfKICWKHsncxJ0IBwPTnnVaxmjzcl7dmmd9OmMMxpL
 GoPQ==
X-Gm-Message-State: AOAM533i3xGbYhxPVxA/sIazxy80eRTo7ZVxV5/DmfVUY+azsoIyjqHL
 Nciy+rL103foklB3wGxDnysAcWNp9yY=
X-Google-Smtp-Source: ABdhPJyrF2USsT7MmlG4BwTpovt1pMTmWf+FYKe0hJoiUyhlVlxfizjHpixBAAHfpoITuViT5pGqfA==
X-Received: by 2002:a05:6122:1070:: with SMTP id
 k16mr5435544vko.11.1630056310003; 
 Fri, 27 Aug 2021 02:25:10 -0700 (PDT)
Received: from rekt.COMFAST ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id d17sm629180vsj.9.2021.08.27.02.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:25:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] spapr_numa.c: split FORM1 code into helpers
Date: Fri, 27 Aug 2021 06:24:52 -0300
Message-Id: <20210827092455.125411-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827092455.125411-1-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
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


