Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FF4021A8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:29:11 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNOz8-0001Yq-PZ
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvp-0003wC-SK; Mon, 06 Sep 2021 20:25:45 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:34424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNOvn-0005iA-6e; Mon, 06 Sep 2021 20:25:45 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id e18so4837618qvo.1;
 Mon, 06 Sep 2021 17:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78x2NwMDsIaWD5wj157LidavEe4AZL2cMvVX/tKpj/k=;
 b=pZWODoMSPeMH/p7UIQb7jD0z5uvExyT+LcKRqZL8MzH4lLCjos48rWA1+/pX4oo1bj
 4yiTJn/Zeu7HHI8qUuDeBG2Fo/+gT3b8Evoxh2uHZDEKwprkcrY4Z6lAlb2z9DEVUIdP
 BFnrpNgnSv4N5eAn/43mmK66jqdy74yRlCiL9Vi1NHdYCYKamaaB0+ZWul9Su/0y1Go3
 JpR8Wuv0bo/dLH/dh3hNE0lS7NvQDQZzuW9Nu+ZbyEBuwB1Kzdn+oHR21Ypt6IYcw8TN
 UiBRI4rqxX74BpwKACtgA5iGIjVM+0DAoTDXmqy72JlD8+foArKZfrfIQ/5TVTBu8lNH
 /9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78x2NwMDsIaWD5wj157LidavEe4AZL2cMvVX/tKpj/k=;
 b=tchw7V/hmYcNA7UOPSR4sL2rCVSV/8WbS+0hsBAneAYE7agPJGtg2erviqmHwTfLpO
 8NVJ/HcrnJP8JxuDwhPtIZ0n6k/whZafFKbKKJvaSaUMWMYOLy2P+wXfQ0OS+XAO9MX/
 oNMwOHLQbk4NerEinabkZnH2j4MhNTbOm8ZxMhP9tosYhyhrgBWx/8djv9y+BlDvzIZT
 iHDDnbrRu4gM0ZjwbdRFaZq2UMAlufHsx94ma5jJNZx2/DJa9xByTWtckzgLQsG3wdme
 /qQzTPwiMBdPW/Ijetr2zoknl1wnsiTjQxuk91FFKNG2MZKpOGNd+KW88C7SWklOSTVy
 jkvw==
X-Gm-Message-State: AOAM5339ysVRfqrOiw372ICG+P0dnG/+7wgcE3Ph7Fj/DGcVOqhJCXGZ
 2ffHz+B4Sk9UQce2pDXA+ssH1lzw8sM=
X-Google-Smtp-Source: ABdhPJx9CjRrno/9Zanpd8gEM+ORDmFN0qS2UwWf8KdmMGxMNeu1Ufipcv+K/vJBbMbeObEoZFvYRA==
X-Received: by 2002:a05:6214:3008:: with SMTP id
 ke8mr14709663qvb.17.1630974341880; 
 Mon, 06 Sep 2021 17:25:41 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id 207sm7892056qkh.45.2021.09.06.17.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:25:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] spapr_numa.c: split FORM1 code into helpers
Date: Mon,  6 Sep 2021 21:25:25 -0300
Message-Id: <20210907002527.412013-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907002527.412013-1-danielhb413@gmail.com>
References: <20210907002527.412013-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2d.google.com
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
index 9ee4b479fe..84636cb86a 100644
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
 void spapr_numa_associativity_reset(SpaprMachineState *spapr)
 {
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
@@ -210,22 +236,7 @@ void spapr_numa_associativity_reset(SpaprMachineState *spapr)
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


