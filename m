Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70336AD82E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:16:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRSh-00029y-Ns; Tue, 07 Mar 2023 02:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSf-00024E-HN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSc-0005aR-Bd
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0OAKe4TeNY4XcTbpzb3pedDH1GN6xQ+CArnb42Uvh8=;
 b=N9PuHNK1Rpy4wp0YsECQjw/pJJpm0VB0mfEWjy5SCwTW0C1E7fPqxpLZWGJsH7UVAIenZ0
 GIpF74HqVnypUyZjrs0cdgMgiItXOLW0RA5afBzR+iXNPfVESDQQhj+BUSKP01vFzI/HEj
 11W89UBiiu0xN82CvmrHL9SropxokrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-LWFfLnCaMnCENILY1NtZ-g-1; Tue, 07 Mar 2023 02:10:03 -0500
X-MC-Unique: LWFfLnCaMnCENILY1NtZ-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 099E33C10C61;
 Tue,  7 Mar 2023 07:10:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 028DD4014D1B;
 Tue,  7 Mar 2023 07:10:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 24/51] e1000e: Perform software segmentation for loopback
Date: Tue,  7 Mar 2023 15:07:49 +0800
Message-Id: <20230307070816.34833-25-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

e1000e didn't perform software segmentation for loopback if virtio-net
header is enabled, which is wrong.

To fix the problem, introduce net_tx_pkt_send_custom(), which allows the
caller to specify whether offloading should be assumed or not.

net_tx_pkt_send_custom() also allows the caller to provide a custom
sending function. Packets with virtio-net headers and ones without
virtio-net headers will be provided at the same time so the function
can choose the preferred version. In case of e1000e loopback, it prefers
to have virtio-net headers as they allows to skip the checksum
verification if VIRTIO_NET_HDR_F_DATA_VALID is set.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 27 +++++++++++++++++--
 hw/net/net_rx_pkt.c  |  7 +++++
 hw/net/net_rx_pkt.h  |  8 ++++++
 hw/net/net_tx_pkt.c  | 76 +++++++++++++++++++++++++---------------------------
 hw/net/net_tx_pkt.h  | 21 ++++++++-------
 5 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 95245c4..ff93547 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -61,6 +61,10 @@ union e1000_rx_desc_union {
     union e1000_rx_desc_packet_split packet_split;
 };
 
+static ssize_t
+e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
+                        bool has_vnet);
+
 static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
@@ -655,6 +659,15 @@ e1000e_setup_tx_offloads(E1000ECore *core, struct e1000e_tx *tx)
     return true;
 }
 
+static void e1000e_tx_pkt_callback(void *core,
+                                   const struct iovec *iov,
+                                   int iovcnt,
+                                   const struct iovec *virt_iov,
+                                   int virt_iovcnt)
+{
+    e1000e_receive_internal(core, virt_iov, virt_iovcnt, true);
+}
+
 static bool
 e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 {
@@ -669,7 +682,8 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 
     if ((core->phy[0][MII_BMCR] & MII_BMCR_LOOPBACK) ||
         ((core->mac[RCTL] & E1000_RCTL_LBM_MAC) == E1000_RCTL_LBM_MAC)) {
-        return net_tx_pkt_send_loopback(tx->tx_pkt, queue);
+        return net_tx_pkt_send_custom(tx->tx_pkt, false,
+                                      e1000e_tx_pkt_callback, core);
     } else {
         return net_tx_pkt_send(tx->tx_pkt, queue);
     }
@@ -1675,6 +1689,13 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
+    return e1000e_receive_internal(core, iov, iovcnt, core->has_vnet);
+}
+
+static ssize_t
+e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
+                        bool has_vnet)
+{
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint32_t n = 0;
@@ -1696,9 +1717,11 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     }
 
     /* Pull virtio header in */
