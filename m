Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A3D6ECB37
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquGx-0000rF-Ll; Mon, 24 Apr 2023 07:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGt-0000pL-Jj
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGn-00056p-Hw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4ec94eb6dcaso4574784e87.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682335320; x=1684927320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDgBd0KM6E87x+Aap6dd/kXysuUUzOZolqfyQRQpgT4=;
 b=u57P0ANgqYDoVEtqclKYBCNf2qFObtVMRYwOWWF2bvjjnGkKSKFFEMMglPkqmSsF8P
 rhixtU5SAqBbfc3TCTXK0hL9RN0r3y5B65DWUk16ufxLuSl/4luLy7qINS1txgUh/N67
 RsK1qwx4I/35NhLrGYmbWHLJHj1AEwFk0/NOrzJRo2uYHg6+A3No6jjbY3+Tbk50DNMT
 oXpW55Yupjpi6w+fx1cBYLiRwPHFGkriMae3AlmKI1mLmqxwrjERs6FrioRGpYgRpF3s
 H0YXyTKutT6oGt7s+mFgcLOS9K9F6hBf7fQtXEDbRuQJqyk7T96l5oOubVWJaTdqOemW
 yYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682335320; x=1684927320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDgBd0KM6E87x+Aap6dd/kXysuUUzOZolqfyQRQpgT4=;
 b=eNMQzi44X/BtosBMcMj1uD3S/ebBN/xEBKpRGzrJ16rc6I0Lx3rCcYc26q2RQ8DdwB
 QwNZk+9wFkd4d5wrvHg8qJA3WuOST88ZeOqCAy6Z7L2bpSJdvec2KX6hxwn4+CgNupJF
 Mdlfcj+DG34vX9BuswmUS5yqQuGE3SWOgjZjyIfw2NNYmnCMiwlQUOO2AMdOUN5gkUOe
 zP29Yg4FEXLkaSKoUETJSe6ZIXBqtnvkYJWD35BDJKbdS1fFEhSPY5L+tq8/fcphx/EP
 FIqvCbONJM1CAKeWcqCRPLdrtkUHQcLzZkh7lk6cS0B40xmrRJImovaikEtdbDFD4KYE
 cKcw==
X-Gm-Message-State: AAQBX9fQb7G785OX/nnpHUSN6Sx0B5I1nzX2kJj2fLXIDBM/RLY4UDGg
 EAF9o7F2DJn0MEJMFtWZ6gK26Q==
X-Google-Smtp-Source: AKy350ak0KCJQF230x3JvHEY99VEfqeyzGDYXNR4o54v5nK06xxba3SNHDbpAncS0MBeGL0QTV95Yg==
X-Received: by 2002:a19:c518:0:b0:4eb:3b58:c558 with SMTP id
 w24-20020a19c518000000b004eb3b58c558mr3027695lfe.59.1682335320193; 
 Mon, 24 Apr 2023 04:22:00 -0700 (PDT)
Received: from localhost.localdomain ([80.250.80.22])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a19f501000000b004eff0bcb276sm415542lfb.7.2023.04.24.04.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 04:21:59 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com, Viktor Prutyanov <viktor@daynix.com>
Subject: [RFC PATCH 4/4] vhost: register and change IOMMU flag depending on
 ATS state
Date: Mon, 24 Apr 2023 14:21:47 +0300
Message-Id: <20230424112147.17083-5-viktor@daynix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230424112147.17083-1-viktor@daynix.com>
References: <20230424112147.17083-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::135;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The guest can disable or never enable ATS. In these cases, Device-TLB
can't be used even if enabled in QEMU. So, check ATS state before
registering IOMMU notifier and select flag depending on that. Also,
change IOMMU notifier flag if ATS state is changed.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/virtio/vhost.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c378c..1b14937020 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -796,7 +796,9 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
     iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
+                        dev->vdev->ats_enabled ?
+                            IOMMU_NOTIFIER_DEVIOTLB_UNMAP :
+                            IOMMU_NOTIFIER_UNMAP,
                         section->offset_within_region,
                         int128_get64(end),
                         iommu_idx);
@@ -804,7 +806,8 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n,
+            dev->vdev->ats_enabled ? NULL : &error_fatal);
     if (ret) {
         /*
          * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
@@ -818,6 +821,19 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     /* TODO: can replay help performance here? */
 }
 
+static void vhost_deviotlb_ctrl_trigger(bool enable, struct VirtIODevice *vdev)
+{
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+    struct vhost_iommu *iommu;
+
+    QLIST_FOREACH(iommu, &hdev->iommu_list, iommu_next) {
+        iommu->n.notifier_flags = enable ?
+            IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP;
+        memory_region_iommu_notify_flags_changed(iommu->mr);
+    }
+}
+
 static void vhost_iommu_region_del(MemoryListener *listener,
                                    MemoryRegionSection *section)
 {
@@ -2000,6 +2016,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
             struct vhost_virtqueue *vq = hdev->vqs + i;
             vhost_device_iotlb_miss(hdev, vq->used_phys, true);
         }
+
+        vdev->ats_ctrl_trigger = vhost_deviotlb_ctrl_trigger;
     }
     vhost_start_config_intr(hdev);
     return 0;
@@ -2055,6 +2073,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
             hdev->vhost_ops->vhost_set_iotlb_callback(hdev, false);
         }
         memory_listener_unregister(&hdev->iommu_listener);
+        vdev->ats_ctrl_trigger = NULL;
     }
     vhost_stop_config_intr(hdev);
     vhost_log_put(hdev, true);
-- 
2.21.0


