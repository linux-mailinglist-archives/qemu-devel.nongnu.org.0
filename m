Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98B6F2BE8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 04:03:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptIsB-0003qO-Jn; Sun, 30 Apr 2023 22:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs6-0003p9-PR
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:37 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs5-0003Fn-B5
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:34 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4edc7cc6f46so2500644e87.1
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 19:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682906552; x=1685498552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ndat+FBo1b63fMAzLq7S3YsnsowwHK/srih+mHf+b8=;
 b=fDkcM1jvrtIdIT8IQS+xNs70QCMxJg1d76ylWOB1YBy/H1lIhOmTxeScX2ECu3OcPb
 WUx5ocAy5O0rVX32jonp+TBnsGyWiyP7NMIpfoT/LaT1xFNVypP390O3tUb31UGfPjHH
 4FjEXMg7ySzk4EEzp5gFMlrJw1Xs7NpiD5Vo+2DNJ1/EZRfJZRkcMaq7uJ9aK3u7duy2
 KNxxYXj8oZRjatISp//bLpTfiLBJlwc5qIXRQDweXAWiXtdRxsPdHy8nzKTx8nBpmelU
 UcN1EOaifibY2113BltN5Vvl9jPuwQueP7KD0VbiaWQe2h9ygS1q+cgbLv8cWiJ/3Z3a
 LJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682906552; x=1685498552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ndat+FBo1b63fMAzLq7S3YsnsowwHK/srih+mHf+b8=;
 b=OGu6mdIDvoJlltLKUq3+dYKREaE8goHKEQl/1iwi7ZuRytbwejCI7HBvZ2yglKtduU
 PPQ04/sv5T860TkkhdF+URxB7+MagUuvTMvyU+CkynDyAcAz0Cdlpt5Om72kqfpYWTZ9
 IeVByaqscLB9Y7fKvAhZNapibrsyh96ibzFICUG7i+3knESe1Krw6pbUnb+MGt6j+6SH
 dKP1lgwZJnmtvUhNH0lxlr8rFhuYbGsZbBXYM/jtgFHaEbccY0h6486tGcfEHIEXO9vc
 kY6pEV4DtPb5tg7dSanXwCC023cd5tQfMMhKbAk37ZzbZk1UXFTl3jyvtxMatP3ez2cz
 kAEA==
X-Gm-Message-State: AC+VfDxAHDIJ4aY/+m3A/OhjSvzYCCQ+NDTZ24B6Ud8+V8ACb/fbDEZP
 LP1hGRXDxqeVGxK0Mo/bZ+dTRw==
X-Google-Smtp-Source: ACHHUZ7y2VSq9wB+JUwIzVhJxVdecJ5sd2hAvVzRHuszZhy75UUC3wG34n+Akg/zReOSLfiFMs3sew==
X-Received: by 2002:ac2:5613:0:b0:4ef:f1f4:14db with SMTP id
 v19-20020ac25613000000b004eff1f414dbmr3531285lfd.16.1682906551977; 
 Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
Received: from vp-pc.. (109-252-127-135.nat.spd-mgts.ru. [109.252.127.135])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm3783271lfk.306.2023.04.30.19.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, peterx@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH v2 4/4] virtio-net: pass Device-TLB enable/disable events
 to vhost
Date: Mon,  1 May 2023 05:02:21 +0300
Message-Id: <20230501020221.188376-5-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230501020221.188376-1-viktor@daynix.com>
References: <20230501020221.188376-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x132.google.com
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

If vhost is enabled for virtio-net, Device-TLB enable/disable events
must be passed to vhost for proper IOMMU unmap flag selection.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/net/vhost_net.c      | 11 +++++++++++
 hw/net/virtio-net.c     |  8 ++++++++
 include/net/vhost_net.h |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index c4eecc6f36..2364c8de99 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -552,6 +552,17 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
 
+void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable)
+{
+    const VhostOps *vhost_ops = dev->vhost_ops;
+
+    if (!vhost_ops->vhost_toggle_device_iotlb) {
+        return;
+    }
+
+    vhost_ops->vhost_toggle_device_iotlb(dev, enable);
+}
+
 void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index)
 {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..e6851b885c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3843,6 +3843,13 @@ static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
     return &net->dev;
 }
 
+static void virtio_net_toggle_device_iotlb(VirtIODevice *vdev,
+                                           bool enable)
+{
+    if (vdev->vhost_started)
+        vhost_net_toggle_device_iotlb(virtio_net_get_vhost(vdev), enable);
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3948,6 +3955,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
     vdc->get_vhost = virtio_net_get_vhost;
+    vdc->toggle_device_iotlb = virtio_net_toggle_device_iotlb;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index c37aba35e6..36d527f321 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -56,4 +56,6 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
                                 int vq_index);
 
 void vhost_net_save_acked_features(NetClientState *nc);
+
+void vhost_net_toggle_device_iotlb(struct vhost_dev *dev, bool enable);
 #endif
-- 
2.35.1


