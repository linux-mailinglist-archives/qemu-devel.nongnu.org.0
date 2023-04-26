Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EFE6EF82A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:10:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhhw-0005jE-S5; Wed, 26 Apr 2023 12:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1prhhu-0005iW-PG
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:09:26 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1prhhr-0003PG-53
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:09:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230426160917euoutp0148f97ec068c4fe290363215e33c0df3d~Zh_Xi5-Iv1620316203euoutp01L
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 16:09:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230426160917euoutp0148f97ec068c4fe290363215e33c0df3d~Zh_Xi5-Iv1620316203euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682525357;
 bh=z4pjaI4+aZP3+NcLIJstVI7bfBNhxSPnTmabI8S2MQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W2XwT6xSjiyyQQI3eMPtYPqEHZ1y0UJzk8GWxiOHqren713LMNpL05YF65/6sp9kM
 IJfR4ysa2kU9X3hlhGdYDJiAdrZygEfjtBhSWSwzqWK9Zy520Dcx70AHBE+ZLXlHcC
 t2ALGMPZf4CFSXB/x9nh74on5s4SMlT7trh7IER4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230426160917eucas1p2c8454de51c16895a52ea3a3507c94ea1~Zh_XZ9CJQ1950519505eucas1p2Y;
 Wed, 26 Apr 2023 16:09:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 3E.CD.35386.CAC49446; Wed, 26
 Apr 2023 17:09:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230426160916eucas1p2a9f07116874f48057ff0c2128c34e85d~Zh_W_SBMF2039420394eucas1p2U;
 Wed, 26 Apr 2023 16:09:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230426160916eusmtrp2f0b292d4f0541c5e019a00117599c0ff~Zh_W90xGk2767227672eusmtrp2t;
 Wed, 26 Apr 2023 16:09:16 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-c7-64494cacdc60
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7A.46.10549.CAC49446; Wed, 26
 Apr 2023 17:09:16 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230426160915eusmtip2fa5f3a9929d2039ebdf31ccb9780f695~Zh_WQp1Tv3167331673eusmtip2L;
 Wed, 26 Apr 2023 16:09:15 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: jasowang@redhat.com, k.kwiecien@samsung.com, m.sochacki@samsung.com
