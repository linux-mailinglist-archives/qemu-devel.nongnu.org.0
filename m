Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0EF6AABCD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTY-0006TN-5M; Sat, 04 Mar 2023 13:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTS-0006Pb-0S
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:14 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTQ-0003NA-In
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:13 -0500
Received: by mail-pg1-x533.google.com with SMTP id s17so3304678pgv.4
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=M+db+6/rIzU9/TzG9ZDmwawINLpJLXeUhz6Y2nXuO8qiX2Ngo0VEdIDGveWQadP8cN
 EBUv7zLXiFCAEefXjSrGPvgrJxtI44+3lPUf12+xRcRGnFuHS+PpyqqI4HNB+MnXqydw
 2fol816FUob475DX/SNjUFcyj4XK3XIkroHIIOLbMEUNmPobvFSH/p7WXuVrchMBSDw1
 57gl29ZjzE++/NSaglDfUUMv9CpYzXI2pBRv09UnsPy95G9WkwQzbZvjwOva/woc2HwM
 SXj8/GO0xgPQ+0e1qplbidl4ZDwbJeexv85yPQin+p1tj+xG+GGzYoJq9aHvxulftVAf
 Yx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=umehgvbt68KsO71/eWnAsqflaM6voPDfspSmcPbDzxawX7eEj7RLWDA3PMbw8psHVo
 cgxv/qzl9wTO1f4sV4B9eBWsk+/Lh2zcucghD0BlAE/rK202CJCA5cxnAjNyhsU/QWv0
 vtW8LSASq5elaPGZWyElo4+O5J9pHRRPcOB7Co/XbrTT/0H4/i7nfcgOEvFSpeKcDldm
 d9HKSXVZSHGRKQ9qNl60xxmjrRm3mDyuOCpgetZm68zKTjq4MCOD9C0r5aN1Yyy886sk
 SD5BZe0nWrVHTsoCSp1JML5CJT2MCblmwlB4MXHspdAtlFtZ/S9ZN8kLlWnHc+Q1QPvC
 vQ2g==
X-Gm-Message-State: AO0yUKUQFPl8yTdhZ4v2SY3ISxQDXV/hbXRi7LjSXj8Ebd1QDkIfM5CJ
 Vtkhe7iDZkqovjjzJKfhsdPyuQxoM/Ab/tWbHlk78A==
X-Google-Smtp-Source: AK7set8nMfSp7bq1aKQsJXfl31L5cG7eG0nlV+/eBRoD27Vg0MuhH4CGr42SNOUgA1TZZ62St0eB0g==
X-Received: by 2002:a62:38c3:0:b0:5d9:e505:3466 with SMTP id
 f186-20020a6238c3000000b005d9e5053466mr5307338pfa.23.1677953951117; 
 Sat, 04 Mar 2023 10:19:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/20] target/mips: Fix trans_mult_acc return
Date: Sat,  4 Mar 2023 10:18:50 -0800
Message-Id: <20230304181900.1097116-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Success from trans_* subroutines should be true.

Fixes: 5fa38eedbd ("target/mips: Convert Vr54xx MACC* opcodes to decodetree")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 3e2c98f2c6..a7d241e4e7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 
-    return false;
+    return true;
 }
 
 TRANS(MACC,     trans_mult_acc, gen_helper_macc);
-- 
2.34.1


