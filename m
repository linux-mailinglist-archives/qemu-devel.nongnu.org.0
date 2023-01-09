Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F33661C1E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:50:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBs-0000pj-Pa; Sun, 08 Jan 2023 20:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBq-0000p2-Lw
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:06 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBo-0001Xz-VF
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:43:06 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so11221629pjk.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UN6kyNTXi7JMI1hLJ0Bnvri+VQ42kzdG+Um81HCiobc=;
 b=tvnkN6QW1WRGQDGj2nyWlLOcvymMKHlyVVGpP4eYYz4c1uKUBPsWvJ7IRWn1cKd680
 u2CwnB+QcN6bjtXqm54n2kYWXA3hliFGF+Hl/Cw3Lgsw23+2OhDD7MRTSnq07LpaMKK0
 vNCT0gSuDBUf13b0nZVgXVGEuX0veupZpv7Rml84W1bzdKIvm/gee2lbYqkRawh0Ockv
 atOXDhjqgpUqgQ1yGOG87hfHrsuj5QVTFcYcyMT59Gg/T6EUxSa1uXDjj4q3IRZMKh0A
 DiTfGnQZTcg5aJihlJJd2557KhNvIl6RUbXY9qlzX8e2eOwX4e3v6+jgOcfkUxO8ShMv
 qsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UN6kyNTXi7JMI1hLJ0Bnvri+VQ42kzdG+Um81HCiobc=;
 b=O+YYeZTmHn97cHfVROOHV1o0pWMXvrlfyeG1ccGoyiPkOzCnibaKgV5WBWBeRVE/l1
 TvDGKQ3PjM2zBSBS/QbFncLY/DA80sFgBsRutDnqDRX8+qW4KMi1MIFf8cxviIc3FkUt
 8xJOdPZc79Jq6RvMjoQy1gbP2AcKg2oBccfRMR36HjW2JA1abOcrVa1RUH9twN7zIvYs
 tiafNGmRWp2WTCLM5+J/Y06rgbsR+fLjIgq7eGcCu3Syi+F0qBeHyStdWOTbfQccmLu1
 sqMr7Sxpi08HCmXRJJfgmgyim8k+jzV5Q0aG6w4jmwt/4Fh3jeXTio/3pr2vkw2/+m4z
 a1Vg==
X-Gm-Message-State: AFqh2kpZjVv63Vv2NPuTsDnJhfJpU8mHhKRiALknqv3ovfaTGUYS9dvE
 1PwJ/UxuDmLQJ41/y9TFwI0OxS+Up34HdISH
X-Google-Smtp-Source: AMrXdXtzSwrG1q4XbSLA7gotzisnaBOlD5IyKgML5YvhwLYvatD9xVnPsz6FECfyJsJIXssWDv9MZw==
X-Received: by 2002:a17:902:8309:b0:189:469c:dc0 with SMTP id
 bd9-20020a170902830900b00189469c0dc0mr31770448plb.7.1673228584164; 
 Sun, 08 Jan 2023 17:43:04 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:43:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: hev <r@hev.cc>
Subject: [PATCH v2 16/22] tcg/aarch64: Reorg goto_tb implementation
Date: Sun,  8 Jan 2023 17:42:42 -0800
Message-Id: <20230109014248.2894281-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +-
 tcg/aarch64/tcg-target.c.inc | 64 +++++++++++++++---------------------
 2 files changed, 28 insertions(+), 39 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 6067446b03..0ba2298ea6 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,7 +15,8 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
-#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
+#undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 0b65f2cac1..1d0ebf01a5 100644
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
@@ -1902,23 +1875,38 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
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
+    uintptr_t i_addr = (uintptr_t)&tb->jmp_target_addr[n];
+    ptrdiff_t d_offset = d_addr - jmp_rx;
+    ptrdiff_t i_offset = i_addr - jmp_rx;
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or indirect branch load. */
+    if (d_offset == sextract64(d_offset, 0, 26)) {
+        insn = I3206_B | ((d_offset >> 2) & 0x3ffffff);
+    } else {
+        insn = I3305_LDR | TCG_REG_TMP | (((i_offset >> 2) & 0x7ffff) << 5);
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


