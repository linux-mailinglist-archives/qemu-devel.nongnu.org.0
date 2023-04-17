Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D356E4475
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 11:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poLX4-0006x1-J8; Mon, 17 Apr 2023 05:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1poLX0-0006wl-B8
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:52:19 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1poLWw-0007aE-23
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:52:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230417095204euoutp029f51b18a16677a9cad2de5d89ab1501e~WsBdG5DK00872508725euoutp02Q
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:52:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230417095204euoutp029f51b18a16677a9cad2de5d89ab1501e~WsBdG5DK00872508725euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1681725124;
 bh=L0808zQ3ZyRpeRU8bdBcJ/keqf8mvafUCPhkgonqQVs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=maJTGGpiH5e4jlAxOT8xI+adR3YXZuNNxolORarlXcxm4yW81YKnyyvxkqayO1L7t
 4kQLc2+aKxyuXZzJLWKduTL58ZZGe8Ns8G8gmMuauGq5FYwvxVO9ccda+c3Qs1qkI4
 DRuTXkfFaF+0fPjejnqsp2r2Wrd3F3D1UME2jCUk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230417095204eucas1p2ba348078058b0d83e832ed8d333207d5~WsBc6_KDV0816408164eucas1p2C;
 Mon, 17 Apr 2023 09:52:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A8.7F.10014.4C61D346; Mon, 17
 Apr 2023 10:52:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230417095204eucas1p1ba024f769f79d1f78e68069d5328e010~WsBcgDdZZ0522305223eucas1p1J;
 Mon, 17 Apr 2023 09:52:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230417095204eusmtrp21ae8dade993713bc41fbef2ee0f49790~WsBcfZl9G1854118541eusmtrp2Z;
 Mon, 17 Apr 2023 09:52:04 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000271e-88-643d16c4a2c8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.7B.22108.4C61D346; Mon, 17
 Apr 2023 10:52:04 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230417095203eusmtip29832428cd38042dd9bf25adeb8dde68d~WsBb7yXkF0590505905eusmtip20;
 Mon, 17 Apr 2023 09:52:03 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH] igb: packet-split descriptors support
Date: Mon, 17 Apr 2023 11:51:57 +0200
Message-Id: <20230417095157.4571-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42LZduzned0jYrYpBm3dyhafT61lt1h26TOT
 ReP8OawWW6/+YLc43ruDxYHV48Tbg6weT65tZvJ4v+8qm0ffllWMASxRXDYpqTmZZalF+nYJ
 XBnbjhxnLOjuYao42veJtYGxdRdjFyMnh4SAicSEri0sXYxcHEICKxgleuY/hHK+MEqcnz+d
 CcL5zCgxb9M2FpiW/Xc3s0EkljNK7D3/GqqqnUnizYF1rCBVbAJmEo++zAOzRQQkJX53nWYG
 sZkFkiWuHn0MFOfgEAaq+fIsGSTMIqAq8ePjOTYQm1fASeJL0x0miGXyEjMvfWeHiAtKnJz5
 hAVijLxE89bZzCB7JQR6OSQWft4F1eAi0bNpCtSlwhKvjm9hh7BlJP7vnA9VUy7x8+w2dojm
 FkaJPVMnQxVZS1za+hPsOGYBTYn1u/Qhwo4SizbtZgMJSwjwSdx4KwhxA5/EpG3TmSHCvBId
 bUIQ1ToS3zbNhKqWklh4ow7C9JCYegtsv5BArMSD/x8YJzAqzELy1ywkf81CuGABI/MqRvHU
 0uLc9NRi47zUcr3ixNzi0rx0veT83E2MwHRy+t/xrzsYV7z6qHeIkYmD8RCjBAezkgjvGVer
 FCHelMTKqtSi/Pii0pzU4kOM0hwsSuK82rYnk4UE0hNLUrNTUwtSi2CyTBycUg1M4QfP/eXf
 Zf1d++D0/+zMJotVpBqjGq/cdE93qZ2yLmdPgIeQ2P2DR7m2xe+u2njzvvvH71tiXGeuNJ1w
 kONVlZWxvYPKVf4fqgs5Gu/WHr/g38l/v99g+eSIl7e+30i1f8/yIWAOl+vH8/sVytY/q4/d
 EVfDGu/8vfFgr97q3v88LfUnfbjkvBxXKW1KDlZz/Wyf97qZhbGXx7/oS19VYP5sm4I3zVUn
 vlZrL7XcuDd4m/qq1hqbJ17Rb1OEfbLqZt4rudtiOXGpVqvZfBbRT4s8nNg17RY2RDPIrf0X
 eMOZ7fX3bYfmCF4U7JrB1K+yyPf6ujvcu7LXzHokeOnilObTFReqirqteQ6nT/mkxFKckWio
 xVxUnAgAmA4qIpYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsVy+t/xe7pHxGxTDHb8YbX4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLA6sHifeHmT1eHJtM5PH+31X2Tz6tqxiDGCJ0rMpyi8tSVXIyC8u
 sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvYduQ4Y0F3D1PF0b5PrA2M
 rbsYuxg5OSQETCT2393M1sXIxSEksJRRYvqyP8wQCSmJfT3/2SFsYYk/17qgilqZJFbdm84E
 kmATMJN49GUeK4gtIiAp8bvrNFgzs0C6xK+fK4BqODiEgWq+PEsGCbMIqEr8+HiODcTmFXCS
 +NJ0hwlivrzEzEvf2SHighInZz5hgRgjL9G8dTbzBEa+WUhSs5CkFjAyrWIUSS0tzk3PLTbU
 K07MLS7NS9dLzs/dxAgM5W3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeM+4WqUI8aYkVlalFuXH
 F5XmpBYfYjQFum8is5Rocj4wmvJK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KL
 YPqYODilGpgOXVu98L9VsHM8197Vyh+kEg9N+am+4geTl1/mhHPc7PETgn5vF8wvfnG2MuZB
 +OzFvQLcRd76dWqc9hk3N14tPHpmoVTFhnc5AtMuXY9vu8B6QWjFEdnZqwsVf+zdknh0KlNt
 6tsHxn6nGR4xtVufT7+yZYfVflaOBZsDZrYerJ/ikhcYdu7P8ZZ5If7SeyVVl5n5qz+/bcq0
 e26n1umL3JsU7Noipv/jcpxntK1Z7cBqHc+33N6r1YL2THQIWasqUKDwRKFEznZVupfCr+hv
 sdMjt1sb61hmpLdEVl1u0txmuzc25LsOv8jrdYWBPh9nvZ956JzxkrMNF8pspq4TvrxIMDPn
 IF/oZe+VKVZKLMUZiYZazEXFiQCTNOwe7gIAAA==
