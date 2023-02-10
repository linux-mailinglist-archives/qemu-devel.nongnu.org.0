Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C78692384
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWR9-0006ti-Sk; Fri, 10 Feb 2023 11:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR7-0006i1-K5
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR4-0000UC-AM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: by mail-wm1-x329.google.com with SMTP id n13so4227270wmr.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=usy+gvwS+JxR9gEW4rdKIjKndc55aNyj2tFUAGWHkSo=;
 b=x9N9jFjug6CynwRuwkXCHfbmzOxpXYLc+dJdMrWTjdIRw3HhXJ6E5Pcjxstq5FF7gT
 5mBwiCl+sMpYZ6mvzprOmVAhXFblo64VWEfl+gKyPu0b7vft+M09XJMjNh0IUkFExE6l
 UwW/i68WxR0y3J1d0dc2SHAVX+tMisjmx+5C5qpXg8qshNNZZB/gyzqNvFTg4DkSpfw+
 0dk5XCJRAd+SHMuQ8XOz30H3NOgfkc5wIlUQF07mkJfDu/zOAuu1UNOk+1aC4Jtni7vl
 UVczrnxJmIZU8h79CrpJKdup1RvL9Tko9+XGNoXX9gZQBrMyyglUf4iX60b9XP29IML5
 qKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=usy+gvwS+JxR9gEW4rdKIjKndc55aNyj2tFUAGWHkSo=;
 b=nYTwws3K/XIGeV316xzHbe41P6Ja3MXIoludFTZkU3khpldFOuq6+UHwhxCL3CyoRd
 RheNUszSrsGV6ez/WvGbDx7Xw+fLwURtZXlFDbR9f0/JzXqt2b9XufGriuzkARAmG/9e
 0YUTAUNAL7jKJxoIRnwpN8WRS+4RjOcnrPc+ALxFy1C+0/crn2ypLp6sd+FvC7slYDh/
 srlD5mS/NkgVSH2iDOV7kbwEr0ZttXlOrfJ9V0L6SxX3DHSI+x3ylVOiy8Bm6vXTAk0b
 KqC7mzmmkkAb6oH5bcNcNqhsIxc9gc2X/qopJNvcEix/M9SbckPnm30VUIb5WNzKCt0Y
 sxJQ==
X-Gm-Message-State: AO0yUKURmfIvoZIot903/SqWLFE1IioqNdFWavlkIFK+zccam8UfsTsJ
 YbdpeEQTHZUUh8ykv+/P8O4scg==
X-Google-Smtp-Source: AK7set99VAHRyUNQDOTmxUxPXwWlHsjlTjYFBzsERYN3LJTkMqBW/xtoc34/Njcs40dRrPjChBgLGg==
X-Received: by 2002:a05:600c:4919:b0:3df:a04a:1a7 with SMTP id
 f25-20020a05600c491900b003dfa04a01a7mr13488556wmp.22.1676047178494; 
 Fri, 10 Feb 2023 08:39:38 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6312144wmq.5.2023.02.10.08.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:39:37 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 0/2] hw/arm/smmu: Fixes for TTB1
Date: Fri, 10 Feb 2023 16:37:30 +0000
Message-Id: <20230210163731.970130-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
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

Two small changes to support TTB1. Note that I had to modify the Linux
driver in order to test this (see below), but other OSes might use TTB1.

Jean-Philippe Brucker (2):
  hw/arm/smmu-common: Support 64-bit addresses
  hw/arm/smmu-common: Fix TTB1 handling

 hw/arm/smmu-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


--- 8< --- Linux hacks:
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 8d772ea8a583..bf0ff699b64b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -276,6 +276,11 @@
 #define CTXDESC_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
 #define CTXDESC_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
 #define CTXDESC_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
