Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7D661C16
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:45:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBw-0000sY-NX; Sun, 08 Jan 2023 20:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBu-0000rW-HQ
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBs-0001aO-Tu
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d15so7959719pls.6
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8WPefftrPh8ywQzSPRJOZ0Nm9rSwT8iGc5lkhLzE1qM=;
 b=GcfA34gmR5tftba4rxwt7FuyJTd2iN7cGxITh1wTGwH8Wg4Z1tvgByfD4fnYgCQMvi
 z7rAbthlniSGd/XrKUJnVgYRh+dZZymsqmbselU3FrQ6xC4zMIJ1Ytsyx4n8Chg6TGOV
 w71KNVOjtQgb3OmJ0U24l8J0BRNF11zxhxTckecKhC5IrPNt6ASUPji9s7vidQgIukXc
 9aYs76MdulcG7uX/62nIWW9n734IwgVYLLH7mFDyBxVJq/zGRlqcmSrO/HLsUYaKK115
 Uebl8MUgjlmIlexDBN8FO9nT1ed+NBhUBCr5p4qE7kxn/hEhj/1utttF+9MdE8Wt3wmY
 CVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WPefftrPh8ywQzSPRJOZ0Nm9rSwT8iGc5lkhLzE1qM=;
 b=CA6y/SibrijpNG82ycHMJdRPhmNrSd5LK6JM3L+UEbw69Aa11dHRowX5dnl2VK/FES
 wY8TsX2JIoGxQLegg8zTFWKotdSBcL+02t5RqW7yeA3M+W0X4AYaKfsyQPKtKbMH4Gex
 n9ykAceLNjb72VyEGGIbmEmFQg4VZnvTFBSzDjtckRsIdwgPi0KsboYe/+vFsiBjJVqY
 kJfudpFig0dJJE3H4aJHVgDs65txAoQIjuc3XKNLof0shJK2nn8cyEXO0a6GCegxU85m
 mLdWjWZuVAGUfO739yMCnglv3p4hriXY0BHwY5S3YqRTt8OUf7Z+F5dbp4F8RKTa3ozL
 O/IA==
X-Gm-Message-State: AFqh2kpjaW5W8+MEDKfndEpjtiVz1RRNd2yuyzpkCcoO1eYROkhMnjNP
 cH48NYPh8VV8hdsIkPjUDE2ciacJYpg1dYMY
X-Google-Smtp-Source: AMrXdXsA+L9kSDbPdlwcgxKvNAVfJMecUmI2Yo2u72ckmhwSKnMpKDz2WtKCwuGHCKsDSAYVxob+JQ==
X-Received: by 2002:a17:902:848d:b0:189:5f5c:da1d with SMTP id
 c13-20020a170902848d00b001895f5cda1dmr61162230plo.18.1673228587626; 
 Sun, 08 Jan 2023 17:43:07 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/22] tcg/arm: Implement direct branch for goto_tb
Date: Sun,  8 Jan 2023 17:42:46 -0800
Message-Id: <20230109014248.2894281-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
index e1e1c2620d..794ed8c3a2 100644
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


