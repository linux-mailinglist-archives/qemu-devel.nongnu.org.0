Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B0B312953
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:28:11 +0100 (CET)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xDe-0001JX-6O
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZb-00042S-08
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZW-00009R-Fc
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:46 -0500
Received: by mail-pl1-x630.google.com with SMTP id g3so7044693plp.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o5M8c9V3AKnIe0DJJe/R5zY18kqg2FwjGsxkh/FIP60=;
 b=xGV06RrPsXuQvy+iiKH+wcoOijOES1ekSy8TmRz+IltkQHKq2HS+NZzM+NrA80mPOV
 Iy7KGSAXXC2LeqHjuqyx0JSrUtlfjQmmSubPmNr5DLuQMVa46V1f4hcqptfWBC7QWDYQ
 P3IPlQ8w5eCZ0nyRTIakae42wZ99r40qKX4Gb1406Zr7ByKdB2lenGK9NFJK9myDTTil
 HgLZfGlMWVc05KwedDyrhFZEPARPOoR+aPxWkoVzp9lrwIAppUmeyqFZrRDHX2BQczND
 U3OSuH3z6XJJhoE93tkqHlrXrcIl8NBGkUxCb0vCiMFsa/mbGbSFvq5NGn6Y2TVX7aKU
 Ls9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5M8c9V3AKnIe0DJJe/R5zY18kqg2FwjGsxkh/FIP60=;
 b=mdLCBvi4HK64yGNQEN5obMboeCUiJg0vSYWLLn/qJ/0BoepGDb756Fj18Ki3WuiG5H
 S1/Sb7a+hLOrIbyzRBhP8QZzfgVn9CumF0aDOU+jC3UugvAOm5cS4pXxQ5yCI27Jk7K4
 mbvpa9qsvfQFUDT+lUXbOJvaVtZmgaNkCiHBBgsH360DU18HVzBap866fhrIu/CB0I7W
 XoPB87HK9lcv2rJwLV4zgObdM9QfaV5w1AxtsuGdmyMVE5wSf68laHKFjpligL9vMHu6
 7BLHkxQWyJi/UNP14+flG5cEwS1MGcJfGrueUrqWd3IeDXNU2K32xw0Y9CwJy2Iq5+5z
 QASg==
X-Gm-Message-State: AOAM533RFGJyc5lwx1Zgu1CcbUR2e6+X43nbf19Y5DWtnXV53qQCMjug
 2GVkyRo5eZxDPzDUgK+tAiLtZFmAj0xDew==
X-Google-Smtp-Source: ABdhPJy0MVYQlC2HO6XysCHIeX/Xq7qSFnw+YO8dwffQdnX5buPxbyefRKZ3lPTjvtMRUoBZRxHfyw==
X-Received: by 2002:a17:90b:104c:: with SMTP id
 gq12mr14709964pjb.11.1612752400727; 
 Sun, 07 Feb 2021 18:46:40 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/15] tcg/arm: Implement TCG_TARGET_HAS_shv_vec
Date: Sun,  7 Feb 2021 18:46:23 -0800
Message-Id: <20210208024625.271018-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index 875d975d4b..b088f61a99 100644
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
@@ -2422,6 +2424,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
+    case INDEX_op_arm_sshl_vec:
+    case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
@@ -2818,6 +2822,17 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2952,6 +2967,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -2960,7 +2979,47 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


