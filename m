Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43488698AD5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTb-0004HY-DY; Wed, 15 Feb 2023 21:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTY-00044t-UH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:24 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTW-0005ps-6A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:24 -0500
Received: by mail-pg1-x52e.google.com with SMTP id y186so403390pgb.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zgKVGamtNyyVi4mZ2KMjAyJ6Yx88IG+M/cd77HEWakQ=;
 b=OyVbDrgutGYWmP0yULW8drYpw5d+9SsVvrQ8FicDxZfK8CqeBO0ogN07vF2HHfbgEb
 V+GQGLyzTWxz9x9Xh+rk/atKNCcsvEw8xUX4tVcTV5SDXEgXyX6LRPVRiOpSUkU05JDC
 YfNc7IeuniHvBrJnMbkbDo+d7jgiPkNEugUBUdatQgjKcVMZwQXs12V/k0F+mrjwqCqS
 hTIzjaj7rvF7xKdkyLqKqwXhmuG/vrAO93Boi5+OK73PoRbJPvaOXm65mbhKm5+PLYun
 NGzqgcX4xQG16ClmyiNGK5ssXJGOwsO1hUqeEeCYc1C5deXl6ytIrYBOoRHkLWHUIf3F
 qIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgKVGamtNyyVi4mZ2KMjAyJ6Yx88IG+M/cd77HEWakQ=;
 b=ZV0GGnZ5hKxM6F/Iokg3wpkRl+yIL6ArSwg+pStB8u1iBOpIHR1gwKJpEWIdjopN4W
 rTRWyV27jDlJRuraXCFGaNBbnFp9GFuhOqftw2kAzcjQTqLLIqwR+C2gWG/BlkLtsp36
 p0rQa36IKVQAEhl8eKa471lZkqjmaQxBEUG7nBhNQ0Cta8RskZtUnJqKrGKIymQ2Fa4E
 vUFLe3pmx2oz81QgXeqOIAALIG/N4vpJy49gxLPoZu0QqArL4Eg7jxFxRKPey6J/tnSC
 EmtPwqCFWjow9Ukp5vdpYxDqrXYMxVPw4LxzXKDvdyUhx6q4TcNxgwDWrYhj1zeKBMhv
 841A==
X-Gm-Message-State: AO0yUKWOA7uR+o1lUe0X4W18Oa3oDYSYkoZqRHsf8GhPPnPD92Tjtai/
 aKUkYSNiZrw7Nl4mzU1LZSdwhdDNMljXasOIKUU=
X-Google-Smtp-Source: AK7set8GM3irtldThO0jYY5BJNoE9q2rF983UN9G+yPN5iHdkxezqp7wyGuU86PVQi5E6Ag4Y4msNg==
X-Received: by 2002:a62:1d43:0:b0:5a8:cbcc:4b58 with SMTP id
 d64-20020a621d43000000b005a8cbcc4b58mr3363198pfd.12.1676516300891; 
 Wed, 15 Feb 2023 18:58:20 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/30] tcg/i386: Add vex_v argument to
 tcg_out_vex_modrm_pool
Date: Wed, 15 Feb 2023 16:57:38 -1000
Message-Id: <20230216025739.1211680-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 6fdf79020f..834978f7a6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -841,9 +841,9 @@ static inline void tcg_out_modrm_pool(TCGContext *s, int opc, int r)
 }
 
 /* Output an opcode with an expected reference to the constant pool.  */
-static inline void tcg_out_vex_modrm_pool(TCGContext *s, int opc, int r)
+static inline void tcg_out_vex_modrm_pool(TCGContext *s, int opc, int r, int v)
 {
-    tcg_out_vex_opc(s, opc, r, 0, 0, 0);
+    tcg_out_vex_opc(s, opc, r, v, 0, 0);
     /* Absolute for 32-bit, pc-relative for 64-bit.  */
     tcg_out8(s, LOWREGMASK(r) << 3 | 5);
     tcg_out32(s, 0);
@@ -990,18 +990,18 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
 
     if (TCG_TARGET_REG_BITS == 32 && vece < MO_64) {
         if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret, 0);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret, 0);
         }
         new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
     } else {
         if (type == TCG_TYPE_V64) {
-            tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret);
+            tcg_out_vex_modrm_pool(s, OPC_MOVQ_VqWq, ret, 0);
         } else if (have_avx2) {
-            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTQ + vex_l, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTQ + vex_l, ret, 0);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret);
+            tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret, 0);
         }
         if (TCG_TARGET_REG_BITS == 64) {
             new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
@@ -1024,7 +1024,7 @@ static void tcg_out_movi_vec(TCGContext *s, TCGType type,
     }
 
     int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
-    tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy + rexw, ret);
+    tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy + rexw, ret, 0);
     if (TCG_TARGET_REG_BITS == 64) {
         new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
     } else {
-- 
2.34.1


