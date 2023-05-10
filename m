Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE36FD928
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:24:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwf6R-0005tN-Uk; Wed, 10 May 2023 04:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6O-0005rs-VF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:12 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6J-0007gg-Ll
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230510082303euoutp02d3829940470164a303366e001cbf1d4d~dupSWqqze1982619826euoutp02L
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:23:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230510082303euoutp02d3829940470164a303366e001cbf1d4d~dupSWqqze1982619826euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683706983;
 bh=+qzP58+yb4joF5Hr6cs0rXbAup14U01FaI9KZTROXvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sT57jiYrGB/fx5+n+OyFHu3z5kAVfGzNfs8jKxJyATk7gWEA7RfITH/n6r/wqqA+m
 uNt2Tns9D3c4tkRkY/Wm/r8kC6zqtpgmXxlf6goItYuWforWbsSDr6g2ILIKeLoyNP
 eS9WyrwgIJWNhVRFKIaqbOhLRrhaRaWhzlCjyYI4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230510082302eucas1p13264f6afae140fa259cc77d70d65c6e5~dupSD3Efu0091000910eucas1p12;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B9.B3.42423.6645B546; Wed, 10
 May 2023 09:23:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082302eucas1p10d4117c6329d8376d8fc883c6c887083~dupRry18A0603006030eucas1p1c;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230510082302eusmtrp11233b0618fe51d7556cda09a927ed756~dupRq-qZY0700807008eusmtrp1n;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-5e-645b5466c048
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7C.01.10549.6645B546; Wed, 10
 May 2023 09:23:02 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082301eusmtip1f4cdd0f41863742ef49575c86f13511c~dupRKKrt72222822228eusmtip1K;
 Wed, 10 May 2023 08:23:01 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v5 4/6] igb: RX payload guest writting refactoring
Date: Wed, 10 May 2023 10:22:52 +0200
Message-Id: <20230510082254.1036-5-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd20kOgUgyMH1C0+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAaxSX
 TUpqTmZZapG+XQJXxvI1c1kK9qVXnD/Vz97AuNupi5GTQ0LAROLQt2XsXYxcHEICKxgluqcu
 YYJwvjBK/DvzmR2kSkjgM6PEglUGMB0/Vx1jhChaziix4tUsFginnUni0eO3bCBVbAJmEo++
 zGPtYuTgEBEwlvjYLg4SZhZIlTj65yALiC0s4CTxe1svM0gJi4CqxKxWWxCTFyjc2p8OsUpe
 Yual72AncAo4S+yd08oKYvMKCEqcnPmEBWKivETz1tnMEPVbOCRONipB2C4Smx/OYoKwhSVe
 Hd/CDmHLSJye3MMCYZdL/Dy7Dex5CYEWRok9UydDFVlLXNr6E+x6ZgFNifW79CHCjhJHP78C
 u1hCgE/ixltBiBP4JCZtmw4V5pXoaBOCqNaR+LZpJhtEWEpi4Y06iLCHRNPUVewTGBVnIfll
 FpJfZiGsXcDIvIpRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMwsZz+d/zTDsa5rz7qHWJk
 4mA8xCjBwawkwusdGpUixJuSWFmVWpQfX1Sak1p8iFGag0VJnFfb9mSykEB6YklqdmpqQWoR
 TJaJg1OqgamIq/7WCZWoWxYCJ9jr7laulXCJ3SUUljDR9Up2j1zNpamfMjR/st7o4Z1XLb3/
 eOVbmePWDxvufOTua/nOp23us+6clDGPgggn+2nfbunmrelferc8f3N7rVbzWe+0n52bdLy5
 frEUKL6Z+ObWA4vpC2LU14taCxr+bHJfeJB9Z+y9drVrG7ZLfFY/wvAn5+XJ8/vaPZqzJt66
 /l+r+LFY5erAhIaJ5//+Yt0zSbxAYrr+rGsPnvPOmfBC8rp/5/HQQ5z7tRU5O/uTHUPzGeZu
 6b5/9U6ZwOO3qavZ3xaYdq9T/f1l15n4f6JROzddl6k43e2zKL56X6n8FrYnZ5fnJtq4fJx+
 oHTtqlqDh+5KLMUZiYZazEXFiQA+KmrUmwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7ppIdEpBpeP8Ft8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jOVr5rIU
 7EuvOH+qn72BcbdTFyMnh4SAicTPVccYuxi5OIQEljJKbHm+kQkiISWxr+c/O4QtLPHnWhcb
 RFErk8SfNw9ZQRJsAmYSj77MA7I5OEQETCWe7ZUECTMLZEqcfrWPDcQWFnCS+L2tlxmkhEVA
 VWJWqy2IyQsUbu1Ph5guLzHz0newTZwCzhJ757SCDRcCKpm1Yg0ziM0rIChxcuYTFojp8hLN
 W2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAONh27OfmHYzzXn3U
 O8TIxMF4iFGCg1lJhNc7NCpFiDclsbIqtSg/vqg0J7X4EKMp0NUTmaVEk/OBkZhXEm9oZmBq
 aGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cA0o1vAqCDqptEmhvq1YiayyR9X
 lQndjb+nsfjo276Jf4578N7Yy73PIjNwCrvg8ekbrkSsXVn69d9O5hvnVfxDDFLPd7Qv3CzH
 x+AlXJSTcSxH4N85bjv1IOULKzQtHp30/W/XfbEiqo7t+R3OxB/HtAJ7z+8OlZ+ffbqhUvLX
 +bytLA+CF7g0S8oGFp+1sXhw2E1vvkbt4pfCLDc6uzieuVvENi76V2+6QfEzu+WlH1q7eUKF
 FDTyHjWEBGS8DpuQv074/ucn8icTjD81ffGey3xi9+IjHz0fed5wan8XXRnRqR74YNaXF3al
 3/sCD2+a8+LuehOrf79tV+gu0zZKjXw3nVXlzMHgb8dyVmcqsRRnJBpqMRcVJwIAbFQ4ugwD
 AAA=
X-CMS-MailID: 20230510082302eucas1p10d4117c6329d8376d8fc883c6c887083
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230510082302eucas1p10d4117c6329d8376d8fc883c6c887083
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230510082302eucas1p10d4117c6329d8376d8fc883c6c887083
References: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
 <CGME20230510082302eucas1p10d4117c6329d8376d8fc883c6c887083@eucas1p1.samsung.com>
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


