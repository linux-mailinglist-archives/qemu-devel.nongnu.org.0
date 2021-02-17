Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91F931E048
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:28:57 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTRQ-00061H-VF
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKM-0006oN-K0
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:38 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTKK-00072Y-Ue
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id z9so2388737pjl.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sl3AXKlBgqeB3AKFBMSA/Bsf7ajPVkdcdF0tA8fk6Xg=;
 b=jmjEBbcTeIv1cbZb4R53fTgDhoxf4boULWOvhVGatr6JMSSnyeQiDcXGBn3/I0BoHU
 zOE6WPdtKs8v2HjZ6mbiGJIuUgFH7Hm/MwkmKPRTnkIsIrifWc9ROH7dQ+U/so9iluMa
 0Wj8c+h1x+3FsbHtbiY8nBwR4fN4UTOjfQkS1QE7UhsdpzjFnj/F0b0LD838Px7lfAqK
 h59/pXkyjW3Gkyh0bFrQJqg8SbEFrbYeZ5himZa/yuDb6veQBRjN2VVr60Dbekz01NRw
 XqHOan5Fwa6KbWFg1hAhav5Pr/p+l+r0GHQqSG9+Cd/FGvFouIHpj9Xa1J9xnNi79Lxb
 bxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sl3AXKlBgqeB3AKFBMSA/Bsf7ajPVkdcdF0tA8fk6Xg=;
 b=WWbXDhbRDocMBP4pfZ/fUoJNuTct/IKGj/72RZXQRmJMg83JsebaaLMBXli+1wn/Ku
 kmn1Qv0LtMqjvAW1mA6T5DAXLVMzbBw0ljJ7KAjpGZtPJpTP2Qrwq1G375A26T6eEdJg
 TEiKILZkNlalEeiGBzZjduBN19gNPUjltc8jKb/+z48L/CijKgb07+ToNokn8RFP0rSN
 /rtX/v/m7N0NDQEjO4OUV9IQ9x/78uhZi1DkU+lCuAoPTmsMj0EFOn+DJM7BKTTq7LPW
 h5XKe73ch5pgZAaQNa8HQYc+OSZ9o/TpjW/iR/bKZlOeSYDqAOkiPHsjJWKoUXupV5Ph
 k7hg==
X-Gm-Message-State: AOAM533juY+Ucng8tQmHRJI+NZ2ThL+ZpK0VuqApy7WV6o20W0mihTVv
 +sV8oGBoBmMMY0VAysTmYUnFw/kd2+dKLQ==
X-Google-Smtp-Source: ABdhPJxWLUgtVADV9ClaL+GE/HPMPM3a+xniiy368LNDKCv0r2gunzkyTY1nKBrzRJaZ2lFXn2Spcg==
X-Received: by 2002:a17:902:8501:b029:e2:ebb4:6e77 with SMTP id
 bj1-20020a1709028501b02900e2ebb46e77mr721057plb.43.1613593295517; 
 Wed, 17 Feb 2021 12:21:35 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:21:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/71] tcg/tci: Remove tci_read_r8
Date: Wed, 17 Feb 2021 12:19:30 -0800
Message-Id: <20210217202036.1724901-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext8u opcodes, and allow truncation
to happen with the store for st8 opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1c667537fe..4ade0ccaf9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -78,11 +78,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint8_t tci_read_reg8(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint8_t)tci_read_reg(regs, index);
-}
-
 static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint16_t)tci_read_reg(regs, index);
@@ -169,14 +164,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (8 bit) from bytecode. */
-static uint8_t tci_read_r8(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    uint8_t value = tci_read_reg8(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
 /* Read indexed register (8 bit signed) from bytecode. */
 static int8_t tci_read_r8s(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         CASE_32_64(st8)
-            t0 = tci_read_r8(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
@@ -722,8 +709,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i32
         case INDEX_op_ext8u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i32
@@ -916,8 +903,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext8u_i64
         case INDEX_op_ext8u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r8(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint8_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8s_i64
-- 
2.25.1


