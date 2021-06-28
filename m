Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916053B6ADD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:13:09 +0200 (CEST)
Received: from localhost ([::1]:56710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzV6-0002AR-Jk
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQc-00017R-CV
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQR-0006Iu-An
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:30 -0400
Received: by mail-pf1-x431.google.com with SMTP id q192so15410232pfc.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+aZ7YRTaDz2yzxNYmjWgOIy5ZeBZKDl/4o9KjZuCr+I=;
 b=lf1aqDODDoYhEbqvoaNQRMtQlkpQEYBKMcLpd7BP4dLVP903h+ycsNwBNmvIHJXVSu
 NiCExgs8gwsmYa365r5EKw31VjlPfrtLsMmvznKxS/UNj7Jz3S7MVH3x6z5ZiNhRMZ0S
 Auf7cmCs5kwWGC26T7qAl3AfnrnpLJDLowlNuLsUoAbPC5DrDY+f1tTf2KddpBq0104o
 Q/9N6BE4Iuftr06dsbOz8/g18H8TScV8NjC24dToMoUPHp5rUQ2AY+W4j+Co9of7gfZQ
 GodkCCx4o0H5I+d6ovADgQW1B797HmxZdxEfO7kj+VzkH9d/xs7g38qYZQ1R3CG7coYP
 UZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aZ7YRTaDz2yzxNYmjWgOIy5ZeBZKDl/4o9KjZuCr+I=;
 b=ny7oQSZ//P3Z+nF4up8ovNOK9fKf9oSS5vXb5VDP5hos57RtANCyQ1x6DW/44MSHbo
 41SbQo8b+pVadcMjOTPeb3RG/aS2D55OM5GSrfgO5fLNBL5MGlg25KQ0GYtTbMXQenIm
 gRzFZri0MH9OBkkZcPHl1G+J28naLyb47YiDm2qRfK1ZVWBqzJm+rlAAYuxors+5v1MC
 zRV9Ptjdxh/s9SD5sVqvbOhRj8E09uLvJck6Mr8JOxonfi3/TCgeSd6FTOp9dhxzUNXh
 YsFuyCulxq03rOcuw6WK+H+1Sz4jOe9PF8LOqGDmPKiMazzVOuwyQR+qBudT55x3kliI
 ezDA==
X-Gm-Message-State: AOAM531ECU7xZrOIk2Azc1RxpQApuVNquCRduUrj7whfDL/Y8hLcinHV
 kdN8F16XTLrbyPUMfrXQUQxQ8tK+tMxc3A==
X-Google-Smtp-Source: ABdhPJy5EnCDhJRgG4JqutAuQxkjY2YKRHVOmdpVgaG4ykx96ITLSqqoOwb01akgcfac31q5lCjILQ==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id
 i22-20020aa78b560000b02902b977bed305mr26819417pfd.61.1624918097406; 
 Mon, 28 Jun 2021 15:08:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] target/nios2: Inline handle_instruction
Date: Mon, 28 Jun 2021 15:08:09 -0700
Message-Id: <20210628220810.2919600-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move handle_instruction into nios2_tr_translate_insn
as the only caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 66 +++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 9e71267b42..abc7e5f96a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -735,38 +735,6 @@ illegal_op:
     t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
-static void handle_instruction(DisasContext *dc, CPUNios2State *env)
-{
-    uint32_t code;
-    uint8_t op;
-    const Nios2Instruction *instr;
-
-#if defined(CONFIG_USER_ONLY)
-    /* FIXME: Is this needed ? */
-    if (dc->pc >= 0x1000 && dc->pc < 0x2000) {
-        t_gen_helper_raise_exception(dc, 0xaa);
-        return;
-    }
-#endif
-
-    code = cpu_ldl_code(env, dc->pc);
-    op = get_opcode(code);
-
-    if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
-        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
-        return;
-    }
-
-    dc->zero = NULL;
-
-    instr = &i_type_instructions[op];
-    instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
-}
-
 static const char * const regnames[] = {
     "zero",       "at",         "r2",         "r3",
     "r4",         "r5",         "r6",         "r7",
@@ -842,12 +810,40 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUNios2State *env = cs->env_ptr;
+    const Nios2Instruction *instr;
+    uint32_t code, pc;
+    uint8_t op;
 
-    dc->pc = dc->base.pc_next;
-    dc->base.pc_next += 4;
+    pc = dc->base.pc_next;
+    dc->pc = pc;
+    dc->base.pc_next = pc + 4;
 
     /* Decode an instruction */
-    handle_instruction(dc, env);
+
+#if defined(CONFIG_USER_ONLY)
+    /* FIXME: Is this needed ? */
+    if (pc >= 0x1000 && pc < 0x2000) {
+        t_gen_helper_raise_exception(dc, 0xaa);
+        return;
+    }
+#endif
+
+    code = cpu_ldl_code(env, pc);
+    op = get_opcode(code);
+
+    if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
+    }
+
+    dc->zero = NULL;
+
+    instr = &i_type_instructions[op];
+    instr->handler(dc, code, instr->flags);
+
+    if (dc->zero) {
+        tcg_temp_free(dc->zero);
+    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


