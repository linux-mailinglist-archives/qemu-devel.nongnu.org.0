Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F369670CD7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6m-0003T9-WC; Tue, 17 Jan 2023 18:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6i-0003PR-EZ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:08 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6g-0001JR-Hk
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:08 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 78so23196316pgb.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PM/FhYy3O8Hsh90M2X3wwQgygLzLKCj9NfyUgPWsaE=;
 b=wlI4Bo3j4hR95Dwyqud8/c2xawxUhDSFurlUER6i5+l4bZTtADaXaqGpsnu2HmtZG7
 xL0j0AXkOUVbmdUcVbfmtmrxPoRysjxPyi/nO//YgppmKI7V9nZMqYVDq9VJbkpDZUAU
 vcAxuCQCACBWYMnMIsYOeH+bczRj/c9lKpKGRvVC5brNjBUU02trwe1H0kcZoezHaTIA
 Cs5gEyZ2Fb5cHA5bzQucpWvVx6+dOoDHDhbjXGh0PGzlg+9RwBSBWVKIVobyQl0/16N+
 8oMHfOkn+45cLyjrpcjO+NIO7IZwgsnSaorArIeDSAq2uxnhkbTISwHiDsFG8oKh9ms0
 qn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PM/FhYy3O8Hsh90M2X3wwQgygLzLKCj9NfyUgPWsaE=;
 b=NYWbsu2IyqZbMQS/pMRhXlM76ty1M217ZnGTC70+Oka8nHqZBdSc/xiVYYRPhF1A8y
 9/hvb3xYJLQMwEiwoC3BCkyFKGTfezT61jo4msuuJOZz2wd6QRIJ5sqwQrdID16UOY4V
 BGVcH9Xie6S9ro2leiyL2lvs6Xstaa2YNfIjOBFc2cBPUk80YoX74+edOjznPK86NtsG
 2XFF+lrYbax5h9T9bqECqf+HYc/jzMj5I2HgrGl/W4Eyzl2G1oSeKGUyNtZDgrF56lYT
 VfpG4CbD40etwN13Jr1RQGFYpTeVcrpzRIypTxRNGOCLcORCA6kAhCr5Jzz+B4p6Zlli
 OWIg==
X-Gm-Message-State: AFqh2kocFULS9l0hzw84WmPt74f4Kk9CiTY8vr2AhlsP3dPe7psXUP2f
 bpOGfY0gbEOf87WG1d412mbkcgpIFDLKdtrm
X-Google-Smtp-Source: AMrXdXsGCaXPUEzwuORu9pIDdcZ4oFhY8MjJ0uM4qFqQ/GZUQU0ALBdj6Ggqz4WBQnBTQVuf/uyZxw==
X-Received: by 2002:aa7:9192:0:b0:58d:98a8:8485 with SMTP id
 x18-20020aa79192000000b0058d98a88485mr4678007pfa.14.1673997064864; 
 Tue, 17 Jan 2023 15:11:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 06/22] tcg: Introduce set_jmp_insn_offset
Date: Tue, 17 Jan 2023 13:10:35 -1000
Message-Id: <20230117231051.354444-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Similar to the existing set_jmp_reset_offset.  Move any assert for
TCG_TARGET_HAS_direct_jump into the new function (which now cannot
be build-time).  Will be unused if TCG_TARGET_HAS_direct_jump is
constant 0, but we can't test for constant in the preprocessor,
so just mark it G_GNUC_UNUSED.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 10 ++++++++++
 tcg/aarch64/tcg-target.c.inc     |  3 +--
 tcg/i386/tcg-target.c.inc        |  3 +--
 tcg/loongarch64/tcg-target.c.inc |  3 +--
 tcg/ppc/tcg-target.c.inc         |  7 +++----
 tcg/s390x/tcg-target.c.inc       |  2 +-
 tcg/sparc64/tcg-target.c.inc     |  5 ++---
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 257479337c..4092dac294 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -313,6 +313,16 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
+{
+    /*
+     * We will check for overflow at the end of the opcode loop in
+     * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
+     */
+    tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
+    s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
+}
+
 /* Signal overflow, starting over with fewer guest insns. */
 static G_NORETURN
 void tcg_raise_tb_overflow(TCGContext *s)
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 90af096c11..59e6a08e93 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1918,7 +1918,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
          * write can be used to patch the target address.
@@ -1926,7 +1925,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if ((uintptr_t)s->code_ptr & 7) {
             tcg_out32(s, NOP);
         }
-        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        set_jmp_insn_offset(s, a0);
         /*
          * actual branch destination will be patched by
          * tb_target_set_jmp_target later
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c4ff59e9ee..6fb40fe8ba 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2383,7 +2383,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         {
             /*
              * Jump displacement must be aligned for atomic patching;
@@ -2394,7 +2393,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, a0);
             tcg_out32(s, 0);
         }
         set_jmp_reset_offset(s, a0);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 5dd645fd17..bce7340604 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1090,7 +1090,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that patch area is 8-byte aligned so that an
          * atomic write can be used to patch the target address.
@@ -1098,7 +1097,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if ((uintptr_t)s->code_ptr & 7) {
             tcg_out_nop(s);
         }
-        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        set_jmp_insn_offset(s, a0);
         /*
          * actual branch destination will be patched by
          * tb_target_set_jmp_target later
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b72e266990..dbe8ccd353 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2630,20 +2630,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /* Direct jump. */
         if (TCG_TARGET_REG_BITS == 64) {
             /* Ensure the next insns are 8 or 16-byte aligned. */
             while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
                 tcg_out32(s, NOP);
             }
-            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, args[0]);
             tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
             tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
         } else {
-            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, args[0]);
             tcg_out32(s, B);
-            s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
+            set_jmp_reset_offset(s, args[0]);
             break;
         }
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 48a0c3e3c0..c234347d6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1977,7 +1977,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out16(s, NOP);
         }
         tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        set_jmp_insn_offset(s, a0);
         s->code_ptr += 2;
         set_jmp_reset_offset(s, a0);
         break;
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 26b00d1638..c3109fe51b 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1452,20 +1452,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /* Direct jump. */
         if (USE_REG_TB) {
             /* make sure the patch is 8-byte aligned.  */
             if ((intptr_t)s->code_ptr & 4) {
                 tcg_out_nop(s);
             }
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, a0);
             tcg_out_sethi(s, TCG_REG_T1, 0);
             tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
             tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
             tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
         } else {
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, a0);
             tcg_out32(s, CALL);
             tcg_out_nop(s);
         }
-- 
2.34.1


