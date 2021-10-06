Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4242417E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:42:24 +0200 (CEST)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY93n-0005Ei-3v
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j5-0002dc-AP
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0007su-0z
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id k23so2503151pji.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9+Phq7FGgQR2w+FkQmqrhNCYfACBIoJVKK2P9a5WOUo=;
 b=MKrMh2J6ayeKg+l1e2eFMpqM1geUlU+TO+0F/Qy+HHcjdt57l/iovURVu8GqjMmdEB
 c6fGuWwlQeZi6UYblly/HeQS9TlR6Dbp3a5vT/POTvzfe+CVayeYB8giJfy5ODA1mItt
 8FTvmRjmb9jJFF+9A7nMHboW3ARHvKG2DH4XZzTUS4VEpf8rsNVJO8WKWnwLthYwnFlW
 Di46Hs5ZJ7X5tyDLMq/aRsrKwasQvQ2OhpMf13m3Py36CxK5jOYV01nQlfQ0nvPBzlj+
 vF8KTRbKm8EyQWDvNHh23zqOWga/ddGKTwBsqmi6bjmQ7/APUTEyk2T/pDSdxbwxNy2v
 LeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+Phq7FGgQR2w+FkQmqrhNCYfACBIoJVKK2P9a5WOUo=;
 b=btARVOTD0kUh3aAdjKJ1Y5Wz+vc2EmeDeMhSggUigf6xjcAhUKS6CcBTX0eOGVaW22
 akQnWZOvRxKOVYsC4oYiGLGtqGMRxERyymbiyzZyqkey/qu2flQ50yam4u7GD0ZYEzGr
 k1SC8MwOAp6gqP0bTZ5oENnitVGx0VK7QBUcH5hB3TcMBTlN9GdU6tgUR0V5pd0lAJE4
 Ra5XyQL5uqc6O3yzjruUluiLORYzsWIVRgpcroZeDWn06/Vu250HXvwXbu92Hw5N6Al1
 O+1CUhlm6WOlxzwC7SPmnpjcKnA1a5xrx6Tw6SpzAgnFT17KUbg4/K0Ci8isqzC9LFxz
 hrNw==
X-Gm-Message-State: AOAM533lqVPrpZU6MVk0RFCTqlw4rouaWIm2k6As2wj0jQAtvp2/T92O
 CQXtbXYWZm3oYeL9ETazltcoww8MnPid8Q==
X-Google-Smtp-Source: ABdhPJwGVRUiKabM/k4xUBPutkm9+hc4sOWpdB86M7Gqdj/acNnIPmJ9cjhtzqKHqBw4sAiFLvlfjg==
X-Received: by 2002:a17:90b:946:: with SMTP id
 dw6mr11859681pjb.49.1633533639301; 
 Wed, 06 Oct 2021 08:20:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
Date: Wed,  6 Oct 2021 08:20:13 -0700
Message-Id: <20211006152014.741026-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         |  2 +-
 tcg/s390x/tcg-target.c.inc     | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 49b98f33b9..426dd92e51 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -26,6 +26,7 @@ C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
+C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(b, a, 0, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a79f4f187a..527ada0f63 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -157,7 +157,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     1
-#define TCG_TARGET_HAS_bitsel_vec     0
+#define TCG_TARGET_HAS_bitsel_vec     1
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
 /* used for function call generation */
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 965d9ab54c..ae132e1b75 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -296,6 +296,7 @@ typedef enum S390Opcode {
     VRRa_VUPH   = 0xe7d7,
     VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
+    VRRe_VSEL   = 0xe78d,
     VRRf_VLVGP  = 0xe762,
 
     VRSa_VERLL  = 0xe733,
@@ -647,6 +648,18 @@ static void tcg_out_insn_VRRc(TCGContext *s, S390Opcode op,
     tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, 0) | (m4 << 12));
 }
 
+static void tcg_out_insn_VRRe(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
+{
+    tcg_debug_assert(is_vector_reg(v1));
+    tcg_debug_assert(is_vector_reg(v2));
+    tcg_debug_assert(is_vector_reg(v3));
+    tcg_debug_assert(is_vector_reg(v4));
+    tcg_out16(s, (op & 0xff00) | ((v1 & 0xf) << 4) | (v2 & 0xf));
+    tcg_out16(s, v3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, v4) | (v4 << 12));
+}
+
 static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg r2, TCGReg r3)
 {
@@ -2787,6 +2800,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_bitsel_vec:
+        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2827,6 +2844,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_bitsel_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
@@ -3168,6 +3186,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
         return C_O1_I2(v, v, r);
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(v, v, v, v);
 
     default:
         g_assert_not_reached();
-- 
2.25.1


