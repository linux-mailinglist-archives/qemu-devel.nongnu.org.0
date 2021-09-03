Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B10400151
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:34:55 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAHO-0007mL-Ph
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFI-0004JH-KG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFG-0005eI-Rf
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3923203wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UxcqYjdwb5grCsEtYCrZaLaggu6vBfiVHeFPBWbw7CM=;
 b=IIV+j1dSH7z4li39LHeHXAEnltDMk8/0yqjw3UGhfTaou44HOQt01kRTmhHTbqbbhS
 dOqkINoUG3zl8a5fk5ugqT4AxUiZ311Q0zm0kmsTZ5QaJNt3V2v+WUBqobInRJzJIprR
 OUDypIGqYuC74QcEDsrUAWOdiMckpab4lu0riCvmPqfNGwBIKqOTx8Bl1c8ag5VAbHV4
 bFMvnhJ+OyIBu3mrNHcQyf5XfkiSwfgGCy1gA55qruSsqDWNZjrnN6e8r0r6x0PBfJZr
 t8bmNKekRLCMTmEirEVmmEcEdnfVeY9O7Qk1a97Jj+jsXkDTn6M2z7KkjoQr0hjJzHop
 Gv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UxcqYjdwb5grCsEtYCrZaLaggu6vBfiVHeFPBWbw7CM=;
 b=Iu2hmUT2YMjF8fBv+RtNzn6pkRmpPc1nepFah2b4jxqi0YxaCJEDZugPfTixdnV0lR
 kzoPj7BYzgDS9zKnq8aXQaxYGQyUufF+CQjUfx0bCkR7o6BULCehkNUoMDRVw76zhO98
 3D/AR4PwGWJ6JOgiyhMwQce5bKYz7/9QXRhq8+KUyz5iiMUWR3Lq2GDDQeeNtyexJyNf
 +WdAQMWwXHfiQmSihwlJtNCrMo9eW4GkLkrIjxN5qLzR8Fkw3ij8yqLsXvq8wJUxttez
 9aUSUfes5CQsLGNaHEVsjTxt+uiMnJvAvFT9sxI4zTQIST1iNVkavMgIAUrYnj1GUyRJ
 gR3A==
X-Gm-Message-State: AOAM533jDmF4iXvPJEMIKHpTp/bTGJQn5eqLOAdrDEmyN16GGWCXRzEG
 5+r0NOyqFYUBr0g0iK3AnhEX5g==
X-Google-Smtp-Source: ABdhPJx5t99UBoMDqP1xZP/58xQBN6DiyIMcGR1YMUV4uBYTCZ+NX26+8ANLu4iJtjAL/hiM0/eSjQ==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr648689wme.171.1630679561543;
 Fri, 03 Sep 2021 07:32:41 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:41 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 5/8] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Fri,  3 Sep 2021 16:32:06 +0200
Message-Id: <20210903143208.2434284-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b4598d3fe6..5ca225291f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2475,6 +2475,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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


