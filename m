Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68086325C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:09:28 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFURT-0005J2-Cc
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThu-0000by-HR
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:22 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThq-0001iV-OQ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:22 -0500
Received: by mail-pj1-x1029.google.com with SMTP id c19so5181817pjq.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H5kLQPvC+NkVH8eIXzS6BbKDPA2Zb98WYvzuQona8oI=;
 b=f6Zx1szDt4WDzZhnXdH9B2CSkEr0XsdTLSz4fmPBLLIjLEs398s/IWaYIiYs8nalkT
 brELa9g2cnxmzshgjRVA9QPtoHI8XRWu9X0EqSygp62WdYQn+WWsXiYm9ATRFSdElfau
 M/PLpzIU6WmL0LsJrFlP7v2hKdQfeYWimVJzZGbxXb2u20tpZeqJez4feK/WplEE3Diq
 ZfTFN53ZpPCM1hyih4eTap0d2Rt5aHGbQm1EkUpQdFacOpbd6sB7icPjkXJmzXwRZzkF
 S+C2M7d8AQcZ5jbE8aGhf2RH4Mp+KwzvCRUO+HY2SR7IjIq7628N/tQpI4sJf1bgpld1
 0uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H5kLQPvC+NkVH8eIXzS6BbKDPA2Zb98WYvzuQona8oI=;
 b=hrhpxbY4VWLweeg1gCnFYdm4jVjcZNTA7xG+DiZh1nTfdq1N7Shq9qOK3HmkaKRJx0
 uzsGyOmGK4neccJ+LKO+0+G7F/8jRcXigmbUIpJNyZcREzmh4sdRlRGKg4uHz5rpuRfh
 vwnt3eqA2wuTMelMG/vsNvFm4x4xf2+dAKw2cwtQve6qN32dRSn4kd/7ucg6zTvuHRnF
 Dzvsk7IShcH+s6kzCUDofIVJgmiHgJuUPBMo8+dZcDUpoxagC4ITb0E+C65fwQeDEEvv
 IU52q5it7Ahw+XGzYH1uB0ifR5ES4ZYrzpzorlspdPyv+jW8oR5nZnDceihMYuVHbQ89
 /LRg==
X-Gm-Message-State: AOAM53186LY7+MOI8WrMonPo+zZlun4sOXqq+7KCwUM1VK+2SLXbkukf
 pKa6IZE+HMMWEiEGkE5d5+lesAlUrdF4sA==
X-Google-Smtp-Source: ABdhPJwt0ahO+pM7oXRNcdve70SKjm7SzyY5gyy/WJgLbPPUXziMuei946PQmvrUTaIOuDg+JMPEag==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr1027616plh.38.1614309737274; 
 Thu, 25 Feb 2021 19:22:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 33/75] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Fri, 26 Feb 2021 11:18:17 +0800
Message-Id: <20210226031902.23656-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6e45186b9b4..72222d73e0e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3056,17 +3056,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 /* Integer Extract Instruction */
 
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
-                         int ofs, int sew)
+                         int ofs, int sew, bool sign)
 {
     switch (sew) {
     case MO_8:
-        tcg_gen_ld8u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld8u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld8s_i64(dest, base, ofs);
+        }
         break;
     case MO_16:
-        tcg_gen_ld16u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld16u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld16s_i64(dest, base, ofs);
+        }
         break;
     case MO_32:
-        tcg_gen_ld32u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld32u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld32s_i64(dest, base, ofs);
+        }
         break;
     case MO_64:
         tcg_gen_ld_i64(dest, base, ofs);
@@ -3121,7 +3133,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -3139,9 +3151,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -3151,7 +3163,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 
     if (a->rs1 == 0) {
         /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
+        vec_element_loadi(s, tmp, a->rs2, 0, false);
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax = s->vlen >> (3 + s->sew);
@@ -3233,7 +3245,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         (s->mstatus_fs != 0) && (s->sew != 0)) {
         unsigned int len = 8 << s->sew;
 
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
         if (len < 64) {
             tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                             MAKE_64BIT_MASK(len, 64 - len));
@@ -3335,7 +3347,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
-- 
2.17.1


