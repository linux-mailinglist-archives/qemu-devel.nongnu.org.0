Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D86EF829
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:10:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhhv-0005iU-9C; Wed, 26 Apr 2023 12:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1prhht-0005iD-Nx
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:09:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1prhhp-0003PC-Tw
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:09:25 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230426160916euoutp02e5693ca38554ce5c2b67fb591087308a~Zh_W0jczJ1261612616euoutp02I
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 16:09:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230426160916euoutp02e5693ca38554ce5c2b67fb591087308a~Zh_W0jczJ1261612616euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682525356;
 bh=5jr+I4CdIozMTg3gYoNXkSov6zBOldiO4b294teADCc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=B7kyPESL+fd1e6Sjm/zdkPKh3iOqTFQaDz6a/kWRDqxQVlsVzKtAbHLqQHWBXuC/w
 InuNPpKBKeTdUfh7wYkySE3xHBeUr5NPRkT88yvzmfBd81rj/4wr0btsvAzGHo9cSu
 v/xzY40taSlIVS2T/5dxSfpFx73Exk0N25WiHSXQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230426160916eucas1p1a89f53dd9edbb8e3fb2aeb8cf9487570~Zh_WizSIP0081700817eucas1p1j;
 Wed, 26 Apr 2023 16:09:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 92.4E.37758.CAC49446; Wed, 26
 Apr 2023 17:09:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b~Zh_WUjcWa2878628786eucas1p1G;
 Wed, 26 Apr 2023 16:09:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230426160915eusmtrp20a2eaa90949eeb69b8e5705f45d5fd7d~Zh_WUB3Ad2767227672eusmtrp2r;
 Wed, 26 Apr 2023 16:09:15 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-be-64494cac6147
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E9.46.10549.BAC49446; Wed, 26
 Apr 2023 17:09:15 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230426160915eusmtip2086958f3749fd53752a25bd049f42d78~Zh_VzPH5V0970709707eusmtip2N;
 Wed, 26 Apr 2023 16:09:15 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: jasowang@redhat.com, k.kwiecien@samsung.com, m.sochacki@samsung.com
