Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216D35E3A0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:16:49 +0200 (CEST)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLia-0007Lm-AO
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaX-0006MO-0n
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006wL-2L
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so9041306wmj.2
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Zdbww2eZfuLbXUIxK79KlyCvFs2xptk6InEC6qngDcM=;
 b=TJvozw2/nXudNscTWJLSSgg5SAR8NuhCJieaqLNExiN4ClNkWy7AUXjkNw9oEdqJ2h
 nIy+cuJnqPHYoCHSP4DcZaM2WMT50TAKNk0AtZjw9k8V5YhrhDyKtyJNOpMXN8IdR9mT
 0GH6MgHiRD+jsByqgOj5Dqc6tMUfTaBk87AJnEFPQHC+JXq5DdnuiHN7tCs9U+a2pmrr
 zmXIzv9TVsBDGTfjpvFqkcjoJnSBAi1Y7d3tZujzcO4fPH9ltWDNK22VecXu1D2f9a1E
 OM72nqnxT+3lY7s4IgBOJup2Rp1jAeTXiH5erOrjMWDnTuNe/oQLMTXpXudfr1wHffSP
 upHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zdbww2eZfuLbXUIxK79KlyCvFs2xptk6InEC6qngDcM=;
 b=UOn+q7V2rFUab4XOLgV9zYascZ6HpT84SJgKu2bxXs4XSV3yQUjRay0+sIAGV3mDFB
 TyZUcToypt1OzKSciQRADNOeM9BJb5XfBHMlvEXULmIos0nnycBzfyBEFhTXaNBZucxa
 7powzo9H3zFPmNLc/unzueKFNcPLlylO9hpyuZA+a7LCf+Alq4unzMk+PYaQUh3PEOC2
 rwaCdXIvi14fdMlDniZww16crV9o3tga1yHvDy512rNJtgTTh6Cz12phqjA4teEInq3F
 lsE+D/RFecH1rR9G4yNt8lCiXAl2hth6V3+a+OAGU/dsk6+y8pTHvqmT6Opwl3AQ2YPT
 rXHA==
X-Gm-Message-State: AOAM530h5LNYkRMPWfbf6/TK9Fb1oGHHU3iPO95FpPCcz/FGTXc7fWzy
 wF0AiOLpssTQAUuMDEI2SY17jw==
X-Google-Smtp-Source: ABdhPJyI/ll/KSj92/R5LDRIwYyU5ympldrXZCXpf6VuJtvPb71YxI8ft3lrRIfvzv8M9uJUWOvySg==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr747606wmr.110.1618330101738; 
 Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/13] target/arm: Make functions used by translate-neon global
Date: Tue, 13 Apr 2021 17:07:58 +0100
Message-Id: <20210413160759.5917-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Make the remaining functions needed by the translate-neon code
global.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h |  8 ++++++++
 target/arm/translate.c     | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 96e6eafbde4..f165f15cc47 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -37,6 +37,8 @@ void gen_set_pc_im(DisasContext *s, target_ulong val);
 void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
+long neon_element_offset(int reg, int element, MemOp memop);
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
@@ -135,4 +137,10 @@ static inline void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 /* Set NZCV flags from the high 4 bits of var.  */
 #define gen_set_nzcv(var) gen_set_cpsr(var, CPSR_NZCV)
 
+/* Swap low and high halfwords.  */
+static inline void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
+{
+    tcg_gen_rotri_i32(dest, var, 16);
+}
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7f95ab16613..f6d71d03a3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -319,7 +319,7 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 }
 
 /* Byteswap each halfword.  */
-static void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
@@ -340,12 +340,6 @@ static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
     tcg_gen_ext16s_i32(dest, var);
 }
 
-/* Swap low and high halfwords.  */
-static void gen_swap_half(TCGv_i32 dest, TCGv_i32 var)
-{
-    tcg_gen_rotri_i32(dest, var, 16);
-}
-
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
     tmp = (t0 ^ t1) & 0x8000;
     t0 &= ~0x8000;
@@ -1047,7 +1041,7 @@ long neon_full_reg_offset(unsigned reg)
  * Return the offset of a 2**SIZE piece of a NEON register, at index ELE,
  * where 0 is the least significant end of the register.
  */
-static long neon_element_offset(int reg, int element, MemOp memop)
+long neon_element_offset(int reg, int element, MemOp memop)
 {
     int element_size = 1 << (memop & MO_SIZE);
     int ofs = element * element_size;
-- 
2.20.1


