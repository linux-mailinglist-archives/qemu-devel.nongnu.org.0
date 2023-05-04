Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99D86F70EB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoH-0006xX-Kt; Thu, 04 May 2023 13:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYk3-0003zJ-2Y
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:27 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjn-0002uL-Se
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504131107euoutp019fd0375f96a3c2da2741678e6b3b1dd0~b8tGhWPH71983119831euoutp01F
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 13:11:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230504131107euoutp019fd0375f96a3c2da2741678e6b3b1dd0~b8tGhWPH71983119831euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683205867;
 bh=Zmia5+D2VLZojBeIU8qzUDdE9CJfCFrYjA6EoFkN8JE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uJSd11aWFqQCkNtxgKtDgWKpFfCiNM3EfibkKxjVE7oBLWv7bkncXMCD60YZ2PhJl
 aolCcVgyWqk25uMl4qPOSFbeNIRPTkgkx9VZffORUqEeeaFbVAsAB6GB1hyc/z0g38
 lpsNj2hE9Mqvt4zz4ict1KFm+KaertW32wuboyhw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230504131107eucas1p1a7ecaea33eeae06e8a6a82353a0ace44~b8tGEj5yd2006420064eucas1p1H;
 Thu,  4 May 2023 13:11:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 70.27.37758.BEEA3546; Thu,  4
 May 2023 14:11:07 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28~b8tFpyvBA1451014510eucas1p1i;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230504131106eusmtrp223c4522cdaaa0272370f749c91ab97e4~b8tFpHGGS1716517165eusmtrp2V;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-d4-6453aeeb3f89
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.7E.10549.AEEA3546; Thu,  4
 May 2023 14:11:06 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131106eusmtip108fcf46ece5de12867ce3da065ca3784~b8tFB2Gmu1694616946eusmtip1m;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v4 3/5] igb: RX descriptors handling cleanup
Date: Thu,  4 May 2023 15:10:53 +0200
Message-Id: <20230504131055.11767-4-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOd3X64JTDKbNErH4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGZPuv2IvaNjHWLHk5nvmBsZ1dV2MnBwSAiYSy+8cZuxi5OIQEljBKPGt
 bSYThPOFUeLynutQmc+MErsa7jLBtCyctoEFIrGcUeLIz49QVe1MEhNbboBVsQmYSTz6Mo+1
 i5GDQ0TAWOJjuzhImFkgVeLon4MsILawgI3E3YdbwcpZBFQlTj+fDGbzCjhLzH7xnhFimbzE
 zEvf2UFsTgEXiS3TJrBC1AhKnJz5hAViprxE89bZzCA3SAhs4ZA403CSDaLZRaKraQIzhC0s
 8er4FnYIW0bi/875UN+US/w8u40dormFUWLP1MlQRdYSl7b+BHuAWUBTYv0ufYiwo8TXX1MY
 QcISAnwSN94KQtzAJzFp23RmiDCvREebEES1jsS3TTPZIMJSEgtvQEPdQ+LV3JWMExgVZyF5
 ZhaSZ2YhrF3AyLyKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMMWc/nf86w7GFa8+6h1i
 ZOJgPMQowcGsJML7odAvRYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB9MSS1OzU1ILU
 IpgsEwenVAMTv0OM+MHl08o0JzP7G9pP+u9teKSZb8+LGT8ezq7UqS/sz/+2m4c1tleVl0n7
 wgTx2SqrPywp3aLGtWPeqnmhyd953TtL+Bd3CvLvT7wVVmdx66g5V/gOOX13hljnegX/Z/Py
 tJzr6kQfz+RjX7YgxIMxRGntlSDD37Mf7jde+XWL2rmaFgXHH59WX2hf2+X/cVtacm586lu3
 opvPn595Ilar8Dvsv9OSiplSU9umLCq5tfNLScaGC87h2nmtl+P9RLdcuFrYcnV9FItM6DeR
 VPVikeq5pmy1js1fGRdeuyBpdCamPOz663u7/8dPDn++PqMgLuqrm9NVpU23uAx3qR7sSFD5
 92ihacef2UeUWIozEg21mIuKEwEj9mS2oAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xu7qv1gWnGJzdZGzx+dRadotllz4z
 WTTOn8NqsfXqD3aL4707WCx6N71gcmDzOPH2IKvHhUfnmD2eXNvM5PF+31U2j74tqxgDWKP0
 bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mibdf8Ve
 0LCPsWLJzffMDYzr6roYOTkkBEwkFk7bwNLFyMUhJLCUUWLx9y52iISUxL6e/1C2sMSfa11s
 EEWtTBLzvm1lAkmwCZhJPPoyj7WLkYNDRMBU4tleSZAws0CmxOlX+9hAbGEBG4m7DyHKWQRU
 JU4/nwxm8wo4S8x+8Z4RYr68xMxL38F2cQq4SGyZNoEVxBYCqjlx/AcbRL2gxMmZT1gg5stL
 NG+dzTyBUWAWktQsJKkFjEyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAqNh27Gfm3cwznv1
 Ue8QIxMH4yFGCQ5mJRHeD4V+KUK8KYmVValF+fFFpTmpxYcYTYHunsgsJZqcD4zHvJJ4QzMD
 U0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGJp2aFOYX05je9huX5zQfE12x
 rP2+6Nk1b7XniXvyCDLfvLVp5xSzJ194K9s9Zk28fOvy/XgZ5UU1LUcFrzoqSzzcVM//Sc3E
 P3BzjfsiHdG/fDZdK1rcFBp1r/VU7GPZbnHNVeZ/mbN2utVxqZAlHyb9s5yV8yUjiy3xca/m
 Nf5l1tlu3q+fV3JWPVA2nmnUPq9LWKPg8dWfK+/xNExb91Hd+lR52JKtM3Ztbw86kPV1ilSB
 9u9wxeN7Qp6GskqFX9nt1nBV/r6hur2mGKPS/qYPRw4G6uac/rZcNpM5w/Oaetm2rfH7jkyd
 GXLPKfCZcrD/0aOF/ulTfX42HzkoqmKxYp+vjNoPIbceqeVXlFiKMxINtZiLihMBusLIjw8D
 AAA=
