Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894F700986
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:53:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTBg-00038P-Gf; Fri, 12 May 2023 09:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBc-00037l-7L
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:56 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBa-0006Sy-HQ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:55 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac785015d6so106025081fa.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683899513; x=1686491513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GiU1Bp9osy3apaC7ea53hTYiSGjaET77MlLPjFYHdzw=;
 b=X/5UMIhpHQmiakE92CYwcQsCqUwFKFSXZvLSv1pLuGvo3v6YleKcO1yIfPHPMVYro9
 uZ02o5LG12683nakfgVG7iDbMbVU9XtaazkeP2brgBPMJ/UQf4ckK9josoXzQY1eCOT/
 5nSUyk9/GtvfFe3UR+TkVq3NNTefUnDgG/xfQnw1I91NrHxKGeZzvtzWz2DhCMBaUK3m
 ICOL56gvoFzPsRHTzaubF/hezU+93N2WTl3Qefe027EPCC9Nb3+iaBGYSgSwS/PKNv1s
 OvY3e4+gK2FvJ6NHHu8ThBXbILJTXyUgtkjL3rW7dySiHxAMysF5D9mUrvy9pxPa+Lmu
 yV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683899513; x=1686491513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiU1Bp9osy3apaC7ea53hTYiSGjaET77MlLPjFYHdzw=;
 b=JgdUCc0OUeeXgSwE8H89a4+B23pB3KL/xDpHDt9V/o5xbuORaZSoH1RrcBVkVRoZPj
 Lf34AtUVxeg4oMVEglysvxtndTtZ9OltIF0VNIk2TyTZ5OHuHp3NCF0iR8VJQKeSeus4
 GjUObKeqStiLEhwAK4+f/Nwscx+t/OxSoVoxPx1kGDEdz4/TQiedxEWlYOnssp8OCbyw
 RwW1CeKc1d/jfcAH5K8Yyeol6VraR5OjgSBikERypWKI5Aqt4n8VJgw11VrS7rOOKXm1
 yQd1WjVyIw7TCO1N62EpogmVJfTaAg0eSfPK1Y8u7zIVINvsP+iVSqd+KtKX4iJvqBQx
 9Iaw==
X-Gm-Message-State: AC+VfDwYS5URW3di9BLdqwaxFCPwk1+NVQ9BFsXzXtMHYHZB4dMY1GaY
 7VFa7B4Uofhbbnt9u+Ca+PT1BQ==
X-Google-Smtp-Source: ACHHUZ79eUJK/m9h3Z+oNYuIYFucdSyGXQCHshr8sDuo4yilnBmAaVRFH2svx27MJkzu2jScdYOItQ==
X-Received: by 2002:a2e:3314:0:b0:2a8:b27f:b721 with SMTP id
 d20-20020a2e3314000000b002a8b27fb721mr4077251ljc.29.1683899513187; 
 Fri, 12 May 2023 06:51:53 -0700 (PDT)
Received: from vp-pc.. (109-252-115-147.nat.spd-mgts.ru. [109.252.115.147])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a2e90c7000000b002ad994b0b51sm1744283ljg.16.2023.05.12.06.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:51:52 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [PATCH v3 3/3] virtio-net: pass Device-TLB enable/disable events to
 vhost
Date: Fri, 12 May 2023 16:51:22 +0300
Message-Id: <20230512135122.70403-4-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230512135122.70403-1-viktor@daynix.com>
References: <20230512135122.70403-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::233;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x233.google.com
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
 hw/net/virtio-net.c     |  7 +++++++
 include/net/vhost_net.h |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index c4eecc6f36..df5c312993 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -552,6 +552,17 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
     return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
 }
 
+void vhost_net_toggle_device_iotlb(struct vhost_dev *dev)
+{
+    const VhostOps *vhost_ops = dev->vhost_ops;
+
+    if (!vhost_ops->vhost_toggle_device_iotlb) {
+        return;
+    }
+
+    vhost_ops->vhost_toggle_device_iotlb(dev);
+}
+
 void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index)
 {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 447f669921..faba810db1 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3844,6 +3844,12 @@ static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
     return &net->dev;
 }
 
+static void virtio_net_toggle_device_iotlb(VirtIODevice *vdev)
+{
+    if (vdev->vhost_started)
+        vhost_net_toggle_device_iotlb(virtio_net_get_vhost(vdev));
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3949,6 +3955,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
     vdc->get_vhost = virtio_net_get_vhost;
+    vdc->toggle_device_iotlb = virtio_net_toggle_device_iotlb;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index c37aba35e6..28d93ea8c5 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -56,4 +56,6 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
                                 int vq_index);
 
 void vhost_net_save_acked_features(NetClientState *nc);
+
+void vhost_net_toggle_device_iotlb(struct vhost_dev *dev);
 #endif
-- 
2.35.1