+#define CTXDESC_CD_0_TCR_T1SZ		GENMASK_ULL(21, 16)
+#define CTXDESC_CD_0_TCR_TG1		GENMASK_ULL(23, 22)
+#define CTXDESC_CD_0_TCR_IRGN1		GENMASK_ULL(25, 24)
+#define CTXDESC_CD_0_TCR_ORGN1		GENMASK_ULL(27, 26)
+#define CTXDESC_CD_0_TCR_SH1		GENMASK_ULL(29, 28)
 #define CTXDESC_CD_0_TCR_EPD0		(1ULL << 14)
 #define CTXDESC_CD_0_TCR_EPD1		(1ULL << 30)

@@ -293,6 +298,7 @@
 #define CTXDESC_CD_0_ASID		GENMASK_ULL(63, 48)

 #define CTXDESC_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
+#define CTXDESC_CD_2_TTB1_MASK		GENMASK_ULL(51, 4)

 /*
  * When the SMMU only supports linear context descriptor tables, pick a
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index f2425b0f0cd6..3a4343e60a54 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1075,8 +1075,8 @@ int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain, int ssid,
 		 * this substream's traffic
 		 */
 	} else { /* (1) and (2) */
-		cdptr[1] = cpu_to_le64(cd->ttbr & CTXDESC_CD_1_TTB0_MASK);
-		cdptr[2] = 0;
+		cdptr[1] = 0;
+		cdptr[2] = cpu_to_le64(cd->ttbr & CTXDESC_CD_2_TTB1_MASK);
 		cdptr[3] = cpu_to_le64(cd->mair);

 		/*
@@ -2108,13 +2108,13 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,

 	cfg->cd.asid	= (u16)asid;
 	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
-	cfg->cd.tcr	= FIELD_PREP(CTXDESC_CD_0_TCR_T0SZ, tcr->tsz) |
-			  FIELD_PREP(CTXDESC_CD_0_TCR_TG0, tcr->tg) |
-			  FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0, tcr->irgn) |
-			  FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0, tcr->orgn) |
-			  FIELD_PREP(CTXDESC_CD_0_TCR_SH0, tcr->sh) |
+	cfg->cd.tcr	= FIELD_PREP(CTXDESC_CD_0_TCR_T1SZ, tcr->tsz) |
+			  FIELD_PREP(CTXDESC_CD_0_TCR_TG1, tcr->tg) |
+			  FIELD_PREP(CTXDESC_CD_0_TCR_IRGN1, tcr->irgn) |
+			  FIELD_PREP(CTXDESC_CD_0_TCR_ORGN1, tcr->orgn) |
+			  FIELD_PREP(CTXDESC_CD_0_TCR_SH1, tcr->sh) |
 			  FIELD_PREP(CTXDESC_CD_0_TCR_IPS, tcr->ips) |
-			  CTXDESC_CD_0_TCR_EPD1 | CTXDESC_CD_0_AA64;
+			  CTXDESC_CD_0_TCR_EPD0 | CTXDESC_CD_0_AA64;
 	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;

 	/*
@@ -2212,6 +2212,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
 		.ias		= ias,
 		.oas		= oas,
+		.quirks		= IO_PGTABLE_QUIRK_ARM_TTBR1,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
 		.tlb		= &arm_smmu_flush_ops,
 		.iommu_dev	= smmu->dev,
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 38434203bf04..3fe154c9782d 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -677,6 +677,10 @@ static int dma_info_to_prot(enum dma_data_direction dir, bool coherent,
 	}
 }

+/* HACK */
+#define VA_SIZE		39
+#define VA_MASK		(~0ULL << VA_SIZE)
+
 static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 		size_t size, u64 dma_limit, struct device *dev)
 {
@@ -706,7 +710,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
 		iova = alloc_iova_fast(iovad, iova_len, dma_limit >> shift,
 				       true);

-	return (dma_addr_t)iova << shift;
+	return (dma_addr_t)iova << shift | VA_MASK;
 }

 static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
@@ -714,6 +718,7 @@ static void iommu_dma_free_iova(struct iommu_dma_cookie *cookie,
 {
 	struct iova_domain *iovad = &cookie->iovad;

+	iova &= ~VA_MASK;
 	/* The MSI case is only ever cleaning up its most recent allocation */
 	if (cookie->type == IOMMU_DMA_MSI_COOKIE)
 		cookie->msi_iova -= size;



