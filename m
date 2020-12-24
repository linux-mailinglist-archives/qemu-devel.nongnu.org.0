Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB72E291C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:55:27 +0100 (CET)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZW1-0004NL-7U
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMR-00020V-5k
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMP-0008LV-BL
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:30 -0500
Received: by mail-pl1-x635.google.com with SMTP id g3so1829995plp.2
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IZbCguoR0lCTKpaO3TpyZzkmWXelNo5E8yAqSlIyuXI=;
 b=eBU/3SXLc30HBuVQ/e/A5masB6AVmsWaMTxLWzSVWHWiEOVqn9c8wQPKVNIy84nS8N
 t0eSzZbJSH2hnS9N4tYjA3skm7b3JjYAqJf+obzqn4bFGpcs1Bl2+beN+B+iihBXWICD
 RPlSCGmf67TQf1Xbr+pmoKYIw5rtxLTkJFobBsDtj/OLuiCEOSW3fsMwQNg3IrCgZqH1
 jaxQal5hhomMsnTwxGVuFEJFF3FkGDVGTaq1hQiw8/62p4lUM2VKPMnia22W6EusD1xr
 DhG4Q3ZMKYGgfhu/+/hZLl9c+QyKa456b3uGZaRiuMEHQb92dmmKlMFXKJdpafuZy3+y
 Dywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZbCguoR0lCTKpaO3TpyZzkmWXelNo5E8yAqSlIyuXI=;
 b=G+lNxNnml/LsPA+01xD0KPVCY20rFCEzlXdhg+D7j/dEHqlzt1XX4iU96xUGaG9Phl
 Wbd8+pr/rHVe9xDEKB3VAxy6S0RMYUqPwtqYODiKVVJNH7olxw/44PdPSWQi6Ly6nmej
 HwmDCqx3oHcjRTrTw8wnCh0RnBmkF+DEVjISHOiMUeq8lWBONPNxCbxhGKjwiD6ujJBb
 ngtegnOkyGcaxB+KObTYp3z4Mjw2z/6jd/KfbSA7iFTEFnYkmyYCUSA9X4b+WdxlJ4w1
 LrBuoOU1xD90ElRpV+pPwIV0RRJXjHkKVkK2QyI+pqe0G54+VdtydywzmMPQW5yNelPS
 iDyQ==
X-Gm-Message-State: AOAM533CRSCV/uVAB/JdXNB8/MIQ2slR5vKulmuiKWe+k9Al4KjBezac
 +uofWljKv5t+PvsPXJebzFbV9e54cPeYsQ==
X-Google-Smtp-Source: ABdhPJyDKTC84QA/dNUJE2lThA2vKLYrvV6hp+f9m4U/CtFmyAK3CKhIOS/ocKUZB9i80vDg2mglOw==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr5975739pjb.111.1608849927875; 
 Thu, 24 Dec 2020 14:45:27 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
Date: Thu, 24 Dec 2020 14:45:10 -0800
Message-Id: <20201224224514.626561-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
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

This is minimum and maximu, signed and unsigned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  2 +-
 tcg/arm/tcg-target.c.inc | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index c41dea2b03..e3c533f00f 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -167,7 +167,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          1
-#define TCG_TARGET_HAS_minmax_vec       0
+#define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
 
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a6d9ee929b..6e17082df2 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -191,6 +191,10 @@ typedef enum {
     INSN_VQADD_U   = 0xf3000010,
     INSN_VQSUB     = 0xf2000210,
     INSN_VQSUB_U   = 0xf3000210,
+    INSN_VMAX      = 0xf2000600,
+    INSN_VMAX_U    = 0xf3000600,
+    INSN_VMIN      = 0xf2000610,
+    INSN_VMIN_U    = 0xf3000610,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2377,9 +2381,13 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
     case INDEX_op_mul_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
     case INDEX_op_xor_vec:
@@ -2748,6 +2756,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mul_vec:
         tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_smax_vec:
+        tcg_out_vreg3(s, INSN_VMAX, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_smin_vec:
+        tcg_out_vreg3(s, INSN_VMIN, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2757,6 +2771,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sssub_vec:
         tcg_out_vreg3(s, INSN_VQSUB, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_umax_vec:
+        tcg_out_vreg3(s, INSN_VMAX_U, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_umin_vec:
+        tcg_out_vreg3(s, INSN_VMIN_U, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_usadd_vec:
         tcg_out_vreg3(s, INSN_VQADD_U, q, vece, a0, a1, a2);
         return;
@@ -2882,6 +2902,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_cmp_vec:
     case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return vece < MO_64;
     default:
         return 0;
-- 
2.25.1


