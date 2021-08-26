Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFDB3F88BF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:25:23 +0200 (CEST)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFNi-0002Zr-3L
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGN-0005rV-Up
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGJ-00058o-LL
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so4982865wrh.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dlNDMB/8L65w3rYQrh4g4+ZBy9+++yz/Uc57+3Riqgs=;
 b=Dpu1HB6ZYs0R/dAonCyPjLR1P4ojBS4pAN2sPnw+rDp5eVsz6TO7GRJFBOjQfFiSWX
 sz1uADaU3gT7sy82XLVhO15Yo99jHaebTVYXGIUGXHpXkefoO0dvzy4mEm232wSqW28r
 1LiQrhRNQcPht+9111eAE7s/nUplYsZjvEkBU6X41+ucXoKO1pHVjDpl6a5eTtziyEua
 rtkpRVVgv/07QdN0TrzxzG++bAYTIRUjN67bYeiQlz7x6jp0UstycQebLKS+7QcrM6O+
 E1YTQvcmkdgVxbLNtse8I0T2ZY2q+VHB55ftxgRfz5MdCjgpOeCBjtY1owmAbfBHJeJS
 IL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlNDMB/8L65w3rYQrh4g4+ZBy9+++yz/Uc57+3Riqgs=;
 b=AHrUBLaNSZAymmxT7wjS8rRsBJhi6IzVHXJaT8paUz9gESYQw++6Hcurw2xHagO38u
 Lq2gUNhCkY3jOuFUBp1qaEUzFCm/0NMpCqA1sqcx1SK2MdII2ARkLz59LlnYxxfZhs/v
 GPiaN/fzbNlAqRHgEXz7tmUp2N8jd41s4deYwsve8P8bqyPAly2PGfP7p/mhmJoC8DRl
 O+w8VEzoFKq1SANJvwpX5HLk7CWaj6Te2ZNRE7PSzfWH5pAQed3AUoum+wmL4eTuYvLX
 34/USYDRMcymzlOZ6hd8Xgk/xwVsavdqtBD2u3PKhHVIh7ayfBMDvCbPkGiTuhKJJ76n
 ItuA==
X-Gm-Message-State: AOAM533bLXIsCYTG6wmrwzlCjYIl5ZkvdSIQ7uxLhJEii4aSGaZLCJeW
 CYHbqP3f9XPBfjor1ylyCiSOwbXrImtcwg==
X-Google-Smtp-Source: ABdhPJx6CvtW827ANz+Y8d7nLV0owr56erSSj1FAgbEw2bDH7nY/eqd9J1ViEsnyl+mmyh61HkuxBw==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr4120140wri.250.1629983862266; 
 Thu, 26 Aug 2021 06:17:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/18] target/arm: Enable MVE in Cortex-M55
Date: Thu, 26 Aug 2021 14:17:25 +0100
Message-Id: <20210826131725.22449-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

We now have a complete MVE emulation, so we can enable it in our
Cortex-M55 model by setting the ID registers to match those of a
Cortex-M55 with full MVE support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436a..33cc75af57d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -654,12 +654,9 @@ static void cortex_m55_initfn(Object *obj)
     cpu->revidr = 0;
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
-    /*
-     * These are the MVFR* values for the FPU, no MVE configuration;
-     * we will update them later when we implement MVE
-     */
+    /* These are the MVFR* values for the FPU + full MVE configuration */
     cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr1 = 0x12100211;
     cpu->isar.mvfr2 = 0x00000040;
     cpu->isar.id_pfr0 = 0x20000030;
     cpu->isar.id_pfr1 = 0x00000230;
-- 
2.20.1


