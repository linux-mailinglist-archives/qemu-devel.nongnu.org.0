Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA013670CD9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv79-0003yn-Ib; Tue, 17 Jan 2023 18:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv74-0003w1-AU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:30 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv72-0001Tf-LB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:30 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f3so23199108pgc.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuZ+Hlic4RgbTEoQoC4Ww4XDg1V1LGDarx8WVkmv+vY=;
 b=xG07Td2XBomHO6kcHPNpLLrfd4zCdS4qaPIhOeqBRSLWDq8t8jmWuyq0EwRIoHSPxX
 1eaWzYB2+iQlZnMzx8K5VTC7IJCI1kYFcXIJZYrwrLbB6YEJUXAUlTBLqU8Uejqf8w2r
 fo5OoP5MHQZqQvjATzFK03H8xnia0HnzC1YG7pXuRe/YhEqMFLPL/vhB6Gu0a9M+n5PI
 fP+I716/VoGX2srxsOPo1MBmHl+Bkk0fDUQdqTIlM7HDryBHFeILM9Ta9LfhEhEguRwU
 0dDfffrFHiQb5Plm2L8AJCrl8cqcCAT4OdOoZBWKeuE7UzSJ7jqRRFBi0ucXoynLBXO0
 cEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuZ+Hlic4RgbTEoQoC4Ww4XDg1V1LGDarx8WVkmv+vY=;
 b=H7nedWwhXNUOyKNWW3psZjBJ9SV51vArjyS7dOW+fjHfd2r4g3KpkZDDd0+QjUY6Kg
 dq2cIlG+5Ix28EemFTW/ShuIzihuvLmkRfbCfhkPBvHmt0jhmit0vCRPIyc4yh/0ToYh
 nkKXx2JvAnbyfHmdVcGhCyV39IHxvYMZ8Wl6hsqSCAfNDA0139vOizBvFhPOjVO9f3Ga
 r6eC/S7w+qzSmFnjSDzGXq07M/9RA/Muyyt+5SLi8EcaFdLnFI2gBNqCoA5buM+vpS56
 PpBdcjjgsdfGPK6dT58qClMxWeTUqZ0T1JcRco5VP01F08M9Y5Sw3yQ+f71WnHhCTO2S
 JN8g==
X-Gm-Message-State: AFqh2koCSJZhPVPP/LZssH4E2f9Fy/av8EE/sHqPRRjkJQGorqYj8aS/
 HzgfnsBIHzxPcC7/Xoluwg2rlR9D0PJ9ZpiT
X-Google-Smtp-Source: AMrXdXuLFN1TZRnRZBh72aKUIGtQxtGMxHEz35bK2Y3h1UVvKCIbOvEPnmZlKZGym6/r09MCyES/tA==
X-Received: by 2002:a62:4e8e:0:b0:580:fb8e:3044 with SMTP id
 c136-20020a624e8e000000b00580fb8e3044mr5846864pfb.22.1673997087205; 
 Tue, 17 Jan 2023 15:11:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/22] tcg/arm: Implement direct branch for goto_tb
Date: Tue, 17 Jan 2023 13:10:49 -1000
Message-Id: <20230117231051.354444-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that tcg can handle direct and indirect goto_tb
simultaneously, we can optimistically leave space for
a direct branch and fall back to loading the pointer
from the TB for an indirect branch.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 52 ++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e1e1c2620d..6abe94137e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -135,6 +135,8 @@ typedef enum {
     ARITH_BIC = 0xe << 21,
     ARITH_MVN = 0xf << 21,
 
+    INSN_B         = 0x0a000000,
+
     INSN_CLZ       = 0x016f0f10,
     INSN_RBIT      = 0x06ff0f30,
 
@@ -546,7 +548,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
 static void tcg_out_b_imm(TCGContext *s, ARMCond cond, int32_t offset)
 {
-    tcg_out32(s, (cond << 28) | 0x0a000000 |
+    tcg_out32(s, (cond << 28) | INSN_B |
                     (((offset - 8) >> 2) & 0x00ffffff));
 }
 
@@ -1941,32 +1943,52 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    /* Indirect jump method */
-    intptr_t ptr, dif, dil;
-    TCGReg base = TCG_REG_PC;
+    uintptr_t i_addr;
+    intptr_t i_disp;
 
-    ptr = get_jmp_target_addr(s, which);
-    dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
-    dil = sextract32(dif, 0, 12);
-    if (dif != dil) {
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
+    set_jmp_insn_offset(s, which);
+    tcg_out32(s, INSN_NOP);
+
+    /* When branch is out of range, fall through to indirect. */
+    i_addr = get_jmp_target_addr(s, which);
+    i_disp = tcg_pcrel_diff(s, (void *)i_addr) - 8;
+    tcg_debug_assert(i_disp < 0);
+    if (i_disp >= -0xfff) {
+        tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, TCG_REG_PC, i_disp);
+    } else {
         /*
          * The TB is close, but outside the 12 bits addressable by
          * the load.  We can extend this to 20 bits with a sub of a
-         * shifted immediate from pc.  In the vastly unlikely event
-         * the code requires more than 1MB, we'll use 2 insns and
-         * be no worse off.
+         * shifted immediate from pc.
          */
-        base = TCG_REG_R0;
-        tcg_out_movi32(s, COND_AL, base, ptr - dil);
+        int h = -i_disp;
+        int l = h & 0xfff;
+
+        h = encode_imm_nofail(h - l);
+        tcg_out_dat_imm(s, COND_AL, ARITH_SUB, TCG_REG_R0, TCG_REG_PC, h);
+        tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, TCG_REG_R0, l);
     }
-    tcg_out_ld32_12(s, COND_AL, TCG_REG_PC, base, dil);
     set_jmp_reset_offset(s, which);
 }
 
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
                               uintptr_t jmp_rx, uintptr_t jmp_rw)
 {
-    /* Always indirect, nothing to do */
+    uintptr_t addr = tb->jmp_target_addr[n];
+    ptrdiff_t offset = addr - (jmp_rx + 8);
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or fall through to indirect branch. */
+    if (offset == sextract64(offset, 0, 26)) {
+        /* B <addr> */
+        insn = deposit32((COND_AL << 28) | INSN_B, 0, 24, offset >> 2);
+    } else {
+        insn = INSN_NOP;
+    }
+
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
 }
 
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
-- 
2.34.1


