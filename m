Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010816AF0C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9c-0003cS-Vh; Tue, 07 Mar 2023 13:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9a-0003az-SW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:14 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9Z-0007k9-A0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:14 -0500
Received: by mail-pj1-x102b.google.com with SMTP id kb15so14152359pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlLYr3YHV/IKgF5NqXVisgWgoHCRdTJrLZVxaTb9ZNw=;
 b=XGNP3fZLGXwKxJ91eGZuiK0wbrcXpXQKQF1L00BF1oIcaIAu+lfwysHGXj6nGCCvxd
 eLre6gVKc9OVWSuWQI+FQqAxjt2lqdqz5LKZPNE4yAx+/V96uYxxvc0yNsnPAvfzzXi8
 +eyY5RbYspzpmBGjbKlNBV4Tv+ELGjwQt0ahfxn5rRlnRTjHamcTGM5LRReBUeS0S0EE
 cNtdFpUL9Gxa5LQpApnVGjiyqaPqtC8TfwHEvkuIhRH00XIJgWQtGdWDrtwiGHZnakpF
 YwAsF581Q43xHs0La1E0oG5/YkmBtHSThzBmOeDPDKkMkKkUtIWZA1OCd4ATvCRnBocW
 4H7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlLYr3YHV/IKgF5NqXVisgWgoHCRdTJrLZVxaTb9ZNw=;
 b=ekiKBSsdYBlBLrbqIAGIugVCspiuu0jUwJiWpgCQC1WlggISHJnqodwEsnZT8smgcp
 wDEFkd5Vg3LKtmrbE0aYwgxw2BTxyC1tPC4WP4L3tnvbl9f4XiSghEIviiwnchNCj1Yi
 4JuWNG12anePdE87X+zn6G416zES9eY463VlD2xjdNfGgyHzaeWhdHb1rwBwPgwlX0AS
 KPfrM8Uy5t9cDdcp9EtATmiJBZ0LRgFOetsJ3l5fCF8TfyM8A7Oi+Pg3Jkaeeyy68qCf
 gwS3IT0U9wUqVj22M7HyMgQh9zJAFGbVsR4t1wsJNSWbiVAU7GYNkqEw1koupXr+5sSk
 MCRA==
X-Gm-Message-State: AO0yUKXXbYrdHqHHcLeHt/kAVOpFQ2n34oolOSSuvgQ2Yaad1Hb/QN0P
 Xwu/ti31gi5/fKt4V1pXhr2qwXMRdW4zAmeWaSc=
X-Google-Smtp-Source: AK7set8NxDvr298GddAUxNc9gCc4herUfSNlyuAu5/PunN8YRJvFC4xQJL1pEOcvCCmRF9slCKneSw==
X-Received: by 2002:a17:90b:4b41:b0:234:f4a:8985 with SMTP id
 mi1-20020a17090b4b4100b002340f4a8985mr16506698pjb.15.1678214111381; 
 Tue, 07 Mar 2023 10:35:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 09/25] target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
Date: Tue,  7 Mar 2023 10:34:47 -0800
Message-Id: <20230307183503.2512684-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

It is easy enough to use mov instead of or-with-zero
and relying on the optimizer to fold away the or.
Use an array for the output, rather than separate
tcg_res{l,h} variables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 989c958de6..2ad7c48901 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7442,10 +7442,10 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
     bool part = extract32(insn, 14, 1);
     bool is_q = extract32(insn, 30, 1);
     int esize = 8 << size;
-    int i, ofs;
+    int i;
     int datasize = is_q ? 128 : 64;
     int elements = datasize / esize;
-    TCGv_i64 tcg_res, tcg_resl, tcg_resh;
+    TCGv_i64 tcg_res[2], tcg_ele;
 
     if (opcode == 0 || (size == 3 && !is_q)) {
         unallocated_encoding(s);
@@ -7456,37 +7456,39 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_resl = tcg_const_i64(0);
-    tcg_resh = is_q ? tcg_const_i64(0) : NULL;
-    tcg_res = tcg_temp_new_i64();
+    tcg_res[0] = tcg_temp_new_i64();
+    tcg_res[1] = is_q ? tcg_temp_new_i64() : NULL;
+    tcg_ele = tcg_temp_new_i64();
 
     for (i = 0; i < elements; i++) {
+        int o, w;
+
         switch (opcode) {
         case 1: /* UZP1/2 */
         {
             int midpoint = elements / 2;
             if (i < midpoint) {
-                read_vec_element(s, tcg_res, rn, 2 * i + part, size);
+                read_vec_element(s, tcg_ele, rn, 2 * i + part, size);
             } else {
-                read_vec_element(s, tcg_res, rm,
+                read_vec_element(s, tcg_ele, rm,
                                  2 * (i - midpoint) + part, size);
             }
             break;
         }
         case 2: /* TRN1/2 */
             if (i & 1) {
-                read_vec_element(s, tcg_res, rm, (i & ~1) + part, size);
+                read_vec_element(s, tcg_ele, rm, (i & ~1) + part, size);
             } else {
-                read_vec_element(s, tcg_res, rn, (i & ~1) + part, size);
+                read_vec_element(s, tcg_ele, rn, (i & ~1) + part, size);
             }
             break;
         case 3: /* ZIP1/2 */
         {
             int base = part * elements / 2;
             if (i & 1) {
-                read_vec_element(s, tcg_res, rm, base + (i >> 1), size);
+                read_vec_element(s, tcg_ele, rm, base + (i >> 1), size);
             } else {
-                read_vec_element(s, tcg_res, rn, base + (i >> 1), size);
+                read_vec_element(s, tcg_ele, rn, base + (i >> 1), size);
             }
             break;
         }
@@ -7494,19 +7496,18 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
             g_assert_not_reached();
         }
 
-        ofs = i * esize;
-        if (ofs < 64) {
-            tcg_gen_shli_i64(tcg_res, tcg_res, ofs);
-            tcg_gen_or_i64(tcg_resl, tcg_resl, tcg_res);
+        w = (i * esize) / 64;
+        o = (i * esize) % 64;
+        if (o == 0) {
+            tcg_gen_mov_i64(tcg_res[w], tcg_ele);
         } else {
-            tcg_gen_shli_i64(tcg_res, tcg_res, ofs - 64);
-            tcg_gen_or_i64(tcg_resh, tcg_resh, tcg_res);
+            tcg_gen_shli_i64(tcg_ele, tcg_ele, o);
+            tcg_gen_or_i64(tcg_res[w], tcg_res[w], tcg_ele);
         }
     }
 
-    write_vec_element(s, tcg_resl, rd, 0, MO_64);
-    if (is_q) {
-        write_vec_element(s, tcg_resh, rd, 1, MO_64);
+    for (i = 0; i <= is_q; ++i) {
+        write_vec_element(s, tcg_res[i], rd, i, MO_64);
     }
     clear_vec_high(s, is_q, rd);
 }
-- 
2.34.1


