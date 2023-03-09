Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846C6B2E5D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa3-0003kD-W9; Thu, 09 Mar 2023 15:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa0-0003TS-AO
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:36 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZy-0001W4-Ai
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:35 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso7413799pjb.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACzXdaEAvrk0EdnFqWlRIyN5JTxLYv2cIZ9ufhodbUg=;
 b=GhZpNIREXhYeeZdf9ZQxTDbHUzbraFrm42r+hBKR3idNfzKbYylt2pAj4uz/EMGPeL
 gnfrHuXdryQ1xN7bKTJNlIrG9K9udTKmelQ2gxvRvQITVPuu0it5fLTWDrtwqJ8lqN7H
 HMLSfCNzmfM4eEUeOiyzWUFSgB75VvOsAo8k/XIrwa14X1YPMcRaCPAI07OeJiGJHwDA
 Ro0tD+f2XJm+zi+smRCw4H41bFaPj7w166pex9Y1dWe5aJIYZPItfEMMWHBANYRPHtIU
 zxx1qMz/yHbI4ScEoRgqADHGfjeDsfLfum1yaGM31MSE2xLMfMnTbqGTUVtHC7CMrdcc
 yykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACzXdaEAvrk0EdnFqWlRIyN5JTxLYv2cIZ9ufhodbUg=;
 b=k7RIG6+nTRN7BuSJhBHn+BhGm1ZNvv/VAdGpcoNp0xv6WuM0/IjmcG40ldjhTO2cGx
 GRzRAsEvkPCJdRnWQCAuCjP8MfEUzWMXbdfdnfp4HlOoC8Z9+VUKAWt0si/Bn0LoQZTH
 aubpPqfk3N+xC9mYTj1/zRLGSOnsYSO/6cUrygkaBhMyQ2MZYXbMAaFLZj//a9Cy+Wc5
 ZZ76uakKJ5NU+eo9OixVlIjzWp2cmvhN/W+MSSuEnsXo0pBCoa4ik3Ed9nnhec6mAewA
 JZyIcQugYxQ/RrgiIwZs5hnbQaJvM1EQDVZdrk/Qrrn5o7Vej53QJgDcD+Y6biuO6rEn
 Jbgg==
X-Gm-Message-State: AO0yUKXQqJ1foXVsS0V4OAm7tC412wfd5WXU3qIRVVD0Kg4hdX8nfO60
 4af0nYvzRcoH+32kSfCo4KO1X/k9Qzg6NPOq/Bk=
X-Google-Smtp-Source: AK7set/SDBcvEeJBP6r4MlYYIpSRF6ygTfqUw3KtItosG05GGDG23ZxVuAf4gR0T+OTHhhtp8CB0ww==
X-Received: by 2002:a17:902:c40a:b0:19a:5958:15e7 with SMTP id
 k10-20020a170902c40a00b0019a595815e7mr24490983plk.15.1678392573068; 
 Thu, 09 Mar 2023 12:09:33 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 46/91] target/m68k: Avoid tcg_const_i32 in bfop_reg
Date: Thu,  9 Mar 2023 12:05:05 -0800
Message-Id: <20230309200550.3878088-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Tidy up the whole function, hoisting is_bfffo as a common test
for whether tlen and tofs needed. Use tcg_constant_i32, and load
a separate temporary for mask.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0002d80bf9..e78722fba8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4027,14 +4027,8 @@ DISAS_INSN(bfop_reg)
     TCGv src = DREG(insn, 0);
     int len = ((extract32(ext, 0, 5) - 1) & 31) + 1;
     int ofs = extract32(ext, 6, 5);  /* big bit-endian */
-    TCGv mask, tofs, tlen;
-
-    tofs = NULL;
-    tlen = NULL;
-    if ((insn & 0x0f00) == 0x0d00) { /* bfffo */
-        tofs = tcg_temp_new();
-        tlen = tcg_temp_new();
-    }
+    TCGv mask, tofs = NULL, tlen = NULL;
+    bool is_bfffo = (insn & 0x0f00) == 0x0d00;
 
     if ((ext & 0x820) == 0) {
         /* Immediate width and offset.  */
@@ -4045,45 +4039,49 @@ DISAS_INSN(bfop_reg)
             tcg_gen_rotli_i32(QREG_CC_N, src, ofs);
         }
         tcg_gen_andi_i32(QREG_CC_N, QREG_CC_N, ~maski);
-        mask = tcg_const_i32(ror32(maski, ofs));
-        if (tofs) {
-            tcg_gen_movi_i32(tofs, ofs);
-            tcg_gen_movi_i32(tlen, len);
+
+        mask = tcg_constant_i32(ror32(maski, ofs));
+        if (is_bfffo) {
+            tofs = tcg_constant_i32(ofs);
+            tlen = tcg_constant_i32(len);
         }
     } else {
         TCGv tmp = tcg_temp_new();
+
+        mask = tcg_temp_new();
         if (ext & 0x20) {
             /* Variable width */
             tcg_gen_subi_i32(tmp, DREG(ext, 0), 1);
             tcg_gen_andi_i32(tmp, tmp, 31);
-            mask = tcg_const_i32(0x7fffffffu);
-            tcg_gen_shr_i32(mask, mask, tmp);
-            if (tlen) {
+            tcg_gen_shr_i32(mask, tcg_constant_i32(0x7fffffffu), tmp);
+            if (is_bfffo) {
+                tlen = tcg_temp_new();
                 tcg_gen_addi_i32(tlen, tmp, 1);
             }
         } else {
             /* Immediate width */
-            mask = tcg_const_i32(0x7fffffffu >> (len - 1));
-            if (tlen) {
-                tcg_gen_movi_i32(tlen, len);
+            tcg_gen_movi_i32(mask, 0x7fffffffu >> (len - 1));
+            if (is_bfffo) {
+                tlen = tcg_constant_i32(len);
             }
         }
+
         if (ext & 0x800) {
             /* Variable offset */
             tcg_gen_andi_i32(tmp, DREG(ext, 6), 31);
             tcg_gen_rotl_i32(QREG_CC_N, src, tmp);
             tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
             tcg_gen_rotr_i32(mask, mask, tmp);
-            if (tofs) {
-                tcg_gen_mov_i32(tofs, tmp);
+            if (is_bfffo) {
+                tofs = tmp;
             }
         } else {
             /* Immediate offset (and variable width) */
             tcg_gen_rotli_i32(QREG_CC_N, src, ofs);
             tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
             tcg_gen_rotri_i32(mask, mask, ofs);
-            if (tofs) {
-                tcg_gen_movi_i32(tofs, ofs);
+            if (is_bfffo) {
+                tofs = tcg_constant_i32(ofs);
             }
         }
     }
-- 
2.34.1


