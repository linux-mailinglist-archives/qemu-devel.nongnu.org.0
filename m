Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3A387C7C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:31:30 +0200 (CEST)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1gv-0000OL-Dc
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1I4-0003Dp-33; Tue, 18 May 2021 11:05:48 -0400
Received: from [201.28.113.2] (port=5990 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1I2-0007Ay-Fm; Tue, 18 May 2021 11:05:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 12:05:33 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id D4744801362;
 Tue, 18 May 2021 12:05:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/ppc: fix ppc_store_sdr1 for user-only
 compilation
Date: Tue, 18 May 2021 12:05:09 -0300
Message-Id: <20210518150515.57983-2-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 18 May 2021 15:05:33.0054 (UTC)
 FILETIME=[3FD359E0:01D74BF7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the function was moved to cpu.c, it should have been wrapped with
 #if !defined(CONFIG_USER_ONLY), otherwise linux-user builds don't work.

The cleanup suggested by Richard Henderson has also been applied,
changing error_report(...) to qemu_log_mask(LOG_GUEST_ERROR, ...) in
that function.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0ab7ac1af1..82e276349a 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -65,6 +65,7 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
     return env->vscr | (sat << VSCR_SAT);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -76,13 +77,13 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
         target_ulong htabsize = value & SDR_64_HTABSIZE;
 
         if (value & ~sdr_mask) {
-            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
-                         value & ~sdr_mask);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid bits 0x"TARGET_FMT_lx
+                     " set in SDR1", value & ~sdr_mask);
             value &= sdr_mask;
         }
         if (htabsize > 28) {
-            error_report("Invalid HTABSIZE 0x" TARGET_FMT_lx" stored in SDR1",
-                         htabsize);
+            qemu_log_mask(LOG_GUEST_ERROR, "Invalid HTABSIZE 0x" TARGET_FMT_lx
+                     " stored in SDR1", htabsize);
             return;
         }
     }
@@ -90,3 +91,4 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
     /* FIXME: Should check for valid HTABMASK values in 32-bit case */
     env->spr[SPR_SDR1] = value;
 }
+#endif
-- 
2.17.1