X-CMS-MailID: 20230417095204eucas1p1ba024f769f79d1f78e68069d5328e010
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230417095204eucas1p1ba024f769f79d1f78e68069d5328e010
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230417095204eucas1p1ba024f769f79d1f78e68069d5328e010
References: <CGME20230417095204eucas1p1ba024f769f79d1f78e68069d5328e010@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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

Packet-split descriptors are used by Linux VF driver for MTU values from 2048
upwards.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/e1000x_regs.h   |   1 +
 hw/net/igb_core.c      | 701 ++++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h      |  18 ++
 hw/net/trace-events    |   4 +-
 tests/qtest/igb-test.c |   4 +
 5 files changed, 542 insertions(+), 186 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index 6d3c4c6d3a..82b14e12e0 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -827,6 +827,7 @@ union e1000_rx_desc_packet_split {
 /* Receive Checksum Control bits */
 #define E1000_RXCSUM_IPOFLD     0x100   /* IP Checksum Offload Enable */
 #define E1000_RXCSUM_TUOFLD     0x200   /* TCP/UDP Checksum Offload Enable */
+#define E1000_RXCSUM_IPPCSE     0x1000  /* IP Payload Checksum enable */
 #define E1000_RXCSUM_PCSD       0x2000  /* Packet Checksum Disable */
 
 #define E1000_RING_DESC_LEN       (16)
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index d733fed6cf..4e14175486 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -239,6 +239,20 @@ igb_rx_use_legacy_descriptor(IGBCore *core)
     return false;
 }
 
+static uint32_t
+igb_rx_queue_desctyp_get(IGBCore *core, int qidx)
+{
+    return (core->mac[E1000_SRRCTL(qidx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK) >>
+           E1000_SRRCTL_DESCTYPE_OFFSET;
+}
+
+static inline bool
+igb_rx_use_ps_descriptor(IGBCore *core, int qidx)
+{
+    uint32_t desctyp = igb_rx_queue_desctyp_get(core, qidx);
+    return desctyp == 2 || desctyp == 5;
+}
+
 static inline bool
 igb_rss_enabled(IGBCore *core)
 {
@@ -876,6 +890,21 @@ igb_rxbufsize(IGBCore *core, const E1000E_RingInfo *r)
     return e1000x_rxbufsize(core->mac[RCTL]);
 }
 
+static size_t
+igb_calc_rxdesclen(IGBCore *core)
+{
+   size_t rxdesc_size;
+
+    if (igb_rx_use_legacy_descriptor(core)) {
+        rxdesc_size = sizeof(struct e1000_rx_desc);
+    } else {
+        rxdesc_size = sizeof(union e1000_adv_rx_desc);
+    }
+
+    trace_e1000e_rx_desc_len(rxdesc_size);
+    return rxdesc_size;
+}
+
 static bool
 igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
 {
@@ -883,9 +912,8 @@ igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
     uint32_t bufsize = igb_rxbufsize(core, r);
 
     trace_e1000e_rx_has_buffers(r->idx, bufs, total_size, bufsize);
-
-    return total_size <= bufs / (core->rx_desc_len / E1000_MIN_RX_DESC_LEN) *
-                         bufsize;
+    return total_size <= bufs / (igb_calc_rxdesclen(core) /
+                                 E1000_MIN_RX_DESC_LEN) * bufsize;
 }
 
 void
@@ -1158,21 +1186,43 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
 }
 
 static inline void
-igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
-                      hwaddr *buff_addr)
+igb_read_adv_rx_single_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+                                 hwaddr *buff_addr)
 {
     *buff_addr = le64_to_cpu(desc->read.pkt_addr);
 }
 
