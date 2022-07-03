Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0EA56460A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:54:59 +0200 (CEST)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vNa-0002Wa-Kc
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvx-0001z2-CE
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvv-0006GD-Ty
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:26:25 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2183504pjf.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0f7upZyv8+QXQZo5AhOhdj/3Jfb6kAw0J9DMM0GDxOw=;
 b=vXqXcMix5Xsjc99RWEkfoYm0OfSy3PSb3DUsmqKMkTPssa6hEmFz7I0VupCB71duLy
 D+ic+M/bCHpVbXy07dXyPmr98uJach+BtFv7XRRVBqlwLCrAeyHKfOvR/qQ/1HFQwASJ
 pgo7GnB/399X3RMmiHlC+iY0IYPsuMXls48Tw7PvzuOWZ0kkyCVtgXoN2X0Ukzo2GMyk
 Yd7AeVZ8+uP/bZ8w/Y0VQwhyHanOylp7wH6XIQIcT8z30rG4GUZZZwR7VPdTB9u8V4Mv
 jCl4NDkVhrBvZX7mG2fg/EZx5l2nV157zRot3FECwRqLh8BH4jn67YNjZDJU2DsS/Ox2
 QFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0f7upZyv8+QXQZo5AhOhdj/3Jfb6kAw0J9DMM0GDxOw=;
 b=PLFddZAuqzYciRUCtSKBcN7yjUVDnOYINyQyxnFIjkilFSCKhbmLrMerV0f6IfMj9H
 wB9uAihCe1hJupDvOR8GgGTxW6s4x+IhdFv34NX8sblcQMYCPKubi5SBMGyTztV2Jjar
 IJwnR3E93HRJ+V7P2GPg6asAkjXiXCqliiF3G8XeKHpQjASC4PoyrAB77YjO1q/ksLcd
 9SdlTkuCk7XROI24rbhpYq0tOCFaXFGoWa0Q/jNjxZ1g4ZLVtQsJHqoCxoTDNzshcgTW
 bN0Sy9EJVE0DEahtfotP2YyfeKu0vK4/9gWoW7JxbIIwrhW8j1orWaXFC6KQA5kcxqAE
 Sr4g==
X-Gm-Message-State: AJIora9bx+VyqhnPVf1bqhAP1KOxK7N2oD6j71AYFyo6eAyPVwFJhWtL
 1glr/6zwDt3snYdz/XJ0WtZ+ufjVthfpROtD
X-Google-Smtp-Source: AGRyM1uWbasd1aLaDPnWJWMxePGLy6fsbPzczsVAlrIUDDY4dq2HUtETn0Fc6yWzEXDocowpDuUhJg==
X-Received: by 2002:a17:90b:4c05:b0:1ef:203e:6da0 with SMTP id
 na5-20020a17090b4c0500b001ef203e6da0mr25650144pjb.227.1656836783204; 
 Sun, 03 Jul 2022 01:26:23 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/62] target/arm: Remove env argument from combined_attrs_fwb
Date: Sun,  3 Jul 2022 13:53:56 +0530
Message-Id: <20220703082419.770989-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 12b6c2c98b..93c533e60d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2168,8 +2168,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     switch (s2.attrs) {
     case 7:
@@ -2242,7 +2241,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
 
     /* Combine memory type and cacheability attributes */
     if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
+        ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
         ret.attrs = combined_attrs_nofwb(env, s1, s2);
     }
-- 
2.34.1


