Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA92DD3D6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:13:18 +0100 (CET)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuxx-0006ER-BP
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue5-0003cg-ES
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:45 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:43574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudx-0004y5-Ax
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:45 -0500
Received: by mail-ot1-x32f.google.com with SMTP id q25so27503520otn.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ox5YWQlNJNlsuA0qRB89A1f0SSeK3bMPNyOLlduLqTk=;
 b=xo92cT6mnWM8GzRlzWnY7vfCRPJP8Qgm1rOLxP6WJ9mhYUpqncnc0PVmdOzqSIJBf3
 7D1jUtL0L51yCfq2NbsQVHd5HnMMii7+fJFwcQabLhc4BldIlkR92HiqgCJO3ILrSIFw
 mM0nR++JupgFGzLFlSlu/EEd/MVlmoXsVfGwCOsY7qHzuN/BGOFOBfpVG7lHD0UDIPwS
 M/I9ia4DmoNajaJgNjktUX5kZxCO6brveRZdpF4Yos1DdDvZxzY8Ub/VzQ/cCMCxz5np
 8gRKhohnk0XH6hl168fiC2IBPQdTF31ZKIKWWFjonWFbJGbzL0OheW4iGvMlcvJ9lUmN
 4wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ox5YWQlNJNlsuA0qRB89A1f0SSeK3bMPNyOLlduLqTk=;
 b=XtCChYoOnS8uOPWQVDFAaXkWf4YK0YSLmHog64utk8CH/blBQmlL6jga5bky3SgtKQ
 95UEkrBIcnBeF2vRr1qSg9fN8BQv5JqsPnPyL4RQSH+kteRai7T74TILWyBpAaThvnts
 tKWswA3B35um0xblpPFEaqS1G0kbsdWwp4YmfnVwL9YsTrcItrcVbx3MVSRonIMA0pBv
 wxGg4oT07nLq7I4Lz9m+WMTOorUUPkJqwS9NCFqAMG+zofYzcrzpeSR3YDqAGbT7DQaz
 xdfFnOB8DYnaCPCoo7zRz9d4/7mfWedwlzAH2DPCvK/ru6hWDCnhyKX1ZR5UovaxTTly
 jPgA==
X-Gm-Message-State: AOAM533zSqQkUlnohfb/uE1NK8/+ncEkqOo/p8cr4SV257jd6BLIooYH
 psfFZNGwAveS40ZuGJkqceJ4St/gviPCk6ny
X-Google-Smtp-Source: ABdhPJx4LIkaruCswCCDcESxMrMZJgl5jqk5LUslycq0NNjeBnnDXEA9jXY+ixyUPo8S4iT7ipLbAA==
X-Received: by 2002:a05:6830:402c:: with SMTP id
 i12mr29840113ots.25.1608216755288; 
 Thu, 17 Dec 2020 06:52:35 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/23] tcg: Use tcg_constant_{i32, i64,
 vec} with gvec expanders
