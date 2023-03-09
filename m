Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECA6B2E7C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:20:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMax-0006fs-O5; Thu, 09 Mar 2023 15:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaP-0005YH-GH
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:05 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaN-0001dC-Le
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y11so3242112plg.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1KeE8/x+gbRZ4wtBXKBEex8o90m+5WViCdselB5pOEg=;
 b=xWMpGfPupYXG5KzoIlS64FN/FKiuBRC67q64as2BQAyXfjAUYhx1j5F7Hnxfv+UeNr
 Mb0gWNBeNBXxjkKiWXgTMbNuXgwD7zERaOv5DVO06bt9stJ9suNt+0H7IIyH5n2ZMWPm
 i4NxYiKZ4742WlZj0WD412zHRmgxHpc44esCnvMJbRofGT3/h7Ao8d6J7nZdq9D2M9Ug
 7JAq/78XG46N0fHRxExfo6X/ScHFybq7coLx5I1NWpTwyKdbAl3l+RSMQ2mnYABWu9KX
 RA16rgXJvLgKfMnLNhk6CjTusZy7BDbzSrtRU3SQ/MPDhhcG9qpIOII215E8AHkJpoSw
 ElcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1KeE8/x+gbRZ4wtBXKBEex8o90m+5WViCdselB5pOEg=;
 b=Ygjl+4u2oT4ctfaYTZzrCxcDjJmLXELKvxF2i3vmWS5RDBPadnND3jzS4CxoyDMdS4
 w4FQqynI/SjjinOrdG8ipEMvND45W2IRjXzM3gVVuEd7cmKFkI3881sc9RyA+yi9MYw+
 1hfUiIdFOGC+hAY8OyCa9vu1n5ECV9FA9rGn9tO/iRE3waI4wkUSoC2JB5RTR/kFkFxA
 +KYL1/zfluA4YkCYbLDOcySkrLwAETQ4tEXfqcNHWvM7+5fpghnmvpHkhqf7dPEJFDcM
 km9yNYsLowj9aFClM5wd7njRHhRcsTRh8tn3ODtPO6pk8kYGjrin0NAMziY+Nl95Cv6m
 Nb9A==
X-Gm-Message-State: AO0yUKUSy+y9x9fdiF3DJMEtbEi1zKjkVmh73VyH9/LhLuL4Vtzd+pMX
 CbA9iPbAiYDqJ6YlphxLcZpI88Xe69kTwSPhPtc=
X-Google-Smtp-Source: AK7set/kEyCtdVhJ85i/pANFT5WyciyIstx7yeIxGdvGXBv3E26zIi1kK9HJHo6Q9Uc6SX3/R+28Ow==
X-Received: by 2002:a17:902:ea03:b0:19e:2869:7793 with SMTP id
 s3-20020a170902ea0300b0019e28697793mr25795286plg.16.1678392598833; 
 Thu, 09 Mar 2023 12:09:58 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 76/91] target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
Date: Thu,  9 Mar 2023 12:05:35 -0800
Message-Id: <20230309200550.3878088-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

It is easy enough to use mov instead of or-with-zero and relying
on the optimizer to fold away the or.  Use an array for the output,
rather than separate tcg_res{l,h} variables.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


