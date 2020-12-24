Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A432E291E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:56:38 +0100 (CET)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZXB-0005bM-9u
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMV-000238-5f
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:37 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMR-0008Lq-JR
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:34 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m5so1796330pjv.5
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xYN1vd+q2L0rB3bPnM92+K/6b0rSonXaaEOXZn/c53Q=;
 b=bZFtvTBWwRM6fyqaGT5cWIeqc9jbm4yxrSAS8svPCU/SZ5wtZFwOeksPKARy9rlUE7
 /peD96YUVDvh2hx6IR67jSxstOqFYH2ljS7OkVIztf9OeuBQh0q98lw8Ya3VnpfZXRs+
 qQ/USQ35taAEnZyG3+39svdIGDNKoR7EHaKrAXOPKV0es/zcVVfpsCiEgek0GyWeEsp+
 bzstBgZTK3NRdnz4kSVHw2Zzo3lKDX+iM1z/C8Gax0D8bpIEHHxr5VMqM0O8Y6lDBboz
 LggpWEqNYoRbhdSFPoG8nb8osNyNcLmze936FiKBDXGyONvptoiNiDoOZITHiJy5VGHd
 N6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYN1vd+q2L0rB3bPnM92+K/6b0rSonXaaEOXZn/c53Q=;
 b=HIsSblU2cSyYe7Q12bGRmKisQKKMJ1sNFoAzGyRz//ME2g3ZbuUT3H8g7dpO9A12V1
 9aq7mWHvkr5hAAyb3odmquyisqLvjk3e/gD990fk7TScFQqWPh4Ggqaa1IGR3ej5fJSR
 mH4TQ275Dcj51mg2/EgnK26JY2w/ETYfShHFxwb5bCKOYjIiv9bSWhuHFkqRP8AJhtpv
 LL/1qFVu1zSeGWTlCDGN/xuUnK8befXZsgUzpnv5r5nd44mDvN8eokXJR5XhVhfdE1Wn
 TO4DlQSocTrvesH3MTLOiLms4iuapcln3yP7PAaMWs1MBdm3H6LmeRWuJCr++SFkNNyW
 XMhQ==
X-Gm-Message-State: AOAM531uXI7AJ3oa/XrFseueecAc1HbHohKg6uDCxh1cChuuAutFTg5p
 PtsUzMqqE0LLyDWx8HmO2R6GrWe7wSmMzQ==
X-Google-Smtp-Source: ABdhPJzr4kQEDa9F3YWJo0UcobWGX4m0xozJTArdx4E8s8xDU/YgFV2WrsdiSFmRpwfThj4YwWHKSw==
X-Received: by 2002:a17:902:9f89:b029:dc:3032:e439 with SMTP id
 g9-20020a1709029f89b02900dc3032e439mr29132357plq.35.1608849930147; 
 Thu, 24 Dec 2020 14:45:30 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] tcg/arm: Implement TCG_TARGET_HAS_shv_vec
Date: Thu, 24 Dec 2020 14:45:12 -0800
Message-Id: <20201224224514.626561-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

The three vector shift by vector operations are all implemented via
expansion.  Therefore do not actually set TCG_TARGET_HAS_shv_vec,
as none of shlv_vec, shrv_vec, sarv_vec may actually appear in the
instruction stream, and therefore also do not appear in tcg_target_op_def.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.opc.h |  3 ++
 tcg/arm/tcg-target.c.inc | 60 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.opc.h b/tcg/arm/tcg-target.opc.h
index 7a4578e9b4..d19153dcb9 100644
--- a/tcg/arm/tcg-target.opc.h
+++ b/tcg/arm/tcg-target.opc.h
@@ -10,3 +10,6 @@
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
  */
+
+DEF(arm_sshl_vec, 1, 2, 0, IMPLVEC)
+DEF(arm_ushl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index aea3d2cf8f..2a664a750d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -215,6 +215,8 @@ typedef enum {
     INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+    INSN_VSHL_S    = 0xf2000400,  /* VSHL.S (register) */
+    INSN_VSHL_U    = 0xf3000400,  /* VSHL.U (register) */
 
     INSN_VBSL      = 0xf3100110,
     INSN_VBIT      = 0xf3200110,
@@ -2395,6 +2397,8 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
+    case INDEX_op_arm_sshl_vec:
+    case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
@@ -2791,6 +2795,17 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_xor_vec:
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
+    case INDEX_op_arm_sshl_vec:
+        /*
+         * Note that Vm is the data and Vn is the shift count,
+         * therefore the arguments appear reversed.
+         */
+        tcg_out_vreg3(s, INSN_VSHL_S, q, vece, a0, a2, a1);
+        return;
+    case INDEX_op_arm_ushl_vec:
+        /* See above. */
+        tcg_out_vreg3(s, INSN_VSHL_U, q, vece, a0, a2, a1);
+        return;
     case INDEX_op_shli_vec:
         tcg_out_vshifti(s, INSN_VSHLI, q, a0, a1, a2 + (8 << vece));
         return;
@@ -2925,6 +2940,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
         return vece < MO_64;
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        return -1;
     default:
         return 0;
     }
@@ -2933,7 +2952,46 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
-    g_assert_not_reached();
+    va_list va;
+    TCGv_vec v0, v1, v2, t1;
+    TCGArg a2;
+
+    va_start(va, a0);
+    v0 = temp_tcgv_vec(arg_temp(a0));
+    v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+    a2 = va_arg(va, TCGArg);
+    v2 = temp_tcgv_vec(arg_temp(a2));
+
+    switch (opc) {
+    case INDEX_op_shlv_vec:
+        /*
+         * Merely propagate shlv_vec to arm_ushl_vec.
+         * In this way we don't set TCG_TARGET_HAS_shv_vec
+         * because everything is done via expansion.
+         */
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        break;
+
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        /* Right shifts are negative left shifts for NEON.  */
+        t1 = tcg_temp_new_vec(type);
+        tcg_gen_neg_vec(vece, t1, v2);
+        if (opc == INDEX_op_shrv_vec) {
+            opc = INDEX_op_arm_ushl_vec;
+        } else {
+            opc = INDEX_op_arm_sshl_vec;
+        }
+        vec_gen_3(opc, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+        tcg_temp_free_vec(t1);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    va_end(va);
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
-- 
2.25.1


