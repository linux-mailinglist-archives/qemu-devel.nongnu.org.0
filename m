Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D56F8AD6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vD-0000cU-8I; Fri, 05 May 2023 17:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v9-0000bi-Oo
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v7-0004O4-KL
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so15953625e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321892; x=1685913892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7k6JbT1Cu9D6+D63VgpuW6vTvCzozecySlTlgzNc9d0=;
 b=mejBC6cATgoFyX/YdI5ycgQU2F3VEGtewOzIJDkBztdRKENNL0ZItMTOpQDexpR6SW
 vr9ZKY7LG3X9oQ5Chkejy6Dyh1AguMLV/KcX43NweAuECsemdyy5ZNjOxvkNBki+Gf1U
 WRkZPOPhGmLiAkDYXQcxOr9fVCk3iDMB/N9g/OoJVyVrPWGgnNWM2GLpcMST2QABKO03
 J4hLyxNyFNUU3B5N7n8SXjXthk9NZ65CpvhcrJORzjz8CtOyX17gZGwX4fDPPzeHstmm
 F5PN5bZ1O7wmSX39VhoiuaBvWEqsHdgvSE9yYFsj1MqD3/UIexK3dUmnbq0gwSFHaUNP
 bXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321892; x=1685913892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7k6JbT1Cu9D6+D63VgpuW6vTvCzozecySlTlgzNc9d0=;
 b=N3/DKlrPgRq5PJs/B8w3RIc9dDax1g2jn5pvZds3B5NXFgLrLUQB2uYuIFLVcSs3P+
 Mqdu2C94dACL/kJlPlesyPR8sN8ZgKO+Y3XFHwA4z78qBk07eZqO19snFNBqj0uImSnD
 GMVQK/eUsp+mmw4Gqw1sHgJMHonCgefUe8wthFhO5Ju6oco5n7NKe55hsu2UOxwIsx7G
 DHHX9eZhEj+IQzqEvKTHwsykpwqdt2Kjoiiv07in2eKNvVxW7/+hZ0pkW0Vd6P638qko
 cm+DcVenv2g6rkvNRTV2x5eHBKQ7r4CGnFDYkqF/dfbvZURx1piO6H+407HBNRZIeGdK
 bMpw==
X-Gm-Message-State: AC+VfDzBrTqrdmynhu9+UbTpR6cH9JJZDSRdSd0lEqRhtPPwRI3V6yFY
 THcJfnl0aNvHqGHTLx4tEkGklmP5GkzTBEx8KbHBjg==
X-Google-Smtp-Source: ACHHUZ4f40hphY+/ut5BvWhJUahsSDzHkq1aIKob5qOchkPLdEHBkjN8oMtHLh3RFK1+ntqTZB8haw==
X-Received: by 2002:a1c:f408:0:b0:3f1:7372:f98f with SMTP id
 z8-20020a1cf408000000b003f17372f98fmr1839311wma.41.1683321892348; 
 Fri, 05 May 2023 14:24:52 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
Subject: [PULL 06/42] target/mips: Finish conversion to tcg_gen_qemu_{ld, st}_*
Date: Fri,  5 May 2023 22:24:11 +0100
Message-Id: <20230505212447.374546-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert away from the old interface with the implicit
MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-6-richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c              | 8 ++++----
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 999fbb7cc1..a6ca2e5a3b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1949,13 +1949,13 @@ FOP_CONDNS(s, FMT_S, 32, gen_store_fpr32(ctx, fp0, fd))
 
 /* load/store instructions. */
 #ifdef CONFIG_USER_ONLY
-#define OP_LD_ATOMIC(insn, fname)                                          \
+#define OP_LD_ATOMIC(insn, memop)                                          \
 static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
                                 DisasContext *ctx)                         \
 {                                                                          \
     TCGv t0 = tcg_temp_new();                                              \
     tcg_gen_mov_tl(t0, arg1);                                              \
-    tcg_gen_qemu_##fname(ret, arg1, ctx->mem_idx);                         \
+    tcg_gen_qemu_ld_tl(ret, arg1, ctx->mem_idx, memop);                    \
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPUMIPSState, lladdr));            \
     tcg_gen_st_tl(ret, cpu_env, offsetof(CPUMIPSState, llval));            \
 }
@@ -1967,9 +1967,9 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
     gen_helper_##insn(ret, cpu_env, arg1, tcg_constant_i32(mem_idx));      \
 }
 #endif
-OP_LD_ATOMIC(ll, ld32s);
+OP_LD_ATOMIC(ll, MO_TESL);
 #if defined(TARGET_MIPS64)
-OP_LD_ATOMIC(lld, ld64);
+OP_LD_ATOMIC(lld, MO_TEUQ);
 #endif
 #undef OP_LD_ATOMIC
 
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 9398e28000..97b9572caa 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -998,7 +998,7 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
     TCGv tmp2 = tcg_temp_new();
 
     gen_base_offset_addr(ctx, taddr, base, offset);
-    tcg_gen_qemu_ld64(tval, taddr, ctx->mem_idx);
+    tcg_gen_qemu_ld_i64(tval, taddr, ctx->mem_idx, MO_TEUQ);
     if (cpu_is_bigendian(ctx)) {
         tcg_gen_extr_i64_tl(tmp2, tmp1, tval);
     } else {
-- 
2.34.1


