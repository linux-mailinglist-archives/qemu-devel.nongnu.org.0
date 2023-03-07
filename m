Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDA6AED4C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdz-0002JW-CV; Tue, 07 Mar 2023 13:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdv-0001kE-4N
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:31 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdt-00015c-Ai
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:30 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x11so10485925pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACzXdaEAvrk0EdnFqWlRIyN5JTxLYv2cIZ9ufhodbUg=;
 b=XnaevqftXSbydAS/FEu8iGQehNN34hraIBWIlyHAM1t7zkQUw50VoahCNiU4jzNC6H
 qzvpLTa7LEQ6scRomAgJ3F1V2AfuiWdaJPwYwoTispXwcW1/qLVLlsTL3mMVMxT6rQyR
 86Kz4/9lV8vpA018KdMmvxdzIUz6kygoQthI3sKxWoLJ9GizL5Blrs040aH1bJg5ZmO+
 OBhu+94s2d7vPAseAQU4Ct9PGFXkaM9Ew/Iipt631kn3I/B7i91mnGBLyXAb657er61p
 sRXDq0tRJqvBtzbwMOXPe+s1lf+GDkeUh2KTslOGOnUQE8xM83dhWByFslHlufjVScHl
 fCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ACzXdaEAvrk0EdnFqWlRIyN5JTxLYv2cIZ9ufhodbUg=;
 b=QMNn3pHg2XqvIU2SyrpFojIDFVpqDBlKaDSMnuf00lqGPfh8Asl5q0+BKz4KIWw5Ie
 BT79I91m2PUUDmaNcwuZU8QGshb3GZdzmOMDbtGztt2KQmhXvS4/ZxgU2VTyvctZqHTT
 wJYnZ2lIHfcypxt2WPXir0S3XTrUDzKTD9KMGZTYOc5reXolYbjyL9ZYvHqesmCvkdGD
 lJIoadpQ2diGWGgwPeTInbjvdEKtPr/iemdwlz/je9iwe29Fub5iZ1gEolyspSR6bV8M
 /oktU0UCGMJIs4vzX/ImGJ+B0Sc0WO0t+JNEk7Iu8Ljv3QlHzjj+54wLC2C1L2uY8vAL
 /GZA==
X-Gm-Message-State: AO0yUKVNZjSSgcrWJpoPiOGGr2G7IjZ/MpOfCLM4zvPmb5youZSlxsZs
 q/AYygqRjqXrGoVNK9eW9ZiPvjLL8ZH05aMRTfI=
X-Google-Smtp-Source: AK7set9VMCHV6aA1ct03KedE7T3oX1CLpIEtntuKitYhKAI+uBvXBfeLT1O1YXgjplkTeune+vFoNg==
X-Received: by 2002:a05:6a21:328d:b0:cc:6b15:2bd6 with SMTP id
 yt13-20020a056a21328d00b000cc6b152bd6mr18256057pzb.25.1678212146466; 
 Tue, 07 Mar 2023 10:02:26 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 46/67] target/m68k: Avoid tcg_const_i32 in bfop_reg
Date: Tue,  7 Mar 2023 09:58:27 -0800
Message-Id: <20230307175848.2508955-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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


