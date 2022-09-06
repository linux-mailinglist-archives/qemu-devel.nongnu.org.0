Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BC5AE57D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:39:06 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVyz-0007c9-CY
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWa-0000AK-35
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWY-0003ZF-HF
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t7so9629043wrm.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+72IzKWpZvSMbM+2/DHbf+q0Byo3Mf/mB+Cs1AVNt98=;
 b=JOY+U8W7Gm31IrQjc1zdq7B0ZCf5sFz5VxvA4DWpvNAsnhidtsyZ4t1ZPfp9jttUUB
 EndReDxRO+BDmO2g9oEyvTIFvQXJM1/So+um4o6LdTqOj33jcd5U3kfAdyRd6OsFBa6r
 9qZ1GrAqijBOZyh6eABtWFnDIHe7mXsMJEhcJ7nfZRDqO93hpeqBRP5L1ywjdo2CUjgK
 b9ApOtm8tPEBTQuTBp2FHWtGUYPaHM/5VTMR1unBSkJFu/CjLRHT4lYELVM3hTVk7kqF
 VduXfPyFvw8bxoPKAywN0WlZXJOlTwW0YbRH/1TRvj8o1/lRvlD2jPqk5sVHC+i1pmwg
 Xw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+72IzKWpZvSMbM+2/DHbf+q0Byo3Mf/mB+Cs1AVNt98=;
 b=gwgVt414iXz8LZ5zi1jTkGkKvTYZG9+WHn1cyPFQ5wa0pOP9i9EFn/bDthE8UH7HKv
 RsOwtK4SfKB17N9zRG+rPx6z/WhDSDQ7QJgpjOQwiVWlHNYjoWJQQkh7C0yJY2flvQ0Z
 HJb2PiDy/bCxUzFO3t80+on0gdjqAY5rHXOHrfIug3NFbNNVXfpM2lCMwLnU4j0UIHd+
 7n9QeE1cwe2s29AIUbv+09dS6YFvJXdjFkh96ZOrYgwNZp1BX0cos6Mk8nBcxQtHyFrh
 b9Tz+z7bY18Xe2ZbSjD5R+Fe7qfEtvpREzTH2J+2pWa3RuIUqBvJFOFDoCiJMR8VE5r9
 sRsA==
X-Gm-Message-State: ACgBeo3kBymzzTXsDQ/UR9bYgnXsp6z7enEFZf0qtaW8urmUwS5ik3zu
 2Urcf4MLc8YkVteBDe+R+myA+Uf3TeXwiZgw
X-Google-Smtp-Source: AA6agR5qDfcCVw9Tp7Sx88NlD9ojlKSlMnoIX1uv6YNfxZTE8k8zoZTEYuVuGuCwH3KoteqjDMXKJQ==
X-Received: by 2002:a5d:4e8b:0:b0:228:6439:eb35 with SMTP id
 e11-20020a5d4e8b000000b002286439eb35mr6906630wru.38.1662458980854; 
 Tue, 06 Sep 2022 03:09:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 07/23] target/i386: Introduce DISAS_EOB*
Date: Tue,  6 Sep 2022 11:09:16 +0100
Message-Id: <20220906100932.343523-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
index 6084c85609..778ee4ed4c 100644
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
@@ -8814,7 +8818,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                  * the flag and abort the translation to give the irqs a
                  * chance to happen.
                  */
-                dc->base.is_jmp = DISAS_TOO_MANY;
+                dc->base.is_jmp = DISAS_EOB_NEXT;
             } else if (!is_same_page(&dc->base, pc_next)) {
                 dc->base.is_jmp = DISAS_TOO_MANY;
             }
@@ -8826,9 +8830,24 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


