Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB2378C42
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:28:06 +0200 (CEST)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg513-0008UP-LH
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yz-0005b5-SO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yw-00039f-PP
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id x5so16403746wrv.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U2MFf12jiBRiHqGWQfVsDrVn6+Y2J5P6G4QHCaHcmXY=;
 b=dBgdjzNetBSLLrfhgtslqpwt9Z7eNPpgeVaOQWVxQ2Nbklm0Bcd23SSxEAuwW12DPX
 HNGiOLrbddxhPpUoMtmWamUgRfgthDgqaMXuEh9A8zvyB0HtmRiLIRFVD2sOeIljdj3D
 uXVTlY+N20j1J8RMcAETp8VjXTpnr4n+l2IZ1OaHkL39POoV18eQe+viYrD5BO69vmSK
 RcGB503fgJUa/3fUU2Ee7v4FxSAoTL0VYqroGKNJp9WG9NaKYeGfpwNZ7K9Q/7r9Dx48
 /lqOfCeQHOTeUqu3AqbKTKsaqv1tm5lgTVbC2qrNUYgG2jEuL2MX4omPxJXHbqsN+FVA
 UECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2MFf12jiBRiHqGWQfVsDrVn6+Y2J5P6G4QHCaHcmXY=;
 b=OzJ+WKP4QXdNu1mZgpIyJMFPS7bVJyPZmFGUTvHEfAFX9Rxk6zQA+Sj0fft9XeK4vg
 ZaHa63SGGR54JAOhEkYkjsNP7gmyS99Ibj91LgFDUdskHhPZgBVC/HTxlGZFeD5E0JwL
 fLnNMcFtKsK6zmK7YvQtbmXMHe9E+P4Fb1OdYuF/sZtEwvtPaMUlrui4qI3HOY/OX3vu
 CctpZhwm1Qb4PO6fKcnsbI5dESIclCEl59Unjtxjcp68fsdqt2UPutAE06H84wcMcgoP
 FjU+BaWefEFZK9uui2CzbimCSWKE8d7vdHais0H34y1N8aixrByS+el9sj27YP1DmJps
 ICaQ==
X-Gm-Message-State: AOAM5326PkIvo0aoojrykWIDTkY28/f3+puXznGZh6HbQQ1lscm2qw0u
 33sOn+TaE3S/njtJkivanecSVYH2tqnkow==
X-Google-Smtp-Source: ABdhPJwrJvBCJD5uUxj19pkNtk1BGMN9CnJ3Ta82ZkQGoLfy9kkq75YJPF4gnPLe8yx7sfCKgq4mVg==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr29970910wrm.392.1620649553443; 
 Mon, 10 May 2021 05:25:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/26] target/arm: Share unallocated_encoding() and
 gen_exception_insn()
Date: Mon, 10 May 2021 13:25:27 +0100
Message-Id: <20210510122548.28638-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unallocated_encoding() function is the same in both
translate-a64.c and translate.c; make the translate.c function global
and drop the translate-a64.c version.  To do this we need to also
share gen_exception_insn(), which currently exists in two slightly
different versions for A32 and A64: merge those into a single
function that can work for both.

This will be useful for splitting up translate.c, which will require
unallocated_encoding() to no longer be file-local.  It's also
hopefully less confusing to have only one version of the function
rather than two.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-3-peter.maydell@linaro.org
---
 target/arm/translate-a64.h |  2 --
 target/arm/translate.h     |  3 +++
 target/arm/translate-a64.c | 15 ---------------
 target/arm/translate.c     | 14 +++++++++-----
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 868d3550486..89437276e70 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,8 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-void unallocated_encoding(DisasContext *s);
-
 #define unsupported_encoding(s, insn)                                    \
     do {                                                                 \
         qemu_log_mask(LOG_UNIMP,                                         \
diff --git a/target/arm/translate.h b/target/arm/translate.h
index b5b21619597..8130a3be29d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -229,6 +229,9 @@ void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
+void unallocated_encoding(DisasContext *s);
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 95897e63af0..0c80d0b5055 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -359,14 +359,6 @@ static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                               uint32_t syndrome, uint32_t target_el)
-{
-    gen_a64_set_pc_im(pc);
-    gen_exception(excp, syndrome, target_el);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syndrome)
 {
     TCGv_i32 tcg_syn;
@@ -437,13 +429,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
     }
 }
 
-void unallocated_encoding(DisasContext *s)
-{
-    /* Unallocated and reserved encodings are uncategorized */
-    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-                       default_exception_el(s));
-}
-
 static void init_tmp_a64_array(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bb9e228d1ae..8b71b1c41b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1069,11 +1069,15 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception_insn(DisasContext *s, uint32_t pc, int excp,
-                               int syn, uint32_t target_el)
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el)
 {
-    gen_set_condexec(s);
-    gen_set_pc_im(s, pc);
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
     gen_exception(excp, syn, target_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1090,7 +1094,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void unallocated_encoding(DisasContext *s)
+void unallocated_encoding(DisasContext *s)
 {
     /* Unallocated and reserved encodings are uncategorized */
     gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
-- 
2.20.1