Date: Thu, 17 Dec 2020 08:52:08 -0600
Message-Id: <20201217145215.534637-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |   1 +
 tcg/tcg-op-gvec.c | 125 ++++++++++++++++++----------------------------
 tcg/tcg.c         |   8 +++
 3 files changed, 58 insertions(+), 76 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 995db20d02..5a5413f0d4 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1083,6 +1083,7 @@ static inline TCGv_i64 tcg_constant_i64(int64_t val)
 }
 
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
+TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index ddbe06b71a..80eb53c770 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -115,7 +115,7 @@ void tcg_gen_gvec_2_ool(uint32_t dofs, uint32_t aofs,
                         gen_helper_gvec_2 *fn)
 {
     TCGv_ptr a0, a1;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -127,7 +127,6 @@ void tcg_gen_gvec_2_ool(uint32_t dofs, uint32_t aofs,
 
     tcg_temp_free_ptr(a0);
     tcg_temp_free_ptr(a1);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with two vector operands
@@ -137,7 +136,7 @@ void tcg_gen_gvec_2i_ool(uint32_t dofs, uint32_t aofs, TCGv_i64 c,
                          gen_helper_gvec_2i *fn)
 {
     TCGv_ptr a0, a1;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -149,7 +148,6 @@ void tcg_gen_gvec_2i_ool(uint32_t dofs, uint32_t aofs, TCGv_i64 c,
 
     tcg_temp_free_ptr(a0);
     tcg_temp_free_ptr(a1);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with three vector operands.  */
@@ -158,7 +156,7 @@ void tcg_gen_gvec_3_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         gen_helper_gvec_3 *fn)
 {
     TCGv_ptr a0, a1, a2;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -173,7 +171,6 @@ void tcg_gen_gvec_3_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a0);
     tcg_temp_free_ptr(a1);
     tcg_temp_free_ptr(a2);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with four vector operands.  */
@@ -182,7 +179,7 @@ void tcg_gen_gvec_4_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         int32_t data, gen_helper_gvec_4 *fn)
 {
     TCGv_ptr a0, a1, a2, a3;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -200,7 +197,6 @@ void tcg_gen_gvec_4_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a1);
     tcg_temp_free_ptr(a2);
     tcg_temp_free_ptr(a3);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with five vector operands.  */
@@ -209,7 +205,7 @@ void tcg_gen_gvec_5_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         uint32_t maxsz, int32_t data, gen_helper_gvec_5 *fn)
 {
     TCGv_ptr a0, a1, a2, a3, a4;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -230,7 +226,6 @@ void tcg_gen_gvec_5_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a2);
     tcg_temp_free_ptr(a3);
     tcg_temp_free_ptr(a4);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with three vector operands
@@ -240,7 +235,7 @@ void tcg_gen_gvec_2_ptr(uint32_t dofs, uint32_t aofs,
                         int32_t data, gen_helper_gvec_2_ptr *fn)
 {
     TCGv_ptr a0, a1;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -252,7 +247,6 @@ void tcg_gen_gvec_2_ptr(uint32_t dofs, uint32_t aofs,
 
     tcg_temp_free_ptr(a0);
     tcg_temp_free_ptr(a1);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with three vector operands
@@ -262,7 +256,7 @@ void tcg_gen_gvec_3_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         int32_t data, gen_helper_gvec_3_ptr *fn)
 {
     TCGv_ptr a0, a1, a2;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -277,7 +271,6 @@ void tcg_gen_gvec_3_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a0);
     tcg_temp_free_ptr(a1);
     tcg_temp_free_ptr(a2);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with four vector operands
@@ -288,7 +281,7 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         gen_helper_gvec_4_ptr *fn)
 {
     TCGv_ptr a0, a1, a2, a3;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -306,7 +299,6 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a1);
     tcg_temp_free_ptr(a2);
     tcg_temp_free_ptr(a3);
-    tcg_temp_free_i32(desc);
 }
 
 /* Generate a call to a gvec-style helper with five vector operands
@@ -317,7 +309,7 @@ void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                         gen_helper_gvec_5_ptr *fn)
 {
     TCGv_ptr a0, a1, a2, a3, a4;
-    TCGv_i32 desc = tcg_const_i32(simd_desc(oprsz, maxsz, data));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
     a0 = tcg_temp_new_ptr();
     a1 = tcg_temp_new_ptr();
@@ -338,7 +330,6 @@ void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     tcg_temp_free_ptr(a2);
     tcg_temp_free_ptr(a3);
     tcg_temp_free_ptr(a4);
-    tcg_temp_free_i32(desc);
 }
 
 /* Return true if we want to implement something of OPRSZ bytes
@@ -602,9 +593,9 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
                 || (TCG_TARGET_REG_BITS == 64
                     && (in_c == 0 || in_c == -1
                         || !check_size_impl(oprsz, 4)))) {
-                t_64 = tcg_const_i64(in_c);
+                t_64 = tcg_constant_i64(in_c);
             } else {
-                t_32 = tcg_const_i32(in_c);
+                t_32 = tcg_constant_i32(in_c);
             }
         }
 
@@ -628,15 +619,14 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
     /* Otherwise implement out of line.  */
     t_ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_ptr, cpu_env, dofs);
