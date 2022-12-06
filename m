Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D3643C7A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlU-0003DX-KV; Mon, 05 Dec 2022 23:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlS-0003D2-Kh
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:06 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlQ-000364-TO
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:06 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1443a16b71cso12612751fac.13
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kxOLxuqUZ3jf6wR99AyYKJ2BxYFYEWPkzbJiWdwW3dE=;
 b=Pjr2XtJ2UZ3RE8Enn9+GUBpINPDLpbQwWvgcF38RmaMxUtoG5xB2St6BYIY+2nDjZ8
 GVYFkSo4R5a+lPszRz5hTWdiYK9uYCG50C7dskm4y4kXCvBpXBWcW4Zd04xxDCsaD0NT
 CjOCrIWitDDUR1vx1DJEK27GfMdjT7GuML4ZtQVw1+BKUq0xdohGd1OxGcuzUQVS12ub
 K54b4E4dgs5w5sBmFKv2wNnckhqIt+psJleVfjGOWgjq7lXgeqtii52MN7/oiDfQAosh
 EZ5lfTl/7OENa/YyfDfLmheDmVndc7YRcwBMTyWoVtT/O7IgNj/V/Rmhx1GWwS/VoTcC
 ZYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kxOLxuqUZ3jf6wR99AyYKJ2BxYFYEWPkzbJiWdwW3dE=;
 b=MtHuAOGlQQ7gEqTVD2Z0sUoHngQJe/khlEWqIKpS77eKIeELvY6/sNHowmDuJQzGS9
 SsTuJFrBzCXAExpfm6YrkEBdVUWH1EFE1GjCpGnNnMp1ZD8nGal8Qblo5mlhfSBzsJmm
 a/Ihx3gBVTpulXhru2FxZks82HwBqw8DLgAivBjuTE5N0HObN8hGM+5H4iZiOVcedetG
 AW/4kFdNQru4nOOpuuTRHmNWRqLcBj/h29D8zcYLzNHhrbaFiRCZbF1NW21K01etw32A
 lous0WGZKHrtV4f5wNBR5p+QahaLGlL8JlixaIAmlMzAU5rqEyUJbakg8ZH69/Yd1o1A
 nomw==
X-Gm-Message-State: ANoB5pl2AKhispIzxWdE1K6SJ065fxOBX9JNTSquYlTh9UR4QP7lW7Hd
 pcGoqiiYT0lzBaIA+9DIOWT6NQirE2UEN/9nRRQ=
X-Google-Smtp-Source: AA0mqf4+x5QPa/r3nPvMU4B49AE4jc3I4dO53xd+HStaaxWbYKx0vYzFK1hm6em/PUZMgH4KuokbGQ==
X-Received: by 2002:a05:6870:7388:b0:144:7060:76b5 with SMTP id
 z8-20020a056870738800b00144706076b5mr6569322oam.123.1670301663397; 
 Mon, 05 Dec 2022 20:41:03 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.41.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:41:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] tcg/loongarch64: Reorg goto_tb implementation
Date: Mon,  5 Dec 2022 22:40:51 -0600
Message-Id: <20221206044051.322543-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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

        b       <dest>
        nop
and
        pcaddu18i tmp, <dest>
        jirl      zero, tmp, <dest> & 0xffff

There is a race condition in which a thread could be stopped at
the jirl, i.e. with the top of the address loaded, and when
restarted we have re-linked to a different TB, so that the top
half no longer matches the bottom half.

Note that while we never directly re-link to a different TB, we
can link, unlink, and link again all while the stopped thread
remains stopped.

The new implementation replaces only one insn, swapping between

        b       <dest>
and
        nop

falling through to a general-case indirect branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.h     |  7 +---
 tcg/loongarch64/tcg-target.c.inc | 67 ++++++++++++--------------------
 2 files changed, 26 insertions(+), 48 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 624fbe87ff..81548fbb09 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -42,11 +42,8 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_NB_REGS 32
-/*
- * PCADDU18I + JIRL sequence can give 20 + 16 + 2 = 38 bits
- * signed offset, which is +/- 128 GiB.
- */
-#define MAX_CODE_GEN_BUFFER_SIZE  (128 * GiB)
+
+#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 
 typedef enum {
     TCG_REG_ZERO,
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 47465b8c20..f8964699eb 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1150,37 +1150,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
 #endif
 }
 
-/* LoongArch uses `andi zero, zero, 0` as NOP.  */
-#define NOP OPC_ANDI
-static void tcg_out_nop(TCGContext *s)
-{
-    tcg_out32(s, NOP);
-}
-
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    tcg_insn_unit i1, i2;
-    ptrdiff_t upper, lower;
-    uintptr_t addr = tb->jmp_target_addr[n];
-    ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
-
-    if (offset == sextreg(offset, 0, 26)) {
-        i1 = encode_sd10k16_insn(OPC_B, offset);
-        i2 = NOP;
-    } else {
-        tcg_debug_assert(offset == sextreg(offset, 0, 36));
-        lower = (int16_t)offset;
-        upper = (offset - lower) >> 16;
-
-        i1 = encode_dsj20_insn(OPC_PCADDU18I, TCG_REG_TMP0, upper);
-        i2 = encode_djsk16_insn(OPC_JIRL, TCG_REG_ZERO, TCG_REG_TMP0, lower);
-    }
-    uint64_t pair = ((uint64_t)i2 << 32) | i1;
-    qatomic_set((uint64_t *)jmp_rw, pair);
-    flush_idcache_range(jmp_rx, jmp_rw, 8);
-}
-
 /*
  * Entry-points
  */
@@ -1200,23 +1169,35 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    /*
-     * Ensure that patch area is 8-byte aligned so that an
-     * atomic write can be used to patch the target address.
-     */
-    if ((uintptr_t)s->code_ptr & 7) {
-        tcg_out_nop(s);
-    }
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
     set_jmp_insn_offset(s, which);
-    /*
-     * actual branch destination will be patched by
-     * tb_target_set_jmp_target later
-     */
-    tcg_out_opc_pcaddu18i(s, TCG_REG_TMP0, 0);
+    tcg_out_opc_b(s, 0);
+
+    /* When branch is out of range, fall through to indirect. */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+               get_jmp_target_addr(s, which));
     tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
     set_jmp_reset_offset(s, which);
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t addr = tb->jmp_target_addr[n];
+    ptrdiff_t offset = (ptrdiff_t)(addr - jmp_rx) >> 2;
+    tcg_insn_unit insn;
+
+    /* Either directly branch, or fall through to indirect branch. */
+    if (offset == sextreg(offset, 0, 26)) {
+        insn = encode_sd10k16_insn(OPC_B, offset);
+    } else {
+        /* LoongArch uses `andi zero, zero, 0` as NOP.  */
+        insn = OPC_ANDI;
+    }
+    qatomic_set((tcg_insn_unit *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
-- 
2.34.1