Subject: [PATCH v2 1/2] igb: RX descriptors handling cleanup
Date: Wed, 26 Apr 2023 18:09:07 +0200
Message-Id: <20230426160908.4768-1-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42LZduzned01Pp4pBpePsFp8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFgdWjxNvD7J6PLm2mcnj/b6rbB59W1YxBrBEcdmkpOZklqUW6dsl
 cGU8PldRcOQlY8W99S2sDYw35zF2MXJwSAiYSPxfbdvFyMUhJLCCUeLksyfMEM4XRonzz06x
 QjifGSUeHP3KBNNxdX48RHw5o8TDOefZIJx2Jok7S/cCjeXkYBMwk3j0ZR4rSIOIgLHEx3Zx
 kDCzgLvE8lUXwMLCAjYSR/4Xg4RZBFQl7i2/xwRi8wo4SWxfso0VxJYQkJeYeek7O0RcUOLk
 zCcsEGPkJZq3zgY7VEJgIofE/N3HmCAaXCSOLZzNBmELS7w6voUdwpaR+L9zPlRNucTPs9vY
 IZpbGCX2TJ0MVWQtcWnrT7DjmAU0Jdbv0ocIO0p0PrwIDS0+iRtvBSFu4JOYtG06M0SYV6Kj
 TQiiWkfi26aZbBBhKYmFN+ogwh4S+7Z8ANsjJBArMavvAPMERoVZSB6bheSxWQgnLGBkXsUo
 nlpanJueWmycl1quV5yYW1yal66XnJ+7iRGYSE7/O/51B+OKVx/1DjEycTAeYpTgYFYS4eWt
 dE8R4k1JrKxKLcqPLyrNSS0+xCjNwaIkzqttezJZSCA9sSQ1OzW1ILUIJsvEwSnVwNQmUap5
 6nHEGv8P2cxin2aoz3CrWf7pYKam4btnC050Bt5xXqS3T+Mg/0nOBk72K9se7XNz4j28Nb1z
 BUNK7t1l9w9qik9ZlXuzoVD2W/CBOZ4K/Rtve/hKBctcevWI20Hd4+ChZ9mXhVY4lgX9t/jK
 z//4BHug3JMVIi94RVYU/7d6pNlr7sPEw87TLtrvOflgU1Zmt/s2Je2aibL7RdwuTFeZEW76
 Udu0dNGVPP/OgIX3G8Mn5Og6fshNXHx3deulA9eyvzIsqEutbU1pELKJNj1m1rMlPO+0z9S+
 tF8bLGMSPa2vlU49auTq0Rz44c7HLxGtX8v8TDd/ZX67qcP/guoKU5MQ7UibYHk2JZbijERD
 Leai4kQAm/teu5MDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsVy+t/xe7qrfTxTDJ58MLD4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLA6sHifeHmT1eHJtM5PH+31X2Tz6tqxiDGCJ0rMpyi8tSVXIyC8u
 sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mt4fK6i4MhLxop761tYGxhv
 zmPsYuTgkBAwkbg6P76LkYtDSGApo8TrhrdMXYycQHEpiX09/9khbGGJP9e62EBsIYFWJokp
 HwNAbDYBM4lHX+axgswRETCVeLZXEiTMLOAt8ePDBnaQsLCAjcSR/8UgYRYBVYl7y++BTecV
 cJLYvmQbK8R0eYmZl76zQ8QFJU7OfMICMUZeonnrbOYJjHyzkKRmIUktYGRaxSiSWlqcm55b
 bKhXnJhbXJqXrpecn7uJERjC24793LyDcd6rj3qHGJk4GA8xSnAwK4nw8la6pwjxpiRWVqUW
 5ccXleakFh9iNAW6byKzlGhyPjCK8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1ML
 Uotg+pg4OKUamNy23Vss9T/q4tOY1faHrEqWTl8X2r7hg+Tp7u4bs2u6qpkZiqbkHTLZtKDs
 nHLBoo8rIjlmJEU0znBIUjnj9HFi9kvnzcwxa+LE52bcmPuk+cYJDsbJwpFeMeqXhF7XK7Gc
 u7bvxJrP3JcnpPSX+ok/7lDPmHhsRXvjo+DJmh7hGzynJmg/+imTY7Tn1R4Tr5uL5A8H7G8/
 3a758I1nmBD36V0nOa6mST3cc23Nk86ibsbc2qvdE9wvuU2a/XtvVdqsgpmRwZ3eH9beePRD
 tqL0zZSZmw7+afRbPvOFdnzBqXgv2wTL+D9vmQ4dvDq1VHNj89GC5Nq1S72yF0Qdm6Lgcuvn
 6sayO9d1t7E8KWxVYinOSDTUYi4qTgQAP1DbwuoCAAA=
X-CMS-MailID: 20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b
References: <CGME20230426160915eucas1p1c5f8933d7c737d3b6fe466baafd2c86b@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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

Format of Intel 82576 was changed in comparison to Intel 82574 extended
descriptors. This change updates filling of advanced descriptors fields
accordingly:
* remove TCP ACK detection
* add IPv6 with extensions traffic detection
* fragment checksum and IP ID is filled only when RXCSUM.IPPCSE is set (in
  addition to RXCSUM.PCSD bit cleared condition)

Refactoring is done in preparation for support of multiple advanced
descriptors RX modes, especially packet-split modes.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/e1000e_core.c     |  16 +-
 hw/net/e1000x_regs.h     |   1 +
 hw/net/igb_core.c        | 505 ++++++++++++++++++++++++---------------
 hw/net/igb_regs.h        |  21 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   5 +
 6 files changed, 344 insertions(+), 210 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 78373d7db7..d874809d93 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1418,11 +1418,11 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
 }
 
 static void
