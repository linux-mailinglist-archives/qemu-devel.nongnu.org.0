Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46E16F0473
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:48:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przAN-0004TZ-JM; Thu, 27 Apr 2023 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAK-0004Sy-9E
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1przAH-00031Q-3u
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:47:55 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230427104751euoutp0201bd1548065cda96659d4a293581b715~ZxPAf7YrV3090930909euoutp02k
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 10:47:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230427104751euoutp0201bd1548065cda96659d4a293581b715~ZxPAf7YrV3090930909euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682592471;
 bh=QcDMsFTgCr1dsk0fQ7TiEvs8rxp8AvT+zDzqWu/6HEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rsi3sLemBmZTVzrB23zm3KdgC/cddwF6z6N5POqGI/H739p6fmzsEFopBeEHsk9Yt
 lA60Vk4BhDgP2YFc/SQL5FVc0MYP7sqn7BdBIhRxG2BkP2kXJWvBjyoVJPk1NHhbyk
 GBGxjoyHpi41SeDSpRXeL1zJIfjUGzOO/2gZPAPk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230427104751eucas1p1778125d6f90697de572d97ca7abf37a5~ZxPAWXn123060930609eucas1p11;
 Thu, 27 Apr 2023 10:47:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C8.A8.42423.7D25A446; Thu, 27
 Apr 2023 11:47:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104750eucas1p1eb8fb7fac00cc13dea5e4a7e0df5c113~ZxPABnyDd0235402354eucas1p12;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230427104750eusmtrp147fadf7d5db160e5a9fab13ae0ba40dc~ZxPABFQX91482414824eusmtrp1i;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-62-644a52d7b74c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 95.70.10549.6D25A446; Thu, 27
 Apr 2023 11:47:50 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230427104750eusmtip1c755d742975f46a1ea38f1ee3300673d~ZxO-iIObU2763827638eusmtip1E;
 Thu, 27 Apr 2023 10:47:50 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v3 2/2] igb: packet-split descriptors support
Date: Thu, 27 Apr 2023 12:47:43 +0200
Message-Id: <20230427104743.9072-3-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned3rQV4pBjt2cVh8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujKa9JxkLFpVVTNkxl62B8VBQFyMnh4SAicSSWY2MXYxcHEICKxglmv43
 MoEkhAS+MEosaIqGSHxmlNh5o5eti5EDrOPvt1iI+HJGiZb/u5kgnHYmif43p1lAutkEzCQe
 fZnHCtIgImAs8bFdHCTMLJAqcfTPQbASYQFbiZb1L9hBbBYBVYnre38yg9i8Ak4SJ1bMZIG4
 Tl5i5qXvYDWcAs4SjV8nQ9UISpyc+YQFYqa8RPPW2cwgN0gIbOGQuPb3KztEs4vE+i/3mCFs
 YYlXx7dAxWUkTk/ugVpQLvHz7DZ2iOYWRok9UydDFVlLXNr6E+wBZgFNifW79CHCjhLHm26z
 QwKCT+LGW0GIG/gkJm2bzgwR5pXoaBOCqNaR+LZpJjTYpCQW3qiDCHtITOs+yz6BUXEWkmdm
 IXlmFsLaBYzMqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQKTy+l/xz/tYJz76qPeIUYm
 DsZDjBIczEoivLyV7ilCvCmJlVWpRfnxRaU5qcWHGKU5WJTEebVtTyYLCaQnlqRmp6YWpBbB
 ZJk4OKUamBhr21a3aZRHz5cpluJaX+USyn6v/VWzxOSYnqvPVFw7DqxZVWD/b27v9Fm8d73F
 5y1Yc/5N3+d7V8STP27SsUguuht/Stx4uZHD2ttFVy/s4LM79qxibw9fuolSTXnDn3Vasduc
 nwR8eyJvGL/4HOOa7pyI2R9fS4qWxLYkvDGzX3zUV3jDY3+xh/n7D/XN9pU9/mn7QWa99sUr
 vqroB0ZNTyxyrHvZsepeYFvy+cgFJ9lYDj4tYHSqzVL87CPhZeaQaHXsC/ft3usnz7U++/Wo
 9cO7029VDu7wm53fYnD3REJM4EdNK82pzy3/X7XPajJkbXet4Ph2bKqpRrhxsIKUoG9s/guT
 KvGTCjlcSizFGYmGWsxFxYkAzeKuqp0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7rXgrxSDO4fMLL4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GU17TzIW
 LCqrmLJjLlsD46GgLkYODgkBE4m/32K7GLk4hASWMkp0Nt5l7WLkBIpLSezr+c8OYQtL/LnW
 xQZR1MokMfXrP7AiNgEziUdf5rGCDBIRMJV4tlcSJMwskClx+tU+NhBbWMBWomX9C7A5LAKq
 Etf3/mQGsXkFnCROrJjJAjFfXmLmpe9gNZwCzhKNXyczg4wUAqp5/8weolxQ4uTMJywQ4+Ul
 mrfOZp7AKDALSWoWktQCRqZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgXGw7djPzTsY5736
 qHeIkYmD8RCjBAezkggvb6V7ihBvSmJlVWpRfnxRaU5q8SFGU6CzJzJLiSbnAyMxryTe0MzA
 1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBaY2yQ86ZnNLe93rcObM2bxCN
 lXirZyNsKp73Wjq2UbT7i+/yArN//n/q28Jd+uax6X6y/qm+zGJBWdEqKxUB9yKG3fwMH9zi
 9zZJTuE0XZen+48pLsOX1+lFX7Q122sFG/7bmbNPhVRISolOuChk9/T8u60T2j1vpl56az23
 0yvoYuR+5j1ftyw/fjzswa5jJ18q7eLKqtIQv1xv9TRuqhfj1bmnMmRfzOC15emxPr79Rsb2
 2xPPc5YEpeamHd575MSKxWZnhO8/5TOwV65M4355dtG0STGRcrtKnpyv+x8n/K39diN7f4BA
 VkGOZrLu+su366w965jM5vTMtTzxxfrU1DNBmzh13PTPfGFXYinOSDTUYi4qTgQAwWrQNQwD
 AAA=
