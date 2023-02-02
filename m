Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5068784A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYP-0003kT-6A; Thu, 02 Feb 2023 04:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXn-0003Z2-QL
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:14 -0500
Received: from mail-db3eur04on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::721]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXk-00065l-3h
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k365b766jayXfVI2q0lQ2nwMXOuYddtgtaLQAXTo65sdK50l2cWDjBUQrShCWZ2iyv4ErXOKbHyU4ahIFRLKOXURV6RlezVmocgpDzo02UgVYjNWLaF7gxx/cjC+Rcc+XP5BBxGORUnCXptZHf1yoBP0bsdWKZKXo7yZhb4j69jWYqjpLI2vfmJ68O0uD82srdJGFLq8Hd8Z6gOrnZSQcfZ9NRLw0ZAeAHNDKbxBdoC4Iw5KmhiQ10r66qAYPm9XUERYsD7eZGz9ITzvHqRP11KoXOoSHdOFGSLvMAPxelgdEirHVmVQ9pVyXPlNJYUb9NZGa7Zpcbmh2I0QlJ8ejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRoeUQPnxGZSpXfHRwphQhh6JdXJS3b2padeaO5FaI8=;
 b=kzck7uzhe1vvOzLnoMULxe78z5JX/EtB9Yl6cguxwi2KSK1wtnhbNj3bXx4pROGiuGI2vTJU/2o5FqTvh0pj0Kc5myQnnNw7R1elMDuPs0WxpHTuh6J6OpL6NFRBwWFBX1BFkqiPViFAPEl91pfh+T/2VtcGttzhEqgpLCyLs2uttxAUbW39qQU3Vzj+OHMmAo+rVoQb0zpif36h7/8q81bBEsRiak7wxBYUXkmW5zG9rGiGF5xek2VCquwjlwXefk9sl/5VNGzX+M33rhwAAoxv300x6/j/3UYYD/5B9ygYivH1v82/iW/8q7W7A7yr8n9v3ehvhlhEDUR/AIC+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRoeUQPnxGZSpXfHRwphQhh6JdXJS3b2padeaO5FaI8=;
 b=dp596SJlcJTPFagO57Qlx4nya1T6clZGr8hzIBh36fIwxAO+PHCmSeHUa3E82GQbUr3/w3V4e49fxmuKAksGI45EHuheM1swKYQ8yXX2WC4Ucp1OmaZxHoVOjmHYzqFjHBSsBCfPKzn1Oi1WlQtsoKFN640s4ThSNXuQEtBN6gQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 4/8] igb: implement VFRE and VFTE registers
