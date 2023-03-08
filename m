Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D36B0958
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtud-0004oE-Uj; Wed, 08 Mar 2023 08:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrD-0001qi-OC
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr3-00067b-5v
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJn4B-1ppdK23Qb3-00KCjf; Wed, 08
 Mar 2023 14:29:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/28] linux-user/sparc: Handle software breakpoint trap
Date: Wed,  8 Mar 2023 14:28:48 +0100
Message-Id: <20230308132857.161793-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fjBjZoyqHCNl+BtvDE4YQ1hdwGAVI/hga55gLu4BFzIK1YmjYbu
 pxWR04QZ3RRbyXWpPtCZC4wzUK7HMfgRTWrhpB/jPhP7jw96OgQAztkMEDCZy8UTkOgdnyQ
 BFwp632Xm5UrRL9tldhJ1DevggeV8nc7gLdNBSJvkUMQwpwrZ2Gtkm6aNWvAXGaYuhW5oGv
 h+wk7yXxR5YEWgiuWWqIQ==
UI-OutboundReport: notjunk:1;M01:P0:WQIRc56swgY=;hy6jrCoeqyfBxFVSav+JeJ0OnR5
 3nywoACUmsrnRink8vj5W6+QT6nrB/CmsiArqk5FRVAERceNtG8OSefpxzx2Lw+l5HXA20+iL
 PhJ6IG8igfPr8qV9G/8mmQDN7I6dsN5OejLsKzdy4G0AXzW8bsI5Zu5g87JlkTYcuvfL1u0ts
 Eb+ilfYeOObxVuD+fAzpR+iZruxqpFtyqPyQqk1OVcDT9CNIJEgiYCxexzAGyIDyRfLh0nmJj
 bEtzKrDw552BD/9+UfAqsxCsp9eluQr8uBjCT4ODiRZ8sqhJ2di0aC0neFs0YNONd/miysxKJ
 76gONd3e9iZYr/AgBYcSHwnnRuUOYpAbUknsa8hEWlhDa0UfhPeszzaBVTvg8He95U1hwz1w0
 siPfDeWnTGer1DeZoqz+uQCwfElh5gqCCAdULAHd7LUxLhp9Hj/wDXxd7a7BIoCfdOAqIVaDk
 Bwq3LNccn6hfEcbR8W1ojVe4tL+25RAmqWSDZBLd8BXHV4fvDz8Om6L+r8p6vGSwbwAHEhZeu
 R0kyTPVylhfjO4gVgEQKR/6/QtNylyYNQZuL/SPOGVU5NfM76xtighxQ0jN2L21Leh7tgVMU5
 bH43fJMkHG/1l2yxQ1Da0atJENQXfU+8HpgKjdM6q5C7PcmoiURfbCYgPUKOpxatAORbdj0Dr
 ChhcnSMzxpxLONifGXnGgN3o4xU1D1OYr+EJt8xldg==
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