-e1000e_write_to_rx_buffers(E1000ECore *core,
-                           hwaddr ba[MAX_PS_BUFFERS],
-                           e1000e_ba_state *bastate,
-                           const char *data,
-                           dma_addr_t data_len)
+e1000e_write_payload_to_rx_buffers(E1000ECore *core,
+                                   hwaddr ba[MAX_PS_BUFFERS],
+                                   e1000e_ba_state *bastate,
+                                   const char *data,
+                                   dma_addr_t data_len)
 {
     while (data_len > 0) {
         uint32_t cur_buf_len = core->rxbuf_sizes[bastate->cur_idx];
@@ -1594,8 +1594,8 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                 while (copy_size) {
                     iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
 
-                    e1000e_write_to_rx_buffers(core, ba, &bastate,
-                                            iov->iov_base + iov_ofs, iov_copy);
+                    e1000e_write_payload_to_rx_buffers(core, ba, &bastate,
+                                                       iov->iov_base + iov_ofs, iov_copy);
 
                     copy_size -= iov_copy;
                     iov_ofs += iov_copy;
@@ -1607,7 +1607,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
                 if (desc_offset + desc_size >= total_size) {
                     /* Simulate FCS checksum presence in the last descriptor */
-                    e1000e_write_to_rx_buffers(core, ba, &bastate,
+                    e1000e_write_payload_to_rx_buffers(core, ba, &bastate,
                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
                 }
             }
diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index 13760c66d3..344fd10359 100644
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
index 96b7335b31..47c4a16e84 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -267,6 +267,21 @@ igb_rx_use_legacy_descriptor(IGBCore *core)
     return false;
 }
 
+typedef struct E1000E_RingInfo_st {
+    int dbah;
+    int dbal;
+    int dlen;
+    int dh;
+    int dt;
+    int idx;
+} E1000E_RingInfo;
+
+static uint32_t
+igb_rx_queue_desctyp_get(IGBCore *core, const E1000E_RingInfo *r)
+{
+    return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
+}
+
 static inline bool
 igb_rss_enabled(IGBCore *core)
 {
@@ -694,15 +709,6 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
     return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
 }
 
-typedef struct E1000E_RingInfo_st {
-    int dbah;
-    int dbal;
-    int dlen;
-    int dh;
-    int dt;
-    int idx;
-} E1000E_RingInfo;
-
 static inline bool
 igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)
 {
@@ -941,6 +947,14 @@ igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
                          bufsize;
 }
 
+static uint32_t
+igb_get_queue_rx_header_buf_size(IGBCore *core, const E1000E_RingInfo *r)
+{
+    uint32_t srr_size = (core->mac[E1000_SRRCTL(r->idx) >> 2] &
+                         E1000_SRRCTL_BSIZEHDR_MASK) >> 8;
+    return srr_size * 64;
+}
+
 void
 igb_start_recv(IGBCore *core)
 {
@@ -1225,21 +1239,34 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
 }
 
 static inline void
-igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
-                      hwaddr *buff_addr)
+igb_read_adv_rx_single_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+                                 hwaddr *buff_addr)
 {
     *buff_addr = le64_to_cpu(desc->read.pkt_addr);
 }
 
 static inline void
 igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-                  hwaddr *buff_addr)
+                  hwaddr buff_addr[MAX_PS_BUFFERS],
+                  const E1000E_RingInfo *r)
 {
+    uint32_t desc_type;
+
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
-    } else {
-        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
+        igb_read_lgcy_rx_descr(core, &desc->legacy, &buff_addr[1]);
+        buff_addr[0] = 0;
+        return;
     }
+
+    /* modes other than advanced single buffer descriptor not supported */
+    desc_type = igb_rx_queue_desctyp_get(core, r);
+    if (desc_type != E1000_SRRCTL_DESCTYPE_ADV_ONEBUF) {
+        trace_igb_wrn_rx_desc_modes_not_supp(desc_type);
+    }
+
+    /* advanced single buffer descriptor */
+    igb_read_adv_rx_single_buf_descr(core, &desc->adv, &buff_addr[1]);
+    buff_addr[0] = 0;
 }
 
 static void
@@ -1281,15 +1308,11 @@ igb_verify_csum_in_sw(IGBCore *core,
 }
 
 static void
