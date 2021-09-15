Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2928C40CEED
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:36:20 +0200 (CEST)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcZn-0003lZ-0E
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV9-0003lK-FU
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:31 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV6-0003MO-3q
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:30 -0400
Received: by mail-pg1-x531.google.com with SMTP id s11so4046714pgr.11
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1RnkvAZwO6WCjxNyzvr+0rpjDyxEsUj9prSkADd+q8=;
 b=iFuFb4ytpeDel/VSS/E8YCfUYnTvVuERzremGcnR50lXUKk/k3ulBzNf0STA5NLT28
 PXRGqvv1GLzZ8JoT0jzEg2GBaE7ydQHZU1R/hTwRIBrbA7mnXGAR3oIKwZnbON06FQa4
 hPWJ6kHKxIGinJnpxDyXwf7rMwIMdZisVSrhaawA89/TIdtXFNjPEOFv5SZtgunCl+do
 BVXdkp8C1qwiLuC2SE4MIuO72rkob795lxVHtBH2k7ZBV/5MhbQTfajv39c+5KwTGi3M
 djqu9rCf+pBuwBWhhnLgeHAP5OS8r8X5lJlnrcK3u2spN/WkPqP5gKPYiW90Ot5EqLxz
 LMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1RnkvAZwO6WCjxNyzvr+0rpjDyxEsUj9prSkADd+q8=;
 b=aHsqPAaguOofpN9qPF9uIwATtSo5UVmS5er1n/FZ5+HO0Q/OlsvZGUCDxifD6T6EMm
 yeHt1r/YQ9r/9V/XPR/DEm9pjc+W7dMjx2Gw9OuGww98mB5tA5vG1j8M/hleQL+Z+RqY
 M4e185y0ShwfgFyDTsctadAwfSpV+ya404KI6YXwde5V9PI6TEJ61mseh+09qAg4ndtG
 fSt1p6N14bD5Hy9kl1G0yQKfbPXlxVsmW2zvaDCJHut1vGyYVaRdnfatnhijblYZJN9h
 r6Ck+mGVzuYqwmDsA6ckyoX5PuYNGJrMIiAgoB2aGpJctk6kRTJFqiE1umGShl4UHyOp
 l3qw==
X-Gm-Message-State: AOAM5315HXjKhZHz28+d9ak2TDdjQPwO+oZelcAqDbb+IKkOsSC3H+9W
 1EK3dJp+y9hF8mrkSNc+L/SjhsuIZUWvWQ==
X-Google-Smtp-Source: ABdhPJzt/HMqruSSBzk46t2TxrWc1itcs1wg3H1zuEgHJ8KeVkhLG/MbEgrQnKfpSS3CzQTQ9NiOGA==
X-Received: by 2002:a05:6a00:4:b0:440:6476:bcb4 with SMTP id
 h4-20020a056a00000400b004406476bcb4mr236014pfk.0.1631741485690; 
 Wed, 15 Sep 2021 14:31:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/16] tcg/s390x: Implement andc, orc, abs, neg,
 not vector operations
Date: Wed, 15 Sep 2021 14:31:08 -0700
Message-Id: <20210915213114.1923776-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

These logical and arithmetic operations are optional but trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         | 11 ++++++-----
 tcg/s390x/tcg-target.c.inc     | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index ce9432cfe3..cb953896d5 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -17,6 +17,7 @@ C_O0_I2(v, r)
 C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
+C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 5a03c5f2f4..a42074e451 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -64,6 +64,7 @@ typedef enum TCGReg {
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
+#define FACILITY_VECTOR_ENH1          135
 
 extern uint64_t s390_facilities[3];
 
@@ -142,11 +143,11 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v256           0
 
-#define TCG_TARGET_HAS_andc_vec       0
-#define TCG_TARGET_HAS_orc_vec        0
-#define TCG_TARGET_HAS_not_vec        0
-#define TCG_TARGET_HAS_neg_vec        0
-#define TCG_TARGET_HAS_abs_vec        0
+#define TCG_TARGET_HAS_andc_vec       1
+#define TCG_TARGET_HAS_orc_vec        HAVE_FACILITY(VECTOR_ENH1)
+#define TCG_TARGET_HAS_not_vec        1
+#define TCG_TARGET_HAS_neg_vec        1
+#define TCG_TARGET_HAS_abs_vec        1
 #define TCG_TARGET_HAS_roti_vec       0
 #define TCG_TARGET_HAS_rots_vec       0
 #define TCG_TARGET_HAS_rotv_vec       0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 28729b6ffa..fa4a142818 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -270,13 +270,18 @@ typedef enum S390Opcode {
     VRIb_VGM    = 0xe746,
     VRIc_VREP   = 0xe74d,
 
+    VRRa_VLC    = 0xe7de,
+    VRRa_VLP    = 0xe7df,
     VRRa_VLR    = 0xe756,
     VRRc_VA     = 0xe7f3,
     VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
     VRRc_VCH    = 0xe7fb,   /* " */
     VRRc_VCHL   = 0xe7f9,   /* " */
     VRRc_VN     = 0xe768,
+    VRRc_VNC    = 0xe769,
+    VRRc_VNO    = 0xe76b,
     VRRc_VO     = 0xe76a,
+    VRRc_VOC    = 0xe76f,
     VRRc_VS     = 0xe7f7,
     VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
@@ -2669,6 +2674,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
         break;
 
+    case INDEX_op_abs_vec:
+        tcg_out_insn(s, VRRa, VLP, a0, a1, vece);
+        break;
+    case INDEX_op_neg_vec:
+        tcg_out_insn(s, VRRa, VLC, a0, a1, vece);
+        break;
+    case INDEX_op_not_vec:
+        tcg_out_insn(s, VRRc, VNO, a0, a1, a1, 0);
+        break;
+
     case INDEX_op_add_vec:
         tcg_out_insn(s, VRRc, VA, a0, a1, a2, vece);
         break;
@@ -2678,9 +2693,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_and_vec:
         tcg_out_insn(s, VRRc, VN, a0, a1, a2, 0);
         break;
+    case INDEX_op_andc_vec:
+        tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
+    case INDEX_op_orc_vec:
+        tcg_out_insn(s, VRRc, VOC, a0, a1, a2, 0);
+        break;
     case INDEX_op_xor_vec:
         tcg_out_insn(s, VRRc, VX, a0, a1, a2, 0);
         break;
@@ -2711,9 +2732,14 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 {
     switch (opc) {
+    case INDEX_op_abs_vec:
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
+    case INDEX_op_andc_vec:
+    case INDEX_op_neg_vec:
+    case INDEX_op_not_vec:
     case INDEX_op_or_vec:
+    case INDEX_op_orc_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return 1;
@@ -2943,10 +2969,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I1(v, r);
     case INDEX_op_dup_vec:
         return C_O1_I1(v, vr);
+    case INDEX_op_abs_vec:
+    case INDEX_op_neg_vec:
+    case INDEX_op_not_vec:
+        return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_and_vec:
+    case INDEX_op_andc_vec:
     case INDEX_op_or_vec:
+    case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
         return C_O1_I2(v, v, v);
-- 
2.25.1