X-CMS-MailID: 20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131106eucas1p13530e4d1f10ca1086b39b37feddc3e28@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
 hw/net/e1000e_core.c     |  18 +-
 hw/net/igb_core.c        | 410 ++++++++++++++++++++++-----------------
 hw/net/igb_regs.h        |  12 +-
 hw/net/trace-events      |   6 +-
 tests/qtest/libqos/igb.c |   5 +
 5 files changed, 263 insertions(+), 188 deletions(-)

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
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b6031dea24..dbd09b9b46 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -267,6 +267,15 @@ igb_rx_use_legacy_descriptor(IGBCore *core)
     return false;
 }
 
+typedef struct E1000ERingInfo {
+    int dbah;
+    int dbal;
+    int dlen;
+    int dh;
+    int dt;
+    int idx;
+} E1000ERingInfo;
+
 static inline bool
 igb_rss_enabled(IGBCore *core)
 {
@@ -694,15 +703,6 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
     return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
 }
 
-typedef struct E1000ERingInfo {
-    int dbah;
-    int dbal;
-    int dlen;
-    int dh;
-    int dt;
-    int idx;
-} E1000ERingInfo;
-
 static inline bool
 igb_ring_empty(IGBCore *core, const E1000ERingInfo *r)
 {
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
@@ -1281,15 +1289,11 @@ igb_verify_csum_in_sw(IGBCore *core,
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
@@ -1298,7 +1302,6 @@ igb_build_rx_metadata(IGBCore *core,
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
-    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1315,59 +1318,6 @@ igb_build_rx_metadata(IGBCore *core,
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
@@ -1423,43 +1373,106 @@ func_exit:
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
 
-    desc->wb.upper.length = cpu_to_le16(length);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
+
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
@@ -1468,8 +1481,7 @@ igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
                    uint16_t etqf, bool ts, uint16_t length)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
-                                etqf, ts, length);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
     } else {
         igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
                                etqf, ts, length);
@@ -1508,19 +1520,6 @@ igb_pci_dma_write_rx_desc(IGBCore *core, PCIDevice *dev, dma_addr_t addr,
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
@@ -1546,6 +1545,108 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000ERingInfo *rxi)
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
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
@@ -1555,91 +1656,54 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
+        igb_read_rx_descr(core, &desc, &pdma_st.ba);
 
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


