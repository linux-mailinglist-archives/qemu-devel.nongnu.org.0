Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656160D941
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtW-0004qx-FQ; Tue, 25 Oct 2022 22:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtL-0004gO-DL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtH-00011o-Ed
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:11:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so876542pji.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEeh4cUnjW7mNJ8BWl6JcUo3gnq8r+qB7WZx+ISNj+A=;
 b=f5yfGUy+IYzxXI0sOrRZvrBQ//q88TeeiBtIRZdkZ3luZKA2Sao3/B0iYH947DNLUg
 w8uWISDt2jkCsTq9eiySP2YjeuBkZz0xVw3jcB6PZuqM8cvdEDHIdicU4fTTkUg1UixR
 WATMJSbu3xvN1lGhCXJTCYgd35wWFyrRnSBoO5q0eOUKHGjvBuLhXTxQTqcWFnxRN5WI
 axU4/dyiMnXPGQC/TXMc33FLgufHOlso7ZCoox3OvRLW6SRpJ+dyr1jzvw2+YnsrNWSi
 6byFJOH/i027ZnUptIch5hoPMY6oizTNvw6W151EUy5Y8jIBJw9kAo1oIu+xZVmy2E/0
 61ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEeh4cUnjW7mNJ8BWl6JcUo3gnq8r+qB7WZx+ISNj+A=;
 b=7skYykGwb3/+JGxUgbXNI6eoeVJwX9/wptd55ej4JEiOiZ3wj2lCil5OuQjCUOaQsF
 EmbkjVIOBZNVO6T6mQZ4TZbX3sa80r75yiaprkhhugHIZLnXJbKhNEuck8t4/dGyof0V
 8hQ9C/d8LntBf5Dcr8cQnAKGGlAkJwnsJrhRcBD35cEgSRkaWldnrwEXdvV6l0+tieap
 YEn9hdJUkAqLo/TG3LWZnmcrbFgMVq0gkPJpFZuszBN9Sx/p8nMYnBCzwjvENBrJF/kD
 ZuvPQ0EuoOUUf6de04gbwWE0fxp60JnoYjAQoWGPR1mIbamtX5HR4SYQt/dd92MN/sEG
 PVIw==
X-Gm-Message-State: ACrzQf2WHo6e6rnjTb5GNCGkmKsOw6DcdywzaGNITF5zYZnmE9cBuZHl
 Pghl1OH5B2uoyJiFJKI1nyCYnj1BXevW+FRS
X-Google-Smtp-Source: AMsMyM5wcG6a/tHpHrlleO8nQ1GoDWF1QYTDQjjKz50PrWJ4ClBbZMWB2UzwELcXfEXB+irCv4o7cw==
X-Received: by 2002:a17:90b:954:b0:213:c01:b8ce with SMTP id
 dw20-20020a17090b095400b002130c01b8cemr1539423pjb.168.1666750293133; 
 Tue, 25 Oct 2022 19:11:33 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:11:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Qi Hu <huqi@loongson.cn>,
 WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/47] tcg/aarch64: Remove unused code in tcg_out_op
Date: Wed, 26 Oct 2022 12:10:32 +1000
Message-Id: <20221026021116.1988449-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Qi Hu <huqi@loongson.cn>

AArch64 defines the TCG_TARGET_HAS_direct_jump. So the "else" block is
useless in the case of "INDEX_op_goto_tb" in function "tcg_out_op". Add
an assertion and delete these codes for clarity.

Suggested-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Qi Hu <huqi@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221017020826.990729-1-huqi@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d997f7922a..344b63e20f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1916,24 +1916,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset != NULL) {
-            /* TCG_TARGET_HAS_direct_jump */
-            /* Ensure that ADRP+ADD are 8-byte aligned so that an atomic
-               write can be used to patch the target address. */
-            if ((uintptr_t)s->code_ptr & 7) {
-                tcg_out32(s, NOP);
-            }
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            /* actual branch destination will be patched by
-               tb_target_set_jmp_target later. */
-            tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
-            tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
-        } else {
-            /* !TCG_TARGET_HAS_direct_jump */
-            tcg_debug_assert(s->tb_jmp_target_addr != NULL);
-            intptr_t offset = tcg_pcrel_diff(s, (s->tb_jmp_target_addr + a0)) >> 2;
-            tcg_out_insn(s, 3305, LDR, offset, TCG_REG_TMP);
+        tcg_debug_assert(s->tb_jmp_insn_offset != NULL);
+        /*
+         * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
+         * write can be used to patch the target address.
+         */
+        if ((uintptr_t)s->code_ptr & 7) {
+            tcg_out32(s, NOP);
         }
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        /*
+         * actual branch destination will be patched by
+         * tb_target_set_jmp_target later
+         */
+        tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
+        tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
         tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.34.1


