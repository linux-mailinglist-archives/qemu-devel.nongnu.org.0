Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F2312986
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:47:23 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xWE-0008DN-RT
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdz-0008I2-SU
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:19 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdy-0001Ok-5G
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:19 -0500
Received: by mail-pg1-x532.google.com with SMTP id m2so2538966pgq.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bmajfo6ax0mEWHKQooz62P4LLatAA1i50E2HiY5O+rQ=;
 b=JTstdp7+PExM2THqeNbti1bDT0/KE0TfHYnYyt6LQOVGsqI1k6Ma+8Zj/2bnHnyeAv
 RIAocpgfXvbweDSpC7+XUzKQtTt66fHkeIGkgshphrNSnkJLIB8jLOoqSV2vAAhwsa0Q
 UbSbsYPREi+xBtTceJ8IMtdtaHrVefJhCX7BSAqYcyKPAiOVfC+OnoGZuQuAczVAEEWv
 M+sz1jhAj8II6sXe0TNudJwLAkfX4LO2mMQp16WbptIalt3+4CsHz48O35KkGskYEeOw
 fB36MRWnoO5kDqTnWQCjoPR0Ir2hfKMuiB6i0ITsqhPMQkd9VmPTTctEojVg2yUDks/x
 2utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmajfo6ax0mEWHKQooz62P4LLatAA1i50E2HiY5O+rQ=;
 b=kgpR0s6Zw4tJ1wUmTH8QVQkTPLXlS0/qH/cm21npbTLMSiNAmCvVtncbPnpGBgGC4w
 AUJQm4YAosu8Xm9FiI/oh3n4RxwIFjsoZblQydcmy/xSHP+aCEsRCnqVmRQqhFEakgtb
 q2Rx24nUIHjhPzW8hVRuxFgpNl4/47TT4PA94pqUwAMqOu+S7ZW7Ngq+kZvsM0xduxlR
 FNcklF8bf+lmllTfymm16i2T/g9cCTRhOJq4Y8qM45r7CPSICv5yrAk00R3pRzYHOttl
 aToV6biyWGjy3qmcs6oSENrnjiVfPi45/QLZd0r49twcbjL99n6llbuvWy1Hl4egISqV
 ODKg==
X-Gm-Message-State: AOAM533WFft5JjlMZhTfVvBy8ExUq/93llJzDmV0/OwxDUUcgdpwO7C5
 pago4HnPz5fkjn5RzhUXfSz6imqbOfh1Sw==
X-Google-Smtp-Source: ABdhPJySKHUjJk71EfjGeIOJISOMT7NcGSRicrntOpDkLxbIpsP5x8HFmIWV9n7eRMwHpjtLEDLmtA==
X-Received: by 2002:a62:52d1:0:b029:1da:1371:20b8 with SMTP id
 g200-20020a6252d10000b02901da137120b8mr8769277pfb.73.1612752676759; 
 Sun, 07 Feb 2021 18:51:16 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Sun,  7 Feb 2021 18:50:57 -0800
Message-Id: <20210208025101.271726-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 3026a4d8c4..efa32f348c 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -153,7 +153,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 22a6f18cc4..3bf49e6c90 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -282,6 +282,10 @@ typedef enum S390Opcode {
     VRRc_VESRAV = 0xe77a,
     VRRc_VESRLV = 0xe778,
     VRRc_VML    = 0xe7a2,
+    VRRc_VMN    = 0xe7fe,
+    VRRc_VMNL   = 0xe7fc,
+    VRRc_VMX    = 0xe7ff,
+    VRRc_VMXL   = 0xe7fd,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2732,6 +2736,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VERLLV, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_smin_vec:
+        tcg_out_insn(s, VRRc, VMN, a0, a1, a2, vece);
+        break;
+    case INDEX_op_smax_vec:
+        tcg_out_insn(s, VRRc, VMX, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umin_vec:
+        tcg_out_insn(s, VRRc, VMNL, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umax_vec:
+        tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2778,7 +2795,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shri_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_shrv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
@@ -3039,6 +3060,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


