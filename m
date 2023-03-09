Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD76B6BD8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTWF-0000Tq-7U; Sun, 12 Mar 2023 17:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW8-0000SM-C8
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:12 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW6-0004XO-9V
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSFq6GhoXDZuHfoYq+mX9HKuryHzVxGBTlxsxM3b5UcSRkJ/R6Yy1KhIQsb4mSmomALA5us9mkW5iUqmg0TXMK6DtvfTaFiNzlh1UMBQYhttn+qOTcwwBiuGTxdQ+Rhs/zHNKQgysIC44N5FmnAfTXMNLRPno7KFAIqYxjAgde3g2h4jCJDqI3eYXnURtZ/jwN/ewAbjVk2FaB8Mv4LhEHh8xUIBySWuaBf3/WIjpGzl63Vb94ViJkFzDa52vBR0fUezXL+hPYGKbEeMp/WcHYyR6Aa+7o1Vjy1b4t2K5RPpgNSUEGcE+PnKdg2qTVkoL75LvrGHHMyv91O6GGMHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeRkPGBdar7d/I4dBZJhsLaOIX91qkbv+w++kMRxodU=;
 b=THBHm7vBTs0Y6L/09h3n+0fhAC75i70/PNyrS6CUNhIRUM8oxnA4C1gKds+n2lcjjO8XPrcoiaKxUBxtLMtWS1AtkSbjlh4QOlzWt/w/uJsXtzNabAFxk05Nc/clfK76dltDsgEnVL5znPGM8GsbGdUGzUi5tpB2UFmMI5WkpoCUZurxzR0DxpPAjdUB8uyCPuGfDhcc2YDd/l6HvbzNgzRSaDVTAkT5y9uZDImMklWNNnNXA+ZPYbI8Pk5NlkNMJSxpTy2U6BJGES39YCEtDN8gW/oz7fjkoZRqMkbHoarnPMKhldWJ7ijfVZgMvdb/J7c0s5nfsnDFQV5EZN7XdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeRkPGBdar7d/I4dBZJhsLaOIX91qkbv+w++kMRxodU=;
 b=YjpaoZwNHSt2fAaoqZmsgCaXrLRvDAOxa5fUoAaSToGVlahBBFpDt2jFzXsZZChdSuZVDGNt7CsukeFaeFNlc/hI/j7QZbmY3nX9a35H2JTePDCXuMdcvnGphCM0piOQ1vltAY1+qeNgX2QuWDa+erHxhNJNqEGqWD9Sr6UFNo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:46 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Thu,  9 Mar 2023 23:00:12 +0100
