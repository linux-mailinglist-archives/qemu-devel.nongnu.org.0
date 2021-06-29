Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E33B78AF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:31:19 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJS2-0003BF-BV
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItB-00081O-1L
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsw-0000s4-Uy
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so3079694pjo.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/3UYnAw/Iw5+lYVvwYrCl8yQAl4h8zPvaGurMEMOTY=;
 b=RsKPgkt8YNh2p9EUfdlzEM0Vx/9va1HVXT+wqNjovQO6F72giuv8HRhPKpbuag8/+3
 jeG9s8E2Tp9+mAnw+Hcyt3r9HRkcgHqXZQKE02en8MPdawwKGqyXWurjVWBxD6AH+lng
 gomB3h9wKCoiY5jCnHmDLBOITNM0GgYhgJtwNW3L3iadSjiLEt8ZWYauhh7w2/f/4Tuv
 mMDfuPSICIhmKq79xmhCBH7aFrnqPWkU9G6hAyD54g1K3+PW4mlgLx6+dEi59NpiPqte
 nkOTqqHD9VlGd5EeKuydQRvt+ZVM9ZcZqaV4MYZyET5tvhmzF1omFbkl5qCLcRQS9OCS
 G1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/3UYnAw/Iw5+lYVvwYrCl8yQAl4h8zPvaGurMEMOTY=;
 b=TGmoze4zLJ6pQDMn9Q13e630E+c9A0ZxTmV+2nsi2l4w0A1DsFXe1BhxwKCOGDDOeq
 /M8CIO/8s4cicBxF15rHQOX0NiDvzz3yJmWQPUBabr3nsuzPDLeswzGA4p2cl3y4FTdG
 h5z/JM2NV6TSfZ+MM/e/qZjvUBYLzc7YgDT1lQQ45IKIkzP76joZ8/1gSkyiaqdTWuCg
 SW0ecUOueJS2dS/T/rNTx2KKoSzJpQx9ie/lMDBdT2L2ogHXjcTJOYo3DGA+DSLrDjSd
 RggJFJeYf1HE8YXvS0UtkEIsRAAWu6IvHOPbsEONHSQTys7LYDd2ZY+kEWZizuYW3YF6
 Odog==
X-Gm-Message-State: AOAM533e7D6hkF3B7TXWpNApcb1LZ1ksBIErh2Xh6qW/xertskRptOs+
 4Rugo+kAmX2OalMLEkTWLs0TbSOmwhgm3A==
X-Google-Smtp-Source: ABdhPJzojyDRCtTXyzVZ7sl26NJqdbw4DYJd3s16N6kI7yBhfIy7Z1K58TIkYYuoM02HVUscAQeyWg==
X-Received: by 2002:a17:90a:6548:: with SMTP id
 f8mr36310253pjs.106.1624992900729; 
 Tue, 29 Jun 2021 11:55:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/63] target/nios2: Inline handle_instruction
Date: Tue, 29 Jun 2021 11:54:00 -0700
Message-Id: <20210629185455.3131172-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move handle_instruction into nios2_tr_translate_insn
as the only caller.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


