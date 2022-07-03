Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640D56466B
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:29:29 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vuy-00054p-HX
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzy-0002Bs-K2
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzw-00072J-8J
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:34 -0400
Received: by mail-pl1-x62f.google.com with SMTP id l6so6006495plg.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzZAk2sWUDfOJVyhEAahGWIXzjO1BF4nkh933Xz/rqw=;
 b=OMIs+BTzsmw4SFXZyTabVkxs3BOyTk43Iw2JgdvPlsmjreRmRVVIwpyahf/OyBW6+V
 wZbaCu2VJna8X0lzKpiY4yk65YkgamyN7XIJy9pQ8BcwHz7+bIwH8cgqJg86vOvP+2V6
 1I+TtzyozA7P/SslcWmd12BDy1YIKgHRljaCP44v1WR1q4MdZIQ1Xj5JS7lYmiWnFONA
 imy0fTAGKksZrVGjz7+nkvC6ABPjwd6uV4KMaLGVfJJYUgKZPhLVb27c6SICnwVc2+Oh
 eRo2DdGfvOQ1L+rW+GSJTZj/xRWrGDu9ccQZSIv4Tgx7onZRhKI5LzcNHRV60LKVyLO4
 BClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzZAk2sWUDfOJVyhEAahGWIXzjO1BF4nkh933Xz/rqw=;
 b=a2yKjz/EKOlcajGKpLpsX3rCPILiDyTqFAjkfC1e5bvMiL9GWim5opF4w0dbw7ez5y
 bSlg3rYEOnc+7KIOmfXsDrm0YjFzAVHzHb5ldEwfqbtz7dyFEMLbWgqtqNhZFS9Kbocw
 DFxqP9vYObrPC6GaCgnIELEIRMhRZrsEqKJekLZza6YUKCJEUPGN5ovoN+TPA2G/ewQC
 FT7emKTEAgxM1DMvl4mv17FfD8RBhJ+8SmQA2848k1ENFo5N79q8J/qY1H/MQ8UibNOR
 BGVfClx5xONx7Bp8TUy+HuXAGhzPZ85a1Bxha9c/x3KOX8SUrE0XPeejyuZMv3sTFmRL
 /r9w==
X-Gm-Message-State: AJIora+NUtWS59uepUkOTPegd6uXLjUfKKcP223pNsTKNBHYN2HG+4t2
 /hOIdCneGrBKzm6LdVU4S13xmA2wrssxsyTs
X-Google-Smtp-Source: AGRyM1s3i0DaRLyCfY8UbJusIjRpYho3eJ9bWu087rrUSREhkjssh3Fa8tFCI5TdIFFMWO248SBIjw==
X-Received: by 2002:a17:90b:1e06:b0:1ec:b396:7468 with SMTP id
 pg6-20020a17090b1e0600b001ecb3967468mr28088345pjb.63.1656837030903; 
 Sun, 03 Jul 2022 01:30:30 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 61/62] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Sun,  3 Jul 2022 13:54:18 +0530
Message-Id: <20220703082419.770989-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e7569ece33..07ed49bd70 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1026,7 +1026,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     S1TranslateResult s1;
     uint64_t descriptor;
     bool nstable;
@@ -1288,7 +1287,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1296,7 +1295,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1348,7 +1346,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* When in aarch64 mode, and BTI is enabled, remember GP in the IOTLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->cacheattrs.guarded = guarded;
+        result->cacheattrs.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1


