Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B242423D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:09:09 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9Tg-0002XS-4m
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8j9-0002fH-Gk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ip-0007si-3Y
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:21:02 -0400
Received: by mail-pl1-x635.google.com with SMTP id w14so1918939pll.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E5Jm2U3YzT86a7A83pNU2NYiKZySLrD1nBQNoBZQx34=;
 b=UdwbQWKmnE6u7AoT+gYStJXdgmh5isxhFyTznixckaY42yZr7vSkVLTbZkfUeV7eqX
 a7fKV7XvIsNI8/RnEEYoYL00uiYWipmuHQSRs5d1QH6j+RVrAVXM7L0i0+xBXTN6arJy
 yqlTpZDD7kkfu+zzmNc7dhVbRsDOvawFSTb3D+X+LPhIjNKuDxsc3u0w1kiCIxpf4/gJ
 5j4rCZ33MTmSusmxUXSlsccsgg4/HKUgYnTB5pvlZbuZ2IUN8VsQFyXGPwtd4ZRGRoZP
 MaqUC2X97D3myBP3cOn4PLgHsFSLkvgQtRMmNlI6GItyNGy+bqfveLFCDh23WTEQCw5a
 bj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5Jm2U3YzT86a7A83pNU2NYiKZySLrD1nBQNoBZQx34=;
 b=zBbdP86JzcTP3aViL2Ek7393HIK6kpmdNWgfbQNXESdEaGNteTnHpzGZIVgVtys/K9
 GK3pZY2IfITWbN3Xe9aO32oqQo2+ETCts5OqfyQFQmCbmap40St47NaPtMjzk2TvyS9R
 j0cX/P2o6qXI4TLtA5ANlzHPeCSa3CoDvTEXxMHzLsbershZEf694H2qKnkJp5CdMKJC
 zYLb7xjM8QyNNXw+iIEbVJ7lKTY/O+TwyP7HulGGSKlEhuDLcLMN1/t3xfAZcQbu2hAW
 RRRX+96RCrX+R+lmBjREVfUg2ka7m6R/4aiMJVlEXSvtUfb2J7uuMUEJB2ZfeX9MNoEw
 kvjw==
X-Gm-Message-State: AOAM533S6FOuYbH7LthbOTrosBAwjTp7nT0ge3Tj9T31IyzwoL5kqRN+
 YgMOtdCJVSASNlzZXNF0HbQIBSyIcYDs6Q==
X-Google-Smtp-Source: ABdhPJxsvmt4yQBhmLXyHZ0j5X3olWzF9Toqbivsm1ibadoCP5wAeXKI/bdt0oX81czm+FqDOlFonw==
X-Received: by 2002:a17:90a:df8a:: with SMTP id
 p10mr11840321pjv.137.1633533638586; 
 Wed, 06 Oct 2021 08:20:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/28] tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
Date: Wed,  6 Oct 2021 08:20:12 -0700
Message-Id: <20211006152014.741026-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
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
index 3b8fc62cd7..965d9ab54c 100644
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