X-CMS-MailID: 20230427104750eucas1p1eb8fb7fac00cc13dea5e4a7e0df5c113
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230427104750eucas1p1eb8fb7fac00cc13dea5e4a7e0df5c113
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230427104750eucas1p1eb8fb7fac00cc13dea5e4a7e0df5c113
References: <20230427104743.9072-1-t.dzieciol@partner.samsung.com>
 <CGME20230427104750eucas1p1eb8fb7fac00cc13dea5e4a7e0df5c113@eucas1p1.samsung.com>
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

Packet-split descriptors are used by Linux VF driver for MTU values from 2048
---
 hw/net/igb_core.c | 300 +++++++++++++++++++++++++++++++++++++++++-----
 hw/net/igb_regs.h |   6 +
 2 files changed, 276 insertions(+), 30 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1cb64402aa..6abb152d51 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -282,6 +282,14 @@ igb_rx_queue_desctyp_get(IGBCore *core, const E1000E_RingInfo *r)
     return core->mac[E1000_SRRCTL(r->idx) >> 2] & E1000_SRRCTL_DESCTYPE_MASK;
 }
 
+static bool
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
@@ -1239,21 +1247,70 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
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
-igb_read_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
-                  hwaddr *buff_addr)
+igb_read_adv_rx_split_buf_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
+                                hwaddr *buff_addr)
+{
+    buff_addr[0] = le64_to_cpu(desc->read.hdr_addr);
+    buff_addr[1] = le64_to_cpu(desc->read.pkt_addr);
+}
+
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
+    bool do_ps;
+    bool is_first;
+    IGB_BaState bastate;
+    hwaddr ba[MAX_PS_BUFFERS];
+} IGB_PacketRxDMAState;
+
+static inline void
+igb_read_rx_descr(IGBCore *core,
+                  union e1000_rx_desc_union *desc,
+                  IGB_PacketRxDMAState *pdma_st,
+                  const E1000E_RingInfo *r)
 {
+    uint32_t desc_type;
+
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
-    } else {
-        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
+        igb_read_lgcy_rx_descr(core, &desc->legacy, &pdma_st->ba[1]);
+        pdma_st->ba[0] = 0;
+        return;
+    }
+
+    /* advanced header split descriptor */
+    if (igb_rx_use_ps_descriptor(core, r)) {
+        igb_read_adv_rx_split_buf_descr(core, &desc->adv, &pdma_st->ba[0]);
+        return;
     }
+
+    /* descriptor replication modes not supported */
+    desc_type = igb_rx_queue_desctyp_get(core, r);
+    if (desc_type != E1000_SRRCTL_DESCTYPE_ADV_ONEBUF) {
+        trace_igb_wrn_rx_desc_modes_not_supp(desc_type);
+    }
+
+    /* advanced single buffer descriptor */
+    igb_read_adv_rx_single_buf_descr(core, &desc->adv, &pdma_st->ba[1]);
+    pdma_st->ba[0] = 0;
 }
 
 static void
