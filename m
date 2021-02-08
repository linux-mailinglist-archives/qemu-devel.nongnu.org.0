Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D35312970
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:37:56 +0100 (CET)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xN5-0004Vf-Sm
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZc-00042j-LP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:48 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZY-00009X-2S
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:48 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d26so7533870pfn.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mlQccIEWwj2YtWlnEgH22wmiL/pAMfX41rEpRSECFmw=;
 b=Jgz/R8BVZ8QuJECkHbDoeTQ8nkoy7pyDqZevCzvZNCo1jvaGlBKmdeOoK5poYN1+QY
 xOsfsJAEuN+Vcr+zX0d+g9Ahj0EKDnVBkuLCZfOws1wh5CSu63l0BelneE6EyL5usY5u
 QlrWuFxUYuVYkavYXPzJyPc/sFxnVtxaFDAiJMkUyxrqofUZcrk+lL1+z3OpRbFJ/ApR
 gR5ZJ8uvcWOC9fA/1KukjpsEI9d9QGa8F54gC5tTwUUZ7ay73WoY9mJFpDc9BQLRjsyy
 dvsyEPtswxl1uylrC997GU4kcaBNLpHmamY4UbKHHaXzsIPGcgVWxnhr2wEMYOFM6Yom
 aXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlQccIEWwj2YtWlnEgH22wmiL/pAMfX41rEpRSECFmw=;
 b=HXYkGqAgdwl1QtiaLFxLXNSGXVlwTSBJYP+KSrcNgVvFFkaWe7wljz161TD4gK3vzr
 0fO4Pv9GwmPYn+u5qFYZ0EJ6MnuwqwPBfDbLxaHeuJZzdyxfnEbPGY5UEjP8YeyYPIOo
 v7vU3Q+3A2sAccTA++6igxxfCHaN2zzkmK23kHpnTrV28lUs51P/x3tmVTe7fD4vRa3W
 LE6Ep5ZI7kCAdEKNWdAk7Fww34MNqxqkIkIqzax62/QDExJ5dPkn5stv/nM2wa38ofDc
 Ddzy7YfSXCjd2i101W9/ZEPB9FlM+Ox2zZeKtQjG/3aPG3if+LLL2loIFSmqV61tRWqW
 ozuw==
X-Gm-Message-State: AOAM533God5dNQAJQkqCNNwHoDSUEFXIsoPhUFi6ElI7eqOHBFf6i1vG
 Qyf6E1/oX3XPcQKr1LYcLTVYHpiVuOZiUA==
X-Google-Smtp-Source: ABdhPJzk6C5+XIAF5kCIg1hJA/uOAWoZKJF8giWdwjenjZ9n8N1OGbpb/UcCl7vwSe8CcNcU56LCNQ==
X-Received: by 2002:a63:ff5d:: with SMTP id s29mr15530397pgk.133.1612752401897; 
 Sun, 07 Feb 2021 18:46:41 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] tcg/arm: Implement TCG_TARGET_HAS_roti_vec
Date: Sun,  7 Feb 2021 18:46:24 -0800
Message-Id: <20210208024625.271018-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 tcg/arm/tcg-target-con-set.h |  1 +
 tcg/arm/tcg-target.opc.h     |  1 +
 tcg/arm/tcg-target.c.inc     | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index d02797cbf4..3685e1786a 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -30,6 +30,7 @@ C_O1_I2(r, r, rIK)
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
index b088f61a99..3150aae8d6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -215,6 +215,7 @@ typedef enum {
     INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+    INSN_VSLI      = 0xf3800510,
     INSN_VSHL_S    = 0xf2000400,  /* VSHL.S (register) */
     INSN_VSHL_U    = 0xf3000400,  /* VSHL.U (register) */
 
@@ -2427,6 +2428,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_arm_sshl_vec:
     case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
+    case INDEX_op_arm_sli_vec:
+        return C_O1_I2(w, 0, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
         return C_O1_I2(w, w, wO);
@@ -2842,6 +2845,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sari_vec:
         tcg_out_vshifti(s, INSN_VSARI, q, a0, a1, (16 << vece) - a2);
         return;
+    case INDEX_op_arm_sli_vec:
+        tcg_out_vshifti(s, INSN_VSLI, q, a0, a2, args[3] + (8 << vece));
+        return;
 
     case INDEX_op_andc_vec:
         if (!const_args[2]) {
@@ -2970,6 +2976,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotli_vec:
         return -1;
     default:
         return 0;
@@ -3017,6 +3024,14 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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


