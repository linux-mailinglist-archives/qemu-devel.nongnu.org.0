Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A951840CEF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:43:03 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcgI-00009H-Oc
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcVA-0003o8-A7
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV8-0003Pa-73
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id h3so4057677pgb.7
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7a8K4wAh/GLFrxFi31++1e54f/jDvgDca/CGPsn23Aw=;
 b=kWHVHT9nICsqb0QdVsfYkGdT9TiyyArhkG+Csh/o5T4VdBvxcWKqLI9vqlabd/kEsG
 yNNDZv19PfoPeCh+j2ws3PBVPBOExR/9YHbcFetlsm/+59ck2NOyIAb3SpLKMy3locQO
 ZwQzkwCsr/vVIsu3D3i+7ys3n1457KFydDDG5heCirzs3Fm3eMZ5aWzDeD55F9l81sIu
 FdbCcWpef58IkxLI7l7m8+YTzwfoXyJ9GPs7nrfxDYYsdiaPhUgkuaJ7dtMjPiHPtNa3
 zmhIgNC7BYX5TWxqTwfqIdMijKfJRiTBBAeRMiSgzeY4tfCD13CV0pYWY7xk8rjqvP9R
 3YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7a8K4wAh/GLFrxFi31++1e54f/jDvgDca/CGPsn23Aw=;
 b=MnErPH/0h/wXRSQSp6uia0ffvBNDzFnimdBeWvaG0iSv7VrOu3AO7WkXapu+5vT9SV
 MjEJkBn6Et/BTLW+6bu57RNsTe7sB3o32ucATswZGGnYcG/v2EpEtSi5ZUfTE07UOOkc
 C8ANoEC31hPEbfligKlUG+5LyT0ZAubT3Nur7atPr3tMU0A/LzGNTk4Fhc65ehVFl9Ug
 eIPJWq4Bz5YQ6n4T+qQcEWqiijJkvk3vsKH8C5X3TpKC2pvZFHD6FlS9+SgaSUC0KtjZ
 9HrZU61h0osHxDheANeCkKd8B7ZBSSEhEfo7Mcc94IRIvwfR9dlNtMghjoXBf7EewiiR
 /7Ow==
X-Gm-Message-State: AOAM532QCYKrdMZEkYn0gAkmb1aFi0HC+Gs5k0vIDBGFX//PJsP6zlW0
 5n2ezzEDf+G3c0b//QeVoaeNmDMYJDj4Ag==
X-Google-Smtp-Source: ABdhPJw5lEk0FQU3/gbl7t1NmVADkBT46wY2RDsNoAY76vlMVzZJwY3DkMpEtK8Kixlna1pKJgy7mQ==
X-Received: by 2002:a05:6a00:1acf:b0:416:4ed7:e4c7 with SMTP id
 f15-20020a056a001acf00b004164ed7e4c7mr1713687pfv.86.1631741488855; 
 Wed, 15 Sep 2021 14:31:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/16] tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
Date: Wed, 15 Sep 2021 14:31:12 -0700
Message-Id: <20210915213114.1923776-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The unsigned saturations are handled via generic code
using min/max.  The signed saturations are expanded using
double-sized arithmetic and a saturating pack.

Since all operations are done via expansion, do not
actually set TCG_TARGET_HAS_sat_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.opc.h |  3 ++
 tcg/s390x/tcg-target.c.inc | 63 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/tcg/s390x/tcg-target.opc.h b/tcg/s390x/tcg-target.opc.h
index 67afc82a93..0eb2350fb3 100644
--- a/tcg/s390x/tcg-target.opc.h
+++ b/tcg/s390x/tcg-target.opc.h
@@ -10,3 +10,6 @@
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
  */
+DEF(s390_vuph_vec, 1, 1, 0, IMPLVEC)
+DEF(s390_vupl_vec, 1, 1, 0, IMPLVEC)
+DEF(s390_vpks_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index c3bd22b116..4a56532011 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -291,7 +291,10 @@ typedef enum S390Opcode {
     VRRc_VNO    = 0xe76b,
     VRRc_VO     = 0xe76a,
     VRRc_VOC    = 0xe76f,
+    VRRc_VPKS   = 0xe797,   /* we leave the m5 cs field 0 */
     VRRc_VS     = 0xe7f7,
+    VRRa_VUPH   = 0xe7d7,
+    VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
 
@@ -2800,6 +2803,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_s390_vuph_vec:
+        tcg_out_insn(s, VRRa, VUPH, a0, a1, vece);
+        break;
+    case INDEX_op_s390_vupl_vec:
+        tcg_out_insn(s, VRRa, VUPL, a0, a1, vece);
+        break;
+    case INDEX_op_s390_vpks_vec:
+        tcg_out_insn(s, VRRc, VPKS, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_mov_vec:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dup_vec:   /* Always emitted via tcg_out_dup_vec.  */
     default:
@@ -2842,6 +2855,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+        return vece < MO_64 ? -1 : 0;
     default:
         return 0;
     }
@@ -2897,6 +2913,43 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_sat(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2, TCGOpcode add_sub_opc)
+{
+    TCGv_vec h1 = tcg_temp_new_vec(type);
+    TCGv_vec h2 = tcg_temp_new_vec(type);
+    TCGv_vec l1 = tcg_temp_new_vec(type);
+    TCGv_vec l2 = tcg_temp_new_vec(type);
+
+    tcg_debug_assert (vece < MO_64);
+
+    /* Unpack with sign-extension. */
+    vec_gen_2(INDEX_op_s390_vuph_vec, type, vece,
+              tcgv_vec_arg(h1), tcgv_vec_arg(v1));
+    vec_gen_2(INDEX_op_s390_vuph_vec, type, vece,
+              tcgv_vec_arg(h2), tcgv_vec_arg(v2));
+
+    vec_gen_2(INDEX_op_s390_vupl_vec, type, vece,
+              tcgv_vec_arg(l1), tcgv_vec_arg(v1));
+    vec_gen_2(INDEX_op_s390_vupl_vec, type, vece,
+              tcgv_vec_arg(l2), tcgv_vec_arg(v2));
+
+    /* Arithmetic on a wider element size. */
+    vec_gen_3(add_sub_opc, type, vece + 1, tcgv_vec_arg(h1),
+              tcgv_vec_arg(h1), tcgv_vec_arg(h2));
+    vec_gen_3(add_sub_opc, type, vece + 1, tcgv_vec_arg(l1),
+              tcgv_vec_arg(l1), tcgv_vec_arg(l2));
+
+    /* Pack with saturation. */
+    vec_gen_3(INDEX_op_s390_vpks_vec, type, vece + 1,
+              tcgv_vec_arg(v0), tcgv_vec_arg(h1), tcgv_vec_arg(l1));
+
+    tcg_temp_free_vec(h1);
+    tcg_temp_free_vec(h2);
+    tcg_temp_free_vec(l1);
+    tcg_temp_free_vec(l2);
+}
+
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
@@ -2920,6 +2973,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t0);
         break;
 
+    case INDEX_op_ssadd_vec:
+        expand_vec_sat(type, vece, v0, v1, v2, INDEX_op_add_vec);
+        break;
+    case INDEX_op_sssub_vec:
+        expand_vec_sat(type, vece, v0, v1, v2, INDEX_op_sub_vec);
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -3080,6 +3140,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sari_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
+    case INDEX_op_s390_vuph_vec:
+    case INDEX_op_s390_vupl_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3099,6 +3161,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_s390_vpks_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


