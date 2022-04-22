Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192950BECC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:36:01 +0200 (CEST)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxCK-0008Cy-Nq
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwab-00089Z-DE
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:01 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaY-0007yE-JN
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:01 -0400
Received: by mail-io1-xd34.google.com with SMTP id h83so9207355iof.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jeDOlvgCVk+y2B//qRod3Wvk+Oo9Yi7Y8REDz4Pr8oM=;
 b=oisSAZ7ijJ0r5mNIUe0geHNDBG+eONqI1mBhRptXvEATBCbsd+KkSFwTr8kinEzSmp
 NSinwGKLOL3pS8E14JPe190dmxNLCXzVjMSS/s15tfbro9APbWKXdGFo18MJmwXX8eWQ
 sypp0UOZHb2BLEA8tNCExgEaESuGLUpKZboXz8qfH1vdxMhbanHpUA2g8u0GzhX+P/ut
 6mZe2KLeb2yRhcTfeWpWRjj3VqpYlLtcyF9u08BmDxSW1KRltLrZSQL23B+BeAdD9574
 j15IRYL/beuIMpaBEvOFijSUN8I56PVkzhoZYtobtYmql+3lF8DYW9/gMHfIyMHP9DtF
 JBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jeDOlvgCVk+y2B//qRod3Wvk+Oo9Yi7Y8REDz4Pr8oM=;
 b=yK6Vzbc7nxMEFQpmY7ORLDhfLTKevVmu2f/7BYRaQgdsEHIB5y05Jh6U44WEosI23s
 QjOp6oFDWqVUdBGpsblqBQ+iwFgHWA7VklLbR1XkwPcxnKYjKSwKjvUdsgCI24ZEe/pl
 ghWhuoML3GXYFAZ2p+D6Mm6srFUGDhlHjxUCL/gMhXq4EaSmWCtfL2uKSJpnbEZAEc+u
 N/rRBcirXbjhECSx5wDv8UkyJG/LfBNoObDbqo8nPPNdf0xiJDyBJanTdD+MnwH+58Qm
 qLUMwiBPKao4H5rl9qiBmREiF6DbSzjF91mQqzCLPdBKY2LWmuE++t8SF6H7QAa6iuOj
 Xzdg==
X-Gm-Message-State: AOAM532/6i6D/7TJxD0dpud04rSkN+mr08MmuVpdp1D/A308gs0m201l
 Blcpaj4TGGGooXgDUggHXEjQR0viuwgv/g6i
X-Google-Smtp-Source: ABdhPJx8okUb/PUwByK/rKCOuQad/Yx23jMR29hnP3C0ZQzzL7PNLAAnlN6+PNhlt/JKwNOKd5/d0w==
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr2511748iov.93.1650646617473; 
 Fri, 22 Apr 2022 09:56:57 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:56:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 42/68] target/nios2: Use tcg_constant_tl
Date: Fri, 22 Apr 2022 09:52:12 -0700
Message-Id: <20220422165238.1971496-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd34.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace current uses of tcg_const_tl, and remove the frees.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-43-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index b27269bf08..f33015f942 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -99,7 +99,6 @@
 
 typedef struct DisasContext {
     DisasContextBase  base;
-    TCGv_i32          zero;
     target_ulong      pc;
     int               mem_idx;
     const ControlRegState *cr_state;
@@ -125,31 +124,20 @@ static uint8_t get_opxcode(uint32_t code)
     return instr.opx;
 }
 
-static TCGv load_zero(DisasContext *dc)
+static TCGv load_gpr(DisasContext *dc, unsigned reg)
 {
-    if (!dc->zero) {
-        dc->zero = tcg_const_i32(0);
-    }
-    return dc->zero;
-}
-
-static TCGv load_gpr(DisasContext *dc, uint8_t reg)
-{
-    if (likely(reg != R_ZERO)) {
-        return cpu_R[reg];
-    } else {
-        return load_zero(dc);
+    assert(reg < NUM_GP_REGS);
+    if (unlikely(reg == R_ZERO)) {
+        return tcg_constant_tl(0);
     }
+    return cpu_R[reg];
 }
 
 static void t_gen_helper_raise_exception(DisasContext *dc,
                                          uint32_t index)
 {
-    TCGv_i32 tmp = tcg_const_i32(index);
-
     tcg_gen_movi_tl(cpu_pc, dc->pc);
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(index));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -876,14 +864,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
-    dc->zero = NULL;
-
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


