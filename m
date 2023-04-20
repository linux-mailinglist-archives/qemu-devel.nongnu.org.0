Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB896E89E0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNB3-00037d-FD; Thu, 20 Apr 2023 01:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAz-0002py-GM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:49 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAx-0001XR-3M
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:49 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517bdc9e81dso365143a12.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969785; x=1684561785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qU1bwLADFQbsoDCRIYLNRDy8e5i5VpME9gACokqm9P0=;
 b=IsyWEJ8Zx2oMyOZv0UW2x5AV6CE+C/Qo0ZvB8KFS2fuCPA7k3ui3tx+R07bzwNZwo8
 LTNYWhKWVEcdfDm6mW+iVdLD2u8THcTDA1xH0/oFZeaE8GQ2CG5BK/G0ZECkKGgVkst2
 0EyYAUgMcIk/+RvZTW1HfcPMAD9NyStcXPqfCPsfTm2iX/N5zs3RBVGdKKzpMReYHXnd
 y/cQopNdOpma8y7X+8oFO+ryHXEg7xajTNVV7AsN5kSq7Ad46a1N6k1ltMqJWOnMWvIS
 CkNhlTD2pGf7s0jln6OeKqDEsIA7e9NemK9aeTpjTRTuHJ1EScO4cNdZDsIA4uBEUJ8a
 4pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969785; x=1684561785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qU1bwLADFQbsoDCRIYLNRDy8e5i5VpME9gACokqm9P0=;
 b=DWFMlAqujDhz7q01fK5rO3nKwMN5hzpoiAjGW/Th/t/0XbqwARd6g/2yxAVwsYj7C6
 4DPcQ4P1tq+PUUX/c8Rqf+8yd8Xjm/PiI+NUcDmYYGZdpsQtOBJ2WMIcHRqUVYP1by9W
 pRPAkdqt+mCCKYuYzL1TZ3zBDeDv6c6/l0f7JJJDE7HcC6t8IESimGZqx7BVYdKWN0MJ
 +V5BSepmqf8o7RSmcacCbIusifZe98AvNtxOKYMlqHGMZFK1athZsIyaMcIdIfFHcvBR
 Sw8e27w5JuQAgQWyAmX1Uuki+grvfJszP9YoPv6nl+tFEz3t4Bn3gcWEoq4YBUEXzjHU
 ttkQ==
X-Gm-Message-State: AAQBX9ddUPaOmyfUYKxdagta8hfvxI5b2IzeyHVniJJTBv/5R/wjw+pL
 D+1Ojtqt16rX7J9+uaHbK4YNMg==
X-Google-Smtp-Source: AKy350b0VUwLf6iu8hEKUQ3alMkWQMs6AHeXBzhPJV3XEOzOkmKQlipjNZ23wWtE7NqVeqBM7LEexg==
X-Received: by 2002:a17:90a:a016:b0:247:2300:87d9 with SMTP id
 q22-20020a17090aa01600b00247230087d9mr521412pjp.34.1681969785692; 
 Wed, 19 Apr 2023 22:49:45 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 37/41] igb: Implement Rx PTP2 timestamp
Date: Thu, 20 Apr 2023 14:46:53 +0900
Message-Id: <20230420054657.50367-38-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_common.h |  16 +++---
 hw/net/igb_regs.h   |  23 ++++++++
 hw/net/igb_core.c   | 129 ++++++++++++++++++++++++++++++++------------
 3 files changed, 127 insertions(+), 41 deletions(-)

diff --git a/hw/net/igb_common.h b/hw/net/igb_common.h
index f2a9065791..5c261ba9d3 100644
--- a/hw/net/igb_common.h
+++ b/hw/net/igb_common.h
@@ -51,7 +51,7 @@
                    defreg_indexeda(x, 0), defreg_indexeda(x, 1), \
                    defreg_indexeda(x, 2), defreg_indexeda(x, 3)
 
