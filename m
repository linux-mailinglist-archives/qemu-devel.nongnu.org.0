Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318BB2F1C95
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:38:08 +0100 (CET)
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz18p-0003Gy-8h
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0ri-0003JV-Ry
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:26 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0re-0000Bz-Fq
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:26 -0500
Received: by mail-pf1-x430.google.com with SMTP id d2so322939pfq.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gINepdGckOBPQozHF12k+VkgG8lWS2hW2lWUZ4aP3Vk=;
 b=RmufYeEW+byGTIpl9THyUnx6+eZnTldWYKVzlUBkuX3XAqxfDBAhZcWdlvyXMBzh1g
 e/lcet32M49JeerQBYo/hoD8pisp0nPCae4kRW7PdPfwZpTBLh/ghLOf29fJqShwzA1R
 9uBhSVGH44j4SSoo6wmTS6eFKnGHxPJJVr6kaxWpzbIochtSVda61o/DfZPAKeyLGGxr
 4cNaNr7BQCI4HzT9KYpzcQNTPJrszhka/H6f7RJCYo8qucECy9GKTez1Vws91AwbNK1u
 VAAKcfcqMs1ZH0m57ngJ0oqkcJGs9fhbaYwCtpKUiywoM/Nh2/tKSae5NGhIOJQGU4f9
 vDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gINepdGckOBPQozHF12k+VkgG8lWS2hW2lWUZ4aP3Vk=;
 b=YEGLmmzwZpLHeg7Ycm6nzxcXAd3uzmVx0jLo/dU8oaiOsCSw0yS+JVmGDYMop3xGCu
 BlsGVvI2ZcNvbahll8d30yR7+JrOjUT8YkHYY2uE+42ws0p3JZLnNar+Vms2cYjm41IB
 t1RQjmZTMtGw/mmwYI/GSHkP/7qn4njA20c0xaxuP0f7uExAzEWM/iB39sUWhtEameL2
 djJg75S6NQNLdyB1gGdVgz+b8vR5GBBmJ+OTLgrITVKKW9/8Jn/U5FlX8OsbLunHRieb
 ab7RmLdGB/gMDrD7v1lzxJkKR0IX14dHKtuLXvb7oqC1r0uP2X8OTs2p7zzs/viihmK/
 sN6w==
X-Gm-Message-State: AOAM533G8WirWAGiNpRMoEJbAqcGVJ4lLjC2KysNdlr0wKsEuvKQe5Cp
 6pfTB1Y/h7YgtXgEeliiT9pdT/6NlGXLIg==
X-Google-Smtp-Source: ABdhPJwpLusjbd5OgU3f776ydOzNBhvRgY4UBVaqPB8kogcy3PwuBw+gYqmXtffo80YG7g9QqpshIA==
X-Received: by 2002:a62:5205:0:b029:19e:a0f:2c81 with SMTP id
 g5-20020a6252050000b029019e0a0f2c81mr392236pfb.50.1610385616218; 
 Mon, 11 Jan 2021 09:20:16 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 16/23] tcg: Use tcg_constant_{i32, i64,
 vec} with gvec expanders
Date: Mon, 11 Jan 2021 07:19:39 -1000
Message-Id: <20210111171946.219469-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |   1 +
 tcg/tcg-op-gvec.c | 129 ++++++++++++++++++----------------------------
 tcg/tcg.c         |   8 +++
 3 files changed, 60 insertions(+), 78 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index eeeb70ad43..504c5e9bb0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1109,6 +1109,7 @@ static inline TCGv_i64 tcg_constant_i64(int64_t val)
 }
 
 TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
+TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 1a41dfa908..498a959839 100644
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
@@ -605,9 +596,9 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
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
 
@@ -648,11 +639,11 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
             t_val = tcg_temp_new_i32();
             tcg_gen_extrl_i64_i32(t_val, in_64);
         } else {
-            t_val = tcg_const_i32(in_c);
+            t_val = tcg_constant_i32(in_c);
         }
         gen_helper_memset(t_ptr, t_ptr, t_val, t_size);
 
-        if (!in_32) {
+        if (in_64) {
             tcg_temp_free_i32(t_val);
         }
         tcg_temp_free_ptr(t_size);
@@ -660,15 +651,14 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         return;
     }
 
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
@@ -680,24 +670,23 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
 
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
@@ -1247,10 +1236,9 @@ void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
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
@@ -1744,16 +1732,14 @@ static void gen_addv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 
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
@@ -1837,9 +1823,8 @@ void tcg_gen_gvec_adds(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_addi(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(c);
+    TCGv_i64 tmp = tcg_constant_i64(c);
     tcg_gen_gvec_adds(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
 
 static const TCGOpcode vecop_list_sub[] = { INDEX_op_sub_vec, 0 };
@@ -1897,16 +1882,14 @@ static void gen_subv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 
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
@@ -2017,9 +2000,8 @@ void tcg_gen_gvec_muls(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_muli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(c);
+    TCGv_i64 tmp = tcg_constant_i64(c);
     tcg_gen_gvec_muls(vece, dofs, aofs, tmp, oprsz, maxsz);
-    tcg_temp_free_i64(tmp);
 }
 
 void tcg_gen_gvec_ssadd(unsigned vece, uint32_t dofs, uint32_t aofs,
@@ -2076,18 +2058,16 @@ void tcg_gen_gvec_sssub(unsigned vece, uint32_t dofs, uint32_t aofs,
 
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
@@ -2120,18 +2100,16 @@ void tcg_gen_gvec_usadd(unsigned vece, uint32_t dofs, uint32_t aofs,
 
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
@@ -2292,16 +2270,14 @@ static void gen_negv_mask(TCGv_i64 d, TCGv_i64 b, TCGv_i64 m)
 
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
@@ -2570,9 +2546,8 @@ void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_andi(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
-    tcg_temp_free_i64(tmp);
 }
 
 static const GVecGen2s gop_xors = {
@@ -2595,9 +2570,8 @@ void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_xori(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_xors);
-    tcg_temp_free_i64(tmp);
 }
 
 static const GVecGen2s gop_ors = {
@@ -2620,9 +2594,8 @@ void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
 void tcg_gen_gvec_ori(unsigned vece, uint32_t dofs, uint32_t aofs,
                       int64_t c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_const_i64(dup_const(vece, c));
+    TCGv_i64 tmp = tcg_constant_i64(dup_const(vece, c));
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ors);
-    tcg_temp_free_i64(tmp);
 }
 
 void tcg_gen_vec_shl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
@@ -3110,9 +3083,9 @@ static void tcg_gen_shlv_mod_vec(unsigned vece, TCGv_vec d,
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
@@ -3173,9 +3146,9 @@ static void tcg_gen_shrv_mod_vec(unsigned vece, TCGv_vec d,
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
@@ -3236,9 +3209,9 @@ static void tcg_gen_sarv_mod_vec(unsigned vece, TCGv_vec d,
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
@@ -3299,9 +3272,9 @@ static void tcg_gen_rotlv_mod_vec(unsigned vece, TCGv_vec d,
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
@@ -3358,9 +3331,9 @@ static void tcg_gen_rotrv_mod_vec(unsigned vece, TCGv_vec d,
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
index ad1348d811..1cadfe070c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1474,6 +1474,14 @@ TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val)
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


