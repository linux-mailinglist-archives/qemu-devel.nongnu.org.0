Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36D6B0953
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtt0-0003u5-7W; Wed, 08 Mar 2023 08:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrD-0001qg-Ng
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr3-00069P-Ai
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:22 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MeC1p-1qAshQ1a8F-00bJbt; Wed, 08
 Mar 2023 14:29:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 27/28] linux-user/sparc: Handle tag overflow traps
Date: Wed,  8 Mar 2023 14:28:56 +0100
Message-Id: <20230308132857.161793-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fdFnxhXLd3aIYncrq/iT6mDur/NrRQ4i76oAaIfyo0F6fxW4iGv
 r0EdVWCS26sZED5eCQtyLkKh2PBLXNAEpbXTiZRzq1BGcslRM/zm1yv/z1rFafrbNbYpeW0
 AM1A7zIR9OKl2p75E5ziFWFkqjgeKDvRRlQnfhItMUxoUs4PoubS0BGioM3BWBtApwCqQRm
 PywD+8X3tm2f62Y2og8zg==
UI-OutboundReport: notjunk:1;M01:P0:+MdsCgA4oBY=;tV9CkY30a0Oe8eBBNfBlSABK+KJ
 ir9qxtS1jXyB6QUPmFK3lst065qnXoNmAdOhCEucF41GwsAeHYJvQJBJBXTC+g0uoxtSOfYQS
 YRrazUwm/tGyPZLGbqHb6DM2PWpey22ufP2EdsWHzmIGCBYmA5k57o6wV19UG//FScRbioFp9
 1ZNHCAYhaSOEh0g6S3DEkUc1Br6RXEmnfqnTIwIkY/pXAcboHZGOE6nEg+jx9a2P0ruLG6Xg3
 bLzxh88WdxbrAB98+Kdz/tta1dpqT+K92NGoaAxiWE4hQpiM8pMLZ2RhbJ+vN0hM/f674sOrT
 p/yQIM6kfQVGeK9MX1qsm3illbQZK0o0Etab4T88Toc2GB0mYnjwCnae6YzpQO7EbMHfacLgx
 3RGA6+UUkxVfGecDFtKM8ElYd1BhdwkUKRv4Rn768CcYdIj1+PcxHIW4WTa8V/y4DtmH8EE2T
 1del1klG4ACJ7XMrgSIe6CW2gaQBpRIilivaifXr3ynO2VqWNG+Qp9OGw+g562JkNg4bajY6U
 HC2VQCrwxi9hob/ALXiTF2WoMiHjNczMWKQC0nfCTh96qgPW1oNbjApT/7p9TbjpcMwzbLxuP
 qaRjnngTKMy2Ma4D+7HpkzQYRG9G3/dhQQ/OJCFx141MdMCo5gvlen0nwNaXLRkwmuJE04laf
 qUmhc7MyYe1wAh3aG5HeyDjiztalLJ89rPOQjw8gyA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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

This trap is raised by taddcctv and tsubcctv insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c      | 3 +++
 linux-user/sparc/target_signal.h | 2 +-
 linux-user/syscall_defs.h        | 5 +++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 5a8a71e976bc..b36bb2574b94 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -328,6 +328,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+        case TT_TOVF:
+            force_sig_fault(TARGET_SIGEMT, TARGET_EMT_TAGOVF, env->pc);
+            break;
 #ifdef TARGET_SPARC64
         case TT_PRIV_ACT:
             /* Note do_privact defers to do_privop. */
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 87757f0c4e76..f223eb4af6a5 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -8,7 +8,7 @@
 #define TARGET_SIGTRAP           5
 #define TARGET_SIGABRT           6
 #define TARGET_SIGIOT            6
-#define TARGET_SIGSTKFLT         7 /* actually EMT */
+#define TARGET_SIGEMT            7
 #define TARGET_SIGFPE            8
 #define TARGET_SIGKILL           9
 #define TARGET_SIGBUS           10
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 77864de57fb6..614a1cbc8e3a 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -717,6 +717,11 @@ typedef struct target_siginfo {
 #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
 #define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
 
+/*
+ * SIGEMT si_codes
+ */
+#define TARGET_EMT_TAGOVF      1       /* tag overflow */
+
 #include "target_resource.h"
 
 struct target_pollfd {
-- 
2.39.2


