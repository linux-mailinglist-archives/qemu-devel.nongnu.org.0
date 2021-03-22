Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF30344145
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:32:41 +0100 (CET)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJjb-0005b6-Gj
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcL-00088I-MB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcF-0005aZ-Jy
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z2so16487253wrl.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxON1Qr7rb7hFg/JIyQs/CCbfbSPzw+UVS/lLPV7U0w=;
 b=Dl0NOOKcxsXkZFrdBmrwToBObb3519KfbJFPuF6eqWNqTjFdpKv/XuVFXNtMwtjHkj
 lHTlWHcZ6YCnlsXhaktnAKHK+/l6LuOcBT5EmRrHvmBs/8EKvL6tqP4Cv4BUjtO/ZBoL
 uL17NWFifydFezExsDi2a7+ad9zkWurdIgB1GdOQA/EPXxyvz2P9UM950hgcfNIgZo/6
 rtRHin/cerlX/VMF7eqc+qSoo4NKOe4cCyQj/kpn59ZFM26Q43B0oosGGWOClGij25Iu
 yB4n3zvRUZ75+Y3xX33X59BWr/RwOE5ZvdVXkXQ2VherCgvLLCnilXp5eu4ZEFIpMgK7
 5Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxON1Qr7rb7hFg/JIyQs/CCbfbSPzw+UVS/lLPV7U0w=;
 b=IMTu2OJ6xi82h7qRhKdFT5nYuVZpE6Z4QrkUrEpWgsPKyzBhgufl9KpiFxj1Op86sC
 Ql0CDTlwsHVIzMBxFyVnGgrEZQgSAixFIF3NcListYawpHT4QGf3UsV9EEe7JvAVm72U
 sLKpoA5jDNT+8IUGuQRx9KFev4RGYYBq3gV6ksn1FrrO2ljCtnOe85hlBnHOl04PYqRE
 RN9Zfem9N0IWPJXp3ratkHhurTRvu+6yqj2YZrQgWyW82YR8Yrm/YPVbHKl4bxLxMzX4
 8fZBiseFHY9yVatAvQLtZhu1/n2OyRPfNVai14+7EXIag38tBi1KtG84wV2GwptiRawl
 +z5w==
X-Gm-Message-State: AOAM530qzZRYfCtP+5a2Ke4OJwFSzlIPnIJu/36S1s3rRL+x5jq5A/wZ
 AovYMFAVHWibd8S2O/uzkT/hcA==
X-Google-Smtp-Source: ABdhPJzHkvV3pfdCx8gtsbuBQ6+MXzbUiuthrdFQ/55YqBqjc+luZwvDkJVL/FMVkmzxPzRtdEeWIw==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr18261180wrg.165.1616415902037; 
 Mon, 22 Mar 2021 05:25:02 -0700 (PDT)
Received: from f1.Home (bzq-79-176-30-57.red.bezeqint.net. [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id w132sm16785325wmg.39.2021.03.22.05.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:25:01 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	berrange@redhat.com
Subject: [RFC PATCH v2 2/3] virtio: introduce 'missing_features_migrated'
 device callback
Date: Mon, 22 Mar 2021 14:24:51 +0200
Message-Id: <20210322122452.369750-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210322122452.369750-1-yuri.benditovich@daynix.com>
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This optional callback addresses migration problem in case
some of negotiated features not present on the destination
system. The device has a chance to avoid migration failure.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/virtio/virtio.c         | 8 ++++++++
 include/hw/virtio/virtio.h | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..36dcac75e5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3107,6 +3107,14 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
         vdev->device_endian = virtio_default_endian();
     }
 
+    if (vdc->missing_features_migrated) {
+        uint64_t missing = (vdev->guest_features & ~(vdev->host_features));
+        if (missing && vdc->missing_features_migrated(vdev, missing)) {
+            vdev->host_features =
+                vdc->get_features(vdev, vdev->host_features, NULL);
+        }
+    }
+
     if (virtio_64bit_features_needed(vdev)) {
         /*
          * Subsection load filled vdev->guest_features.  Run them
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..fbfbec6ef2 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -158,6 +158,14 @@ struct VirtioDeviceClass {
      * processed, e.g. for bounds checking.
      */
     int (*post_load)(VirtIODevice *vdev);
+    /* In case when some of negotiated features are missing on the destination
+       system, the migration is expected to fail. To avoid such failure, the
+       device may implement this callback and apply graceful configuration
+       change to extend host features (for example, disable vhost).
+       If the device returns true the virtio reinitializes the host features
+       and further set_features call may succeed.
+     */
+    bool (*missing_features_migrated)(VirtIODevice *vdev, uint64_t val);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
 };
-- 
2.26.2


