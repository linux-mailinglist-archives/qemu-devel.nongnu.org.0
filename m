Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAC6F0474
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:49:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przAN-0004Ta-Oy; Thu, 27 Apr 2023 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAM-0004TR-4D
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAG-00031E-Ni
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230427104751euoutp02359eca46a578a5db8c5bdeb31e739e3e~ZxPAQ5U_X0266402664euoutp02d
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 10:47:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230427104751euoutp02359eca46a578a5db8c5bdeb31e739e3e~ZxPAQ5U_X0266402664euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682592471;
 bh=ZIcEgElvYT/VSNROy5SVVyAtuuUkGDo5EerDtKml2xE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q1SiWRylPlwZOUWD2GhKrVPtB9Ad8zxhDZ/SpNH0hPeFlK1P7aWUm6TxfgwtQLkOc
 uCA04iC09bzGKYd/vOJspP+f+2p2o+l/K35gzU8DcBm6zibDZFLBJthg3rI1vOWLTC
 L/0sAMxFJcNLvLwNFEhokyOdEtzO+Pquhcj5Pnmk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230427104750eucas1p1f64ae11f1ed8974b86a379abe9ecc94c~ZxPAEfSmF0040500405eucas1p1J;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 58.A8.42423.6D25A446; Thu, 27
 Apr 2023 11:47:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace~ZxO-mszAm0236502365eucas1p1k;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230427104750eusmtrp1f6e8b3a8e6cbcf99bf17775c0fc81430~ZxO-mFCKs1482414824eusmtrp1h;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-61-644a52d66778
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.70.10549.6D25A446; Thu, 27
 Apr 2023 11:47:50 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104749eusmtip1ef8d6733e035b0f20047740d2689529e~ZxO-AKUfo2764227642eusmtip1K;
 Thu, 27 Apr 2023 10:47:49 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v3 1/2] igb: RX descriptors handling cleanup
Date: Thu, 27 Apr 2023 12:47:42 +0200
Message-Id: <20230427104743.9072-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned1rQV4pBv3NhhafT61lt1h26TOT
 ReP8OawWW6/+YLc43ruDxaJ30wsmBzaPE28PsnpceHSO2ePJtc1MHu/3XWXz6NuyijGANYrL
 JiU1J7MstUjfLoEr4+vWp+wFO28zVpye+YmxgfHfJMYuRg4OCQETif1zirsYuTiEBFYwShyf
 +YEZwvnCKNG+5w8bhPOZUWLm8ZlAGU6wjvOdd9ghEssZJZ6t/8wK4bQzSayf/5wJpIpNwEzi
 0Zd5rCA7RASMJT62i4OEmQVSJY7+OcgCYgsL2EjsWXSKEcRmEVCVuPx8AZjNK+AkcXz2ASaI
 ZfISMy99ZwexOQWcJRq/TmaGqBGUODnzCQvETHmJ5q2zwc6WENjBIbHm/wU2iGYXiSkPZ0EN
 EpZ4dXwLO4QtI3F6cg8LhF0u8fPsNnaI5hZGiT1TJ0MVWUtc2voT7AFmAU2J9bv0IeHlKLHx
 MBeEySdx460gxAl8EpO2TWeGCPNKdLQJQczQkfi2aSYbRFhKYuGNOoiwh8SpCWeYJjAqzkLy
 yywkv8xC2LqAkXkVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYII5/e/4px2Mc1991DvE
 yMTBeIhRgoNZSYSXt9I9RYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU1ILU
 IpgsEwenVANTe+q5hTZirrt7b5zUVzn4fK52SJSK6lWPh7zplYxvnwjffvy9fJWn6gVGLZ8Q
 m8Trubd3luefTT0sc17FtX7Jwpwn1R3Xf/LKBm59GBt26KLw/V299dMOse1+H8++zvRIMZ87
 m8Ia9beW5s9E27YbVR//lOIrOVnoZfCHKZX2U/mSbito5TxvKT+2syd41+XIPYJnvP7H+ouG
 cT3m1ZlT+HcOn8ZXrkfmnv9EvZ4XS++NSRdxKXhq927K9ZCTEbPWyf0NV7StD4+dFlKeGHVU
 4Mb2KE32T1em9Xj/7zhswj7p157up/xmztOWFx34XZiksDDoYsKmlIkV+d9ux5Rzn5V+Uc2Z
 Ol04Y+OiW0JKLMUZiYZazEXFiQDc7LGrnwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xu7rXgrxSDE48Frb4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GV+3PmUv
 2HmbseL0zE+MDYz/JjF2MXJySAiYSJzvvMPexcjFISSwlFHiQ8shVoiElMS+nv/sELawxJ9r
 XWwQRa1MEnOPdbCAJNgEzCQefZkH1MDBISJgKvFsryRImFkgU+L0q31sILawgI3EnkWnwJax
 CKhKXH6+AMzmFXCSOD77ABPEfHmJmZe+g+3iFHCWaPw6mRlkpBBQzftn9hDlghInZz5hgRgv
 L9G8dTbzBEaBWUhSs5CkFjAyrWIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMhm3Hfm7ewTjv
 1Ue9Q4xMHIyHGCU4mJVEeHkr3VOEeFMSK6tSi/Lji0pzUosPMZoCnT2RWUo0OR8Yj3kl8YZm
 BqaGJmaWBqaWZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUzzshk8mZr/PF5Y2vXnlIKO
 c/58ef2FWdY/JKfNKjx6auEhY68jitYqN/JXxvOE3up8dOH+ooa7GSE1FrffOZxo8N5b2H7H
 5I1XMEPkkqvXZypork4+Em587IvrGoOTK4TPFth7zvROWT7Z/J/BtpCPatz8nbtMricF36qa
 uTfB5vGfzyn6Ze8O95h//h66W3GK9qO2egltw9zmCzu2pnx7creZwfVwxG+RuOBnnxa+tat+
 6TFxjcaML2YFOrv3Gob4VFoFv67KjZkTXKz/9Yp2VP3uui8fSpnfbNhxe8HG9yuUf8znnKSY
 yDFJ/stp10RBzj9rD254vSF8p07y/LtyUZfmvtQ+ZLy5wOemOF+MEktxRqKhFnNRcSIA28EX
 /Q8DAAA=
