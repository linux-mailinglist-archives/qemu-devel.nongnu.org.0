Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3E6B2E3E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:10:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMZz-0003L8-2N; Thu, 09 Mar 2023 15:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZw-0003Da-Ka
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:32 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMZu-0001Uo-Sp
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:32 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u5so3206800plq.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FP4phlNuAKGlZMwdRjX+9/17//cy6MzJB0F0PRHIeY=;
 b=L4rlF5cnscLEiHYR9VJopFXzxkuTC7aJqJ9hcC3OiuLbwJ0ZQxCKerDrmoADteHeqg
 l0uk2BK0AyZpzvci4IMAO9QcRMvojb/TfPZmsyY381VeRNBusxJ5Pj3gKoZ5akTyjBjo
 8JmF80I5HcELLqWfC/V3W80dkvsOsWOjmJicjOHOp73cgec+BHx/u5plfLnB3xa1melk
 e85MKm+25cohljzj4vEPpK7Yxu5T0kX+m9oxerOhtnjFW9F7g22DB75foYzm1AKI1ckS
 QkEKn5fEQn7c2gLbufh70qk8B76h4PgyrA4T5XLmB4/zjev8r2LLAWIgGnjXYGouDv2T
 1u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FP4phlNuAKGlZMwdRjX+9/17//cy6MzJB0F0PRHIeY=;
 b=7qPWEP5SG6cAnH3+rwm64giBots9tkodFhPxzA32bsXyv/TtiMKebTniO/WOt8rLWE
 FY3aXOzpMOf/fZIZCiNNBluiw5BEilT/y/fZKqxGF/Fe9cbpoT9E9NydlHGUTNeA6tS0
 euVMReQAYaMQiZi4ZsmUxVoKp+b/GIKqXgNgfSku/IsO6NEqkXWjw7LBaGL7/XnB9hUA
 NdSKpwdrbpIHq+NIYdtD7kciy1MWhyZfDIAM15KAxvbAUpTGa2LjTCQx6rveMc8zz9tO
 O38YIjAl7bJY1FHzaKlbypd8v6fYIup/WlMrpMhNiBjiuulqSA7vkiIqochitQOJpwzY
 GKBg==
X-Gm-Message-State: AO0yUKX12gV00o9c65kMUcrNmeXxJZeFSQU12T7GDic31GXSh0Sgirjn
 fVtERSP90DHwvTggu9BRgnknw0/X9A6avPlInRI=
X-Google-Smtp-Source: AK7set9+Lmy/Kb+9K9e7vDxOquL6rzShDJtIn8xVRZqkTYW9ZIX++7CfqArvnNBokBNptzyCRdc1Vw==
X-Received: by 2002:a17:902:d2cf:b0:19e:7880:1c2 with SMTP id
 n15-20020a170902d2cf00b0019e788001c2mr27571340plc.47.1678392569519; 
 Thu, 09 Mar 2023 12:09:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 42/91] target/hppa: Avoid tcg_const_i64 in trans_fid_f
Date: Thu,  9 Mar 2023 12:05:01 -0800
Message-Id: <20230309200550.3878088-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Use a C test instead of a pre-processor test for the id.
Use tcg_constant_i64 instead of tcg_const_i64.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index cb4fd1fd62..3ea50d0cec 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3547,12 +3547,16 @@ static void gen_fcpy_f(TCGv_i32 dst, TCGv_env unused, TCGv_i32 src)
 
 static bool trans_fid_f(DisasContext *ctx, arg_fid_f *a)
 {
+    uint64_t ret;
+
+    if (TARGET_REGISTER_BITS == 64) {
+        ret = 0x13080000000000ULL; /* PA8700 (PCX-W2) */
+    } else {
+        ret = 0x0f080000000000ULL; /* PA7300LC (PCX-L2) */
+    }
+
     nullify_over(ctx);
-#if TARGET_REGISTER_BITS == 64
-    save_frd(0, tcg_const_i64(0x13080000000000ULL)); /* PA8700 (PCX-W2) */
-#else
-    save_frd(0, tcg_const_i64(0x0f080000000000ULL)); /* PA7300LC (PCX-L2) */
-#endif
+    save_frd(0, tcg_constant_i64(ret));
     return nullify_end(ctx);
 }
 
-- 
2.34.1


