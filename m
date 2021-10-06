Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA2424268
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:17:49 +0200 (CEST)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9c4-0006BQ-7F
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j8-0002fW-Ju
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0007sc-5x
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id m14so2636023pfc.9
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVvehm3FcpREcf/ymRxa9v7J8npkrg1Lo2isI5dOjOM=;
 b=xEx7bd7RuNlCCxdmADy9qCkD0f/L65k+HcXLmgK7psbiMAjZmDOjlXydkP11Znm56p
 72rlbPzMMayaYkSKSKD7CQ8HNElMTS0sU8gz4bfH4YWs0IJUqWEWwiYm7vgXzCmn8T/b
 br6Ph6G2oZegtXa1ovyeNfMCmPh/P98B9cNATPJVzJiP1o4uwwDPfV8G6xVOk4x9UWNj
 ATMLGFtID1QwrHw7dafnvhVASIa8/ot3No3PiO385NMszJKSpV9XeLfrRg7g4IgPVe/N
 2ckYdGOf4s3Mf2Eh1Tn+rENq1GLx1gAf+pcSc1uUgjJrxgEthWzf3bEeO2LdEf9HwDQE
 a+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVvehm3FcpREcf/ymRxa9v7J8npkrg1Lo2isI5dOjOM=;
 b=grnayajPQKtlixdAm4d5ILwGRxtjyIT7sVCYG8Fp5itb0pgtFfL0rT0ZPHz1deVYVt
 ZbWuRFgK8qnY7q+0iqDhTgveq9BL4cModJ8YTgpRZFcn32BFUBPhjOlXDtAEzEeAPTjA
 Kqlg0kTvi9j6NE6kB/No8DDzPLdhn3KRgNRzjc9iEjYFU2eq/+6qsy7I588s7RA3XH1E
 NUFFszMP77vnSK49CxtjbhXdPBS04tbBSRvPpdAYgCGXp7KHUoBZmWeiSMU/6wpMiH/Z
 21eMEMAeMnRu1iCokKa05aSJ0PB/NgpVJbunY0l68/neQF2shlRZrXvcIKC16HQTCJjR
 4aBQ==
X-Gm-Message-State: AOAM530aqe9hOvhJEm+s53j41/kolc0NvIS0kdmgXUL0srJEh66d62m3
 sjE0tnc90cQzjQGySXk58R67zbWN2klmiA==
X-Google-Smtp-Source: ABdhPJzA7tiZWSMW7ZuR1egqruEaDMJcSfndN1Y9PS6/KyuD0JtPCXni09TfD22SKP+h1FadZL/mng==
X-Received: by 2002:a05:6a00:248c:b0:447:52ee:f646 with SMTP id
 c12-20020a056a00248c00b0044752eef646mr38490022pfv.75.1633533637930; 
 Wed, 06 Oct 2021 08:20:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Wed,  6 Oct 2021 08:20:11 -0700
Message-Id: <20211006152014.741026-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index d7d204b782..a79f4f187a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -156,7 +156,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 98c0cd5091..3b8fc62cd7 100644
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
@@ -2767,6 +2771,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2813,7 +2830,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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
@@ -3074,6 +3095,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


