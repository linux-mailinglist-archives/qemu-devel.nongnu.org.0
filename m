Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472966ECB38
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquGv-0000qR-UW; Mon, 24 Apr 2023 07:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGq-0000p0-Fu
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGn-00056V-Hr
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:12 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso18432259e87.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682335318; x=1684927318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/q4tfU1tBwdT+EHQodeGfa8pPty+c1D1ASDSQOSgHB0=;
 b=ciyJjKs124mc/NT8RSutQTAZqxq9UfYpRGX/PUK7IthVZ5MhH5kTvMwLNd+kKgnWFA
 QcGibYh1S3NrV6cLe7kI4L165/QiKyOlqw+858MOM+ES7KhOJRTB9mmdkLQ2xk9tyO7X
 F1/YowZsEdq0qqCz8JKki4d9iP3Wpoxlk13JKZsOJERAOM1U+DtB9JjjhDpsisDy4bGK
 jQ8IFN0Ar4W/CwXq3RoIGv/SpgY8HTHc6uM6KIt0kWDgWfx7ihglsbJZO77N4ljlh7N8
 3nbmF/pwPvl7H34lPagDiWriTg3YFs156596ge8Q+MDsyo3ISTqRpeIsHEbaxXjaKyhu
 DErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682335318; x=1684927318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/q4tfU1tBwdT+EHQodeGfa8pPty+c1D1ASDSQOSgHB0=;
 b=i5qdDz/85fAUBVdvRJCrDJHkDIeLZLIPZTFgymeTe0pV4/3y63k5J9ZWVTMPLTkWwh
 Sacic+tPU6HWab1OM1nEbognKUtYFpvIfZOWgO8TnIpveDJnuGVinSCxjVWIbN0s0a+l
 nqXJ6oC917/iclBGUO6y7n+L8BKBPVfjL9Jqow7kyQQ5V5nh6YCfEQwl7jZ7Eeiaf2AU
 DXnLYPV+JTsro4q7Y37WKI8VsqfkdnT3h8dOEV0BoK+sCGUHRXmovXRRHQR5iYxVd3V/
 POLKe8zletgRGCCaJRg5u1Avad/4xWQ8TtItxRDMJLRxfrVl7mHWTgmtyJTRzI6WkAw+
 f93A==
X-Gm-Message-State: AAQBX9dgYzWtJpkN/QhYmlUO9dTYqS3mHmKhutpMY1ySjl61KUyjrDSZ
 vQr1Y2NqA2b939+kil1/8NEK5A==
X-Google-Smtp-Source: AKy350b2A/7gi7zGaw6PRXH8Rd+IqR08QUgew+pmTLB3ltkRaTbuA3Cb6mqvvLpmR7pgdjEM7q+jSg==
X-Received: by 2002:ac2:424a:0:b0:4eb:e8e:4139 with SMTP id
 m10-20020ac2424a000000b004eb0e8e4139mr3878783lfl.2.1682335318680; 
 Mon, 24 Apr 2023 04:21:58 -0700 (PDT)
Received: from localhost.localdomain ([80.250.80.22])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a19f501000000b004eff0bcb276sm415542lfb.7.2023.04.24.04.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 04:21:58 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com, Viktor Prutyanov <viktor@daynix.com>
Subject: [RFC PATCH 2/4] virtio-pci: add handling of ATS state change
Date: Mon, 24 Apr 2023 14:21:45 +0300
Message-Id: <20230424112147.17083-3-viktor@daynix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230424112147.17083-1-viktor@daynix.com>
References: <20230424112147.17083-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Guest may enable or disable ATS for the device. Add logic for handling
these events.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/virtio/virtio-pci.c     | 12 ++++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c193..70f63a4986 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1731,6 +1731,17 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
     }
 }
 
+static void virtio_pci_ats_ctrl_trigger(PCIDevice *pci_dev, bool enable)
+{
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    vdev->ats_enabled = enable;
+
+    if (vdev->ats_ctrl_trigger)
+        vdev->ats_ctrl_trigger(enable, vdev);
+}
+
 static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
                                            const char *vdev_name)
 {
@@ -2166,6 +2177,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
             pcie_ats_init(pci_dev, last_pcie_cap_offset,
                           proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
+            pci_dev->ats_ctrl_trigger = virtio_pci_ats_ctrl_trigger;
             last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
         }
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929..2812561aae 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -155,6 +155,8 @@ struct VirtIODevice
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
     EventNotifier config_notifier;
+    void (*ats_ctrl_trigger)(bool enable, VirtIODevice *vdev);
+    bool ats_enabled;
 };
 
 struct VirtioDeviceClass {
-- 
2.21.0


