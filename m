Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD8931297F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:44:18 +0100 (CET)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xTF-0004OX-Vf
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdw-00089u-V6
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:16 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdt-0001M0-Oi
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:16 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gx20so7956526pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NFbhYgQUsjaFE+5Iajc9BElBoc4cCgBaEW1XyF0baro=;
 b=zRpQYT2o2A1pq9r2ImC4wY0dBkhTjV4OZ4w8oarRjhnTO8OwXoaAp+g/u3f0G9gfu6
 1OXeu3QewiM2eL1SU4HFgd5J9xO2yrAMskoOtc1MUJKrshoy7f/l+/G+qRHkMC/mhzBN
 sfDGoXPU5PeN1E1HaJB5917J5Jt3Y9pWxiIoHhNunq0a7yE3aLaKv3uv+ntU1l9XcPfu
 qMKsbBsdGNQvUXNQF4be7GVoVk3YLIvCy644pHZRyv6GjSaFf3gxcEt5YlGrJ39ax5S8
 nmiS2njKCenvVJrOxQhDH4qcgEqaKTGgDly2El+IYxTCri5EIc7/hkbHIhF2iz/UKpd2
 FWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFbhYgQUsjaFE+5Iajc9BElBoc4cCgBaEW1XyF0baro=;
 b=DPBOi1wsTu27bjQSDcgBYB7ts3mNSB3ltm4KGRCwV7t3f8M+vB5aJ08a5Ydd/VfqWG
 no1VD8tmwwTsbZk8/kS4xmLkjtbmKgd5HaP8dJMetJ9+qrRnllCX+jABAM8nhHFbYM+S
 fRi3DwwGR8mRbrgQ85aLNsq+zVR91jih/9hGFWYye9tquu7nKhFmijqJdXvLTRZDQz5d
 dL4dVAYsGMASByKlBtLX2qppezsobPJEpBUotx6z6/xeLjLIMFZoyZ6pfDDqdAvMQ9wg
 hwxAf7ddtOdExPi5Ij67BYrMwLzBS7SclZQFXPI3kIEqpTMyEZU0hrFrbsRB4D0nLQH0
 MiMA==
X-Gm-Message-State: AOAM530qyt67WQjGv0jYlmzblhx9jJJsO3xGLMHFsGToDmemHkEqqDA5
 ueqExdsDJEkeFKNtwrC7kFFZ7Pi4YuaY3Q==
X-Google-Smtp-Source: ABdhPJzqVceXwLDB8FNADoy46GD+EyxG9/FDBelbtXwP8UGyDvopu+jIUV1SZs3jNKCN8Hliu5+05Q==
X-Received: by 2002:a17:902:8c97:b029:e2:8c58:153f with SMTP id
 t23-20020a1709028c97b02900e28c58153fmr14277996plo.79.1612752672194; 
 Sun, 07 Feb 2021 18:51:12 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] tcg/s390x: Implement minimal vector operations
Date: Sun,  7 Feb 2021 18:50:53 -0800
Message-Id: <20210208025101.271726-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Implementing add, sub, and, or, xor as the minimal set.
This allows us to actually enable vectors in query_s390_facilities.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 154 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 4 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 01118d9993..08315c7b05 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -271,6 +271,14 @@ typedef enum S390Opcode {
     VRIc_VREP   = 0xe74d,
 
     VRRa_VLR    = 0xe756,
+    VRRc_VA     = 0xe7f3,
+    VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
+    VRRc_VCH    = 0xe7fb,   /* " */
+    VRRc_VCHL   = 0xe7f9,   /* " */
+    VRRc_VN     = 0xe768,
+    VRRc_VO     = 0xe76a,
+    VRRc_VS     = 0xe7f7,
+    VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
 
     VRSb_VLVG   = 0xe722,
@@ -595,6 +603,17 @@ static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
 }
 
