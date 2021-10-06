Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0F4241D4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:50:49 +0200 (CEST)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9Bw-0001hT-Dp
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j1-0002bU-UV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8in-0007sN-DW
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id a73so2817618pge.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yURJ1ik0GjEsSALeYUz5nTAUu5MSO+3zBmZXX/TnoxY=;
 b=GWc4P77JyhAsYS/kQHL9P8JhFS+vNSTGmyzKjy/8dn5GVHIPjqFpbcyJnFdyEN6HK/
 rLMLM2BXaYg7j6P+pT6WEpynd/Yxx99nh6gIU/twLpXPB9NoYYbrEBlCVMYW0P7V+oOj
 criz5upAkITfQhoDfQxyjKP/VnnBx7hJ8aGgGSiM1m5gMBNCl+eeAKA2nlehWxAeGWiq
 7WUPJmP1dSKighbqEiZv5GNTL2dR/++Itx8XnOmW42jPRyjwVkPsD/wTODY3kSk9hgEU
 V034MeR6fxHPc7YIN+9x7tGBlyuULAfTS5+SA5P4/sJSncpVFPZshQQbdZVaTC1izeUi
 V85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yURJ1ik0GjEsSALeYUz5nTAUu5MSO+3zBmZXX/TnoxY=;
 b=k9j62YWFWTuz7rMapLSgxmTKFIQJDGOLbI1vNwExwZ+YE+nFSF6tbKjiDwrC1QsTTf
 frmAR7YkRBCph96zKtip0bJ2785cygl3j0OgllGDfXvwdFsCvFYi7sEAsKLPe9tkikme
 MA3A/DVY4tZxL65ukhbxQaUwizOgr01JEheFGZoTVimCbeUQIeNCnDCUgbxOA5483RlX
 7i4sJDl4NLdUyeM5ME0VFX2FzQzMQfi3JMP4R/keLd4BcsgBNScz6dLlDeklgKWbbKJI
 Fa0uXEGcMfpFtR1eztY1D2ZeVNgvzk/Vhp8PUq6uIE5cGJ3Omav/1hRqCM8evvvtMKBz
 4AAw==
X-Gm-Message-State: AOAM530Fev8UT5ceSkYElv0mkce6POGFIHyB1VdZYNUiRxDvK9Eg4llD
 Z3CrTQIu1wiCkd2H2aPIrlE8P2foq0saig==
X-Google-Smtp-Source: ABdhPJzzbWH5GudptrVw1+2li/dG8fhRviN2YYtCzIdUazxfruhHq4S19OP8b9nq2FFah8Mm/uUznQ==
X-Received: by 2002:a05:6a00:1344:b0:44c:4cd7:4d4b with SMTP id
 k4-20020a056a00134400b0044c4cd74d4bmr22583773pfu.50.1633533635831; 
 Wed, 06 Oct 2021 08:20:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] tcg/s390x: Implement andc, orc, abs, neg,
 not vector operations
Date: Wed,  6 Oct 2021 08:20:08 -0700
Message-Id: <20211006152014.741026-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These logical and arithmetic operations are optional but trivial.

Reviewed-by: David Hildenbrand <david@redhat.com>
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
index 063f720199..cbad88271a 100644
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


