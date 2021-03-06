Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4632FD89
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:38:10 +0100 (CET)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIecj-0000DH-RS
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeay-0006vU-Bf
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeav-0002wM-QL
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id j6so3104843plx.6
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=UsuD6lFoeaAQyHElTQwPGm8OycHr/LFtX6U6I1OlQzj1Ib2yUVo6gPvafAjfy8sjOh
 rWa//ngTygk9c4OzgsBRmASsLJhqkhwOHKhZGIPCDRyk07ScjJ+AXG6XIHGWfO/Yb7Ck
 i9Z9OlTDQEvauzh9vrF/X/oC5mfJHimsUygF+7M9AW9HYGXkLPCMB17l6EUGP2TcLG/t
 8JLXsUJi2JvI1naptR9HvVaXL7kwKB7DhyWpeDqGyKPn5/hs7UUERlamyj8C1iFoqcDg
 j3qybroDhpHMB5IO9jkIQ1M+VSTM3rmDbDc1szYISJVXbTBCD4YwDJcnFqM7R0nrt1to
 Guiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuWrYyiZWdulIwmEpBK4yxV1iSuukhkkcBuC0p9tN6M=;
 b=P55SY7QUhFbSFkfbd7ty5chQf1s5aNuHY2x0vQREZLnARDUiJhLO5zRfccHM3PoxOQ
 6JG8c4ve8eRSYwimbM8aOsXLCpRxDzQUhQsRMJfqz7tUAtdOsYbYM5HWBiE3UJpxOiQf
 b9O3COiJEaI/D1kU/oA/5KMEcWlYm/cZeKT9DcP9US8jQHZlQ2gyT4qV8OifjjNuBwM8
 hjKMnwQI8yzosm2kyRbj90B86ldnxNHh7zEb/CasokvAKuGCNrVcoxrvtBKHz3v6FhsM
 PyLZsQyTcRXEeeLjbX4A7sy03tfYAQJ+djonQBxeePqA3hQ1TVe3xMTQdA/FfOy/6GcU
 TAxQ==
X-Gm-Message-State: AOAM5313MMa5zINYft/sfANNoj+rsfYmMe3SP4axkUGmFWpZxloQdmn0
 FXJZ09Fo3GAOhWt8lbuLNN3whQKdp+WJQw==
X-Google-Smtp-Source: ABdhPJzD8cymJ2yDf37zS2pHL6J9nk6fqWL8BaF2/PwbzIUIFhVV5BdzSedweNgENWj0cMUAVk6BWQ==
X-Received: by 2002:a17:90a:840a:: with SMTP id
 j10mr1492484pjn.97.1615066576526; 
 Sat, 06 Mar 2021 13:36:16 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
Date: Sat,  6 Mar 2021 13:35:47 -0800
Message-Id: <20210306213613.85168-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An hppa guest executing

0x000000000000e05c:  ldil L%10000,r4
0x000000000000e060:  ldo 0(r4),r4
0x000000000000e064:  sub r3,r4,sp

produces

 ---- 000000000000e064 000000000000e068
 sub2_i32 tmp0,tmp4,r3,$0x1,$0x10000,$0x0

after folding and constant propagation.  Then we hit

tcg-target.c.inc:640: tcg_out_insn_3401: Assertion `aimm <= 0xfff' failed.

because aimm is in fact -16, but unsigned.

The ((bl < 0) ^ sub) condition which negates bl is incorrect and will
always lead to this abort.  If the constant is positive, sub will make
it negative; if the constant is negative, sub will keep it negative.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..ec0a86d9d8 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1410,10 +1410,10 @@ static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
     }
 }
 
-static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
-                                   TCGReg rh, TCGReg al, TCGReg ah,
-                                   tcg_target_long bl, tcg_target_long bh,
-                                   bool const_bl, bool const_bh, bool sub)
+static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
+                            TCGReg rh, TCGReg al, TCGReg ah,
+                            tcg_target_long bl, tcg_target_long bh,
+                            bool const_bl, bool const_bh, bool sub)
 {
     TCGReg orig_rl = rl;
     AArch64Insn insn;
@@ -1423,11 +1423,13 @@ static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
     }
 
     if (const_bl) {
-        insn = I3401_ADDSI;
-        if ((bl < 0) ^ sub) {
-            insn = I3401_SUBSI;
+        if (bl < 0) {
             bl = -bl;
+            insn = sub ? I3401_ADDSI : I3401_SUBSI;
+        } else {
+            insn = sub ? I3401_SUBSI : I3401_ADDSI;
         }
+
         if (unlikely(al == TCG_REG_XZR)) {
             /* ??? We want to allow al to be zero for the benefit of
                negation via subtraction.  However, that leaves open the
-- 
2.25.1