+static inline void
+igb_read_adv_rx_split_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+                                hwaddr *buff_addr)
+{
+    buff_addr[0] = le64_to_cpu(desc->read.hdr_addr);
+    buff_addr[1] = le64_to_cpu(desc->read.pkt_addr);
+}
+
 static inline void
 igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-                  hwaddr *buff_addr)
+                  hwaddr (*buff_addr)[MAX_PS_BUFFERS],
+                  int qidx)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
-    } else {
-        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
+        igb_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[1]);
+        (*buff_addr)[0] = 0;
+        return;
     }
+
+    /* advanced header split descriptor */
+    if (igb_rx_use_ps_descriptor(core, qidx)) {
+        igb_read_adv_rx_split_buf_descr(core, &desc->adv, &(*buff_addr)[0]);
+        return;
+    }
+
+    /* descriptor replication modes not supported */
+    assert(igb_rx_queue_desctyp_get(core, qidx) == 1);
+
+    /* advanced single buffer descriptor */
+    igb_read_adv_rx_single_buf_descr(core, &desc->adv, &(*buff_addr)[1]);
+    (*buff_addr)[0] = 0;
 }
 
 static void
@@ -1214,25 +1264,19 @@ igb_verify_csum_in_sw(IGBCore *core,
 }
 
 static void
-igb_build_rx_metadata(IGBCore *core,
-                      struct NetRxPkt *pkt,
-                      bool is_eop,
-                      const E1000E_RSSInfo *rss_info,
-                      uint16_t *pkt_info, uint16_t *hdr_info,
-                      uint32_t *rss,
-                      uint32_t *status_flags,
-                      uint16_t *ip_id,
-                      uint16_t *vlan_tag)
+igb_build_rx_metadata_common(IGBCore *core,
+                             struct NetRxPkt *pkt,
+                             bool is_eop,
+                             uint32_t *status_flags,
+                             uint16_t *vlan_tag)
 {
     struct virtio_net_hdr *vhdr;
     bool hasip4, hasip6;
     EthL4HdrProto l4hdr_proto;
-    uint32_t pkt_type;
 
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
-    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1249,51 +1293,6 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_vlan(*vlan_tag);
     }
 
-    /* Packet parsing results */
-    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) != 0) {
-        if (rss_info->enabled) {
-            *rss = cpu_to_le32(rss_info->hash);
-            trace_igb_rx_metadata_rss(*rss);
-        }
-    } else if (hasip4) {
-            *status_flags |= E1000_RXD_STAT_IPIDV;
-            *ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
-            trace_e1000e_rx_metadata_ip_id(*ip_id);
-    }
-
-    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP && net_rx_pkt_is_tcp_ack(pkt)) {
-        *status_flags |= E1000_RXD_STAT_ACK;
-        trace_e1000e_rx_metadata_ack();
-    }
-
-    if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
-        trace_e1000e_rx_metadata_ipv6_filtering_disabled();
-        pkt_type = E1000_RXD_PKT_MAC;
-    } else if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP ||
-               l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
-    } else if (hasip4 || hasip6) {
-        pkt_type = hasip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
-    } else {
-        pkt_type = E1000_RXD_PKT_MAC;
-    }
-
-    trace_e1000e_rx_metadata_pkt_type(pkt_type);
-
-    if (pkt_info) {
-        if (rss_info->enabled) {
-            *pkt_info = rss_info->type;
-        }
-
-        *pkt_info |= (pkt_type << 4);
-    } else {
-        *status_flags |= E1000_RXD_PKT_TYPE(pkt_type);
-    }
-
-    if (hdr_info) {
-        *hdr_info = 0;
-    }
-
     /* RX CSO information */
     if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
         trace_e1000e_rx_metadata_ipv6_sum_disabled();
@@ -1332,62 +1331,171 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_l4_cso_disabled();
     }
 
-    trace_e1000e_rx_metadata_status_flags(*status_flags);
-
 func_exit:
+    trace_e1000e_rx_metadata_status_flags(*status_flags);
     *status_flags = cpu_to_le32(*status_flags);
 }
 
 static inline void
-igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
+igb_write_lgcy_rx_descr(IGBCore *core,
+                        union e1000_rx_desc_union *desc,
                         struct NetRxPkt *pkt,
                         const E1000E_RSSInfo *rss_info,
                         uint16_t length)
 {
-    uint32_t status_flags, rss;
-    uint16_t ip_id;
+    uint32_t status_flags;
+    struct e1000_rx_desc *d = &desc->legacy;
 
     assert(!rss_info->enabled);
-    desc->length = cpu_to_le16(length);
-    desc->csum = 0;
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info,
-                          NULL, NULL, &rss,
-                          &status_flags, &ip_id,
-                          &desc->special);
-    desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
-    desc->status = (uint8_t) le32_to_cpu(status_flags);
+    memset(d, 0, sizeof(*d));
+    d->length = cpu_to_le16(length);
+    igb_build_rx_metadata_common(core, pkt, pkt != NULL,
+                                 &status_flags,
+                                 &d->special);
+
+    d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
+    d->status = (uint8_t) le32_to_cpu(status_flags);
+}
+
+typedef struct {
+    bool sph;
+    bool hbo;
+    size_t descriptor_hdr_len;
+} igb_split_descriptor_data;
+
+static inline bool
+igb_rx_ps_descriptor_split_always(IGBCore *core, int qidx)
+{
+    uint32_t desctyp = igb_rx_queue_desctyp_get(core, qidx);
+    return desctyp == 5;
+}
+
+static uint16_t
+igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt)
+{
+    uint16_t pkt_type = 0;
+    bool hasip4, hasip6, issctp = false;
+    EthL4HdrProto l4hdr_proto;
+
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+
+    if (hasip6 && !(core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
+        eth_ip6_hdr_info *ip6hdr_info  = net_rx_pkt_get_ip6_info(pkt);
+        pkt_type |= ip6hdr_info->has_ext_hdrs ? IGB_RX_DESC_PKT_TYPE_IPV6E :
+                                                IGB_RX_DESC_PKT_TYPE_IPV6;
+        issctp = ip6hdr_info->l4proto == IPPROTO_SCTP;
+    } else if (hasip4) {
+        pkt_type = IGB_RX_DESC_PKT_TYPE_IPV4;
+        eth_ip4_hdr_info *ip4hdr_info = net_rx_pkt_get_ip4_info(pkt);
+        issctp = ip4hdr_info->ip4_hdr.ip_p == IPPROTO_SCTP;
+    }
+
+    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP) {
+        pkt_type |= IGB_RX_DESC_PKT_TYPE_TCP;
+    } else if (l4hdr_proto == ETH_L4_HDR_PROTO_UDP) {
+        pkt_type |= IGB_RX_DESC_PKT_TYPE_UDP;
+    } else if (issctp) {
+        pkt_type |= IGB_RX_DESC_PKT_TYPE_SCTP;
+    }
+
+    return pkt_type;
 }
 
 static inline void
-igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+igb_write_adv_rx_descr(IGBCore *core,
+                       union e1000_rx_desc_union *desc,
                        struct NetRxPkt *pkt,
                        const E1000E_RSSInfo *rss_info,
                        uint16_t length)
 {
-    memset(&desc->wb, 0, sizeof(desc->wb));
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
+    uint16_t rss_type = 0, pkt_type;
+    bool eop = (pkt != NULL);
+    union e1000_adv_rx_desc *d = &desc->adv;
+    memset(&d->wb, 0, sizeof(d->wb));
 
-    desc->wb.upper.length = cpu_to_le16(length);
+    d->wb.upper.length = cpu_to_le16(length);
+    igb_build_rx_metadata_common(core, pkt, eop,
+                                 &d->wb.upper.status_error,
+                                 &d->wb.upper.vlan);
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info,
-                          &desc->wb.lower.lo_dword.pkt_info,
-                          &desc->wb.lower.lo_dword.hdr_info,
-                          &desc->wb.lower.hi_dword.rss,
-                          &desc->wb.upper.status_error,
-                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                          &desc->wb.upper.vlan);
+    if (!eop) {
+        return;
+    }
+
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+
+    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) && rss_info->enabled) {
+        d->wb.lower.hi_dword.rss = cpu_to_le32(rss_info->hash);
+        rss_type = rss_info->type;
+        trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss, rss_type);
+    } else if (!(core->mac[RXCSUM] & E1000_RXCSUM_PCSD) &&
+               core->mac[RXCSUM] & E1000_RXCSUM_IPPCSE &&
+               hasip4) {
+        d->wb.lower.hi_dword.csum_ip.ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
+        trace_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_id);
+    }
+
+    pkt_type = igb_rx_desc_get_packet_type(core, pkt);
+    trace_e1000e_rx_metadata_pkt_type(pkt_type);
+    d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
 }
 
 static inline void
-igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info, uint16_t length)
+igb_write_adv_ps_split_rx_descr(IGBCore *core,
+                                union e1000_rx_desc_union *desc,
+                                struct NetRxPkt *pkt,
+                                const E1000E_RSSInfo *rss_info,
+                                igb_split_descriptor_data *ps_desc_data,
+                                uint16_t(*written)[MAX_PS_BUFFERS])
+{
+    size_t pkt_len;
+    bool split_always;
+
+    size_t hdr_len = ps_desc_data->descriptor_hdr_len;
+    union e1000_adv_rx_desc *d = &desc->adv;
+
+    split_always = igb_rx_ps_descriptor_split_always(core, rss_info->queue);
+    if (!split_always) {
+        if ((!ps_desc_data->sph && !ps_desc_data->hbo) ||
+            ( ps_desc_data->sph &&  ps_desc_data->hbo)) {
+            pkt_len = (*written)[0] + (*written)[1];
+        } else {
+            assert(!ps_desc_data->hbo);
+            pkt_len = (*written)[1];
+        }
+    } else {
+        pkt_len = (*written)[1];
+    }
+
+    igb_write_adv_rx_descr(core, desc, pkt, rss_info, pkt_len);
+
+    d->wb.lower.lo_dword.hdr_info = (hdr_len << RX_DESC_ADV_HDR_LEN_OFFSET) &
+                                    RX_DESC_ADV_HDR_LEN_MASK;
+    d->wb.lower.lo_dword.hdr_info |= ps_desc_data->sph ? RX_DESC_ADV_HDR_SPH
+                                                       : 0;
+    d->wb.upper.status_error |= ps_desc_data->hbo ?
+                                    RX_DESC_ADV_ST_ERR_HBO_OFFSET : 0;
+}
+
+static inline void
+igb_write_rx_descr(IGBCore *core,
+                   union e1000_rx_desc_union *desc,
+                   struct NetRxPkt *pkt,
+                   const E1000E_RSSInfo *rss_info,
+                   igb_split_descriptor_data *ps_desc_data,
+                   uint16_t(*written)[MAX_PS_BUFFERS],
+                   int qidx)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
+        igb_write_lgcy_rx_descr(core, desc, pkt, rss_info, (*written)[1]);
+    } else if (igb_rx_use_ps_descriptor(core, qidx)) {
+        igb_write_adv_ps_split_rx_descr(core, desc, pkt, rss_info,
+                                        ps_desc_data, written);
     } else {
-        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, length);
+        igb_write_adv_rx_descr(core, desc, pkt, rss_info, (*written)[1]);
     }
 }
 
@@ -1423,19 +1531,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
     }
 }
 
-static void
-igb_write_to_rx_buffers(IGBCore *core,
-                        PCIDevice *d,
-                        hwaddr ba,
-                        uint16_t *written,
-                        const char *data,
-                        dma_addr_t data_len)
-{
-    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
-    pci_dma_write(d, ba + *written, data, data_len);
-    *written += data_len;
-}
-
 static void
 igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
                     size_t data_size, size_t data_fcs_size)