-    t_desc = tcg_const_i32(simd_desc(oprsz, maxsz, 0));
+    t_desc = tcg_constant_i32(simd_desc(oprsz, maxsz, 0));
 
     if (vece == MO_64) {
         if (in_64) {
             gen_helper_gvec_dup64(t_ptr, t_desc, in_64);
         } else {
-            t_64 = tcg_const_i64(in_c);
+            t_64 = tcg_constant_i64(in_c);
             gen_helper_gvec_dup64(t_ptr, t_desc, t_64);
-            tcg_temp_free_i64(t_64);
         }
     } else {
         typedef void dup_fn(TCGv_ptr, TCGv_i32, TCGv_i32);
@@ -648,24 +638,23 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
 
         if (in_32) {
             fns[vece](t_ptr, t_desc, in_32);
-        } else {
+        } else if (in_64) {
             t_32 = tcg_temp_new_i32();
-            if (in_64) {
-                tcg_gen_extrl_i64_i32(t_32, in_64);
-            } else if (vece == MO_8) {
-                tcg_gen_movi_i32(t_32, in_c & 0xff);
-            } else if (vece == MO_16) {
-                tcg_gen_movi_i32(t_32, in_c & 0xffff);
-            } else {
-                tcg_gen_movi_i32(t_32, in_c);
-            }
+            tcg_gen_extrl_i64_i32(t_32, in_64);
             fns[vece](t_ptr, t_desc, t_32);
             tcg_temp_free_i32(t_32);
+        } else {
+            if (vece == MO_8) {
+                in_c &= 0xff;
+            } else if (vece == MO_16) {
+                in_c &= 0xffff;
+            }
+            t_32 = tcg_constant_i32(in_c);
+            fns[vece](t_ptr, t_desc, t_32);
         }
     }
 
     tcg_temp_free_ptr(t_ptr);
-    tcg_temp_free_i32(t_desc);
     return;
 
  done:
@@ -1215,10 +1204,9 @@ void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
             if (g->fno) {
                 tcg_gen_gvec_2_ool(dofs, aofs, oprsz, maxsz, c, g->fno);
             } else {
-                TCGv_i64 tcg_c = tcg_const_i64(c);
+                TCGv_i64 tcg_c = tcg_constant_i64(c);
                 tcg_gen_gvec_2i_ool(dofs, aofs, tcg_c, oprsz,
                                     maxsz, c, g->fnoi);
-                tcg_temp_free_i64(tcg_c);
             }
             oprsz = maxsz;
         }
