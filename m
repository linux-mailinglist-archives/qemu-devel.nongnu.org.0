Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65D700C37
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:45:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw6-0005R7-Bx; Fri, 12 May 2023 11:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw2-0005Nt-6G
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:58 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUvy-0007je-C9
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:57 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154351euoutp02074928790f092aff413d7983757c5a43~eb8uqd71w0202802028euoutp027
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230512154351euoutp02074928790f092aff413d7983757c5a43~eb8uqd71w0202802028euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906231;
 bh=+qzP58+yb4joF5Hr6cs0rXbAup14U01FaI9KZTROXvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rjdFlqxXjV5lY15MUJlCZwGJhf8MGX675UIUhyLUH2Mzo/6E03LbKV+3+kg5wH5q9
 HzIjFIVptG8d84zCf6FbxoSfLvwuJwps18X2HPw/waepUWkkZA9gFIfVnsLbxTuU3j
 LiAJDx3FR1QpgRg9KBui2VOsYJrN8Sya/V4KyWeE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230512154350eucas1p24068d671ea3d26a15d61ec1902f9fdf4~eb8ub0-m22976529765eucas1p2j;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.2C.42423.6BE5E546; Fri, 12
 May 2023 16:43:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230512154350eucas1p2c37ab67b720c459a6990e426f8344291~eb8uJxNcB3014230142eucas1p2w;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350eusmtrp1bfcf47d13cce7c9522b72ff83c0162d1~eb8uJRfo81998019980eusmtrp11;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-9d-645e5eb6926e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B3.B6.14344.6BE5E546; Fri, 12
 May 2023 16:43:50 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154350eusmtip1b940b426a324ab1bcfb7abc58cbd6026~eb8toADOH1630116301eusmtip1F;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 4/7] igb: RX payload guest writting refactoring
Date: Fri, 12 May 2023 17:43:32 +0200
Message-Id: <20230512154335.2536-5-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned1tcXEpBl/2GFt8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujOVr5rIU7EuvOH+qn72BcbdTFyMnh4SAiUTzxu2sXYxcHEICKxglTi7Z
 BOV8YZQ4vHYfE4TzmVFi0vEZzF2MHGAt27awQcSXM0qs/P2EGcJpZ5I43tLGBDKXTcBM4tGX
 eawgDSICxhIf28VBwswCqRJH/xxkAbGFBZwkDty7yQ5iswioShz7v4MRxOYFil9s2sMCcZ68
 xMxL39lBxnAKOEvMWyEEUSIocXLmExaIkfISzVtng50gIbCFQ+LEnQ3sEL0uEvevvmaEsIUl
 Xh3fAhWXkTg9uQdqfrnEz7Pb2CGaWxgl9kydDFVkLXFp60+w+5kFNCXW79KHCDtKHF6zlRUS
 DnwSN94KQtzAJzFp23Ro8PBKdLQJQVTrSHzbNJMNIiwlsfBGHUTYQ+LmzZmMExgVZyF5ZhaS
 Z2YhrF3AyLyKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMLmc/nf80w7Gua8+6h1iZOJg
 PMQowcGsJML7dkl0ihBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFebduTyUIC6YklqdmpqQWpRTBZ
 Jg5OqQamLmUH93lG7AfKWsquXM+tV7ucX8ucNjnJbTtzZpDYxW2vec8IPdD9Y5W26rXDa3nv
 3Wrsx3J1bueYO8vb1r35vi2c2S1J1XfW23+3DBMmHeDL9fGu/NH1sbXQ4bJf1SN+acYtP/RM
 Zt3e8ZqnY0YAOzvbq/yiYoOSPOsjWzfqqCrHqadtzpYM2NNyJyvTZL9IYOq3BZ+3MCx5wPjX
 K9/t0svlbSH/vnP53k6a1dFv1PfE6nDOvfJbds5zTl9RjXOVbJrlf5UxWeXSs1cmV1N6qw8o
 Fn+b++jU5NQrX5qlPV9EN2h939EzT759D8tMyZSbcXJ7smPF9y97OEukzEV9R3fnhbeuGh2v
 OibuXa3EUpyRaKjFXFScCAB9YvrknQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7rb4uJSDDbMV7T4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GcvXzGUp
 2Jdecf5UP3sD426nLkYODgkBE4ltW9i6GLk4hASWMko8OnuEuYuREyguJbGv5z87hC0s8eda
 F1RRK5NE75aVYEVsAmYSj77MYwUZJCJgKvFsryRImFkgU+L0q31sILawgJPEgXs3weawCKhK
 HPu/gxHE5gWKX2zawwIxX15i5qXv7CBjOAWcJeatEAIJCwGV3OxbwARRLihxcuYTFojx8hLN
 W2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAONh27OeWHYwrX33U
 O8TIxMF4iFGCg1lJhPftkugUId6UxMqq1KL8+KLSnNTiQ4ymQGdPZJYSTc4HRmJeSbyhmYGp
 oYmZpYGppZmxkjivZ0FHopBAemJJanZqakFqEUwfEwenVANTzFu9bzsCsvuD1u6/E/0oaIfe
 3cqTd3m1C787FbQm8Igdk5rHXeMRk7dprefEI2t23y9gaTo67VXJ8qrjh7+VXi4XVTlofv2o
 y6evCmnRpf32nxay7vy8wHrWvr/p71rW/G17GRuVeObRfV2J/8omkib9VrNWfYr7fS1Hor7k
 s+8F69RP9pNuRqc5sGbnzbvvvkpdNyWCc33bs3X7+p4GfXr/wPh5v5BNKI/7qfhqI8YL/29k
 XahrfHDc52xApChbz8J81pjFE+z9JmgV7zDZdDB8z+MqrRP+k5qlAi1vFLjNZDj6yuHJEpVg
 mxC2jXaZi5PnO6Wx7/buWysnE/VEyuS3Rnaa8pEQqXnXpzMpsRRnJBpqMRcVJwIA7GoM0AwD
 AAA=
