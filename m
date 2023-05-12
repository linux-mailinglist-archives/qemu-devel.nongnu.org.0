Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB46700C2E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:44:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw8-0005SA-2S; Fri, 12 May 2023 11:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw4-0005QN-Sw
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:44:00 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw0-0007jd-8b
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:44:00 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350euoutp02b701aab844d5f17d6176d0e3acf2c4a5~eb8uM7XRr0202602026euoutp02M
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230512154350euoutp02b701aab844d5f17d6176d0e3acf2c4a5~eb8uM7XRr0202602026euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906230;
 bh=84Izyxtoe0ZLd4hkuj/7JIPXuyS7G7dsSIvL3JsJP94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXroZQZFdd6yNZBiwdQKKRX/+Qdi0HsUDLn96r4aHz3QmhdhAJIOLQlO5MvoVSs8h
 oHJkAZYldsIRpbgg1X+EQvd0ZMlhOQhTq0vCKRTnWcqIv1Pk6kzQmSNp2VDei05JL4
 TComSjtaFmslD53IfV1ib1/r8BvP8BJUyIUtrPVY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230512154350eucas1p280ef48472ee6089ca151cb3c7671b67e~eb8uB_V2I1044910449eucas1p2G;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8E.37.35386.6BE5E546; Fri, 12
 May 2023 16:43:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230512154350eucas1p2904d8c03824462ac4e4a2c5ea2535f61~eb8tqV0ub2921529215eucas1p2i;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350eusmtrp1a517225bd4a16ead9093f43758459c65~eb8tp2OH91971719717eusmtrp1I;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
X-AuditID: cbfec7f4-cc9ff70000028a3a-34-645e5eb64331
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.B6.14344.5BE5E546; Fri, 12
 May 2023 16:43:50 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154349eusmtip14ba9e1fecef7fe7cf38c2ef3b19c5163~eb8tJnsUk2547425474eusmtip1N;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 3/7] igb: RX descriptors guest writting refactoring
Date: Fri, 12 May 2023 17:43:31 +0200
Message-Id: <20230512154335.2536-4-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned1tcXEpBudaJC0+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAaxSX
 TUpqTmZZapG+XQJXRtPEy4wFTcEVz1pWMDUwPrHsYuTkkBAwkVj89Q5zFyMXh5DACkaJGRd/
 MkE4XxglrvTvZIVwPjNK9C/fwAjTcmH+SWYQW0hgOaPEi191EEXtTBIrJ+5jA0mwCZhJPPoy
 D6ibg0NEwFjiY7s4SJhZIFXi6J+DLCC2sICbxPMTrWA2i4CqxI8V85lAbF4BJ4kz21eyQOyS
 l5h56Ts7yBhOAWeJeSuEIEoEJU7OfMICMVJeonnrbLAPJAS2cEicurODDaLXRWL7lhnMELaw
 xKvjW9ghbBmJ05N7oOaXS/w8u40dormFUWLP1MlQRdYSl7b+BLufWUBTYv0ufYiwo8S/Lc3M
 IGEJAT6JG28FIW7gk5i0bTpUmFeio00IolpH4tummWwQYSmJhTfqIMIeEkv3H2WewKg4C8kz
 s5A8Mwth7QJG5lWM4qmlxbnpqcVGeanlesWJucWleel6yfm5mxiByeX0v+NfdjAuf/VR7xAj
 EwfjIUYJDmYlEd63S6JThHhTEiurUovy44tKc1KLDzFKc7AoifNq255MFhJITyxJzU5NLUgt
 gskycXBKNTDZrFK7NWtv7paVnrcuzEw7LZaz7p/kY8f0q3+OXGcXdumO9337RWSCqsWaWrYz
 r0VPsN2VOapwSK//bPh/q2vmz203JqfxzX32puVPzC8djtRVcnXbkiLYubsqrvZ7TWb2Kl1s
 edwz+urTQ+ppDev4L3xf9+jh6705Yl0RHEu/rbkisrKznOHOM4sbHEwcc6SSV35+++y0gn6Y
 bIhb77lw7ZCeEgWuknCj2w3+c7f9XiL9+OpG+RSvirW3446v4tGueSX2eyZnbI2gyKzpnsc2
 ukq3MX2+nqm8yKor7etU/zsO77Q8DUN/iR4Vk37Jdv265IsDL7XdXu+XkJS57dJ/vmib0u6w
 t+sW8p1yud6pxFKckWioxVxUnAgA/8SaNZ0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7rb4uJSDL4uZLL4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GU0TLzMW
 NAVXPGtZwdTA+MSyi5GTQ0LAROLC/JPMXYxcHEICSxkl9u7fygKRkJLY1/OfHcIWlvhzrYsN
 xBYSaGWS+HHeDsRmEzCTePRlHmsXIweHiICpxLO9kiBhZoFMidOv9oGVCwu4STw/0Qo2kkVA
 VeLHivlMIDavgJPEme0roVbJS8y89J0dZAyngLPEvBVCEJucJG72LYAqF5Q4OfMJC8R4eYnm
 rbOZJzAKzEKSmoUktYCRaRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgHGw79nPLDsaVrz7q
 HWJk4mA8xCjBwawkwvt2SXSKEG9KYmVValF+fFFpTmrxIUZToLMnMkuJJucDIzGvJN7QzMDU
 0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoGJoWX+veub2QU5yjqen3l0ad0u
 /mn66RoiRm92Cnufc3cRCOiOYm9KTdrx6Mpn0T9VjwPY7Xu7O34+Kwna3jVHbEex27Rr60KL
 TDZkLouc93HmhRjNLA3tbQfvvp3XXq29XFAh/Z/lB9klDkbZr7YvPFZuv9lSaz9P6/WKlwGs
 lanbmfh0Et3/1lh4P2T+rDI9YXLvyjl9mVkha6eKF8bqHGf6UDo7YEGA9a6Ha74bmmXc3hbB
 +UmmPK/3XtuxdK7rzztPHNRcLre1f7/c/IJXUxTO/m2IfPLS+s/HBLVZfouaPzinnagKXFtl
 tPe90pv6l1orG5u5J880qHtx8SWTTmOrTKrMmduLT1WGPC9WYinOSDTUYi4qTgQAb2TQGwwD
 AAA=