@@ -1397,6 +1454,13 @@ igb_write_lgcy_rx_descr(IGBCore *core,
     desc->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
+static bool
+igb_rx_ps_descriptor_split_always(IGBCore *core, const E1000E_RingInfo *r)
+{
+    uint32_t desctyp = igb_rx_queue_desctyp_get(core, r);
+    return desctyp == E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS;
+}
+
 static uint16_t
 igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
 {
@@ -1483,6 +1547,49 @@ igb_write_adv_rx_descr(IGBCore *core,
     d->wb.lower.lo_dword.pkt_info = cpu_to_le16(rss_type | (pkt_type << 4));
 }
 
+typedef struct IGB_SplitDescriptorData_st {
+    bool sph;
+    bool hbo;
+    size_t hdr_len;
+} IGB_SplitDescriptorData;
+
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
+    d->wb.lower.lo_dword.hdr_info = (hdr_len << E1000_ADVRXD_HDR_LEN_OFFSET) &
+                                    E1000_ADVRXD_ADV_HDR_LEN_MASK;
+    d->wb.lower.lo_dword.hdr_info |= ps_desc_data->sph ? E1000_ADVRXD_HDR_SPH
+                                                       : 0;
+    d->wb.upper.status_error |= ps_desc_data->hbo ?
+                                    E1000_ADVRXD_ST_ERR_HBO_OFFSET : 0;
+}
+
 static inline void
 igb_write_rx_descr(IGBCore *core,
                    union e1000_rx_desc_union *desc,
@@ -1490,13 +1597,18 @@ igb_write_rx_descr(IGBCore *core,
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
 
@@ -1557,34 +1669,149 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
-typedef struct IGB_BaState_st {
-    uint16_t written[MAX_PS_BUFFERS];
-    uint8_t cur_idx;
-} IGB_BaState;
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
 
-typedef struct IGB_PacketRxDMAState_st {
-    size_t size;
-    size_t total_size;
-    size_t ps_hdr_len;
-    size_t desc_size;
-    size_t desc_offset;
-    uint32_t rx_desc_packet_buf_size;
-    uint32_t rx_desc_header_buf_size;
-    struct iovec *iov;
-    size_t iov_ofs;
-    bool is_first;
-    IGB_BaState bastate;
-    hwaddr ba[MAX_PS_BUFFERS];
-} IGB_PacketRxDMAState;
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
 
 static void
 igb_truncate_to_descriptor_size(IGB_PacketRxDMAState *pdma_st, size_t *size)
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
+                            IGB_BaState *bastate,
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
+                                   IGB_PacketRxDMAState *pdma_st,
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
 igb_write_payload_frag_to_rx_buffers(IGBCore *core,
                                      PCIDevice *d,
@@ -1684,7 +1911,14 @@ igb_write_to_rx_buffers(IGBCore *core,
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
     igb_write_payload_to_rx_buffers(core, pkt, d, pdma_st, &copy_size);
 }
 
@@ -1699,6 +1933,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     union e1000_rx_desc_union desc;
     const E1000E_RingInfo *rxi;
     size_t rx_desc_len;
+    IGB_SplitDescriptorData ps_desc_data;
 
     IGB_PacketRxDMAState pdma_st = {0};
     pdma_st.is_first = true;
@@ -1717,6 +1952,10 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
         d = core->owner;
     }
 
+    pdma_st.do_ps = igb_do_ps(core, rxi, pkt,
+                              &pdma_st.ps_hdr_len,
+                              &ps_desc_data);
+
     do {
         memset(&pdma_st.bastate, 0, sizeof(IGB_BaState));
         bool is_last = false;
@@ -1729,7 +1968,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
         pci_dma_read(d, base, &desc, rx_desc_len);
         trace_e1000e_rx_descr(rxi->idx, base, rx_desc_len);
 
-        igb_read_rx_descr(core, &desc, &pdma_st->ba[1], rxi);
+        igb_read_rx_descr(core, &desc, &pdma_st, rxi);
 
         igb_write_to_rx_buffers(core, pkt, d, &pdma_st);
         pdma_st.desc_offset += pdma_st.desc_size;
@@ -1741,6 +1980,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                            is_last ? pkt : NULL,
                            rss_info,
                            etqf, ts,
+                           &ps_desc_data,
                            &pdma_st.bastate.written,
                            rxi);
         pci_dma_write(d, base, &desc, rx_desc_len);
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index c4ede22181..080f03fc43 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -700,6 +700,12 @@ union e1000_adv_rx_desc {
 #define E1000_ADVRXD_PKT_UDP  BIT(5)
 #define E1000_ADVRXD_PKT_SCTP BIT(6)
 
+#define E1000_ADVRXD_HDR_LEN_OFFSET    (21 - 16)
+#define E1000_ADVRXD_ADV_HDR_LEN_MASK  ((BIT(10) - 1) << \
+                                        E1000_ADVRXD_HDR_LEN_OFFSET)
+#define E1000_ADVRXD_HDR_SPH           BIT(15)
+#define E1000_ADVRXD_ST_ERR_HBO_OFFSET BIT(3 + 20)
+
 static inline uint8_t igb_ivar_entry_rx(uint8_t i)
 {
     return i < 8 ? i * 4 : (i - 8) * 4 + 2;
-- 
2.25.1


