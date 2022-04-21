Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC850AAE7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:43:38 +0200 (CEST)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheaP-0004dn-4c
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWY-0005sa-Su
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWW-00073T-M3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q1so5423062plx.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jDyJgvNM0c5Urpik9yfZ6F1Cx1+upvgUQ/VZpYWE2kQ=;
 b=CBlkgWSbOwdvvy8Zy+h25WGJKjRLPzRXjixsa6JnCZJmO4mHCqpaUi50b1Wr9uUI1l
 6hASGVOYoXEGr/8Bss5QB/u01TlRRsNnG553B44cDCjy0Peh7JhAgvivhcMxvIWQavzO
 ZcToud80FYQqpncJefy3r1EKHg1hgaLfGgkBVpPaa8/rMIeiylDlnHbOsvfLqid6bGdc
 ACnCqcdxhlLQhGYcpixtg8gbijuXK7c4vXvaa39Uije46TSdQ6yLoXxjgS2s4kREqPgO
 tSgked9CjUZ1ETUTUsUModX61rU69rY9m7vBro1NsMdeagiK/WhdZxkoByoY0POHNMyF
 OrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jDyJgvNM0c5Urpik9yfZ6F1Cx1+upvgUQ/VZpYWE2kQ=;
 b=BJs80M5jcBb+fIISLYr42rl5wFbTUIIYSv98TGSdWryAz30Xfx8JPNMz3s3EySRXyo
 rPIT6iMlYoEJ1UlwRJ6SKK6G564TxRkkQGwjAoWq9i748y8zRM33wAi4TALtIdR4KFuh
 WA2nTKfFEWMa1O9F+DnCi958RipOMG/fOFcVdb9a2uYQ6T4LI6MPTY0YsBWcjZbM6y+m
 cjR4rsTslxJ6ZhZn0wOBeGPpVj4P3vqH4uKlcWRwGLwUn6dUHIf8tkHFMW6B7Cw8Xi/k
 BLBb2AvTPIOo50mz3nvUrW7Fkzc/V1euMUkYZ9LNVtl37toQkqZiwp4g6Jm4lBXLz9EW
 6nMg==
X-Gm-Message-State: AOAM530HoltAxl4vWys4N0usrU7+Xz268TubphGnTU3FzpK5clX/oNCZ
 mJByGdVRvx2L8ji3l/7CEXXtHaL5SL9zuQ==
X-Google-Smtp-Source: ABdhPJwmWBE9H5P04DRkgSIgogxqJ5wxFZ/tQLp1aA80CfHcE+SNQc0xLEeUUu0TZ/YMh4gIG6l2fQ==
X-Received: by 2002:a17:902:e541:b0:159:db95:9d30 with SMTP id
 n1-20020a170902e54100b00159db959d30mr1402433plf.91.1650577175263; 
 Thu, 21 Apr 2022 14:39:35 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:34 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/xtensa: use tcg_constant_* for FPU conversion
 opcodes
Date: Thu, 21 Apr 2022 14:39:16 -0700
Message-Id: <20220421213917.368830-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FPU conversion opcodes pass scale (range 0..15) and rounding mode to
their helpers. Use tcg_constant_* for them.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index c4991735ead7..fb4d80669c47 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -6515,20 +6515,19 @@ static void translate_const_s(DisasContext *dc, const OpcodeArg arg[],
 static void translate_float_d(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 scale = tcg_const_i32(-arg[2].imm);
+    TCGv_i32 scale = tcg_constant_i32(-arg[2].imm);
 
     if (par[0]) {
         gen_helper_uitof_d(arg[0].out, cpu_env, arg[1].in, scale);
     } else {
         gen_helper_itof_d(arg[0].out, cpu_env, arg[1].in, scale);
     }
-    tcg_temp_free(scale);
 }
 
 static void translate_float_s(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
-    TCGv_i32 scale = tcg_const_i32(-arg[2].imm);
+    TCGv_i32 scale = tcg_constant_i32(-arg[2].imm);
     OpcodeArg arg32[1];
 
     get_f32_o1(arg, arg32, 0);
@@ -6538,14 +6537,13 @@ static void translate_float_s(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_itof_s(arg32[0].out, cpu_env, arg[1].in, scale);
     }
     put_f32_o1(arg, arg32, 0);
-    tcg_temp_free(scale);
 }
 
 static void translate_ftoi_d(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 rounding_mode = tcg_const_i32(par[0]);
-    TCGv_i32 scale = tcg_const_i32(arg[2].imm);
+    TCGv_i32 rounding_mode = tcg_constant_i32(par[0]);
+    TCGv_i32 scale = tcg_constant_i32(arg[2].imm);
 
     if (par[1]) {
         gen_helper_ftoui_d(arg[0].out, cpu_env, arg[1].in,
@@ -6554,15 +6552,13 @@ static void translate_ftoi_d(DisasContext *dc, const OpcodeArg arg[],
         gen_helper_ftoi_d(arg[0].out, cpu_env, arg[1].in,
                           rounding_mode, scale);
     }
-    tcg_temp_free(rounding_mode);
-    tcg_temp_free(scale);
 }
 
 static void translate_ftoi_s(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 rounding_mode = tcg_const_i32(par[0]);
-    TCGv_i32 scale = tcg_const_i32(arg[2].imm);
+    TCGv_i32 rounding_mode = tcg_constant_i32(par[0]);
+    TCGv_i32 scale = tcg_constant_i32(arg[2].imm);
     OpcodeArg arg32[2];
 
     get_f32_i1(arg, arg32, 1);
@@ -6574,8 +6570,6 @@ static void translate_ftoi_s(DisasContext *dc, const OpcodeArg arg[],
                           rounding_mode, scale);
     }
     put_f32_i1(arg, arg32, 1);
-    tcg_temp_free(rounding_mode);
-    tcg_temp_free(scale);
 }
 
 static void translate_ldsti(DisasContext *dc, const OpcodeArg arg[],
-- 
2.30.2


