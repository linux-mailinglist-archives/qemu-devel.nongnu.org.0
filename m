Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD44757E0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:37:30 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSbB-0003e0-BV
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:37:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRii-0007LD-I9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:12 -0500
Received: from [2a00:1450:4864:20::334] (port=37503
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRid-0000GW-Op
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso18187790wms.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QlaXP6HbGtQy9VsDGePHKfrhYKYYns72bklRe3d2y+Q=;
 b=acr/bnKNbqUmRD2R7Sw/VjV0XRccsvZmzoH7YW5x7NI+hz9b4K/Gu7ckbrVnZi9x3F
 QVXLA/7LHztD6zzd5gRRMHNorRwRAGdyaqFkxbassE5WyGehKJlukN1PodL7bQOnurjv
 DIDa/m8kjbY3bf7EJ+ZWwa89+50YbtmLG68mXtH6jZVIZHj6SMVLp0U6N5K/XrleHP6U
 5bj6JAyTUeieaDsQezQCUFEeH71clpLKJEJtvffxzscqgehShKSVCjUVnEYS2ker7o4F
 uoo30+IRLWlW867e0wWfKJOgl/OFbEsJbcOvFTKbP9sCio/JIfvXLkiMeHyGJUt+n0QE
 KW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QlaXP6HbGtQy9VsDGePHKfrhYKYYns72bklRe3d2y+Q=;
 b=OLoiiC1Y+gX/1mVbbjEIFxONdZrFUtxnAz/kqMJ/4OBPgYkVMWG6ykU5S8sTvE9x6W
 W83hxYAIpK15Fe/WcA6eEtg9rSsEcEtT4RSFqtdbjNSr4c3JQdGZR5gFZi1hESyz11+V
 HSbKDVxF5Fqhf0Z5MQ4Z0d5dTRsbM+5ooDeRsTdGkGM/sxiQLGP/1M4nY6BIfC64Hrb6
 GyUma1MHVyGs4Tb3RJm/28hHMw/YMdSqZUWdDP7ZJTLnhB7RnYI6zzqkr7mzmCVxRBmU
 NCqsRLbMMVZm6UIo82JzF9cnEkQmrA8Xz7nLNpDBDCM7jiApZHlNkGDZdczmv2kDyvYt
 m0aQ==
X-Gm-Message-State: AOAM530tLjEieNwuCs85wQUWZK+IwaCaNjPVXAcQBVN8WB0sQrQ0iL0R
 HeOzB2DiGi4XRDgyNr23l9kzAX58cG8MFA==
X-Google-Smtp-Source: ABdhPJyJbwQ2nFK8sxIBX3VkzXs38eOEdFQL/yMXhJS9bTyFPUU1H21YbUbRC/JEcHTlNscYBDkKcw==
X-Received: by 2002:a1c:6a04:: with SMTP id f4mr3986596wmc.56.1639564866441;
 Wed, 15 Dec 2021 02:41:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Wed, 15 Dec 2021 10:40:44 +0000
Message-Id: <20211215104049.2030475-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-4-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e621cada990..41c9808a3fd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2493,6 +2493,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         hwaddr db_start = 0, db_end = 0;
         char *resv_prop_str;
 
+        if (vms->iommu != VIRT_IOMMU_NONE) {
+            error_setg(errp, "virt machine does not support multiple IOMMUs");
+            return;
+        }
+
         switch (vms->msi_controller) {
         case VIRT_MSI_CTRL_NONE:
             return;
-- 
2.25.1


