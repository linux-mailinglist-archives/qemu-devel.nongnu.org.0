Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219B6B53F8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvt-0008Jb-KY; Fri, 10 Mar 2023 17:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvn-0008FQ-PB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-00033r-2a
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N63mC-1qcSOi05G4-016NpG; Fri, 10
 Mar 2023 23:09:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/28] linux-user/sparc: Handle privilidged action trap
Date: Fri, 10 Mar 2023 23:09:22 +0100
Message-Id: <20230310220927.326606-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8BJjg9GKKN+ZES0CWZFB+QptCwjTaxKXKEC9uK8uWe86U9qn6Yp
 /0KQaVY0+BljQGzMJYPVdAW/XJ/k6gqqnkgr8RhAFQnh8jjhqmseg8s1LsLxlDgPc+87tQm
 VAqwGzFigomyHwids9Keu0Z/MN0zoApz5oTKbBoVOCbq+hPxIMgrDvt9Orbb8N5qyTAqY0T
 F+VSphYSizgN028kBVaFA==
UI-OutboundReport: notjunk:1;M01:P0:n72FCPrgKjY=;nY8N0nOPS5Gz/yab84uSjm34wFZ
 YcUZ0/ClylupTDuSly4cq+Rh4LiBz0sy9wLcU4FjllUQC6695LQamCpCvS1wYvFzVeWlEmP+z
 kRH9pv8Pq+nvaLPsG7M74NiY0GaT7PU1Xd1VEWSkIaXS5CMcWgQF5va4ORcZV7LcsRoK8L7zO
 CpeIHXvk+u+9vciprDqGnIrBZ3Qmdoj1BFC03he2QR4mXISVnoqaaMSB1FtAXojMYfbfJeVb5
 S0Vbh68Rs0w3SoPSIMAFbc88IV0MS7R/ziaeguSW3LSyVk2tGQbVhV+qIj6mqcYlw322nKHoI
 2CEe0bjccHcn8IzHEzRix1puz/VtjCD1OfendHo/U1dbwaAvBaOMdx5NEn2qERK5QQWdhCGcK
 sizsmZT8lSIdKSWTzf27gii/05Ssq8GWP6MZFsYQiG6AW646jlXlwZGFQP8e5awlOnir3YhLF
 0w0rq7QQLzk7qAxxx0eVtAbVaFOe/smBfQHp0YA+Yt3Bon8fBgX16tHUCTCagqDOmho+YSZ6y
 X93PcYEilcMWR4iLIjzuQn776I6skufqmzY1UI7K965NLSDeqrBRUg7Srf7LjTBjbQjkobaqz
 p89sPgw5TSqG4eSFRhshvkVvzQ3iHcn5x5QK3jDqsB7/CnBhmD/DIIGlALupI4tx+8HH72ZGR
 f/pOAG6JJLqcsgpp8QMbPQOsTGKD5nY3b0jvn4O+Og==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

This is raised by using an %asi < 0x80 in user-mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 61b6e81459be..43f19fbd9141 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -306,6 +306,12 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#ifdef TARGET_SPARC64
+        case TT_PRIV_ACT:
+            /* Note do_privact defers to do_privop. */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+#endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.39.2