X-CMS-MailID: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1158eee5a37c71cacaea021a7abbd6ace@eucas1p1.samsung.com>
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
 hw/net/e1000e_core.c     |  18 +-
 hw/net/e1000x_regs.h     |   1 +
 hw/net/igb_core.c        | 478 ++++++++++++++++++++++++---------------
 hw/net/igb_regs.h        |  12 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   3 +
 6 files changed, 316 insertions(+), 202 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 78373d7db7..0085ad53c2 100644
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
+e1000e_write_payload_frag_to_rx_buffers(E1000ECore *core,
+                                        hwaddr ba[MAX_PS_BUFFERS],
+                                        e1000e_ba_state *bastate,
+                                        const char *data,
+                                        dma_addr_t data_len)
 {
     while (data_len > 0) {
         uint32_t cur_buf_len = core->rxbuf_sizes[bastate->cur_idx];
@@ -1594,8 +1594,10 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                 while (copy_size) {
                     iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
 
-                    e1000e_write_to_rx_buffers(core, ba, &bastate,
-                                            iov->iov_base + iov_ofs, iov_copy);
+                    e1000e_write_payload_frag_to_rx_buffers(core, ba, &bastate,
+                                                            iov->iov_base +
+                                                            iov_ofs,
+                                                            iov_copy);
 
                     copy_size -= iov_copy;
                     iov_ofs += iov_copy;
@@ -1607,7 +1609,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
                 if (desc_offset + desc_size >= total_size) {
                     /* Simulate FCS checksum presence in the last descriptor */
-                    e1000e_write_to_rx_buffers(core, ba, &bastate,
+                    e1000e_write_payload_frag_to_rx_buffers(core, ba, &bastate,
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
index 96b7335b31..1cb64402aa 100644
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
+    uint32_t srrctl = core->mac[E1000_SRRCTL(r->idx) >> 2];
+    return (srrctl & E1000_SRRCTL_BSIZEHDRSIZE_MASK) >>
+           E1000_SRRCTL_BSIZEHDRSIZE_SHIFT;
+}
+
 void
 igb_start_recv(IGBCore *core)
 {
@@ -1232,7 +1246,7 @@ igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
 }
 
 static inline void
-igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
+igb_read_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
                   hwaddr *buff_addr)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
@@ -1281,15 +1295,11 @@ igb_verify_csum_in_sw(IGBCore *core,
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
@@ -1298,7 +1308,6 @@ igb_build_rx_metadata(IGBCore *core,
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
-    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1315,64 +1324,6 @@ igb_build_rx_metadata(IGBCore *core,
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
@@ -1426,58 +1377,126 @@ func_exit:
 }
 
 static inline void
-igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
+igb_write_lgcy_rx_descr(IGBCore *core,
+                        struct e1000_rx_desc *desc,
                         struct NetRxPkt *pkt,
-                        const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
+                        const E1000E_RSSInfo *rss_info,
                         uint16_t length)
 {
-    uint32_t status_flags, rss;
-    uint16_t ip_id;
+    uint32_t status_flags;
 
     assert(!rss_info->enabled);
+
+    memset(desc, 0, sizeof(*desc));
     desc->length = cpu_to_le16(length);
-    desc->csum = 0;
+    igb_build_rx_metadata_common(core, pkt, pkt != NULL,
+                                 &status_flags,
+                                 &desc->special);
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info, etqf, ts,
-                          NULL, NULL, &rss,
-                          &status_flags, &ip_id,
-                          &desc->special);
     desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
     desc->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
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
+}
+
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
+
+    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) != 0) {
+        if (rss_info->enabled) {
+            d->wb.lower.hi_dword.rss = cpu_to_le32(rss_info->hash);
+            rss_type = rss_info->type;
+            trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss, rss_type);
+        }
+    } else if (core->mac[RXCSUM] & E1000_RXCSUM_IPPCSE &&
+               hasip4) {
+        d->wb.lower.hi_dword.csum_ip.ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
+        trace_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_id);
+    }
 
-    desc->wb.upper.length = cpu_to_le16(length);
+    if (ts) {
+        d->wb.upper.status_error |= BIT(16);
+    }
 
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info, etqf, ts,
-                          &desc->wb.lower.lo_dword.pkt_info,
-                          &desc->wb.lower.lo_dword.hdr_info,
-                          &desc->wb.lower.hi_dword.rss,
-                          &desc->wb.upper.status_error,
-                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                          &desc->wb.upper.vlan);
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
 
