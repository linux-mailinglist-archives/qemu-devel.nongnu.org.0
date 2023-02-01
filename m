Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC0686534
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7S-0003iP-ER; Wed, 01 Feb 2023 06:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7Q-0003hn-6h
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:36 -0500
Received: from mail-vi1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::727]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7N-00059m-RC
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFT64qFc6G+uI4C2HT16XnZk1FmG/l5NmwYdoX1YWf5AQ1wpF++bZjaXxW8mqGW5smII1KQOAzrLLSs2IxiJ+vuyFIAWPZtziUspeYm5qdbtwuco4Uda6cxsHzB7FUS3BoGpCY363qvIzOZ4PLoeN2G2hq9vo0WML5gf7XBLe4KT7xNgPtFqKQAzethoSnDTDkllUCyfAtlpxir0CFNfy+l/yKSffaLkX1dbhpIyhWS1e4eNMu28Kkmndsg7YzZC8eV1iNWbT9ux3KYD55VZ5Sw+sh09mDMA2WXHKodqCXUIw9ISY9Mw9c48tvt4RJEdUVW2y9gZYJYDGl+h/gYo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+41KNgkWG5n+HRPdp39N8FrPuf83zWFNOXt7ItN+sBA=;
 b=AeHwtnz+Oo+TaLs9WHGiZIBTN620KD/sTOY/BSZpZNcpfKNhD2YotQgFuo1vBB23J77We0BKWrPAaXsLFH2gINgOIduGO6fZTczzbTKDZFJ0WQ4Z1thTlPrgg7j4AIXgyaCyDx/K4TQ4jfN14KN7FSuPVdj7Kpu+mJIyhZB6hACgvfLs6hD8uCFHKsnJ79YLbKGFEoBQo10vaXtP65/Mr/+/IXF5Ai8RCJlKXlPOyMiswJJWtDf6Yg1U21eRF6gVrI8sodWGVikjJe+nWYUk7rzCOb6OX1+pc4K9cZn1Ox64g4XUEs4FTmQh+8Z4ofPdX2dCzADbex3TLIYt62EOqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+41KNgkWG5n+HRPdp39N8FrPuf83zWFNOXt7ItN+sBA=;
 b=I81JtVXdvtVvGFkAJv3kvKsv7U29oDD1t4NJnbX1pwJXWQ/M1N53CXFraN/Sxf+z8MCxn1LLbJzP/9mPxDuVsGWcH1Nc8e3hqDjuF+sLkvxjQ4Qi3zS8w5nKDNTKBkVcVZNDp+2FMF8hPRpykr7OF/8Y41Twx4By/x5QoNC7TXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB5P189MB2551.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:25 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:25 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 4/9] igb: implement VFRE and VFTE registers
