Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02796B0959
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsc-0003ai-0V; Wed, 08 Mar 2023 08:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr1-0001k6-W3
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqw-00066B-On
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:12 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MNLVU-1puKQI2xIY-00OqsA; Wed, 08
 Mar 2023 14:29:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 15/28] linux-user/sparc: Tidy syscall error return
Date: Wed,  8 Mar 2023 14:28:44 +0100
Message-Id: <20230308132857.161793-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1zYLFWVGtO4rrkiHHvdEeDaaS+AIk46JYu54xrsxI0kzDl8u0Fm
 Gz5zu1pwF6Hgjsz4vpTfI553Vf9kYOOx1/qth+iqgPhNKQzq69iP2skqhmEGs3ZOViyNO+m
 lb3kA4eySiHBWNLH9fPTXVmZEnltXwH4tRx5iWpY18v2AatH/qlFiVoFg9HuXcIgVoQOYwU
 VD6yeMcLwugqZlvwsWZ5w==
UI-OutboundReport: notjunk:1;M01:P0:3AF6ejRiUeM=;UQDz40gRA8/+ZM6eb4RbUivwTpj
 vLeIhz5Hd4hWzLppNPQDdIZMBoHxP0fJWA1mj0s0iQWlDCa02uhPOfMXAJi06MdRXc7aAVVt2
 uY1AWLVZoIMAbiAKZ2ZUW6DoKmXoQcL6Wld5RLnM0gR9+szKf/6lpz+26G7DkV2LHYKKiVbIj
 5AqOKwJeaf84NowBGgyRBRV6GEPcmmQkRBhQHTrf+LSvPPAk4wI8pXrwGB0DaoEBfGABR1Pw0
 E6Eyv2DUpxapyWE0Qvy8vwNUFoLUh0JKlSjIb5rSwr5QpEKyE+1j19GwTbk+TU2q7J2NUasmP
 0S54R/zbvGumY3XkirK1Kof/Q31pX6a0yHkOD+5PW3Z1WaXcDV42CiXdMK1o224i9LEMukj6e
 CCcA7ECcBCsMoKIM39fyXTUrC0F4eDESxfgzfDAuK1UN4mkSYHTncGvDNhxQwgzGpaAEHdfst
 AO7NtUoO/542+luMQWuh91XptQ4JtXAVRN9veKNy1kfZhrxa9qqlenK77BbzehbWuEf7/yhay
 XQ2UYPIOR7rlqNY9XBqdHlsxwxCxPFEaZRwKR9sOJUrCVNTzpTFqdow9gzJWGEcomUaVk0N1o
 cCqg2ZMwkYnVsVju0CPPGRgo3DazAn4mAj0hEU0u5RRubZP8VOBJnXQzJ3ASslxWcmp4fCtUT
 IczCl/vBFAWlHJpj5cz/LBM4g4zPXKMiEkkF1ciqEg==
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

Reduce ifdefs with #define syscall_cc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index d31ea057dba1..051a292ce520 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,10 +149,13 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+/* Avoid ifdefs below for the abi32 and abi64 paths. */
 #ifdef TARGET_ABI32
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
+#define syscall_cc         psr
 #else
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x6d) /* tl0_linux64 */
+#define syscall_cc         xcc
 #endif
 
 void cpu_loop (CPUSPARCState *env)
@@ -183,18 +186,10 @@ void cpu_loop (CPUSPARCState *env)
                 break;
             }
             if ((abi_ulong)ret >= (abi_ulong)(-515)) {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc |= PSR_CARRY;
-#else
-                env->psr |= PSR_CARRY;
-#endif
+                env->syscall_cc |= PSR_CARRY;
                 ret = -ret;
             } else {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc &= ~PSR_CARRY;
-#else
-                env->psr &= ~PSR_CARRY;
-#endif
+                env->syscall_cc &= ~PSR_CARRY;
             }
             env->regwptr[0] = ret;
             /* next instruction */
-- 
2.39.2


