Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7E31E8F9
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:09:44 +0100 (CET)
Received: from localhost ([::1]:36836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lChBn-0002IV-U8
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lChAr-0001s0-NJ
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:08:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lChAp-00026w-Nl
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:08:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id x4so2673090wmi.3
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 03:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXQSQo7Hc/L1KqnxrJ70hCx+zeK9zsPCAZ6m/8RQUh4=;
 b=U/JKzeOJ8e838ZV3Thg/eHlC9H8Gl/+HhVNT7v2eu6mkWDcEM+gxZnZBA7odMLc5Xc
 XaZASG+Moxzt97vHWowpbNVHT8PAiQrhiWAgidqsFWDQKH7lWPfRVeEM6VYfmcg47dES
 3/uJSK0Ctqjk4Yl+sxPd4rFgBsD4zhQe9QJ5le2QxwLzlZy1jrr76bIQbokr+vAKuLFa
 SEuc1iclRIOuzw7F6rJZCLODI2UDrmp+bhKqNNepDPuYBujZkIcbYO2RKJUA5OOjq272
 klW76pdmZONn/2R+J4ZRAcUz6dhI5fWwi/2+trZW1sCU+NMjkyFwH7POW89rzhWOE2MF
 iRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXQSQo7Hc/L1KqnxrJ70hCx+zeK9zsPCAZ6m/8RQUh4=;
 b=WAuBjAmH8XU4hJa8uGxlFQ6Ig2qyc6+M8rzpAq3kUS4CdAkeynlvQpnF9ihkC+gIa/
 qMeVGscP7P+hoCpkZmjZh9Easj6SFBluBtvHr1ArewwBsHrURU5fHf1YQ2ahOqRojAzS
 hWFDZkpQmcCyiGted0mtYkd47i25sA2debb6U/WzBN0V0yKRtcNQQedMfpC/K/X63o5V
 ldJW411eMuf9FG043xcfp4HARahQxbv+/E6POuFPuwXGtjQnQ3MAGt0CvZek3Nd5qVKc
 KD9JkT9sc/qZJT33ebrketwIhaHxmmYTrMKyCTUbtn3Xn2I4IyXnjG4YMpaTenJxguOG
 qPtA==
X-Gm-Message-State: AOAM530jXhH1O6R0cEnCA1TSKl3S6qprIxokhzZuhu0L99DktVOBTqDj
 2FcOQuBkzB8IdsDa8tfuUPNQEg==
X-Google-Smtp-Source: ABdhPJysJx2xiU3G0HpaKV4lMHn0APjr7vonhx3XBQysTFMCq4fv0sTNlvuZ2t1wIpA+ZSs6/qOT0Q==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr2993114wmq.72.1613646521709; 
 Thu, 18 Feb 2021 03:08:41 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id o25sm18113717wmh.1.2021.02.18.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 03:08:41 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH] virtio-iommu: Default to bypass during boot
Date: Thu, 18 Feb 2021 11:59:30 +0100
Message-Id: <20210218105929.1433230-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the virtio-iommu device must be programmed before it allows
DMA from any PCI device. This can make the VM entirely unusable when a
virtio-iommu driver isn't present, for example in a bootloader that
loads the OS from storage.

Similarly to the other vIOMMU implementations, default to DMA bypassing
the IOMMU during boot. Add a "boot-bypass" option that lets users change
this behavior.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 273e35c04bc..4c66989ca4e 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -58,6 +58,7 @@ struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool boot_bypass;
 };
 
 #endif
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2f6c8..cd08dc39eca 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -689,6 +689,25 @@ static void virtio_iommu_report_fault(VirtIOIOMMU *viommu, uint8_t reason,
 
 }
 
+static bool virtio_iommu_bypass_is_allowed(VirtIOIOMMU *s)
+{
+    VirtIODevice *vdev = &s->parent_obj;
+
+    /*
+     * Allow bypass if:
+     * - boot_bypass is enabled and the BYPASS feature hasn't yet been
+     *   acknowledged.
+     * - the BYPASS feature has been negotiated.
+     */
+    if (s->boot_bypass && !(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK)) {
+        return true;
+    }
+    if (virtio_vdev_has_feature(vdev, VIRTIO_IOMMU_F_BYPASS)) {
+        return true;
+    }
+    return false;
+}
+
 static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag,
                                             int iommu_idx)
@@ -715,8 +734,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .perm = IOMMU_NONE,
     };
 
-    bypass_allowed = virtio_vdev_has_feature(&s->parent_obj,
-                                             VIRTIO_IOMMU_F_BYPASS);
+    bypass_allowed = virtio_iommu_bypass_is_allowed(s);
 
     sid = virtio_iommu_get_bdf(sdev);
 
@@ -1156,6 +1174,7 @@ static const VMStateDescription vmstate_virtio_iommu = {
 
 static Property virtio_iommu_properties[] = {
     DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.30.0


