Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA3678DEB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gq-0008TC-OX; Mon, 23 Jan 2023 21:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gm-0008S2-O0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:32 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gk-0003vE-1T
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:32 -0500
Received: by mail-pj1-x1035.google.com with SMTP id 88so1848996pjo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rc/VY8rBEtL52bTFD8m38qtzf0giQYh7S+uKXuCEagE=;
 b=YnYPKSM5BFp/9AYH91jaXQWlpcQzaxJqbXOaOzI20HWx9ESqeYhMEJhKZtQY9bE9DN
 czgFCHCv1I1WXhqXqc0685fopdUleB1eiJl2R7zuG56RW0TKAbqQogr8d66CzACE4gt/
 UbR1o4TcPqGuNqit1AXOPMNUv3MFmCj6kct3tLm2qc6pXzQBNeluFIFpEgdW3aQ5NdxG
 opOV1FwV0ebqoWGbpKNn9aAtLMqC6XZoFioTdC+PR3pV31CQNrJWPvipZy0hW+vy2EpQ
 Y7lpG1mRW6tMgUKsETPMpia04O3zV8kvaIihBMJCaBCuvJQWmeVo0THmtNSgNC+Hwf+5
 k2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rc/VY8rBEtL52bTFD8m38qtzf0giQYh7S+uKXuCEagE=;
 b=tKre7a2anc210iu/N6UOadnOq7h/ty2I+Kod0YJXl7veEOq1xdNjpFm5JOLX4/m2IX
 PmKjzEN/giN0zYngLpmwifPZUpTk0xB70nMd4wgC2Kyfivlk7mFKwVIvJD+ZW7eC6MDj
 S36koNkRWvnth4jwfRiZxgYg5olWFxc8z+jerrbAHDeku5k2bCtsCJ77kdYutOC2uX08
 T3+1KpJKqEXgqnKpj44BlLKAzr2QkckHG91UmF2+ktn5/MxkziXfgpmLwe6rq6G4f09l
 tsSX11aUNek/hgaNtGjLl1ZsgFlEt1jTxwmM9EpZ+jc+1la5ApWZLRSeIW30/Ql58Khm
 kM9g==
X-Gm-Message-State: AFqh2kq9ueCYhfCQ7XPGi4+A/8f7KgyWmqOBz9/QrfHx5paXB9aaYuT7
 2jHHlQ/FQFxeLvQ848DpmWKPKZ7NjjUbuOS9
X-Google-Smtp-Source: AMrXdXv1NN9rAgMfXxEaxHOYuc2hg/x09IyIODH0GffhnNsD1Po+sk6M6VEk/tw2KrQZmWsPFNQQxg==
X-Received: by 2002:a17:90a:a895:b0:229:d400:11c1 with SMTP id
 h21-20020a17090aa89500b00229d40011c1mr21364346pjq.10.1674525929219; 
 Mon, 23 Jan 2023 18:05:29 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PULL v2 11/15] tcg/loongarch64: Introduce tcg_out_addi
Date: Mon, 23 Jan 2023 16:05:03 -1000
Message-Id: <20230124020507.3732200-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Adjust the constraints to allow any int32_t for immediate
addition.  Split immediate adds into addu16i + addi, which
covers quite a lot of the immediate space.  For the hole in
the middle, load the constant into TMP0 instead.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  4 +-
 tcg/loongarch64/tcg-target-con-str.h |  2 +-
 tcg/loongarch64/tcg-target.c.inc     | 57 ++++++++++++++++++++++++----
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 349c672687..7b5a7a3f5d 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -23,9 +23,11 @@ C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
+C_O1_I2(r, r, rJ)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, r, rZ)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, rZ, rN)
+C_O1_I2(r, rZ, ri)
+C_O1_I2(r, rZ, rJ)
 C_O1_I2(r, rZ, rZ)