+static void tcg_out_insn_VRRc(TCGContext *s, S390Opcode op,
+                              TCGReg v1, TCGReg v2, TCGReg v3, int m4)
+{
+    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
+    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
+    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
+    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
+    tcg_out16(s, v3 << 12);
+    tcg_out16(s, (op & 0x00ff) | RXB(v1, v2, v3, 0) | (m4 << 12));
+}
+
 static void tcg_out_insn_VRRf(TCGContext *s, S390Opcode op,
                               TCGReg v1, TCGReg r2, TCGReg r3)
 {
@@ -2601,18 +2620,145 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
                            const TCGArg *args, const int *const_args)
 {
-    g_assert_not_reached();
+    TCGType type = vecl + TCG_TYPE_V64;
+    TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
+
+    switch (opc) {
+    case INDEX_op_ld_vec:
+        tcg_out_ld(s, type, a0, a1, a2);
+        break;
+    case INDEX_op_st_vec:
+        tcg_out_st(s, type, a0, a1, a2);
+        break;
+    case INDEX_op_dupm_vec:
+        tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
+        break;
+
+    case INDEX_op_add_vec:
+        tcg_out_insn(s, VRRc, VA, a0, a1, a2, vece);
+        break;
+    case INDEX_op_sub_vec:
+        tcg_out_insn(s, VRRc, VS, a0, a1, a2, vece);
+        break;
+    case INDEX_op_and_vec:
+        tcg_out_insn(s, VRRc, VN, a0, a1, a2, 0);
+        break;
+    case INDEX_op_or_vec:
+        tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
+        break;
+    case INDEX_op_xor_vec:
+        tcg_out_insn(s, VRRc, VX, a0, a1, a2, 0);
+        break;
+
+    case INDEX_op_cmp_vec:
+        switch ((TCGCond)args[3]) {
+        case TCG_COND_EQ:
+            tcg_out_insn(s, VRRc, VCEQ, a0, a1, a2, vece);
+            break;
+        case TCG_COND_GT:
+            tcg_out_insn(s, VRRc, VCH, a0, a1, a2, vece);
+            break;
+        case TCG_COND_GTU:
+            tcg_out_insn(s, VRRc, VCHL, a0, a1, a2, vece);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+
+    case INDEX_op_mov_vec:   /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_dup_vec:   /* Always emitted via tcg_out_dup_vec.  */
+    default:
+        g_assert_not_reached();
+    }
 }
 
 int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 {
-    return 0;
+    switch (opc) {
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
+    case INDEX_op_and_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_xor_vec:
+        return 1;
+    case INDEX_op_cmp_vec:
+        return -1;
+    default:
+        return 0;
+    }
+}
+
+static bool expand_vec_cmp_noinv(TCGType type, unsigned vece, TCGv_vec v0,
+                                 TCGv_vec v1, TCGv_vec v2, TCGCond cond)
+{
+    bool need_swap = false, need_inv = false;
+
+    switch (cond) {
+    case TCG_COND_EQ:
+    case TCG_COND_GT:
+    case TCG_COND_GTU:
+        break;
+    case TCG_COND_NE:
+    case TCG_COND_LE:
+    case TCG_COND_LEU:
+        need_inv = true;
+        break;
+    case TCG_COND_LT:
+    case TCG_COND_LTU:
+        need_swap = true;
+        break;
+    case TCG_COND_GE:
+    case TCG_COND_GEU:
+        need_swap = need_inv = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (need_inv) {
+        cond = tcg_invert_cond(cond);
+    }
+    if (need_swap) {
+        TCGv_vec t1;
+        t1 = v1, v1 = v2, v2 = t1;
+        cond = tcg_swap_cond(cond);
+    }
+
+    vec_gen_4(INDEX_op_cmp_vec, type, vece, tcgv_vec_arg(v0),
+              tcgv_vec_arg(v1), tcgv_vec_arg(v2), cond);
+
+    return need_inv;
+}
+
+static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2, TCGCond cond)
+{
+    if (expand_vec_cmp_noinv(type, vece, v0, v1, v2, cond)) {
+        tcg_gen_not_vec(vece, v0, v0);
+    }
 }
 
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
-    g_assert_not_reached();
+    va_list va;
+    TCGv_vec v0, v1, v2;
+
+    va_start(va, a0);
+    v0 = temp_tcgv_vec(arg_temp(a0));
+    v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+    v2 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+
+    switch (opc) {
+    case INDEX_op_cmp_vec:
+        expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    va_end(va);
 }
 
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
@@ -2804,7 +2950,7 @@ static void query_s390_facilities(void)
      * There is nothing else we currently care about in the 3rd word, so
      * disable VECTOR with one store.
      */
-    if (1 || !(hwcap & HWCAP_S390_VXRS)) {
+    if (!(hwcap & HWCAP_S390_VXRS)) {
         s390_facilities[2] = 0;
     }
 }
-- 
2.25.1