Message-Id: <20230309220012.25642-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0095.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::6)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5eeebe-1897-4116-ad9d-08db234321cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYryenP31rlmDz1P+xsEwJkMPjz/acfPNoEjBtrW5TxRONPQ2efhV4jcof8h1HNaTjd645dLblDjkD6mjaqyas1csZS4/hAa2qGEzYA6eGQgLJw4iFC2wD9EbLyVU5M/byrIXeRcx4abaId2wKRUjQ/WHBUpdObiF0pH5NIymZ1EexCLCyojohvrcEIR1pwGkg/wUdZ5UCeHggl91vPuA5WPpYNuNy6X8E2ttcQxb3eCmsi59+Ivpz3Q23OyzCKWugMqD4lAitM3sfATAVKlCPvT0BDP/1Zc9bhJeo0Lclh7/Vrcjdr5wjQaYLO13Ll9dZqvVokx4vcZXA9jKflW0InAO3iGSsUpizHLrmAK+9DCv6mLi67LOpKuQFGFz5ZF/EzOBOgtc7LrM2JidBKeALeaon2mgsIjEasGseqQG33g6QWvtdaTBErfUPZgyItOjLLOiI2voLXuYe9+Gz9eNv8jlmybyJOdxI4HS6ZrYBVcRnlG31t9BoNC6+nqgHQTtQURlqHScenX5BTkAIk4yAkA5xsMNXC/hpqO4LN4wdCOnUU9o4rbLt+ynF/JkdvEgKNZrlVO4SfLyyCbLrH3Vn4YtihQ0usKG2wWEIa0u9BWi4ysjvioT/iJGNbgsUhdfSSkClL20eZXTDL0jrzzYu3TS9aFsI+WMhCZ9ZVstFRamgvcvILuu5jGJxeiEPQ0tXHnpuFHq9bHK2iwAV36Py2Klb+JlyDmwV+tKADgvbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xi4VMxcFj63Hjlyf+IonFfJkq/wlTBNf+dHrgF4QvgXjEP12J5aLzOqyUKe9?=
 =?us-ascii?Q?LTWp9MXbdPMWo5nhm8g3GgMOfyqsUCJRG67UE4RUXqSAQnwd6CeU+rGyiHv8?=
 =?us-ascii?Q?aU/e5KrdHjVxi+yV9ePTzILT8TgjYlCk6/yZ3mZFK8Psvo+i3xwNvKxomPas?=
 =?us-ascii?Q?pauyKycvNwjS+L3ClWkKbzBHEX+A/Tsi6+ef8VhHtMyhfaQJ+FwPn2Vmk2oV?=
 =?us-ascii?Q?fo3aXAOFEQJBWPSipy6YZX8M4/FdUsXbDWwiHCuSO2wVtENdNxe1h642Dr1V?=
 =?us-ascii?Q?2/J+4raE/01rHQ52gjd8ok5d6tNo7xJjYo0Kj3scUIrV8OJ9D6SaM7D/dz8g?=
 =?us-ascii?Q?8agmMLoBb4GHDcCwkY9IMwRSdzZ/zWYUyWTzsXPVcv3CV0QLZGosu9DBMVee?=
 =?us-ascii?Q?4xfgzSEJ6skweQOuc8xXZukIAJLsp7zwzwUFzskCj8iZRqCfFTMMzLFRmO4q?=
 =?us-ascii?Q?hLor8s1jeK73pGX3n4nf37ub0N5QVYSJk+WT+bblkCGk05vm7TZQOZkL3+nA?=
 =?us-ascii?Q?EIL6JUwONQ+Hiaxizz2lDhRzD3ptUJl+Ao/O5ZWCAKonG8O+DPem7xRfhMbu?=
 =?us-ascii?Q?nrl1pGYJeJ8lAzQxAN9dd8U22RLVBAKNy4iTdLKh1QRYmNn+8V5xrhi/6SxJ?=
 =?us-ascii?Q?NPj+kUpWIEKPgiM4IrguSxrHBO3zx2iajCKV1COuHF7yz9JFzJ34mWa6Vakv?=
 =?us-ascii?Q?qrpor6V24ZQZjQIL2Y/xJvZtr8ah9K2MZ70Uo9x9pknZqPQ2/pRFirNtE1ia?=
 =?us-ascii?Q?Lvxx5OrkTG70CusayDmQlTwRHOOq2HAUT5rtQqwnM3MABVMFaE/FBJmxsMo2?=
 =?us-ascii?Q?7MJ37ZoSl4LxaKxyVBw/TTtZI/t58IqWKiE2b9KbPCZ+NvQymGlJQr6x5pU8?=
 =?us-ascii?Q?E/XgiC9cpEEtCFJY4Se6xOSfpQd6q9oBHyLA+U/+/hHzcXiPnjQ5/z1N6N0O?=
 =?us-ascii?Q?1Oe+1riDf7TmdsKtQUAf5FUExv/TqL32uoDFIi0n2ZsJOH1HVRa/8BDT8IBe?=
 =?us-ascii?Q?xiGisWVS3oucm4Vaf4wbIv8X6pRV4NlPTvsX0Rp/BPz7WR2lxbsHmEyqtV5n?=
 =?us-ascii?Q?D1dfdtSrOjVbvbqih71znEAtwe2q0uDeVLIH7ULaGVmbgTXtHcPVVAUdystF?=
 =?us-ascii?Q?scDLVqD+zsd9AtOctA8bCFkUdgG+j2ZyTZFCuoeeNqzOGyfmbmuFGGLYZ3pR?=
 =?us-ascii?Q?NBZ6WcCk7x0nVO/yHgDvn8B9QVWYuMeRKpzL6nyZxAcwq1iWhnlLb+7J/3xp?=
 =?us-ascii?Q?wRykVPLsns3cepn416gOu7MyxH25ZXLvBYmRc3Jzo+iwA42RHi6AU6Ou1fzK?=
 =?us-ascii?Q?oHo57TRXGduwLoGD1exYY/JbrbZxipBWJNuw/SOJ2cYois+5WoOAexreDxp0?=
 =?us-ascii?Q?hSRSYy2avEEq6bV4cDJyy6HXyG+hlw2ps9OZHEw8Xf875G+BamKm9IZ4a/Rj?=
 =?us-ascii?Q?BKKLcp4KaQdGVrq50eFoKANE8lSEgCGq5+vDPmqSIyS01OFRBXno4TH3Bm88?=
 =?us-ascii?Q?MY1wkoV07E9NtSDg2esDnUvMgRnF4t/cSXCcQUMDym9QcapjhKk6nA2JQlGj?=
 =?us-ascii?Q?6b2lvCPIT3dAxWgAVAivcdFANUepjDsoX7f+gJu10OaGh55i5XewmXsmEKNO?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5eeebe-1897-4116-ad9d-08db234321cd
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:44.1371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3f09q6QnKTUmtfnFaCkjYFvgZzZn2dUq6d7f9StredXOTzw6cgNgOppZ1Qhh6p8kcyDszLXEPgoXCOvQDWR0VOgdcSMmNDERnYB7gbaLN8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add support for stripping/inserting VLAN for VFs.