Subject: [PATCH v2 2/2] igb: packet-split descriptors support
Date: Wed, 26 Apr 2023 18:09:08 +0200
Message-Id: <20230426160908.4768-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426160908.4768-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsWy7djP87prfTxTDPbbWHw+tZbdYtmlz0wW
 jfPnsFpsvfqD3eJ47w4WB1aPE28Psno8ubaZyeP9vqtsHn1bVjEGsERx2aSk5mSWpRbp2yVw
 ZSx8tYm9YFpSRf+juWwNjAeduxg5OSQETCTuNh9mBLGFBFYwSpx4ytzFyAVkf2GU+LfsEpTz
 mVFi+ddX7DAds+9+YIJILGeUOLD/IFR7O5PEz0X1IDabgJnEoy/zWLsYOThEBIwlPraLg4SZ
 Bdwllq+6wApiCwvYSlx4swCslUVAVWLO2bNgcV4BJ4mZ2xoZIXbJS8y89B1sL6eAs8T8FXuY
 IWoEJU7OfMICMVNeonnrbLBDJQQWckisv/yYDaLZRWLatf8sELawxKvjW6AekJH4v3M+E4Rd
 LvHz7DZ2iOYWRok9UydDFVlLXNr6E+wBZgFNifW79CHCjhLnercxgYQlBPgkbrwVhLiBT2LS
 tunMEGFeiY42IYhqHYlvm2ayQYSlJBbeqIMIe0j87p3DNIFRcRaSZ2YheWYWwtoFjMyrGMVT
 S4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAtPI6X/Hv+xgXP7qo94hRiYOxkOMEhzMSiK8vJXu
 KUK8KYmVValF+fFFpTmpxYcYpTlYlMR5tW1PJgsJpCeWpGanphakFsFkmTg4pRqYZnWuFLY3
 TLi7UM0tmPHY9c+Z0wKPNFba6hfnH94y86+GTMH3Bo25KUv6jhrNs58g6PVDJWwxW9mp3wdZ
 c3yW309TerHjfvx/S8lrwffuLfkQbbf/z42v9/ccv5Qutm2D5Xzuu7GaZSy5m3OOaE1jYOSL
 Nv3yhGfBcZ0ZGedulhefnecTcMCQZXHm02efp94STjhxI3BhnP4yn9czZR8pF7u8Em1wCb/J
 KRQf4n9K6o7Yfff0a4Wzt2gGbV1grHLA50XUeVkzh94r5/a/WsX55svGv1xMDn3azen+MxUq
 7vczbd0+J//cuxVf5mYW2aScq2FhCrBdZ16xxDmk7Wx+7OMnk7tmxja18Wx28IoMVWIpzkg0
 1GIuKk4EAIkn3u6SAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsVy+t/xe7prfDxTDI7OVrT4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLA6sHifeHmT1eHJtM5PH+31X2Tz6tqxiDGCJ0rMpyi8tSVXIyC8u
 sVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtY+GoTe8G0pIr+R3PZGhgP
 OncxcnJICJhIzL77gamLkYtDSGApo8SpN4fZIRJSEvt6/kPZwhJ/rnWxQRS1Mkns/d7JBpJg
 EzCTePRlHmsXIweHiICpxLO9kiBhZgFviR8fNoD1CgvYSlx4s4ARxGYRUJWYc/YsK4jNK+Ak
 MXNbIyPEfHmJmZe+g9VzCjhLzF+xhxnEFgKq+XbzJzNEvaDEyZlPWCDmy0s0b53NPIFRYBaS
 1CwkqQWMTKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECw37bsZ+bdzDOe/VR7xAjEwfjIUYJ
 DmYlEV7eSvcUId6UxMqq1KL8+KLSnNTiQ4ymQHdPZJYSTc4HRl5eSbyhmYGpoYmZpYGppZmx
 kjivZ0FHopBAemJJanZqakFqEUwfEwenVANTS/asnPhLJmzt6fyys283uD52lwx4bPTgjKko
 zwnNv69WMzknLWvjKdW4G1rZ0yHoKr7qfc8kj8uSu7WFbh85EjJvG4PDN49nvD5OP5Z/qd2U
 dNrUeo+g2Fa+dsVc8SjbCMUKB7eM0w7J/8wiw1R2vzNccqNTznn+5M/G1+pTdnmxPyjT/bVX
 f5tJoOmpNlOd1cpBsS86K3Yu+hS2oqw6eoHjVWGpuJa3U3dov6sW/aX83PD40XWvTgqqLm/b
 wDvdI5grxfzG9Pj+NYen9HX+v3xGeXKeR8NutS+fJCazO3Vrcyu0bPJVrBKde/ebrq2xt+CN
 HL0VS6oNL385VXh6P2u2QaeA77yp7Ell25RYijMSDbWYi4oTAaROhakEAwAA
X-CMS-MailID: 20230426160916eucas1p2a9f07116874f48057ff0c2128c34e85d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230426160916eucas1p2a9f07116874f48057ff0c2128c34e85d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230426160916eucas1p2a9f07116874f48057ff0c2128c34e85d
References: <20230426160908.4768-1-t.dzieciol@partner.samsung.com>
 <CGME20230426160916eucas1p2a9f07116874f48057ff0c2128c34e85d@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
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

Packet-split descriptors are used by Linux VF driver for MTU values from 2048
---
 hw/net/igb_core.c | 236 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 231 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 47c4a16e84..de54ddb5fe 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -282,6 +282,14 @@ igb_rx_queue_desctyp_get(IGBCore *core, const E1000E_RingInfo *r)
     return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
 }
 
+static inline bool
+igb_rx_use_ps_descriptor(IGBCore *core, const E1000E_RingInfo *r)
+{
+    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
+    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT ||
+           desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
+}
+
 static inline bool
 igb_rss_enabled(IGBCore *core)
 {
@@ -1245,6 +1253,14 @@ igb_read_adv_rx_single_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
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
                   hwaddr buff_addr[MAX_PS_BUFFERS],
@@ -1258,7 +1274,13 @@ igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
         return;
     }
 
