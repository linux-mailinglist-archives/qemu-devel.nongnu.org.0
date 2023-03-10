Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A026B53F0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvm-0008ED-0b; Fri, 10 Mar 2023 17:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-0008CS-Ph
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-00031Z-P1
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mgf8s-1qD80h3ak0-00h6r1; Fri, 10
 Mar 2023 23:09:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/28] linux-user/sparc: Tidy syscall error return
Date: Fri, 10 Mar 2023 23:09:14 +0100
Message-Id: <20230310220927.326606-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v2ycuPT5K9GEMqKTx4WI/iMX712RbjVyoHQstA4VfDsXM++Z/G5
 WDFCW0n9DyN10rmyPOJ2uLPRZzTm0injlNiDC3lVoOc9S8UpNh40KnmfjsdA3Qd/0clfgxk
 LjEHjopgDo+5Ykeb4mqLFvDLlPeFguYg5HRxZY0J89AjBc4a6/0lq4cbDTbZ/Gqpjg8y1Yz
 +XVgTCJgyKuhEpFPxLc+g==
UI-OutboundReport: notjunk:1;M01:P0:3JooTipO/gc=;xj8khNPqcJ6jUSMLEYETv34vxk2
 N2JMK1jbUpFNwfOngGHvDWzLJx9+mX5d1S402m3jZuCqSlC2yCt+iyhLBSo0CdhVro/F9+hsD
 PQiO+6aNppxZckd+Tw+UGTLb07eZzgV9lVI5xLnGy9S2wD+toOgA9FT4FnOvrT8mw+sWTOJ/r
 AG1ragLUhO2+jMifx0yWiAuYzpbEwtgPhPvcyMMoUrOHkedY04u+VqUAHwGw4B+siI4VJ+RnB
 wcN98/ty8lFz8e3+H1Qcw0XsHtQ+IJdHrdrwqX67wbW5wxb9PxMYtzoCqmyvAhtzxnl2tqKn1
 RbH2KUycteYfzTip3jCLISCT4SQXbQXSgvqD46hlVWWuVNfKIoqB30KDBZbbDK4Li01r8SMzm
 vNzWkfe+A4UQn6of1s4gGiNWGsNyMUyBY19tVNizLbBDrP7SrNr3etbZTUZLyzGki47nvaGm1
 Ef9BM8ZxAVDF/4c4GkV1jZCT2RPLxKJ3RRVWebHqR/Jyba+mtUps23vUGBgVEOikI9u4YpPkH
 B5jNNv++0giH+yJM4JqUs7xZeTqe6QI3jts7sfG5xJNleCQSxLwYKAxTRrg/n1vr9MKbAsY+r
 vB3SMusfNd7uzNM9PQ8BGKYFVOPP4ryEHy9tCnwTpEJItkLd7xA6qC0H15UK/JdzIbUyM4VHu
 cqThf/h2IyQrL1vLxO4sqwpW2jeOi58+kdyv2JtPgg==
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


