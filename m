Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FC643C26
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POq-0003SU-9L; Mon, 05 Dec 2022 23:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POo-0003Rh-9U
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:42 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POl-00072B-Ts
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:42 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 p24-20020a0568301d5800b0066e6dc09be5so8575461oth.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQXI8Tic8Aq/NBUY33irNWjhT2v3z3OgYZUNuPxrg78=;
 b=oD33QhDWZfze4VyiOZyxWx4g+0MWolL8M7AqOGX92HHc2IsAZXEs+v2cO+VLORzHvq
 6vfVUp18Umk474wfIj9F8aV31cYkACB9ttPhkuXWVpoPnqIfTSShDbjEO3lJ39dIFZ3m
 VtNX+Q6SKJ3ljXVXzDjQEyrLM86Ent8o6oqbWYpuA33kbgBDzok7mOEm8fiAUOFmB5e4
 GcSlBbMUQ5QQiuvb0AKb05QlxI3hT8AxQdh0LF3eZ8CFpP4qljsd1hekFQM9vHuDSgi7
 jpRxhdXsvAc2USd9bKRFMRrcFUncb756XMq1DiHD9suvX8dGKK5KUx34Av6KAsBCiOfd
 HofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQXI8Tic8Aq/NBUY33irNWjhT2v3z3OgYZUNuPxrg78=;
 b=NWLyu+S1sb3YM77vXFf4oMwr8I6mqHUgtVbocllEwsJs1yWrdCJw6UNThFmDkVP71v
 /LDYDWkAKTvF14YbWoZOpdUaQaAarvnt1OMuNqTZiuRUFGAsw+xQZKrzxYAufQ5ANxt3
 GseByrYxb45nYD7Z93D4icnWauBDXI0lK9GlbwbP8d/kGYrs10/icYMzgyfQ623Peuw5
 LSeCXzJZXA6F58aZkkC8r5Rbt5uaFiw3pZekxFqLInojrFE/VmwOJhYHD9IuJ7yxCBPa
 pyAesyZXRhlHhauRnufuDjuZBFekJNvRT26v/CQ9c9yAquAiJYNb2c0VNsybQpqLmNr2
 CH9w==
X-Gm-Message-State: ANoB5pnYwAW3BtUP0AyEfqnnmsgmNshyrblQAXeDGSIcknrbHUYHOL8p
 Pa7uyTf2f2GGS9GpxcCf0H8oEx5LO0Eq5Y5Z9VE=
X-Google-Smtp-Source: AA0mqf5DVowDBShAeT+YnfGsEK8lZ8CKMZuc1ler0vRXLF4TQb7z2UGEGLrCbXNNvSqLxwWyHoXEPg==
X-Received: by 2002:a9d:7dca:0:b0:66c:6cf1:7967 with SMTP id
 k10-20020a9d7dca000000b0066c6cf17967mr42520737otn.139.1670300258525; 
 Mon, 05 Dec 2022 20:17:38 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 16/22] tcg/aarch64: Reorg goto_tb implementation
Date: Mon,  5 Dec 2022 22:17:09 -0600
Message-Id: <20221206041715.314209-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 64 +++++++++++++++---------------------
 2 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index c8202e4bc5..9b8835eaa3 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,7 +15,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
-#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 #undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index af30f9db69..fe8e8636aa 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1352,33 +1352,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
     }
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
@@ -1901,23 +1874,38 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
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