@@ -1473,6 +1568,283 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
+static uint32_t
+igb_get_queue_rx_desc_header_buf_size(IGBCore *core, int qidx)
+{
+    uint32_t srr_size = (core->mac[E1000_SRRCTL(qidx) >> 2] &
+                         E1000_SRRCTL_BSIZEHDR_MASK) >> 8;
+    return srr_size * 64;
+}
+
+static bool
+igb_do_ps(IGBCore *core,
+          int qidx,
+          struct NetRxPkt *pkt,
+          size_t *hdr_len,
+          igb_split_descriptor_data *ps_desc_data)
+{
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
+    bool fragment;
+    bool split_always;
+    size_t bheader_size;
+    size_t total_pkt_len;
+
+    if (!igb_rx_use_ps_descriptor(core, qidx)) {
+        return false;
+    }
+
+    memset(ps_desc_data, 0, sizeof(igb_split_descriptor_data));
+
+    total_pkt_len = net_rx_pkt_get_total_len(pkt);
+    bheader_size = igb_get_queue_rx_desc_header_buf_size(core, qidx);
+    split_always = igb_rx_ps_descriptor_split_always(core, qidx);
+    if (split_always && total_pkt_len <= bheader_size) {
+        *hdr_len = total_pkt_len;
+        ps_desc_data->descriptor_hdr_len = total_pkt_len;
+        return true;
+    }
+
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+
+    if (hasip4) {
+        fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
+    } else if (hasip6) {
+        fragment = net_rx_pkt_get_ip6_info(pkt)->fragment;
+    } else {
+        ps_desc_data->descriptor_hdr_len = bheader_size;
+        goto header_cant_be_decoded_or_bigger_than_header_buffer;
+    }
+
+    if (fragment && (core->mac[RFCTL] & E1000_RFCTL_IPFRSP_DIS)) {
+        ps_desc_data->descriptor_hdr_len = bheader_size;
+        goto header_cant_be_decoded_or_bigger_than_header_buffer;
+    }
+
+    /* no header splitting for SCTP */
+    if (!fragment && (l4hdr_proto == ETH_L4_HDR_PROTO_UDP ||
+                      l4hdr_proto == ETH_L4_HDR_PROTO_TCP)) {
+        *hdr_len = net_rx_pkt_get_l5_hdr_offset(pkt);
+    } else {
+        *hdr_len = net_rx_pkt_get_l4_hdr_offset(pkt);
+    }
+
+    ps_desc_data->sph = true;
+    ps_desc_data->descriptor_hdr_len = *hdr_len;
+
+    if (*hdr_len > bheader_size) {
+        ps_desc_data->hbo = true;
+        goto header_cant_be_decoded_or_bigger_than_header_buffer;
+    }
+
+    return true;
+
+header_cant_be_decoded_or_bigger_than_header_buffer:
+    if (split_always) {
+        *hdr_len = bheader_size;
+        return true;
+    }
+
+    return false;
+}
+
+typedef struct igb_ba_state_st {
+    uint16_t written[MAX_PS_BUFFERS];
+    uint8_t cur_idx;
+} igb_ba_state;
+
+typedef struct {
+    size_t size;
+    size_t total_size;
+    size_t ps_hdr_len;
+    size_t desc_size;
+    size_t desc_offset;
+    uint32_t rx_desc_packet_buf_size;
+    uint32_t rx_desc_header_buf_size;
+    size_t iov_ofs;
+    bool do_ps;
+    bool is_first;
+    struct iovec *iov;
+    igb_ba_state bastate;
+    hwaddr ba[MAX_PS_BUFFERS];
+} igb_packet_dma_state;
+
+static inline void
+igb_truncate_to_descriptor_size(igb_packet_dma_state *pdma_st, size_t *size)
+{
+    if (pdma_st->do_ps && pdma_st->is_first) {
+        if (*size > pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len) {
+            *size = pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len;
+        }
+    } else {
+        if (*size > pdma_st->rx_desc_packet_buf_size) {
+            *size = pdma_st->rx_desc_packet_buf_size;
+        }
+    }
+}
+
+static inline void
+igb_write_hdr_to_rx_buffers(IGBCore *core,
+                            PCIDevice *d,
+                            hwaddr (*ba)[MAX_PS_BUFFERS],
+                            igb_ba_state *bastate,
+                            uint32_t rx_desc_header_buf_size,
+                            const char *data,
+                            dma_addr_t data_len)
+{
+    assert(data_len <= rx_desc_header_buf_size - bastate->written[0]);
+    pci_dma_write(d, (*ba)[0] + bastate->written[0], data, data_len);
+    bastate->written[0] += data_len;
+    bastate->cur_idx = 1;
+}
+
+static void
+igb_write_packet_hdr_to_descr_addr(IGBCore *core,
+                                   struct NetRxPkt *pkt,
+                                   PCIDevice *d,
+                                   igb_packet_dma_state *pdma_st,
+                                   size_t *copy_size)
+{
+    size_t iov_copy;
+    size_t ps_hdr_copied = 0;
+
+    if (!pdma_st->is_first) {
+        /* Leave buffer 0 of each descriptor except first */
+        /* empty                                          */
+        igb_write_hdr_to_rx_buffers(core, d, &pdma_st->ba, &pdma_st->bastate,
+                                    pdma_st->rx_desc_header_buf_size,
+                                    NULL, 0);
+        return;
+    }
+
+    do {
+        iov_copy = MIN(pdma_st->ps_hdr_len - ps_hdr_copied,
+                       pdma_st->iov->iov_len - pdma_st->iov_ofs);
+
+        igb_write_hdr_to_rx_buffers(core, d, &pdma_st->ba,
+                                    &pdma_st->bastate,
+                                    pdma_st->rx_desc_header_buf_size,
+                                    pdma_st->iov->iov_base,
+                                    iov_copy);
+
+        *copy_size -= iov_copy;
+        ps_hdr_copied += iov_copy;
+
+        pdma_st->iov_ofs += iov_copy;
+        if (pdma_st->iov_ofs == pdma_st->iov->iov_len) {
+            pdma_st->iov++;
+            pdma_st->iov_ofs = 0;
+        }
+    } while (ps_hdr_copied < pdma_st->ps_hdr_len);
+
+    pdma_st->is_first = false;
+}
+
+static void
+igb_write_to_rx_buffers(IGBCore *core,
+                        PCIDevice *d,
+                        hwaddr (*ba)[MAX_PS_BUFFERS],
+                        igb_ba_state *bastate,
+                        uint32_t cur_buf_len,
+                        const char *data,
+                        dma_addr_t data_len)
+{
+    while (data_len > 0) {
+        assert(bastate->cur_idx < MAX_PS_BUFFERS);
+
+        uint32_t cur_buf_bytes_left = cur_buf_len -
+                                      bastate->written[bastate->cur_idx];
+        uint32_t bytes_to_write = MIN(data_len, cur_buf_bytes_left);
+
+        trace_igb_rx_desc_buff_write(bastate->cur_idx,
+                                     (*ba)[bastate->cur_idx],
+                                     bastate->written[bastate->cur_idx],
+                                     data,
+                                     bytes_to_write);
+
+        pci_dma_write(d,
+                      (*ba)[bastate->cur_idx] +
+                      bastate->written[bastate->cur_idx],
+                      data, bytes_to_write);
+
+        bastate->written[bastate->cur_idx] += bytes_to_write;
+        data += bytes_to_write;
+        data_len -= bytes_to_write;
+
+        if (bastate->written[bastate->cur_idx] == cur_buf_len) {
+            bastate->cur_idx++;
+        }
+    }
+}
+
+static void
+igb_write_packet_payload_to_descr_addr(IGBCore *core,
+                                       struct NetRxPkt *pkt,
+                                       PCIDevice *d,
+                                       igb_packet_dma_state *pdma_st,
+                                       size_t *copy_size)
+{
+    static const uint32_t fcs_pad;
+    size_t iov_copy;
+
+    /* Copy packet payload */
+    while (*copy_size) {
+        iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
+        igb_write_to_rx_buffers(core, d, &pdma_st->ba, &pdma_st->bastate,
+                                pdma_st->rx_desc_packet_buf_size,
+                                pdma_st->iov->iov_base + pdma_st->iov_ofs,
+                                iov_copy);
+
+        *copy_size -= iov_copy;
+        pdma_st->iov_ofs += iov_copy;
+        if (pdma_st->iov_ofs == pdma_st->iov->iov_len) {
+            pdma_st->iov++;
+            pdma_st->iov_ofs = 0;
+        }
+    }
+
+    if (pdma_st->desc_offset + pdma_st->desc_size >= pdma_st->total_size) {
+        /* Simulate FCS checksum presence in the last descriptor */
+        igb_write_to_rx_buffers(core, d, &pdma_st->ba, &pdma_st->bastate,
+                                pdma_st->rx_desc_packet_buf_size,
+                                (const char *) &fcs_pad,
+                                e1000x_fcs_len(core->mac));
+    }
+}
+
+static void
+igb_write_packet_to_descr_addr(IGBCore *core,
+                               struct NetRxPkt *pkt,
+                               PCIDevice *d,
+                               igb_packet_dma_state *pdma_st)
+{
+    size_t copy_size;
+
+    if (!(pdma_st->ba)[1]) {
+        /* as per intel docs; skip descriptors with null buf addr */
+        trace_e1000e_rx_null_descriptor();
+        return;
+    }
+
+    if (pdma_st->desc_offset >= pdma_st->size) {
+        return;
+    }
+
+    pdma_st->desc_size = pdma_st->total_size - pdma_st->desc_offset;
+    igb_truncate_to_descriptor_size(pdma_st, &pdma_st->desc_size);
+    copy_size = pdma_st->size - pdma_st->desc_offset;
+    igb_truncate_to_descriptor_size(pdma_st, &copy_size);
+
+    /* For PS mode copy the packet header first */
+    if (pdma_st->do_ps) {
+        igb_write_packet_hdr_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
+    } else {
+        pdma_st->bastate.cur_idx = 1;
+    }
+
+    igb_write_packet_payload_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
+}
+
 static void
 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                           const E1000E_RxRing *rxr,
