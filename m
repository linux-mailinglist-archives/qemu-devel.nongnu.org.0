Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222446B2E87
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMkT-0002xH-FA; Thu, 09 Mar 2023 15:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMkJ-0002m7-17
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:20:15 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMkH-0003VZ-Cw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:20:14 -0500
Received: by mail-vs1-xe32.google.com with SMTP id by13so2756814vsb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678393212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5qmvJC78dvP/8IR5foQ1MdkFwyxST3H7G2KLxHBk9o=;
 b=zpo1cl6SNqZQBk/mX6Mq3vt1gpj5t2Q6eEHAgKpC856uI9WdHXg9wY9wdF/tZ0+gEf
 zSzXilwXTRE8nxzBrUj7lOOAoFVPWKcNzMqqt2JN5p1zyzOJXTXFZoofZz3UpCSB7Q6u
 j5dii+s44eImFehWHKgk7k6P0i2CIXfu/+4nKfvtq0PyF7IxSjzooD9SDJIXbcn2J5lZ
 0CJRuTwIqPvKKyAu5Aw66qgqP74z6MKSCQs3YOlfVMkdKZyaCYZuZ3i4oZOhypt/+1Kv
 C/sG33RKdZxUqa54iUjsDG8gVSLbdRdOBJcX7HworK555gPZ2Ivjo/KIlrBcHt+4pd5D
 JLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678393212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E5qmvJC78dvP/8IR5foQ1MdkFwyxST3H7G2KLxHBk9o=;
 b=dSQrKnsSV5zVQ+SW4QOxVRJ7azO31rM1nayNgFqijxdknEmnif3gIM3pFiyWFIrwqJ
 Ku/PfP/nC237HzXhKJMQ9wo8O3/6lGbxMgBrTBO0FizkFgisEKNCjfsXvbNLOdSFY8eN
 FQY0JRU5SL4i3gi5o4yPdERqxGK4ryxZ8Yr7yQvGUUYS5nkmVKGqhcc7sGB8pdKmolog
 72CnWg5dM8oog+L5kzrqXPj1PVyesFLzpBudf3iPkgtclRvAGbmeqL0v7J+5ujnipdET
 Pmb/17HyO6XhGNWCNMYjxG2I2KtzWRt2b8PPDuJT2bjxegTvxTbE3rWiT/cMMfvELNlT
 M+UA==
X-Gm-Message-State: AO0yUKWyrYaQxJvltlUNM8v6+dCn0tltJ5hBH2rx8JZppoD75QpZJ+qr
 vazEeeiFEmkgAq583RjVJGkGLt0jEHiMwbg1kRQ=
X-Google-Smtp-Source: AK7set/u4oLnao85Dpr4fJhmohcNZee8GcOouzIY0cXQ8oqWAB+MQknUOkVLm51nzXhtr/3PUgVbRQ==
X-Received: by 2002:a62:6541:0:b0:5a8:d97d:c346 with SMTP id
 z62-20020a626541000000b005a8d97dc346mr18841962pfb.12.1678392786418; 
 Thu, 09 Mar 2023 12:13:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 82/91] target/ppc: Avoid tcg_const_* in xxeval
Date: Thu,  9 Mar 2023 12:05:41 -0800
Message-Id: <20230309200550.3878088-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe32.google.com
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

Initialize a new temp instead of tcg_const_*.
Fix a pasto in a comment.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vsx-impl.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 6e63403727..9916784e64 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2449,7 +2449,8 @@ static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
     TCGv_i64 conj, disj;
 
     conj = tcg_temp_new_i64();
-    disj = tcg_const_i64(0);
+    disj = tcg_temp_new_i64();
+    tcg_gen_movi_i64(disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2492,8 +2493,9 @@ static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
     int bit;
     TCGv_vec disj, conj;
 
-    disj = tcg_const_zeros_vec_matching(t);
     conj = tcg_temp_new_vec_matching(t);
+    disj = tcg_temp_new_vec_matching(t);
+    tcg_gen_dupi_vec(vece, disj, 0);
 
     /* Iterate over set bits from the least to the most significant bit */
     while (imm) {
@@ -2546,7 +2548,7 @@ static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
 
     /* Equivalent functions that can be implemented with a single gen_gvec */
     switch (a->imm) {
-    case 0b00000000: /* true */
+    case 0b00000000: /* false */
         set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
         set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
         break;
-- 
2.34.1


