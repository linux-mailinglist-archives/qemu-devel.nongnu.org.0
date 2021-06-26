Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49633B4CC6
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:12:50 +0200 (CEST)
Received: from localhost ([::1]:43878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx0cc-0005Wh-0Z
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TQ-00073d-Ac
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx0TO-0008JL-DV
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:03:19 -0400
Received: by mail-pl1-x633.google.com with SMTP id i4so5774929plt.12
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzqaqmGUsrCv1+6dFCQ8KH8rRMTBVbDCMJeps2UiJvs=;
 b=AYrS/7P6nwql+ZyOZvWQO3x2FuIvGHOdKSOmfL/l0Fup9inxYN6un4jy6PWu6OzO/b
 n8a8yZpTI8owGfQSclu9Ql2iBy7D8I7n3G3QWfwHILngVWudLim+RgzJnof06/c61llx
 pTbKiG25GUr3QSH+eCl0zcYvoYYlNrz1nDE+QE7uu+t0MsUw0csEuJkQURUFbpnz2GsT
 PTkXM+tqlEKDs5zamifGiUJimGcjy530T5Hfptapb0magw8gErBUXHuXwlNmdfeQpM0X
 3Bj7oclCAvnEE42qpKzoCS58HDnmgWrPxeA/DZnvZTOf0pYamsdI/I7UkDK8zTixYoXn
 DY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzqaqmGUsrCv1+6dFCQ8KH8rRMTBVbDCMJeps2UiJvs=;
 b=ehcjEvuIXP+f8+2emxo9QKnhwj9f10IZDWwkfagJmKpUx+ocZe4DgfGq5zQ6UP9THv
 lOlRzPTCEj5i8YHtCIH1b8FmAbIjZz/rpy6QwCwYwdjqzBo8chjmhESCCcAO7wQVZ9uu
 iZxIu7JJ6VAtQb5SSbAaEe/4O9GFLFpWWaXe0614XQ6UzO9TKn3/QSauWN+PJmVk9JKY
 y89O97R2WrxP82Q+hx3btBRVKiRXGkc2IW0jISMzox3c21tpgUhcvKsu7kZI2eN0uWsm
 KfoyQIlrMwosreMtXaAFGX2oouCiF4G/BDB93GW2WO5K9IrwYPaPiyx7uy6yEUqHub+n
 7ypw==
X-Gm-Message-State: AOAM531RhlRqfsM2w+AQeBMXeJfmInHIVqn3YmPt4aGao2vQgNEqiORQ
 gG1Xs7p67ll8i4YXdMtUbxlukN7jk0sUZw==
X-Google-Smtp-Source: ABdhPJyh58V7w3PnCNTR+bAjCyU2Djdj4i32tsR73KUxOdlWJMrx16Vq4e9xg0PLb7/q/VVsQC+Unw==
X-Received: by 2002:a17:902:be0d:b029:11d:6614:88cd with SMTP id
 r13-20020a170902be0db029011d661488cdmr12481628pls.40.1624683796856; 
 Fri, 25 Jun 2021 22:03:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c62sm7389768pfa.12.2021.06.25.22.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 22:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/16] tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
Date: Fri, 25 Jun 2021 22:03:06 -0700
Message-Id: <20210626050307.2408505-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
index 275f980cee..b38b346319 100644
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
index 31287609cc..4a8d9f2f6a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -296,6 +296,7 @@ typedef enum S390Opcode {
     VRRa_VUPH   = 0xe7d7,
     VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
+    VRRe_VSEL   = 0xe78d,
     VRRf_VLVGP  = 0xe762,
 
     VRSa_VERLL  = 0xe733,
@@ -637,6 +638,18 @@ static void tcg_out_insn_VRRc(TCGContext *s, S390Opcode op,
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
@@ -2755,6 +2768,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_bitsel_vec:
+        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2795,6 +2812,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
     case INDEX_op_andc_vec:
+    case INDEX_op_bitsel_vec:
     case INDEX_op_neg_vec:
     case INDEX_op_not_vec:
     case INDEX_op_or_vec:
@@ -3136,6 +3154,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
         return C_O1_I2(v, v, r);
+    case INDEX_op_bitsel_vec:
+        return C_O1_I3(v, v, v, v);
 
     default:
         g_assert_not_reached();
-- 
2.25.1