-igb_build_rx_metadata(IGBCore *core,
-                      struct NetRxPkt *pkt,
-                      bool is_eop,
-                      const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
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
     bool hasip4, hasip6, csum_valid;
@@ -1298,7 +1321,6 @@ igb_build_rx_metadata(IGBCore *core,
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
-    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1315,64 +1337,6 @@ igb_build_rx_metadata(IGBCore *core,
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
-    if (pkt_info) {
-        *pkt_info = rss_info->enabled ? rss_info->type : 0;
-
-        if (etqf < 8) {
-            *pkt_info |= BIT(11) | (etqf << 4);
-        } else {
-            if (hasip4) {
-                *pkt_info |= E1000_ADVRXD_PKT_IP4;
-            }
-
-            if (hasip6) {
-                *pkt_info |= E1000_ADVRXD_PKT_IP6;
-            }
-
-            switch (l4hdr_proto) {
-            case ETH_L4_HDR_PROTO_TCP:
-                *pkt_info |= E1000_ADVRXD_PKT_TCP;
-                break;
-
-            case ETH_L4_HDR_PROTO_UDP:
-                *pkt_info |= E1000_ADVRXD_PKT_UDP;
-                break;
-
-            case ETH_L4_HDR_PROTO_SCTP:
-                *pkt_info |= E1000_ADVRXD_PKT_SCTP;
-                break;
-
-            default:
-                break;
-            }
-        }
-    }
-
-    if (hdr_info) {
-        *hdr_info = 0;
-    }
-
-    if (ts) {
-        *status_flags |= BIT(16);
-    }
-
     /* RX CSO information */
     if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
         trace_e1000e_rx_metadata_ipv6_sum_disabled();
@@ -1426,58 +1390,125 @@ func_exit:
 }
 
 static inline void
-igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
+igb_write_lgcy_rx_descr(IGBCore *core,
+                        struct e1000_rx_desc *d,
                         struct NetRxPkt *pkt,
-                        const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
+                        const E1000E_RSSInfo *rss_info,
                         uint16_t length)
 {
-    uint32_t status_flags, rss;
-    uint16_t ip_id;
+    uint32_t status_flags;
 
     assert(!rss_info->enabled);
-    desc->length = cpu_to_le16(length);
-    desc->csum = 0;
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info, etqf, ts,
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
+static uint16_t
+igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
+{
+    uint16_t pkt_type = 0;
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
+
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+
+    if (hasip6 && !(core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
+        eth_ip6_hdr_info *ip6hdr_info  = net_rx_pkt_get_ip6_info(pkt);
+        pkt_type |= ip6hdr_info->has_ext_hdrs ? E1000_ADVRXD_PKT_IP6E :
+                                                E1000_ADVRXD_PKT_IP6;
+    } else if (hasip4) {
+        pkt_type = E1000_ADVRXD_PKT_IP4;
+    }
+
+    if (etqf < 8) {
+        pkt_type |= (BIT(11) >> 4) | etqf;
+        return pkt_type;
+    }
+
+    switch (l4hdr_proto) {
+    case ETH_L4_HDR_PROTO_TCP:
+        pkt_type |= E1000_ADVRXD_PKT_TCP;
+        break;
+    case ETH_L4_HDR_PROTO_UDP:
+        pkt_type |= E1000_ADVRXD_PKT_UDP;
+        break;
+    case ETH_L4_HDR_PROTO_SCTP:
+        pkt_type |= E1000_ADVRXD_PKT_SCTP;
+        break;
+    default:
+        break;
+    }
+
+    return pkt_type;
 }
 
 static inline void
-igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+igb_write_adv_rx_descr(IGBCore *core,
+                       union e1000_adv_rx_desc *d,
                        struct NetRxPkt *pkt,
-                       const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
+                       const E1000E_RSSInfo *rss_info,
+                       uint16_t etqf,
+                       bool ts,
                        uint16_t length)
 {
-    memset(&desc->wb, 0, sizeof(desc->wb));
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
+    uint16_t rss_type = 0, pkt_type;
+    bool eop = (pkt != NULL);
+    memset(&d->wb, 0, sizeof(d->wb));
+
+    d->wb.upper.length = cpu_to_le16(length);
+    igb_build_rx_metadata_common(core, pkt, eop,
+                                 &d->wb.upper.status_error,
+                                 &d->wb.upper.vlan);
+
+    if (!eop) {
+        return;
+    }
+
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
 
-    desc->wb.upper.length = cpu_to_le16(length);
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
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info, etqf, ts,
-                          &desc->wb.lower.lo_dword.pkt_info,
-                          &desc->wb.lower.lo_dword.hdr_info,
-                          &desc->wb.lower.hi_dword.rss,
-                          &desc->wb.upper.status_error,
-                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                          &desc->wb.upper.vlan);
+    if (ts) {
+        d->wb.upper.status_error |= BIT(16);
+    }
+
+    pkt_type = igb_rx_desc_get_packet_type(core, pkt, etqf);
+    trace_e1000e_rx_metadata_pkt_type(pkt_type);
+    d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
 }
 
 static inline void
-igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-                   struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
-                   uint16_t etqf, bool ts, uint16_t length)
+igb_write_rx_descr(IGBCore *core,
+                   union e1000_rx_desc_union *desc,
+                   struct NetRxPkt *pkt,
+                   const E1000E_RSSInfo *rss_info,
+                   uint16_t etqf,
+                   bool ts,
+                   uint16_t(*written)[MAX_PS_BUFFERS],
+                   const E1000E_RingInfo *r)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
-                                etqf, ts, length);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, (*written)[1]);
     } else {
-        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
-                               etqf, ts, length);
+        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, etqf, ts, (*written)[1]);
     }
 }
 