Date: Thu,  2 Feb 2023 08:52:53 +0100
Message-Id: <20230202075257.16033-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0002.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::9) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bb077c-3ec0-4305-e4b9-08db04fcb264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1NP6ytnol/YCJy8CyNhiWRRIIXsH97amP6aqKX8pUiHF/yyRPGUWsp8FicQaOopC4Lh8zlD5vVRDIXES4NQ83G3UAF7H5TxOasKbF/QrixeC1v7eBRVxdvGn/iwaJ5lRI+wv98jyJjHV5O+lB3jsYOMvdzi/cgr2t1bIAcpravBc22JavPlU443JUtZOTDGZRpgCfQJCDFdvl7MRq/oIkN7DsuVTGDhAlOtqU6ViMDG8Jx57/EdSmPQzr0KMYUcJsBGNFEXoZ89bYaFzbMD+J5U7M6oSAh5sEyMPGpg+9d/BdAYN14LVrngZPYbiUrWmre6GQ6FxvlgbxPUu8HIzCtrRLNu+SGxFGl7JXSe4T1V7M272wtydhaSODIP8a+rQng+wuH1Eo4s5G0YjeR3mKwuTC+HrPvWnxtH9S8+8rqKLRlVt0ajDyhw6qbADBwlf1KrzdOGVEAidSuH8eKkc9ZqvtL/Pxd7FdYkUa9dPJEPJ0IeU/cX8273MyEFJ/FleXPiYvVLIawqjY1Drw0gdDqD9urTBC0NGq8QgMtodZEsDlg7eGoQLpN9U+WXEXFWOpUXYyeK9y8c9n9Bn5c/KC7oqunNRhZ+7OUYlFPdqyDmV2DA+4e7OKdd58BF2QqTghhzDussvC2oETZilKx5ybEYbUXAriJfcccmzt5wjdaoutsfBZXXGcVxRbV5kATWmKXmhvL/3zg/txWDk49479rX+7zo/JiXAByXj4iyhUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQV7NAGfrcFNQj/bBr2QSdjzY9yiOkGMPrFW0s+zjCv9tFpgO1YNOAzYM/wL?=
 =?us-ascii?Q?5qkYuPHgJ37s86aYID3ppchCJKWFr6JJinDPcgwwqMKnaH7mbK4lzSqRiILy?=
 =?us-ascii?Q?MEQgO1agISzagpBg7cQjojTo+v3myT4wZ5CWb5rBYUHO9aKy+fxEBtdOq7Tk?=
 =?us-ascii?Q?mRijnXPdSruXo7xI7lbOWUhitYVwkwiNHw8GLZP985bQ3MkZuW/UdvBWHKaM?=
 =?us-ascii?Q?7ExqdnzwFvPKU+Ss7qru/JNTz/voBKdz1iNLm4bEqnAUk7wgG8V/WwJ7fh3r?=
 =?us-ascii?Q?eMAgQ++CTng6XUZ1SnYkx/0q+QTm5PO+1OBg2P2vAubaRZAMlwy2nDNqWrrt?=
 =?us-ascii?Q?PZmOnuWJtq937SXUFQDs+4Dc5Cx9JMs7ne48ODt5zqhRFoegI4sp7TNeJ62u?=
 =?us-ascii?Q?wLDXYndR2RsZan8rmLmiyTTjuU6ziab1tt50Rcf1zJE93495Be6B+t4TIFzI?=
 =?us-ascii?Q?KVA2ZgmnPthsDBg+hqFhvQ4dHA6SDQ3s7LaUFM+kgHeb2tmgoyCrBHdelSB5?=
 =?us-ascii?Q?myU37z5kefCZCHBu9WrYy2n86PMSxJkce0d2AtzHX1az5EKFHv2vMkeEoE7u?=
 =?us-ascii?Q?agSHUt9h2Nrx+ReSCwaBYtxQ35yOH03OfevKdO9ZDfNg/ZjiK00+eNvN/MTm?=
 =?us-ascii?Q?01YdJe11mQTsPTcEV2Ockjm1qY/lz3iKhSGS8V+cqV6Kn8TtqtXpC/v5wJfy?=
 =?us-ascii?Q?RHXSM2lPes/Flox41Meyz3aAP5ZqWUXaeuFpgM0kKvZt7cthBInT55ko45hc?=
 =?us-ascii?Q?4ruLJFBmVIaMgiNY9d6z6L3ARKpFemmDrAppX0kx4gQNBjmd1YgvzQO9Klx2?=
 =?us-ascii?Q?tqN/GHMpdgzn7OIbE8fB9IjlXEYp28Tu/Cu+o3hhwiPjGoFPnr89/LAH4A+f?=
 =?us-ascii?Q?TcCM6XlvNwXL9R5LpbPIR+uk0xsSe4maeBW1id3GQiiNnOo0ekJoPb0dJE3b?=
 =?us-ascii?Q?QDeyocxwNBx02Xz/oR4yNRSXndNF1yxRdpmHo5U/qo4paBIq35XuGztjLSuL?=
 =?us-ascii?Q?jrotKPO2l6zYOLDQMSCcSXBQHWRi94kqryKHrAxjDp5L2476DmLmvW0OGhxw?=
 =?us-ascii?Q?g33w6iJRtH7NPCS44mmCDXBFS37i3d43o1nDUQqLvEDHzMHhuWUBqj5a9V7R?=
 =?us-ascii?Q?PtVy/s5jhDNYpQJz3WBcBeN/c9wfou1QiEJ7nJQNUNoel34nVtfmcViEFGPJ?=
 =?us-ascii?Q?WV78FTBdsnMDEGIZOppUhvBykRAmyoY7s70jKTNp+R5oDgGkz3T6HMOxUKjR?=
 =?us-ascii?Q?SJuMZdjB1pyOyqLB4JuQDgQisC7mj8PI52pYUw7t1x3rkyeig0W7MYQtT671?=
 =?us-ascii?Q?LYbjfkyXF2VBaO01wOdLkQNx4aGaHvzl/R5nYBDamtQGDhB38bf7mbT7m4o/?=
 =?us-ascii?Q?ySGsOjFzTRfU564LPucHSfr1PMRv8ZV2YM08ec7iVU009msKVgNq568x8tuU?=
 =?us-ascii?Q?ZGFAX78d35mbdi564LDVDBozA9+qY9Y0nRVlagNcAvR5ED+sb5EqpDIbxAcL?=
 =?us-ascii?Q?Xf3KvyEb56ixOUn0l1X4CLHlsENTLnHF4uBrfXkDrxGbPXiLiGYohcnwKQOs?=
 =?us-ascii?Q?/QkHw7HLrRAz0qbUNFhb5wpcSin/j/fO7sa0pi+/+p5vVdR9YF0BMVBOV9Hz?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bb077c-3ec0-4305-e4b9-08db04fcb264
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:57.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1ub+5kIj7nPuBoiydGuU58d5fFzHHPzCIS4FTLi1JJxUWUEq2QZJFgiisQChyf6ix6r+5d+jXbQe0pQd/8vxPyl0d8/2jMoMv90cJZ4+b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::721;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

