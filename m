Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD5692383
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWRF-0007By-FU; Fri, 10 Feb 2023 11:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR7-0006gO-Dp
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR4-0000UP-AK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso6687846wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MhaVPxfxbtAezcy2vU3U8mTUUFFbUwtf08uGYyb7ms=;
 b=otyrgvzX0nzYp0hPREsp3SRaiNgXtH2xnusVJKtkJrv8noEsduLcB5nrPJxs21RYZ1
 i8ilO2l4J/GDuFixWoXAkdDZdnXLmTJta2AOx61hBalpZQvv8fI+FxcQ2TWDdHY2paMJ
 VtvVxtFjOPDffsZ2KT4TMwKw8vaKVi/mVWoCJhs1YbjPgQTfGi7jTRAg97bW1SbIaifn
 SqT9VNlLr0NmZ0MSAzMJZJv2yREEmze+9PVxN0TS8wNN1Rrh/JxTo9jch/F2ZAHZA1bY
 T+6vLoJNloJkdPNPTODetQVE8EiRdUq1OmzU93+BOzEKcLt1MATOmPYEk81e49y0Aiu2
 6exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MhaVPxfxbtAezcy2vU3U8mTUUFFbUwtf08uGYyb7ms=;
 b=193xBCdrgSbG3NC+CAQlJYH2r5fvXXd1HSQayHAyW3KF9SxTkjhv7DMs/ZJYLtxj3u
 mpD50WcGmiPx/eIeQhYfxe9XLcsewtF140tjKJngmX4IGXhGWR7hHQGwaFb60B+6Twgd
 2fba+Ykchk+8gUHd83U6FAW7nbXLPKYcjvPlaajmkMl46lkPZtR4nNWGxSK4c1kDJ2bw
 jrotxKwjuQznuGqrglgegpzDdUcUVh6UJeOIdoHv581gn999646FUlrim6Nnvb93LT2h
 +6Yy2Qc+SjEe676mubuzthrLhvqySFxXzVRdSzAdRU1sviDsMIdenvpWyZ58/nrqvxp3
 0Vzg==
X-Gm-Message-State: AO0yUKWP8DcqhfWiNGxn2yp80Cotr0pch+l7VSxohrytWKaa9A4qQWJ3
 mVCacn1TQEtK6HWWN4WU/B0gTw==
X-Google-Smtp-Source: AK7set/3yfbZ+1GWHqrgXGTwk30389I2qYKMF/q1eznAwUDpG3lKJe26yUY85T5dU9eExJamSjDsmQ==
X-Received: by 2002:a05:600c:318a:b0:3df:94c3:46f2 with SMTP id
 s10-20020a05600c318a00b003df94c346f2mr13577402wmp.23.1676047179597; 
 Fri, 10 Feb 2023 08:39:39 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6312144wmq.5.2023.02.10.08.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:39:38 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
Date: Fri, 10 Feb 2023 16:37:31 +0000
Message-Id: <20230210163731.970130-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210163731.970130-1-jean-philippe@linaro.org>
References: <20230210163731.970130-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set. Ensure the IOMMU region covers all 64 bits.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


