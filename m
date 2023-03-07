Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00D6AD82C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:16:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRSa-0001Tt-Sa; Tue, 07 Mar 2023 02:10:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSW-0001KL-NH
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSU-0005W6-HU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yM3RxT0E7lDFrCLQIi5xe3px6OKQVc8Vmap7ZPsccUE=;
 b=Xxthv3JmZCeGK03gY9EkMLECuwVqgU1/j/biWgDx8L2KIPfGNVmz1Z7bosEsAepvEsoC5Z
 1SgnxjiLnZaSBMkiogY2ILhLQwUHn7WU27LOzsVjWh6Sz/vYQozPWeuRQvVvI8+pRorNIl
 vapOdJhNSjgISJVA6b0nZOD2ojoo5eY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-WCYYff1VOdi3Tn7ec7LFkw-1; Tue, 07 Mar 2023 02:09:57 -0500
X-MC-Unique: WCYYff1VOdi3Tn7ec7LFkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AD0C86F127;
 Tue,  7 Mar 2023 07:09:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 469FD40C10FA;
 Tue,  7 Mar 2023 07:09:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 22/51] hw/net/net_tx_pkt: Automatically determine if virtio-net
 header is used
Date: Tue,  7 Mar 2023 15:07:47 +0800
Message-Id: <20230307070816.34833-23-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The new function qemu_get_using_vnet_hdr() allows to automatically
determine if virtio-net header is used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c |  3 +--
 hw/net/net_tx_pkt.c  | 19 ++++++++++---------
 hw/net/net_tx_pkt.h  |  3 +--
 hw/net/vmxnet3.c     |  6 ++----
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 38d374f..954a007 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3376,8 +3376,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
         qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
 
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
-        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
-                        E1000E_MAX_TX_FRAGS, core->has_vnet);
+        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
     }
 
     net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 8a23899..cf46c84 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -35,7 +35,6 @@ struct NetTxPkt {
     PCIDevice *pci_dev;
 
     struct virtio_net_hdr virt_hdr;
-    bool has_virt_hdr;
 
     struct iovec *raw;
     uint32_t raw_frags;
@@ -59,7 +58,7 @@ struct NetTxPkt {
 };
 
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
-    uint32_t max_frags, bool has_virt_hdr)
+    uint32_t max_frags)
 {
     struct NetTxPkt *p = g_malloc0(sizeof *p);
 
@@ -71,10 +70,8 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
 
     p->max_payload_frags = max_frags;
     p->max_raw_frags = max_frags;
-    p->has_virt_hdr = has_virt_hdr;
     p->vec[NET_TX_PKT_VHDR_FRAG].iov_base = &p->virt_hdr;
-    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len =
-        p->has_virt_hdr ? sizeof p->virt_hdr : 0;
+    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof p->virt_hdr;
     p->vec[NET_TX_PKT_L2HDR_FRAG].iov_base = &p->l2_hdr;
     p->vec[NET_TX_PKT_L3HDR_FRAG].iov_base = &p->l3_hdr;
 
@@ -617,9 +614,11 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
 {
+    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
+
     assert(pkt);
 
-    if (!pkt->has_virt_hdr &&
+    if (!using_vnet_hdr &&
         pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
         net_tx_pkt_do_sw_csum(pkt);
     }
@@ -636,11 +635,13 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
         }
     }
 
-    if (pkt->has_virt_hdr ||
+    if (using_vnet_hdr ||
         pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+        int index = using_vnet_hdr ?
+                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
+        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
+            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
         return true;
     }
 
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 2e38a5f..8d3faa4 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -32,10 +32,9 @@ struct NetTxPkt;
  * @pkt:            packet pointer
  * @pci_dev:        PCI device processing this packet
  * @max_frags:      max tx ip fragments
- * @has_virt_hdr:   device uses virtio header.
  */
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
-    uint32_t max_frags, bool has_virt_hdr);
+    uint32_t max_frags);
 
 /**
  * Clean all tx packet resources.
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index d7d492a..eab8fa4 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1521,8 +1521,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
 
     /* Preallocate TX packet wrapper */
     VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
-    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
-                    s->max_tx_frags, s->peer_has_vhdr);
+    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
     net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
 
     /* Read rings memory locations for RX queues */
@@ -2402,8 +2401,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
 {
     VMXNET3State *s = opaque;
 
-    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
-                    s->max_tx_frags, s->peer_has_vhdr);
+    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
     net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
 
     if (s->msix_used) {
-- 
2.7.4


