Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27502435209
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:52:22 +0200 (CEST)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFlF-0008Hy-8j
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUa-0005CD-Ja
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUY-0002d8-DG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id k7so39555wrd.13
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2ZO3QF7aKiu/qtLjz0/gkgshbB0NhJBsLRiXAH1moU=;
 b=F5LghO364b6+pB6hJTsifG9M6OQl9putRZaeVKAN+amfgH+H1EiqiyVwoQTM9SWLjU
 RjzR0tWx8v+3fV+NEWU1sYlTvcoSzWAC3jw7kfuZAGYnnl645u1gqq1R0AkyzyGsWZWL
 X5qC5cvLVTxvpctmICwWCdDZqGlRi46AxLflTVXJnHdS2jOxyhDX9lAJw5Q/mfwrqkg1
 j20KOnjmBSM7n28U2FSUp+mNCCPIUQcoPjmRb6311imXE8WURHAoW7GwV8Fi7RCEfDCZ
 VJXmJJlSx0t/hElO0So5nUOTSPntvCmhI0tCxLdddBqAB6590QFGgpVLSTRGegJDCP22
 2UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2ZO3QF7aKiu/qtLjz0/gkgshbB0NhJBsLRiXAH1moU=;
 b=RewwKzLvJg8H4O6YsCeJRbg5sysfgub0nCpcwoL4U0ay3x46QhUkijL2XD0XizTi0x
 JZ0q9Gll8BeI5qZhH9eYADZWBG0ZEkDoFOukBzMBJXs9gfxErE7sZUc9ooOCRcczJCmo
 +T0BQKOwOl6cRxxx/GA+hPPc23OCL9dckJTcB+VC/Th8qpuE5uf0aZGEaQCc1lhWnT1x
 7mgR7RawCqBNwbI3sNZo3l0ctq+E25dsc0DCCkkVniCjng+fvct3sFrO/q/n0qTYHTIH
 ZzS7jZdMTgNzCwdTIzAzY2oI8ZD2rB+hJU3fafwlsg2cfpkEibhgroYl8WEVfwDijJaR
 Hzqg==
X-Gm-Message-State: AOAM530Wmo77PCFWw5VkSKwLODbmYDILGqVAbbSIkaTfxFqWPxFfTrXo
 1v8UVmkGWQ3IhNBTLIb17TxN5A==
X-Google-Smtp-Source: ABdhPJzUXaOAxVY7br9Qt/qhdKf+TEwQNcAjQDE0dOv7rnaU/Lvkq9lH8XIbAWc9fo3XkQqMeWsXtA==
X-Received: by 2002:a5d:58ca:: with SMTP id o10mr726675wrf.358.1634751305058; 
 Wed, 20 Oct 2021 10:35:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:04 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 07/12] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Wed, 20 Oct 2021 18:27:41 +0100
Message-Id: <20211020172745.620101-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3da7a86e37..25db8d4262 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2441,6 +2441,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
2.33.0


