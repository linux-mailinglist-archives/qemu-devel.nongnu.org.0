Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0056DB940
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 09:07:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl2e3-00062K-8d; Sat, 08 Apr 2023 03:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl2e1-000625-4L
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 03:05:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl2dz-0001on-HX
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 03:05:52 -0400
Received: by mail-pl1-x630.google.com with SMTP id ji2so2022824plb.0
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680937550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v6VkWLjZbM7hAKIP0N7uvC4J2jk98t6PtPKdHAfgn94=;
 b=eiHB9sFs0k8+1L3dUZEwnUCawqU152xOoGA/2FBRit85+bRpCD1WY+nS7ZR4WI2l9O
 TAdr9tELVvHXyEORQdiyj2n33Gj9eeQpoqxNPZaE9jPmzgka9MgRECsAXNZpG0pFsxYT
 8TL/+bQCwOmaXjiG13xbmcQvCetJE2ll3tUja5QIr4dXGfzlDVN7rdvlbAkgrjF0um8i
 aNqoINWNv0eiYDC/CW05F4/pp8xLwkVt+CBUNSMDqfZbUFPCEutZhnS3DW1p3GMrzmho
 XX3Ml9hnmYz/LgQAD390gOxfU6JMd3AVsDb7Yr72E03ZlXo1FftU+A8562S8TvqtaPSv
 2XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680937550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6VkWLjZbM7hAKIP0N7uvC4J2jk98t6PtPKdHAfgn94=;
 b=3kg5o6SRV1EQw0DpNLE8uLyOmGmTPRBXj3VY/a3M+p6XJnonz6ngTuJ0AgMbPam8+o
 HyEBH8XoNMue98pWVuVMjkidk2YKhTBtF8wgbPt3QBz4rZhmWP8FOizewVsIaBe2bPSy
 PhTXfKg4LJSxsC8VW1M9o0HgG1vjLs7WyWOAr+LmpFVsXZT9eHZKQgbaSmSJwxbCAbmC
 Y6HlMZT1Bzl5GtHj4XWowCQkvjwzQDsmQ7WNHnkNTYb2k4PMr/DjB5elkGVu0Dd3fYg3
 PA7CYGkxi2cE1QFh/KC1vAhgYZV83G+aOsqYNH6R36HKieY4Zl0pQbvqGe/vTDFPiGpB
 61zA==
X-Gm-Message-State: AAQBX9fXpa4W+rAyMCbWin+xxum3134Bw8TSVs5cWGHXdJ886aHw3SH6
 o/bymAd+X4DeGEkElbi5HGgOMl7sX5hDuS6zPsM=
X-Google-Smtp-Source: AKy350YEvvx7XE47IlpC47j1/tlcDtLJ0tzyOnjvjcnvrwLNoIxmnp+UMoNM869g/H2ivzr6vX9jAw==
X-Received: by 2002:a05:6a20:465c:b0:d8:f312:b3b with SMTP id
 eb28-20020a056a20465c00b000d8f3120b3bmr4692225pzb.3.1680937549647; 
 Sat, 08 Apr 2023 00:05:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 u22-20020aa78496000000b005938f5b7231sm4040268pfn.201.2023.04.08.00.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 00:05:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, clg@kaod.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Johansson <anjo@rev.ng>
Subject: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
Date: Sat,  8 Apr 2023 00:05:47 -0700
Message-Id: <20230408070547.3609447-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fix a crash writing to 't3', which is now a constant.
Instead, write the result of the remu to 't1'.

Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

v2: Use a temp of the correct type, for ppc64.
    It's what I get for rushing things this afternoon.

r~

---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9d05357d03..f603f1a939 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
         TCGv_i32 t2 = tcg_constant_i32(1);
         TCGv_i32 t3 = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
-        tcg_gen_remu_i32(t3, t0, t1);
-        tcg_gen_extu_i32_tl(ret, t3);
+        tcg_gen_remu_i32(t0, t0, t1);
+        tcg_gen_extu_i32_tl(ret, t0);
     }
 }
 
-- 
2.34.1


