Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A726B53E4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvr-0008IA-O5; Fri, 10 Mar 2023 17:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvo-0008Ff-0Y
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:44 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-000343-Aw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:43 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MT9v5-1pzG5j1liJ-00UaAb; Fri, 10
 Mar 2023 23:09:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/28] linux-user/sparc: Handle coprocessor disabled trap
Date: Fri, 10 Mar 2023 23:09:23 +0100
Message-Id: <20230310220927.326606-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9TX+eZuuOY4xjQjv8PKaO/zt5j3kT7yGZMA2ZGRHc9IMReKSOsE
 VzB3Jro5JzhD5wnEff/kQATHeJzSLnbZ8lsjhi2xUkmsreMvQyCd+pKqP1eYA4GXo9S3pzr
 fdTecH+DOmHkq3Xgp+AokrTJIKOf6SV+kTpYolli0WFZEIc6lsyY3TXJ6iaD3HohR3hPSMx
 aJFTg9cHqVoYWY+2h4hKQ==
UI-OutboundReport: notjunk:1;M01:P0:1PMoYEuiGq0=;OBE+Hn38qeorioRzNk85qvoC0zc
 G++hIYmXenpSdgTIj5NTGIS969lZ7nGIht6mN/Pf+xyvVF9Q7Raz5Olgdf9jRPj1lC5OmyM4F
 vpPovjdZJSkLVEx8ohSauG8fDJqTnKSgZBa3NMmOJTXupgLu/qt7yFFhYir/Of8HFZOxMRAOo
 4I8s5gPu0u3Sr0Sd9FrAwZeqjZwpJn68J9KUmRj35rUYLL5f3TCtkr1336CHq1PUV4i0IavPt
 +6DP560z27ij1c9VCBjIREyB9MC1n0kVSXC98MfMhCj3bLHpk4jBvtoEMA4CFZe7NJg3kmdBZ
 Das6MOPaHGpHt0ph3s/Tb7fzTTVi65o6/v6ZENwGRRiRIRfQITS1s46syWnpGq+I8M1I3DqpE
 nVEd4zb2OYhILYstdWqqoM7iNyQENORxKuOCfh8uo7O3lcuCEwuV4OOwgKOsq0DvBEEMwQcML
 96p2w11FbvyOOYQunqfX+Jpnsecucj8GnrdQ79kr7gr4vKGZeGXg2YAwNQi4xOGO5uRFJtg0s
 ZcTWNReF+dn01IwWpBY9yA6ijafJQRSIsmQpQEKKSlV09EYxaokBVGDMAMAyiTDgnsnD8J4jb
 fiAgk5NaH9Afo7flVauHxZCKf13x1gg4QqeaNBWbNVUMBgNqcNCrepfQAKMB7sxJRe8pHtdCe
 hR4EwyqWkqu8F3sfBaYnSF4ydM4vtbZ8dvwLCE7mng==
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

Since qemu does not implement a sparc coprocessor, all such
instructions raise this trap.  Because of that, we never raise
the coprocessor exception trap, which would be vector 0x28.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 43f19fbd9141..bf7e10216fe1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -311,6 +311,10 @@ void cpu_loop (CPUSPARCState *env)
             /* Note do_privact defers to do_privop. */
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#else
+        case TT_NCP_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.39.2


