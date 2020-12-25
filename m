Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABF2E2C55
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:28:31 +0100 (CET)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksthP-000351-1H
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZM-00033x-6l
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:12 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZK-0005CO-8n
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:11 -0500
Received: by mail-pj1-x1032.google.com with SMTP id f14so2675603pju.4
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KrVLDx19b/T9Urp9g1W3X5Yu2LdiB/68xltM+LHapo4=;
 b=rkNrlHPnllfAoyKWtC+YnhzHKlp6qk/IQXDQAVRGbO36/DaaRtHIPe0F68cTczq3Q6
 2YqDRHOP9qC9HMUvj62qo1hEpzEwEhmTpXstu+UtefYpcHExyWA7k27C9Diu2WK4rhIa
 enDHOtJkQ1NqeOd/z9LWnRKP+oA5b81H/QoX2gNHF2hoLdSTYwRrsmUL4d2jGjneP7uh
 AKjh2D7a18nHszVmSD0TmBSsbNTdxfAC0+bMKzFzBUFrXdvnMkne8l/2zbgNjqth+CSl
 sutpAQ5wMnRVV2ljo1SWWZuPUOIStcpPRlSKEqaT0S+fSQkNFORN79VupWghj/LZm9Lq
 xw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KrVLDx19b/T9Urp9g1W3X5Yu2LdiB/68xltM+LHapo4=;
 b=IrDrfHhSD4ew8sXZhd7vawDhqu+dBbLQjjLkFXDLWFwqN+XTWGg0scEIpST1d5N3s4
 8AkP2UCsJcz0NZX9KUiCe2ofvMCHupl3nt+39ak52E/bpo/bZdaoC+5Fmsxj0O4L5zXB
 zdIXvyJ6cR72+RO9qSOXIR8CK3b/+eTU8oM+AAMn3yxAvTz5/aiwQ6pR5ChBCQhSAcJk
 aC1yq0WTA65gT9fjqBaYnMeCC11cSh8/QgYd2pT5uNbSyEznNczT0wime21eICLrrYkF
 cF2DoEJL1evcm5hvyc9cRrdjOd3lvJ4Q0PA6bupKZFW+l0X1f/fXFStQtwAxqBbgyK5G
 mDFg==
X-Gm-Message-State: AOAM533UwRrnwYyRXargGUGGWvO/kUSXQvIm8zXcvQMktYe4DAPHxbhh
 oS4mnXbajbMocUy+T27EZQOmxImDOK54sA==
X-Google-Smtp-Source: ABdhPJz3OlUKdPyR0JomVXdyn5Wu1h9rouShZryeBBPm5sNxwgl/qX5gRIXRS+sSa4XYfV0v8MNu0Q==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr9903767pjb.162.1608927608711; 
 Fri, 25 Dec 2020 12:20:08 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] tcg/s390x: Implement andc, orc, abs, neg,
 not vector operations
Date: Fri, 25 Dec 2020 12:19:49 -0800
Message-Id: <20201225201956.692861-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 tcg/s390x/tcg-target-conset.h |  1 +
 tcg/s390x/tcg-target.h        | 10 +++++-----
 tcg/s390x/tcg-target.c.inc    | 34 +++++++++++++++++++++++++++++++++-
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/tcg/s390x/tcg-target-conset.h b/tcg/s390x/tcg-target-conset.h
index 88d1ec349c..c44d5f181c 100644
--- a/tcg/s390x/tcg-target-conset.h
+++ b/tcg/s390x/tcg-target-conset.h
@@ -12,6 +12,7 @@ C_O0_I2(v, r)
 C_O1_I1(r, L)
 C_O1_I1(r, r)
 C_O1_I1(v, r)
+C_O1_I1(v, v)
 C_O1_I1(v, vr)
 C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index e61c376673..f4a1de931a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -139,11 +139,11 @@ extern uint64_t s390_facilities[3];
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
index d4a5783c1c..6c16ae0fcf 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -255,13 +255,18 @@ typedef enum S390Opcode {
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
@@ -2630,6 +2635,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2639,9 +2654,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2672,10 +2693,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2904,10 +2930,16 @@ static int tcg_target_op_def(TCGOpcode op)
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


