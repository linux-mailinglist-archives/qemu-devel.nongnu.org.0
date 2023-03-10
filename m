Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192F6B53F9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvo-0008Fr-Lw; Fri, 10 Mar 2023 17:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-0008EX-DO
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:42 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvk-000331-Ol
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:42 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MAOa3-1pgUDh1yLj-00BxOH; Fri, 10
 Mar 2023 23:09:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/28] linux-user/sparc: Handle software breakpoint trap
Date: Fri, 10 Mar 2023 23:09:18 +0100
Message-Id: <20230310220927.326606-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uinLufA9+QpEWx0rvu0QzlvVtOyW5M/ZpPMPDssj6w3j2U8+/Nd
 lvV84qdaMRnaUVxmCMYAKkZPd5thDkzNJZYmZDuFsGiIgAZG1iGYmpOhJWGd5zRZeB1B/Xb
 Pc33dbQdlio7XkKY/zVecwCOZRMRz2q5j8qWapLJ2Nkwv1/CnKkMPgNAJGF9wtX2onkdQ2F
 uqGbk0ErITuDGqwRk+o3w==
UI-OutboundReport: notjunk:1;M01:P0:xdQqFgzZDHw=;CMDBuahdiGdndJ+3eP6z3YhNoA+
 luUtUXUSGE1xK2MFiRCwj4yPaUlLxW/Ws8fHDxAq7fRsXxSDRiV/0Z1QlAmbrX+uGixkXA38Z
 JBKUqFm0VCBtUFFEJkzusiui6ZCGnCpzJiwWP2rsAwchRFXtG6WokDBUAnHOjaUcrJkoKt37/
 xxwZb9xzSxpd/BWfKN5F0cerwykI27ZQKLFrfEahdAHZ0dtjCDB4xa5ao+biYt5Iz8uZXxXC1
 1migLNT8Gg1it1T+6++bZADeoZGWdNQNDcntEjC5kkDOvCb3EXXdsl82jXp4V3koqHKinOmMD
 FKi4Aao14gllsAdSaH4GLkd3JY+tQyOUmsUQ3uvoTJeNs9u8j1HXxgzvebuIVKsMIdmpxwh2W
 skvjq49Z1czTYs5fq2Tu1gVmSKWuESLckpysZvLnwOvSTqN28Xc130eXTSWxkTYCExGXcSqvN
 OyNM+YIVbY8alpNA5nij1khx2kabzxjcBmTBIHAoJ3AhCYWPZHRIvEmhDAiO3ttTOH3irRg1l
 xGnFYC+WC4zmkE1nfyHW5DKgnRO8FVKijdacyLJYtpAU92xm4dcdKpeqNlru7aGe5Tdto+OiR
 tIrNct4NoeXIY6W+0jkp5qq4twdRyzjydl1Q3DcBz5s630YFUco7bVV5ILM+CqnOy4RYOrzPz
 77C2zh9lQl9QD+U1XeKhvy3LP3dkdzO8MHXOA1JB6w==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

This is 'ta 1' for both v9 and pre-v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index edbc4f3bdcbf..c14eaea16370 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -206,6 +206,11 @@ void cpu_loop (CPUSPARCState *env)
             env->npc = env->npc + 4;
             break;
 
+        case TT_TRAP + 0x01: /* breakpoint */
+        case EXCP_DEBUG:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
@@ -237,9 +242,6 @@ void cpu_loop (CPUSPARCState *env)
         case TT_ILL_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
-        case EXCP_DEBUG:
-            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
-            break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.39.2


