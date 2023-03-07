Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7095B6AD828
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRTj-0005Ff-W1; Tue, 07 Mar 2023 02:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRT9-0003ax-OS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRT7-0005oi-2C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mh33sAB47n2uNIfA3uj21TMko5WPNwiKV/NBIZOWzP4=;
 b=LZBlegt16WVdx9E7ae/rKOnsEwF/RPzlwgNpLI5RYCv2RoUbRus4eiRvbisxxJsNroa24J
 1YyDfXcuA/9NxEFjEy/zMhUjuYrkhLOIkYDPrhRrvpaMqFTn6BjcDbWeS/8jWKBa2uDu8v
 Ribnfh1PwgXV+ZwxsPbQzPWHqPq+B+4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-LaAQEOgmOpao1iay7-pV6w-1; Tue, 07 Mar 2023 02:10:34 -0500
X-MC-Unique: LaAQEOgmOpao1iay7-pV6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE9ED2808E66;
 Tue,  7 Mar 2023 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F35CA400F8FA;
 Tue,  7 Mar 2023 07:10:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 35/51] net/eth: Introduce EthL4HdrProto
Date: Tue,  7 Mar 2023 15:08:00 +0800
Message-Id: <20230307070816.34833-36-jasowang@redhat.com>
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

igb, a new network device emulation, will need SCTP checksum offloading.
Currently eth_get_protocols() has a bool parameter for each protocol
currently it supports, but there will be a bit too many parameters if
we add yet another protocol.

