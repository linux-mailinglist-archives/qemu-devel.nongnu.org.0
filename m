Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE66B3B03
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:42:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZB3-0004JC-Bi; Fri, 10 Mar 2023 04:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZB1-00047h-0K
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAy-0008P9-W5
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8xSggReEU/nw1c3lruKlg4un0UjiQ6zg6cco5vYTHI=;
 b=Xmy731ykeGUWkONkbHtMJa3Evhh5aEv6Du7Em8AIwvlsiAvJh/OHu4QYi3Uenfx+94T76F
 jOdXFxqNkHRe/tiZ/p086TH76+OjxD0+Ga4VKU3z1iakyBh42VUiBYcDAj47biaQRFbxKs
 hRJ5hbq//FWz96uvdY6e2GjkePKnaGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-NPi0AYteO0GzbcFTCUQNAQ-1; Fri, 10 Mar 2023 04:36:33 -0500
X-MC-Unique: NPi0AYteO0GzbcFTCUQNAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170AF85CCE7;
 Fri, 10 Mar 2023 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E23640BC781;
 Fri, 10 Mar 2023 09:36:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 23/44] hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr
Date: Fri, 10 Mar 2023 17:35:05 +0800
Message-Id: <20230310093526.30828-24-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
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

When virtio-net header is not set, net_rx_pkt_get_vhdr() returns
zero-filled virtio_net_hdr, which is actually valid. In fact, tap device
uses zero-filled virtio_net_hdr when virtio-net header is not provided
by the peer. Therefore, we can just remove net_rx_pkt_has_virt_hdr() and
always assume NetTxPkt has a valid virtio-net header.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 16 ++++------------
 hw/net/net_rx_pkt.c  | 11 +----------
 hw/net/net_rx_pkt.h  | 12 +-----------
 hw/net/trace-events  |  1 -
 hw/net/virtio-net.c  |  2 +-
 hw/net/vmxnet3.c     | 12 ++----------
 6 files changed, 9 insertions(+), 45 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 954a007..95245c4 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1240,12 +1240,6 @@ e1000e_build_rx_metadata(E1000ECore *core,
         goto func_exit;
     }
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        trace_e1000e_rx_metadata_no_virthdr();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
-        goto func_exit;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
 
     if (!(vhdr->flags & VIRTIO_NET_HDR_F_DATA_VALID) &&
@@ -1671,12 +1665,10 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 static inline void
 e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
 {
-    if (net_rx_pkt_has_virt_hdr(pkt)) {
-        struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
+    struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
 
-        if (vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-            net_rx_pkt_fix_l4_csum(pkt);
-        }
+    if (vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+        net_rx_pkt_fix_l4_csum(pkt);
     }
 }
 
@@ -3379,7 +3371,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
         net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
     }
 
-    net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
+    net_rx_pkt_init(&core->rx_pkt);
 
     e1000x_core_prepare_eeprom(core->eeprom,
                                eeprom_templ,
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 1e1c504..b309c2f 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -30,7 +30,6 @@ struct NetRxPkt {
     uint32_t tot_len;
     uint16_t tci;
     size_t ehdr_buf_len;
-    bool has_virt_hdr;
     eth_pkt_types_e packet_type;
 
     /* Analysis results */
@@ -48,10 +47,9 @@ struct NetRxPkt {
     eth_l4_hdr_info  l4hdr_info;
 };
 
-void net_rx_pkt_init(struct NetRxPkt **pkt, bool has_virt_hdr)
+void net_rx_pkt_init(struct NetRxPkt **pkt)
 {
     struct NetRxPkt *p = g_malloc0(sizeof *p);
-    p->has_virt_hdr = has_virt_hdr;
     p->vec = NULL;
     p->vec_len_total = 0;
     *pkt = p;
@@ -472,13 +470,6 @@ bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt)
     return pkt->ehdr_buf_len ? true : false;
 }
 
-bool net_rx_pkt_has_virt_hdr(struct NetRxPkt *pkt)
-{
-    assert(pkt);
-
-    return pkt->has_virt_hdr;
-}
-
 uint16_t net_rx_pkt_get_vlan_tag(struct NetRxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 048e346..7277907 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -37,10 +37,9 @@ void net_rx_pkt_uninit(struct NetRxPkt *pkt);
  * Init function for rx packet functionality
  *
  * @pkt:            packet pointer
- * @has_virt_hdr:   device uses virtio header
  *
  */
-void net_rx_pkt_init(struct NetRxPkt **pkt, bool has_virt_hdr);
+void net_rx_pkt_init(struct NetRxPkt **pkt);
 
 /**
  * returns total length of data attached to rx context
@@ -215,15 +214,6 @@ uint16_t net_rx_pkt_get_vlan_tag(struct NetRxPkt *pkt);
 bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt);
 
 /**
- * notifies caller if the packet has virtio header
- *
- * @pkt:            packet
- * @ret:            true if packet has virtio header, false otherwize
- *
- */
-bool net_rx_pkt_has_virt_hdr(struct NetRxPkt *pkt);
-
-/**
 * attach scatter-gather data to rx packet
 *
 * @pkt:            packet
diff --git a/hw/net/trace-events b/hw/net/trace-events
index c98ad12..f7257a0 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -188,7 +188,6 @@ e1000e_rx_metadata_rss(uint32_t rss, uint32_t mrq) "RSS data: rss: 0x%X, mrq: 0x
 e1000e_rx_metadata_ip_id(uint16_t ip_id) "the IPv4 ID is 0x%X"
 e1000e_rx_metadata_ack(void) "the packet is TCP ACK"
 e1000e_rx_metadata_pkt_type(uint32_t pkt_type) "the packet type is %u"
-e1000e_rx_metadata_no_virthdr(void) "the packet has no virt-header"
 e1000e_rx_metadata_virthdr_no_csum_info(void) "virt-header does not contain checksum info"
 e1000e_rx_metadata_l3_cso_disabled(void) "IP4 CSO is disabled"
 e1000e_rx_metadata_l4_cso_disabled(void) "TCP/UDP CSO is disabled"
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 09d5c7a..dda7da2 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3718,7 +3718,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     QTAILQ_INIT(&n->rsc_chains);
     n->qdev = dev;
 
-    net_rx_pkt_init(&n->rx_pkt, false);
+    net_rx_pkt_init(&n->rx_pkt);
 
     if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
         virtio_net_load_ebpf(n);
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eab8fa4..6c6bb2a 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -851,10 +851,6 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
     uint8_t *data;
     int len;
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        return;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
     if (!VMXNET_FLAG_IS_SET(vhdr->flags, VIRTIO_NET_HDR_F_NEEDS_CSUM)) {
         return;
@@ -898,10 +894,6 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
         rxcd->tci = net_rx_pkt_get_vlan_tag(pkt);
     }
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        goto nocsum;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
     /*
      * Checksum is valid when lower level tell so or when lower level
@@ -1522,7 +1514,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
     /* Preallocate TX packet wrapper */
     VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
     net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
-    net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
+    net_rx_pkt_init(&s->rx_pkt);
 
     /* Read rings memory locations for RX queues */
     for (i = 0; i < s->rxq_num; i++) {
@@ -2402,7 +2394,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
     VMXNET3State *s = opaque;
 
     net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
-    net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
+    net_rx_pkt_init(&s->rx_pkt);
 
     if (s->msix_used) {
         vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS);
-- 
2.7.4


