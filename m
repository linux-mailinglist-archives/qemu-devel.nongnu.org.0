Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E00371FCB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:38:54 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddT3-0001Su-3E
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQC-0005l4-Ou
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQ6-0008H6-Dk
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:35:56 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t4so2536403plc.6
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jn+9DEVE6ts17GjM4PSKhP/k3JQqoVYnVixRsFingkc=;
 b=TT3RU/LZG9ML2NtwQOAyGf+cBuG46089SxDHog+ShLMTHjxk91o/ys46fY9/VkxlZQ
 SyX/s2paIQWSXfQuXiFzpRHewKyx/SZ6H//PrzWJFkMgzE7EwuNuhm2yFiGFaVJdUOhm
 dRv2FFbfvwxlZgAYqpQsEl7Ick88s535oiDmwsRyFlI4zVCVHs/snt3/OpcD54V5PAEk
 U+vV9Bx0jQe022+4EEK8SMukETwmyj1x6b9A1hXAv+qRd81Yuv9X0klxiQi4dV2drhc6
 73h727KcxKeDa8+fsgEosbqdrtvhtb3fVpfIqVkeqso1tgWXOE7ZGjV/Zb/ynFXLSpD0
 8RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jn+9DEVE6ts17GjM4PSKhP/k3JQqoVYnVixRsFingkc=;
 b=WpK5KoH2gWYaffVdtnY2KS1DOn996TcnQHy8oPw5w/+qdYSWsTWOyJ3wmXWBH5iT+P
 fE7QNsL3Wyz+OHhAFsxdw1Vm4BxHeswtuJNSCSX2gHTry6+hglcQe3VXM28zXFCELwIH
 oUX9CjR5DOes4yQgHt28GdMwIiQiAmMoZ2jbBMQTizq9iiKf0olgNYGGpf5Co0JPcyka
 tFy40sbfCicqfNV9Mgl6GmBjlS0yCp/ZH72JXqD5pdsRPAmfP04t6yMcZa+u7ldLgrMu
 An4EyfMOkas2D1d7vvFtvlnIzH35OdLoSBXDsdRY6ln58V35gFPublg+u/HUPuOs864M
 45/Q==
X-Gm-Message-State: AOAM532H+3smr+IcGQRTMH4+izfPeUgLmWzhUs1nBlAvnH7UqbXIdLG2
 wHGCyIENPWiy5g9+PMEJo6jFgGUu7PNfEg==
X-Google-Smtp-Source: ABdhPJyixiz1SoXb9FiSOC5q4OUG4jpRLaUAz1ZDVKxjpzBKAYNGpMKrOkh6tNutPe5Olh/NBoFdwA==
X-Received: by 2002:a17:902:be02:b029:ec:af1f:5337 with SMTP id
 r2-20020a170902be02b02900ecaf1f5337mr21233848pls.35.1620066948518; 
 Mon, 03 May 2021 11:35:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/16] tcg/s390x: Implement andc, orc, abs, neg,
 not vector operations
Date: Mon,  3 May 2021 11:35:34 -0700
Message-Id: <20210503183541.2014496-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: thuth@redhat.com, david@redhat.com
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
index f84330af1c..aca2dc358c 100644
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
@@ -2635,6 +2640,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2644,9 +2659,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2677,10 +2698,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2909,10 +2935,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


