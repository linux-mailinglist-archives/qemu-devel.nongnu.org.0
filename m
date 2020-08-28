Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A722560EB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 21:00:27 +0200 (CEST)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBjbu-0002BH-0I
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 15:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjDE-0003ZA-6n
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:56 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:32825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjD9-00068c-O8
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id y8so187423wma.0
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TREnSHe4zwXCO3R6kjDkigN6MElrl2moo++OyEa5mKc=;
 b=jfq+Rl0GI537tIkPzFFZAwjohvmge7gflDWsQo7jXXHGXk2HVCuDNcCDpbW89YFEY0
 qWNgJaoS9U96U9Wj3xIQ3P7gOCAifaxlPCZ14Xxogw0nW9aXKXYK4wYmYc6K0AmfGwXG
 kPsB4Hw/shvv3QwegfhCes/bo2DnDkqzTyGdA9kStzS90Un8p5OI/11ki4s+brH2IAt2
 WnmB27jzFiXu0MS6b1Sr0d+sRjLISPNW1IxCLKSwsRwH+8qp/MocfiPDwlf+rGCFU8aU
 U8KhXVN3E/3z6Muu2QBuYzoRHO+a0rlRv4A9zs1O8x1KZcL1YEVfZLDR0CGDO6dqVHUu
 HeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TREnSHe4zwXCO3R6kjDkigN6MElrl2moo++OyEa5mKc=;
 b=VeRKweqXsLfaddvb+eX+2a7GdN3zzwg5dQPKNKzsB2dr6m2v4fB4Y3rONtsk17wB0w
 afiHG6oRh5LIbqqSLj7YSVPwQHZSRhw0izRiGMcl8Yf7jB4AnfCEXoT6qtX+q3TLddAp
 eMFFl573rh/tIj4l7M+2ZRGZz78xib0ml/zy9Q20TpryuRXq/8xLQ7MSgnPh/0YqRkfc
 Y76x3t8ihXo5rLU2LR3Sog5OgBKhES20TyQGgUCGrufRjfz2okUnDlpunOsjXZPrFI9t
 H9lIBBPNbAUg9PyUN0Izx2ZbB4t+RLll4ePWpacSHwk4UywJvgtil/2gHSMh6yZ8uin1
 WGOg==
X-Gm-Message-State: AOAM530TZ8I9UBnEGKesY186731rU8G/Hpe5TN2cETjVMy3D8TTWgsrV
 qJYRvhhq9EahKeEhMF/lRtOL/A==
X-Google-Smtp-Source: ABdhPJynYt94hYxcodZwKoL3/V2GYBoRRIgRgF6WGQ74+xofxfUqiCQB8c4YvfqyO+QdM7ZFZS/ePQ==
X-Received: by 2002:a1c:e1d6:: with SMTP id y205mr42748wmg.92.1598639690466;
 Fri, 28 Aug 2020 11:34:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 45/45] target/arm: Enable FP16 in '-cpu max'
Date: Fri, 28 Aug 2020 19:33:54 +0100
Message-Id: <20200828183354.27913-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the MVFR1 ID register FPHP and SIMDHP fields to indicate
that our "-cpu max" has v8.2-FP16.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   |  3 ++-
 target/arm/cpu64.c | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6b382fcd60e..c179e0752da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2143,7 +2143,8 @@ static void arm_max_initfn(Object *obj)
             cpu->isar.id_isar6 = t;
 
             t = cpu->isar.mvfr1;
-            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.0 FP support */
+            t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+            t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
             cpu->isar.mvfr1 = t;
 
             t = cpu->isar.mvfr2;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd696183dfb..3c2b3d95993 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -704,12 +704,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
         cpu->isar.id_dfr0 = u;
 
-        /*
-         * FIXME: We do not yet support ARMv8.2-fp16 for AArch32 yet,
-         * so do not set MVFR1.FPHP.  Strictly speaking this is not legal,
-         * but it is also not legal to enable SVE without support for FP16,
-         * and enabling SVE in system mode is more useful in the short term.
-         */
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+        cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
         /* For usermode -cpu max we can use a larger and more efficient DCZ
-- 
2.20.1


