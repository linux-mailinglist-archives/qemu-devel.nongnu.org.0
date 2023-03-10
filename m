Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B46B53FD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvo-0008FX-FE; Fri, 10 Mar 2023 17:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvl-0008Dn-23
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:41 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-00032G-4b
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLhwM-1psQL30eEy-00Hcsd; Fri, 10
 Mar 2023 23:09:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/28] linux-user/sparc: Fix sparc64_{get, set}_context traps
Date: Fri, 10 Mar 2023 23:09:17 +0100
Message-Id: <20230310220927.326606-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:69K/jYCgXPORz8wGvUZOLXHUrD1vBufjW2pwVwb/vk2qscrHw01
 Fvnj8dj2VCxOeaeNGSixKk6OagguznlN2SwM+ph243ukEd4O7oGseHVitBN7qdXsvZ0pAnp
 L8AiFqg7gNdPm4m1jLkoEeqKbkP8oPMvAa0sNqgZt92nD3RFlww6x9Xq4CWGAgZcE5MkwGt
 fgCUrcVDzdd1ocDfKhXJQ==
UI-OutboundReport: notjunk:1;M01:P0:wsY8nqk0a7I=;+yzeElQtxfv66R9pRSxHxpXj/l2
 HgtwlO/dimfAERn1FM59ocUvsv56tnfSuwqSdKw8ap/ZYxXMd21kN7dXWBhrIQR166CggpFxy
 ZDIt1Fe5+c479c7OmiSLZJzPHdEwu61CEjU36bi9rjC4cK6/NRfN+BDQ0AGYax7OfaxRgRO/S
 3vJQ0KoQ1lf+kfjLzqyRVUHYgBVFWVYN4RPmILqIQmesbiA3sfUzbjtjdudbv6Bii/+0Gwo7j
 DjJW81B5UGfS8tdrdLvsU68wYgGqn3WPQY+X1n6jLdBL9MJ+I9exqfyAKD3Weyf+iKiodIUEM
 aspK0fx8GVrQtm2qFk78fMNm/SxNg+FuFUzv1pah132F0QXFKtJj82O0+h94Sj4pVmLeYGtYI
 hEEPeIgrxfTGrELW/arOQwwdBF2hRUGi9tZ1KzVdfVKkpgLqixoYgPmH3id6zfP4Y3kPTS5r7
 84eE1f03cFNe5p29RozhI9HfikqNHEguNMsNB/a9c2PnAPYpljYMVMKV7fe1vLKHlKrAEDU5l
 Uh5z2d+kY//NY8aQC8fdV2xQfSxVjRFQxgdP7fR6S957oHJtEUHks9sjcq3nuqY67t3kHkB/F
 YSGfd54MK15qGM8VHz6KGTCrsun/8NLus+GXHAUg5k/FGqESuEQmvHFQojGQExKHuy3ThmBZV
 oFJ3X1aIggTdzDT1N3awLKuc3YsPDqJ76tEHJAyY7g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

These traps are present for sparc64 with ilp32, aka sparc32plus.
Enabling them means adjusting the defines over in signal.c,
and fixing an incorrect usage of abi_ulong when we really meant
the full register, target_ulong.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 21 ++++++++++-----------
 linux-user/sparc/signal.c   | 36 +++++++++++++++++++-----------------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 2bcf32590fa1..edbc4f3bdcbf 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -213,25 +213,24 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
-        case TARGET_TT_SPILL: /* window overflow */
-            save_window(env);
-            break;
-        case TARGET_TT_FILL:  /* window underflow */
-            restore_window(env);
-            break;
-
 #ifdef TARGET_SPARC64
-#ifndef TARGET_ABI32
-        case 0x16e:
+        case TT_TRAP + 0x6e:
             flush_windows(env);
             sparc64_get_context(env);
             break;
-        case 0x16f:
+        case TT_TRAP + 0x6f:
             flush_windows(env);
             sparc64_set_context(env);
             break;
 #endif
-#endif
+
+        case TARGET_TT_SPILL: /* window overflow */
+            save_window(env);
+            break;
+        case TARGET_TT_FILL:  /* window underflow */
+            restore_window(env);
+            break;
+
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index b501750fe0f1..2be9000b9e04 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -503,7 +503,23 @@ long do_rt_sigreturn(CPUSPARCState *env)
     return -QEMU_ESIGRETURN;
 }
 
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+#ifdef TARGET_ABI32
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
+
+#ifdef TARGET_SPARC64
 #define SPARC_MC_TSTATE 0
 #define SPARC_MC_PC 1
 #define SPARC_MC_NPC 2
@@ -575,7 +591,7 @@ void sparc64_set_context(CPUSPARCState *env)
     struct target_ucontext *ucp;
     target_mc_gregset_t *grp;
     target_mc_fpu_t *fpup;
-    abi_ulong pc, npc, tstate;
+    target_ulong pc, npc, tstate;
     unsigned int i;
     unsigned char fenab;
 
@@ -773,18 +789,4 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
-#else
-void setup_sigtramp(abi_ulong sigtramp_page)
-{
-    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
-    assert(tramp != NULL);
-
-    default_sigreturn = sigtramp_page;
-    install_sigtramp(tramp, TARGET_NR_sigreturn);
-
-    default_rt_sigreturn = sigtramp_page + 8;
-    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
-
-    unlock_user(tramp, sigtramp_page, 2 * 8);
-}
-#endif
+#endif /* TARGET_SPARC64 */
-- 
2.39.2


