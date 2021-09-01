Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843243FDE06
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:51:24 +0200 (CEST)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRaF-0002PD-LM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLMEF-0003bJ-Ok
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:35412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME6-0005OS-1I
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=LSZ2mWxs6D+YSxZ59e5bSlrlDZ4hklNR2402ethUa10=; b=MOxGKQLMhWEN
 vPujW2DpaNQala/TtADUYZBaxd3WQIWy1Y4Ge54mLIL1jD/bHfv1JM0yHlzsjdDA4INZzjjgaMPDh
 h/u4WXokLHg8YJE21kzP0Y4t1/5aE7IKwSNf434u5giWPUT72ZvGswn+p5vu/x9iYbDsz9ecUAp9F
 rpTaA=;
Received: from [192.168.15.100] (helo=max-Swift-SF314-57.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <maxim.davydov@virtuozzo.com>)
 id 1mLME0-000RwD-RB; Wed, 01 Sep 2021 12:08:04 +0300
From: Maxim Davydov <maxim.davydov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@openvz.org, mst@redhat.com, stefanha@redhat.com, fam@euphon.net,
 amit@kernel.org, kraxel@redhat.com, berrange@redhat.com,
 Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: [PATCH v1 5/8] virtio-net: Add tracking of the virtio guest feature
 bits
Date: Wed,  1 Sep 2021 12:08:01 +0300
Message-Id: <20210901090804.7139-6-maxim.davydov@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=maxim.davydov@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracking of the bits acknowledged by the guest

Signed-off-by: Maxim Davydov <maxim.davydov@virtuozzo.com>
---
 hw/net/virtio-net.c | 118 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 46 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cd..2fd9171 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3562,52 +3562,78 @@ static const VMStateDescription vmstate_virtio_net = {
 };
 
 static Property virtio_net_properties[] = {
-    DEFINE_PROP_BIT64("csum", VirtIONet, host_features,
-                    VIRTIO_NET_F_CSUM, true),
-    DEFINE_PROP_BIT64("guest_csum", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_CSUM, true),
-    DEFINE_PROP_BIT64("gso", VirtIONet, host_features, VIRTIO_NET_F_GSO, true),
-    DEFINE_PROP_BIT64("guest_tso4", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_TSO4, true),
-    DEFINE_PROP_BIT64("guest_tso6", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_TSO6, true),
-    DEFINE_PROP_BIT64("guest_ecn", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_ECN, true),
-    DEFINE_PROP_BIT64("guest_ufo", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_UFO, true),
-    DEFINE_PROP_BIT64("guest_announce", VirtIONet, host_features,
-                    VIRTIO_NET_F_GUEST_ANNOUNCE, true),
-    DEFINE_PROP_BIT64("host_tso4", VirtIONet, host_features,
-                    VIRTIO_NET_F_HOST_TSO4, true),
-    DEFINE_PROP_BIT64("host_tso6", VirtIONet, host_features,
-                    VIRTIO_NET_F_HOST_TSO6, true),
-    DEFINE_PROP_BIT64("host_ecn", VirtIONet, host_features,
-                    VIRTIO_NET_F_HOST_ECN, true),
-    DEFINE_PROP_BIT64("host_ufo", VirtIONet, host_features,
-                    VIRTIO_NET_F_HOST_UFO, true),
-    DEFINE_PROP_BIT64("mrg_rxbuf", VirtIONet, host_features,
-                    VIRTIO_NET_F_MRG_RXBUF, true),
-    DEFINE_PROP_BIT64("status", VirtIONet, host_features,
-                    VIRTIO_NET_F_STATUS, true),
-    DEFINE_PROP_BIT64("ctrl_vq", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_VQ, true),
-    DEFINE_PROP_BIT64("ctrl_rx", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_RX, true),
-    DEFINE_PROP_BIT64("ctrl_vlan", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_VLAN, true),
-    DEFINE_PROP_BIT64("ctrl_rx_extra", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_RX_EXTRA, true),
-    DEFINE_PROP_BIT64("ctrl_mac_addr", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_MAC_ADDR, true),
-    DEFINE_PROP_BIT64("ctrl_guest_offloads", VirtIONet, host_features,
-                    VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, true),
-    DEFINE_PROP_BIT64("mq", VirtIONet, host_features, VIRTIO_NET_F_MQ, false),
-    DEFINE_PROP_BIT64("rss", VirtIONet, host_features,
-                    VIRTIO_NET_F_RSS, false),
-    DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
-                    VIRTIO_NET_F_HASH_REPORT, false),
-    DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
-                    VIRTIO_NET_F_RSC_EXT, false),
+    DEFINE_VIRTIO_FEATURE_BIT64("csum", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CSUM, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_csum", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_CSUM, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("gso", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GSO, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_tso4", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_TSO4, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_tso6", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_TSO6, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_ecn", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_ECN, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_ufo", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_UFO, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_announce", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_GUEST_ANNOUNCE, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("host_tso4", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_HOST_TSO4, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("host_tso6", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_HOST_TSO6, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("host_ecn", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_HOST_ECN, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("host_ufo", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_HOST_UFO, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("mrg_rxbuf", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_MRG_RXBUF, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("status", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_STATUS, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_vq", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_VQ, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_rx", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_RX, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_vlan", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_VLAN, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_rx_extra", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_RX_EXTRA, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_mac_addr", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_MAC_ADDR, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("ctrl_guest_offloads", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, true),
+    DEFINE_VIRTIO_FEATURE_BIT64("mq", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_MQ, false),
+    DEFINE_VIRTIO_FEATURE_BIT64("rss", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_RSS, false),
+    DEFINE_VIRTIO_FEATURE_BIT64("hash", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_HASH_REPORT, false),
+    DEFINE_VIRTIO_FEATURE_BIT64("guest_rsc_ext", VirtIONet, host_features,
+                                parent_obj.guest_features,
+                                VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
                        VIRTIO_NET_RSC_DEFAULT_INTERVAL),
     DEFINE_NIC_PROPERTIES(VirtIONet, nic_conf),
-- 
1.8.3.1


