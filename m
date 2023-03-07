Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A36AED5D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdv-0001eH-Iy; Tue, 07 Mar 2023 13:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdr-0001Ac-7d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:27 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdp-00014K-1l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so17416136pjh.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5FP4phlNuAKGlZMwdRjX+9/17//cy6MzJB0F0PRHIeY=;
 b=QeX2GBFxBEUKY/XEI5BZ1E7JTPdiFYjVkEgHRmnMHWiV1FBQSW8/QDz17v5wJvioYD
 VCwvrQ9lYbsTDRtEVV9U25hjzvLKCZkiz3MoK9SRSbPcbvqaO39fnKNQLNoaF8rTXsX5
 TwKwfNh43QdDO3MuM+BWCf7SPRQ08BOp6swFSDPYJZqWDgIS1Zuyp+vttds47ncY7OG4
 QJIdxV3RJIhaPHy1WWLUohIg7tZJeBzdeNizjzhHP2v7skb92dhF5CDCA4D+xrYL5l2W
 eTF7VipV4sYifLlg7Sgg8yViKaHrHzh7NIZh8s9VMcCqn4OGxOYk+msIQJUon3VGNujb
 lJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FP4phlNuAKGlZMwdRjX+9/17//cy6MzJB0F0PRHIeY=;
 b=4Zri7ZoKP4QcNfhzdNShT9lwLRR+LZ2zm1MGV/1HBFHVgBfS7sYZgZlE59aMcWJ+jl
 OJsvCumRYfQZa2g436VsjH2uVjUOlzy/98nZQHJRNqTV8LbX91PGHUhwASwA6bnaNbAc
 TDkn7fN2GScq6ynaQP5eVVm+VskukIBNksQaHGt+ltvB4ogPBJqNg0/2c6E2TyYDXL2o
 PTGEcigBHohH1fSYdR4X6O5GyEsuj3D2rpgN1fCxP8cgh/WUP4gCBs872UHo5OREOOId
 +mJ4r3Bmie5RA63gXhT6AejPv/4Y2LKWagbi2oNchnXodA/zXr4wMuYaaGGc5Bz/YcDR
 VSCA==
X-Gm-Message-State: AO0yUKVK1LkYSXbyNMwIo4m6U05df30rHjyLMeQyx+XfUYDLPhuxsOEN
 oAt80KpkG9Xue+BDIOiB4DIiTXdFo9yq+PeUxF8=
X-Google-Smtp-Source: AK7set8ReQ7L1qkEKHvQWIohaqn7NqTNd3XkgfxteEbkVO68I/xRqvfTzI6+U+y+ZLKyUUSX8Qf85A==
X-Received: by 2002:a05:6a20:8416:b0:b8:499d:7c9b with SMTP id
 c22-20020a056a20841600b000b8499d7c9bmr19287363pzd.51.1678212143468; 
 Tue, 07 Mar 2023 10:02:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/67] target/hppa: Avoid tcg_const_i64 in trans_fid_f
Date: Tue,  7 Mar 2023 09:58:23 -0800
Message-Id: <20230307175848.2508955-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


