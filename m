Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F439C13B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:23:02 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGLN-0004ki-Kk
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB9-0005xu-MR
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:28 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB2-0005NL-M6
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:27 -0400
Received: by mail-pf1-x436.google.com with SMTP id x73so8245422pfc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzTCotQYpv54FQEtObhJ5kr381PzZffGPK0hbe7ubUA=;
 b=sApfiLUixHwMVn3xFXTw56faSLRckixYZ5pS5C2J5UZXYxJkawuGAB5kyyqEgzU1mD
 FW1k9txIM6HcEQAS/aOUQdggVJC0JOUkzFk5BSA68lf3CQpFWJsgqyNTaDwTB3pMoRzc
 MqbQsrUpira4mfHmbKNYNJofhLnA55/trqZcqkxB72WUzhF0h1wugfgArR9TLs2pQViO
 kJ4uBk7baQQmTU7XZYAaiCrm41BTAnJHDmEaKo6MUvYja9RQwGcInjewi+APdKj2ueDP
 20gDpp4ijoaAML2XiOsDY7ti6E5GCbN7thHZ/aaKQ6mfl7t8F/592No/17NVIxJA6B1W
 Zvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzTCotQYpv54FQEtObhJ5kr381PzZffGPK0hbe7ubUA=;
 b=aeNDP8wvBgnEoUTaYv2nkqJAjwHLNCyLXxM6oDYknLiRuCiSXRXuozzTZ/6PbeOrQN
 4CCPwFeZlJhL17bp44ueO6x/GMIkBUIbS6vP825cXkOthkApiSvlqqXLYncPCb47Bes0
 jw4s+TaEhrrpHlnMFyT26lIXapYcew1lA86YsUTWGdkxhyZFm3H2bRxpOsUOooGJKuwX
 3aHXxjhycK9pedsgMd6ZmHyf6veQUmN0DlfTatxTqPFTpVjTdmUi45PgTLYQK4sJG1hq
 MP1JOSaAHRDHZzXsNcbKU0zQBWv1Kuq8U+afUP1h2R1om6PiMSmsmyGnwIMOjpP0AjOB
 kHCQ==
X-Gm-Message-State: AOAM531QEo+S0z5EVxCK5G7ND5bO8RgebL6fFr5rb+JhVUz4ikop5bE+
 n3adKB3l/lTcdVPoGPOUblOZFoQSQKa8fQ==
X-Google-Smtp-Source: ABdhPJzGPpMX4rj/vlyZa2WobF4JzT3KIdPZNI+b6llpwiVGIM6nlG+nXSyC/SnCR1ze6kaAPMRfQA==
X-Received: by 2002:aa7:829a:0:b029:2e9:e53:198d with SMTP id
 s26-20020aa7829a0000b02902e90e53198dmr6328616pfm.72.1622837539259; 
 Fri, 04 Jun 2021 13:12:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] tcg/arm: Implement TCG_TARGET_HAS_roti_vec
Date: Fri,  4 Jun 2021 13:12:09 -0700
Message-Id: <20210604201210.920136-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement via expansion, so don't actually set TCG_TARGET_HAS_roti_vec.
For NEON, this is shift-right followed by shift-left-and-insert.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |  1 +
 tcg/arm/tcg-target.opc.h     |  1 +
 tcg/arm/tcg-target.c.inc     | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index d02797cbf4..3685e1786a 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -30,6 +30,7 @@ C_O1_I2(r, r, rIK)
 C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
+C_O1_I2(w, 0, w)
 C_O1_I2(w, w, w)
 C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wV)
diff --git a/tcg/arm/tcg-target.opc.h b/tcg/arm/tcg-target.opc.h
index d19153dcb9..d38af9a808 100644
--- a/tcg/arm/tcg-target.opc.h
+++ b/tcg/arm/tcg-target.opc.h
@@ -11,5 +11,6 @@
  * consider these to be UNSPEC with names.
  */
 
+DEF(arm_sli_vec, 1, 2, 1, IMPLVEC)
 DEF(arm_sshl_vec, 1, 2, 0, IMPLVEC)
 DEF(arm_ushl_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a6c7889d9f..d0af654c65 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -212,6 +212,7 @@ typedef enum {
     INSN_VSHLI     = 0xf2800510,  /* VSHL (immediate) */
     INSN_VSARI     = 0xf2800010,  /* VSHR.S */
     INSN_VSHRI     = 0xf3800010,  /* VSHR.U */
+    INSN_VSLI      = 0xf3800510,
     INSN_VSHL_S    = 0xf2000400,  /* VSHL.S (register) */
     INSN_VSHL_U    = 0xf3000400,  /* VSHL.U (register) */
 
@@ -2423,6 +2424,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_arm_sshl_vec:
     case INDEX_op_arm_ushl_vec:
         return C_O1_I2(w, w, w);
+    case INDEX_op_arm_sli_vec:
+        return C_O1_I2(w, 0, w);
     case INDEX_op_or_vec:
     case INDEX_op_andc_vec:
         return C_O1_I2(w, w, wO);
@@ -2835,6 +2838,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_sari_vec:
         tcg_out_vshifti(s, INSN_VSARI, q, a0, a1, (16 << vece) - a2);
         return;
+    case INDEX_op_arm_sli_vec:
+        tcg_out_vshifti(s, INSN_VSLI, q, a0, a2, args[3] + (8 << vece));
+        return;
 
     case INDEX_op_andc_vec:
         if (!const_args[2]) {
@@ -2963,6 +2969,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotli_vec:
         return -1;
     default:
         return 0;
@@ -3010,6 +3017,14 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t1);
         break;
 
+    case INDEX_op_rotli_vec:
+        t1 = tcg_temp_new_vec(type);
+        tcg_gen_shri_vec(vece, t1, v1, -a2 & ((8 << vece) - 1));
+        vec_gen_4(INDEX_op_arm_sli_vec, type, vece,
+                  tcgv_vec_arg(v0), tcgv_vec_arg(t1), tcgv_vec_arg(v1), a2);
+        tcg_temp_free_vec(t1);
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


