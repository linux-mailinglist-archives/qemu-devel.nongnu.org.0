Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD92E2C54
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:26:25 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstfM-0008L5-Ty
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZL-00032d-5j
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:11 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZJ-0005BY-4p
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:10 -0500
Received: by mail-pj1-x1034.google.com with SMTP id z12so2679463pjn.1
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JcL23TZPnjsseMydd3TwINwkRfPiWIOjf4vhZmHNHgM=;
 b=efyTAz797u8k4NBSupXbLkHddUcTcWYn0jdBt6kKiEhU0SfcLxGDJPepycYntKW3TA
 CrMW7bj9VXx2VAevuzXWrw2GydL0ajXl/W9hNJUYlsr8Ak/sw9iWVHaBzwXrUJGrjQ3b
 PerRsyx/TwNR3ACeW8KVD10vcPcLJnCcUEPOSg/foTddSXA8d82CU22FWq0r36x21Eld
 JQ37oQv4C5O9toJIPcrLdJ3ULQrPQE8mVmjI/0DRJDTmKI8yhb+PZNZmrcVhVWTVpGNQ
 4FGVyROsNiT1hcKaXe2NAA+tfdkrtWn7zwJnOM85R/r/NJhTw71jLXu/2ch2V1nQNxtL
 QAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JcL23TZPnjsseMydd3TwINwkRfPiWIOjf4vhZmHNHgM=;
 b=kIatwdL41ertEhbQfDSV6bTkNwjDbAdIH0OWTvleIP/VfCfOyMx4eMiH9U+vuBepno
 D9H+KOnT+AqjQw6IpWblY55z0OtVIJan4l4T26DG4ufc3kVF3vFUh1f92kquErJRp1H9
 Zqs8R+avx08ZjrzxxYS2UXAK0r+sZO7NrxSXZo3jODbhZ1+L8RpIkqHeUElbkPZrgvyH
 kBuHkFjEz1YvQVpg4DtjRTXFzkChS1B0pXMhPCWUkHqUYbKGKjdztioQhhRJngXiD5rG
 AAZt53I+DkKOyoTsXHxQZHXK1QdoAAIqAp4K7JH7ydrH4MlEM9RDHv1yGui+o1KMzgnR
 YbHg==
X-Gm-Message-State: AOAM532x9w9seTcnDjs3jQruX+f7e8KLVKRsqm6+Ekc0pBvOQCKLbWiH
 1C0RbGn+AivyZJvvd2Vwtp/k37bCb87dXw==
X-Google-Smtp-Source: ABdhPJzjXKeeqCog7KqjCITGnxxu+TCuDV9BQoCn7HORNoCxzWg1WSYRmRlFdyV7JeyEJugKInacwQ==
X-Received: by 2002:a17:90b:50a:: with SMTP id
 r10mr9853908pjz.103.1608927607540; 
 Fri, 25 Dec 2020 12:20:07 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/16] tcg/s390x: Implement minimal vector operations
Date: Fri, 25 Dec 2020 12:19:48 -0800
Message-Id: <20201225201956.692861-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index 808d50190f..d4a5783c1c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -256,6 +256,14 @@ typedef enum S390Opcode {
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
@@ -579,6 +587,17 @@ static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
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
@@ -2597,18 +2616,145 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
 
 static int tcg_target_op_def(TCGOpcode op)
@@ -2800,7 +2946,7 @@ static void query_s390_facilities(void)
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


