Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8048764F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:15:44 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nDj-0002Ae-Lq
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n26-00071s-JR
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n24-0001nH-So
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u6l62xg/lkH7hFw614JZRm2EiTHVevsZtQYv0uk5SXM=;
 b=iu7NvsrbNxu684ZOaI0soXicc1sL84+IjLPlu2DwgbkdZntwcvccNQ12U44N9vt2aQGfbk
 byvfvsWi/FxOZtXJ4bt1DfnWn4wZ6Iymtc2CJMFHtuij5+ECAKgnZ4qZxobb+703I3z80M
 U3iIhuwkQc63XUgYNY0b/w70xl/8ALo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-m0MnKWlEMzS4VXakiy780w-1; Fri, 07 Jan 2022 06:03:39 -0500
X-MC-Unique: m0MnKWlEMzS4VXakiy780w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so4498679wma.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u6l62xg/lkH7hFw614JZRm2EiTHVevsZtQYv0uk5SXM=;
 b=OCItcmhOdf6ZDW5dJGLcP08r6tnCEjrOgrGzpRVvFKNK0ERWh+pXuNjPAjqv3n5dIS
 LSHJ93K4PWEPtSlhmbbTUCui/nklZQjSr3pTosD9RdPcNZAZpgDL7nK9a44g7Yi9Hoja
 rsRpYQ3q0hAN3Y9Sf2WnfgC+I4ugz9GnfJFhhRao87sxKh5HkjI8UsvW1nhZ2QDsRb3+
 3oSymxArGMzKCXix+Tb0GdWQ3PvA5leEBqXHS8DRLtjs863bkSlHJ1P52coTt50qKmM4
 mX2sTx4rYLbl5B7h4+Q4dAmdpy/xOLa4+dMalULy2QmvKnvp9KUwvVCFIlaegiLtTYaD
 BvGA==
X-Gm-Message-State: AOAM533VHyNmhntETHuQZ89eOd6uCPwAG6iQVxLAchyog+oBmxugnFxE
 rxlEaHrIDplUedc8O8lfZ/BBCRR93CuKj4F6A/8OMOO/wYLnxem0QRcoAN1XwK9T9ABv/IQeFTB
 ZAi7iyoNhLPjXrsxjPIIJAQzuFaXscjzqMs3ue9gPMLkG43qSvAuoEQzs/455
X-Received: by 2002:adf:c606:: with SMTP id n6mr43439627wrg.481.1641553417889; 
 Fri, 07 Jan 2022 03:03:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCgDpHxGOcJNsK6PbZCp8W9Bjx8Buyjfpe9QEfqbzliR2BIfuvxB77pAR+C3exn27u3fQhPA==
X-Received: by 2002:adf:c606:: with SMTP id n6mr43439605wrg.481.1641553417664; 
 Fri, 07 Jan 2022 03:03:37 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id q3sm4553652wrr.55.2022.01.07.03.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:37 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/55] virtio-net: add support for configure interrupt
Message-ID: <20220107102526.39238-11-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


