Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D848805F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:18:34 +0100 (CET)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60NN-00015Z-Ax
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609S-0003bX-IJ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609Q-0002LK-Tl
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u6l62xg/lkH7hFw614JZRm2EiTHVevsZtQYv0uk5SXM=;
 b=hqmDTuLy/rLFN/MNWOAqcAsaVxAprGkcr4HUoxFU7yT0N5TcyE5aA46fxp/ZxfuYWMMdCz
 wG1fiG+eFWyZXwFAGf21EsrXRLSxx8eY+BloV38fc5235zoacw6Od4BLqVMNtrzPefhxes
 6XDR0WgK8lfMGRODru1iRtL+uKkpsk0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-5FtCmIokOc-7fG35HNmXFA-1; Fri, 07 Jan 2022 20:04:07 -0500
X-MC-Unique: 5FtCmIokOc-7fG35HNmXFA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so5630582wma.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u6l62xg/lkH7hFw614JZRm2EiTHVevsZtQYv0uk5SXM=;
 b=VeP1aNbumT2cIUT5NTV5RV2rLGEty0bbMP19n2LBgLwMnh7xDy7TB/zx491ka6feLF
 NNOn4hf6qQx1IcNIZ8rLtzGraZsPNXtOtZKWCc2N4c6Zz44ZxWsPtHt7Jir08GEJvyLg
 Eik1a88Ikp1yJXmNqS4WFGPPQ079ag2GEVTc7gz2Ju6qQ9DA3Wbv3+WM/W3pHUvZ50Xk
 ChjQQHH794F+csFey3kQR3ILidrDUJjpaFDhJha7ixZNL9Eha4X+JdmdIAkxSI38aMZn
 HyMQF8YV0ePFG8VNjEkvGQopBEQzs2+RXC9RyIQtfM+UanhL3Z0vQCNvkMudS29GBhRM
 fLAw==
X-Gm-Message-State: AOAM532Oqs5VUnEiOQrBlm8XV4Ao/J+ifrqV0S3BQbHhlAegarKCj19G
 6P75MOttwE01AHJ01MNTXAI/xAQNAHl+4k71nkrg6raZX6VkVQP+Wr2CYHZp3KCFXe77JbvqLli
 lnAyJa7S6B2EB600QIDmBBASj92oDUQUqe357Ht21ATWn0RB8/N/VMJudH//H
X-Received: by 2002:adf:fc50:: with SMTP id e16mr11914292wrs.554.1641603845978; 
 Fri, 07 Jan 2022 17:04:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBpvalNa7/qOU+NZMYS9mjTQkxGEhtcTLKHw4nhUW5qsmGwtTzsJodRhuGjFvvN6w70mWyEg==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr11914281wrs.554.1641603845809; 
 Fri, 07 Jan 2022 17:04:05 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o3sm216306wry.98.2022.01.07.17.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:05 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 10/55] virtio-net: add support for configure interrupt
Message-ID: <20220108003423.15830-11-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Add functions to support configure interrupt in virtio_net
The functions are config_pending and config_mask, while
this input idx is VIRTIO_CONFIG_IRQ_IDX will check the
function of configure interrupt.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-9-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 2 ++
 hw/net/vhost_net-stub.c | 9 +++++++++
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 4 ++--
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..fc37498550 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 89d71cfb8e..126ee35b70 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -101,3 +101,12 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 {
     return 0;
 }
+
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return false;
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..9c9fd0a73f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -457,6 +457,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return vhost_config_pending(&net->dev);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5e03c0dd14..5806a50c8d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3169,7 +3169,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
+        return vhost_net_config_pending(get_vhost_net(nc->peer));
     }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
@@ -3181,9 +3181,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
         return;
     }
-
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
-- 
MST


