Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF6572599
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 21:27:19 +0200 (CEST)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBLXS-0002Qh-0r
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 15:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBLVS-0000kx-5H; Tue, 12 Jul 2022 15:25:14 -0400
Received: from [200.168.210.66] (port=12057 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBLVP-00026u-LJ; Tue, 12 Jul 2022 15:25:13 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 16:25:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id DB74C800146;
 Tue, 12 Jul 2022 16:25:06 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH] target/ppc: don't print TB in ppc_cpu_dump_state if it's
 not initialized
Date: Tue, 12 Jul 2022 16:25:05 -0300
Message-Id: <20220712192505.127375-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Jul 2022 19:25:07.0099 (UTC)
 FILETIME=[182D06B0:01D89625]
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
This patch fixes the reported problem, but may be an incomplete solution
since many other places dereference env->tb_env without checking for
NULL. AFAICS, "-machine none" is the only way to trigger this problem,
and I'm not familiar with the use-cases for this option.

Should we stop assuming env->tb_env != NULL and add checks everywhere?
Or should we find a way to provide Time Base/Decrementer for
"-machine none"?
---
 target/ppc/cpu_init.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

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
-- 
2.25.1


