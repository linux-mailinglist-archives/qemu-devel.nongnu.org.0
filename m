Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97340B258
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:58:24 +0200 (CEST)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9tA-00017W-1o
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MS-0006Bw-5D
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MJ-0005Nr-65
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so2694216wms.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A36UF6SLZ6rtAL1T4W2mA2INEfGxveQOg5GlQyADzqg=;
 b=ds+QZrm0k8l6jUBnwq7IHqicrPeYluCt5ucvx08hT+feUN7pwPu6PbkcvYq79e8zSZ
 cUXaa730IdoRFKFVuy8bX6nWXeCDnnW5DLZ0OQar9bxGvU4sS4lZnGsivQb8PuKxB4nk
 GktCDrEg7OxnSRzyTae7SzZZjSFhoflGchISB7NnIVxReu+uxjn7wxedYK7HgWiO+Vii
 iVbY6MOkru0vYWdmUATcKNdpk4nlMKicxxtRfnkNtJAvnhS0uOW8vMsiKh+Fhb0DuuuW
 00lQu1haYeImtZtVU2Z+E/SeRdqDXkine0VdZSXPMI4UAZb7Uhia/obAnLPxCv52Q200
 hDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A36UF6SLZ6rtAL1T4W2mA2INEfGxveQOg5GlQyADzqg=;
 b=FwBsA+o24EfvEU08BQDBI5FhqMrouk0TIL6urHedtgZsW8ju8hccSzQVhQpMw3UnFF
 uORz2NT53kYbDYypeUwf+eueYVoRiRuwNHEOt+gvEKpZkSRgFbQAe3juzth6TAwYiL7u
 Ii4melEkRs6VrQchSM7qrJBWHKZnFLezj8MdljmMY5trXen5XVuTZ6sMvqwe9jKj9XmV
 b0xXaw8ivXYo/+ny1Y7hqSYaptkEX+QVNZ/ibAPZmrx+0l+X9PMyG31SyWVhjCKx+wq9
 3J4bOsIZ8N8nlQ7WgqFeu8HLjs3TZOfl16OXGMDEv+Mc4JrsbfF8hgY/uFZkXu+LDmaz
 YnkA==
X-Gm-Message-State: AOAM530Z2vFxoXRxAfFrQJWtzIsMjXse707w6mPU6jWg8eiR3bsM6w2y
 f0js90j8pK6OXLfcHyiNhLPvxA==
X-Google-Smtp-Source: ABdhPJxoFhbmut1SdFumG3abKSHctHBuRzVOmx0faYeQZZXquOQtkJ9arlsAZYufMNOCkdlLyxbJlw==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr2530132wmj.68.1631629465295; 
 Tue, 14 Sep 2021 07:24:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 04/10] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Tue, 14 Sep 2021 15:19:59 +0100
Message-Id: <20210914142004.2433568-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f238766aa1..26069f943a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2471,6 +2471,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCIDevice *pdev = PCI_DEVICE(dev);
 
+        if (vms->iommu != VIRT_IOMMU_NONE) {
+            error_setg(errp, "virt machine does not support multiple IOMMUs");
+            return;
+        }
+
         vms->iommu = VIRT_IOMMU_VIRTIO;
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
-- 
2.33.0


