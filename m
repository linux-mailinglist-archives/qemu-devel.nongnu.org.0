Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16B6B53EA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvn-0008Ef-1h; Fri, 10 Mar 2023 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvk-0008DR-M5
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvi-000323-Rw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:40 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MadGG-1q73Tm3BIQ-00cAdN; Fri, 10
 Mar 2023 23:09:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/28] linux-user/sparc: Tidy window spill/fill traps
Date: Fri, 10 Mar 2023 23:09:16 +0100
Message-Id: <20230310220927.326606-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QKXZmhRh7Ff57c68Uxrbc8j4mgAps2R99gyUwljWVZHe4DuKx/n
 Gav/ZM+dowHOq6tg/uO/vKWwgD6B113qNc3wHcJiAoZLZHnC0cjjhgy+t5xIPqd+S5LJwej
 EuPThXIu61LHrSpUL8xT/nW99LQGKGEqZGUKr5RwPugZ5wG0mlUAwHBLFIVERyDQdedWnuw
 V9jUelLhySZZ9MUADbzqA==
UI-OutboundReport: notjunk:1;M01:P0:+w9c/4tFQXg=;++KJsyfqjG+gJNv1HaGAJ5UYO1Y
 eZBHOHdCdS/ma26lpKH80QAINYQO+Eqi9y1NaAjWIjO3BjyAL3DT4u6YXb9EUK+BrcuBB8kQv
 PbGvyQG+6FVFWkOgtIvIugiMuxa4ln887gzUxDsj2wruo1B+jVWr/l48LqyNAUTR01jZ+ASSK
 sF/jObxrJa448j+xL3ZYs+CpSFJPFn7pUDjiq0HPao66VK0qV/uJRb4zpqwrozG8uqLAhjlfL
 y1AiguqGm7B0luUasjJjnHBvGtdcNJdN4TEF7s/fQjOAj3VPE6xZVJ5BShTVC5+YXc/B0Ex0V
 /t2cbNAY4n9ykR6biLRnNBGayftrLobTJZ3kgClp4j3BvBrJKXkyWU3kk2ycgpxmaUz1yWhcL
 8dtozJ+crhEcXqb1wkDIsWNNBnxb5ot271std4c3LqfvmHmydsADkAYhD8mSSYNwCAkuGlFIX
 BnjDvTWyrRv2YUK+8HowXmoSySUYYlXK1DFSZqJTk45gIHP1Rj83+BkRcQQSr1YuR59OnlLz/
 pa9ZT59r01KY+1qm2oarqyt7gXVrauz3C3Bb0bTmNUwwe88BRd1ZraTnhxNqCYvp5HVguC4pQ
 24b5anJxUyOoYqaFUx8XUahnBYcLhZ3sTC3dfEBoCvwOOdRMgQ6wwRhRDRJMi84VKafp9QT9h
 gGxaqm2nDBRw3DjZLB3da5eYkHVnbXkXhb+Ki/KnvQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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


