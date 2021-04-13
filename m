Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13D35E3D4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:26:15 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLri-0002Kh-V1
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaX-0006Ml-4P
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006w7-2s
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so11011196wma.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g4qCQc75rsmkzr/XssyrfWmcfdb7+wxGK/gMHPLyx+s=;
 b=jhtb2qHR4ADttgh/wF2WORnU6WtNlBLjyCLGybQ7+jQYM9AcH3caBDuDtKfN49XT5+
 ++0FstMDW7xAFRW1aT3UKGnzIZrvxknGDGMsd9ZEEbQoQbps4qFmZKbmC3TZ6/XS+YTA
 qXsINvCOybsNk3Irgf9srzr0mZzYNQ34kA9SiN3mOGDhllthmvjul4IRs8xcQlWGZQ0g
 go1gTv5d3w/p6Iy2A3WOVOiib3RJnPZM0dGp3Bz/jpKj68P3DTzjvWcvbRh4PtfFMCAz
 f7JMV/eYUl6eA11IYtyeZ01NOAUOCPGREEMFRH/BJAi8YREnvL9eqhV4ozLH2pPn8iAy
 35VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4qCQc75rsmkzr/XssyrfWmcfdb7+wxGK/gMHPLyx+s=;
 b=Ofe43SbbzfjCuHBS14AXRmSXspM3sYpbcJ4XPWLrro7LFKHptjtfxwBT4QM2gAK5uA
 4PrW70VEz6fQ9/dQv85ZRI9oqoTbaTmhVtL25jcHSNUGu2QjglthZR5c6r7x6SZORHm0
 MUnelZEA8tcRuPN4+mpGgaVh4USe8JGpOT6+vLJsVJXBjhGJqC/iZUu8r5j5y5Jo5+8/
 UZaUfghcs5Ci+rpsWoAVvnjwDqbNas1L8Iel95oGbDIZ4la2OJoHGzqLuu2Obf9cnixw
 y0OaLboyFWpruXY+PstEYZKE8urXVI+B3eTfBZwE3OH0ZFtjHYeuspvRHyk9MQlnxEkr
 yb9Q==
X-Gm-Message-State: AOAM531i6n3BPNXDDBlAMuVOrK3VbPI0PCGZ5hcoOjwwOsRibiFRoeKX
 yzBLHUgVt0NZ2ApUmPaISd/1rA==
X-Google-Smtp-Source: ABdhPJwmxDuOYaVgzXqQKPmzH4Pr0sM0jBYfyS1Mj3oNl1ZAFI4c/bi91LtJLYL1ahTUy7irMOswkQ==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr748083wmp.150.1618330100961; 
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/13] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
Date: Tue, 13 Apr 2021 17:07:57 +0100
Message-Id: <20210413160759.5917-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the NeonGenThreeOpEnvFn typedef to translate.h together
with the other similar typedefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 2 ++
 target/arm/translate.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a9f90e3ed4c..ad3dbc0e8dc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -406,6 +406,8 @@ typedef void NeonGenOneOpFn(TCGv_i32, TCGv_i32);
 typedef void NeonGenOneOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32);
 typedef void NeonGenTwoOpFn(TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void NeonGenTwoOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
+typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
+                                 TCGv_i32, TCGv_i32);
 typedef void NeonGenTwo64OpFn(TCGv_i64, TCGv_i64, TCGv_i64);
 typedef void NeonGenTwo64OpEnvFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64);
 typedef void NeonGenNarrowFn(TCGv_i32, TCGv_i64);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7439c56d34b..7f95ab16613 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -66,9 +66,6 @@ static const char * const regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
 
-/* Function prototypes for gen_ functions calling Neon helpers.  */
-typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
-                                 TCGv_i32, TCGv_i32);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1


