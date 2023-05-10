Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FBB6FD97D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:32:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfFI-0002qe-2t; Wed, 10 May 2023 04:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwfFD-0002qC-6Z
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:32:19 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwfF9-0000ps-U1
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:32:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230510082302euoutp0242d197e0d1faa82532d69c1ac9236a1a~dupSHzoqw1982619826euoutp02K
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:23:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230510082302euoutp0242d197e0d1faa82532d69c1ac9236a1a~dupSHzoqw1982619826euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683706982;
 bh=84Izyxtoe0ZLd4hkuj/7JIPXuyS7G7dsSIvL3JsJP94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FidpPD6AQjgJBjFnToSe8n8D2JPoNjGV+fELA3XWmk0UqdMW2+uCqCApDU4Fyfpd6
 hpqUNe1G2w2icSSFEBKrXHMjeyXtRBkXkqJPbrjtQHOZfsruuZGx2XYjWdPjuvHtn7
 yJjD7ABARCQ3IwfEyYODu3wH9+cxGemtl+QenzH0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230510082302eucas1p125dbe7856900a5eee74b998b90fb35fa~dupRx9vfx0154801548eucas1p1p;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A0.06.37758.6645B546; Wed, 10
 May 2023 09:23:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230510082301eucas1p24152d2c12249f6106410784c561576a3~dupRN3ZCt2134421344eucas1p2s;
 Wed, 10 May 2023 08:23:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230510082301eusmtrp1aeaadef92c8b63485de5ba846df7736d~dupRM7wHg0700807008eusmtrp1l;
 Wed, 10 May 2023 08:23:01 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-16-645b54665b86
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6B.01.10549.5645B546; Wed, 10
 May 2023 09:23:01 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082301eusmtip19a1f8ca2dcef8b06f53f418e80b0eb8e~dupQrDMrE2224722247eusmtip1S;
 Wed, 10 May 2023 08:23:01 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v5 3/6] igb: RX descriptors guest writting refactoring
Date: Wed, 10 May 2023 10:22:51 +0200
Message-Id: <20230510082254.1036-4-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOd20kOgUgw8/RC0+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAaxSX
 TUpqTmZZapG+XQJXRtPEy4wFTcEVz1pWMDUwPrHsYuTkkBAwkTixuJe1i5GLQ0hgBaPEttcX
 GSGcL4wSz1ZdZYFwPjNKnNzwG6iMA6zl+LcoiPhyoKJl76CK2pkk9px6wwYyl03ATOLRl3lg
 DSICxhIf28VBwswCqRJH/xxkAbGFBdwkPp24wwpiswioSmyfOIcZxOYVcJJYdfgDG8R58hIz
 L31nB7E5BZwl9s5pZYWoEZQ4OfMJC8RMeYnmrbOZQW6QENjCIXHo2WdGiGYXiVeH3jFD2MIS
 r45vYYewZSROT+5hgbDLJX6e3cYO0dzCKLFn6mSoImuJS1t/gj3ALKApsX6XPkTYUaJ1WhM0
 IPgkbrwVhLiBT2LStunMEGFeiY42IYhqHYlvm2ayQYSlJBbeqIMIe0jcWb2QaQKj4iwkz8xC
 8swshLULGJlXMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBKaX0/+Of93BuOLVR71DjEwc
 jIcYJTiYlUR4vUOjUoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzatueTBYSSE8sSc1OTS1ILYLJ
 MnFwSjUwydYpv7nlVSf7U2+pmeB94dX/203mtodLhzpLTgoL8OR4Oqtrz+a6njrXS/oBrCv7
 dPOqQhj+boqZb7/EWGCG6qdT8QtOd9SprgrW+P/xMm9hVtK8qR9FXm7UT7O/vnJfz9nI2GTm
 l0/mHnNbaf1J61zIrVcR6YZPJkbEakcZLmUqmrXtZfv53ao3rGxWPnjqMcEqamZ3l9jk4iMB
 0tfumM3eJeg3fbpd5iGpvAqJo6q/xJc4LF+08AoLQ7OyMP+btrd6Ld+vep5Yc9I74TJD1tzv
 zg3lnzkyWEtX2+hb3dHZxLTzso18t4fMssLsqak7V6W7t01LixP6JxDj+097n2r99eYjvOce
 +ap0xlUqsRRnJBpqMRcVJwIAW1efhJ4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7qpIdEpBn3bdSw+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAa5Se
 TVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRtPEy4wF
 TcEVz1pWMDUwPrHsYuTgkBAwkTj+LaqLkYtDSGApo8T0WysZuxg5geJSEvt6/rND2MISf651
 sYHYQgKtTBIz/oiD2GwCZhKPvsxjBZkjImAq8WyvJEiYWSBT4vSrfWDlwgJuEp9O3GEFsVkE
 VCW2T5zDDGLzCjhJrDr8gQ1ivLzEzEvfwVZxCjhL7J3Tygqxykli1oo1UPWCEidnPmGBmC8v
 0bx1NvMERoFZSFKzkKQWMDKtYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyDbcd+bt7BOO/V
 R71DjEwcjIcYJTiYlUR4vUOjUoR4UxIrq1KL8uOLSnNSiw8xmgLdPZFZSjQ5HxiJeSXxhmYG
 poYmZpYGppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTNmNl8zbmz6IHPfdfjzBUVru
 gXfb1meHVeU3KnyU3CJ5oqw/0+G5o9nhnoLD6zNeWEWq+7hNOdejKPAtxCzhlazXc3F9/n5m
 5Xijhb0+J03tFaZa+Sn2NPIZq/vNzH2Td2t694ryZx21l1fGRgcYfTji4cpeF383TiUzsOv1
 g5YKjeQJdz2er15/Orij/BKD8gvNTtX5vxc6Tsh1Kdi39eUTE3/1F43c0WmvnOXUvO52vnoR
 MEklUpGt6eelWN8NMk7++wo7jctXS697XGHGUMb5Ltn94MKos0oHj+xZYXuuqk2tc/OcZ3P8
 1oblKCftT6+982+7XU9l6LGVR+58nnyo79Evjhs5r5adMzmgxFKckWioxVxUnAgAvWXPhwwD
 AAA=
X-CMS-MailID: 20230510082301eucas1p24152d2c12249f6106410784c561576a3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230510082301eucas1p24152d2c12249f6106410784c561576a3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230510082301eucas1p24152d2c12249f6106410784c561576a3
References: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
 <CGME20230510082301eucas1p24152d2c12249f6106410784c561576a3@eucas1p2.samsung.com>
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


