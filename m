Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B4696B4D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyzS-0006aJ-Nc; Tue, 14 Feb 2023 12:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzP-0006NV-K0
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:11 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzM-0005e6-59
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:11 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so12198210wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66XA5ahpF0JyhWAENDY8GXWO+QQO86mvJCTuMdEgvN4=;
 b=YgE7oD7SHqQ3eerD475aiMyNvYC4r5ytIxvJPGQQsEPpV5JW9ml/JRmpDL6ahfNWKf
 4GmEvT08epRMMJVlG7aJhZeo3NLxxBYAP+29OBi7r9lGBwotmEAtRLMnyBQJObZH1oLA
 w1d+wWqHwSGJMet3bEki9b4wvqwMtotHuYItfiXgbzZ6GqAy+tjlNOKlfzs+bUu0FZ3A
 kBYJPADHFY6uupdlWGsEEN592v1lFBpG05bZ4HGGA1oiUzcXyuel6UUtOEDFOnZtZ07r
 Qn+zQ9QOPGCtslKrlVVZCaBTK9NESExjNmLdNKHi+zLfsluPOM5tNIr8/UmykoMwQZA5
 wRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66XA5ahpF0JyhWAENDY8GXWO+QQO86mvJCTuMdEgvN4=;
 b=4ROcwOaH1WpGc3IKn/77dodazMo8hSBvdtpKM9OGm8Z3DqUapCx7F/nS21NKhxkfRW
 MO9RgSwJH4w3iU1PUSADqRxS4hOQmhejYugRIaGBR1Fh/6I+ETg+6OA7+BauYbVfi4tP
 bYyOB8/Lfd0eCZJ1A0Jt6QMjeDNFVzAYUQAemCjCi51+wfXTh7S58yvU3FiNKacXZL3s
 k7Fe4FYhnBdf1Bp9BAzv1uwPVOsTtvb7TX39qrl4mRAJPoU0htXx7O3w9hsO+DGAfKR9
 12f1LN7waWSLfCHQhQmdinWtJmhdZXO/xnMOPZA+Wzd02PV2wH2zt8Gvqdro8qEVE+/9
 09Jw==
X-Gm-Message-State: AO0yUKUjfsybizFeCPETrSxWn4EGFwEeDk1rday2bL+g2iBC9qF4QLd7
 31cprsud4gsOxvHVvVzolT7r+A==
X-Google-Smtp-Source: AK7set9T4/PX46yicX/V8T3Q2fhdxsIF4izw+6imiaCt1mKCYUDyZfc3v5YAN/hQfOVIqgCGGJ/diw==
X-Received: by 2002:a05:600c:a39e:b0:3dc:4c4f:6dc5 with SMTP id
 hn30-20020a05600ca39e00b003dc4c4f6dc5mr2698765wmb.9.1676395266785; 
 Tue, 14 Feb 2023 09:21:06 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm20636570wms.22.2023.02.14.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:21:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 1/2] hw/arm/smmu-common: Support 64-bit addresses
Date: Tue, 14 Feb 2023 17:19:21 +0000
Message-Id: <20230214171921.1917916-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230214171921.1917916-1-jean-philippe@linaro.org>
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32d.google.com
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

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set. Ensure the IOMMU region covers all 64 bits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/arm/smmu-common.h | 2 --
 hw/arm/smmu-common.c         | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c5683af07d..9fcff26357 100644
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
index 733c964778..2b8c67b9a1 100644
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
2.39.0


