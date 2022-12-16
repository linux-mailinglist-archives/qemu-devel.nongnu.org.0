Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0364F411
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:25:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IaK-0000UO-Kj; Fri, 16 Dec 2022 16:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IaH-0000TX-Ho
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:38 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IaF-0001gL-U2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:37 -0500
Received: by mail-ej1-x633.google.com with SMTP id vv4so9260807ejc.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7Kne5R8D0Rl7GtSzSpXaWZg8hIRjGsF2UHueTzlyfo=;
 b=wzChl2ecf3kJGbxNzkDuocBKmQZIRVUnz8UAuKsHkaxCVOmnMa9l8L3ZKE+6vAIlnG
 +5MWhTPEgwcIafLJnCzs/NJ97SINT02VoaZsPYJdWOLWgnzmQgFNh9RTFisfzq58LZvR
 1lQl0Vw16hgEJiMiSpo/PpAGRMMihR95ciZxe+wBuqLM+MjnkYDuRt19nNZxxOK4M/UC
 9m4FgomJUFrj+IhYPYtbBAiTRWOPBdDYHY42N6Fw53u0Ae/E7OK5b7WqrHLDkxaKp4ow
 gzlG9naoq1ezOhthscIuYhgI6tGbbyYe3kslmNqtCuw5hQdH2Jd052sgBi56hanHFHtG
 QUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H7Kne5R8D0Rl7GtSzSpXaWZg8hIRjGsF2UHueTzlyfo=;
 b=cm1fvDkLrAB/2Z/7wOoO50zJ1AYV3kpn6MoX3dYMfEp6QtsZe7zB4beCD4D5vBtUAt
 bf8ytCliO+0EFEQ6MlXtwkTB4af8rtRSytZPFQ8X2AKjl2E8MoHePx4fBm4MfhhO/M3d
 3lSUUJ8GHOdZ2lQEdlbAMZLw3HG/bglQ+1PmYtxLnX7xSv8OY5WFLTzvurTUBNxRGwRs
 QFn/+vL904mBeV/uXIN14mNKJn4YO2na1RhFBQBZTyVm1WM08lTQ40lGWhffljc8e7Sb
 YLCCVboqk5FvLh4imqRtCOkh/HA8zFkuZ8XJ5o7W43vtEhLnLytC50JBXAPpNPTe5cOk
 63SQ==
X-Gm-Message-State: ANoB5pl6uQERZUoj6NAkyFHxj/vQ3Hal3a32GjZWh+39/19UDA+mTq2P
 qjerjHePJgXx/II37qL3naHFMMxq6PbC8AH/aB4=
X-Google-Smtp-Source: AA0mqf7wdbSjrBOim1row7CcfFaGHzrW+H6teEwJr8vFko7C3OZKtJEg0O2YQl8IuLgzY1nvJGTNyw==
X-Received: by 2002:a17:906:f741:b0:7b4:edca:739 with SMTP id
 jp1-20020a170906f74100b007b4edca0739mr28900914ejb.5.1671227374156; 
 Fri, 16 Dec 2022 13:49:34 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 la7-20020a170907780700b007815ca7ae57sm1277767ejc.212.2022.12.16.13.49.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:49:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr()
 scope
Date: Fri, 16 Dec 2022 22:49:23 +0100
Message-Id: <20221216214924.4711-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216214924.4711-1-philmd@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This function is not used anywhere outside this file,
so we can make the function "static void".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmu-common.c         | 2 +-
 include/hw/arm/smmu-common.h | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 220838525d..9f196625a2 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 }
 
 /* Unmap all notifiers attached to @mr */
-inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
+static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
     IOMMUNotifier *n;
 
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 21e62342e9..c5683af07d 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -173,7 +173,4 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
 
-/* Unmap the range of all the notifiers registered to @mr */
-void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
-
 #endif /* HW_ARM_SMMU_COMMON_H */
-- 
2.38.1