@@ -1513,19 +1544,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
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
                     size_t pkt_size, size_t pkt_fcs_size)
@@ -1551,6 +1569,136 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
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
+    struct iovec *iov;
+    size_t iov_ofs;
+    bool is_first;
+    igb_ba_state bastate;
+    hwaddr ba[MAX_PS_BUFFERS];
+} igb_packet_tx_dma_state;
+
+static void
+igb_truncate_to_descriptor_size(igb_packet_tx_dma_state *pdma_st, size_t *size)
+{
+    if (*size > pdma_st->rx_desc_packet_buf_size) {
+        *size = pdma_st->rx_desc_packet_buf_size;
+    }
+}
+
+static void
+igb_write_payload_to_rx_buffers(IGBCore *core,
+                                PCIDevice *d,
+                                hwaddr (*ba)[MAX_PS_BUFFERS],
+                                igb_ba_state *bastate,
+                                uint32_t cur_buf_len,
+                                const char *data,
+                                dma_addr_t data_len)
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
+                                       igb_packet_tx_dma_state *pdma_st,
+                                       size_t *copy_size)
+{
+    static const uint32_t fcs_pad;
+    size_t iov_copy;
+
+    /* Copy packet payload */
+    while (*copy_size) {
+        iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
+        igb_write_payload_to_rx_buffers(core, d,
+                                        &pdma_st->ba,
+                                        &pdma_st->bastate,
+                                        pdma_st->rx_desc_packet_buf_size,
+                                        pdma_st->iov->iov_base + pdma_st->iov_ofs,
+                                        iov_copy);
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
+        igb_write_payload_to_rx_buffers(core, d,
+                                        &pdma_st->ba,
+                                        &pdma_st->bastate,
+                                        pdma_st->rx_desc_packet_buf_size,
+                                        (const char *) &fcs_pad,
+                                        e1000x_fcs_len(core->mac));
+    }
+}
+
+static void
+igb_write_to_rx_buffers(IGBCore *core,
+                        struct NetRxPkt *pkt,
+                        PCIDevice *d,
+                        igb_packet_tx_dma_state *pdma_st)
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
+    pdma_st->bastate.cur_idx = 1;
+    igb_write_packet_payload_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
+}
+
 static void
 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                           const E1000E_RxRing *rxr,
@@ -1560,91 +1708,58 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
+
+    igb_packet_tx_dma_state pdma_st = {0};
+    pdma_st.is_first = true;
+    pdma_st.size = net_rx_pkt_get_total_len(pkt);
+    pdma_st.total_size = pdma_st.size + e1000x_fcs_len(core->mac);
+
+    rxi = rxr->i;
+    rx_desc_len = core->rx_desc_len;
+    pdma_st.rx_desc_packet_buf_size =
+        igb_rxbufsize(core, rxi);
+    pdma_st.rx_desc_header_buf_size =
+        igb_get_queue_rx_header_buf_size(core, rxi);
+    pdma_st.iov = net_rx_pkt_get_iovec(pkt);
     d = pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
     if (!d) {
         d = core->owner;
     }
 
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
+        igb_read_rx_descr(core, &desc, pdma_st.ba, rxi);
 
-                    copy_size -= iov_copy;
-                    iov_ofs += iov_copy;
-                    if (iov_ofs == iov->iov_len) {
-                        iov++;
-                        iov_ofs = 0;
-                    }
-                }
-
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
+        igb_write_to_rx_buffers(core, pkt, d, &pdma_st);
+        pdma_st.desc_offset += pdma_st.desc_size;
+        if (pdma_st.desc_offset >= pdma_st.total_size) {
             is_last = true;
         }
 
-        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
-                           rss_info, etqf, ts, written);
-        igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_len);
-
-        igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-
-    } while (desc_offset < total_size);
-
-    igb_update_rx_stats(core, rxi, size, total_size);
+        igb_write_rx_descr(core, &desc,
+                           is_last ? pkt : NULL,
+                           rss_info,
+                           etqf, ts,
+                           &pdma_st.bastate.written,
+                           rxi);
+        pci_dma_write(d, base, &desc, rx_desc_len);
+        igb_ring_advance(core, rxi,
+                         rx_desc_len / E1000_MIN_RX_DESC_LEN);
+    } while (pdma_st.desc_offset < pdma_st.total_size);
+
+    igb_update_rx_stats(core, rxi, pdma_st.size, pdma_st.total_size);
 }
 
 static bool
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 82ff195dfc..b14ca834ad 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -76,6 +76,15 @@ union e1000_adv_rx_desc {
     } wb;  /* writeback */
 };
 
