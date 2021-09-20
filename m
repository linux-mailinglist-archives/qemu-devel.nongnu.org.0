Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E7410F75
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:19:00 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSCdn-0006Qu-TB
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSCXM-0000mG-7j
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:12:20 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:51363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSCXI-00053F-L0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:12:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A131320881;
 Mon, 20 Sep 2021 06:12:06 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 08:12:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00288616149-e1d0-4118-a6b4-abb732249f3a,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v4 1/4] target/ppc: Convert debug to trace events (exceptions)
Date: Mon, 20 Sep 2021 08:12:00 +0200
Message-ID: <20210920061203.989563-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920061203.989563-1-clg@kaod.org>
References: <20210920061203.989563-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e8afd59d-024e-4a9e-b372-0e946d6ec764
X-Ovh-Tracer-Id: 2753388224384568227
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiuddguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 38 ++++++++++----------------------------
 target/ppc/trace-events  |  8 ++++++++
 2 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d7e32ee107e0..b7d176792098 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -23,20 +23,14 @@
 #include "internal.h"
 #include "helper_regs.h"
 
+#include "trace.h"
+
 #ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #endif
 
-/* #define DEBUG_OP */
 /* #define DEBUG_SOFTWARE_TLB */
-/* #define DEBUG_EXCEPTIONS */
-
-#ifdef DEBUG_EXCEPTIONS
-#  define LOG_EXCP(...) qemu_log(__VA_ARGS__)
-#else
-#  define LOG_EXCP(...) do { } while (0)
-#endif
 
 /*****************************************************************************/
 /* Exception processing */
@@ -414,12 +408,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         }
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        LOG_EXCP("DSI exception: DSISR=" TARGET_FMT_lx" DAR=" TARGET_FMT_lx
-                 "\n", env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
-        LOG_EXCP("ISI exception: msr=" TARGET_FMT_lx ", nip=" TARGET_FMT_lx
-                 "\n", msr, env->nip);
+        trace_ppc_excp_isi(msr, env->nip);
         msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
@@ -474,7 +466,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
             if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
-                LOG_EXCP("Ignore floating point exception\n");
+                trace_ppc_excp_fp_ignore();
                 cs->exception_index = POWERPC_EXCP_NONE;
                 env->error_code = 0;
                 return;
@@ -489,7 +481,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             env->spr[SPR_BOOKE_ESR] = ESR_FP;
             break;
         case POWERPC_EXCP_INVAL:
-            LOG_EXCP("Invalid instruction at " TARGET_FMT_lx "\n", env->nip);
+            trace_ppc_excp_inval(env->nip);
             msr |= 0x00080000;
             env->spr[SPR_BOOKE_ESR] = ESR_PIL;
             break;
@@ -547,10 +539,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
         /* FIT on 4xx */
-        LOG_EXCP("FIT exception\n");
+        trace_ppc_excp_print("FIT");
         break;
     case POWERPC_EXCP_WDT:       /* Watchdog timer interrupt                 */
-        LOG_EXCP("WDT exception\n");
+        trace_ppc_excp_print("WDT");
         switch (excp_model) {
         case POWERPC_EXCP_BOOKE:
             srr0 = SPR_BOOKE_CSRR0;
@@ -657,7 +649,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
         break;
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
-        LOG_EXCP("PIT exception\n");
+        trace_ppc_excp_print("PIT");
         break;
     case POWERPC_EXCP_IO:        /* IO error exception                       */
         /* XXX: TODO */
@@ -1115,14 +1107,6 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
 #endif /* !CONFIG_USER_ONLY */
 
-#if defined(DEBUG_OP)
-static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
-{
-    qemu_log("Return from exception at " TARGET_FMT_lx " with flags "
-             TARGET_FMT_lx "\n", RA, msr);
-}
-#endif
-
 /*****************************************************************************/
 /* Exceptions processing helpers */
 
@@ -1221,9 +1205,7 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
     /* XXX: beware: this is false if VLE is supported */
     env->nip = nip & ~((target_ulong)0x00000003);
     hreg_store_msr(env, msr, 1);
-#if defined(DEBUG_OP)
-    cpu_dump_rfi(env->nip, env->msr);
-#endif
+    trace_ppc_excp_rfi(env->nip, env->msr);
     /*
      * No need to raise an exception here, as rfi is always the last
      * insn of a TB
diff --git a/target/ppc/trace-events b/target/ppc/trace-events
index c88cfccf8d19..53b107f56eb6 100644
--- a/target/ppc/trace-events
+++ b/target/ppc/trace-events
@@ -28,3 +28,11 @@ kvm_handle_epr(void) "handle epr"
 kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
 kvm_handle_debug_exception(void) "handle debug exception"
 kvm_handle_nmi_exception(void) "handle NMI exception"
+
+# excp_helper.c
+ppc_excp_rfi(uint64_t nip, uint64_t msr) "Return from exception at 0x%" PRIx64 " with flags 0x%016" PRIx64
+ppc_excp_dsi(uint64_t dsisr, uint64_t dar) "DSI exception: DSISR=0x%" PRIx64 " DAR=0x%" PRIx64
+ppc_excp_isi(uint64_t msr, uint64_t nip) "ISI exception: msr=0x%016" PRIx64 " nip=0x%" PRIx64
+ppc_excp_fp_ignore(void) "Ignore floating point exception"
+ppc_excp_inval(uint64_t nip) "Invalid instruction at 0x%" PRIx64
+ppc_excp_print(const char *excp) "%s exception"
-- 
2.31.1