Also introduce:
- Checks for RXDCTL/TXDCTL queue enable bits
- IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 38 +++++++++++++++++++++++++++++++-------
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1ddf54f630..c4a2bff4c1 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -780,6 +780,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
     return igb_tx_wb_eic(core, txi->idx);
 }
 
+static inline bool
+igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = txi->idx;
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+    return (core->mac[TCTL] & E1000_TCTL_EN) &&
+        (!vmdq || core->mac[VFTE] & BIT(pool)) &&
+        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
@@ -789,8 +801,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -866,6 +877,9 @@ igb_can_receive(IGBCore *core)
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         E1000E_RxRing rxr;
+        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            continue;
+        }
 
         igb_rx_ring_init(core, &rxr, i);
         if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
@@ -932,7 +946,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -966,7 +980,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -989,7 +1003,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1005,6 +1019,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1562,7 +1577,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     igb_rx_fix_l4_csum(core, core->rx_pkt);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) ||
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
@@ -1966,9 +1982,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
 static void igb_vf_reset(IGBCore *core, uint16_t vfn)
 {
+    uint16_t qn0 = vfn;
+    uint16_t qn1 = vfn + IGB_NUM_VM_POOLS;
+
     /* disable Rx and Tx for the VF*/
-    core->mac[VFTE] &= ~BIT(vfn);
+    core->mac[RXDCTL0 + (qn0 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[RXDCTL0 + (qn1 * 16)] &= ~E1000_RXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn0 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
+    core->mac[TXDCTL0 + (qn1 * 16)] &= ~E1000_TXDCTL_QUEUE_ENABLE;
     core->mac[VFRE] &= ~BIT(vfn);
+    core->mac[VFTE] &= ~BIT(vfn);
     /* indicate VF reset to PF */
     core->mac[VFLRE] |= BIT(vfn);
     /* VFLRE and mailbox use the same interrupt cause */
@@ -3874,6 +3897,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index cc3b4d1f2b..9938922598 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -47,6 +47,7 @@
 #define IGB_MSIX_VEC_NUM        (10)
 #define IGBVF_MSIX_VEC_NUM      (3)
 #define IGB_NUM_QUEUES          (16)
+#define IGB_NUM_VM_POOLS        (8)
 
 typedef struct IGBCore IGBCore;
 
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index ddc0f931d6..4d98079906 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -160,6 +160,9 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
+/* Additional Transmit Descriptor Control definitions */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
+
 /* Additional Receive Descriptor Control definitions */
 #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
 
-- 
2.34.1