Introduce an enum type, EthL4HdrProto to represent all L4 protocols
eth_get_protocols() support with one parameter.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 60 ++++++++++++++++++++++++++-------------------
 hw/net/net_rx_pkt.c  | 48 ++++++++++++++++++------------------
 hw/net/net_rx_pkt.h  |  5 ++--
 hw/net/trace-events  |  8 +++---
 hw/net/virtio-net.c  | 69 ++++++++++++++++++++++++++++++++++------------------
 hw/net/vmxnet3.c     | 22 +++++++++++------
 include/net/eth.h    |  8 +++++-
 net/eth.c            | 26 +++++++++++---------
 8 files changed, 147 insertions(+), 99 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index e8d466b..c6111c2 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -497,18 +497,20 @@ typedef struct E1000E_RSSInfo_st {
 static uint32_t
 e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
 {
-    bool hasip4, hasip6, hasudp, hastcp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
 
     assert(e1000e_rss_enabled(core));
 
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
 
     if (hasip4) {
-        trace_e1000e_rx_rss_ip4(hastcp, core->mac[MRQC],
+        trace_e1000e_rx_rss_ip4(l4hdr_proto, core->mac[MRQC],
                                 E1000_MRQC_EN_TCPIPV4(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV4(core->mac[MRQC]));
 
-        if (hastcp && E1000_MRQC_EN_TCPIPV4(core->mac[MRQC])) {
+        if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
+            E1000_MRQC_EN_TCPIPV4(core->mac[MRQC])) {
             return E1000_MRQ_RSS_TYPE_IPV4TCP;
         }
 
@@ -529,7 +531,7 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
          * backends like these.
          */
         trace_e1000e_rx_rss_ip6_rfctl(core->mac[RFCTL]);
-        trace_e1000e_rx_rss_ip6(ex_dis, new_ex_dis, hastcp,
+        trace_e1000e_rx_rss_ip6(ex_dis, new_ex_dis, l4hdr_proto,
                                 ip6info->has_ext_hdrs,
                                 ip6info->rss_ex_dst_valid,
                                 ip6info->rss_ex_src_valid,
@@ -542,7 +544,8 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
             (!new_ex_dis || !(ip6info->rss_ex_dst_valid ||
                               ip6info->rss_ex_src_valid))) {
 
-            if (hastcp && E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
+            if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP &&
+                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
                 return E1000_MRQ_RSS_TYPE_IPV6TCP;
             }
 
@@ -1124,7 +1127,7 @@ static void
 e1000e_verify_csum_in_sw(E1000ECore *core,
                          struct NetRxPkt *pkt,
                          uint32_t *status_flags,
-                         bool hastcp, bool hasudp)
+                         EthL4HdrProto l4hdr_proto)
 {
     bool csum_valid;
     uint32_t csum_error;
@@ -1151,14 +1154,10 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
     }
 
     csum_error = csum_valid ? 0 : E1000_RXDEXT_STATERR_TCPE;
+    *status_flags |= E1000_RXD_STAT_TCPCS | csum_error;
 
-    if (hastcp) {
-        *status_flags |= E1000_RXD_STAT_TCPCS |
-                         csum_error;
-    } else if (hasudp) {
-        *status_flags |= E1000_RXD_STAT_TCPCS |
-                         E1000_RXD_STAT_UDPCS |
-                         csum_error;
+    if (l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
+        *status_flags |= E1000_RXD_STAT_UDPCS;
     }
 }
 
@@ -1187,7 +1186,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
                          uint16_t *vlan_tag)
 {
     struct virtio_net_hdr *vhdr;
-    bool hasip4, hasip6, hastcp, hasudp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
     uint32_t pkt_type;
 
     *status_flags = E1000_RXD_STAT_DD;
@@ -1199,8 +1199,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
 
     *status_flags |= E1000_RXD_STAT_EOP;
 
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
-    trace_e1000e_rx_metadata_protocols(hasip4, hasip6, hasudp, hastcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+    trace_e1000e_rx_metadata_protocols(hasip4, hasip6, l4hdr_proto);
 
     /* VLAN state */
     if (net_rx_pkt_is_vlan_stripped(pkt)) {
@@ -1222,7 +1222,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (hastcp && e1000e_is_tcp_ack(core, pkt)) {
+    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP && e1000e_is_tcp_ack(core, pkt)) {
         *status_flags |= E1000_RXD_STAT_ACK;
         trace_e1000e_rx_metadata_ack();
     }
@@ -1230,7 +1230,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
     if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
         trace_e1000e_rx_metadata_ipv6_filtering_disabled();
         pkt_type = E1000_RXD_PKT_MAC;
-    } else if (hastcp || hasudp) {
+    } else if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP ||
+               l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
         pkt_type = hasip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
     } else if (hasip4 || hasip6) {
         pkt_type = hasip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
@@ -1252,7 +1253,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
     if (!(vhdr->flags & VIRTIO_NET_HDR_F_DATA_VALID) &&
         !(vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM)) {
         trace_e1000e_rx_metadata_virthdr_no_csum_info();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, hastcp, hasudp);
+        e1000e_verify_csum_in_sw(core, pkt, status_flags, l4hdr_proto);
         goto func_exit;
     }
 
@@ -1263,10 +1264,17 @@ e1000e_build_rx_metadata(E1000ECore *core,
     }
 
     if (e1000e_rx_l4_cso_enabled(core)) {
-        if (hastcp) {
+        switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_TCP:
             *status_flags |= E1000_RXD_STAT_TCPCS;
-        } else if (hasudp) {
+            break;
+
+        case ETH_L4_HDR_PROTO_UDP:
             *status_flags |= E1000_RXD_STAT_TCPCS | E1000_RXD_STAT_UDPCS;
+            break;
+
+        default:
+            break;
         }
     } else {
         trace_e1000e_rx_metadata_l4_cso_disabled();
@@ -1509,14 +1517,15 @@ e1000e_rx_descr_threshold_hit(E1000ECore *core, const E1000E_RingInfo *rxi)
 static bool
 e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
 {
-    bool hasip4, hasip6, hasudp, hastcp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
     bool fragment;
 
     if (!e1000e_rx_use_ps_descriptor(core)) {
         return false;
     }
 
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
 
     if (hasip4) {
         fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
@@ -1530,7 +1539,8 @@ e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
         return false;
     }
 
-    if (hasudp || hastcp) {
+    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP ||
+        l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
         *hdr_len = net_rx_pkt_get_l5_hdr_offset(pkt);
     } else {
         *hdr_len = net_rx_pkt_get_l4_hdr_offset(pkt);
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 0bbe662..39cdea0 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -35,8 +35,6 @@ struct NetRxPkt {
     /* Analysis results */
     bool hasip4;
     bool hasip6;
-    bool hasudp;
-    bool hastcp;
 
     size_t l3hdr_off;
     size_t l4hdr_off;
@@ -106,11 +104,10 @@ net_rx_pkt_pull_data(struct NetRxPkt *pkt,
     }
 
     eth_get_protocols(pkt->vec, pkt->vec_len, &pkt->hasip4, &pkt->hasip6,
-                      &pkt->hasudp, &pkt->hastcp,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 
-    trace_net_rx_pkt_parsed(pkt->hasip4, pkt->hasip6, pkt->hasudp, pkt->hastcp,
+    trace_net_rx_pkt_parsed(pkt->hasip4, pkt->hasip6, pkt->l4hdr_info.proto,
                             pkt->l3hdr_off, pkt->l4hdr_off, pkt->l5hdr_off);
 }
 
@@ -200,21 +197,19 @@ void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
     assert(pkt);
 
     eth_get_protocols(&iov, 1, &pkt->hasip4, &pkt->hasip6,
-                      &pkt->hasudp, &pkt->hastcp,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 }
 
 void net_rx_pkt_get_protocols(struct NetRxPkt *pkt,
                               bool *hasip4, bool *hasip6,
-                              bool *hasudp, bool *hastcp)
+                              EthL4HdrProto *l4hdr_proto)
 {
     assert(pkt);
 
     *hasip4 = pkt->hasip4;
     *hasip6 = pkt->hasip6;
-    *hasudp = pkt->hasudp;
-    *hastcp = pkt->hastcp;
+    *l4hdr_proto = pkt->l4hdr_info.proto;
 }
 
 size_t net_rx_pkt_get_l3_hdr_offset(struct NetRxPkt *pkt)
@@ -337,14 +332,14 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         break;
     case NetPktRssIpV4Tcp:
         assert(pkt->hasip4);
-        assert(pkt->hastcp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_TCP);
         trace_net_rx_pkt_rss_ip4_tcp();
         _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6Tcp:
         assert(pkt->hasip6);
-        assert(pkt->hastcp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_TCP);
         trace_net_rx_pkt_rss_ip6_tcp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
@@ -361,28 +356,28 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         break;
     case NetPktRssIpV6TcpEx:
         assert(pkt->hasip6);
-        assert(pkt->hastcp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_TCP);
         trace_net_rx_pkt_rss_ip6_ex_tcp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV4Udp:
         assert(pkt->hasip4);
-        assert(pkt->hasudp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP);
         trace_net_rx_pkt_rss_ip4_udp();
         _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6Udp:
         assert(pkt->hasip6);
-        assert(pkt->hasudp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP);
         trace_net_rx_pkt_rss_ip6_udp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6UdpEx:
         assert(pkt->hasip6);
-        assert(pkt->hasudp);
+        assert(pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP);
         trace_net_rx_pkt_rss_ip6_ex_udp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
@@ -415,7 +410,7 @@ bool net_rx_pkt_is_tcp_ack(struct NetRxPkt *pkt)
 {
     assert(pkt);
 
-    if (pkt->hastcp) {
+    if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_TCP) {
         return TCP_HEADER_FLAGS(&pkt->l4hdr_info.hdr.tcp) & TCP_FLAG_ACK;
     }
 
@@ -426,7 +421,7 @@ bool net_rx_pkt_has_tcp_data(struct NetRxPkt *pkt)
 {
     assert(pkt);
 
-    if (pkt->hastcp) {
+    if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_TCP) {
         return pkt->l4hdr_info.has_tcp_data;
     }
 
@@ -524,7 +519,7 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
     trace_net_rx_pkt_l4_csum_calc_entry();
 
     if (pkt->hasip4) {
-        if (pkt->hasudp) {
+        if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP) {
             csl = be16_to_cpu(pkt->l4hdr_info.hdr.udp.uh_ulen);
             trace_net_rx_pkt_l4_csum_calc_ip4_udp();
         } else {
@@ -537,7 +532,7 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
                                             csl, &cso);
         trace_net_rx_pkt_l4_csum_calc_ph_csum(cntr, csl);
     } else {
-        if (pkt->hasudp) {
+        if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP) {
             csl = be16_to_cpu(pkt->l4hdr_info.hdr.udp.uh_ulen);
             trace_net_rx_pkt_l4_csum_calc_ip6_udp();
         } else {
@@ -571,12 +566,14 @@ bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
 
     trace_net_rx_pkt_l4_csum_validate_entry();
 
-    if (!pkt->hastcp && !pkt->hasudp) {
+    if (pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_TCP &&
+        pkt->l4hdr_info.proto != ETH_L4_HDR_PROTO_UDP) {
         trace_net_rx_pkt_l4_csum_validate_not_xxp();
         return false;
     }
 
-    if (pkt->hasudp && (pkt->l4hdr_info.hdr.udp.uh_sum == 0)) {
+    if (pkt->l4hdr_info.proto == ETH_L4_HDR_PROTO_UDP &&
+        pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
         trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
         return false;
     }
@@ -602,17 +599,22 @@ bool net_rx_pkt_fix_l4_csum(struct NetRxPkt *pkt)
 
     trace_net_rx_pkt_l4_csum_fix_entry();
 
-    if (pkt->hastcp) {
+    switch (pkt->l4hdr_info.proto) {
+    case ETH_L4_HDR_PROTO_TCP:
         l4_cso = offsetof(struct tcp_header, th_sum);
         trace_net_rx_pkt_l4_csum_fix_tcp(l4_cso);
-    } else if (pkt->hasudp) {
+        break;
+
+    case ETH_L4_HDR_PROTO_UDP:
         if (pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
             trace_net_rx_pkt_l4_csum_fix_udp_with_no_checksum();
             return false;
         }
         l4_cso = offsetof(struct udp_header, uh_sum);
         trace_net_rx_pkt_l4_csum_fix_udp(l4_cso);
-    } else {
+        break;
+
+    default:
         trace_net_rx_pkt_l4_csum_fix_not_xxp();
         return false;
     }
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index cf9bb79..d00b484 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -68,13 +68,12 @@ void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
  * @pkt:            packet
  * @hasip4:          whether the packet has an IPv4 header
  * @hasip6:          whether the packet has an IPv6 header
- * @hasudp:          whether the packet has a UDP header
- * @hastcp:          whether the packet has a TCP header
+ * @l4hdr_proto:     protocol of L4 header
  *
  */
 void net_rx_pkt_get_protocols(struct NetRxPkt *pkt,
                                  bool *hasip4, bool *hasip6,
-                                 bool *hasudp, bool *hastcp);
+                                 EthL4HdrProto *l4hdr_proto);
 
 /**
 * fetches L3 header offset
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 9fb0544..2647cdc 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -61,7 +61,7 @@ pcnet_ioport_read(void *opaque, uint64_t addr, unsigned size) "opaque=%p addr=0x
 pcnet_ioport_write(void *opaque, uint64_t addr, uint64_t data, unsigned size) "opaque=%p addr=0x%"PRIx64" data=0x%"PRIx64" size=%d"
 
 # net_rx_pkt.c
-net_rx_pkt_parsed(bool ip4, bool ip6, bool udp, bool tcp, size_t l3o, size_t l4o, size_t l5o) "RX packet parsed: ip4: %d, ip6: %d, udp: %d, tcp: %d, l3 offset: %zu, l4 offset: %zu, l5 offset: %zu"
+net_rx_pkt_parsed(bool ip4, bool ip6, int l4proto, size_t l3o, size_t l4o, size_t l5o) "RX packet parsed: ip4: %d, ip6: %d, l4 protocol: %d, l3 offset: %zu, l4 offset: %zu, l5 offset: %zu"
 net_rx_pkt_l4_csum_validate_entry(void) "Starting L4 checksum validation"
 net_rx_pkt_l4_csum_validate_not_xxp(void) "Not a TCP/UDP packet"
 net_rx_pkt_l4_csum_validate_udp_with_no_checksum(void) "UDP packet without checksum"
@@ -177,11 +177,11 @@ e1000e_rx_start_recv(void)
 e1000e_rx_rss_started(void) "Starting RSS processing"
 e1000e_rx_rss_disabled(void) "RSS is disabled"
 e1000e_rx_rss_type(uint32_t type) "RSS type is %u"
-e1000e_rx_rss_ip4(bool hastcp, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: tcp %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
+e1000e_rx_rss_ip4(int l4hdr_proto, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: L4 header protocol %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
 e1000e_rx_rss_ip6_rfctl(uint32_t rfctl) "RSS IPv6: rfctl 0x%X"
-e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, bool hastcp, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, tcp %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
+e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, int l4hdr_proto, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, L4 header protocol %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
 
-e1000e_rx_metadata_protocols(bool hasip4, bool hasip6, bool hasudp, bool hastcp) "protocols: ip4: %d, ip6: %d, udp: %d, tcp: %d"
+e1000e_rx_metadata_protocols(bool hasip4, bool hasip6, int l4hdr_protocol) "protocols: ip4: %d, ip6: %d, l4hdr: %d"
 e1000e_rx_metadata_vlan(uint16_t vlan_tag) "VLAN tag is 0x%X"
 e1000e_rx_metadata_rss(uint32_t rss, uint32_t mrq) "RSS data: rss: 0x%X, mrq: 0x%X"
 e1000e_rx_metadata_ip_id(uint16_t ip_id) "the IPv4 ID is 0x%X"
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a14d3aa..53e1c32 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1748,37 +1748,59 @@ static int receive_filter(VirtIONet *n, const uint8_t *buf, int size)
 
 static uint8_t virtio_net_get_hash_type(bool hasip4,
                                         bool hasip6,
-                                        bool hasudp,
-                                        bool hastcp,
+                                        EthL4HdrProto l4hdr_proto,
                                         uint32_t types)
 {
     if (hasip4) {
-        if (hastcp && (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4)) {
-            return NetPktRssIpV4Tcp;
-        }
-        if (hasudp && (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4)) {
-            return NetPktRssIpV4Udp;
+        switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_TCP:
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4) {
+                return NetPktRssIpV4Tcp;
+            }
+            break;
+
+        case ETH_L4_HDR_PROTO_UDP:
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4) {
+                return NetPktRssIpV4Udp;
+            }
+            break;
+
+        default:
+            break;
         }
+
         if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv4) {
             return NetPktRssIpV4;
         }
     } else if (hasip6) {
-        uint32_t mask = VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
-                        VIRTIO_NET_RSS_HASH_TYPE_TCPv6;
+        switch (l4hdr_proto) {
+        case ETH_L4_HDR_PROTO_TCP:
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) {
+                return NetPktRssIpV6TcpEx;
+            }
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv6) {
+                return NetPktRssIpV6Tcp;
+            }
+            break;
 
-        if (hastcp && (types & mask)) {
-            return (types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) ?
-                NetPktRssIpV6TcpEx : NetPktRssIpV6Tcp;
+        case ETH_L4_HDR_PROTO_UDP:
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) {
+                return NetPktRssIpV6UdpEx;
+            }
+            if (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv6) {
+                return NetPktRssIpV6Udp;
+            }
+            break;
+
+        default:
+            break;
         }
-        mask = VIRTIO_NET_RSS_HASH_TYPE_UDP_EX | VIRTIO_NET_RSS_HASH_TYPE_UDPv6;
-        if (hasudp && (types & mask)) {
-            return (types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) ?
-                NetPktRssIpV6UdpEx : NetPktRssIpV6Udp;
+
+        if (types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) {
+            return NetPktRssIpV6Ex;
         }
-        mask = VIRTIO_NET_RSS_HASH_TYPE_IP_EX | VIRTIO_NET_RSS_HASH_TYPE_IPv6;
-        if (types & mask) {
-            return (types & VIRTIO_NET_RSS_HASH_TYPE_IP_EX) ?
-                NetPktRssIpV6Ex : NetPktRssIpV6;
+        if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv6) {
+            return NetPktRssIpV6;
         }
     }
     return 0xff;
@@ -1800,7 +1822,8 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
     struct NetRxPkt *pkt = n->rx_pkt;
     uint8_t net_hash_type;
     uint32_t hash;
-    bool hasip4, hasip6, hasudp, hastcp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
     static const uint8_t reports[NetPktRssIpV6UdpEx + 1] = {
         VIRTIO_NET_HASH_REPORT_IPv4,
         VIRTIO_NET_HASH_REPORT_TCPv4,
@@ -1815,8 +1838,8 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
 
     net_rx_pkt_set_protocols(pkt, buf + n->host_hdr_len,
                              size - n->host_hdr_len);
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
-    net_hash_type = virtio_net_get_hash_type(hasip4, hasip6, hasudp, hastcp,
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+    net_hash_type = virtio_net_get_hash_type(hasip4, hasip6, l4hdr_proto,
                                              n->rss_data.hash_types);
     if (net_hash_type > NetPktRssIpV6UdpEx) {
         if (n->rss_data.populate_hash) {
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 4d65327..1068b80 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -847,7 +847,8 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
                                            size_t pkt_len)
 {
     struct virtio_net_hdr *vhdr;
-    bool hasip4, hasip6, hastcp, hasudp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
     uint8_t *data;
     int len;
 
@@ -856,8 +857,10 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
         return;
     }
 
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
-    if (!(hasip4 || hasip6) || !(hastcp || hasudp)) {
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+    if (!(hasip4 || hasip6) ||
+        (l4hdr_proto != ETH_L4_HDR_PROTO_TCP &&
+         l4hdr_proto != ETH_L4_HDR_PROTO_UDP)) {
         return;
     }
 
@@ -885,7 +888,8 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
     struct Vmxnet3_RxCompDesc *rxcd)
 {
     int csum_ok, is_gso;
-    bool hasip4, hasip6, hastcp, hasudp;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
     struct virtio_net_hdr *vhdr;
     uint8_t offload_type;
 
@@ -911,16 +915,18 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
         goto nocsum;
     }
 
-    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
-    if ((!hastcp && !hasudp) || (!hasip4 && !hasip6)) {
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+    if ((l4hdr_proto != ETH_L4_HDR_PROTO_TCP &&
+         l4hdr_proto != ETH_L4_HDR_PROTO_UDP) ||
+        (!hasip4 && !hasip6)) {
         goto nocsum;
     }
 
     rxcd->cnc = 0;
     rxcd->v4 = hasip4 ? 1 : 0;
     rxcd->v6 = hasip6 ? 1 : 0;
-    rxcd->tcp = hastcp ? 1 : 0;
-    rxcd->udp = hasudp ? 1 : 0;
+    rxcd->tcp = l4hdr_proto == ETH_L4_HDR_PROTO_TCP;
+    rxcd->udp = l4hdr_proto == ETH_L4_HDR_PROTO_UDP;
     rxcd->fcs = rxcd->tuc = rxcd->ipc = 1;
     return;
 
diff --git a/include/net/eth.h b/include/net/eth.h
index fbac30c..c5ae449 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -381,18 +381,24 @@ typedef struct eth_ip4_hdr_info_st {
     bool   fragment;
 } eth_ip4_hdr_info;
 
+typedef enum EthL4HdrProto {
+    ETH_L4_HDR_PROTO_INVALID,
+    ETH_L4_HDR_PROTO_TCP,
+    ETH_L4_HDR_PROTO_UDP
+} EthL4HdrProto;
+
 typedef struct eth_l4_hdr_info_st {
     union {
         struct tcp_header tcp;
         struct udp_header udp;
     } hdr;
 
+    EthL4HdrProto proto;
     bool has_tcp_data;
 } eth_l4_hdr_info;
 
 void eth_get_protocols(const struct iovec *iov, int iovcnt,
                        bool *hasip4, bool *hasip6,
-                       bool *hasudp, bool *hastcp,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
                        size_t *l5hdr_off,
diff --git a/net/eth.c b/net/eth.c
index c1c14cf..70bcd8e 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -138,7 +138,6 @@ _eth_tcp_has_data(bool is_ip4,
 
 void eth_get_protocols(const struct iovec *iov, int iovcnt,
                        bool *hasip4, bool *hasip6,
-                       bool *hasudp, bool *hastcp,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
                        size_t *l5hdr_off,
@@ -153,7 +152,8 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
     size_t copied;
     uint8_t ip_p;
 
-    *hasip4 = *hasip6 = *hasudp = *hastcp = false;
+    *hasip4 = *hasip6 = false;
+    l4hdr_info->proto = ETH_L4_HDR_PROTO_INVALID;
 
     proto = eth_get_l3_proto(iov, iovcnt, l2hdr_len);
 
@@ -197,11 +197,11 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
 
     switch (ip_p) {
     case IP_PROTO_TCP:
-        *hastcp = _eth_copy_chunk(input_size,
-                                  iov, iovcnt,
-                                  *l4hdr_off, sizeof(l4hdr_info->hdr.tcp),
-                                  &l4hdr_info->hdr.tcp);
-        if (*hastcp) {
+        if (_eth_copy_chunk(input_size,
+                            iov, iovcnt,
+                            *l4hdr_off, sizeof(l4hdr_info->hdr.tcp),
+                            &l4hdr_info->hdr.tcp)) {
+            l4hdr_info->proto = ETH_L4_HDR_PROTO_TCP;
             *l5hdr_off = *l4hdr_off +
                 TCP_HEADER_DATA_OFFSET(&l4hdr_info->hdr.tcp);
 
@@ -215,11 +215,13 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
         break;
 
     case IP_PROTO_UDP:
-        *hasudp = _eth_copy_chunk(input_size,
-                                  iov, iovcnt,
-                                  *l4hdr_off, sizeof(l4hdr_info->hdr.udp),
-                                  &l4hdr_info->hdr.udp);
-        *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
+        if (_eth_copy_chunk(input_size,
+                            iov, iovcnt,
+                            *l4hdr_off, sizeof(l4hdr_info->hdr.udp),
+                            &l4hdr_info->hdr.udp)) {
+            l4hdr_info->proto = ETH_L4_HDR_PROTO_UDP;
+            *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
+        }
         break;
     }
 }
-- 
2.7.4


