Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1190931299A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:59:27 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xhu-0007JF-5a
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZV-00040x-7H
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:41 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZS-000085-R9
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:41 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k22so2658262pll.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vQVeOmFmuH7vnw0L5xO4yDxlWUnTVLCXCuC+IDDzYS0=;
 b=Xc5m/PrMeSKhVl8JJ26ORsr/n743LPgenP/zxVC2ZI/Ne3yfXsRkgrNJS+L0A2WtJf
 BX/Kw8PmE1E27+QaM53IdJdFZXkMOb6ZBqh15Ii6Paj0Dw530ymuAPDksZZY52fOqgDd
 Dgdx/TALjM0XJ/8fGauJNj6njQmXxHfRBpl24RtYLVQ8dGMrbvkZpIqkwLhSihl2sIvT
 tEMehkfZfFfzMiEHFyRlgWEvAvVCiYgqwWVukTQQTSZ2WAgVP6qCnWHcSaNyfzfKdnoo
 lv3AqSBCBljd0Ila+gsBDHj8wungRImmqWT6F3IEndRz7EzgsJhiSZq2py+EAB0YxpG0
 NH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vQVeOmFmuH7vnw0L5xO4yDxlWUnTVLCXCuC+IDDzYS0=;
 b=r+C5kHeXihSZSos5xtLoaJ8mL1kwBDd17d3fTPN7x+Yj1WcJVg0SQjhI5A0JaQ/L5h
 HPZsmKRcrtjdlZLuYAmzZNPTZwzbjgU6u3NU/Jh56SUqq24MCoDFUaHEsWiDUUBj5XPa
 pHIa2n9InZSZr8J0X2EwD6hWNykTrg1rpaYvXIRR0R2W3xc6VEbB9nLPFAUVENNwnaxP
 wdPox/IAWVMAzadyBy/O8Kg4RtZe9jGDAQQihyJemdG76RJ2955jNbC4bfzrwRvcqraI
 0ulmhnoervd/uL3YgufLtfI/DPQw7SLcgerairaQ5ZtkCsQwOzTczulHzaSgYRAqFQhe
 VSgg==
X-Gm-Message-State: AOAM531RXEBhL2+cJuMv7EsEYPPFfFhWrcowQBik8gOW0KGfA5IH5d4B
 hghBqBZHMko21VC4i9bPdAUm3HN5kWhJPQ==
X-Google-Smtp-Source: ABdhPJxZmfaAODcvBnBlPUc+29Q9srI8JZtV5UlhAZSXNWIAjUl5HNQr+a6/Xuyy6uVwW6p2JLtR2w==
X-Received: by 2002:a17:902:b285:b029:e1:5b44:454 with SMTP id
 u5-20020a170902b285b02900e15b440454mr14353285plr.54.1612752397611; 
 Sun, 07 Feb 2021 18:46:37 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] tcg/arm: Implement TCG_TARGET_HAS_sat_vec
Date: Sun,  7 Feb 2021 18:46:20 -0800
Message-Id: <20210208024625.271018-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This is saturating add and subtract, signed and unsigned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 94d768f249..71621f28e9 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -167,7 +167,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
-#define TCG_TARGET_HAS_sat_vec          0
+#define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 104da57828..a4c398417a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -187,6 +187,10 @@ typedef enum {
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
     INSN_VMUL      = 0xf2000910,
+    INSN_VQADD     = 0xf2000010,
+    INSN_VQADD_U   = 0xf3000010,
+    INSN_VQSUB     = 0xf2000210,
+    INSN_VQSUB_U   = 0xf3000210,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2400,7 +2404,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_usadd_vec:
+    case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
     case INDEX_op_or_vec:
@@ -2770,6 +2778,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_ssadd_vec:
+        tcg_out_vreg3(s, INSN_VQADD, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_sssub_vec:
+        tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_usadd_vec:
+        tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_ussub_vec:
+        tcg_out_vreg3(s, INSN_VQSUB_U, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_xor_vec:
         tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
         return;
@@ -2880,6 +2900,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+    case INDEX_op_usadd_vec:
+    case INDEX_op_ussub_vec:
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
-- 
2.25.1


