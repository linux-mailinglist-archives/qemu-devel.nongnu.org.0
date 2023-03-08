Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC26B0931
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZttM-0004D3-5Y; Wed, 08 Mar 2023 08:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr5-0001kk-7A
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr2-000692-Mp
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:18 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDy9C-1pjpTK25PI-009vM2; Wed, 08
 Mar 2023 14:29:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 25/28] linux-user/sparc: Handle unimplemented flush trap
Date: Wed,  8 Mar 2023 14:28:54 +0100
Message-Id: <20230308132857.161793-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Otbx1g0NSzrg8O1qhGQStI53DAYQ75e+sOyvIYFRp0/iw1i0qwj
 +EHaf9NoPrH4OdVQ7/5YM541d0dXkInIH4nWCqTjTnzWZEmbzI9jnUHTgRfxA8zN0eKyG1o
 HWqUrJZPMIjinyrQS289b9YCaDdSWRqsmveZw8aQrHGjla6HJu6rWXx5eqY/H4oqeSMB/6t
 OcfO8lJIeYVDKHB+uyynQ==
UI-OutboundReport: notjunk:1;M01:P0:k42t6i2XSOE=;AVZBb/+6UE5dfc2Ec9XMbOqwgOo
 bEARao7c/XmAbwyjtspiqrSoiTCYhRuCKcI2lNY/dbX8xBpJbnan67xTD3czl5epckuOr7+o4
 IXExIhSNshqEcR8+NDxPJYYbO9X3QXLoGhmp8cAlVBs1ISJgZL/DpNbnkoZtjqdGjS5/j28dU
 yiNJc5NJZj/SBp2F5bM8dV+kyQLtogfCt3DAXD48Rf3MeyKYKVyUVddPO8WOee0umE9DRq+Zf
 BMGzunNmIxikldN6h6hKjJ0z8VuB/jCSvd2Dj9/jraMjnj+iOwfn9c+3Z6+43hdYyUVOV5VWr
 1MA01utdN6+2pnq53xJzqIw5Qio9/RDodRUFDk/LHd6MrLfDzLWHcG15fd6nCeY3+Lv9hI1CD
 /Cm9N7tKN6O4rHv+KLhsDRPxTLwENpAFe2tyH0rQNbwnTD28Lkr+9GQw8pn+7ccr+fJPlBSFK
 AjMNXRsu+p46Bk0q5Dj/p5sQWNr8xDNbjH+me8PSQG5Qd9ozjG5rZPZ0Epihk4sdG8GUMl34i
 78KH5074/C6oEm5kbpuqCz6hpvQKQ7ziJvezBqJT1NE3tSwAJiykEEU6YCLXTRAtlw82QiaIZ
 vs5cNciwhPmdHZQY2uadUrxg3k8KqcZffGX2mYhOo/bBesxcecJnQY6m0RGzW3ISJNhLrkg4k
 MbShtnJJzMtKciO8lK/nBWFw66U5Z6Qf8v3vj/qyQg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

For sparc64, TT_UNIMP_FLUSH == TT_ILL_INSN, so this is
already handled.  For sparc32, the kernel uses SKIP_TRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index bf7e10216fe1..093358a39a4a 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -315,6 +315,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_NCP_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
             break;
+        case TT_UNIMP_FLUSH:
+            next_instruction(env);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.39.2