-    /* modes other than advanced single buffer descriptor not supported */
+    /* advanced header split descriptor */
+    if (igb_rx_use_ps_descriptor(core, r)) {
+        igb_read_adv_rx_split_buf_descr(core, &desc->adv, &buff_addr[0]);
+        return;
+    }
+
+    /* descriptor replication modes not supported */
     desc_type = igb_rx_queue_desctyp_get(core, r);
     if (desc_type != E1000_SRRCTL_DESCTYPE_ADV_ONEBUF) {
         trace_igb_wrn_rx_desc_modes_not_supp(desc_type);
@@ -1410,6 +1432,19 @@ igb_write_lgcy_rx_descr(IGBCore *core,
     d->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
+typedef struct IGB_SplitDescriptorData_st {
+    bool sph;
+    bool hbo;
+    size_t hdr_len;
+} IGB_SplitDescriptorData;
+
+static inline bool
+igb_rx_ps_descriptor_split_always(IGBCore *core, const E1000E_RingInfo *r)
+{
+    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
+    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
+}
+
 static uint16_t
 igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
 {
@@ -1495,6 +1530,43 @@ igb_write_adv_rx_descr(IGBCore *core,
     d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
 }
 
+static inline void
+igb_write_adv_ps_split_rx_descr(IGBCore *core,
+                                union e1000_adv_rx_desc *d,
+                                struct NetRxPkt *pkt,
+                                const E1000E_RSSInfo *rss_info,
+                                const E1000E_RingInfo *r,
+                                uint16_t etqf,
+                                bool ts,
+                                IGB_SplitDescriptorData *ps_desc_data,
+                                uint16_t(*written)[MAX_PS_BUFFERS])
+{
+    size_t pkt_len;
+    size_t hdr_len = ps_desc_data->hdr_len;
+
+    bool split_always = igb_rx_ps_descriptor_split_always(core, r);
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
+    igb_write_adv_rx_descr(core, d, pkt, rss_info, etqf, ts, pkt_len);
+
+    d->wb.lower.lo_dword.hdr_info = (hdr_len << RX_DESC_ADV_HDR_LEN_OFFSET) &
+                                    RX_DESC_ADV_HDR_LEN_MASK;
+    d->wb.lower.lo_dword.hdr_info |= ps_desc_data->sph ? RX_DESC_ADV_HDR_SPH
+                                                       : 0;
+    d->wb.upper.status_error |= ps_desc_data->hbo ?
+                                    RX_DESC_ADV_ST_ERR_HBO_OFFSET : 0;
+}
+
 static inline void
 igb_write_rx_descr(IGBCore *core,
                    union e1000_rx_desc_union *desc,
@@ -1502,13 +1574,18 @@ igb_write_rx_descr(IGBCore *core,
                    const E1000E_RSSInfo *rss_info,
                    uint16_t etqf,
                    bool ts,
+                   IGB_SplitDescriptorData *ps_desc_data,
                    uint16_t(*written)[MAX_PS_BUFFERS],
                    const E1000E_RingInfo *r)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
         igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, (*written)[1]);
+    } else if (igb_rx_use_ps_descriptor(core, r)) {
+        igb_write_adv_ps_split_rx_descr(core, &desc->adv, pkt, rss_info, r,
+                                        etqf, ts, ps_desc_data, written);
     } else {
-        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, etqf, ts, (*written)[1]);
+        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
+                               etqf, ts, (*written)[1]);
     }
 }
 
