Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9348643C22
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POg-0003NP-WB; Mon, 05 Dec 2022 23:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POc-0003Li-GK
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:30 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POZ-0006wa-ID
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:30 -0500
Received: by mail-oi1-x234.google.com with SMTP id c129so15647366oia.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=416YCk0L/hcpCucqDSMqyt5y/QtKG77oPXJUoMUiAb8=;
 b=aLPtwFUuyTDsuR2L7VtWG/Uak8/iVCXU/nw+BNOIGTG2yORaEPlv2j47Y+Hm4tBkAX
 DBorUIeT0Dsjr1MPrLzfHrUR7bMqNCPNf4UdX9uIlF+kXum8utFgswq8G1p7nIBIXV7s
 yk+XIyrTnGh+zAf1lYDmsGOYPuXz/oGd5Z6Rmt+dOUzvA6KokPjp1Xo0f+Pxqa+7ZKlG
 0nD9o6jK0PNnh8az+mBg4L+hGgRiQCBcTqMwNgfSOBNTuh7hcyQ0jidzGtujS02P+4R7
 8D3LtHlWSOQZIfvNpsDvjEtq1xX05e/IRZIyEa3+X5mzpADDj5rifq8p/c+CeUVdL05n
 T4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=416YCk0L/hcpCucqDSMqyt5y/QtKG77oPXJUoMUiAb8=;
 b=bjC+KwtREfW/cXWXNZiS+bNJVoQL+hZOdzo5/q5yrsauji5bkYy/LnRD5ouOOcn6wM
 HsW6AbAlCxnAwWPD9dY9SHySai9AIPZfxti3NFCu4bFRjgpqQI/USr/DjVP5apyxyJLd
 ad/ooLpfkKT+OnA1bnqDlJpVMa9O01odJfeGx3838BTcPkbemy2nqIqNg3YLn6LMi2Aq
 TKCKHIaOg++T76aM+lzxsrFp8xA40Sr6fzCPdtbo4lr2CPQ25jLhMlRdfQwEhvSuqbw/
 4YKvrGOqYMTAXWQUjImiQDPnkRgx/B0Qd8zow8gkZdBaP0GXcnqCnsbOcEtgJN53TCNe
 JvOw==
X-Gm-Message-State: ANoB5pnYiCAaZ5+qaKZgO9tDHQZgZ8tU8IULRHXUuz5iahhKli+HuzQ/
 LDewIMIeQYt5W11j/Hmzu9OKdvFsUv7NK6eEfto=
X-Google-Smtp-Source: AA0mqf76wzNywhCHzYFszPsawI5b2KJaE6/KCuYFsTGKfih0pbUvGtL3Ni5bmb3jDnSYMKrEm4IwDA==
X-Received: by 2002:aca:c28b:0:b0:35a:581e:f643 with SMTP id
 s133-20020acac28b000000b0035a581ef643mr45002531oif.151.1670300246207; 
 Mon, 05 Dec 2022 20:17:26 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 06/22] tcg: Introduce set_jmp_insn_offset
Date: Mon,  5 Dec 2022 22:16:59 -0600
Message-Id: <20221206041715.314209-7-richard.henderson@linaro.org>
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

Similar to the existing set_jmp_reset_offset.  Move any assert for
TCG_TARGET_HAS_direct_jump into the new function (which now cannot
be build-time).  Will be unused if TCG_TARGET_HAS_direct_jump is
constant 0, but we can't test for constant in the preprocessor,
so just mark it G_GNUC_UNUSED.

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
index b53961baf7..df5a6cedf0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -320,6 +320,16 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
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
index 8e97da3a39..3aa89d6060 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1917,7 +1917,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
          * write can be used to patch the target address.
@@ -1925,7 +1924,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if ((uintptr_t)s->code_ptr & 7) {
             tcg_out32(s, NOP);
         }
-        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        set_jmp_insn_offset(s, a0);
         /*
          * actual branch destination will be patched by
          * tb_target_set_jmp_target later
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f3a40fc428..3d4cf71552 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2382,7 +2382,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         {
             /*
              * Jump displacement must be aligned for atomic patching;
@@ -2393,7 +2392,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, a0);
             tcg_out32(s, 0);
         }
         set_jmp_reset_offset(s, a0);
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 78398684cd..dd4934d6d5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1089,7 +1089,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
         /*
          * Ensure that patch area is 8-byte aligned so that an
          * atomic write can be used to patch the target address.
@@ -1097,7 +1096,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if ((uintptr_t)s->code_ptr & 7) {
             tcg_out_nop(s);
         }
-        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        set_jmp_insn_offset(s, a0);
         /*
          * actual branch destination will be patched by
          * tb_target_set_jmp_target later
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3f9ee4b39a..86684e1c84 100644
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
index 9498694564..ad6433fcf2 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2105,7 +2105,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             }
             tcg_debug_assert(!USE_REG_TB);
             tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            set_jmp_insn_offset(s, a0);
             s->code_ptr += 2;
         } else {
             /* load address stored at s->tb_jmp_target_addr + a0 */
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f035bf7dd2..f0c6332ef1 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1451,20 +1451,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
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


