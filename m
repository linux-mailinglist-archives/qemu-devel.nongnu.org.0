Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC502E2C51
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:26:19 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstfG-000876-HX
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZS-0003Ie-Nw
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:18 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZQ-0005Gy-LF
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:18 -0500
Received: by mail-pg1-x52f.google.com with SMTP id v19so3477132pgj.12
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jlVa78AQQNkl87QPxsSEB+lmpeBmWuJ4zOM7kPKIAtQ=;
 b=zShr/Aaj+MSeA4JPkE6XYW9tyi8EoxNFnR7evJhBGPBsq3gkfR2frS0b0HPvU373D+
 m8P770mNv7SVlCdkFo62qcSOq4fPuig7xClLms5PUl96ONxr1Z/Yx6SAwXDxINyrCeT3
 x8I5L32C57IqT2GJA5DfW/aQDGwoTIQwITEZJyacn05Ilgt7BCK/H0r3QbbaqbxOtTc7
 9GV4oxq6iQXIx/miXpAEV1RaF3YSU/MnI6GRnLJv/lLiilWBCzvwufg0o/GI0gKGBoQQ
 k+iJ5636dBoRNKBx54AZyhBFnGs36JsK8duqcbd5pkouIh0fMcd927yDzqGIQNc2y7RD
 wb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlVa78AQQNkl87QPxsSEB+lmpeBmWuJ4zOM7kPKIAtQ=;
 b=Thw0r96uRAxVjzdbB1vfAFnIWfEFSsN6tnQEanySjBe388gVf7whgZkH7TuaGxjbSg
 1/4ekrA8yBN914vSh9BTqu+hlE2lKFSPPxUZ/XZOw4kA1P+VI84a70IwhNZXy5S+u8Uu
 Sk1jcAyfjHehtpt7l0seD7mZpARttdJbDtjlwG/Dyjs1lxfppZTy5ZJrEVQJ/0WhgCat
 qmSpP1kcblEgGfM3nNHHqm4IIVkK91t8bc0QDMkwQ/3ETDuW9PdO57DRcihAeVMD9kyn
 FxzOgIo/HhUur82eC/UjfLdFXkraBzjErXDxckzlrTbjYk6EVmhrarIgrBANEx+iMmnz
 VKzg==
X-Gm-Message-State: AOAM530ut3qQhxPuAa0xM2ev4FYzLFhIU66N43NSIn7AkLqHqkZKpqgc
 i+eA+eAIk5fD06XjDuzO/LiFBgYpb3M95Q==
X-Google-Smtp-Source: ABdhPJzDBIuAFbqOV3ea3GSFUbhPu/VdVy3KHIO4c51SQc6ydRGnETUhs4fRXn2v/HMM6UoGvWMSrQ==
X-Received: by 2002:a63:d305:: with SMTP id b5mr10165429pgg.452.1608927614966; 
 Fri, 25 Dec 2020 12:20:14 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/16] tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
Date: Fri, 25 Dec 2020 12:19:55 -0800
Message-Id: <20201225201956.692861-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 tcg/s390x/tcg-target-conset.h |  1 +
 tcg/s390x/tcg-target.h        |  2 +-
 tcg/s390x/tcg-target.c.inc    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target-conset.h b/tcg/s390x/tcg-target-conset.h
index 9c7dd85eac..4890dbf807 100644
--- a/tcg/s390x/tcg-target-conset.h
+++ b/tcg/s390x/tcg-target-conset.h
@@ -21,6 +21,7 @@ C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
+C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(b, a, 0, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index acea745016..afd90788c0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -153,7 +153,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     1
-#define TCG_TARGET_HAS_bitsel_vec     0
+#define TCG_TARGET_HAS_bitsel_vec     1
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
 /* used for function call generation */
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ab53c8a05c..251287dd29 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -281,6 +281,7 @@ typedef enum S390Opcode {
     VRRa_VUPH   = 0xe7d7,
     VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
+    VRRe_VSEL   = 0xe78d,
     VRRf_VLVGP  = 0xe762,
 
     VRSa_VERLL  = 0xe733,
@@ -619,6 +620,18 @@ static void tcg_out_insn_VRRc(TCGContext *s, S390Opcode op,
     tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, 0) | (m4 << 12));
 }
 
+static void tcg_out_insn_VRRe(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_debug_assert(v4 >= TCG_REG_V0 && v4 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
+    tcg_out16(s, v3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, v4) | ((v4 & 15) << 12));
+}
+
 static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg r2, TCGReg r3)
 {
@@ -2748,6 +2761,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_bitsel_vec:
+        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2788,6 +2805,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_bitsel_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
@@ -3129,6 +3147,8 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
         return C_O1_I2(v, v, r);
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(v, v, v, v);
 
     default:
         g_assert_not_reached();
-- 
2.25.1