Date: Wed,  1 Feb 2023 12:17:17 +0100
Message-Id: <20230201111722.28748-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0024.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::12) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB5P189MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9ddd4c-5c3b-4180-af53-08db0445e54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQbjZzLGY+s4qbahGtKHTFpPCr11uy5W5ahCZPLAxgdp8mvDJEG0GNvKGYhMMyHMxUHRdC8pt9y36HSil1VEyo+wz2qjyWxNy2TYQPQH4HrbESqzlbMwtvJPjXE2Ow3hhup+QRHGqRNhSvIRiFZE1C3C7XbntEuvmIleKW/mkCGb1rdzqnDAjGsa4C23e90Vub/HCP4fKsD3nAoDcH8MVdFJyWyUGJKK9JYLb3UUvEdveejnXulNUFcMW5F2ZugoTzJiEOZ5d8YNliVWuxyXmNhNb1RaJaV7SgJ31AcCBcn2b1vxe+fPx+I8ucDViQ0iqIgEV7wY712XMIdRvmzVeOpt7oDLvmwws0j9GJWrMPuXLWGFNVxWyI9pU5QMcHnFQ7s2u9Ftq5r2HVWzD354qoOCB8JPjQGSuqZmfwipmaOMQCEKH+nhVKm5F6Wr6K3p6W8VtS5jp4OSiF0QnTSHlLBbR8Ju+NvNqwK8qVituPzL0Jm+uIFBE57Q8ljGiF43QjGzvGvNGedtmjgld7n1p6OPkGCcojcMfQmdWmlc9Uv6Obx6z4pwcGVG1EpwwDQ+OJ4UJCoeY5Tiql5PbDNAZs28eR9lMabKysZaG9FK6+QbD4MgjQrAcwJIXVc8iXmd2V6yek650d4vE8uchrNZW8coAgB8aoFM0TjTV9eX4ZNbGuKJ9Sa98XHGYc0jj8zBGZ33xa2qcrfWfoDq3DkvU98S1eau/AEXZcqSJK77J9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(376002)(346002)(396003)(136003)(109986016)(451199018)(36756003)(2616005)(6666004)(6486002)(478600001)(2906002)(86362001)(38100700002)(8936002)(54906003)(1076003)(6506007)(66556008)(8676002)(5660300002)(316002)(41300700001)(44832011)(66476007)(66946007)(70586007)(4326008)(26005)(6512007)(186003)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wy+pgOKLGljKvwW+bNnXgbnCZPAde6iNXa9BKz906Eo75+aq+VFiqHti/cYW?=
 =?us-ascii?Q?LyQjFphbrcgcflSyRSq92fOAF3VHMepiYhHFMkfiyNmcqxNtWfnHQ01vH5R6?=
 =?us-ascii?Q?lsv8B4Us9l2BGDCZouCZKLIo10VQ78d7dCN1FtUfFYGEV0aJgLq2zdxSVCEN?=
 =?us-ascii?Q?ib8yiQIs4eLT8HDKfoaviN/QFXPt1GaI3IHRnk8yH6k9J/MLajH/BGLqjNpI?=
 =?us-ascii?Q?0VNEq+OkDVisrlpPclhmEDQu8d3OFNAugUV8y0M4DucFH1vjUcWwb7RzITf4?=
 =?us-ascii?Q?8jGfVMIv9dBPDad20Vha7Xnh/9XTj7lyzRaMt3qv2VDB0zevN4uAyWFKsG7T?=
 =?us-ascii?Q?hjTejsmwCAJAzwFLjXoNbH4UjizmNZlPzSex7XUg4WpoL5Rf1icSGDTqK5kA?=
 =?us-ascii?Q?FnQKvaq0zNU5yfz0diwy7JRDLi4PlfDY8zDscuiSUKI/NK+L7VjBIlJgpIcI?=
 =?us-ascii?Q?qslQ3LuVD8nBchvP4iD8UNueX0iFXd3EBBWJgxfjjFNKImsUsx7gcZjomU0A?=
 =?us-ascii?Q?29O0IP7XVD0rsdWTjVdSF0bIAIy6GuhUjFXIlfg5Mvj/34Yx5AlBXVecFUww?=
 =?us-ascii?Q?ets+YxH3bzY6J1soKLLzlxgqMN9a74OXYIm3s7X+1DV/uJG1fcoLdai+wSuP?=
 =?us-ascii?Q?PXWSt/VKuVhuW8rUngRqhRtjTujtZ68eWGdU60yamD9qvwJXm4V862myti9B?=
 =?us-ascii?Q?3/0ms64Jo2mR6ilxPN7EziFfzp0UMoUbYOpBPpj0JfHiaIBvMv0zjWl2KfEm?=
 =?us-ascii?Q?6TxNDEzaMuVDuNoF6ltTXJNSemUNqLySbfjQ+hZa6nHU3s3r99CzkjhGmxqE?=
 =?us-ascii?Q?tO4d8hxWK1Z43FsoXcfX86ZOYnQwd3PhMgUyH21d/iG+J2becrHawrKypDR0?=
 =?us-ascii?Q?B1fVGP081pDaEZ/f+hseGjdqsPCkXsTc4C4FnVwcDcaj8dMe1WywgsAIo3hP?=
 =?us-ascii?Q?UQ6FNKZtoo9GqaAvHglDsM6PVLqNdK5AAm/rGV1FrKjZ5PGZszKVc1msNE6W?=
 =?us-ascii?Q?pLFcOY8T0VwVhLVN3rjyOudswLJkP//3dw9LBK7h3X+Ff4R0qTt9IJ5qOT+M?=
 =?us-ascii?Q?8uboWzRuQnwailnuxlGm35Y6jLQIcK9GhE06nv5iSu32CWPNnQKC27gXd2l7?=
 =?us-ascii?Q?KqtfrOmCK9jueYuAIoNta6WDS4FxYPpoPRmTX2gIUTgqHk/WfNQwERDnhIpz?=
 =?us-ascii?Q?m/1aIQ6EaUhfXxOQEX1zNQdOWj6d82zNtRHbwcLGdXJOERWzA09uTq4MuMzp?=
 =?us-ascii?Q?QoWLctXssmkZkIFMWLpvbQ9fYdqVY6I0Wd99ZXhf5nBmgEm4dMoy7IBqXnzY?=
 =?us-ascii?Q?QKZ3PqKQ/ENdR9EfT9T5CkGEh/ryyjudcsraEj42mm9Cj9haAxHzfv9OMesn?=
 =?us-ascii?Q?EWNaDo/CHx0zmeK1F6iQf6izfpdNnDXliekxviTl7AI92/2fjk34wAu4kJP0?=
 =?us-ascii?Q?TPdZnp6hXNOd1P7P6oo1IfVUUu5wEc4PP2v78GyjtDRM1rQ5tWnEJ3vOPRlh?=
 =?us-ascii?Q?n3ERAGdnGbqkWIyxQ2vV9R/qv2eLDHH1n15JuLvLEZMSHy21gNIfiooDvYZn?=
 =?us-ascii?Q?OxBjCW5l3LFIbsYMuPYU4oXfsoEnnpdm/BQVd6vU05Fa9v7oMyeh+eQTAlHZ?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9ddd4c-5c3b-4180-af53-08db0445e54a
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:24.9970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcHxWE2k6LfHA86U6VaWWv9bhiqc1hFhXeJCl+36kI5XjlyLhqC26V+tbIg3DNVQ3CduRELRggJIw3g6Y4zQOv1MyzWA8cNiIuNp8wfxAXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2551
Received-SPF: pass client-ip=2a01:111:f400:fe0e::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
 hw/net/igb_core.c | 36 ++++++++++++++++++++++++++++--------
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1ddf54f630..c44b30b6d1 100644
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
@@ -932,7 +943,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -966,7 +977,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -989,7 +1000,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1005,6 +1016,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1562,12 +1574,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     igb_rx_fix_l4_csum(core, core->rx_pkt);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) ||
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
         igb_rx_ring_init(core, &rxr, i);
-
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             n |= E1000_ICS_RXO;
             trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
@@ -1966,9 +1978,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
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
@@ -3874,6 +3893,7 @@ igb_phy_reg_init[] = {
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