diff --git a/tcg/loongarch64/tcg-target-con-str.h b/tcg/loongarch64/tcg-target-con-str.h
index c3986a4fd4..541ff47fa9 100644
--- a/tcg/loongarch64/tcg-target-con-str.h
+++ b/tcg/loongarch64/tcg-target-con-str.h
@@ -21,7 +21,7 @@ REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S12)
-CONST('N', TCG_CT_CONST_N12)
+CONST('J', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U12)
 CONST('Z', TCG_CT_CONST_ZERO)
 CONST('C', TCG_CT_CONST_C12)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 428f3abd71..8cc6c5eec2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -126,7 +126,7 @@ static const int tcg_target_call_oarg_regs[] = {
 
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
-#define TCG_CT_CONST_N12   0x400
+#define TCG_CT_CONST_S32   0x400
 #define TCG_CT_CONST_U12   0x800
 #define TCG_CT_CONST_C12   0x1000
 #define TCG_CT_CONST_WSZ   0x2000
@@ -161,7 +161,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
         return true;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return true;
     }
     if ((ct & TCG_CT_CONST_U12) && val >= 0 && val <= 0xfff) {
@@ -378,6 +378,45 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     }
 }
 
+static void tcg_out_addi(TCGContext *s, TCGType type, TCGReg rd,
+                         TCGReg rs, tcg_target_long imm)
+{
+    tcg_target_long lo12 = sextreg(imm, 0, 12);
+    tcg_target_long hi16 = sextreg(imm - lo12, 16, 16);
+
+    /*
+     * Note that there's a hole in between hi16 and lo12:
+     *
+     *       3                   2                   1                   0
+     *     1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+     * ...+-------------------------------+-------+-----------------------+
+     *    |             hi16              |       |          lo12         |
+     * ...+-------------------------------+-------+-----------------------+
+     *
+     * For bits within that hole, it's more efficient to use LU12I and ADD.
+     */
+    if (imm == (hi16 << 16) + lo12) {
+        if (hi16) {
+            tcg_out_opc_addu16i_d(s, rd, rs, hi16);
+            rs = rd;
+        }
+        if (type == TCG_TYPE_I32) {
+            tcg_out_opc_addi_w(s, rd, rs, lo12);
+        } else if (lo12) {
+            tcg_out_opc_addi_d(s, rd, rs, lo12);
+        } else {
+            tcg_out_mov(s, type, rd, rs);
+        }
+    } else {
+        tcg_out_movi(s, type, TCG_REG_TMP0, imm);
+        if (type == TCG_TYPE_I32) {
+            tcg_out_opc_add_w(s, rd, rs, TCG_REG_TMP0);
+        } else {
+            tcg_out_opc_add_d(s, rd, rs, TCG_REG_TMP0);
+        }
+    }
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_andi(s, ret, arg, 0xff);
@@ -1350,14 +1389,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_add_i32:
         if (c2) {
-            tcg_out_opc_addi_w(s, a0, a1, a2);
+            tcg_out_addi(s, TCG_TYPE_I32, a0, a1, a2);
         } else {
             tcg_out_opc_add_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_add_i64:
         if (c2) {
-            tcg_out_opc_addi_d(s, a0, a1, a2);
+            tcg_out_addi(s, TCG_TYPE_I64, a0, a1, a2);
         } else {
             tcg_out_opc_add_d(s, a0, a1, a2);
         }
@@ -1365,14 +1404,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_sub_i32:
         if (c2) {
-            tcg_out_opc_addi_w(s, a0, a1, -a2);
+            tcg_out_addi(s, TCG_TYPE_I32, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_w(s, a0, a1, a2);
         }
         break;
     case INDEX_op_sub_i64:
         if (c2) {
-            tcg_out_opc_addi_d(s, a0, a1, -a2);
+            tcg_out_addi(s, TCG_TYPE_I64, a0, a1, -a2);
         } else {
             tcg_out_opc_sub_d(s, a0, a1, a2);
         }
@@ -1586,8 +1625,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_add_i32:
+        return C_O1_I2(r, r, ri);
     case INDEX_op_add_i64:
-        return C_O1_I2(r, r, rI);
+        return C_O1_I2(r, r, rJ);
 
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
@@ -1616,8 +1656,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, 0, rZ);
 
     case INDEX_op_sub_i32:
+        return C_O1_I2(r, rZ, ri);
     case INDEX_op_sub_i64:
-        return C_O1_I2(r, rZ, rN);
+        return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_mul_i32:
     case INDEX_op_mul_i64:
-- 
2.34.1