-    if (core->has_vnet) {
+    if (has_vnet) {
         net_rx_pkt_set_vhdr_iovec(core->rx_pkt, iov, iovcnt);
         iov_ofs = sizeof(struct virtio_net_hdr);
+    } else {
+        net_rx_pkt_unset_vhdr(core->rx_pkt);
     }
 
     filter_buf = iov->iov_base + iov_ofs;
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index b309c2f..a53e756 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -463,6 +463,13 @@ void net_rx_pkt_set_vhdr_iovec(struct NetRxPkt *pkt,
     iov_to_buf(iov, iovcnt, 0, &pkt->virt_hdr, sizeof pkt->virt_hdr);
 }
 
+void net_rx_pkt_unset_vhdr(struct NetRxPkt *pkt)
+{
+    assert(pkt);
+
+    memset(&pkt->virt_hdr, 0, sizeof(pkt->virt_hdr));
+}
+
 bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 7277907..8b69ddb 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -313,6 +313,14 @@ void net_rx_pkt_set_vhdr_iovec(struct NetRxPkt *pkt,
     const struct iovec *iov, int iovcnt);
 
 /**
+ * unset vhdr data from packet context
+ *
+ * @pkt:            packet
+ *
+ */
+void net_rx_pkt_unset_vhdr(struct NetRxPkt *pkt);
+
+/**
  * save packet type in packet context
  *
  * @pkt:            packet
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index cf46c84..6afd3f6 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -53,8 +53,6 @@ struct NetTxPkt {
     uint16_t hdr_len;
     eth_pkt_types_e packet_type;
     uint8_t l4proto;
-
-    bool is_loopback;
 };
 
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
@@ -508,12 +506,6 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
     iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
 }
 
-enum {
-    NET_TX_PKT_FRAGMENT_L2_HDR_POS = 0,
-    NET_TX_PKT_FRAGMENT_L3_HDR_POS,
-    NET_TX_PKT_FRAGMENT_HEADER_NUM
-};
-
 #define NET_MAX_FRAG_SG_LIST (64)
 
 static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
@@ -522,7 +514,7 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     size_t fetched = 0;
     struct iovec *src = pkt->vec;
 
-    *dst_idx = NET_TX_PKT_FRAGMENT_HEADER_NUM;
+    *dst_idx = NET_TX_PKT_PL_START_FRAG;
 
     while (fetched < IP_FRAG_ALIGN_SIZE(pkt->virt_hdr.gso_size)) {
 
@@ -555,18 +547,22 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     return fetched;
 }
 
-static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
-    NetClientState *nc, const struct iovec *iov, int iov_cnt)
+static void net_tx_pkt_sendv(
+    void *opaque, const struct iovec *iov, int iov_cnt,
+    const struct iovec *virt_iov, int virt_iov_cnt)
 {
-    if (pkt->is_loopback) {
-        qemu_receive_packet_iov(nc, iov, iov_cnt);
+    NetClientState *nc = opaque;
+
+    if (qemu_get_using_vnet_hdr(nc->peer)) {
+        qemu_sendv_packet(nc, virt_iov, virt_iov_cnt);
     } else {
         qemu_sendv_packet(nc, iov, iov_cnt);
     }
 }
 
 static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
-    NetClientState *nc)
+                                           NetTxPktCallback callback,
+                                           void *context)
 {
     struct iovec fragment[NET_MAX_FRAG_SG_LIST];
     size_t fragment_len = 0;
@@ -578,6 +574,10 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
     int src_idx =  NET_TX_PKT_PL_START_FRAG, dst_idx;
     size_t src_offset = 0;
     size_t fragment_offset = 0;
+    struct virtio_net_hdr virt_hdr = {
+        .flags = pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM ?
+                 VIRTIO_NET_HDR_F_DATA_VALID : 0
+    };
 
     l2_iov_base = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base;
     l2_iov_len = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len;
@@ -585,10 +585,12 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
     l3_iov_len = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len;
 
     /* Copy headers */
-    fragment[NET_TX_PKT_FRAGMENT_L2_HDR_POS].iov_base = l2_iov_base;
-    fragment[NET_TX_PKT_FRAGMENT_L2_HDR_POS].iov_len = l2_iov_len;
-    fragment[NET_TX_PKT_FRAGMENT_L3_HDR_POS].iov_base = l3_iov_base;
-    fragment[NET_TX_PKT_FRAGMENT_L3_HDR_POS].iov_len = l3_iov_len;
+    fragment[NET_TX_PKT_VHDR_FRAG].iov_base = &virt_hdr;
+    fragment[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof(virt_hdr);
+    fragment[NET_TX_PKT_L2HDR_FRAG].iov_base = l2_iov_base;
+    fragment[NET_TX_PKT_L2HDR_FRAG].iov_len = l2_iov_len;
+    fragment[NET_TX_PKT_L3HDR_FRAG].iov_base = l3_iov_base;
+    fragment[NET_TX_PKT_L3HDR_FRAG].iov_len = l3_iov_len;
 
 
     /* Put as much data as possible and send */
@@ -603,7 +605,9 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
         eth_fix_ip4_checksum(l3_iov_base, l3_iov_len);
 
-        net_tx_pkt_sendv(pkt, nc, fragment, dst_idx);
+        callback(context,
+                 fragment + NET_TX_PKT_L2HDR_FRAG, dst_idx - NET_TX_PKT_L2HDR_FRAG,
+                 fragment + NET_TX_PKT_VHDR_FRAG, dst_idx - NET_TX_PKT_VHDR_FRAG);
 
         fragment_offset += fragment_len;
 
@@ -614,12 +618,16 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
 {
-    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
+    bool offload = qemu_get_using_vnet_hdr(nc->peer);
+    return net_tx_pkt_send_custom(pkt, offload, net_tx_pkt_sendv, nc);
+}
 
+bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
+                            NetTxPktCallback callback, void *context)
+{
     assert(pkt);
 
-    if (!using_vnet_hdr &&
-        pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+    if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
         net_tx_pkt_do_sw_csum(pkt);
     }
 
@@ -635,28 +643,16 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
         }
     }
 
