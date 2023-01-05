Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7765F2B4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTNt-00027f-2d; Thu, 05 Jan 2023 11:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMI-0000m8-01
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:50 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMC-00071v-Lu
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1787108wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3npsTUveFtQ4HNUpCii6m95dErHPlNzn4rRyXMWJ2LY=;
 b=FtUPtj6STbtw9GjlSpF61MkZUBHAuggA25z6TacVSdPaz12QqRGvzMjGbgFCuFpBBL
 L2Wdt4EyO9Wu9Im/dRDLRiByXSvEF3rFNPv3gPfORsAuWYbCUQEznC/ub7vNlIhavaxW
 KsAc3W7+7oC03UsUWVa7hRzUn6EYzCD4nDY0WaZlDnmLETvmnbj46JI1x8QJT2hvBRAu
 5v2LD86fpCRdaCLgIuJWwXKDxjirFAGMM3o07GbqlqBAtojzxMn8Idx/lke5jhVnbaf8
 /YeNTNO3FtumTM+b3W5pkQv/i386zaWV6G0qV1JF3C1HfgOqVUfutJJMD6N0fGYJWTDk
 86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3npsTUveFtQ4HNUpCii6m95dErHPlNzn4rRyXMWJ2LY=;
 b=8C6YdvUzpvzL28gKEWCa2viCHbkO6TFtGsFMPiujBnHcBnwX7LnooNg7jN9RiZolEy
 B7a9UII7S6jtFeXyrC2JKSWUguj+fWsXZys7zY5bRuBrzZ78qzJ/AYTL9qBgjXDsPOUv
 uFvmml4TEXFYgUtoFemkE9yF9cGeWjgP2HI2ml6RN6GuzPzk2Y24VysHbru0Z2dXpqLv
 LW5uu8K153bIps60d3fvVHet2nyysMBsOWwwqwZw+J2PmgBw+8IwQzCxfhRVCuTj6mwV
 gJMhKe85aiKucXDPvu3fgUfvz+9tLS5TLqyVsOELy562Phmd9q3xavmlIiIXS3yPEaG6
 J7kQ==
X-Gm-Message-State: AFqh2kq17xXZMLn4QyLl5H/9AZ2bbo4em1DCumQZ87HSJMURFwqq4dOX
 aVVfcb1ug732nJWRZo3l7tIvEOE6eHeCjQff
X-Google-Smtp-Source: AMrXdXtxs0f3WcBZwO4QXP0GRz6hH9BUooflS5IYtENsq+JBPCnV13mNiE+uP7BPFGj108c+mpWiqA==
X-Received: by 2002:a05:600c:3d1b:b0:3d0:6a57:66a5 with SMTP id
 bh27-20020a05600c3d1b00b003d06a5766a5mr36114367wmb.0.1672937082502; 
 Thu, 05 Jan 2023 08:44:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/34] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr() scope
Date: Thu,  5 Jan 2023 16:44:11 +0000
Message-Id: <20230105164417.3994639-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

This function is not used anywhere outside this file,
so we can make the function "static void".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20221216214924.4711-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/smmu-common.h | 3 ---
 hw/arm/smmu-common.c         | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 21e62342e92..c5683af07d6 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -173,7 +173,4 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
 
-/* Unmap the range of all the notifiers registered to @mr */
-void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
-
 #endif /* HW_ARM_SMMU_COMMON_H */
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 220838525d4..9f196625a2b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
 }
 
 /* Unmap all notifiers attached to @mr */
-inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
+static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
 {
     IOMMUNotifier *n;
 
-- 
2.25.1


