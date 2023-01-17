Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35F670CE0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv71-0003m1-Kf; Tue, 17 Jan 2023 18:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6y-0003do-Bz
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:25 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6w-0001Pm-7r
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:24 -0500
Received: by mail-pf1-x430.google.com with SMTP id g205so7716932pfb.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rD47r4V2mIilii/m4Nm44a7UImogPuYtuW1FIzKi3hY=;
 b=G+3F7vtcYPh8LtN0p2P8499C8s4OThmRwhjmU9IBqECM5cd0BcX/eOemAnaT+yGBER
 LEXdbtw6a776ZvK43MxAGcxaPTpQferz5yaKED3jI0fn+BjRvxQkyT1uqpodwHmIl7sc
 QA9p05N82tIF8fNss1dHVjmTZWt1emG/KFu3wrLsS7du3a4bPw249ccP/51DbIw0fSwB
 z5l/JxBh8QWw7t53HUGJEE09J85hLEDN5hpJXMNtDuU8Hk1+qg26KTYo3cvXkenH3Erx
 kQ+LJ/5fSoOr46wxcv7jg/mNO+rrIm8WjYCXwl3NqKhekM8IDmgRVZWls2em8BHozAMa
 dNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rD47r4V2mIilii/m4Nm44a7UImogPuYtuW1FIzKi3hY=;
 b=q1+XshGxmGg/xsBTHuCtEm6Ojmud3fWr6WRwtxAT+1Om7hY1nzvn4fUUZU0W5zl50r
 g1gnFPohgRhYnHW7dEdORLCAPZjt+Ek38zFZTKAbGI8gqR9IfyCNUyZZH6A06X1sdhof
 Kek8qBQz/fYHpPKyWNCyuNRekz7Jjx8dKxOeenii0/VQtZvgoYWJw913RrCqS/4qQt8G
 t+GZuDHVEbsdV5ktB6pI7W1XJLlotStPAjJbWX7RDmTccZs3uLdqpGVevnpjsXXCF18C
 QKwDuQ/ePKvTf1QhjU+ChPCEPdEvqeFGynHeLL5DL3HIksmJgHCcwluyqWGf3gQleV1Y
 eQ+A==
X-Gm-Message-State: AFqh2kp+AMtiiwDcD5/ZPTPsBNEt/XmrccnIb6dIsFp1HTjNjkmU/MGS
 vC0IXIfkiZBDlT15vy7CvVraLz2CJuin8WdE
X-Google-Smtp-Source: AMrXdXv03LFAHpv/sWH7JXTyO08GOUreclqe6/ywVZMEPASdzbYLvtaxavgpJ7DulGWIbhUt2YPFjA==
X-Received: by 2002:a05:6a00:4c9c:b0:56e:a7a7:35a0 with SMTP id
 eb28-20020a056a004c9c00b0056ea7a735a0mr6011148pfb.25.1673997080882; 
 Tue, 17 Jan 2023 15:11:20 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, hev <r@hev.cc>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 16/22] tcg/aarch64: Reorg goto_tb implementation
Date: Tue, 17 Jan 2023 13:10:45 -1000
Message-Id: <20230117231051.354444-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

The old implementation replaces two insns, swapping between

	b	<dest>
	nop
	br	x30
and
	adrp	x30, <dest>
	addi	x30, x30, lo12:<dest>
	br	x30

There is a race condition in which a thread could be stopped at
the PC of the second insn, and when restarted does not see the
complete address computation and branches to nowhere.

The new implemetation replaces only one insn, swapping between

	b	<dest>
	br	tmp
and
	ldr	tmp, <jmp_addr>
	br	tmp

Reported-by: hev <r@hev.cc>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 66 +++++++++++++++---------------------
 2 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 6067446b03..8d244292aa 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,7 +15,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
-#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 0b65f2cac1..330d26b395 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1353,33 +1353,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
     tcg_out_call_int(s, target);
 }
 
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    uintptr_t addr = tb->jmp_target_addr[n];
-    tcg_insn_unit i1, i2;
-    TCGType rt = TCG_TYPE_I64;
-    TCGReg  rd = TCG_REG_TMP;
-    uint64_t pair;
-
-    ptrdiff_t offset = addr - jmp_rx;
-
-    if (offset == sextract64(offset, 0, 26)) {
-        i1 = I3206_B | ((offset >> 2) & 0x3ffffff);
-        i2 = NOP;
-    } else {
-        offset = (addr >> 12) - (jmp_rx >> 12);
-
-        /* patch ADRP */
-        i1 = I3406_ADRP | (offset & 3) << 29 | (offset & 0x1ffffc) << (5 - 2) | rd;
-        /* patch ADDI */
-        i2 = I3401_ADDI | rt << 31 | (addr & 0xfff) << 10 | rd << 5 | rd;
-    }
-    pair = (uint64_t)i2 << 32 | i1;
-    qatomic_set((uint64_t *)jmp_rw, pair);
-    flush_idcache_range(jmp_rx, jmp_rw, 8);
-}
-
 static inline void tcg_out_goto_label(TCGContext *s, TCGLabel *l)
 {
     if (!l->has_value) {
@@ -1902,23 +1875,40 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
     /*
-     * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
-     * write can be used to patch the target address.
+     * Direct branch, or indirect address load, will be patched
+     * by tb_target_set_jmp_target.  Assert indirect load offset
+     * in range early, regardless of direct branch distance.
      */
-    if ((uintptr_t)s->code_ptr & 7) {
-        tcg_out32(s, NOP);
-    }
+    intptr_t i_off = tcg_pcrel_diff(s, (void *)get_jmp_target_addr(s, which));
+    tcg_debug_assert(i_off == sextract64(i_off, 0, 21));
+
     set_jmp_insn_offset(s, which);
-    /*
-     * actual branch destination will be patched by
-     * tb_target_set_jmp_target later
-     */
-    tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
-    tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, 0);
+    tcg_out32(s, I3206_B);
     tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t d_addr = tb->jmp_target_addr[n];
+    ptrdiff_t d_offset = d_addr - jmp_rx;
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or indirect branch load. */
+    if (d_offset == sextract64(d_offset, 0, 28)) {
+        insn = deposit32(I3206_B, 0, 26, d_offset >> 2);
+    } else {
+        uintptr_t i_addr = (uintptr_t)&tb->jmp_target_addr[n];
+        ptrdiff_t i_offset = i_addr - jmp_rx;
+
+        /* Note that we asserted this in range in tcg_out_goto_tb. */
+        insn = deposit32(I3305_LDR | TCG_REG_TMP, 0, 5, i_offset >> 2);
+    }
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