-#define defregv(x) defreg_indexed(x, 0), defreg_indexed(x, 1),   \
+#define defreg8(x) defreg_indexed(x, 0), defreg_indexed(x, 1),   \
                    defreg_indexed(x, 2), defreg_indexed(x, 3),   \
                    defreg_indexed(x, 4), defreg_indexed(x, 5),   \
                    defreg_indexed(x, 6), defreg_indexed(x, 7)
@@ -122,6 +122,8 @@ enum {
     defreg(EICS),        defreg(EIMS),        defreg(EIMC),       defreg(EIAM),
     defreg(EICR),        defreg(IVAR_MISC),   defreg(GPIE),
 
+    defreg(TSYNCRXCFG), defreg8(ETQF),
+
     defreg(RXPBS),      defregd(RDBAL),       defregd(RDBAH),     defregd(RDLEN),
     defregd(SRRCTL),    defregd(RDH),         defregd(RDT),
     defregd(RXDCTL),    defregd(RXCTL),       defregd(RQDPC),     defreg(RA2),
@@ -133,15 +135,15 @@ enum {
 
     defreg(VT_CTL),
 
-    defregv(P2VMAILBOX), defregv(V2PMAILBOX), defreg(MBVFICR),    defreg(MBVFIMR),
+    defreg8(P2VMAILBOX), defreg8(V2PMAILBOX), defreg(MBVFICR),    defreg(MBVFIMR),
     defreg(VFLRE),       defreg(VFRE),        defreg(VFTE),       defreg(WVBR),
     defreg(QDE),         defreg(DTXSWC),      defreg_indexed(VLVF, 0),
-    defregv(VMOLR),      defreg(RPLOLR),      defregv(VMBMEM),    defregv(VMVIR),
+    defreg8(VMOLR),      defreg(RPLOLR),      defreg8(VMBMEM),    defreg8(VMVIR),
 
-    defregv(PVTCTRL),    defregv(PVTEICS),    defregv(PVTEIMS),   defregv(PVTEIMC),
-    defregv(PVTEIAC),    defregv(PVTEIAM),    defregv(PVTEICR),   defregv(PVFGPRC),
-    defregv(PVFGPTC),    defregv(PVFGORC),    defregv(PVFGOTC),   defregv(PVFMPRC),
-    defregv(PVFGPRLBC),  defregv(PVFGPTLBC),  defregv(PVFGORLBC), defregv(PVFGOTLBC),
+    defreg8(PVTCTRL),    defreg8(PVTEICS),    defreg8(PVTEIMS),   defreg8(PVTEIMC),
+    defreg8(PVTEIAC),    defreg8(PVTEIAM),    defreg8(PVTEICR),   defreg8(PVFGPRC),
+    defreg8(PVFGPTC),    defreg8(PVFGORC),    defreg8(PVFGOTC),   defreg8(PVFMPRC),
+    defreg8(PVFGPRLBC),  defreg8(PVFGPTLBC),  defreg8(PVFGORLBC), defreg8(PVFGOTLBC),
 
     defreg(MTA_A),
 
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 4b4ebd3369..894705599d 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -210,6 +210,15 @@ union e1000_adv_rx_desc {
 #define E1000_DCA_TXCTRL_CPUID_SHIFT 24 /* Tx CPUID now in the last byte */
 #define E1000_DCA_RXCTRL_CPUID_SHIFT 24 /* Rx CPUID now in the last byte */
 
+/* ETQF register bit definitions */
+#define E1000_ETQF_FILTER_ENABLE   BIT(26)
+#define E1000_ETQF_1588            BIT(30)
+#define E1000_ETQF_IMM_INT         BIT(29)
+#define E1000_ETQF_QUEUE_ENABLE    BIT(31)
+#define E1000_ETQF_QUEUE_SHIFT     16
+#define E1000_ETQF_QUEUE_MASK      0x00070000
+#define E1000_ETQF_ETYPE_MASK      0x0000FFFF
+
 #define E1000_DTXSWC_MAC_SPOOF_MASK   0x000000FF /* Per VF MAC spoof control */
 #define E1000_DTXSWC_VLAN_SPOOF_MASK  0x0000FF00 /* Per VF VLAN spoof control */
 #define E1000_DTXSWC_LLE_MASK         0x00FF0000 /* Per VF Local LB enables */
@@ -384,6 +393,20 @@ union e1000_adv_rx_desc {
 #define E1000_FRTIMER   0x01048  /* Free Running Timer - RW */
 #define E1000_FCRTV     0x02460  /* Flow Control Refresh Timer Value - RW */
 
+#define E1000_TSYNCRXCFG 0x05F50 /* Time Sync Rx Configuration - RW */
+
+/* Filtering Registers */
+#define E1000_SAQF(_n) (0x5980 + 4 * (_n))
+#define E1000_DAQF(_n) (0x59A0 + 4 * (_n))
+#define E1000_SPQF(_n) (0x59C0 + 4 * (_n))
+#define E1000_FTQF(_n) (0x59E0 + 4 * (_n))
+#define E1000_SAQF0 E1000_SAQF(0)
+#define E1000_DAQF0 E1000_DAQF(0)
+#define E1000_SPQF0 E1000_SPQF(0)
+#define E1000_FTQF0 E1000_FTQF(0)
+#define E1000_SYNQF(_n) (0x055FC + (4 * (_n))) /* SYN Packet Queue Fltr */
+#define E1000_ETQF(_n)  (0x05CB0 + (4 * (_n))) /* EType Queue Fltr */
+
 #define E1000_RQDPC(_n) (0x0C030 + ((_n) * 0x40))
 
 #define E1000_RXPBS 0x02404  /* Rx Packet Buffer Size - RW */
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 8ff5a2b4bb..388614ea10 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -72,6 +72,24 @@ typedef struct L2Header {
     struct vlan_header vlan[2];
 } L2Header;
 
+typedef struct PTP2 {
+    uint8_t message_id_transport_specific;
+    uint8_t version_ptp;
+    uint16_t message_length;
+    uint8_t subdomain_number;
+    uint8_t reserved0;
+    uint16_t flags;
+    uint64_t correction;
+    uint8_t reserved1[5];
+    uint8_t source_communication_technology;
+    uint32_t source_uuid_lo;
+    uint16_t source_uuid_hi;
+    uint16_t source_port_id;
+    uint16_t sequence_id;
+    uint8_t control;
+    uint8_t log_message_period;
+} PTP2;
+
 static ssize_t
 igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                      bool has_vnet, bool *external_tx);
@@ -981,9 +999,11 @@ static bool igb_rx_is_oversized(IGBCore *core, const struct eth_header *ehdr,
     return lpe ? size + ETH_FCS_LEN > rlpml : size > header_size + ETH_MTU;
 }
 
-static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
-                                   size_t size, E1000E_RSSInfo *rss_info,
-                                   bool *external_tx)
+static uint16_t igb_receive_assign(IGBCore *core, const struct iovec *iov,
+                                   size_t iovcnt, size_t iov_ofs,
+                                   const L2Header *l2_header, size_t size,
+                                   E1000E_RSSInfo *rss_info,
+                                   uint16_t *etqf, bool *ts, bool *external_tx)
 {
     static const int ta_shift[] = { 4, 3, 2, 0 };
     const struct eth_header *ehdr = &l2_header->eth;
@@ -991,11 +1011,13 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint16_t queues = 0;
     uint16_t oversized = 0;
     size_t vlan_num = 0;
+    PTP2 ptp2;
     bool lpe;
     uint16_t rlpml;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
+    *ts = false;
 
     if (external_tx) {
         *external_tx = true;
@@ -1020,6 +1042,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         return queues;
     }
 
+    for (*etqf = 0; *etqf < 8; (*etqf)++) {
+        if ((core->mac[ETQF0 + *etqf] & E1000_ETQF_FILTER_ENABLE) &&
+            be16_to_cpu(ehdr->h_proto) == (core->mac[ETQF0 + *etqf] & E1000_ETQF_ETYPE_MASK)) {
+            if ((core->mac[ETQF0 + *etqf] & E1000_ETQF_1588) &&
+                (core->mac[TSYNCRXCTL] & E1000_TSYNCRXCTL_ENABLED) &&
+                !(core->mac[TSYNCRXCTL] & E1000_TSYNCRXCTL_VALID) &&
+                iov_to_buf(iov, iovcnt, iov_ofs + ETH_HLEN, &ptp2, sizeof(ptp2)) >= sizeof(ptp2) &&
+                (ptp2.version_ptp & 15) == 2 &&
+                ptp2.message_id_transport_specific == ((core->mac[TSYNCRXCFG] >> 8) & 255)) {
+                e1000x_timestamp(core->mac, core->timadj, RXSTMPL, RXSTMPH);
+                *ts = true;
+                core->mac[TSYNCRXCTL] |= E1000_TSYNCRXCTL_VALID;
+                core->mac[RXSATRL] = le32_to_cpu(ptp2.source_uuid_lo);
+                core->mac[RXSATRH] = le16_to_cpu(ptp2.source_uuid_hi) |
+                                     (le16_to_cpu(ptp2.sequence_id) << 16);
+            }
+            break;
+        }
+    }
+
     if (vlan_num &&
         !e1000x_rx_vlan_filter(core->mac, l2_header->vlan + vlan_num - 1)) {
         return queues;
@@ -1230,7 +1272,7 @@ static void
 igb_build_rx_metadata(IGBCore *core,
                       struct NetRxPkt *pkt,
                       bool is_eop,
-                      const E1000E_RSSInfo *rss_info,
+                      const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
                       uint16_t *pkt_info, uint16_t *hdr_info,
                       uint32_t *rss,
                       uint32_t *status_flags,
@@ -1281,29 +1323,33 @@ igb_build_rx_metadata(IGBCore *core,
     if (pkt_info) {
         *pkt_info = rss_info->enabled ? rss_info->type : 0;
 
-        if (hasip4) {
-            *pkt_info |= E1000_ADVRXD_PKT_IP4;
-        }
+        if (etqf < 8) {
+            *pkt_info |= BIT(11) | (etqf << 4);
+        } else {
+            if (hasip4) {
+                *pkt_info |= E1000_ADVRXD_PKT_IP4;
+            }
 
-        if (hasip6) {
-            *pkt_info |= E1000_ADVRXD_PKT_IP6;
-        }
+            if (hasip6) {
+                *pkt_info |= E1000_ADVRXD_PKT_IP6;
+            }
 
-        switch (l4hdr_proto) {
-        case ETH_L4_HDR_PROTO_TCP:
-            *pkt_info |= E1000_ADVRXD_PKT_TCP;
-            break;
+            switch (l4hdr_proto) {
+            case ETH_L4_HDR_PROTO_TCP:
+                *pkt_info |= E1000_ADVRXD_PKT_TCP;
+                break;
 
-        case ETH_L4_HDR_PROTO_UDP:
-            *pkt_info |= E1000_ADVRXD_PKT_UDP;
-            break;
+            case ETH_L4_HDR_PROTO_UDP:
+                *pkt_info |= E1000_ADVRXD_PKT_UDP;
+                break;
 
-        case ETH_L4_HDR_PROTO_SCTP:
-            *pkt_info |= E1000_ADVRXD_PKT_SCTP;
-            break;
+            case ETH_L4_HDR_PROTO_SCTP:
+                *pkt_info |= E1000_ADVRXD_PKT_SCTP;
+                break;
 
-        default:
-            break;
+            default:
+                break;
+            }
         }
     }
 
@@ -1311,6 +1357,10 @@ igb_build_rx_metadata(IGBCore *core,
         *hdr_info = 0;
     }
 
+    if (ts) {
+        *status_flags |= BIT(16);
+    }
+
     /* RX CSO information */
     if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
         trace_e1000e_rx_metadata_ipv6_sum_disabled();
@@ -1366,7 +1416,7 @@ func_exit:
 static inline void
 igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
                         struct NetRxPkt *pkt,
-                        const E1000E_RSSInfo *rss_info,
+                        const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
                         uint16_t length)
 {
     uint32_t status_flags, rss;
@@ -1377,7 +1427,7 @@ igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
     desc->csum = 0;
 
     igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info,
+                          rss_info, etqf, ts,
                           NULL, NULL, &rss,
                           &status_flags, &ip_id,
                           &desc->special);
@@ -1388,7 +1438,7 @@ igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
 static inline void
 igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
                        struct NetRxPkt *pkt,
-                       const E1000E_RSSInfo *rss_info,
+                       const E1000E_RSSInfo *rss_info, uint16_t etqf, bool ts,
                        uint16_t length)
 {
     memset(&desc->wb, 0, sizeof(desc->wb));
@@ -1396,7 +1446,7 @@ igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
     desc->wb.upper.length = cpu_to_le16(length);
 
     igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info,
+                          rss_info, etqf, ts,
                           &desc->wb.lower.lo_dword.pkt_info,
                           &desc->wb.lower.lo_dword.hdr_info,
                           &desc->wb.lower.hi_dword.rss,
@@ -1407,12 +1457,15 @@ igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
 
 static inline void
 igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info, uint16_t length)
+                   struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
+                   uint16_t etqf, bool ts, uint16_t length)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
+                                etqf, ts, length);
     } else {
-        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, length);
+        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info,
+                               etqf, ts, length);
     }
 }
 