@@ -1481,91 +1853,63 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     PCIDevice *d;
     dma_addr_t base;
     union e1000_rx_desc_union desc;
-    size_t desc_size;
-    size_t desc_offset = 0;
-    size_t iov_ofs = 0;
-
-    struct iovec *iov = net_rx_pkt_get_iovec(pkt);
-    size_t size = net_rx_pkt_get_total_len(pkt);
-    size_t total_size = size + e1000x_fcs_len(core->mac);
-    const E1000E_RingInfo *rxi = rxr->i;
-    size_t bufsize = igb_rxbufsize(core, rxi);
-
+    const E1000E_RingInfo *rxi;
+    size_t rx_desc_len;
+    igb_split_descriptor_data ps_desc_data;
+
+    igb_packet_dma_state pdma_st = {0};
+    pdma_st.is_first = true;
+    pdma_st.size = net_rx_pkt_get_total_len(pkt);
+    pdma_st.total_size = pdma_st.size + e1000x_fcs_len(core->mac);
+
+    rxi = rxr->i;
+    rx_desc_len = igb_calc_rxdesclen(core);
+    pdma_st.rx_desc_packet_buf_size =
+        igb_rxbufsize(core, rxi);
+    pdma_st.rx_desc_header_buf_size =
+        igb_get_queue_rx_desc_header_buf_size(core, rxi->idx);
+    pdma_st.iov = net_rx_pkt_get_iovec(pkt);
     d = pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
     if (!d) {
         d = core->owner;
     }
 
+    pdma_st.do_ps = igb_do_ps(core, rxi->idx, pkt,
+                              &pdma_st.ps_hdr_len,
+                              &ps_desc_data);
+
     do {
-        hwaddr ba;
-        uint16_t written = 0;
+        memset(&pdma_st.bastate, 0, sizeof(igb_ba_state));
         bool is_last = false;
 
-        desc_size = total_size - desc_offset;
-
-        if (desc_size > bufsize) {
-            desc_size = bufsize;
-        }
-
         if (igb_ring_empty(core, rxi)) {
             return;
         }
 
         base = igb_ring_head_descr(core, rxi);
+        pci_dma_read(d, base, &desc, rx_desc_len);
+        trace_e1000e_rx_descr(rxi->idx, base, rx_desc_len);
 
-        pci_dma_read(d, base, &desc, core->rx_desc_len);
-
-        trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
-
-        igb_read_rx_descr(core, &desc, &ba);
-
-        if (ba) {
-            if (desc_offset < size) {
-                static const uint32_t fcs_pad;
-                size_t iov_copy;
-                size_t copy_size = size - desc_offset;
-                if (copy_size > bufsize) {
-                    copy_size = bufsize;
-                }
-
-                /* Copy packet payload */
-                while (copy_size) {
-                    iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
-
-                    igb_write_to_rx_buffers(core, d, ba, &written,
-                                            iov->iov_base + iov_ofs, iov_copy);
-
-                    copy_size -= iov_copy;
-                    iov_ofs += iov_copy;
-                    if (iov_ofs == iov->iov_len) {
-                        iov++;
-                        iov_ofs = 0;
-                    }
-                }
+        igb_read_rx_descr(core, &desc, &pdma_st.ba, rxi->idx);
 
-                if (desc_offset + desc_size >= total_size) {
-                    /* Simulate FCS checksum presence in the last descriptor */
-                    igb_write_to_rx_buffers(core, d, ba, &written,
-                          (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
-                }
-            }
-        } else { /* as per intel docs; skip descriptors with null buf addr */
-            trace_e1000e_rx_null_descriptor();
-        }
-        desc_offset += desc_size;
-        if (desc_offset >= total_size) {
+        igb_write_packet_to_descr_addr(core, pkt, d, &pdma_st);
+        pdma_st.desc_offset += pdma_st.desc_size;
+        if (pdma_st.desc_offset >= pdma_st.total_size) {
             is_last = true;
         }
 
-        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
-                           rss_info, written);
-        igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_len);
+        igb_write_rx_descr(core, &desc,
+                           is_last ? pkt : NULL,
+                           rss_info,
+                           &ps_desc_data,
+                           &pdma_st.bastate.written,
+                           rxi->idx);
+        pci_dma_write(d, base, &desc, rx_desc_len);
+        igb_ring_advance(core, rxi,
+                         rx_desc_len / E1000_MIN_RX_DESC_LEN);
+    } while (pdma_st.desc_offset < pdma_st.total_size);
 
-        igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-
-    } while (desc_offset < total_size);
-
-    igb_update_rx_stats(core, rxi, size, total_size);
+    igb_update_rx_stats(core, rxi, pdma_st.size, pdma_st.total_size);
 }
 
 static bool