Had to move CSUM calculation back into the for loop, since packet data
is pulled inside the loop based on strip VLAN decision for every VF.

net_rx_pkt_fix_l4_csum should be extended to accept a buffer instead for
igb. Work for a future patch.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 51 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 86de73afc8..3c0fb19b1e 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -386,6 +386,25 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
+static inline bool
+igb_tx_insert_vlan(IGBCore *core, uint16_t qn,
+                   struct igb_tx *tx, bool desc_vle)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
+            /* always insert default VLAN */
+            desc_vle = true;
+            tx->vlan = core->mac[VMVIR0 + pool] & 0xffff;
+        } else if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_NEVER) {
+            return false;
+        }
+    }
+
+    return desc_vle && e1000x_vlan_enabled(core->mac);
+}
+
 static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
@@ -581,7 +600,8 @@ igb_process_tx_desc(IGBCore *core,
 
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (cmd_type_len & E1000_TXD_CMD_VLE) {
+            if (igb_tx_insert_vlan(core, queue_index, tx,
+                !!(cmd_type_len & E1000_TXD_CMD_VLE))) {
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
                     core->mac[VET] & 0xffff);
             }
@@ -1541,6 +1561,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     igb_update_rx_stats(core, rxi, size, total_size);
 }
 
+static bool
+igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
+        /* Sec 7.10.3.8: CTRL.VME is ignored, only VMOLR/RPLOLR is used */
+        return (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) ?
+                core->mac[RPLOLR] & E1000_RPLOLR_STRVLAN :
+                core->mac[VMOLR0 + pool] & E1000_VMOLR_STRVLAN;
+    }
+
+    return e1000x_vlan_enabled(core->mac);
+}
+
 static inline void
 igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
 {
@@ -1621,10 +1655,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1632,9 +1663,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i)) ||
             !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
@@ -1643,6 +1671,13 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
 
+        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+                                   igb_rx_strip_vlan(core, rxr.i),
+                                   core->mac[VET] & 0xffff);
+
+        total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
+            e1000x_fcs_len(core->mac);
+
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             n |= E1000_ICS_RXO;
             trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
-- 
2.34.1


