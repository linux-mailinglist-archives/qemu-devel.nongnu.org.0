Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD040CEF3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:40:16 +0200 (CEST)
Received: from localhost ([::1]:51528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcdb-0004jq-Bq
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcVB-0003rK-EX
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:33 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV8-0003Qe-Uh
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id k24so4061857pgh.8
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmeOMaQp0dhkNUXThoxWxOsqZKk4DRHfwOFRWEzeE1g=;
 b=moIQvuHZBHdT24jRpsF9tgmh4K/F8q5OmoRPZGkoQsCxBn+9MrKRESOpD9sXiGV9fl
 YP3oys7RLjNt1l97AkySk1mfJUy+Mr8wH5UunoLt5e5si4bBNE9VNOQ3L5vSZjdw5uRA
 H2Kf6XvmeoCmJL6MmG2B9FzqvL9l4P3q1/RnDnZhXvSh29LM8SQ/d9/oWYflaxWjyun2
 RMCxH0eWfmEGF5bd0mU2aBvo4nGsj/j+hj0UCfrYorl89wWe0pXptD5/yTFt2vfj4QQH
 TUAdyLhIInwOBD4qCykOAoM4Z5dbWNe4jW8d+e4DS0VSjhFXHkIBkNZzcPaL/FT6ywoh
 RUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmeOMaQp0dhkNUXThoxWxOsqZKk4DRHfwOFRWEzeE1g=;
 b=eZzfg4RcWIN4/Xrw85p1q9Pn6iFknVF6nBPI+na39Te0eC/VerS05eZDw+jGMfM8Rw
 iYeZIUbKiNGoE1+oK2ik/TPREG6J+lw6IsHAd7ih8It8J48MWw+QhhheqEn6W54y3lDZ
 xeRW/lTws3BAQStwvt/5mooLMC6l+Raw3fCTbAlh8iswkoPjn639TGaSEpgxHBPmCI/H
 mW1wg5DBXfW+76800Gu7tXOjAVrMYmFDIUpZ678x/HGNVCmqwbAqr6E3CXtigGwDYzy+
 YIDHIhZwxW66sLZmrtQ1bI0PLa3klub3GFOHkOU2jKAEVz6achovZG5wv3oBy+nPFN/V
 ir1w==
X-Gm-Message-State: AOAM530nVzlw1T3QHXVIboO2qI2UE0RDLhC90h+8+xD15OUott6BT6L3
 7Iod5xMDqcsM03b2PlAMaKrqVNu03Xu6rw==
X-Google-Smtp-Source: ABdhPJz9w/C5dYs6RM4+fCgCI0qZuDEFhQvVXYv/wnzmX48nIVW87bOJZA00gFZqfQQO5ujGBwonHg==
X-Received: by 2002:aa7:980a:0:b0:43e:670:8505 with SMTP id
 e10-20020aa7980a000000b0043e06708505mr1593129pfl.74.1631741489612; 
 Wed, 15 Sep 2021 14:31:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/16] tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
Date: Wed, 15 Sep 2021 14:31:13 -0700
Message-Id: <20210915213114.1923776-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: david@redhat.com
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
index 4a56532011..5530c974a6 100644
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


