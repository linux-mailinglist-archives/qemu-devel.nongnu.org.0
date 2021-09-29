Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D20841BF60
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 08:56:25 +0200 (CEST)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVTVv-00017y-Jp
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVTTp-0000Da-Lw
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVTTn-0001pX-0t
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632898448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mRs0h3K75LHlnMsYGZnPLZD0GxucgE3t++euv9p5r1I=;
 b=N5TZccPJjQnCzmNxh2L3L9koVqL+CQd4b9gZwPFaQxPVAB3y6VfQkde1j2yfbufJLE+fYP
 zoBJf5TxaKhgsYcU4Czc4jMnB6ljHGKg7h8EXN2NjqdG8Gg/MDPik1S8X2gbqVY0St8DPc
 A8KUbAuE6vO9qg2qYWbj6PwgrAMwHww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-B1Y20Lp9MMyf16oAjrzN9Q-1; Wed, 29 Sep 2021 02:52:40 -0400
X-MC-Unique: B1Y20Lp9MMyf16oAjrzN9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA109835DE0;
 Wed, 29 Sep 2021 06:52:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-131.pek2.redhat.com [10.72.13.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C070100EBBE;
 Wed, 29 Sep 2021 06:52:28 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
Date: Wed, 29 Sep 2021 14:52:15 +0800
Message-Id: <20210929065215.21549-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For vdpa device, if the host support VIRTIO_NET_F_MAC
we need to read the mac address from hardware, so need
to check this bit, the logic is
1 if the host support VIRTIO_NET_F_MAC and the mac address
   is correct, qemu will use the mac address in hardware
2.if the host not support , qemu will use the mac from cmdline
3.if the cmdline not provide mac address, qemu will use radam mac
address

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/net/virtio-net.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 55aac06a0a..085daa28b0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -127,9 +127,9 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     struct virtio_net_config netcfg;
     NetClientState *nc = qemu_get_queue(n->nic);
     static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
-
     int ret = 0;
-    memset(&netcfg, 0 , sizeof(struct virtio_net_config));
+
+    memset(&netcfg, 0, sizeof(struct virtio_net_config));
     virtio_stw_p(vdev, &netcfg.status, n->status);
     virtio_stw_p(vdev, &netcfg.max_virtqueue_pairs, n->max_queues);
     virtio_stw_p(vdev, &netcfg.mtu, n->net_conf.mtu);
@@ -159,12 +159,21 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
              * address has been configured correctly elsewhere - just not
              * reported by the device.
              */
+
             if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
                 info_report("Zero hardware mac address detected. Ignoring.");
                 memcpy(netcfg.mac, n->mac, ETH_ALEN);
             }
-            memcpy(config, &netcfg, n->config_size);
+            /*
+             * If the host support VIRTIO_NET_F_MAC, That means hardware
+             * will provide the mac address, otherwise we don't need to use it.
+             * use  the mac address from qemu cfg
+             */
+            if (!(virtio_host_has_feature(vdev, VIRTIO_NET_F_MAC))) {
+                memcpy(netcfg.mac, n->mac, ETH_ALEN);
+            }
         }
+        memcpy(config, &netcfg, n->config_size);
     }
 }
 
@@ -3453,11 +3462,22 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     nc = qemu_get_queue(n->nic);
     nc->rxfilter_notify_enabled = 1;
 
-   if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+
         struct virtio_net_config netcfg = {};
-        memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
-        vhost_net_set_config(get_vhost_net(nc->peer),
-            (uint8_t *)&netcfg, 0, ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
+        /*
+         * get the real mac address from hardware or qemu cmline
+         *
+         * If the host support VIRTIO_NET_F_MAC, That means hardware
+         * will provide the mac address, otherwise we don't need to use it.
+         * use  the mac address from qemu cfg
+         */
+        virtio_net_get_config(vdev, (uint8_t *)&netcfg);
+        /*
+         * for vdpa device qemu need to set the real mac back to hardware
+         */
+        vhost_net_set_config(get_vhost_net(nc->peer),  (uint8_t *)&netcfg, 0,
+                             ETH_ALEN, VHOST_SET_CONFIG_TYPE_MASTER);
     }
     QTAILQ_INIT(&n->rsc_chains);
     n->qdev = dev;
-- 
2.21.3