+#define IGB_MAX_PS_BUFFERS  2
+#define IGB_MAX_RX_DESC_LEN (sizeof(uint64_t) * MAX_PS_BUFFERS)
+
+#define RX_DESC_ADV_HDR_LEN_OFFSET    (21 - 16)
+#define RX_DESC_ADV_HDR_LEN_MASK      ((BIT(10) - 1) << \
+                                       RX_DESC_ADV_HDR_LEN_OFFSET)
+#define RX_DESC_ADV_HDR_SPH           BIT(15)
+#define RX_DESC_ADV_ST_ERR_HBO_OFFSET BIT(3 + 20)
+
 /* from igb/e1000_phy.h */
 
 /* IGP01E1000 Specific Registers */
@@ -452,6 +461,7 @@ union e1000_adv_rx_desc {
 #define E1000_SRRCTL_BSIZEHDRSIZE_MASK         0x00000F00
 #define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT        2  /* Shift _left_ */
 #define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
+#define E1000_SRRCTL_DESCTYPE_HDR_SPLIT        0x04000000
 #define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
 #define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
 #define E1000_SRRCTL_DROP_EN                   0x80000000
@@ -692,11 +702,12 @@ union e1000_adv_rx_desc {
 
 #define E1000_STATUS_NUM_VFS_SHIFT 14
 
-#define E1000_ADVRXD_PKT_IP4 BIT(4)
-#define E1000_ADVRXD_PKT_IP6 BIT(6)
-#define E1000_ADVRXD_PKT_TCP BIT(8)
-#define E1000_ADVRXD_PKT_UDP BIT(9)
-#define E1000_ADVRXD_PKT_SCTP BIT(10)
+#define E1000_ADVRXD_PKT_IP4  BIT(0)
+#define E1000_ADVRXD_PKT_IP6  BIT(2)
+#define E1000_ADVRXD_PKT_IP6E BIT(3)
+#define E1000_ADVRXD_PKT_TCP  BIT(4)
+#define E1000_ADVRXD_PKT_UDP  BIT(5)
+#define E1000_ADVRXD_PKT_SCTP BIT(6)
 
 static inline uint8_t igb_ivar_entry_rx(uint8_t i)
 {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e4a98b2c7d..9a02261360 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -277,9 +277,9 @@ igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
 
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
-igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
+igb_rx_desc_buff_write(uint8_t idx, uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer #%u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
-igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
+igb_rx_metadata_rss(uint32_t rss, uint16_t rss_pkt_type) "RSS data: rss: 0x%X, rss_pkt_type: 0x%X"
 
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
@@ -294,6 +294,8 @@ igb_irq_eitr_set(uint32_t eitr_num, uint32_t val) "EITR[%u] = 0x%x"
 igb_set_pfmailbox(uint32_t vf_num, uint32_t val) "PFMailbox[%d]: 0x%x"
 igb_set_vfmailbox(uint32_t vf_num, uint32_t val) "VFMailbox[%d]: 0x%x"
 
+igb_wrn_rx_desc_modes_not_supp(int desc_type) "Not supported descriptor type: %d"
+
 # igbvf.c
 igbvf_wrn_io_addr_unknown(uint64_t addr) "IO unknown register 0x%"PRIx64
 
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index a603468beb..4e720ee7e7 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -55,6 +55,7 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
 {
     static const uint8_t address[] = E1000E_ADDRESS;
     QE1000E_PCI *d = (QE1000E_PCI *) obj;
+    uint32_t srrctl0;
     uint32_t val;
 
     /* Enable the device */
@@ -109,6 +110,10 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
                         E1000_RAH_AV | E1000_RAH_POOL_1 |
                         le16_to_cpu(*(uint16_t *)(address + 4)));
 
+    /* Set supported receive descriptor mode */
+    srrctl0 = e1000e_macreg_read(&d->e1000e, E1000_SRRCTL(0));
+    e1000e_macreg_write(&d->e1000e, E1000_SRRCTL(0), srrctl0 | BIT(25));
+
     /* Enable receive */
     e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
-- 
2.25.1


