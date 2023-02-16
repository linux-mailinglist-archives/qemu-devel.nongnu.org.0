Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C2699AEF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnO-0008ST-N8; Thu, 16 Feb 2023 12:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnL-0008JG-QX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnK-0007oV-3N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id bu23so2524831wrb.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zD+gZe3NwGNlSfMSq90UNcL0FHuG48xEwAB0qrl/tCo=;
 b=cLsqx9DnS1kGAR7sg6OZeZz6lU/Ez1p14F+dH/RUieysPYmlqkv0JzVYqQCniZ4saZ
 G+iAEwLcfxxime0TOJXP5rrMFcSpb/WBjWXy4jajYRGcU7p7/wVlWX9F1DgV2s6FhJzt
 a4otSoHMDYXinUXACDgy1l98NySiQFaWx1D4nf3p0k+ZzdB2TOucUQfwrt+m5Xe9vO1C
 fZQVQwb/TApYOGxyCkNoCW5hQFvNKKHeRheTztfc/XQTgqCb/hfJmNM4jzurk5nJ/WKM
 d/ohQQyu2pP5M354VBl7tSuS5sQO1XxA9//eXFTv4tcqlaQk7ASbH59lcxMdrL84a3vv
 V6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zD+gZe3NwGNlSfMSq90UNcL0FHuG48xEwAB0qrl/tCo=;
 b=wfv/Pg8t/8noVlwAFaeG+FkcJLtGNXh6Grq47J/8taaTbLzWeX7Z95xDL/wTueshd0
 C3ldnMyRyxfV0XRzBsWXcy8rCX7K83hXgme1t6PT34QT8KOsYCDTmzpdPtllrwAOxdt/
 0QiKn2jCZ6B7DWmUcXi3P1Oe5Jw4G2hDMgKioFRNSi3HvchrgaLGa1p0L6GZVf6W0kwp
 d3pkcSuBdT2H5HWA4bxuX4C0cJnSqd5fqPJhVpwwJtBt6zTIEiyhEdqE9/OHTAj+d/Jc
 jYaeyiVMfnh7XkumJ4vNbJLs4PHWAPTgKvI4Ev/Iv1a1DfDKmmSXHZWQLaLw9kpIvRrk
 K92g==
X-Gm-Message-State: AO0yUKUbYPzUNKr6OEr2WnzgLyisNrCHibQdL7Fqyco13v+3FCGCID2S
 KJxrxDz4tJ8yoHVKWRJyR9qprcmrgAR/zriy
X-Google-Smtp-Source: AK7set8LGJAtNy/2CS4mBTiJPY44gDHbqyY2/Bzt/wzad0h1N5M2jCBjj5+eDNkrz7jLUeSFEMiBRw==
X-Received: by 2002:a5d:5082:0:b0:2c5:4d68:5511 with SMTP id
 a2-20020a5d5082000000b002c54d685511mr5904976wrt.48.1676567501343; 
 Thu, 16 Feb 2023 09:11:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] hw/arm/smmu-common: Support 64-bit addresses
Date: Thu, 16 Feb 2023 17:11:12 +0000
Message-Id: <20230216171123.2518285-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set. Ensure the IOMMU region covers all 64 bits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20230214171921.1917916-2-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/smmu-common.h | 2 --
 hw/arm/smmu-common.c         | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c5683af07d6..9fcff26357f 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -27,8 +27,6 @@
 #define SMMU_PCI_DEVFN_MAX    256
 #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
 
-#define SMMU_MAX_VA_BITS      48
-
 /*
  * Page table walk error types
  */
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 733c9647784..2b8c67b9a1d 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -439,7 +439,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
 
         memory_region_init_iommu(&sdev->iommu, sizeof(sdev->iommu),
                                  s->mrtypename,
-                                 OBJECT(s), name, 1ULL << SMMU_MAX_VA_BITS);
+                                 OBJECT(s), name, UINT64_MAX);
         address_space_init(&sdev->as,
                            MEMORY_REGION(&sdev->iommu), name);
         trace_smmu_add_mr(name);
-- 
2.34.1


