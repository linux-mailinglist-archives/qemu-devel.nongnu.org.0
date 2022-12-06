Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B0643C39
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POv-0003Uf-V7; Mon, 05 Dec 2022 23:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POt-0003Tk-G7
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:47 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POq-00073o-Vx
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:47 -0500
Received: by mail-oi1-x234.google.com with SMTP id m204so15582379oib.6
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPgT65Py6HacN6BGNUnYknCGAA+AMkPn1v8W/SDINWU=;
 b=HyNK+whjGKnZE/zg/V0/vjv8sp+hX7dRguNM1rzL9WzqjdFrpnzEv2ZYBfEYJu++6W
 AWxyu2bEAqjgxXUyvL/ImcccaBMWXpxFm9ZOSdW0ziGFvotD0fxJ+kk/5A8FI0RDoka3
 aHb81EP0afqt9VqZDliqIgw1jzQl0ZRFOMYL681FH+JCu6rje1IHk7BtPLljwmGyRBoT
 7024Gsaxevh9ycwtNNIczBKNvHIyvRY1zTKnCmPyUux8+7tR7YoOgodTYk7UmFVXZC59
 1x3IDpqPzRbGzjAlYhieIFMlUUkto89Ifgcdp7jxSV6SoVmN+4AiZHUfGogqyjI3uTBq
 WvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPgT65Py6HacN6BGNUnYknCGAA+AMkPn1v8W/SDINWU=;
 b=nmeiox+Ox03z8jEOQ2uqlq+5hDTaD/zB69e02j3FFfrbr/RK7ut3Y5EOjX6xlBtwGr
 scfs4JvaXGIF+uapzeQgKMYR0A3jOfyTvsnpENpvWC86ku+2mrVzUOYVlBdQHf7buX5m
 B+xj9LTFnoxABUFCAwOeY49V0Vof9/H7DoBMGdOUujZCSP9Hev6qJHCx/1+ohGnIKkV7
 GAxIZdyz0MIvBUaUNL0iq4Qdx14hfvOKN65JaO3fRa39lQY4SyP+BIrW8muQS2XzdXdu
 RIHqPUzwK2QmYy5TIbKX8VPQvftPfj2MMCXxRpjQtcvlMTux71ehwt78kL/04CiOqlMO
 Yx5w==
X-Gm-Message-State: ANoB5pn/nDPZQhA7xxGEXg+OrNZ/ysroxZNWWfdkrPj7J4Qekfckp1qN
 xde+aCsPoR9QH3dC/avbPcjqXiup702C83DlO7A=
X-Google-Smtp-Source: AA0mqf64hYrQ8jyNqEEXpzWYq5FBCUUBdtwxascsxQIEKaK1E+G6AEMOe8Ex36H6q/tSvzg7WhziEQ==
X-Received: by 2002:a05:6808:1649:b0:34b:7532:2d0e with SMTP id
 az9-20020a056808164900b0034b75322d0emr41244968oib.109.1670300263725; 
 Mon, 05 Dec 2022 20:17:43 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 20/22] tcg/arm: Implement direct branch for goto_tb
Date: Mon,  5 Dec 2022 22:17:13 -0600
Message-Id: <20221206041715.314209-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 52 ++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a44d1d969f..fad2be700e 100644
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
 
@@ -1935,32 +1937,52 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg)
 
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
+        insn = (COND_AL << 28) | INSN_B | ((offset >> 2) & 0x00ffffff);
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