@@ -1489,7 +1542,8 @@ igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
 static void
 igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                           const E1000E_RxRing *rxr,
-                          const E1000E_RSSInfo *rss_info)
+                          const E1000E_RSSInfo *rss_info,
+                          uint16_t etqf, bool ts)
 {
     PCIDevice *d;
     dma_addr_t base;
@@ -1571,7 +1625,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
         }
 
         igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
-                           rss_info, written);
+                           rss_info, etqf, ts, written);
         igb_pci_dma_write_rx_desc(core, d, base, &desc, core->rx_desc_len);
 
         igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
@@ -1626,6 +1680,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     size_t iov_ofs = 0;
     E1000E_RxRing rxr;
     E1000E_RSSInfo rss_info;
+    uint16_t etqf;
+    bool ts;
     size_t total_size;
     int strip_vlan_index;
     int i;
@@ -1669,8 +1725,9 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                get_eth_packet_type(&min_buf.l2_header.eth));
     net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
 
-    queues = igb_receive_assign(core, &min_buf.l2_header, size,
-                                &rss_info, external_tx);
+    queues = igb_receive_assign(core, iov, iovcnt, iov_ofs,
+                                &min_buf.l2_header, size,
+                                &rss_info, &etqf, &ts, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
@@ -1709,7 +1766,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         n |= E1000_ICR_RXDW;
 
         igb_rx_fix_l4_csum(core, core->rx_pkt);
-        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
+        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info, etqf, ts);
 
         /* Check if receive descriptor minimum threshold hit */
         if (igb_rx_descr_threshold_hit(core, rxr.i)) {
@@ -3302,6 +3359,8 @@ static const readops igb_macreg_readops[] = {
     [EIAM]       = igb_mac_readreg,
     [IVAR0 ... IVAR0 + 7] = igb_mac_readreg,
     igb_getreg(IVAR_MISC),
+    igb_getreg(TSYNCRXCFG),
+    [ETQF0 ... ETQF0 + 7] = igb_mac_readreg,
     igb_getreg(VT_CTL),
     [P2VMAILBOX0 ... P2VMAILBOX7] = igb_mac_readreg,
     [V2PMAILBOX0 ... V2PMAILBOX7] = igb_mac_vfmailbox_read,
@@ -3709,6 +3768,8 @@ static const writeops igb_macreg_writeops[] = {
     [EIMS] = igb_set_eims,
     [IVAR0 ... IVAR0 + 7] = igb_mac_writereg,
     igb_putreg(IVAR_MISC),
+    igb_putreg(TSYNCRXCFG),
+    [ETQF0 ... ETQF0 + 7] = igb_mac_writereg,
     igb_putreg(VT_CTL),
     [P2VMAILBOX0 ... P2VMAILBOX7] = igb_set_pfmailbox,
     [V2PMAILBOX0 ... V2PMAILBOX7] = igb_set_vfmailbox,
-- 
2.40.0


