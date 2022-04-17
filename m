Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E65048C7
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:07:42 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9JG-0003ZT-0m
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0000j2-BW
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x3-0003JU-35
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id t12so10738699pll.7
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z284YO2l+zNv3weW3jS6RSJVzTJCNg6AbcZ1VqRFtfo=;
 b=xEMyygvUXN6bfDFI+qFB8xYg7Yc899cQXWUScaoDeYT+iLdPSDz52Sgrww4GTluvJx
 8kjEMBDub64QOMrG/1QjBZtH7ttYlfPbveFMpYMjxp2HwoMtfUWjbSVtamU3J2WZKWkv
 epZNeylcWT88FK2bANnV8JAoCtp5vnLKXm2K7ha7NQsR2JexI+MOkjvaM9shDgaxSrbp
 ytLWELUpKTVHbJl+bhVRhYFb0oOpkrg9brLBeTmMRcQOjP3xz7iNfO4QWhBVoD8fSFlx
 NUC6L/j8h7a7Li+1TqPUaEi2p+9jUbInQiPWIFk1LSF64jFtY0VXzQ0parAv4K6wn8Gy
 Wydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z284YO2l+zNv3weW3jS6RSJVzTJCNg6AbcZ1VqRFtfo=;
 b=IG0V78/EqV4koKODyaY2cvyPPJJyufkUe55Yo/8hxcM9T7/Nz37kjyuXTNYeXT0Svs
 X3NZC89cYko8a4HiDtKVU96x80Yrr5PDVBfciwXEHWA9q12PMVeHT6tRZBSJjqMKFMsl
 2yHM2gFxldbilvdonmHaIfUKpoi1Ub65huZcITXzgIvRfj32Vy0wvHNvyw/W6jk+/AJX
 B0oQwkFbxxc2iMICSQ/jxPXoG9AEDKMFi4ctyw5/s3No4VhA8DGB3xAELjidzzaaITJo
 O1CaUWtxp0zjo6Q1jeHnXqSE2t3TtWUf1WXwMmZbSBBQb1R6PlHBKke9c+uZS7jjwid6
 aNAQ==
X-Gm-Message-State: AOAM530RUp4xH/Tltm2JQg/vltcmdOF6d/lyqXbxBrx/HsVSBoonNW2S
 Pwl7h6Xn6MGnngPqfvEQm9xSwxiTFnqO4Q==
X-Google-Smtp-Source: ABdhPJwNKYMilrCWo9J20O/bOdm2tkcEqHpSLsBkDtKTbvUfoOeDPGZaIZZPD2lDoZ4cqbQf+sl41g==
X-Received: by 2002:a17:902:ce0f:b0:156:5a4:926c with SMTP id
 k15-20020a170902ce0f00b0015605a4926cmr7557717plg.3.1650217482752; 
 Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/60] target/arm: Simplify gen_sar
Date: Sun, 17 Apr 2022 10:43:41 -0700
Message-Id: <20220417174426.711829-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_gen_umin_i32 instead of tcg_gen_movcond_i32.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 57631c9fa1..8d6534f9a5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -568,12 +568,10 @@ GEN_SHIFT(shr)
 
 static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 {
-    TCGv_i32 tmp1, tmp2;
-    tmp1 = tcg_temp_new_i32();
+    TCGv_i32 tmp1 = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp1, t1, 0xff);
-    tmp2 = tcg_const_i32(0x1f);
-    tcg_gen_movcond_i32(TCG_COND_GTU, tmp1, tmp1, tmp2, tmp2, tmp1);
-    tcg_temp_free_i32(tmp2);
+    tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
     tcg_gen_sar_i32(dest, t0, tmp1);
     tcg_temp_free_i32(tmp1);
 }
-- 
2.25.1


