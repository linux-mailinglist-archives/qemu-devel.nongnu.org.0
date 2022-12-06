Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D82643C2C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POh-0003Nj-ED; Mon, 05 Dec 2022 23:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POc-0003Lj-OF
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:31 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POa-0006vs-19
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:30 -0500
Received: by mail-oi1-x229.google.com with SMTP id e205so15552858oif.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uzpy7hdVQnCFhgoilIBmji9svrZHcvZGnbGwuPjB4fQ=;
 b=dUZih/nV71gDz+EWXNNJZjssonPiG52ttjilS9hwgYGeuiToPMnQJxV0AFCHpCf3yq
 Xy4jN3MyxS/Q0zhwHjwJGzbtIN2DQKXBaJv59ucLBgfeoS51OVJb/Gmookf8GMeWa5y0
 EPKeTf1INO5qsrWVGzPvi41BtCPLQBZJb9p3AocnmOoIAF3v1xgsqzmTL8abHpYU4FWv
 iHids5Jkf1GpgAk7DYAumODniU54HBGOpWq4YNzfp4xFrNkBsWuwaJ3sag62sjCH4usZ
 XnBvm4s7rA3kbLnvaJvsKaCyOUICKn4nVgd+Smx6ZO/utF7vFh/+1Kj28bmufK4VuPTU
 MySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uzpy7hdVQnCFhgoilIBmji9svrZHcvZGnbGwuPjB4fQ=;
 b=35WVqO1lJNKFzYj5ryp+/daURm8Y6b4s1CF5W35IA3VvJ4vicza6TQPag1UXJmNYFe
 B2uyNzKjh6DAXRx13sPIDvNLmpLxCCXQFaNpFcINyZg1t4I1HK4iO3JTuTpitP0mvR8K
 5kSD1hxDJZENX9Ha5YNJI0IJL37Iaq8D0FCSIrqtetYMTryG1SsO92PhH6cRA5fdcVJY
 gSR4fyEqnUccV8ThjOmr3tYPiiXkPJuAUeBn7K4VF7OtTpLwkSnzsiBWqI+KGDtHvris
 +3RLrFdGwW/67AxHtNtHfpJoyG6iS4XZq4DGIWU0X2RHSmjYnv6MU85HZ3uC+QK9yBvR
 d6Vg==
X-Gm-Message-State: ANoB5pmH5KFnWNSNdB3JaWSpmyNlJicvd0ohkE4FnMvIosN8h7l1l2Tn
 NLVB4EZUf+HY5vFJqKYeBUtuQLuQ8Ud+w/FQ9q8=
X-Google-Smtp-Source: AA0mqf74c2407MSKN0a8yMwiCumEeMdaAE2o3AdPIidEY3HXFrvZvLNa9uQqWeygEB/rT4lnkZWwgQ==
X-Received: by 2002:a05:6808:617:b0:359:ef86:2f4f with SMTP id
 y23-20020a056808061700b00359ef862f4fmr41419016oih.14.1670300247342; 
 Mon, 05 Dec 2022 20:17:27 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 07/22] tcg: Introduce get_jmp_target_addr
Date: Mon,  5 Dec 2022 22:17:00 -0600
Message-Id: <20221206041715.314209-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

Similar to the existing set_jmp_reset_offset.  Include the
rw->rx address space coversion done by arm and s390x, and
forgotten by mips and riscv.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                  | 9 +++++++++
 tcg/arm/tcg-target.c.inc   | 2 +-
 tcg/mips/tcg-target.c.inc  | 2 +-
 tcg/riscv/tcg-target.c.inc | 2 +-
 tcg/s390x/tcg-target.c.inc | 2 +-
 tcg/tci/tcg-target.c.inc   | 2 +-
 6 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index df5a6cedf0..8bde8eb0d4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -330,6 +330,15 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGContext *s, int which)
     s->tb_jmp_insn_offset[which] = tcg_current_code_size(s);
 }
 
+static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
+{
+    /*
+     * Return the read-execute version of the pointer, for the benefit
+     * of any pc-relative addressing mode.
+     */
+    return (uintptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + which);
+}
+
 /* Signal overflow, starting over with fewer guest insns. */
 static G_NORETURN
 void tcg_raise_tb_overflow(TCGContext *s)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 31f8c5b7a7..3a545f3707 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1948,7 +1948,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             TCGReg base = TCG_REG_PC;
 
             qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
-            ptr = (intptr_t)tcg_splitwx_to_rx(s->tb_jmp_target_addr + args[0]);
+            ptr = get_jmp_target_addr(s, args[0]);
             dif = tcg_pcrel_diff(s, (void *)ptr) - 8;
             dil = sextract32(dif, 0, 12);
             if (dif != dil) {
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5fc96e4406..6b9c070f6b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1988,7 +1988,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* indirect jump method */
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+                   get_jmp_target_addr(s, a0));
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
         tcg_out_nop(s);
         set_jmp_reset_offset(s, a0);
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1e8406b8c1..091c44d071 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1289,7 +1289,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
-                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+                   get_jmp_target_addr(s, a0));
         tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
         set_jmp_reset_offset(s, a0);
         break;
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ad6433fcf2..dba02db6ee 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2110,7 +2110,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else {
             /* load address stored at s->tb_jmp_target_addr + a0 */
             tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
-                           tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
+                           (const void *)get_jmp_target_addr(s, a0));
             /* and go there */
             tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
         }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d1cc41261a..baf3480c67 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -608,7 +608,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:
         qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
         /* indirect jump method. */
-        tcg_out_op_p(s, opc, s->tb_jmp_target_addr + args[0]);
+        tcg_out_op_p(s, opc, (void *)get_jmp_target_addr(s, args[0]));
         set_jmp_reset_offset(s, args[0]);
         break;
 
-- 
2.34.1