@@ -1819,17 +2163,6 @@ igb_set_rfctl(IGBCore *core, int index, uint32_t val)
     core->mac[RFCTL] = val;
 }
 
-static void
-igb_calc_rxdesclen(IGBCore *core)
-{
-    if (igb_rx_use_legacy_descriptor(core)) {
-        core->rx_desc_len = sizeof(struct e1000_rx_desc);
-    } else {
-        core->rx_desc_len = sizeof(union e1000_adv_rx_desc);
-    }
-    trace_e1000e_rx_desc_len(core->rx_desc_len);
-}
-
 static void
 igb_set_rx_control(IGBCore *core, int index, uint32_t val)
 {
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index c5c5b3c3b8..0099794c8d 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -81,6 +81,23 @@ union e1000_adv_rx_desc {
     } wb;  /* writeback */
 };
 
+#define IGB_MAX_PS_BUFFERS  2
+#define IGB_MAX_RX_DESC_LEN (sizeof(uint64_t) * MAX_PS_BUFFERS)
+
+#define IGB_RX_DESC_PKT_TYPE_IPV4  BIT(0)
+#define IGB_RX_DESC_PKT_TYPE_IPV4E BIT(1)
+#define IGB_RX_DESC_PKT_TYPE_IPV6  BIT(2)
+#define IGB_RX_DESC_PKT_TYPE_IPV6E BIT(3)
+#define IGB_RX_DESC_PKT_TYPE_TCP   BIT(4)
+#define IGB_RX_DESC_PKT_TYPE_UDP   BIT(5)
+#define IGB_RX_DESC_PKT_TYPE_SCTP  BIT(6)
+
+#define RX_DESC_ADV_HDR_LEN_OFFSET    (21 - 16)
+#define RX_DESC_ADV_HDR_LEN_MASK      ((BIT(10) - 1) << \
+                                       RX_DESC_ADV_HDR_LEN_OFFSET)
+#define RX_DESC_ADV_HDR_SPH           BIT(15)
+#define RX_DESC_ADV_ST_ERR_HBO_OFFSET BIT(3 + 20)
+
 /* from igb/e1000_phy.h */
 
 /* IGP01E1000 Specific Registers */
@@ -406,6 +423,7 @@ union e1000_adv_rx_desc {
 #define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
 #define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
 #define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
+#define E1000_SRRCTL_DESCTYPE_OFFSET           25
 #define E1000_SRRCTL_DROP_EN                   0x80000000
 
 #define E1000_SRRCTL_BSIZEPKT_MASK             0x0000007F
diff --git a/hw/net/trace-events b/hw/net/trace-events
index d35554fce8..82ae89f2e5 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -283,9 +283,9 @@ igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
 
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
-igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
+igb_rx_desc_buff_write(uint8_t idx, uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer #%u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
+igb_rx_metadata_rss(uint32_t rss, uint16_t rss_pkt_type) "RSS data: rss: 0x%X, rss_pkt_type: 0x%X"
 
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
diff --git a/tests/qtest/igb-test.c b/tests/qtest/igb-test.c
index 3d397ea697..d33d324871 100644
--- a/tests/qtest/igb-test.c
+++ b/tests/qtest/igb-test.c
@@ -104,6 +104,10 @@ static void igb_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     char buffer[64];
     int ret;
 
+    /* Set supported descriptor mode */
+    uint32_t srrctl0 = e1000e_macreg_read(d, E1000_SRRCTL(0));
+    e1000e_macreg_write(d, E1000_SRRCTL(0), srrctl0 | BIT(25));
+
     /* Send a dummy packet to device's socket*/
     ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(packet));
     g_assert_cmpint(ret, == , sizeof(packet) + sizeof(len));
-- 
2.25.1


