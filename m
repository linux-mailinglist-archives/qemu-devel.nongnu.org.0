Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42294703046
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZJR-000315-GL; Mon, 15 May 2023 10:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHg-00079f-WA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHa-00050a-Fg
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aaf21bb42bso90759715ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161217; x=1686753217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1hIIKUo7PoLuxvqXryvPnYOSzjxwn2GYHszm/BGZZQ=;
 b=wx1aOCcMxrdRBcClXzU/JVDXzLeYSFDD/d4zTHM1y1SWA25cLtkLgG7hS2iIvfR3tL
 TpxtXw4huShC+24M2GF0TS7KLUm4+7ZX4NeJEKhmGH7dypvjg6Gy+cep6BBIQqc+kTti
 swexNPwxc72S3x2oZiVEhwgtsRBdOAU8gTwh4wpv0MuO2BOqh9bGJAZylQBOi9gKtKf1
 qzSs0LxI1+FsctKB3EFn23Ig0s59nk0eZFEQnr349kGKetPEAVIfxhicxL1/reVglkoa
 1JOpZm45Gdc8ShRaT3CErkqgNxgs3Jv8Ex/y/9DTcKolvv/S2MONqAj/pA5IsTVK2gqk
 duzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161217; x=1686753217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1hIIKUo7PoLuxvqXryvPnYOSzjxwn2GYHszm/BGZZQ=;
 b=BcUHG0QvgwWDkafl4rYeFkmK6Q/ojuueucevdpOmbSyFbna6eElGM63Gmv9apUNSly
 9TYNzUYfgd94AXTuUgvwI9+LsTu0bE+TvAttLbeKgHVfkn+zE7P9y55wi1pg0k3tjy5Q
 J/2KwgjuDLqbOf+fvywEpVxnEkNV9x0L2b0F367Gy5BdqBt6tooS3ObGBbFbhyYHqUE2
 o6oJr5BMpZ1MWnq9aopaOQMRWkVWFWNYQkAYb6/0FirzXTFLoBolEZ9OqNiAWZgMYyZi
 +eJHfqd7N5fr5iUbQRGB/fEX3duK0KhlPAV33u0gWqmP+IzLXUhxPZAcVtVHMDS5f1AF
 CW2g==
X-Gm-Message-State: AC+VfDx/VmIlpHrlYVM982JMHiBUovf9U+vkEASToZkKKhwerrZX+Q1s
 m8KIgh7znNmpHb3pwdI13fc+EYoBgSbj4FemRF4=
X-Google-Smtp-Source: ACHHUZ6wq82+nbB/6lrPzfvHiEiFUMR7bF7jHqBr5TWsIe1ALDhLz3cqgbm5U98IQrMYjSmr8D9fOQ==
X-Received: by 2002:a17:903:48e:b0:1a2:a904:c438 with SMTP id
 jj14-20020a170903048e00b001a2a904c438mr35834889plb.58.1684161217185; 
 Mon, 15 May 2023 07:33:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 26/54] target/sparc64: Remove tcg_out_movi_s13 case from
 tcg_out_movi_imm32
Date: Mon, 15 May 2023 07:32:45 -0700
Message-Id: <20230515143313.734053-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Shuffle the order in tcg_out_movi_int to check s13 first, and
drop this check from tcg_out_movi_imm32.  This might make the
sequence for in_prologue larger, but not with worrying about.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 15d6a9fd73..2689599fd6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -407,15 +407,10 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
 
 static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
 {
-    if (check_fit_i32(arg, 13)) {
-        /* A 13-bit constant sign-extended to 64-bits.  */
-        tcg_out_movi_s13(s, ret, arg);
-    } else {
-        /* A 32-bit constant zero-extended to 64 bits.  */
-        tcg_out_sethi(s, ret, arg);
-        if (arg & 0x3ff) {
-            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
-        }
+    /* A 32-bit constant zero-extended to 64 bits.  */
+    tcg_out_sethi(s, ret, arg);
+    if (arg & 0x3ff) {
+        tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
     }
 }
 
@@ -426,18 +421,18 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
 
-    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
-    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
-        tcg_out_movi_imm32(s, ret, arg);
-        return;
-    }
-
     /* A 13-bit constant sign-extended to 64-bits.  */
     if (check_fit_tl(arg, 13)) {
         tcg_out_movi_s13(s, ret, arg);
         return;
     }
 
+    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
+    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
+        tcg_out_movi_imm32(s, ret, arg);
+        return;
+    }
+
     /* A 13-bit constant relative to the TB.  */
     if (!in_prologue) {
         test = tcg_tbrel_diff(s, (void *)arg);
-- 
2.34.1


