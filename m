Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E807A6B0952
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsb-0003Xp-0E; Wed, 08 Mar 2023 08:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr5-0001kl-7F
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqz-00066d-SO
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:18 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mbj7g-1q8OnD2xiA-00dF3y; Wed, 08
 Mar 2023 14:29:09 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 17/28] linux-user/sparc: Tidy window spill/fill traps
Date: Wed,  8 Mar 2023 14:28:46 +0100
Message-Id: <20230308132857.161793-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qF8BqfTZHyvBEz/BQyLZFKI+mzZylXNGIarDwpwSKTKkWOqV7bU
 uMKoYl430EjOjcxPUefjCFKFTpM0u0uJG3R3jTfzy2wWneoMzQxMblACjC3dVn7Mltq6bqX
 jslMOPwyei/B9KwtSxbOoAvDgzNJ6QxkJzHp1NjVBKgHWlSymWjg/9OJq97mYwAx28CUfnK
 m7ojPAJRRF33bFf5gRUkQ==
UI-OutboundReport: notjunk:1;M01:P0:dt6hapDWLQI=;9ZejsjhzCDBV0tkNeTywNGh8PFv
 qmCStgz6qB1u0t8oLh8kyA4tMJI9Yk5/u04CHstU9KDlfwaOxSr6cg521yIcHrk6s65a5N6XO
 sQC1AicVFyMRG4vDsOCR3p9egb+RzADD2dDfkBoggGmW9UVdEl+qNvfmGYcjzIgUkwRH3XMAa
 mc1JG2X0GS41B6tLJRYzXeYEv+TamN2I1jtMBgMX2iB5OgVCfqcmWya+Ew4MHqHTN17oF2X9e
 bcbeVAXagMFLF/kkmEylFyM1XuTz8Ea5SpEoKhyQaVmHaql3iUvg7apXQqsnNDxaBG2qqZczK
 wW0c8vuCTRhIMq+dYoqAf5/3sx5KUyPqb5U8PVdcwGQkqUMAPYI6m0chjCWLCDQ2RnGtq7FKM
 MwUopPdzqX+3T8srPyuSnZhANFwlYoYB3XjspMaWojEyj9d9R2IkGr4gTy7AjGkVXCBdUw/UQ
 6VhXOaU0Co/KNGFixwtsEYoSW4+n9Pwv4+jb9QEzfDnMUqfqSiNgANvQ8pruCShIfCLrqvUIy
 HB//AlxBU1keCUh1UeHl/JopSW8/jOXSrM+L3qtK2v0BT8b04ZN7T32m9pE5n/IOumzJVe7Fr
 HacfSVGiF7qRzLIbW7dgzGshAReATK/W0EHj5EfJIYQ2fwfxRnfR5dfUFQOYHdsLivh3qkpwn
 dcTjTUbCGG5GsgVzY9YI5Gg/Dk1FEw4QlV1MF56eDw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Add some macros to localize the hw difference between v9 and pre-v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216054516.1267305-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index e1d08ff2045c..2bcf32590fa1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -158,6 +158,15 @@ static void flush_windows(CPUSPARCState *env)
 #define syscall_cc         xcc
 #endif
 
+/* Avoid ifdefs below for the v9 and pre-v9 hw traps. */
+#ifdef TARGET_SPARC64
+#define TARGET_TT_SPILL  TT_SPILL
+#define TARGET_TT_FILL   TT_FILL
+#else
+#define TARGET_TT_SPILL  TT_WIN_OVF
+#define TARGET_TT_FILL   TT_WIN_UNF
+#endif
+
 void cpu_loop (CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -204,20 +213,14 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
-#ifndef TARGET_SPARC64
-        case TT_WIN_OVF: /* window overflow */
-            save_window(env);
-            break;
-        case TT_WIN_UNF: /* window underflow */
-            restore_window(env);
-            break;
-#else
-        case TT_SPILL: /* window overflow */
+        case TARGET_TT_SPILL: /* window overflow */
             save_window(env);
             break;
-        case TT_FILL: /* window underflow */
+        case TARGET_TT_FILL:  /* window underflow */
             restore_window(env);
             break;
+
+#ifdef TARGET_SPARC64
 #ifndef TARGET_ABI32
         case 0x16e:
             flush_windows(env);
-- 
2.39.2