@@ -1712,16 +1700,14 @@ static void gen_addv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 
 void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_8, 0x80));
     gen_addv_mask(d, a, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
     gen_addv_mask(d, a, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_add32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -1805,9 +1791,8 @@ void tcg_gen_gvec_adds(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_addi(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(c);
+    TCGv_i64 tmp = tcg_constant_i64(c);
     tcg_gen_gvec_adds(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
 
 static const TCGOpcode vecop_list_sub[] = { INDEX_op_sub_vec, 0 };
@@ -1865,16 +1850,14 @@ static void gen_subv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 
 void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_8, 0x80));
     gen_subv_mask(d, a, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
     gen_subv_mask(d, a, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
@@ -1985,9 +1968,8 @@ void tcg_gen_gvec_muls(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_muli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(c);
+    TCGv_i64 tmp = tcg_constant_i64(c);
     tcg_gen_gvec_muls(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
 
 void tcg_gen_gvec_ssadd(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -2044,18 +2026,16 @@ void tcg_gen_gvec_sssub(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 static void tcg_gen_usadd_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 max = tcg_const_i32(-1);
+    TCGv_i32 max = tcg_constant_i32(-1);
     tcg_gen_add_i32(d, a, b);
     tcg_gen_movcond_i32(TCG_COND_LTU, d, d, a, max, d);
-    tcg_temp_free_i32(max);
 }
 
 static void tcg_gen_usadd_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 max = tcg_const_i64(-1);
+    TCGv_i64 max = tcg_constant_i64(-1);
     tcg_gen_add_i64(d, a, b);
     tcg_gen_movcond_i64(TCG_COND_LTU, d, d, a, max, d);
-    tcg_temp_free_i64(max);
 }
 
 void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -2088,18 +2068,16 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 static void tcg_gen_ussub_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 min = tcg_const_i32(0);
+    TCGv_i32 min = tcg_constant_i32(0);
     tcg_gen_sub_i32(d, a, b);
     tcg_gen_movcond_i32(TCG_COND_LTU, d, a, b, min, d);
-    tcg_temp_free_i32(min);
 }
 
 static void tcg_gen_ussub_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 min = tcg_const_i64(0);
+    TCGv_i64 min = tcg_constant_i64(0);
     tcg_gen_sub_i64(d, a, b);
     tcg_gen_movcond_i64(TCG_COND_LTU, d, a, b, min, d);
-    tcg_temp_free_i64(min);
 }
 
 void tcg_gen_gvec_ussub(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -2260,16 +2238,14 @@ static void gen_negv_mask(TCGv_i64 d, TCGv_i64 b, TCGv_i64 m)
 
 void tcg_gen_vec_neg8_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_8, 0x80));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_8, 0x80));
     gen_negv_mask(d, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_neg16_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    TCGv_i64 m = tcg_const_i64(dup_const(MO_16, 0x8000));
+    TCGv_i64 m = tcg_constant_i64(dup_const(MO_16, 0x8000));
     gen_negv_mask(d, b, m);
-    tcg_temp_free_i64(m);
 }
 
 void tcg_gen_vec_neg32_i64(TCGv_i64 d, TCGv_i64 b)
@@ -2538,9 +2514,8 @@ void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_andi(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
-    tcg_temp_free_i64(tmp);
 }
 
 static const GVecGen2s gop_xors = {
@@ -2563,9 +2538,8 @@ void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_xori(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_xors);
-    tcg_temp_free_i64(tmp);
 }
 
 static const GVecGen2s gop_ors = {
@@ -2588,9 +2562,8 @@ void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, uint32_t aofs,
                       int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ors);
-    tcg_temp_free_i64(tmp);
 }
 
 void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
@@ -3078,9 +3051,9 @@ static void tcg_gen_shlv_mod_vec(unsigned vece, TCGv_vec d,
                                  TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);
 
-    tcg_gen_dupi_vec(vece, t, (8 << vece) - 1);
-    tcg_gen_and_vec(vece, t, t, b);
+    tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_shlv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
 }
@@ -3141,9 +3114,9 @@ static void tcg_gen_shrv_mod_vec(unsigned vece, TCGv_vec d,
                                  TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);
 
-    tcg_gen_dupi_vec(vece, t, (8 << vece) - 1);
-    tcg_gen_and_vec(vece, t, t, b);
+    tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_shrv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
 }
@@ -3204,9 +3177,9 @@ static void tcg_gen_sarv_mod_vec(unsigned vece, TCGv_vec d,
                                  TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);
 
-    tcg_gen_dupi_vec(vece, t, (8 << vece) - 1);
-    tcg_gen_and_vec(vece, t, t, b);
+    tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_sarv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
 }
@@ -3267,9 +3240,9 @@ static void tcg_gen_rotlv_mod_vec(unsigned vece, TCGv_vec d,
                                   TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);
 
-    tcg_gen_dupi_vec(vece, t, (8 << vece) - 1);
-    tcg_gen_and_vec(vece, t, t, b);
+    tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_rotlv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
 }
@@ -3326,9 +3299,9 @@ static void tcg_gen_rotrv_mod_vec(unsigned vece, TCGv_vec d,
                                   TCGv_vec a, TCGv_vec b)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, (8 << vece) - 1);
 
-    tcg_gen_dupi_vec(vece, t, (8 << vece) - 1);
-    tcg_gen_and_vec(vece, t, t, b);
+    tcg_gen_and_vec(vece, t, b, m);
     tcg_gen_rotrv_vec(vece, d, a, t);
     tcg_temp_free_vec(t);
 }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 500663e3f5..231d1950ed 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1424,6 +1424,14 @@ TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val)
     return temp_tcgv_vec(tcg_constant_internal(type, val));
 }
 
+TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val)
+{
+    TCGTemp *t = tcgv_vec_temp(match);
+
+    tcg_debug_assert(t->temp_allocated != 0);
+    return tcg_constant_vec(t->base_type, vece, val);
+}
+
 TCGv_i32 tcg_const_i32(int32_t val)
 {
     TCGv_i32 t0;
-- 
2.25.1


