Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998283129A2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:12:34 +0100 (CET)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xub-000709-M1
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdw-000890-EH
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:16 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdu-0001MC-Mb
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:16 -0500
Received: by mail-pl1-x635.google.com with SMTP id u11so7010060plg.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XkT/fAMq7fP12/ZBZ5fx+qLL9TNYOIdrJVXalZ7l+Is=;
 b=uf1pwVbep8YNkZbsl2Sir0qok6hEreYkSr4vHtfBVwZSSWsHyLqHpR1TYhY+3EjNRh
 iGx/atXFuuQBUfVfiuWhHUhJBzxvFVg7yBI90kj6BEVeIaq//WY316xPjelrYEYOBmqG
 Duv3/YSYFAcUXyKTOtmRgHFWr0iAx6SIZIrIug4MJzw1bkYLv3wZ9O5sa0VoMVWuo4PY
 L+12NYFnT/C3h7C0cCXpxO50jGSfBMxSKGb2lkpAksGIko+mpozFi4W+l1AFifVTbfMy
 R/PnWMCYTaoM5U6EgGYGNusNyqLJKDD7teTImKq0w2O+UulojNSBkU8TXBVR2K9FcpdS
 /IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkT/fAMq7fP12/ZBZ5fx+qLL9TNYOIdrJVXalZ7l+Is=;
 b=U26ioJQaLA906DYAOICEFSRm4CmphTUv+QaUK1cuKRoMh0hQUmEpQCz8d6GgzoADUr
 8vyFmlDKePxfeXp+CyB2zaiFK4H9x0eTKWNUM7Ltw5Z4S04p094PFw4F6peOBoMYg9Vs
 78Hz69HPbCNQ3DCzf1Wq1Xek6/KkxZgAli1jS0tVDYYjm6NvLdSRTN9djr+NPBCoJR2g
 4u3H0qYl2SAWpqXpiC9gOrNCtAvN/ibUnVKiCI2TYa+M2I4IVE5Q4yKSh/Xwbs09jfv8
 1NTYg/2Yh/MNaqaQGAKccV82mgZqdvYz1uZ9eyoeeegTNI2bngoyYMxvHKYgD1JnoLT7
 pz4w==
X-Gm-Message-State: AOAM530ZDMOCHUEckmY+P0VNGjZE+o4it+pBVDGhcd4hIUKBhD8w6XD2
 yMxpW3ASmfkgXynlDSISj7RJuv8BoBhMpQ==
X-Google-Smtp-Source: ABdhPJw/iewNzSZB8wXkab2aZ2oR9QRA1BTXIKzEwZJlct3UN3I6f+CM6WdDfEvY3JBduJ7lU8olkw==
X-Received: by 2002:a17:902:a9ca:b029:e1:b3e:406c with SMTP id
 b10-20020a170902a9cab02900e10b3e406cmr14421443plr.84.1612752673469; 
 Sun, 07 Feb 2021 18:51:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] tcg/s390x: Implement andc, orc, abs, neg,
 not vector operations
Date: Sun,  7 Feb 2021 18:50:54 -0800
Message-Id: <20210208025101.271726-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

These logical and arithmetic operations are optional but trivial.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         | 10 +++++-----
 tcg/s390x/tcg-target.c.inc     | 34 +++++++++++++++++++++++++++++++++-
 3 files changed, 39 insertions(+), 6 deletions(-)

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
index e8659bf576..dd11972ed2 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -140,11 +140,11 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_v128           HAVE_FACILITY(VECTOR)
 #define TCG_TARGET_HAS_v256           0
 
-#define TCG_TARGET_HAS_andc_vec       0
-#define TCG_TARGET_HAS_orc_vec        0
-#define TCG_TARGET_HAS_not_vec        0
-#define TCG_TARGET_HAS_neg_vec        0
-#define TCG_TARGET_HAS_abs_vec        0
+#define TCG_TARGET_HAS_andc_vec       1
+#define TCG_TARGET_HAS_orc_vec        1
+#define TCG_TARGET_HAS_not_vec        1
+#define TCG_TARGET_HAS_neg_vec        1
+#define TCG_TARGET_HAS_abs_vec        1
 #define TCG_TARGET_HAS_roti_vec       0
 #define TCG_TARGET_HAS_rots_vec       0
 #define TCG_TARGET_HAS_rotv_vec       0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 08315c7b05..23c25ff619 100644
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
@@ -2634,6 +2639,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2643,9 +2658,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2676,10 +2697,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 {
     switch (opc) {
+    case INDEX_op_abs_vec:
     case INDEX_op_add_vec:
-    case INDEX_op_sub_vec:
     case INDEX_op_and_vec:
+    case INDEX_op_andc_vec:
+    case INDEX_op_neg_vec:
+    case INDEX_op_not_vec:
     case INDEX_op_or_vec:
+    case INDEX_op_orc_vec:
+    case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
@@ -2908,10 +2934,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


