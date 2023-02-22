Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699EE69FF85
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWT-0000TZ-Ul; Wed, 22 Feb 2023 18:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWR-0000SF-7s
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWN-0005Kn-4b
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:38 -0500
Received: by mail-pj1-x102e.google.com with SMTP id c23so5974673pjo.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qtnsx0Y1Xyl2BIrj42fGLzN0nlYVF9pWbkAQlX597Ag=;
 b=H9GE6VHiWHgHHIIQDh6YuZ0pWm2q2RX+zqss1wU18ZymdzHWeIukxoQ+M8OMACphcO
 pYTgPs7Pnom5ImbSSXpSkOP7bg6EaTv1fWKeONk7+8Q2fe+k7RKJt7b6uAhU2yPVd47J
 /HCdKv7dfJn/Y6OxwWF6p7GahWc0g6sjEhZWCKobGin7op3wUsPaGxXlx/jJe2BqSvYR
 MyicvLRl1SsfTbMd3kXIFn+PkPoidXHdUoSkmLPh8mjObWn1k9mkic08GEGT5AEVNk7R
 D580UkOkYIKsa9l71K0kw+dbRPUXiK6Z0pDs5TiP/X32GLXbEueU+jAkH/DKb769Pnth
 bJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qtnsx0Y1Xyl2BIrj42fGLzN0nlYVF9pWbkAQlX597Ag=;
 b=nyqRCmHBHEYHfZFCeFETU9qiq/HfHLluaC9Btdc7wS31jdJxtUa+ijh4ib923oirOg
 LNPhHcPp1EImhaM+/TL/h8kmW/a6C/vdWO2MBw6sXf+puUgOlVMtaQFhzcx8t5SEt61p
 INcxSb+zBq6AeCdFE2s4oQ+qD9du4mR4UEmQrEAzQQb6QDHADci1//CzpNhFunoHe/CG
 HYpIAp65dyVH4TktjhcqftA665HVnn7tZdJ2FlukDYVeFIYKlsxHJZvmLdrqQtmpyIFM
 or5KRPh+oA7DmbHvBVG67fOPhgEM83HYPfR5IhN8IXLAkmI+ZUidOuhgS8150RzwjtL0
 N5Qg==
X-Gm-Message-State: AO0yUKWBkU7hBILp5zmJ4o266tJhD3yWbUU/Fm/DAluZy01BBAkx6vHL
 LRiv/KfzE3CZIxRizZ3AC3fv/YM8F8yvqDEK2I0=
X-Google-Smtp-Source: AK7set87/HmW+7v6UqQHvOEybz35dGkmgcpsngiBI3qEnNlTR5MKLHhFkC63Qbh5ac1vrpvgoYxH2g==
X-Received: by 2002:a17:90b:4c50:b0:234:d1c:f112 with SMTP id
 np16-20020a17090b4c5000b002340d1cf112mr11724880pjb.0.1677108453272; 
 Wed, 22 Feb 2023 15:27:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/28] tcg: Use tcg_temp_ebb_new_* in tcg/
