Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B543F6FED97
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:12:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1JE-0007Ot-6S; Thu, 11 May 2023 04:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Il-0006eY-Ap
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IZ-000134-Ki
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:27 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9661047f8b8so1099438966b.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792314; x=1686384314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06h6yvJMyKq5VclqGY9lkGTNGgWZsKct+6eNF1BuBvk=;
 b=WOfBHWh+4mMELfetvEQp4VkdVBiJmvYklAAbZtIcNoiMgZuAQy6vi/YPe21yJhFKHk
 Wo3AfsxhE/rJxNpX3S7PxV5Lw50U9QTZJwbzfRdb4dMaOoG4YyqoWcPfN3XmiEyCMMsd
 DivZsHa9yjV/ZpPiHITYAeKXBGZA1j9AP1pkoeYXzhxLDtWAHv3wbqPU971eT7o4Qrof
 lno3fuotzzwxtEw0IcdjLjGyBgXpGMXnbKeEl7SeW3tnqM+SsPDGSikc8I1OFKZ4f4ZD
 B1HCEypPAEvGJKBycw2DOtA1mrLn6FJMsptBVaAHPwhhHFIFF0p7GRoVR+oRS09qoQAN
 Yb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792314; x=1686384314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06h6yvJMyKq5VclqGY9lkGTNGgWZsKct+6eNF1BuBvk=;
 b=QSJR6NOJ85zDcycy5W8Rd287sjgPSUVLAdQLGEuGWOs7aoZggQj2h0e0W4nNVfCY6I
 Vgz+K0zm/8FKIElHv+9eXRzElWZpYknWmY5ocpLTNZsFY+vraXuUu2wbZR/XZzp/ocQB
 aoomOTBV1xfvsB/1xCwosAn9+SSW0GVGDN9QbnoKeJ9tUMDoi940sgOIBV+ig2ZBsTPt
 i7o3/y6ucFBqI5q0XKM1ajL3DbSWdIlpCZ56TWoa5cQmYt5CfrRBoH8TWt9LRcdyS42o
 UO79xEvU7r0GCzRLb8hSnwhhqZsSNRvo281tJLLhw6rJ018ds+p21BeuzalInsB26rXI
 HIlQ==
X-Gm-Message-State: AC+VfDxtOtPHn3dt3xcg/fs6JdljxZVfF1kyDwlPU68+PO3Z0rpBRsfY
 pFpPq1+oygK7D4IT/fovleFQXvCOjmB0Ve7m0Nt54g==
X-Google-Smtp-Source: ACHHUZ4aFzoZ/bKXPPeNdL05Xfo4+IloS0Nl7GLN00OGKObM5WvcAqg16G41Tsq7A1TDNFBLUGrdqw==
X-Received: by 2002:a17:907:971d:b0:966:d59a:4ba6 with SMTP id
 jg29-20020a170907971d00b00966d59a4ba6mr14574983ejc.43.1683792314064; 
 Thu, 11 May 2023 01:05:14 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 35/53] tcg/ppc: Adjust constraints on qemu_ld/st
Date: Thu, 11 May 2023 09:04:32 +0100
Message-Id: <20230511080450.860923-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The softmmu tlb uses TCG_REG_{TMP1,TMP2,R0}, not any of the normally
available registers.  Now that we handle overlap betwen inputs and
helper arguments, we can allow any allocatable reg.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h | 11 ++++-------
 tcg/ppc/tcg-target-con-str.h |  2 --
 tcg/ppc/tcg-target.c.inc     | 32 ++++++++++----------------------
 3 files changed, 14 insertions(+), 31 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index a1a345883d..f206b29205 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -12,18 +12,15 @@
 C_O0_I1(r)
 C_O0_I2(r, r)
 C_O0_I2(r, ri)
-C_O0_I2(S, S)
 C_O0_I2(v, r)
-C_O0_I3(S, S, S)
+C_O0_I3(r, r, r)
 C_O0_I4(r, r, ri, ri)
-C_O0_I4(S, S, S, S)
-C_O1_I1(r, L)
+C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
 C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
 C_O1_I2(r, rI, ri)
 C_O1_I2(r, rI, rT)
 C_O1_I2(r, r, r)
@@ -36,7 +33,7 @@ C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
-C_O2_I1(L, L, L)
-C_O2_I2(L, L, L, L)
+C_O2_I1(r, r, r)
+C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 298ca20d5b..f3bf030bc3 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -14,8 +14,6 @@ REGS('A', 1u << TCG_REG_R3)
 REGS('B', 1u << TCG_REG_R4)
 REGS('C', 1u << TCG_REG_R5)
 REGS('D', 1u << TCG_REG_R6)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index dbba304e42..fa016c02ee 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -93,18 +93,6 @@
 #define ALL_GENERAL_REGS  0xffffffffu
 #define ALL_VECTOR_REGS   0xffffffff00000000ull
 
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (ALL_GENERAL_REGS & \
-     ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | (1 << TCG_REG_R5)))
-#define ALL_QSTORE_REGS \
-    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R3) | (1 << TCG_REG_R4) | \
-                          (1 << TCG_REG_R5) | (1 << TCG_REG_R6)))
-#else
-#define ALL_QLOAD_REGS  (ALL_GENERAL_REGS & ~(1 << TCG_REG_R3))
-#define ALL_QSTORE_REGS ALL_QLOAD_REGS
-#endif
-
 TCGPowerISA have_isa;
 static bool have_isel;
 bool have_altivec;
@@ -3754,23 +3742,23 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L)
-                : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r)
+                : C_O1_I2(r, r, r));
 
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(S, S)
-                : C_O0_I3(S, S, S));
+                ? C_O0_I2(r, r)
+                : C_O0_I3(r, r, r));
 
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(L, L, L)
-                : C_O2_I2(L, L, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
 
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(S, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(S, S, S)
-                : C_O0_I4(S, S, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
+                : C_O0_I4(r, r, r, r));
 
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
-- 
2.34.1


