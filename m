Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6180378C54
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:36:41 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg59M-0000N8-Vy
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z6-0005zt-IC
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z3-0003EF-Pd
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so16432074wry.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YHOfv/PBxmnVIlFlC3MHXDqVhwWqJxzCamVnqIwXV4Y=;
 b=GRB0ym43etGNDWQHugaw3JdHAm2dC532LMyiK+sdqwbBDLMcOXQgMeL4Zma46zPS3M
 S27yyrD0VfxBX8BRoEi6ASOtd6w9t7DTqkPN3gswSZBiIf1oPvZnlX2vGMqsltaiXuDC
 9tYErKkHOw2xc031c/cL8tQSd+jQl5vpA8sOOmxLT02rAYb9Z2Rpk8XUCUO1bLMGnWHk
 UUVkJZD9Elfg2WrdIzw9RP/vtkygMmpEBQyArTipMqsf2+LptiQdeFLRlp+Po2oEHDDk
 mmq6W+iANEsP++RlODUPGzn+OpkrIzeow9VLgk6dbH4EJH1Z8BvG7XXVDWtjEtNejrLV
 5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHOfv/PBxmnVIlFlC3MHXDqVhwWqJxzCamVnqIwXV4Y=;
 b=oiWuVWNBjjvOO9FI2hgqoFxz8qYuwGe9nJP0JbE7ttMkgWCCwNgFpSJgQ86UzKdrly
 bSv53pFlhR8OWw0X2O+NA5MFpsNtuyIjskLhZUKDpsvSUwsPrW5LzknFtCqo2qGKQDm4
 Wbd953SpRb+Qb5HWmSxNsCwtsw2UY6mLNoZR7kXAlxzAC+61Wpr6KJhq73GYPcN8RS/Q
 7+cAcDGYjJaQSQtVCIFjEM1uGtxZkLzLbs1fPp7iYS6tRE7934fgNNDZ4yZpmzlMelOk
 w7uB8yUV6Z2NzVB/f77L/ndyGP7Ww2HY+3675MCtESYHTaifBxo5KnRIBRhGSYQhSx4J
 raNw==
X-Gm-Message-State: AOAM533DT+oy+5Q4SILGqSGbgsWOUqF/ThxdYj74qWEnQ54q67+SK+rd
 pGiLtlGDaEyTaTSIOj/G/TR5N52/HTmciQ==
X-Google-Smtp-Source: ABdhPJzWf21vQysycJcAh+6qTHHyH7nvXUYq6WFBoQ/Kk7BRf9GXxGdm8EyQ+QfKFJNv1QgY6IZWFw==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr29718179wrm.314.1620649560521; 
 Mon, 10 May 2021 05:26:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] target/arm: Make functions used by translate-neon global
Date: Mon, 10 May 2021 13:25:37 +0100
Message-Id: <20210510122548.28638-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-13-peter.maydell@linaro.org
---
 target/arm/translate-a32.h |  8 ++++++++
 target/arm/translate.c     | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index e767366f694..3ddb76b76b5 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -39,6 +39,8 @@ void gen_set_pc_im(DisasContext *s, target_ulong val);
 void gen_lookup_tb(DisasContext *s);
 long vfp_reg_offset(bool dp, unsigned reg);
 long neon_full_reg_offset(unsigned reg);
+long neon_element_offset(int reg, int element, MemOp memop);
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
@@ -130,4 +132,10 @@ DO_GEN_ST(32, MO_UL)
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
index 7ff0425c752..18de16ebd0a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -325,7 +325,7 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 }
 
 /* Byteswap each halfword.  */
-static void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
+void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
     TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
@@ -346,12 +346,6 @@ static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
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
@@ -1104,7 +1098,7 @@ long neon_full_reg_offset(unsigned reg)
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


