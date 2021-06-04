Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1155239C133
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:21:41 +0200 (CEST)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGK4-0001oF-2a
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB7-0005tE-6h
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:26 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB1-0005MT-UB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:24 -0400
Received: by mail-pf1-x434.google.com with SMTP id u126so4263490pfu.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tysDNxr3RlOzffJblVLQ9LvTmL2OC/WP8TwNOcJ9Me0=;
 b=qt84AeD8zdYPo7kWzDIHcQQSPrsh2U9ruNB21xov7oa2abYjG1FHL37gUoL67z5Edh
 6nFF760e6+i8knivVsKG8by/+geTmRPjuadEqBjg316lj9RkrMjkva5oMU3nKnF0geNs
 ZaE3kVKJmrOUW6yzEDsY5eFP8LjE8hwiHghIWG1DM3L8KRlhJU+LD1QffPNh8i3P8B+A
 tx5OujDQ/KLr0i2O0gJ/EkOrp1F4BihjdW1zcvBXBjETGC8L8vN1t/TeerpunhmXbM87
 qpE4gr33aPITUSBahmFSgjMblzk8Sr0tdcgz16x9ic3jqc003SxeBPd3FcM6CKNk7tGk
 twxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tysDNxr3RlOzffJblVLQ9LvTmL2OC/WP8TwNOcJ9Me0=;
 b=l3Np3VrV37IeG69YD7F5IPuG6qcm287Gu5EIZ0HIwaSzILYMRuiuMskfFfVV+s9Ypw
 pIoZXQEWdNQCRqQ+F9qJXm0NsyNcobyY9+w+lS8B9mHS3I6qqQCBIpmQ4OYP+g0xW5Ln
 71DZzy2caUJJtlcWepVOdA9yaraB1lcKUC2iT7G7Skd+zJ7k6BKJK5baF88bmOx0AYJF
 I7W1rCi0srXhREAh0Z6d/6k0csy6jvPHqGFUrBnFQKJSTcKblTitgmtL08FWcrBeJDBG
 mimyVLuvzqm1CLD9eiNrYojWO8OnHPwuMaKphvif9ts5cougjJXqBoVF3D8uAhX7Pf4e
 6Muw==
X-Gm-Message-State: AOAM532cZyrtWyK9aWLt1ev7rMLMytTIQHR00SWSgWTqddRyMRdB0CBB
 sXQ0Z4cyDaGcaQzWgcHse00SkndA0vGL9Q==
X-Google-Smtp-Source: ABdhPJx1bUtfD33EWABkjcbJRcbKKUMdJ7Ih4KwV2H/EYmn5E5THI1wn9B598KF9Oz4mFNbIaXJG4g==
X-Received: by 2002:a63:544e:: with SMTP id e14mr6706608pgm.256.1622837538627; 
 Fri, 04 Jun 2021 13:12:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] tcg/arm: Implement TCG_TARGET_HAS_shv_vec
Date: Fri,  4 Jun 2021 13:12:08 -0700
Message-Id: <20210604201210.920136-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The three vector shift by vector operations are all implemented via
expansion.  Therefore do not actually set TCG_TARGET_HAS_shv_vec,
as none of shlv_vec, shrv_vec, sarv_vec may actually appear in the
instruction stream, and therefore also do not appear in tcg_target_op_def.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.opc.h |  3 ++
 tcg/arm/tcg-target.c.inc | 61 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

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
index 3381240909..a6c7889d9f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -212,6 +212,8 @@ typedef enum {
     INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+    INSN_VSHL_S    = 0xf2000400,  /* VSHL.S (register) */
+    INSN_VSHL_U    = 0xf3000400,  /* VSHL.U (register) */
 
     INSN_VBSL      = 0xf3100110,
     INSN_VBIT      = 0xf3200110,
@@ -2418,6 +2420,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
+    case INDEX_op_arm_sshl_vec:
+    case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
@@ -2811,6 +2815,17 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2945,6 +2960,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -2953,7 +2972,47 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
+    va_end(va);
+
+    switch (opc) {
+    case INDEX_op_shlv_vec:
+        /*
+         * Merely propagate shlv_vec to arm_ushl_vec.
+         * In this way we don't set TCG_TARGET_HAS_shv_vec
+         * because everything is done via expansion.
+         */
+        v2 = temp_tcgv_vec(arg_temp(a2));
+        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
+        break;
+
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
+        /* Right shifts are negative left shifts for NEON.  */
+        v2 = temp_tcgv_vec(arg_temp(a2));
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
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
-- 
2.25.1


