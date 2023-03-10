Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104DC6B5400
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvs-0008ID-9c; Fri, 10 Mar 2023 17:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvp-0008Hq-KF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:45 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvn-00034c-RS
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:45 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1g3U-1qY2Xt2XtY-012074; Fri, 10
 Mar 2023 23:09:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 27/28] linux-user/sparc: Handle tag overflow traps
Date: Fri, 10 Mar 2023 23:09:26 +0100
Message-Id: <20230310220927.326606-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OcfT3VyEztuO+dGE7DGlwnBMGNK02Fiqz9rjRj6prHOlyNKK0hK
 /8zByGLU+59nK4N5YQ+E5zMcVNtHYgevCjroLEyxNKkOyehqwBMlTxBZrWieg6u2BLSMOM1
 LynNX9dopUT9q15GfKPXpT2iENu4sj5KaofJu/4LcStpqnX9cDSvr7iml5w2OLyWa5zW77T
 5lfuSBuaxNhN9XuG28QlA==
UI-OutboundReport: notjunk:1;M01:P0:EW9VIB3n9YM=;Q72xUPAAtKMJ5xERba8/38J7DXv
 gCmGx5FZxDBnSVmDbnAyHc2rrfslZFw5xahoH6hnAKsRcXTcB8hv3VRwTIezPv6HT+BcIrRUT
 uYWp4nKQ9MGKHjlsmUwXDUM5OxTPUF/VykptXd4Tdin4dchX8i/5PUoe+44B0u5YqaE++vYl8
 wjwu/qTHdMJnukU6GShyrcF4KGFyP1RHf/CJ6mLE+Jo+S2ytOCIhGwuWvE6sP7sxgaXCQEDA8
 4g9+lxqBe11xGxVtiTyiiPCXJL4Gej9RkxI3vLaOsPdUz9eR3Bme3j0kk6tICH6Aahv7ySo7k
 qEkqwGrhUxpTsC46x/VbCeJM0LmC1/f4aKRVq1Z33pH77r/yoquugu1Xpgh46cxS7VrDfaBGI
 mJ4Bn0b7qv76TrsXKDf59WfIKgYk+R5dms/1661PuuYffSiYD/hekKoJRU96NtIZYLxEYKkcU
 vIyfq83uIREhyelBVUPhT8lVtwPQlcs529DynY7f3SuUAWr+XN8QllmCJavOCqEfJq/qtiorJ
 gqsXbwzfK6XhwoXh+2vI2s+aPdlv8NTGeJISjAlLZeJqy6lrSaTy+v4jVtnITnhoni23qlTT0
 Fkfev0r4WlfvFWR694yMCumz+FoMTjzvUVTTeuCY3taW48YHlUiqDwFjkLH7ncOpZ5EvmcZ1w
 9ggO7B37mM3s3/YvrxI0FKU0QaQz3u8sRaZ85HlSCQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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


