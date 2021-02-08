Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCE3129AE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:17:58 +0100 (CET)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xzp-0002HX-Ir
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8we1-0008Mm-Kp
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:21 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdz-0001Pl-UH
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:21 -0500
Received: by mail-pf1-x431.google.com with SMTP id o20so8801067pfu.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oMSoefukScEf8fPG2WpWUUHe7GtaNiNm3/VqmCKdoJ0=;
 b=t+Q4Nvr6ukeb2ufunrRoGgD05wo9w6eGemP9c6kWKp5EXPdY+XuMwYQw8dglF3sleB
 kOJ9Q/rux1Fz2KyLwAlDZqq8gDUhSNxDGQm016n9s+RJQRDxsw2SXYWYgbUYGnAQlgdA
 SYj80G9RzpmJfviLR5zMnSzEnvqLbkW9CkQ+04gZfAiaweq7IJUeMvdEJ+yfYjpath6j
 zyXUBT21bU/Kj4qNnBj0Nu2O9i9vA7QQ2MPejRzEEod4DpMa1WMtG/6ZjlRYmnOnbN7Q
 F+mvO5HBSg62SpRwUhe5EhhJ+Z0FYbdU2rb3F3i0tPO8i7TohH8s90C4If//HZP4i7es
 huyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oMSoefukScEf8fPG2WpWUUHe7GtaNiNm3/VqmCKdoJ0=;
 b=O1wxeSkMwldSDKNUG8dZKZfZsqrboMiGTPcOf/EcrrEpxrHALK0Rc1Y8BrhMCwtblS
 Utg6mycN4xOpvv/RBWehOqkcFuZZ84kMJZ9LI06ltf/MTK1774NGfN1arqoMHmwbORBE
 SKu8rT4nC0gN2NbDnW+ZLzBUTaenJ/Z1Hwy/rSgUNETI6+JQdOmQs2OoJkM9nE89iBHw
 5LVJdrp+FiNKiTn17Qd7ExaLNM3p5DAzxarPoMs1+d16dqYNAOaYbuztTYf3B353g0LN
 BO73nsnE3rACiO/R+h6B6XT9GBpSxfULH5Z0wNG6Wy+Po6JVz9LT+DVV4SbVGQb2n2UM
 uYsQ==
X-Gm-Message-State: AOAM5302NXSrDR3h2Wm2J17QOBNhpUZwP8XNip0hPWKlev398Zy57Sw9
 aoOIHxtYS8IkgRxUqZ8ER0yDTQjQ69zIiw==
X-Google-Smtp-Source: ABdhPJwRxqFqHxcGHSiDEkj0aPpRT2jZz/ovebYnrfbs4xg2+IQPh/pbNyElhWtz9ihgpijPuqOfXw==
X-Received: by 2002:a63:214e:: with SMTP id s14mr685798pgm.101.1612752678644; 
 Sun, 07 Feb 2021 18:51:18 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/16] tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
Date: Sun,  7 Feb 2021 18:50:59 -0800
Message-Id: <20210208025101.271726-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
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
index 3bf49e6c90..d4877dcf67 100644
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
 
@@ -2765,6 +2768,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2807,6 +2820,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+        return vece < MO_64 ? -1 : 0;
     default:
         return 0;
     }
@@ -2862,6 +2878,43 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
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
@@ -2885,6 +2938,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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
@@ -3045,6 +3105,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sari_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
+    case INDEX_op_s390_vuph_vec:
+    case INDEX_op_s390_vupl_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3064,6 +3126,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_s390_vpks_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


