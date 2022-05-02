Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2451723F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:08:44 +0200 (CEST)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXfH-00062Z-20
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFY-0005cr-Jo; Mon, 02 May 2022 10:42:09 -0400
Received: from [187.72.171.209] (port=26627 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXFX-0003MH-36; Mon, 02 May 2022 10:42:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 2 May 2022 11:40:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 1BD28800902;
 Mon,  2 May 2022 11:40:05 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 16/21] target/ppc: Remove msr_ep macro
Date: Mon,  2 May 2022 11:39:29 -0300
Message-Id: <20220502143934.71908-17-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 May 2022 14:40:05.0511 (UTC)
 FILETIME=[83818970:01D85E32]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

msr_ep macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Also, this macro was called in a specific place where it was being
used 'kinda' like a mask: (value >> MSR_EP) & 1) != msr_ep. The setup
to use FIELD_EX64 (calling FIELD macro in cpu.h) also adds a
R_MSR_EP_MASK which is equivalent to (1ull << MSR_EP). So, use
this mask to simplify the code.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v2: Remove M_MSR_EP and use FIELD_EX64 instead
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         | 2 +-
 target/ppc/helper_regs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ff52eef304..9683e6a359 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,6 +363,7 @@ FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
+FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
@@ -485,7 +486,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #endif
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
-#define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 8c2b8acb60..1c593686d4 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -241,8 +241,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
         /* Swap temporary saved registers with GPRs */
         hreg_swap_gpr_tgpr(env);
     }
-    if (unlikely((value >> MSR_EP) & 1) != msr_ep) {
-        env->excp_prefix = ((value >> MSR_EP) & 1) * 0xFFF00000;
+    if (unlikely(!(value & env->msr & R_MSR_EP_MASK))) {
+        env->excp_prefix = FIELD_EX64(env->msr, MSR, EP) * 0xFFF00000;
     }
     /*
      * If PR=1 then EE, IR and DR must be 1
-- 
2.25.1


