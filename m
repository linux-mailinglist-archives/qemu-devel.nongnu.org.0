Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E42E291F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:57:50 +0100 (CET)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZYM-00074x-0v
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMX-00023r-Dw
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:37 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMS-0008M1-M1
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:36 -0500
Received: by mail-pf1-x433.google.com with SMTP id f9so1799464pfc.11
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2jOhZ0X824Ir2mPF0YPHElmLbLC0e95TM2Qi2fWD/3s=;
 b=kAPzwRYFtO8AoWBfRuTWo3pWeR4shqvOeNVGy3EdUN0diK0dJ0NRkVJ0wgOrVmL/7O
 ORsPESZ2swovNv8Q3kpPISdRPdm+9x/NX1gBHVn303W0Y3lt6AvobA6b57PBoRDghK7R
 7i8qJkGMk5wZK17bIxU5WbTWlhtPVVOxEMhfxDSKTQmkCTv5usljgS8OY6gB5iE6tdFY
 Rq/5lFv7Lj11URL4Oviwb9CuRoYgfh4MRaMYtQ7szHMr/XPTpnTrSWgeuZdc1RME2gHc
 EcKGTiB/9IiDNhJyqAlH3yPwnhXt0F2XHsd3dSqPZbWQ3sKRToBiOvLDWohIUXz8fIOt
 ezaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jOhZ0X824Ir2mPF0YPHElmLbLC0e95TM2Qi2fWD/3s=;
 b=khMlgc1Nuxi35NN+3qpabVesBVqKbkIbldA9Sdn/l6OTxQUhcoP9vp6xozQH+5oADI
 RX3BWLQrdNCw+VBj7uhTjC8kN0KUCRmqRITli7Opgt+UyNluVObNHxsZ0m6xrYlONQAk
 Vaj3ZuzlioJ8t6Fx5O2Q/MeCtfmvGTpRj9IjU96roOrry6CHHdtfGHr6Oya+UAVR8oMJ
 fH+ixXwSdb0aHTIVXTKEfbrpjgjPvDj8gl2MY+xJZtgtrCWNkrAebSgDjryx3dpKSvCQ
 MTGLNmquQ059DgLXLpPQzT0M3ILFjz838qDct4lFczIq1LIbxv/DnlcOLIpRg9Gd/BaB
 edug==
X-Gm-Message-State: AOAM530hJ9N9MxcnTdPwqYUeO0RODrTH1oYyAr2C9o/Rq2J+8sIzAQVk
 MXcvIWVJg4nFLBmWsfMMJR3gtgQrBx+wFg==
X-Google-Smtp-Source: ABdhPJxIDEvOuGb/frZe7X+CZcvjFUxFo10AECceV5Q2kjj9jSHdeZJaL4cFHlM7XkYjnP9A2z5bEA==
X-Received: by 2002:a63:1115:: with SMTP id g21mr28182076pgl.210.1608849931170; 
 Thu, 24 Dec 2020 14:45:31 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] tcg/arm: Implement TCG_TARGET_HAS_roti_vec
Date: Thu, 24 Dec 2020 14:45:13 -0800
Message-Id: <20201224224514.626561-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Implement via expansion, so don't actually set TCG_TARGET_HAS_roti_vec.
For NEON, this is shift-right followed by shift-left-and-insert.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-conset.h |  1 +
 tcg/arm/tcg-target.opc.h    |  1 +
 tcg/arm/tcg-target.c.inc    | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/tcg/arm/tcg-target-conset.h b/tcg/arm/tcg-target-conset.h
index 30a5953621..efb63396de 100644
--- a/tcg/arm/tcg-target-conset.h
+++ b/tcg/arm/tcg-target-conset.h
@@ -25,6 +25,7 @@ C_O1_I2(r, r, rIK)
 C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
+C_O1_I2(w, 0, w)
 C_O1_I2(w, w, w)
 C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wV)
diff --git a/tcg/arm/tcg-target.opc.h b/tcg/arm/tcg-target.opc.h
index d19153dcb9..d38af9a808 100644
--- a/tcg/arm/tcg-target.opc.h
+++ b/tcg/arm/tcg-target.opc.h
@@ -11,5 +11,6 @@
  * consider these to be UNSPEC with names.
  */
 
+DEF(arm_sli_vec, 1, 2, 1, IMPLVEC)
 DEF(arm_sshl_vec, 1, 2, 0, IMPLVEC)
 DEF(arm_ushl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2a664a750d..5cae6b2749 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -215,6 +215,7 @@ typedef enum {
     INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+    INSN_VSLI      = 0xf3800510,
     INSN_VSHL_S    = 0xf2000400,  /* VSHL.S (register) */
     INSN_VSHL_U    = 0xf3000400,  /* VSHL.U (register) */
 
@@ -2400,6 +2401,8 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_arm_sshl_vec:
     case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
+    case INDEX_op_arm_sli_vec:
+        return C_O1_I2(w, 0, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
         return C_O1_I2(w, w, wO);
@@ -2815,6 +2818,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sari_vec:
         tcg_out_vshifti(s, INSN_VSARI, q, a0, a1, (16 << vece) - a2);
         return;
+    case INDEX_op_arm_sli_vec:
+        tcg_out_vshifti(s, INSN_VSLI, q, a0, a2, args[3] + (8 << vece));
+        return;
 
     case INDEX_op_andc_vec:
         if (!const_args[2]) {
@@ -2943,6 +2949,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotli_vec:
         return -1;
     default:
         return 0;
@@ -2988,6 +2995,14 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t1);
         break;
 
+    case INDEX_op_rotli_vec:
+        t1 = tcg_temp_new_vec(type);
+        tcg_gen_shri_vec(vece, t1, v1, -a2 & ((8 << vece) - 1));
+        vec_gen_4(INDEX_op_arm_sli_vec, type, vece,
+                  tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(v1), a2);
+        tcg_temp_free_vec(t1);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


