Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E330C937
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:13:59 +0100 (CET)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Ba-0007XS-MZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztx-0005PJ-6p
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:45 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztk-0002GU-PY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so21439576wry.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HOai2hjmb+bjOdqLwZmme/jaMMIUJwVTY3N//HvBLNo=;
 b=ACE9PI16XvuR4oj7cJdy7TmAft0AqDDOjm/s0IqpVTj+2DGGS3NMMHaFmI1qiIGYB9
 Dtubvl/YPTxVO0rlmLtIc16Y26dLQYbpVBHPp69dEhbkqc7GQX/UTOQv62aLgt9xN6qp
 sIaObxF2Nu0SvhyKxzC1uiU8vwza1QpuCiEIwgrYLVRuWecDINrRbK6EcGH04qoSLjh1
 dn/VQSDZHR4FdJkkN1ahUQCV/ypTXH5f8M6OFlip03PyidIRltXvU3qh8jQAeKdTpQbl
 R5cbAkedinpKLCdvM3RJ7gjmNuo8ao9K+Z776Cq8K9LcUgusIhJmZFSL4vZNPDZouEcF
 WNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOai2hjmb+bjOdqLwZmme/jaMMIUJwVTY3N//HvBLNo=;
 b=s/IcKkJxKy0hZFu13jNWjX3FMmjc/yCjv9m4qHjL7oABs9koxILOf5mwBUuARIvWed
 wD83mbpiQzCy05iJiOPUxIa7yuG4hHFODT76vJB21rphnhR6tQNaVXd6xAZSAcyFMo6m
 hAh3kdAS+13GMTDDYzMpauM5VHCDQ2njEK3HSny+RkZynLgEyq7fElFkU1Cop9iin9fn
 jBpeMQNZcZO4Ist+6aBgKxDNidcH2Y+bhgKidyt4CCrtMgjHsJKe9x01R47+gkEvDAlB
 MXWmeVC6tTOiHrheXUudS4efj3blZ8Rcwa23RLt2XgsaSjAtdOW5pt1eaQ24cHWZGf9F
 klsA==
X-Gm-Message-State: AOAM532g0lM1WdhuQwdkIB/u7nuNZPV+4m6L3DKUM5UpyLHQ4XOdpF6j
 1tB+GhKtC4xru7njkUr6dQRKrNva0uV16Q==
X-Google-Smtp-Source: ABdhPJwSdzObFCB01MZ/6cedfHFSHDVrJ4G4jkIBtvlAIvwYev3ynbx0EzCwcu4lTH+QJmIOn+/WJQ==
X-Received: by 2002:adf:e7c1:: with SMTP id e1mr25031265wrn.23.1612288523828; 
 Tue, 02 Feb 2021 09:55:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
Date: Tue,  2 Feb 2021 17:55:00 +0000
Message-Id: <20210202175517.28729-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Zenghui Yu <yuzenghui@huawei.com>

When handling guest range-based IOTLB invalidation, we should decode the TG
field into the corresponding translation granule size so that we can pass
the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
properly emulate the architecture.

Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210130043220.1345-1-yuzenghui@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bbca0e9f209..98b99d4fe8e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
-    uint8_t granule = tg;
+    uint8_t granule;
 
     if (!tg) {
         SMMUEventInfo event = {.inval_ste_allowed = true};
@@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
         granule = tt->granule_sz;
+    } else {
+        granule = tg * 2 + 10;
     }
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-- 
2.20.1


