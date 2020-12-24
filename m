Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1F2E291B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:53:20 +0100 (CET)
Received: from localhost ([::1]:48634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZTz-0002Gt-Jx
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMQ-0001zu-Oy
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMO-0008KZ-FS
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:30 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x12so1806083plr.10
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YY0z8RV2Q/d+lnHmoU8+JYxwxSAxRbYGWKYKV5OQat4=;
 b=m1J5i4zMi7o/NMX1f7J99TPc4xMAoyFlgNKnELX0+N/2/xxaoLEy+nFRJ1xstgKvPC
 vNA7Y8MUwpKKq6IOj6Hcq9ptJJhDq/vAPFdrBbk/QFDtga1Lxi9UlgqiYe8Le3plwfjX
 54APulUCj5UP4i8MipaOAJZmxx2OBlj5AAM45QqF0LFpPUn7SNGSC9qtWCfh8/0g5rj9
 89qzMajAP+9zgvoUFJEfXFVce1sJkv0Rsx5V9MLHXDOFOHwfFgD4H9O9x55t5ikvUw0f
 RPQbEbcEbc1yyeO17TO4vKM7g9dGod0BsCSAEKG2fQPFJffDXieYYJ5lRYu7wLPQB/Xl
 XwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YY0z8RV2Q/d+lnHmoU8+JYxwxSAxRbYGWKYKV5OQat4=;
 b=EEXEXze5fTbx07Pbr1s1s7neTiOn7jgaqO93SsFiBMrJOqWK2djUYvyNFutI0BxpNU
 916AzfSfc1Jkb88Vuz6yrpIdK3WfeorBDu6/hB/jYdOH6GwEw1dJFaVzBhXYsMmnOIjl
 XBiCuhNDTwLaF58LwqKf8KjOcE99BY8i2BCE3WTZWdRmBn5M7SToKU+bxPasiC5jXDt3
 ivOuHP6vgYgV3H18bizJ2QJmkOMkzaw3NR9QodBaACQN3UgfjYv7xZmSY4r660vuO0lF
 A5hCgEVOVZnbTSRBBM4R7kg9qvpDE2//09XeXL0bTvpKwNS+iH4a6OUToJHwfxj7iptl
 Pzjw==
X-Gm-Message-State: AOAM532bbJkuN8P7oT51SBaM08tbYfcfYnbEkNOuG3szCF6uqbZWLvq+
 mmouRwIEk5n+2lw/Byrdqsi3Sq9QjhytAw==
X-Google-Smtp-Source: ABdhPJyZFWmu5EGwn5Ym3GnUIocebw7xGSbC8xVcJGnwKQryavPfdv02oz6CB4REw7UQnFt53brA3A==
X-Received: by 2002:a17:902:694c:b029:db:d939:1061 with SMTP id
 k12-20020a170902694cb02900dbd9391061mr31369975plt.80.1608849926850; 
 Thu, 24 Dec 2020 14:45:26 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] tcg/arm: Implement TCG_TARGET_HAS_sat_vec
Date: Thu, 24 Dec 2020 14:45:09 -0800
Message-Id: <20201224224514.626561-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
index 8e5b304a5a..c41dea2b03 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -166,7 +166,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
 #define TCG_TARGET_HAS_mul_vec          1
-#define TCG_TARGET_HAS_sat_vec          0
+#define TCG_TARGET_HAS_sat_vec          1
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
 #define TCG_TARGET_HAS_cmpsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index d11efc553a..a6d9ee929b 100644
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
@@ -2373,7 +2377,11 @@ static int tcg_target_op_def(TCGOpcode op)
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
@@ -2743,6 +2751,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2853,6 +2873,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