Date: Wed, 22 Feb 2023 13:26:58 -1000
Message-Id: <20230222232715.15034-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All of these have obvious and quite local scope.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 270 +++++++++++++++++++++++-----------------------
 tcg/tcg-op.c      | 258 ++++++++++++++++++++++----------------------
 tcg/tcg.c         |   2 +-
 3 files changed, 265 insertions(+), 265 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 079a761b04..d895011d6b 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -117,8 +117,8 @@ void tcg_gen_gvec_2_ool(uint32_t dofs, uint32_t aofs,
     TCGv_ptr a0, a1;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -138,8 +138,8 @@ void tcg_gen_gvec_2i_ool(uint32_t dofs, uint32_t aofs, TCGv_i64 c,
     TCGv_ptr a0, a1;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -158,9 +158,9 @@ void tcg_gen_gvec_3_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -181,10 +181,10 @@ void tcg_gen_gvec_4_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2, a3;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
-    a3 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
+    a3 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -207,11 +207,11 @@ void tcg_gen_gvec_5_ool(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2, a3, a4;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
-    a3 = tcg_temp_new_ptr();
-    a4 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
+    a3 = tcg_temp_ebb_new_ptr();
+    a4 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -237,8 +237,8 @@ void tcg_gen_gvec_2_ptr(uint32_t dofs, uint32_t aofs,
     TCGv_ptr a0, a1;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -258,9 +258,9 @@ void tcg_gen_gvec_3_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -283,10 +283,10 @@ void tcg_gen_gvec_4_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2, a3;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
-    a3 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
+    a3 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -311,11 +311,11 @@ void tcg_gen_gvec_5_ptr(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     TCGv_ptr a0, a1, a2, a3, a4;
     TCGv_i32 desc = tcg_constant_i32(simd_desc(oprsz, maxsz, data));
 
-    a0 = tcg_temp_new_ptr();
-    a1 = tcg_temp_new_ptr();
-    a2 = tcg_temp_new_ptr();
-    a3 = tcg_temp_new_ptr();
-    a4 = tcg_temp_new_ptr();
+    a0 = tcg_temp_ebb_new_ptr();
+    a1 = tcg_temp_ebb_new_ptr();
+    a2 = tcg_temp_ebb_new_ptr();
+    a3 = tcg_temp_ebb_new_ptr();
+    a4 = tcg_temp_ebb_new_ptr();
 
     tcg_gen_addi_ptr(a0, cpu_env, dofs);
     tcg_gen_addi_ptr(a1, cpu_env, aofs);
@@ -576,16 +576,16 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
                be simple enough.  */
             if (TCG_TARGET_REG_BITS == 64
                 && (vece != MO_32 || !check_size_impl(oprsz, 4))) {
-                t_64 = tcg_temp_new_i64();
+                t_64 = tcg_temp_ebb_new_i64();
                 tcg_gen_extu_i32_i64(t_64, in_32);
                 tcg_gen_dup_i64(vece, t_64, t_64);
             } else {
-                t_32 = tcg_temp_new_i32();
+                t_32 = tcg_temp_ebb_new_i32();
                 tcg_gen_dup_i32(vece, t_32, in_32);
             }
         } else if (in_64) {
             /* We are given a 64-bit variable input.  */
-            t_64 = tcg_temp_new_i64();
+            t_64 = tcg_temp_ebb_new_i64();
             tcg_gen_dup_i64(vece, t_64, in_64);
         } else {
             /* We are given a constant input.  */
@@ -620,7 +620,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
     }
 
     /* Otherwise implement out of line.  */
-    t_ptr = tcg_temp_new_ptr();
+    t_ptr = tcg_temp_ebb_new_ptr();
     tcg_gen_addi_ptr(t_ptr, cpu_env, dofs);
 
     /*
@@ -636,7 +636,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         if (in_32) {
             t_val = in_32;
         } else if (in_64) {
-            t_val = tcg_temp_new_i32();
+            t_val = tcg_temp_ebb_new_i32();
             tcg_gen_extrl_i64_i32(t_val, in_64);
         } else {
             t_val = tcg_constant_i32(in_c);
@@ -671,7 +671,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         if (in_32) {
             fns[vece](t_ptr, t_desc, in_32);
         } else if (in_64) {
-            t_32 = tcg_temp_new_i32();
+            t_32 = tcg_temp_ebb_new_i32();
             tcg_gen_extrl_i64_i32(t_32, in_64);
             fns[vece](t_ptr, t_desc, t_32);
             tcg_temp_free_i32(t_32);
@@ -705,8 +705,8 @@ static void expand_clr(uint32_t dofs, uint32_t maxsz)
 static void expand_2_i32(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                          bool load_dest, void (*fni)(TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -725,8 +725,8 @@ static void expand_2i_i32(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                           int32_t c, bool load_dest,
                           void (*fni)(TCGv_i32, TCGv_i32, int32_t))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -745,8 +745,8 @@ static void expand_2s_i32(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                           TCGv_i32 c, bool scalar_first,
                           void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -767,9 +767,9 @@ static void expand_3_i32(uint32_t dofs, uint32_t aofs,
                          uint32_t bofs, uint32_t oprsz, bool load_dest,
                          void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -790,9 +790,9 @@ static void expand_3i_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                           uint32_t oprsz, int32_t c, bool load_dest,
                           void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32, int32_t))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -814,10 +814,10 @@ static void expand_4_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                          uint32_t cofs, uint32_t oprsz, bool write_aofs,
                          void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-    TCGv_i32 t3 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t3 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -841,10 +841,10 @@ static void expand_4i_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                           void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32,
                                       int32_t))
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-    TCGv_i32 t3 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t3 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -864,8 +864,8 @@ static void expand_4i_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
 static void expand_2_i64(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                          bool load_dest, void (*fni)(TCGv_i64, TCGv_i64))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -884,8 +884,8 @@ static void expand_2i_i64(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                           int64_t c, bool load_dest,
                           void (*fni)(TCGv_i64, TCGv_i64, int64_t))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -904,8 +904,8 @@ static void expand_2s_i64(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                           TCGv_i64 c, bool scalar_first,
                           void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -926,9 +926,9 @@ static void expand_3_i64(uint32_t dofs, uint32_t aofs,
                          uint32_t bofs, uint32_t oprsz, bool load_dest,
                          void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -949,9 +949,9 @@ static void expand_3i_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                           uint32_t oprsz, int64_t c, bool load_dest,
                           void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64, int64_t))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -973,10 +973,10 @@ static void expand_4_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                          uint32_t cofs, uint32_t oprsz, bool write_aofs,
                          void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
-    TCGv_i64 t3 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t3 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -1000,10 +1000,10 @@ static void expand_4i_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                           void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64,
                                       int64_t))
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
-    TCGv_i64 t3 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t3 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -1386,13 +1386,13 @@ void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
         tcg_temp_free_vec(t_vec);
         tcg_swap_vecop_list(hold_list);
     } else if (g->fni8 && check_size_impl(oprsz, 8)) {
-        TCGv_i64 t64 = tcg_temp_new_i64();
+        TCGv_i64 t64 = tcg_temp_ebb_new_i64();
 
         tcg_gen_dup_i64(g->vece, t64, c);
         expand_2s_i64(dofs, aofs, oprsz, t64, g->scalar_first, g->fni8);
         tcg_temp_free_i64(t64);
     } else if (g->fni4 && check_size_impl(oprsz, 4)) {
-        TCGv_i32 t32 = tcg_temp_new_i32();
+        TCGv_i32 t32 = tcg_temp_ebb_new_i32();
 
         tcg_gen_extrl_i64_i32(t32, c);
         tcg_gen_dup_i32(g->vece, t32, t32);
@@ -1735,7 +1735,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             do_dup_store(type, dofs, oprsz, maxsz, t_vec);
             tcg_temp_free_vec(t_vec);
         } else if (vece <= MO_32) {
-            TCGv_i32 in = tcg_temp_new_i32();
+            TCGv_i32 in = tcg_temp_ebb_new_i32();
             switch (vece) {
             case MO_8:
                 tcg_gen_ld8u_i32(in, cpu_env, aofs);
@@ -1750,7 +1750,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             do_dup(vece, dofs, oprsz, maxsz, in, NULL, 0);
             tcg_temp_free_i32(in);
         } else {
-            TCGv_i64 in = tcg_temp_new_i64();
+            TCGv_i64 in = tcg_temp_ebb_new_i64();
             tcg_gen_ld_i64(in, cpu_env, aofs);
             do_dup(vece, dofs, oprsz, maxsz, NULL, in, 0);
             tcg_temp_free_i64(in);
@@ -1769,8 +1769,8 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             }
             tcg_temp_free_vec(in);
         } else {
-            TCGv_i64 in0 = tcg_temp_new_i64();
-            TCGv_i64 in1 = tcg_temp_new_i64();
+            TCGv_i64 in0 = tcg_temp_ebb_new_i64();
+            TCGv_i64 in1 = tcg_temp_ebb_new_i64();
 
             tcg_gen_ld_i64(in0, cpu_env, aofs);
             tcg_gen_ld_i64(in1, cpu_env, aofs + 8);
@@ -1815,7 +1815,7 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             int j;
 
             for (j = 0; j < 4; ++j) {
-                in[j] = tcg_temp_new_i64();
+                in[j] = tcg_temp_ebb_new_i64();
                 tcg_gen_ld_i64(in[j], cpu_env, aofs + j * 8);
             }
             for (i = (aofs == dofs) * 32; i < oprsz; i += 32) {
@@ -1860,9 +1860,9 @@ void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
    the 64-bit operation.  */
 static void gen_addv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
-    TCGv_i64 t3 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t3 = tcg_temp_ebb_new_i64();
 
     tcg_gen_andc_i64(t1, a, m);
     tcg_gen_andc_i64(t2, b, m);
@@ -1885,9 +1885,9 @@ void tcg_gen_vec_add8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 void tcg_gen_vec_add8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
     TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-    TCGv_i32 t3 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t3 = tcg_temp_ebb_new_i32();
 
     tcg_gen_andc_i32(t1, a, m);
     tcg_gen_andc_i32(t2, b, m);
@@ -1909,8 +1909,8 @@ void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t1, a, ~0xffff);
     tcg_gen_add_i32(t2, a, b);
@@ -1923,8 +1923,8 @@ void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 void tcg_gen_vec_add32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t1, a, ~0xffffffffull);
     tcg_gen_add_i64(t2, a, b);
@@ -2043,9 +2043,9 @@ void tcg_gen_gvec_subs(unsigned vece, uint32_t dofs, uint32_t aofs,
    Compare gen_addv_mask above.  */
 static void gen_subv_mask(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 m)
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
-    TCGv_i64 t3 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t3 = tcg_temp_ebb_new_i64();
 
     tcg_gen_or_i64(t1, a, m);
     tcg_gen_andc_i64(t2, b, m);
@@ -2068,9 +2068,9 @@ void tcg_gen_vec_sub8_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 void tcg_gen_vec_sub8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
     TCGv_i32 m = tcg_constant_i32((int32_t)dup_const(MO_8, 0x80));
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
-    TCGv_i32 t3 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t3 = tcg_temp_ebb_new_i32();
 
     tcg_gen_or_i32(t1, a, m);
     tcg_gen_andc_i32(t2, b, m);
@@ -2092,8 +2092,8 @@ void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 
 void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t1, b, ~0xffff);
     tcg_gen_sub_i32(t2, a, b);
@@ -2106,8 +2106,8 @@ void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t1, b, ~0xffffffffull);
     tcg_gen_sub_i64(t2, a, b);
@@ -2468,8 +2468,8 @@ void tcg_gen_gvec_umax(unsigned vece, uint32_t dofs, uint32_t aofs,
    Compare gen_subv_mask above.  */
 static void gen_negv_mask(TCGv_i64 d, TCGv_i64 b, TCGv_i64 m)
 {
-    TCGv_i64 t2 = tcg_temp_new_i64();
-    TCGv_i64 t3 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t3 = tcg_temp_ebb_new_i64();
 
     tcg_gen_andc_i64(t3, m, b);
     tcg_gen_andc_i64(t2, b, m);
@@ -2494,8 +2494,8 @@ void tcg_gen_vec_neg16_i64(TCGv_i64 d, TCGv_i64 b)
 
 void tcg_gen_vec_neg32_i64(TCGv_i64 d, TCGv_i64 b)
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t1, b, ~0xffffffffull);
     tcg_gen_neg_i64(t2, b);
@@ -2540,7 +2540,7 @@ void tcg_gen_gvec_neg(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 static void gen_absv_mask(TCGv_i64 d, TCGv_i64 b, unsigned vece)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
     int nbit = 8 << vece;
 
     /* Create -1 for each negative element.  */
@@ -2749,7 +2749,7 @@ static const GVecGen2s gop_ands = {
 void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_ebb_new_i64();
     tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
     tcg_temp_free_i64(tmp);
@@ -2773,7 +2773,7 @@ static const GVecGen2s gop_xors = {
 void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_ebb_new_i64();
     tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_xors);
     tcg_temp_free_i64(tmp);
@@ -2797,7 +2797,7 @@ static const GVecGen2s gop_ors = {
 void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
                       TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
-    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_ebb_new_i64();
     tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ors);
     tcg_temp_free_i64(tmp);
@@ -2944,7 +2944,7 @@ void tcg_gen_vec_sar8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
     uint64_t s_mask = dup_const(MO_8, 0x80 >> c);
     uint64_t c_mask = dup_const(MO_8, 0xff >> c);
-    TCGv_i64 s = tcg_temp_new_i64();
+    TCGv_i64 s = tcg_temp_ebb_new_i64();
 
     tcg_gen_shri_i64(d, a, c);
     tcg_gen_andi_i64(s, d, s_mask);  /* isolate (shifted) sign bit */
@@ -2958,7 +2958,7 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c)
 {
     uint64_t s_mask = dup_const(MO_16, 0x8000 >> c);
     uint64_t c_mask = dup_const(MO_16, 0xffff >> c);
-    TCGv_i64 s = tcg_temp_new_i64();
+    TCGv_i64 s = tcg_temp_ebb_new_i64();
 
     tcg_gen_shri_i64(d, a, c);
     tcg_gen_andi_i64(s, d, s_mask);  /* isolate (shifted) sign bit */
@@ -2972,7 +2972,7 @@ void tcg_gen_vec_sar8i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t s_mask = dup_const(MO_8, 0x80 >> c);
     uint32_t c_mask = dup_const(MO_8, 0xff >> c);
-    TCGv_i32 s = tcg_temp_new_i32();
+    TCGv_i32 s = tcg_temp_ebb_new_i32();
 
     tcg_gen_shri_i32(d, a, c);
     tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
@@ -2986,7 +2986,7 @@ void tcg_gen_vec_sar16i_i32(TCGv_i32 d, TCGv_i32 a, int32_t c)
 {
     uint32_t s_mask = dup_const(MO_16, 0x8000 >> c);
     uint32_t c_mask = dup_const(MO_16, 0xffff >> c);
-    TCGv_i32 s = tcg_temp_new_i32();
+    TCGv_i32 s = tcg_temp_ebb_new_i32();
 
     tcg_gen_shri_i32(d, a, c);
     tcg_gen_andi_i32(s, d, s_mask);  /* isolate (shifted) sign bit */
@@ -3180,7 +3180,7 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
         TCGv_vec v_shift = tcg_temp_new_vec(type);
 
         if (vece == MO_64) {
-            TCGv_i64 sh64 = tcg_temp_new_i64();
+            TCGv_i64 sh64 = tcg_temp_ebb_new_i64();
             tcg_gen_extu_i32_i64(sh64, shift);
             tcg_gen_dup_i64_vec(MO_64, v_shift, sh64);
             tcg_temp_free_i64(sh64);
@@ -3221,14 +3221,14 @@ do_gvec_shifts(unsigned vece, uint32_t dofs, uint32_t aofs, TCGv_i32 shift,
     if (vece == MO_32 && check_size_impl(oprsz, 4)) {
         expand_2s_i32(dofs, aofs, oprsz, shift, false, g->fni4);
     } else if (vece == MO_64 && check_size_impl(oprsz, 8)) {
-        TCGv_i64 sh64 = tcg_temp_new_i64();
+        TCGv_i64 sh64 = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(sh64, shift);
         expand_2s_i64(dofs, aofs, oprsz, sh64, false, g->fni8);
         tcg_temp_free_i64(sh64);
     } else {
-        TCGv_ptr a0 = tcg_temp_new_ptr();
-        TCGv_ptr a1 = tcg_temp_new_ptr();
-        TCGv_i32 desc = tcg_temp_new_i32();
+        TCGv_ptr a0 = tcg_temp_ebb_new_ptr();
+        TCGv_ptr a1 = tcg_temp_ebb_new_ptr();
+        TCGv_i32 desc = tcg_temp_ebb_new_i32();
 
         tcg_gen_shli_i32(desc, shift, SIMD_DATA_SHIFT);
         tcg_gen_ori_i32(desc, desc, simd_desc(oprsz, maxsz, 0));
@@ -3360,7 +3360,7 @@ static void tcg_gen_shlv_mod_vec(unsigned vece, TCGv_vec d,
 
 static void tcg_gen_shl_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t, b, 31);
     tcg_gen_shl_i32(d, a, t);
@@ -3369,7 +3369,7 @@ static void tcg_gen_shl_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 static void tcg_gen_shl_mod_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t, b, 63);
     tcg_gen_shl_i64(d, a, t);
@@ -3423,7 +3423,7 @@ static void tcg_gen_shrv_mod_vec(unsigned vece, TCGv_vec d,
 
 static void tcg_gen_shr_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t, b, 31);
     tcg_gen_shr_i32(d, a, t);
@@ -3432,7 +3432,7 @@ static void tcg_gen_shr_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 static void tcg_gen_shr_mod_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t, b, 63);
     tcg_gen_shr_i64(d, a, t);
@@ -3486,7 +3486,7 @@ static void tcg_gen_sarv_mod_vec(unsigned vece, TCGv_vec d,
 
 static void tcg_gen_sar_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t, b, 31);
     tcg_gen_sar_i32(d, a, t);
@@ -3495,7 +3495,7 @@ static void tcg_gen_sar_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 static void tcg_gen_sar_mod_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t, b, 63);
     tcg_gen_sar_i64(d, a, t);
@@ -3549,7 +3549,7 @@ static void tcg_gen_rotlv_mod_vec(unsigned vece, TCGv_vec d,
 
 static void tcg_gen_rotl_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t, b, 31);
     tcg_gen_rotl_i32(d, a, t);
@@ -3558,7 +3558,7 @@ static void tcg_gen_rotl_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 static void tcg_gen_rotl_mod_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t, b, 63);
     tcg_gen_rotl_i64(d, a, t);
@@ -3608,7 +3608,7 @@ static void tcg_gen_rotrv_mod_vec(unsigned vece, TCGv_vec d,
 
 static void tcg_gen_rotr_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_andi_i32(t, b, 31);
     tcg_gen_rotr_i32(d, a, t);
@@ -3617,7 +3617,7 @@ static void tcg_gen_rotr_mod_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 
 static void tcg_gen_rotr_mod_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_andi_i64(t, b, 63);
     tcg_gen_rotr_i64(d, a, t);
@@ -3658,8 +3658,8 @@ void tcg_gen_gvec_rotrv(unsigned vece, uint32_t dofs, uint32_t aofs,
 static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                            uint32_t oprsz, TCGCond cond)
 {
-    TCGv_i32 t0 = tcg_temp_new_i32();
-    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 4) {
@@ -3676,8 +3676,8 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
 static void expand_cmp_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
                            uint32_t oprsz, TCGCond cond)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
     uint32_t i;
 
     for (i = 0; i < oprsz; i += 8) {
@@ -3823,7 +3823,7 @@ void tcg_gen_gvec_cmp(TCGCond cond, unsigned vece, uint32_t dofs,
 
 static void tcg_gen_bitsel_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_and_i64(t, b, a);
     tcg_gen_andc_i64(d, c, a);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c581ae77c4..f2269a1b91 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -264,7 +264,7 @@ void tcg_gen_div_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_div_i32) {
         tcg_gen_op3_i32(INDEX_op_div_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div2_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_sari_i32(t0, arg1, 31);
         tcg_gen_op5_i32(INDEX_op_div2_i32, ret, t0, arg1, t0, arg2);
         tcg_temp_free_i32(t0);
@@ -278,13 +278,13 @@ void tcg_gen_rem_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_rem_i32) {
         tcg_gen_op3_i32(INDEX_op_rem_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_op3_i32(INDEX_op_div_i32, t0, arg1, arg2);
         tcg_gen_mul_i32(t0, t0, arg2);
         tcg_gen_sub_i32(ret, arg1, t0);
         tcg_temp_free_i32(t0);
     } else if (TCG_TARGET_HAS_div2_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_sari_i32(t0, arg1, 31);
         tcg_gen_op5_i32(INDEX_op_div2_i32, t0, ret, arg1, t0, arg2);
         tcg_temp_free_i32(t0);
@@ -298,7 +298,7 @@ void tcg_gen_divu_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_div_i32) {
         tcg_gen_op3_i32(INDEX_op_divu_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div2_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_movi_i32(t0, 0);
         tcg_gen_op5_i32(INDEX_op_divu2_i32, ret, t0, arg1, t0, arg2);
         tcg_temp_free_i32(t0);
@@ -312,13 +312,13 @@ void tcg_gen_remu_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_rem_i32) {
         tcg_gen_op3_i32(INDEX_op_remu_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_op3_i32(INDEX_op_divu_i32, t0, arg1, arg2);
         tcg_gen_mul_i32(t0, t0, arg2);
         tcg_gen_sub_i32(ret, arg1, t0);
         tcg_temp_free_i32(t0);
     } else if (TCG_TARGET_HAS_div2_i32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_movi_i32(t0, 0);
         tcg_gen_op5_i32(INDEX_op_divu2_i32, t0, ret, arg1, t0, arg2);
         tcg_temp_free_i32(t0);
@@ -332,7 +332,7 @@ void tcg_gen_andc_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_andc_i32) {
         tcg_gen_op3_i32(INDEX_op_andc_i32, ret, arg1, arg2);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_not_i32(t0, arg2);
         tcg_gen_and_i32(ret, arg1, t0);
         tcg_temp_free_i32(t0);
@@ -374,7 +374,7 @@ void tcg_gen_orc_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_orc_i32) {
         tcg_gen_op3_i32(INDEX_op_orc_i32, ret, arg1, arg2);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_not_i32(t0, arg2);
         tcg_gen_or_i32(ret, arg1, t0);
         tcg_temp_free_i32(t0);
@@ -386,8 +386,8 @@ void tcg_gen_clz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_clz_i32) {
         tcg_gen_op3_i32(INDEX_op_clz_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_clz_i64) {
-        TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t2 = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(t1, arg1);
         tcg_gen_extu_i32_i64(t2, arg2);
         tcg_gen_addi_i64(t2, t2, 32);
@@ -411,8 +411,8 @@ void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_ctz_i32) {
         tcg_gen_op3_i32(INDEX_op_ctz_i32, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_ctz_i64) {
-        TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_temp_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t2 = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(t1, arg1);
         tcg_gen_extu_i32_i64(t2, arg2);
         tcg_gen_ctz_i64(t1, t1, t2);
@@ -423,7 +423,7 @@ void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
                || TCG_TARGET_HAS_ctpop_i64
                || TCG_TARGET_HAS_clz_i32
                || TCG_TARGET_HAS_clz_i64) {
-        TCGv_i32 z, t = tcg_temp_new_i32();
+        TCGv_i32 z, t = tcg_temp_ebb_new_i32();
 
         if (TCG_TARGET_HAS_ctpop_i32 || TCG_TARGET_HAS_ctpop_i64) {
             tcg_gen_subi_i32(t, arg1, 1);
@@ -448,7 +448,7 @@ void tcg_gen_ctzi_i32(TCGv_i32 ret, TCGv_i32 arg1, uint32_t arg2)
 {
     if (!TCG_TARGET_HAS_ctz_i32 && TCG_TARGET_HAS_ctpop_i32 && arg2 == 32) {
         /* This equivalence has the advantage of not requiring a fixup.  */
-        TCGv_i32 t = tcg_temp_new_i32();
+        TCGv_i32 t = tcg_temp_ebb_new_i32();
         tcg_gen_subi_i32(t, arg1, 1);
         tcg_gen_andc_i32(t, t, arg1);
         tcg_gen_ctpop_i32(ret, t);
@@ -461,7 +461,7 @@ void tcg_gen_ctzi_i32(TCGv_i32 ret, TCGv_i32 arg1, uint32_t arg2)
 void tcg_gen_clrsb_i32(TCGv_i32 ret, TCGv_i32 arg)
 {
     if (TCG_TARGET_HAS_clz_i32) {
-        TCGv_i32 t = tcg_temp_new_i32();
+        TCGv_i32 t = tcg_temp_ebb_new_i32();
         tcg_gen_sari_i32(t, arg, 31);
         tcg_gen_xor_i32(t, t, arg);
         tcg_gen_clzi_i32(t, t, 32);
@@ -477,7 +477,7 @@ void tcg_gen_ctpop_i32(TCGv_i32 ret, TCGv_i32 arg1)
     if (TCG_TARGET_HAS_ctpop_i32) {
         tcg_gen_op2_i32(INDEX_op_ctpop_i32, ret, arg1);
     } else if (TCG_TARGET_HAS_ctpop_i64) {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(t, arg1);
         tcg_gen_ctpop_i64(t, t);
         tcg_gen_extrl_i64_i32(ret, t);
@@ -494,8 +494,8 @@ void tcg_gen_rotl_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     } else {
         TCGv_i32 t0, t1;
 
-        t0 = tcg_temp_new_i32();
-        t1 = tcg_temp_new_i32();
+        t0 = tcg_temp_ebb_new_i32();
+        t1 = tcg_temp_ebb_new_i32();
         tcg_gen_shl_i32(t0, arg1, arg2);
         tcg_gen_subfi_i32(t1, 32, arg2);
         tcg_gen_shr_i32(t1, arg1, t1);
@@ -515,8 +515,8 @@ void tcg_gen_rotli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
         tcg_gen_rotl_i32(ret, arg1, tcg_constant_i32(arg2));
     } else {
         TCGv_i32 t0, t1;
-        t0 = tcg_temp_new_i32();
-        t1 = tcg_temp_new_i32();
+        t0 = tcg_temp_ebb_new_i32();
+        t1 = tcg_temp_ebb_new_i32();
         tcg_gen_shli_i32(t0, arg1, arg2);
         tcg_gen_shri_i32(t1, arg1, 32 - arg2);
         tcg_gen_or_i32(ret, t0, t1);
@@ -532,8 +532,8 @@ void tcg_gen_rotr_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
     } else {
         TCGv_i32 t0, t1;
 
-        t0 = tcg_temp_new_i32();
-        t1 = tcg_temp_new_i32();
+        t0 = tcg_temp_ebb_new_i32();
+        t1 = tcg_temp_ebb_new_i32();
         tcg_gen_shr_i32(t0, arg1, arg2);
         tcg_gen_subfi_i32(t1, 32, arg2);
         tcg_gen_shl_i32(t1, arg1, t1);
@@ -574,7 +574,7 @@ void tcg_gen_deposit_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2,
         return;
     }
 
-    t1 = tcg_temp_new_i32();
+    t1 = tcg_temp_ebb_new_i32();
 
     if (TCG_TARGET_HAS_extract2_i32) {
         if (ofs + len == 32) {
@@ -801,7 +801,7 @@ void tcg_gen_extract2_i32(TCGv_i32 ret, TCGv_i32 al, TCGv_i32 ah,
     } else if (TCG_TARGET_HAS_extract2_i32) {
         tcg_gen_op4i_i32(INDEX_op_extract2_i32, ret, al, ah, ofs);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         tcg_gen_shri_i32(t0, al, ofs);
         tcg_gen_deposit_i32(ret, t0, ah, 32 - ofs, ofs);
         tcg_temp_free_i32(t0);
@@ -818,8 +818,8 @@ void tcg_gen_movcond_i32(TCGCond cond, TCGv_i32 ret, TCGv_i32 c1,
     } else if (TCG_TARGET_HAS_movcond_i32) {
         tcg_gen_op6i_i32(INDEX_op_movcond_i32, ret, c1, c2, v1, v2, cond);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
         tcg_gen_setcond_i32(cond, t0, c1, c2);
         tcg_gen_neg_i32(t0, t0);
         tcg_gen_and_i32(t1, v1, t0);
@@ -836,8 +836,8 @@ void tcg_gen_add2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
     if (TCG_TARGET_HAS_add2_i32) {
         tcg_gen_op6_i32(INDEX_op_add2_i32, rl, rh, al, ah, bl, bh);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_concat_i32_i64(t0, al, ah);
         tcg_gen_concat_i32_i64(t1, bl, bh);
         tcg_gen_add_i64(t0, t0, t1);
@@ -853,8 +853,8 @@ void tcg_gen_sub2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 al,
     if (TCG_TARGET_HAS_sub2_i32) {
         tcg_gen_op6_i32(INDEX_op_sub2_i32, rl, rh, al, ah, bl, bh);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_concat_i32_i64(t0, al, ah);
         tcg_gen_concat_i32_i64(t1, bl, bh);
         tcg_gen_sub_i64(t0, t0, t1);
@@ -869,14 +869,14 @@ void tcg_gen_mulu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_mulu2_i32) {
         tcg_gen_op4_i32(INDEX_op_mulu2_i32, rl, rh, arg1, arg2);
     } else if (TCG_TARGET_HAS_muluh_i32) {
-        TCGv_i32 t = tcg_temp_new_i32();
+        TCGv_i32 t = tcg_temp_ebb_new_i32();
         tcg_gen_op3_i32(INDEX_op_mul_i32, t, arg1, arg2);
         tcg_gen_op3_i32(INDEX_op_muluh_i32, rh, arg1, arg2);
         tcg_gen_mov_i32(rl, t);
         tcg_temp_free_i32(t);
     } else if (TCG_TARGET_REG_BITS == 64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_extu_i32_i64(t0, arg1);
         tcg_gen_extu_i32_i64(t1, arg2);
         tcg_gen_mul_i64(t0, t0, t1);
@@ -893,16 +893,16 @@ void tcg_gen_muls2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
     if (TCG_TARGET_HAS_muls2_i32) {
         tcg_gen_op4_i32(INDEX_op_muls2_i32, rl, rh, arg1, arg2);
     } else if (TCG_TARGET_HAS_mulsh_i32) {
-        TCGv_i32 t = tcg_temp_new_i32();
+        TCGv_i32 t = tcg_temp_ebb_new_i32();
         tcg_gen_op3_i32(INDEX_op_mul_i32, t, arg1, arg2);
         tcg_gen_op3_i32(INDEX_op_mulsh_i32, rh, arg1, arg2);
         tcg_gen_mov_i32(rl, t);
         tcg_temp_free_i32(t);
     } else if (TCG_TARGET_REG_BITS == 32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
-        TCGv_i32 t2 = tcg_temp_new_i32();
-        TCGv_i32 t3 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t2 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t3 = tcg_temp_ebb_new_i32();
         tcg_gen_mulu2_i32(t0, t1, arg1, arg2);
         /* Adjust for negative inputs.  */
         tcg_gen_sari_i32(t2, arg1, 31);
@@ -917,8 +917,8 @@ void tcg_gen_muls2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
         tcg_temp_free_i32(t2);
         tcg_temp_free_i32(t3);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_ext_i32_i64(t0, arg1);
         tcg_gen_ext_i32_i64(t1, arg2);
         tcg_gen_mul_i64(t0, t0, t1);
@@ -931,9 +931,9 @@ void tcg_gen_muls2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
 void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
 {
     if (TCG_TARGET_REG_BITS == 32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
-        TCGv_i32 t2 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t2 = tcg_temp_ebb_new_i32();
         tcg_gen_mulu2_i32(t0, t1, arg1, arg2);
         /* Adjust for negative input for the signed arg1.  */
         tcg_gen_sari_i32(t2, arg1, 31);
@@ -944,8 +944,8 @@ void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, TCGv_i32 arg2)
         tcg_temp_free_i32(t1);
         tcg_temp_free_i32(t2);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_ext_i32_i64(t0, arg1);
         tcg_gen_extu_i32_i64(t1, arg2);
         tcg_gen_mul_i64(t0, t0, t1);
@@ -1001,8 +1001,8 @@ void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags)
     if (TCG_TARGET_HAS_bswap16_i32) {
         tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg, flags);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
 
         tcg_gen_shri_i32(t0, arg, 8);
         if (!(flags & TCG_BSWAP_IZ)) {
@@ -1030,8 +1030,8 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
     if (TCG_TARGET_HAS_bswap32_i32) {
         tcg_gen_op3i_i32(INDEX_op_bswap32_i32, ret, arg, 0);
     } else {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
         TCGv_i32 t2 = tcg_constant_i32(0x00ff00ff);
 
                                         /* arg = abcd */
@@ -1078,7 +1078,7 @@ void tcg_gen_umax_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
 
 void tcg_gen_abs_i32(TCGv_i32 ret, TCGv_i32 a)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t = tcg_temp_ebb_new_i32();
 
     tcg_gen_sari_i32(t, a, 31);
     tcg_gen_xor_i32(ret, a, t);
@@ -1241,8 +1241,8 @@ void tcg_gen_mul_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     TCGv_i64 t0;
     TCGv_i32 t1;
 
-    t0 = tcg_temp_new_i64();
-    t1 = tcg_temp_new_i32();
+    t0 = tcg_temp_ebb_new_i64();
+    t1 = tcg_temp_ebb_new_i32();
 
     tcg_gen_mulu2_i32(TCGV_LOW(t0), TCGV_HIGH(t0),
                       TCGV_LOW(arg1), TCGV_LOW(arg2));
@@ -1423,7 +1423,7 @@ static inline void tcg_gen_shifti_i64(TCGv_i64 ret, TCGv_i64 arg1,
             tcg_gen_extract2_i32(TCGV_HIGH(ret),
                                  TCGV_LOW(arg1), TCGV_HIGH(arg1), 32 - c);
         } else {
-            TCGv_i32 t0 = tcg_temp_new_i32();
+            TCGv_i32 t0 = tcg_temp_ebb_new_i32();
             tcg_gen_shri_i32(t0, TCGV_LOW(arg1), 32 - c);
             tcg_gen_deposit_i32(TCGV_HIGH(ret), t0,
                                 TCGV_HIGH(arg1), c, 32 - c);
@@ -1557,7 +1557,7 @@ void tcg_gen_div_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_div_i64) {
         tcg_gen_op3_i64(INDEX_op_div_i64, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div2_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_sari_i64(t0, arg1, 63);
         tcg_gen_op5_i64(INDEX_op_div2_i64, ret, t0, arg1, t0, arg2);
         tcg_temp_free_i64(t0);
@@ -1571,13 +1571,13 @@ void tcg_gen_rem_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_rem_i64) {
         tcg_gen_op3_i64(INDEX_op_rem_i64, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_op3_i64(INDEX_op_div_i64, t0, arg1, arg2);
         tcg_gen_mul_i64(t0, t0, arg2);
         tcg_gen_sub_i64(ret, arg1, t0);
         tcg_temp_free_i64(t0);
     } else if (TCG_TARGET_HAS_div2_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_sari_i64(t0, arg1, 63);
         tcg_gen_op5_i64(INDEX_op_div2_i64, t0, ret, arg1, t0, arg2);
         tcg_temp_free_i64(t0);
@@ -1591,7 +1591,7 @@ void tcg_gen_divu_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_div_i64) {
         tcg_gen_op3_i64(INDEX_op_divu_i64, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div2_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_movi_i64(t0, 0);
         tcg_gen_op5_i64(INDEX_op_divu2_i64, ret, t0, arg1, t0, arg2);
         tcg_temp_free_i64(t0);
@@ -1605,13 +1605,13 @@ void tcg_gen_remu_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_rem_i64) {
         tcg_gen_op3_i64(INDEX_op_remu_i64, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_div_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_op3_i64(INDEX_op_divu_i64, t0, arg1, arg2);
         tcg_gen_mul_i64(t0, t0, arg2);
         tcg_gen_sub_i64(ret, arg1, t0);
         tcg_temp_free_i64(t0);
     } else if (TCG_TARGET_HAS_div2_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_movi_i64(t0, 0);
         tcg_gen_op5_i64(INDEX_op_divu2_i64, t0, ret, arg1, t0, arg2);
         tcg_temp_free_i64(t0);
@@ -1710,8 +1710,8 @@ void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg, int flags)
     } else if (TCG_TARGET_HAS_bswap16_i64) {
         tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg, flags);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
 
         tcg_gen_shri_i64(t0, arg, 8);
         if (!(flags & TCG_BSWAP_IZ)) {
@@ -1749,8 +1749,8 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags)
     } else if (TCG_TARGET_HAS_bswap32_i64) {
         tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg, flags);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         TCGv_i64 t2 = tcg_constant_i64(0x00ff00ff);
 
                                             /* arg = xxxxabcd */
@@ -1778,8 +1778,8 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
     if (TCG_TARGET_REG_BITS == 32) {
         TCGv_i32 t0, t1;
-        t0 = tcg_temp_new_i32();
-        t1 = tcg_temp_new_i32();
+        t0 = tcg_temp_ebb_new_i32();
+        t1 = tcg_temp_ebb_new_i32();
 
         tcg_gen_bswap32_i32(t0, TCGV_LOW(arg));
         tcg_gen_bswap32_i32(t1, TCGV_HIGH(arg));
@@ -1790,9 +1790,9 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
     } else if (TCG_TARGET_HAS_bswap64_i64) {
         tcg_gen_op3i_i64(INDEX_op_bswap64_i64, ret, arg, 0);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
                                         /* arg = abcdefgh */
         tcg_gen_movi_i64(t2, 0x00ff00ff00ff00ffull);
@@ -1822,8 +1822,8 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
 void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
     uint64_t m = 0x0000ffff0000ffffull;
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
 
     /* See include/qemu/bitops.h, hswap64. */
     tcg_gen_rotli_i64(t1, arg, 32);
@@ -1863,7 +1863,7 @@ void tcg_gen_andc_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     } else if (TCG_TARGET_HAS_andc_i64) {
         tcg_gen_op3_i64(INDEX_op_andc_i64, ret, arg1, arg2);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_not_i64(t0, arg2);
         tcg_gen_and_i64(ret, arg1, t0);
         tcg_temp_free_i64(t0);
@@ -1917,7 +1917,7 @@ void tcg_gen_orc_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     } else if (TCG_TARGET_HAS_orc_i64) {
         tcg_gen_op3_i64(INDEX_op_orc_i64, ret, arg1, arg2);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_not_i64(t0, arg2);
         tcg_gen_or_i64(ret, arg1, t0);
         tcg_temp_free_i64(t0);
@@ -1938,7 +1938,7 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
     if (TCG_TARGET_REG_BITS == 32
         && TCG_TARGET_HAS_clz_i32
         && arg2 <= 0xffffffffu) {
-        TCGv_i32 t = tcg_temp_new_i32();
+        TCGv_i32 t = tcg_temp_ebb_new_i32();
         tcg_gen_clzi_i32(t, TCGV_LOW(arg1), arg2 - 32);
         tcg_gen_addi_i32(t, t, 32);
         tcg_gen_clz_i32(TCGV_LOW(ret), TCGV_HIGH(arg1), t);
@@ -1956,7 +1956,7 @@ void tcg_gen_ctz_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_ctz_i64) {
         tcg_gen_op3_i64(INDEX_op_ctz_i64, ret, arg1, arg2);
     } else if (TCG_TARGET_HAS_ctpop_i64 || TCG_TARGET_HAS_clz_i64) {
-        TCGv_i64 z, t = tcg_temp_new_i64();
+        TCGv_i64 z, t = tcg_temp_ebb_new_i64();
 
         if (TCG_TARGET_HAS_ctpop_i64) {
             tcg_gen_subi_i64(t, arg1, 1);
@@ -1983,7 +1983,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
     if (TCG_TARGET_REG_BITS == 32
         && TCG_TARGET_HAS_ctz_i32
         && arg2 <= 0xffffffffu) {
-        TCGv_i32 t32 = tcg_temp_new_i32();
+        TCGv_i32 t32 = tcg_temp_ebb_new_i32();
         tcg_gen_ctzi_i32(t32, TCGV_HIGH(arg1), arg2 - 32);
         tcg_gen_addi_i32(t32, t32, 32);
         tcg_gen_ctz_i32(TCGV_LOW(ret), TCGV_LOW(arg1), t32);
@@ -1993,7 +1993,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
                && TCG_TARGET_HAS_ctpop_i64
                && arg2 == 64) {
         /* This equivalence has the advantage of not requiring a fixup.  */
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_subi_i64(t, arg1, 1);
         tcg_gen_andc_i64(t, t, arg1);
         tcg_gen_ctpop_i64(ret, t);
@@ -2008,7 +2008,7 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
 void tcg_gen_clrsb_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
     if (TCG_TARGET_HAS_clz_i64 || TCG_TARGET_HAS_clz_i32) {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_sari_i64(t, arg, 63);
         tcg_gen_xor_i64(t, t, arg);
         tcg_gen_clzi_i64(t, t, 64);
@@ -2039,8 +2039,8 @@ void tcg_gen_rotl_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
         tcg_gen_op3_i64(INDEX_op_rotl_i64, ret, arg1, arg2);
     } else {
         TCGv_i64 t0, t1;
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
+        t0 = tcg_temp_ebb_new_i64();
+        t1 = tcg_temp_ebb_new_i64();
         tcg_gen_shl_i64(t0, arg1, arg2);
         tcg_gen_subfi_i64(t1, 64, arg2);
         tcg_gen_shr_i64(t1, arg1, t1);
@@ -2060,8 +2060,8 @@ void tcg_gen_rotli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
         tcg_gen_rotl_i64(ret, arg1, tcg_constant_i64(arg2));
     } else {
         TCGv_i64 t0, t1;
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
+        t0 = tcg_temp_ebb_new_i64();
+        t1 = tcg_temp_ebb_new_i64();
         tcg_gen_shli_i64(t0, arg1, arg2);
         tcg_gen_shri_i64(t1, arg1, 64 - arg2);
         tcg_gen_or_i64(ret, t0, t1);
@@ -2076,8 +2076,8 @@ void tcg_gen_rotr_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
         tcg_gen_op3_i64(INDEX_op_rotr_i64, ret, arg1, arg2);
     } else {
         TCGv_i64 t0, t1;
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
+        t0 = tcg_temp_ebb_new_i64();
+        t1 = tcg_temp_ebb_new_i64();
         tcg_gen_shr_i64(t0, arg1, arg2);
         tcg_gen_subfi_i64(t1, 64, arg2);
         tcg_gen_shl_i64(t1, arg1, t1);
@@ -2133,7 +2133,7 @@ void tcg_gen_deposit_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2,
         }
     }
 
-    t1 = tcg_temp_new_i64();
+    t1 = tcg_temp_ebb_new_i64();
 
     if (TCG_TARGET_HAS_extract2_i64) {
         if (ofs + len == 64) {
@@ -2365,7 +2365,7 @@ void tcg_gen_sextract_i64(TCGv_i64 ret, TCGv_i64 arg,
             tcg_gen_sextract_i32(TCGV_HIGH(ret), TCGV_HIGH(arg), 0, len - 32);
             return;
         } else if (len > 32) {
-            TCGv_i32 t = tcg_temp_new_i32();
+            TCGv_i32 t = tcg_temp_ebb_new_i32();
             /* Extract the bits for the high word normally.  */
             tcg_gen_sextract_i32(t, TCGV_HIGH(arg), ofs + 32, len - 32);
             /* Shift the field down for the low part.  */
@@ -2460,7 +2460,7 @@ void tcg_gen_extract2_i64(TCGv_i64 ret, TCGv_i64 al, TCGv_i64 ah,
     } else if (TCG_TARGET_HAS_extract2_i64) {
         tcg_gen_op4i_i64(INDEX_op_extract2_i64, ret, al, ah, ofs);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_shri_i64(t0, al, ofs);
         tcg_gen_deposit_i64(ret, t0, ah, 64 - ofs, ofs);
         tcg_temp_free_i64(t0);
@@ -2475,8 +2475,8 @@ void tcg_gen_movcond_i64(TCGCond cond, TCGv_i64 ret, TCGv_i64 c1,
     } else if (cond == TCG_COND_NEVER) {
         tcg_gen_mov_i64(ret, v2);
     } else if (TCG_TARGET_REG_BITS == 32) {
-        TCGv_i32 t0 = tcg_temp_new_i32();
-        TCGv_i32 t1 = tcg_temp_new_i32();
+        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
+        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
         tcg_gen_op6i_i32(INDEX_op_setcond2_i32, t0,
                          TCGV_LOW(c1), TCGV_HIGH(c1),
                          TCGV_LOW(c2), TCGV_HIGH(c2), cond);
@@ -2503,8 +2503,8 @@ void tcg_gen_movcond_i64(TCGCond cond, TCGv_i64 ret, TCGv_i64 c1,
     } else if (TCG_TARGET_HAS_movcond_i64) {
         tcg_gen_op6i_i64(INDEX_op_movcond_i64, ret, c1, c2, v1, v2, cond);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_setcond_i64(cond, t0, c1, c2);
         tcg_gen_neg_i64(t0, t0);
         tcg_gen_and_i64(t1, v1, t0);
@@ -2521,8 +2521,8 @@ void tcg_gen_add2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 al,
     if (TCG_TARGET_HAS_add2_i64) {
         tcg_gen_op6_i64(INDEX_op_add2_i64, rl, rh, al, ah, bl, bh);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_add_i64(t0, al, bl);
         tcg_gen_setcond_i64(TCG_COND_LTU, t1, t0, al);
         tcg_gen_add_i64(rh, ah, bh);
@@ -2539,8 +2539,8 @@ void tcg_gen_sub2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 al,
     if (TCG_TARGET_HAS_sub2_i64) {
         tcg_gen_op6_i64(INDEX_op_sub2_i64, rl, rh, al, ah, bl, bh);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         tcg_gen_sub_i64(t0, al, bl);
         tcg_gen_setcond_i64(TCG_COND_LTU, t1, al, bl);
         tcg_gen_sub_i64(rh, ah, bh);
@@ -2556,13 +2556,13 @@ void tcg_gen_mulu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_mulu2_i64) {
         tcg_gen_op4_i64(INDEX_op_mulu2_i64, rl, rh, arg1, arg2);
     } else if (TCG_TARGET_HAS_muluh_i64) {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_op3_i64(INDEX_op_mul_i64, t, arg1, arg2);
         tcg_gen_op3_i64(INDEX_op_muluh_i64, rh, arg1, arg2);
         tcg_gen_mov_i64(rl, t);
         tcg_temp_free_i64(t);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_mul_i64(t0, arg1, arg2);
         gen_helper_muluh_i64(rh, arg1, arg2);
         tcg_gen_mov_i64(rl, t0);
@@ -2575,16 +2575,16 @@ void tcg_gen_muls2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
     if (TCG_TARGET_HAS_muls2_i64) {
         tcg_gen_op4_i64(INDEX_op_muls2_i64, rl, rh, arg1, arg2);
     } else if (TCG_TARGET_HAS_mulsh_i64) {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_op3_i64(INDEX_op_mul_i64, t, arg1, arg2);
         tcg_gen_op3_i64(INDEX_op_mulsh_i64, rh, arg1, arg2);
         tcg_gen_mov_i64(rl, t);
         tcg_temp_free_i64(t);
     } else if (TCG_TARGET_HAS_mulu2_i64 || TCG_TARGET_HAS_muluh_i64) {
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_temp_new_i64();
-        TCGv_i64 t3 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t2 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t3 = tcg_temp_ebb_new_i64();
         tcg_gen_mulu2_i64(t0, t1, arg1, arg2);
         /* Adjust for negative inputs.  */
         tcg_gen_sari_i64(t2, arg1, 63);
@@ -2599,7 +2599,7 @@ void tcg_gen_muls2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
         tcg_temp_free_i64(t2);
         tcg_temp_free_i64(t3);
     } else {
-        TCGv_i64 t0 = tcg_temp_new_i64();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         tcg_gen_mul_i64(t0, arg1, arg2);
         gen_helper_mulsh_i64(rh, arg1, arg2);
         tcg_gen_mov_i64(rl, t0);
@@ -2609,9 +2609,9 @@ void tcg_gen_muls2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
 
 void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, TCGv_i64 arg2)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
     tcg_gen_mulu2_i64(t0, t1, arg1, arg2);
     /* Adjust for negative input for the signed arg1.  */
     tcg_gen_sari_i64(t2, arg1, 63);
@@ -2645,7 +2645,7 @@ void tcg_gen_umax_i64(TCGv_i64 ret, TCGv_i64 a, TCGv_i64 b)
 
 void tcg_gen_abs_i64(TCGv_i64 ret, TCGv_i64 a)
 {
-    TCGv_i64 t = tcg_temp_new_i64();
+    TCGv_i64 t = tcg_temp_ebb_new_i64();
 
     tcg_gen_sari_i64(t, a, 63);
     tcg_gen_xor_i64(ret, a, t);
@@ -2675,7 +2675,7 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg)
         tcg_gen_op2(INDEX_op_extrh_i64_i32,
                     tcgv_i32_arg(ret), tcgv_i64_arg(arg));
     } else {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
         tcg_gen_shri_i64(t, arg, 32);
         tcg_gen_mov_i32(ret, (TCGv_i32)t);
         tcg_temp_free_i64(t);
@@ -2714,7 +2714,7 @@ void tcg_gen_concat_i32_i64(TCGv_i64 dest, TCGv_i32 low, TCGv_i32 high)
         return;
     }
 
-    tmp = tcg_temp_new_i64();
+    tmp = tcg_temp_ebb_new_i64();
     /* These extensions are only needed for type correctness.
        We may be able to do better given target specific information.  */
     tcg_gen_extu_i32_i64(tmp, high);
@@ -2826,7 +2826,7 @@ void tcg_gen_lookup_and_goto_ptr(void)
     }
 
     plugin_gen_disable_mem_helpers();
-    ptr = tcg_temp_new_ptr();
+    ptr = tcg_temp_ebb_new_ptr();
     gen_helper_lookup_tb_ptr(ptr, cpu_env);
     tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
     tcg_temp_free_ptr(ptr);
@@ -2987,7 +2987,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     oi = make_memop_idx(memop, idx);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
-        swap = tcg_temp_new_i32();
+        swap = tcg_temp_ebb_new_i32();
         switch (memop & MO_SIZE) {
         case MO_16:
             tcg_gen_bswap16_i32(swap, val, 0);
@@ -3082,7 +3082,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     oi = make_memop_idx(memop, idx);
 
     if (!TCG_TARGET_HAS_MEMORY_BSWAP && (memop & MO_BSWAP)) {
-        swap = tcg_temp_new_i64();
+        swap = tcg_temp_ebb_new_i64();
         switch (memop & MO_SIZE) {
         case MO_16:
             tcg_gen_bswap16_i64(swap, val, 0);
@@ -3224,7 +3224,7 @@ void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp memop)
 
     addr_p8 = tcg_temp_new();
     if ((mop[0] ^ memop) & MO_BSWAP) {
-        TCGv_i64 t = tcg_temp_new_i64();
+        TCGv_i64 t = tcg_temp_ebb_new_i64();
 
         tcg_gen_bswap64_i64(t, x);
         gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
@@ -3328,8 +3328,8 @@ static void * const table_cmpxchg[(MO_SIZE | MO_BSWAP) + 1] = {
 void tcg_gen_nonatomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
                                    TCGv_i32 newv, TCGArg idx, MemOp memop)
 {
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
 
     tcg_gen_ext_i32(t2, cmpv, memop & MO_SIZE);
 
@@ -3385,8 +3385,8 @@ void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
         return;
     }
 
-    t1 = tcg_temp_new_i64();
-    t2 = tcg_temp_new_i64();
+    t1 = tcg_temp_ebb_new_i64();
+    t2 = tcg_temp_ebb_new_i64();
 
     tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
 
@@ -3442,9 +3442,9 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
             tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
         }
     } else {
-        TCGv_i32 c32 = tcg_temp_new_i32();
-        TCGv_i32 n32 = tcg_temp_new_i32();
-        TCGv_i32 r32 = tcg_temp_new_i32();
+        TCGv_i32 c32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 n32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
 
         tcg_gen_extrl_i64_i32(c32, cmpv);
         tcg_gen_extrl_i64_i32(n32, newv);
@@ -3476,10 +3476,10 @@ void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
 
         gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
     } else {
-        TCGv_i128 oldv = tcg_temp_new_i128();
-        TCGv_i128 tmpv = tcg_temp_new_i128();
-        TCGv_i64 t0 = tcg_temp_new_i64();
-        TCGv_i64 t1 = tcg_temp_new_i64();
+        TCGv_i128 oldv = tcg_temp_ebb_new_i128();
+        TCGv_i128 tmpv = tcg_temp_ebb_new_i128();
+        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
+        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
         TCGv_i64 z = tcg_constant_i64(0);
 
         tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
@@ -3541,8 +3541,8 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
                                 TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i32, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 t1 = tcg_temp_new_i32();
-    TCGv_i32 t2 = tcg_temp_new_i32();
+    TCGv_i32 t1 = tcg_temp_ebb_new_i32();
+    TCGv_i32 t2 = tcg_temp_ebb_new_i32();
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
@@ -3579,8 +3579,8 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
                                 TCGArg idx, MemOp memop, bool new_val,
                                 void (*gen)(TCGv_i64, TCGv_i64, TCGv_i64))
 {
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
+    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
 
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
@@ -3616,8 +3616,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
         tcg_gen_movi_i64(ret, 0);
 #endif /* CONFIG_ATOMIC64 */
     } else {
-        TCGv_i32 v32 = tcg_temp_new_i32();
-        TCGv_i32 r32 = tcg_temp_new_i32();
+        TCGv_i32 v32 = tcg_temp_ebb_new_i32();
+        TCGv_i32 r32 = tcg_temp_ebb_new_i32();
 
         tcg_gen_extrl_i64_i32(v32, val);
         do_atomic_op_i32(r32, addr, v32, idx, memop & ~MO_SIGN, table);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index bbae9d493b..06ac9d5ab8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1865,7 +1865,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         case TCG_CALL_ARG_EXTEND_U:
         case TCG_CALL_ARG_EXTEND_S:
             {
-                TCGv_i64 temp = tcg_temp_new_i64();
+                TCGv_i64 temp = tcg_temp_ebb_new_i64();
                 TCGv_i32 orig = temp_tcgv_i32(ts);
 
                 if (loc->kind == TCG_CALL_ARG_EXTEND_S) {
-- 
2.34.1