@@ -1513,19 +1532,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
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
@@ -1551,6 +1557,137 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
+typedef struct IGB_BaState_st {
+    uint16_t written[MAX_PS_BUFFERS];
+    uint8_t cur_idx;
+} IGB_BaState;
+
+typedef struct IGB_PacketRxDMAState_st {
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
+    IGB_BaState bastate;
+    hwaddr ba[MAX_PS_BUFFERS];
+} IGB_PacketRxDMAState;
+
+static void
+igb_truncate_to_descriptor_size(IGB_PacketRxDMAState *pdma_st, size_t *size)
+{
+    if (*size > pdma_st->rx_desc_packet_buf_size) {
+        *size = pdma_st->rx_desc_packet_buf_size;
+    }
+}
+
+static void
+igb_write_payload_frag_to_rx_buffers(IGBCore *core,
+                                     PCIDevice *d,
+                                     hwaddr (*ba)[MAX_PS_BUFFERS],
+                                     IGB_BaState *bastate,
+                                     uint32_t cur_buf_len,
+                                     const char *data,
+                                     dma_addr_t data_len)
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
+igb_write_payload_to_rx_buffers(IGBCore *core,
+                                struct NetRxPkt *pkt,
+                                PCIDevice *d,
+                                IGB_PacketRxDMAState *pdma_st,
+                                size_t *copy_size)
+{
+    static const uint32_t fcs_pad;
+    size_t iov_copy;
+
+    /* Copy packet payload */
+    while (*copy_size) {
+        iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
+        igb_write_payload_frag_to_rx_buffers(core, d,
+                                             &pdma_st->ba,
+                                             &pdma_st->bastate,
+                                             pdma_st->rx_desc_packet_buf_size,
+                                             pdma_st->iov->iov_base +
+                                             pdma_st->iov_ofs,
+                                             iov_copy);
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
+        igb_write_payload_frag_to_rx_buffers(core, d,
+                                             &pdma_st->ba,
+                                             &pdma_st->bastate,
+                                             pdma_st->rx_desc_packet_buf_size,
+                                             (const char *) &fcs_pad,
+                                             e1000x_fcs_len(core->mac));
+    }
+}
+
+static void
+igb_write_to_rx_buffers(IGBCore *core,
+                        struct NetRxPkt *pkt,
+                        PCIDevice *d,
+                        IGB_PacketRxDMAState *pdma_st)
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
+    igb_write_payload_to_rx_buffers(core, pkt, d, pdma_st, &copy_size);
+}
+
 static void
 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                           const E1000E_RxRing *rxr,
@@ -1560,91 +1697,58 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
+    IGB_PacketRxDMAState pdma_st = {0};
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
+        memset(&pdma_st.bastate, 0, sizeof(IGB_BaState));
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
+        igb_read_rx_descr(core, &desc, &pdma_st->ba[1], rxi);
 
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
index 82ff195dfc..c4ede22181 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -452,6 +452,7 @@ union e1000_adv_rx_desc {
 #define E1000_SRRCTL_BSIZEHDRSIZE_MASK         0x00000F00
 #define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT        2  /* Shift _left_ */
 #define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF       0x02000000
+#define E1000_SRRCTL_DESCTYPE_HDR_SPLIT        0x04000000
 #define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
 #define E1000_SRRCTL_DESCTYPE_MASK             0x0E000000
 #define E1000_SRRCTL_DROP_EN                   0x80000000
@@ -692,11 +693,12 @@ union e1000_adv_rx_desc {
 
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
index a603468beb..aa65b5452c 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -109,6 +109,9 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
                         E1000_RAH_AV | E1000_RAH_POOL_1 |
                         le16_to_cpu(*(uint16_t *)(address + 4)));
 
+    /* Set supported receive descriptor mode */
+    e1000e_macreg_write(&d->e1000e, E1000_SRRCTL(0), E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);
+
     /* Enable receive */
     e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
-- 
2.25.1


