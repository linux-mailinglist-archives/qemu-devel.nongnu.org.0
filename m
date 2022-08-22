Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632359CC60
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:44:17 +0200 (CEST)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQH5b-0003l7-TH
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvD-0005tp-59
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvB-0007FS-Dv
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id p9so10754177pfq.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=Cfuu6TL6rDe8aq8wLymEDU+hmx0te8Z/lEdyanUGYGQ=;
 b=uUuurCgIoZsDLI14JFxvfxciJEQ5CnKicn/HRuk4pCewN/Bl8CQiJGhkClVhr/FnmH
 uNM4YYhH/Yq4nk3vFgXYTGY4matlqOsfvS4u3zZPP8XwCURs7UKHuPrdVkwDc6CFnOpy
 YAKfynOoLR18B+WkPp3RLuSwn6Ve88bw+Ye+cUBxVGn49yKWun2Gn3SyCiHHhJaiz2P/
 BKoMjNSF8ozcO9LNMPdw24DdyhdbJuZh1t6H2psNSj/3N4Yycvbusf6bTvaJfFHSvy9C
 YYS8a10Z8uEH1HVqDfPqO/8FrLXfHrMJAfdT2vk7JgzjDWUDw6BLmTsUdM8qgu3Kugnp
 brFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=Cfuu6TL6rDe8aq8wLymEDU+hmx0te8Z/lEdyanUGYGQ=;
 b=xybcS9uLI2SPClgtWrG8tZUdbGrH36myhRZ59fN81VRIbaUZp1RdfDzKvWV8glJALE
 Ws5Ox5JEipoGgmwKn9auIYOrY7D3bYo2TaFvaJbPMoy+0muhDwf3klnL8uYLz0temspc
 189enoEJmyLYyhwS7EE33T8JkZ0tOzuDPoP5Gu3KihAxEgr2DJ49G7bwA02oogETWIUD
 9wA71A20Qf9r/b1Lz1Od8mF9U305U5djZQ8PVW2YpcJCl0ZaVQ2KUMrC/SQCmTZykNYq
 vfVqKUYZ4bLBnZl34PDenwlXwwBwHdcsVHBwupaLVzgbAnU7w7qF6pNZsQ6U585nuJqr
 4C3A==
X-Gm-Message-State: ACgBeo02Gsvdc0Q6ZEXfaQtH1TI7+p60QKZ47Vzs9JxxLleDLYV0hfqA
 UmLmowCtjhov/vJWpOJ1z8nRH0nn98AShA==
X-Google-Smtp-Source: AA6agR4Ke3uA9bysce0YdDGJkIVQehVOUAV9oJHwmHnOyj+NsfpCHd5oaM46FVxJe1G8bfC/cprGuw==
X-Received: by 2002:a62:7b14:0:b0:536:b424:3780 with SMTP id
 w20-20020a627b14000000b00536b4243780mr6040748pfc.63.1661211207701; 
 Mon, 22 Aug 2022 16:33:27 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/22] target/i386: Introduce DISAS_EOB*
Date: Mon, 22 Aug 2022 16:33:02 -0700
Message-Id: <20220822233318.1728621-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Add a few DISAS_TARGET_* aliases to reduce the number of
calls to gen_eob() and gen_eob_inhibit_irq().  So far,
only update i386_tr_translate_insn for exiting the block
because of single-step or previous inhibit irq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 36883410e0..579ba37e76 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -132,6 +132,10 @@ typedef struct DisasContext {
     TCGOp *prev_insn_end;
 } DisasContext;
 
+#define DISAS_EOB_ONLY         DISAS_TARGET_0
+#define DISAS_EOB_NEXT         DISAS_TARGET_1
+#define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
+
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
@@ -8701,7 +8705,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                  * the flag and abort the translation to give the irqs a
                  * chance to happen.
                  */
-                dc->base.is_jmp = DISAS_TOO_MANY;
+                dc->base.is_jmp = DISAS_EOB_NEXT;
             } else if (!is_same_page(&dc->base, pc_next)) {
                 dc->base.is_jmp = DISAS_TOO_MANY;
             }
@@ -8713,9 +8717,24 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->base.is_jmp == DISAS_TOO_MANY) {
+    switch (dc->base.is_jmp) {
+    case DISAS_NORETURN:
+        break;
+    case DISAS_TOO_MANY:
+    case DISAS_EOB_NEXT:
+        gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
+        /* fall through */
+    case DISAS_EOB_ONLY:
         gen_eob(dc);
+        break;
+    case DISAS_EOB_INHIBIT_IRQ:
+        gen_update_cc_op(dc);
+        gen_update_eip_cur(dc);
+        gen_eob_inhibit_irq(dc, true);
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.34.1


