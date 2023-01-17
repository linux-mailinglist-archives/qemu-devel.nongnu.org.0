Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46466E703
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrf6-0002J5-97; Tue, 17 Jan 2023 14:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHrf3-0002IX-Rv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:30:21 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHrf2-0007vx-50
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 14:30:21 -0500
Received: by mail-ej1-x629.google.com with SMTP id az20so58711168ejc.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 11:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l7/Pf3QFy7tCNP1T2A2CbqV1qRDD69xfRcKghv8dT2E=;
 b=B4cgeNkLMnxoXm6wGLj82xnvRcoJ7RK6qZZ9lfNNEI3Zbpp5QhksaHfSrqzNJmaQin
 x6sioJHeRR9TwkeZluIUlX0Gd4OQV2ijDzbRe3zKFz8AMTTYLwMh+HGFhvc+rC9aE4Wk
 d6h1rLkS2s+ikTdV3z5tS3b6SAZ6kCc5ZqDMOcHTa3Lt7yETZ4dNfi9oN7yoRwSyO8PI
 ffSrsf+XXUfDuMSzc1leB2VhNK3IOdH9AD83RDgVSVMgdXJzseFnTiLeHnQTuig/32kc
 u0IgBYLwOXnGCQETkstFpO1qVeEUmQ/2KD7w3Qv6Zruh3sFTjxRj7LNgvixOBFzna67i
 xcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7/Pf3QFy7tCNP1T2A2CbqV1qRDD69xfRcKghv8dT2E=;
 b=WxjXCVhVsh1R8vWuC70tI+6QSi1s/lC+wCcreimKYBTUH6Ik+mnCtbmkgW0bF+KHRW
 jNcFdjBh8xrN7gpfNXTfbqwYMvjuQYJCtvIaEWSXf5GUColkD54FevjzixsZWJSDbbWL
 RHiKG7mfMoGteCyCplCelGXvhRhRo2d75FhI+jLQGabDCKXAyngzxZfNEpcs625LkvHS
 /W4lFSC7xy64b+0Xw1nRFKqmZoS8wQ1/RgOoI+dDIjlTGjduCvewdco3b8do++t23N9M
 +2mU44+ncTtXE4osiyxdsK2dNjuTtnzW+xRMNIXhmNUTANI2bn64IL6+z6ZbZ7LY3Xxa
 pflg==
X-Gm-Message-State: AFqh2kq9aSHc9VhO2ILGngKY0MEM53cNhTcqKTscyL+ptx23EAd3wPn5
 m8YaBqc4Y5I9jFrYZf3jzIWAp69lIAit4ruo
X-Google-Smtp-Source: AMrXdXuLKKgn08/M18hhdbqATnoBnF+NC8pFG0tMxrlMBOpQ2BGwL12drIzp0zh60xPlzduaHVyVow==
X-Received: by 2002:a17:906:e2cd:b0:870:2aa7:6509 with SMTP id
 gr13-20020a170906e2cd00b008702aa76509mr4329544ejb.43.1673983818290; 
 Tue, 17 Jan 2023 11:30:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ia2-20020a170907a06200b00868c5005e13sm6323824ejc.98.2023.01.17.11.30.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 11:30:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw: Use TYPE_PCI_BUS definition where appropriate
Date: Tue, 17 Jan 2023 20:30:14 +0100
Message-Id: <20230117193014.83502-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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

Use the proper QOM type definition instead of magic string.
This also helps during eventual refactor while using git-grep.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmu-common.c     | 3 ++-
 hw/virtio/virtio-iommu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..733c964778 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
 
 static Property smmu_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
-    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 23c470977e..1cd258135d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
 };
 
 static Property virtio_iommu_properties[] = {
-    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.38.1


