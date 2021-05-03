Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486A371FD5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:43:31 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lddXW-0006DB-Ks
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQI-0005op-GD
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:02 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQA-0008IC-94
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:02 -0400
Received: by mail-pl1-x635.google.com with SMTP id h7so3328670plt.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/WsaxQsm1JBH5LKbyBIfUTN/+F2a2CViMd9fyQYV5EY=;
 b=VyFFCdoQ1q/MvoOL89kHB7kaLXYAoREG+Dpa4lvDlNfxpIjWU+DW8ioe4GlHZ26OtC
 o0Xxcjy1nbo2JB1GOr8CvG3LI5Hec9iO4HgrOD4g3vSRx3wkMnu0ZqV0JpmAejFw5H2v
 HHSR4xU9xGKRvbVBr45QJn22csiw3cAZGlc0Xek1XQ33MHuLNJ/DFVkalmcqP7Vt/2ED
 hYqhyp1e7w4Udf5W+cLtLsfeJTtBK14WpVtGUG/yBURw+yHwbsOrhtgfByA50y8gHbRS
 FVePUy4FsRAVwxjRHNOamoAl0Oy1Uz4qlQlXH2KferLmcpvYvvLTH/W+3cYxjDk1034L
 qQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/WsaxQsm1JBH5LKbyBIfUTN/+F2a2CViMd9fyQYV5EY=;
 b=o3Wk7ju7POhFTjJWRslhvwQGeEwAkV6+JprA9hUp8gbIQgDZGbziY/9waYieb2OrVa
 JlArjr4UsFUDq+bDQFs5ktzBcxl79OeLiVS/xp/MJILwZIZ0Hkf9u8GfmwtQYRdTejld
 vuzVfc711busV7aYpYvE6xizK8gSVDI+I1t5BpM+XRphbIKoZRw+B5K3nPxYfi1/4pka
 ebyeHA4Xt5FODW3VPXRg/G2cNoMaxc8XJOJZ21s/zgtZzq6qK+LeYQqd90QiAhAsNVNE
 Ck4jCD3lqRbhnnkqpzcI0P/SE3dCvf2hADZTVOzFm6wVsq8tL0qLYoEwK8zRTQgihRPW
 XuJw==
X-Gm-Message-State: AOAM530D/P/cepSEyITeFLr0kDg+fsVTmrs5qQGkdwKNBZJb6VVVuZj4
 MNJldiSITGQUpjHo09AP1lxMkkzgZCooUw==
X-Google-Smtp-Source: ABdhPJzFNjJ1cJg55sDzcE4xVPO/O+OqY1l9I3y+gOE1b5Cd0C2YjDU1+Tq/BJmhXGKfvwG+CioU+A==
X-Received: by 2002:a17:902:44:b029:ee:9107:4242 with SMTP id
 62-20020a1709020044b02900ee91074242mr22272796pla.18.1620066951825; 
 Mon, 03 May 2021 11:35:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/16] tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
Date: Mon,  3 May 2021 11:35:39 -0700
Message-Id: <20210503183541.2014496-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
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
Cc: thuth@redhat.com, david@redhat.com
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
index 07a86f4392..a6121c2f40 100644
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
 
@@ -2766,6 +2769,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -2808,6 +2821,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+        return vece < MO_64 ? -1 : 0;
     default:
         return 0;
     }
@@ -2863,6 +2879,43 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
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
@@ -2886,6 +2939,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
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
@@ -3046,6 +3106,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sari_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
+    case INDEX_op_s390_vuph_vec:
+    case INDEX_op_s390_vupl_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3065,6 +3127,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_s390_vpks_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