@@ -1569,6 +1646,78 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
+static bool
+igb_do_ps(IGBCore *core,
+          const E1000E_RingInfo *r,
+          struct NetRxPkt *pkt,
+          size_t *hdr_len,
+          IGB_SplitDescriptorData *ps_desc_data)
+{
+    bool hasip4, hasip6;
+    EthL4HdrProto l4hdr_proto;
+    bool fragment;
+    bool split_always;
+    size_t bheader_size;
+    size_t total_pkt_len;
+
+    if (!igb_rx_use_ps_descriptor(core, r)) {
+        return false;
+    }
+
+    memset(ps_desc_data, 0, sizeof(IGB_SplitDescriptorData));
+
+    total_pkt_len = net_rx_pkt_get_total_len(pkt);
+    bheader_size = igb_get_queue_rx_header_buf_size(core, r);
+    split_always = igb_rx_ps_descriptor_split_always(core, r);
+    if (split_always && total_pkt_len <= bheader_size) {
+        *hdr_len = total_pkt_len;
+        ps_desc_data->hdr_len = total_pkt_len;
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
+        ps_desc_data->hdr_len = bheader_size;
+        goto header_not_handled;
+    }
+
+    if (fragment && (core->mac[RFCTL] & E1000_RFCTL_IPFRSP_DIS)) {
+        ps_desc_data->hdr_len = bheader_size;
+        goto header_not_handled;
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
+    ps_desc_data->hdr_len = *hdr_len;
+
+    if (*hdr_len > bheader_size) {
+        ps_desc_data->hbo = true;
+        goto header_not_handled;
+    }
+
+    return true;
+
+header_not_handled:
+    if (split_always) {
+        *hdr_len = bheader_size;
+        return true;
+    }
+
+    return false;
+}
+
 typedef struct igb_ba_state_st {
     uint16_t written[MAX_PS_BUFFERS];
     uint8_t cur_idx;
@@ -1584,6 +1733,7 @@ typedef struct {
     uint32_t rx_desc_header_buf_size;
     struct iovec *iov;
     size_t iov_ofs;
+    bool do_ps;
     bool is_first;
     igb_ba_state bastate;
     hwaddr ba[MAX_PS_BUFFERS];
@@ -1592,11 +1742,74 @@ typedef struct {
 static void
 igb_truncate_to_descriptor_size(igb_packet_tx_dma_state *pdma_st, size_t *size)
 {
-    if (*size > pdma_st->rx_desc_packet_buf_size) {
-        *size = pdma_st->rx_desc_packet_buf_size;
+    if (pdma_st->do_ps && pdma_st->is_first) {
+        if (*size > pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len) {
+            *size = pdma_st->rx_desc_packet_buf_size + pdma_st->ps_hdr_len;
+        }
+    } else {
+        if (*size > pdma_st->rx_desc_packet_buf_size) {
+            *size = pdma_st->rx_desc_packet_buf_size;
+        }
     }
 }
 
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
+                                   igb_packet_tx_dma_state *pdma_st,
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
 static void
 igb_write_payload_to_rx_buffers(IGBCore *core,
                                 PCIDevice *d,
@@ -1695,7 +1908,14 @@ igb_write_to_rx_buffers(IGBCore *core,
     igb_truncate_to_descriptor_size(pdma_st, &pdma_st->desc_size);
     copy_size = pdma_st->size - pdma_st->desc_offset;
     igb_truncate_to_descriptor_size(pdma_st, &copy_size);
-    pdma_st->bastate.cur_idx = 1;
+
+    /* For PS mode copy the packet header first */
+    if (pdma_st->do_ps) {
+        igb_write_packet_hdr_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
+    } else {
+        pdma_st->bastate.cur_idx = 1;
+    }
+
     igb_write_packet_payload_to_descr_addr(core, pkt, d, pdma_st, &copy_size);
 }
 
@@ -1710,6 +1930,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     union e1000_rx_desc_union desc;
     const E1000E_RingInfo *rxi;
     size_t rx_desc_len;
+    IGB_SplitDescriptorData ps_desc_data;
 
     igb_packet_tx_dma_state pdma_st = {0};
     pdma_st.is_first = true;
@@ -1728,6 +1949,10 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
         d = core->owner;
     }
 
+    pdma_st.do_ps = igb_do_ps(core, rxi, pkt,
+                              &pdma_st.ps_hdr_len,
+                              &ps_desc_data);
+
     do {
         memset(&pdma_st.bastate, 0, sizeof(igb_ba_state));
         bool is_last = false;
@@ -1752,6 +1977,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                            is_last ? pkt : NULL,
                            rss_info,
                            etqf, ts,
+                           &ps_desc_data,
                            &pdma_st.bastate.written,
                            rxi);
         pci_dma_write(d, base, &desc, rx_desc_len);
-- 
2.25.1