-    if (using_vnet_hdr ||
-        pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
-        int index = using_vnet_hdr ?
-                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
+    if (offload || pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
+        callback(context, pkt->vec + NET_TX_PKT_L2HDR_FRAG,
+                 pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - NET_TX_PKT_L2HDR_FRAG,
+                 pkt->vec + NET_TX_PKT_VHDR_FRAG,
+                 pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - NET_TX_PKT_VHDR_FRAG);
         return true;
     }
 
-    return net_tx_pkt_do_sw_fragmentation(pkt, nc);
-}
-
-bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc)
-{
-    bool res;
-
-    pkt->is_loopback = true;
-    res = net_tx_pkt_send(pkt, nc);
-    pkt->is_loopback = false;
-
-    return res;
+    return net_tx_pkt_do_sw_fragmentation(pkt, callback, context);
 }
 
 void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 8d3faa4..f57b4e0 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -26,6 +26,8 @@
 
 struct NetTxPkt;
 
+typedef void (* NetTxPktCallback)(void *, const struct iovec *, int, const struct iovec *, int);
+
 /**
  * Init function for tx packet functionality
  *
@@ -161,15 +163,16 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt);
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc);
 
 /**
-* Redirect packet directly to receive path (emulate loopback phy).
-* Handles sw offloads if vhdr is not supported.
-*
-* @pkt:            packet
-* @nc:             NetClientState
-* @ret:            operation result
-*
-*/
-bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc);
+ * Send packet with a custom function.
+ *
+ * @pkt:            packet
+ * @offload:        whether the callback implements offloading
+ * @callback:       a function to be called back for each transformed packet
+ * @context:        a pointer to be passed to the callback.
+ * @ret:            operation result
+ */
+bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
+                            NetTxPktCallback callback, void *context);
 
 /**
  * parse raw packet data and analyze offload requirements.
-- 
2.7.4