X-CMS-MailID: 20230512154350eucas1p2904d8c03824462ac4e4a2c5ea2535f61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154350eucas1p2904d8c03824462ac4e4a2c5ea2535f61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154350eucas1p2904d8c03824462ac4e4a2c5ea2535f61
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154350eucas1p2904d8c03824462ac4e4a2c5ea2535f61@eucas1p2.samsung.com>
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
 hw/net/igb_core.c   | 176 ++++++++++++++++++++++----------------------
 hw/net/igb_regs.h   |  10 +--
 hw/net/trace-events |   6 +-
 3 files changed, 99 insertions(+), 93 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b6031dea24..774b34fc92 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1281,15 +1281,11 @@ igb_verify_csum_in_sw(IGBCore *core,
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
@@ -1298,7 +1294,6 @@ igb_build_rx_metadata(IGBCore *core,
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
-    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1315,59 +1310,6 @@ igb_build_rx_metadata(IGBCore *core,
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
@@ -1423,43 +1365,106 @@ func_exit:
 static inline void
 igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
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
+        pkt_type |= E1000_ADVRXD_PKT_IP6;
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
 
-    desc->wb.upper.length = cpu_to_le16(length);
+    if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) != 0) {
+        if (rss_info->enabled) {
+            d->wb.lower.hi_dword.rss = cpu_to_le32(rss_info->hash);
+            rss_type = rss_info->type;
+            trace_igb_rx_metadata_rss(d->wb.lower.hi_dword.rss, rss_type);
+        }
+    } else if (hasip4) {
+            d->wb.upper.status_error |= E1000_RXD_STAT_IPIDV;
+            d->wb.lower.hi_dword.csum_ip.ip_id =
+                cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
+            trace_e1000e_rx_metadata_ip_id(d->wb.lower.hi_dword.csum_ip.ip_id);
+    }
+
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
@@ -1468,8 +1473,7 @@ igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
                    uint16_t etqf, bool ts, uint16_t length)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
-                                etqf, ts, length);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
     } else {
         igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
                                etqf, ts, length);
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 82ff195dfc..71a8833229 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -692,11 +692,11 @@ union e1000_adv_rx_desc {
 
 #define E1000_STATUS_NUM_VFS_SHIFT 14
 
-#define E1000_ADVRXD_PKT_IP4 BIT(4)
-#define E1000_ADVRXD_PKT_IP6 BIT(6)
-#define E1000_ADVRXD_PKT_TCP BIT(8)
-#define E1000_ADVRXD_PKT_UDP BIT(9)
-#define E1000_ADVRXD_PKT_SCTP BIT(10)
+#define E1000_ADVRXD_PKT_IP4  BIT(0)
+#define E1000_ADVRXD_PKT_IP6  BIT(2)
+#define E1000_ADVRXD_PKT_TCP  BIT(4)
+#define E1000_ADVRXD_PKT_UDP  BIT(5)
+#define E1000_ADVRXD_PKT_SCTP BIT(6)
 
 static inline uint8_t igb_ivar_entry_rx(uint8_t i)
 {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index e4a98b2c7d..def651c186 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -277,9 +277,9 @@ igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
 igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, bool pfrstd) "Set extended link params: ASD check: %d, Speed select bypass: %d, PF reset done: %d"
 
 igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
-igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
+igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "buffer %u, addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
 
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
 
-- 
2.25.1


