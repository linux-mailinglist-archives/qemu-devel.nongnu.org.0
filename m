Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEF31296B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:35:08 +0100 (CET)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xKN-0000r1-An
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZT-00040e-9M
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:41 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZR-00007w-PA
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:39 -0500
Received: by mail-pg1-x529.google.com with SMTP id n10so9252805pgl.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/AzDllaOuL4/tCcbjroolDQHo5rSKdBK4IPEUTo/Uds=;
 b=SeY4KXchtT4+uv9ayHeamUlIclt3KOlghHukNVX+9Rst/9+koKJPeVaEF11uSEttll
 wsWM0vN/SSt+jxQTHeCYCx8wREGNDk8mkXWm2MNd3OhM2bcoWDrnurjM2t6kcepqwXeV
 rYVWljj4KzlCzJBTsHVIPCttFLbA/QAgI9Yqi8Bu5dVwrSQEdJHqdSX7pJKYtmZFbPd2
 zqvHefTMelRmMpXBguPVUw4ar0SUrVd3LDgu0hiIQV40jMZGz0TUkyegibTKzoFeGIvC
 U9iECSooEX/uB3OllecCaOaqeeBv41Bi8PlNcuxEqGvFb/L41cqVjVhjAraZmUe7rEaY
 JUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/AzDllaOuL4/tCcbjroolDQHo5rSKdBK4IPEUTo/Uds=;
 b=XOX4dEePZbICRPWOnILz4Z/HqCfERCsaVhenAsObpfaxOAwmlWw43J6rKi6fcED8AT
 0+zwEZKWmws3BCaewRJnmHK9+zPIf2vBZg2003wH1tMMKwoLnztt+ULHOBBtPbiilh+9
 H04VQQP25IpcgFpItVmQn/19FnMAiIF2Z8iqWLUIVsW1B8ka2p0DP7wjPwBMcmXIfry0
 nbnI4K1b+FhnWrZATq4h+PIqj2lIsSOU5NC6vLCXT+CZ/D+XUxeYs5rG5CtsyYVvy+qE
 8YY6WmD33yvPTSg6RwHT7INRW3nzYQj5wE3ccuIcfcmJnDZpUpzmujuSRSkX5xvZtpDR
 PYMQ==
X-Gm-Message-State: AOAM531DjqeIvZtd1kzgcm22VPF6PoD2nQrUzTZJ3k0MZhZrHzuncqm+
 y3YRvED+svmiwW7ImDxVnlgqT4bA3CJmVQ==
X-Google-Smtp-Source: ABdhPJyakokRFQJYbpPthiGhzP49Te9HzrDDRnYG4gV+zd/mrFGE/g1yHFePZt0f096y47gh9aA/tw==
X-Received: by 2002:a05:6a00:15d2:b029:1b7:30c1:8495 with SMTP id
 o18-20020a056a0015d2b02901b730c18495mr15558544pfu.32.1612752396576; 
 Sun, 07 Feb 2021 18:46:36 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] tcg/arm: Implement TCG_TARGET_HAS_mul_vec
Date: Sun,  7 Feb 2021 18:46:19 -0800
Message-Id: <20210208024625.271018-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 tcg/arm/tcg-target.h     | 2 +-
 tcg/arm/tcg-target.c.inc | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index cfbadad72c..94d768f249 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -166,7 +166,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
-#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          0
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 22cf44263c..104da57828 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -186,6 +186,7 @@ typedef enum {
     INSN_VORN      = 0xf2300110,
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
+    INSN_VMUL      = 0xf2000910,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2398,6 +2399,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
@@ -2762,6 +2764,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_add_vec:
         tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_mul_vec:
+        tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2878,6 +2883,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
         return vece < MO_64;
     default:
-- 
2.25.1


