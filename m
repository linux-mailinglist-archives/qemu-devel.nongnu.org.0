Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12644B532F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:23:35 +0100 (CET)
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcGM-00079V-Tw
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1nJbOZ-0007En-TY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:28:01 -0500
Received: from mxout.security-mail.net ([85.31.212.46]:61964
 helo=fx303.security-mail.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1nJbOX-0004dS-Es
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:27:59 -0500
Received: from localhost (localhost [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id A29711C3361
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 14:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1644845271;
 bh=Z0LiL7ZtsJtzmKHmhv7FK1DekcDf7qm2jfvY9Bmun1A=;
 h=From:To:Cc:Subject:Date;
 b=mPZmoFV1hvJREHGhZPKUFbH+eFLJuxYNQ3RSAEdVyEDXwPQc8MJRt8tf2Fb26wMBd
 AB2+5d1r24898AqwiJ3PSt0n/ByS1acNpa+DQI61Pwyn0LSuvYleaon9s2Kv1KyOHY
 ojf6bYUVhHhBz/5qQx9HiHuYSLhNrJaFcTYiPH7s=
Received: from fx303 (localhost [127.0.0.1])
 by fx303.security-mail.net (Postfix) with ESMTP id B4DBE1C33E7;
 Mon, 14 Feb 2022 14:27:50 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <728d.620a58d6.5a627.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx303.security-mail.net (Postfix) with ESMTPS id 5B6471C33CB;
 Mon, 14 Feb 2022 14:27:50 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 3D2CB27E040E;
 Mon, 14 Feb 2022 14:27:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 2569D27E040D;
 Mon, 14 Feb 2022 14:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2569D27E040D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1644845270;
 bh=avs1+E3HdP016j80CtHlqh8NCWuNNIFczqLikOUjyro=;
 h=From:To:Date:Message-Id;
 b=EUMqnN3L/n507gaDzEfLPHh74GwhPAvu0fuxqxLCIKo3l6DRelKkSuzH16Uw36PJc
 UGagFPFvvtLt8nhHw/iHtWmHr1EGYG53TRxDkuwi5df7Fn69SeNTHYFKWRO2NzFsUV
 Dt0Q/ZLC8AtJf3+QJcRAK+7Jjt8Bs5wMxsNqVhOE=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id diOo5F-uHeH1; Mon, 14 Feb 2022 14:27:50 +0100 (CET)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 08F0B27E040E;
 Mon, 14 Feb 2022 14:27:50 +0100 (CET)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Date: Mon, 14 Feb 2022 14:26:56 +0100
Message-Id: <20220214132656.11397-1-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.46; envelope-from=lmichel@kalray.eu;
 helo=fx303.security-mail.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some cases, cpu->exit_request can be false after handling the
interrupt, leading to another TB being executed instead of returning
to the main loop.

Fix this by returning true unconditionally when in single-step mode.

Fixes: ba3c35d9c4026361fd380b269dc6def9510b7166

Signed-off-by: Luc Michel <lmichel@kalray.eu>
---
Coming back on this issue I worked on with Richard in 2020. The issue is
that when debugging the guest with GDB, the first instruction of the IRQ
handler is missed by GDB (it's still executed though).

It happened to me again in TCG RR mode (but not in MTTCG). It seems that
cpu->exit_request can be false in RR mode when returning from
cc->tcg_ops->cpu_exec_interrupt, leading to cpu_handle_interrupt
returning false and the next TB being executed, instead of the EXCP_DEBUG
being handled.
---
 accel/tcg/cpu-exec.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b4cd6c59d..74d7f83f34 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -796,13 +796,17 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
                 /*
                  * After processing the interrupt, ensure an EXCP_DEBUG is
                  * raised when single-stepping so that GDB doesn't miss the
                  * next instruction.
                  */
-                cpu->exception_index =
-                    (cpu->singlestep_enabled ? EXCP_DEBUG : -1);
-                *last_tb = NULL;
+                if (unlikely(cpu->singlestep_enabled)) {
+                    cpu->exception_index = EXCP_DEBUG;
+                    return true;
+                } else {
+                    cpu->exception_index = -1;
+                    *last_tb = NULL;
+                }
             }
             /* The target hook may have updated the 'cpu->interrupt_request';
              * reload the 'interrupt_request' value */
             interrupt_request = cpu->interrupt_request;
         }
-- 
2.17.1


