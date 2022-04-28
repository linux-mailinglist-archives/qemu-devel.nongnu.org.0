Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C95137E2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:12:27 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5og-0005rK-QJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jw-0005ad-Np
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jt-0006Qe-07
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l16-20020a05600c1d1000b00394011013e8so2431143wms.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uTdb8OkwlShp2n1v4y6nfj9p59wUEHW8MHnXz4VWBMc=;
 b=Jdd42sD/t5a97Q9H+QvZl66hMg0MFAlbhY+V0NfUNxOi77ddvIL62ioA1b5uUyANiy
 gmaRJhfXNC+l3fT22KRsbjFyFrYKikvYWvBJbj+X4Gh40+1hVP6rpJ97eglTeQumc1LI
 dRcvORSJa6S+caKLsoghYBhqsi2F3BWtsy2aTba/YkpMgxM37mkQZ8bJ793erIRHikO2
 o9iAUiNHEoLMTox1kK2Yhih6frV5ZipzG0vx+oRBQo+CriGXLsnk8pKmCWZpN8UCgFkk
 tJM7pAlDTZy0q9mgAlcV8U87S7DVljkE/jttKxghz27CCawkGzUFHiSw36jHAUrcR5bM
 KYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTdb8OkwlShp2n1v4y6nfj9p59wUEHW8MHnXz4VWBMc=;
 b=wTO8xh60tHRX6uton7J4UTdvv9I/S0KR+yYawr4IOqXbUIhLRTy0vlEnO5WR4IPxjw
 JnM9Qxw7KEDWCZKRbV/yXKVNuNNN14t26dinrF2pnB5vP+73wCLu4F9j8uacoWYjFw4U
 agtbZh6P2RXSr8X95dKF84IT++USrIUNvDtPrW6uB0yvhvDm6s8SACb4hNJpVxivjFzJ
 Sn+Qpefl1fvuYVkiPwzs70KDbDbE5hSEdo5muKwT2x7gsa3ctWG3olrpLnrMCsOTU8VA
 IeoFI5T/w9UXDr3stqUJZ/9H4x5BLrEw4t0A+UWXs2RGXCrFism503BcoYAasy47Lfrc
 82vw==
X-Gm-Message-State: AOAM532xjBYkrTlN3iSEI5ZMyOnHbvFJA+5FRXq1OtpA5fzmmU1uq7MM
 IzoV95ergaJhsDlZbn9g1MbdU+oR2kCEjw==
X-Google-Smtp-Source: ABdhPJyBounHm3J0QYUFE0El6RIyWS+3XTh5uLiyWVjs4Jm9SW2PoouhY6ilTb5Nrkns5sVwEi3B6Q==
X-Received: by 2002:a1c:acc6:0:b0:38e:b184:7721 with SMTP id
 v189-20020a1cacc6000000b0038eb1847721mr31086926wme.94.1651156832005; 
 Thu, 28 Apr 2022 07:40:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/54] target/arm: Use tcg_constant for TT, SAT, SMMLA
Date: Thu, 28 Apr 2022 15:39:35 +0100
Message-Id: <20220428143958.2451229-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-32-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b604a820c00..24e522e1d6e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6596,8 +6596,8 @@ static bool trans_TT(DisasContext *s, arg_TT *a)
     }
 
     addr = load_reg(s, a->rn);
-    tmp = tcg_const_i32((a->A << 1) | a->T);
-    gen_helper_v7m_tt(tmp, cpu_env, addr, tmp);
+    tmp = tcg_temp_new_i32();
+    gen_helper_v7m_tt(tmp, cpu_env, addr, tcg_constant_i32((a->A << 1) | a->T));
     tcg_temp_free_i32(addr);
     store_reg(s, a->rd, tmp);
     return true;
@@ -7564,7 +7564,7 @@ static bool trans_PKH(DisasContext *s, arg_PKH *a)
 static bool op_sat(DisasContext *s, arg_sat *a,
                    void (*gen)(TCGv_i32, TCGv_env, TCGv_i32, TCGv_i32))
 {
-    TCGv_i32 tmp, satimm;
+    TCGv_i32 tmp;
     int shift = a->imm;
 
     if (!ENABLE_ARCH_6) {
@@ -7578,9 +7578,7 @@ static bool op_sat(DisasContext *s, arg_sat *a,
         tcg_gen_shli_i32(tmp, tmp, shift);
     }
 
-    satimm = tcg_const_i32(a->satimm);
-    gen(tmp, cpu_env, tmp, satimm);
-    tcg_temp_free_i32(satimm);
+    gen(tmp, cpu_env, tmp, tcg_constant_i32(a->satimm));
 
     store_reg(s, a->rd, tmp);
     return true;
@@ -7915,9 +7913,7 @@ static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
              * a non-zero multiplicand lowpart, and the correct result
              * lowpart for rounding.
              */
-            TCGv_i32 zero = tcg_const_i32(0);
-            tcg_gen_sub2_i32(t2, t1, zero, t3, t2, t1);
-            tcg_temp_free_i32(zero);
+            tcg_gen_sub2_i32(t2, t1, tcg_constant_i32(0), t3, t2, t1);
         } else {
             tcg_gen_add_i32(t1, t1, t3);
         }
-- 
2.25.1


