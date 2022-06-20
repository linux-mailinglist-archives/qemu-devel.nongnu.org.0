Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15776551ED6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:29:35 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IPF-0002I5-Va
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL7-0005dK-Bk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:17 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:33824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL4-0001Rv-Vx
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:16 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 65AAB3D3B147
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655735110;
 bh=Z0LiL7ZtsJtzmKHmhv7FK1DekcDf7qm2jfvY9Bmun1A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HXOegg5bXUe/aVNYRVa2tZPmkLUpERgupWRfGH+waXI3SlJ8n5rMtwJWyfEBt0vg5
 vxSGDlHlirdkefdwmVGd6rxthoYfq4utdHg6UsMrQc7dX0jFU8Ei388cbatg5se7XD
 1SQIvDDM5jcZHw6XvvV7nqxo25h6uA01pr2sIHjA=
Received: from fx302 (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 10DD93D3B13B;
 Mon, 20 Jun 2022 16:25:10 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <9b0b.62b08345.729f0.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx302.security-mail.net (Postfix) with ESMTPS id 735353D3B11A;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 4CBEB27E04D6;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 329F227E04D9;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 329F227E04D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655735109;
 bh=avs1+E3HdP016j80CtHlqh8NCWuNNIFczqLikOUjyro=;
 h=From:To:Date:Message-Id;
 b=E71zSYL1T/dWvdQrddN/jUOv/C2/y1sn5xx2GnGUr73/8cAI9gW85JcyQ1R9m5qzD
 EjwAV5yTvoNm7BuLa7I77wEFq5l5KHJiybDOekR7QAQkkMngncJRjfcMftrcrcH5aj
 1JrT1TH47AEEjguwimbFHJxkeDqEgUyQds2HPa2Y=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X93LYCqijcKB; Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 185E027E04D6;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Date: Mon, 20 Jun 2022 16:24:19 +0200
Message-Id: <20220620142426.15040-2-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220620142426.15040-1-lmichel@kalray.eu>
References: <20220620142426.15040-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.42; envelope-from=lmichel@kalray.eu;
 helo=mxout.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