X-CMS-MailID: 20230512154350eucas1p2c37ab67b720c459a6990e426f8344291
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154350eucas1p2c37ab67b720c459a6990e426f8344291
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154350eucas1p2c37ab67b720c459a6990e426f8344291
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154350eucas1p2c37ab67b720c459a6990e426f8344291@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Refactoring is done in preparation for support of multiple advanced
descriptors RX modes, especially packet-split modes.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/e1000e_core.c     |  18 ++--
 hw/net/igb_core.c        | 216 +++++++++++++++++++++++++--------------
 tests/qtest/libqos/igb.c |   5 +
 3 files changed, 153 insertions(+), 86 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b2e54fe802..f9ff31fd70 100644
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
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 774b34fc92..0eabe7106e 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -941,6 +941,14 @@ igb_has_rxbufs(IGBCore *core, const E1000ERingInfo *r, size_t total_size)
                          bufsize;
 }
 
+static uint32_t
+igb_get_queue_rx_header_buf_size(IGBCore *core, const E1000ERingInfo *r)
+{
+    uint32_t srrctl = core->mac[E1000_SRRCTL(r->idx) >> 2];
+    return (srrctl & E1000_SRRCTL_BSIZEHDRSIZE_MASK) >>
+           E1000_SRRCTL_BSIZEHDRSIZE_SHIFT;
+}
+
 void
 igb_start_recv(IGBCore *core)
 {
@@ -1231,6 +1239,21 @@ igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
     *buff_addr = le64_to_cpu(desc->read.pkt_addr);
 }
 
+typedef struct IGBPacketRxDMAState {
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
+    uint16_t written;
+    hwaddr ba;
+} IGBPacketRxDMAState;
+
 static inline void
 igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
                   hwaddr *buff_addr)
@@ -1512,19 +1535,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
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
 igb_update_rx_stats(IGBCore *core, const E1000ERingInfo *rxi,
                     size_t pkt_size, size_t pkt_fcs_size)
@@ -1550,6 +1560,93 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000ERingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
+static void
+igb_truncate_to_descriptor_size(IGBPacketRxDMAState *pdma_st, size_t *size)
+{
+    if (*size > pdma_st->rx_desc_packet_buf_size) {
+        *size = pdma_st->rx_desc_packet_buf_size;
+    }
+}
+
+static void
+igb_write_payload_frag_to_rx_buffers(IGBCore *core,
+                                     PCIDevice *d,
+                                     hwaddr ba,
+                                     uint16_t *written,
+                                     uint32_t cur_buf_len,
+                                     const char *data,
+                                     dma_addr_t data_len)
+{
+    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
+    pci_dma_write(d, ba + *written, data, data_len);
+    *written += data_len;
+}
+
+static void
+igb_write_payload_to_rx_buffers(IGBCore *core,
+                                struct NetRxPkt *pkt,
+                                PCIDevice *d,
+                                IGBPacketRxDMAState *pdma_st,
+                                size_t *copy_size)
+{
+    static const uint32_t fcs_pad;
+    size_t iov_copy;
+
+    /* Copy packet payload */
+    while (*copy_size) {
+        iov_copy = MIN(*copy_size, pdma_st->iov->iov_len - pdma_st->iov_ofs);
+        igb_write_payload_frag_to_rx_buffers(core, d,
+                                             pdma_st->ba,
+                                             &pdma_st->written,
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
+                                             pdma_st->ba,
+                                             &pdma_st->written,
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
+                        IGBPacketRxDMAState *pdma_st)
+{
+    size_t copy_size;
+
+    if (!pdma_st->ba) {
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
+    igb_write_payload_to_rx_buffers(core, pkt, d, pdma_st, &copy_size);
+}
+
 static void
 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                           const E1000E_RxRing *rxr,
@@ -1559,91 +1656,54 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
-    const E1000ERingInfo *rxi = rxr->i;
-    size_t bufsize = igb_rxbufsize(core, rxi);
-
+    const E1000ERingInfo *rxi;
+    size_t rx_desc_len;
+
+    IGBPacketRxDMAState pdma_st = {0};
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
+        pdma_st.written = 0;
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
+        igb_read_rx_descr(core, &desc, &pdma_st.ba);
 
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
 
         igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
-                           rss_info, etqf, ts, written);
-        igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_len);
-
-        igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-
-    } while (desc_offset < total_size);
+                           rss_info, etqf, ts, pdma_st.written);
+        pci_dma_write(d, base, &desc, rx_desc_len);
+        igb_ring_advance(core, rxi,
+                         rx_desc_len / E1000_MIN_RX_DESC_LEN);
+    } while (pdma_st.desc_offset < pdma_st.total_size);
 
-    igb_update_rx_stats(core, rxi, size, total_size);
+    igb_update_rx_stats(core, rxi, pdma_st.size, pdma_st.total_size);
 }
 
 static bool
diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index a603468beb..f40c4ec4cd 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -109,6 +109,11 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
                         E1000_RAH_AV | E1000_RAH_POOL_1 |
                         le16_to_cpu(*(uint16_t *)(address + 4)));
 
+    /* Set supported receive descriptor mode */
+    e1000e_macreg_write(&d->e1000e,
+                        E1000_SRRCTL(0),
+                        E1000_SRRCTL_DESCTYPE_ADV_ONEBUF);
+
     /* Enable receive */
     e1000e_macreg_write(&d->e1000e, E1000_RFCTL, E1000_RFCTL_EXTEN);
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, E1000_RCTL_EN);
-- 
2.25.1


