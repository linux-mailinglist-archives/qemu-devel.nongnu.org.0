Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41242CD06
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:44:52 +0200 (CEST)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mam3Q-0007L1-0x
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzX-0008Ts-Uy
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:51 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:54453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzT-0004pp-I1
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id ED53122172;
 Wed, 13 Oct 2021 21:40:44 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 13 Oct
 2021 23:40:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005fdd12635-370a-4817-bffa-2b5df1e1d27a,
 ADB6EDD73587FDF9B2583A0B30D51DAD1F8B0393) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/3] ppc: Add QOM interface for machine check injection
Date: Wed, 13 Oct 2021 23:40:40 +0200
Message-ID: <20211013214042.618918-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013214042.618918-1-clg@kaod.org>
References: <20211013214042.618918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6eef0b98-776f-4ead-9041-d344b07f4012
X-Ovh-Tracer-Id: 5934618413139069734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

This implements a machine check injection framework and defines a
'mce' monitor command for ppc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: - moved definition under "hw/ppc/mce.h"
       - renamed to PPCMceInjection
       - simplified injection call in hmp_mce
       - QMP support ]
Message-Id: <20200325144147.221875-4-npiggin@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 qapi/misc-target.json | 26 ++++++++++++++++++++
 include/hw/ppc/mce.h  | 31 ++++++++++++++++++++++++
 target/ppc/monitor.c  | 56 +++++++++++++++++++++++++++++++++++++++++++
 hmp-commands.hx       | 20 +++++++++++++++-
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/ppc/mce.h

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 594fbd1577fa..b1456901893c 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -394,3 +394,29 @@
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+##
+# @mce:
+#
+# This command injects a machine check exception
+#
+# @cpu-index: CPU number on which to inject the machine check exception
+#
+# @srr1-mask : possible reasons for the exception
+#
+# @dsisr : more reasons
+#
+# @dar : effective address of next instruction
+#
+# @recovered : recoverable exception. Set MSR[RI]
+#
+# Since: 6.2
+#
+##
+{ 'command': 'mce',
+  'data': { 'cpu-index': 'uint32',
+            'srr1-mask': 'uint64',
+            'dsisr': 'uint32',
+            'dar': 'uint64',
+            'recovered': 'bool' },
+  'if': 'TARGET_PPC' }
diff --git a/include/hw/ppc/mce.h b/include/hw/ppc/mce.h
new file mode 100644
index 000000000000..b2b7dfa3342c
--- /dev/null
+++ b/include/hw/ppc/mce.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2021, IBM Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_PPC_MCE_H
+#define HW_PPC_MCE_H
+
+typedef struct PPCMceInjectionParams {
+    uint64_t srr1_mask;
+    uint32_t dsisr;
+    uint64_t dar;
+    bool recovered;
+} PPCMceInjectionParams;
+
+typedef struct PPCMceInjection PPCMceInjection;
+
+#define TYPE_PPC_MCE_INJECTION "ppc-mce-injection"
+#define PPC_MCE_INJECTION(obj) \
+    INTERFACE_CHECK(PPCMceInjection, (obj), TYPE_PPC_MCE_INJECTION)
+typedef struct PPCMceInjectionClass PPCMceInjectionClass;
+DECLARE_CLASS_CHECKERS(PPCMceInjectionClass, PPC_MCE_INJECTION,
+                       TYPE_PPC_MCE_INJECTION)
+
+struct PPCMceInjectionClass {
+    InterfaceClass parent_class;
+    void (*inject_mce)(CPUState *cs, PPCMceInjectionParams *p);
+};
+
+#endif
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index a475108b2dbc..ae1a047e86de 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -23,11 +23,15 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
 #include "cpu.h"
 #include "monitor/monitor.h"
 #include "qemu/ctype.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
+#include "qapi/qmp/qdict.h"
+#include "hw/ppc/mce.h"
 
 static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
@@ -76,6 +80,48 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict)
     dump_mmu(env1);
 }
 
+void qmp_mce(uint32_t cpu_index, uint64_t srr1_mask, uint32_t dsisr,
+             uint64_t dar, bool recovered, Error **errp)
+{
+    PPCMceInjection *mce = (PPCMceInjection *)
+        object_dynamic_cast(qdev_get_machine(), TYPE_PPC_MCE_INJECTION);
+    CPUState *cs;
+
+    if (!mce) {
+        error_setg(errp, "MCE injection not supported on this machine");
+        return;
+    }
+
+    cs = qemu_get_cpu(cpu_index);
+
+    if (cs != NULL) {
+        PPCMceInjectionClass *mcec = PPC_MCE_INJECTION_GET_CLASS(mce);
+        PPCMceInjectionParams p = {
+            .srr1_mask = srr1_mask,
+            .dsisr = dsisr,
+            .dar = dar,
+            .recovered = recovered,
+        };
+        mcec->inject_mce(cs, &p);
+    }
+}
+
+void hmp_mce(Monitor *mon, const QDict *qdict)
+{
+    uint32_t cpu_index = qdict_get_int(qdict, "cpu_index");
+    uint64_t srr1_mask = qdict_get_int(qdict, "srr1_mask");
+    uint32_t dsisr = qdict_get_int(qdict, "dsisr");
+    uint64_t dar = qdict_get_int(qdict, "dar");
+    bool recovered = qdict_get_int(qdict, "recovered");
+    Error *err = NULL;
+
+    qmp_mce(cpu_index, srr1_mask, dsisr, dar, recovered, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+}
+
 const MonitorDef monitor_defs[] = {
     { "fpscr", offsetof(CPUPPCState, fpscr) },
     /* Next instruction pointer */
@@ -156,3 +202,13 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
 
     return -EINVAL;
 }
+
+static const TypeInfo type_infos[] = {
+    {
+        .name = TYPE_PPC_MCE_INJECTION,
+        .parent = TYPE_INTERFACE,
+        .class_size = sizeof(PPCMceInjectionClass),
+    },
+};
+
+DEFINE_TYPES(type_infos);
diff --git a/hmp-commands.hx b/hmp-commands.hx
index cf723c69acb7..15d939ae096e 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1461,12 +1461,30 @@ ERST
         .cmd        = hmp_mce,
     },
 
-#endif
 SRST
 ``mce`` *cpu* *bank* *status* *mcgstatus* *addr* *misc*
   Inject an MCE on the given CPU (x86 only).
 ERST
 
+#endif
+
+#if defined(TARGET_PPC)
+
+    {
+        .name       = "mce",
+        .args_type  = "cpu_index:i,srr1_mask:l,dsisr:i,dar:l,recovered:i",
+        .params     = "cpu srr1_mask dsisr dar recovered",
+        .help       = "inject a MCE on the given CPU",
+        .cmd        = hmp_mce,
+    },
+
+SRST
+``mce`` *cpu* *srr1_mask* *dsisr* *dar* *recovered*
+  Inject an MCE on the given CPU (PPC only).
+ERST
+
+#endif
+
     {
         .name       = "getfd",
         .args_type  = "fdname:s",
-- 
2.31.1


