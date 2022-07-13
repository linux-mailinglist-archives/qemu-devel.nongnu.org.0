Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6E573CA9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:43:24 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBhKU-0004Na-QG
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBhGz-0001Uf-KQ; Wed, 13 Jul 2022 14:39:45 -0400
Received: from [200.168.210.66] (port=4012 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBhGx-0007iU-NG; Wed, 13 Jul 2022 14:39:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 13 Jul 2022 15:39:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C265C8001C2;
 Wed, 13 Jul 2022 15:39:38 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v2] target/ppc: check tb_env != 0 before printing TBU/TBL/DECR
Date: Wed, 13 Jul 2022 15:38:47 -0300
Message-Id: <20220713183847.41797-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jul 2022 18:39:39.0199 (UTC)
 FILETIME=[E8A244F0:01D896E7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using "-machine none", env->tb_env is not allocated, causing the
segmentation fault reported in issue #85 (launchpad bug #811683). To
avoid this problem, check if the pointer != NULL before calling the
methods to print TBU/TBL/DECR.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v2:
 - Added checks in monitor_get_decr, monitor_get_tbu, and monitor_get_tbl.
 - Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-07/msg00173.html
---
 target/ppc/cpu_init.c | 16 ++++++++--------
 target/ppc/monitor.c  |  9 +++++++++
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 86ad28466a..7e96baac9f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  "%08x iidx %d didx %d\n",
                  env->msr, env->spr[SPR_HID0], env->hflags,
                  cpu_mmu_index(env, true), cpu_mmu_index(env, false));
-#if !defined(NO_TIMER_DUMP)
-    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
+    if (env->tb_env) {
+        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
 #if !defined(CONFIG_USER_ONLY)
-                 " DECR " TARGET_FMT_lu
+                     " DECR " TARGET_FMT_lu
 #endif
-                 "\n",
-                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
+                     "\n",
+                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
 #if !defined(CONFIG_USER_ONLY)
-                 , cpu_ppc_load_decr(env)
-#endif
-        );
+                     , cpu_ppc_load_decr(env)
 #endif
+            );
+    }
     for (i = 0; i < 32; i++) {
         if ((i & (RGPL - 1)) == 0) {
             qemu_fprintf(f, "GPR%02d", i);
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 0b805ef6e9..8250b1304e 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -55,6 +55,9 @@ static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
                                     int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_decr(env);
 }
 
@@ -62,6 +65,9 @@ static target_long monitor_get_tbu(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_tbu(env);
 }
 
@@ -69,6 +75,9 @@ static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
     CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env->tb_env) {
+        return 0;
+    }
     return cpu_ppc_load_tbl(env);
 }
 
-- 
2.25.1


