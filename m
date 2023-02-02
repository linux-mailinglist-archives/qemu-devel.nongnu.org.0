Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862E687673
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8O-0008UH-Oj; Thu, 02 Feb 2023 02:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8K-0008TE-UT
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:50 -0500
Received: from mail-vi1eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70e]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8J-0001eR-4i
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUSmtJlP3IPVR1ORJa0AWsK7aD+mnWlyz76VYz+29U0N2W5u0DZd7JJgfUcBVofnK3eLkOqT0InmfOe7bURmAdl4gMlO4tzedYZPca915JEhJMFQ4l0qP2eqyc3GC9I+MAHXR83rTix5RTC/AgaZff0au+b7LzZ7ydKdgT/yNrUOrUXSz5c4gRsfuHP1BKelGCz1YMl0G8k48o1YBnC6pMvVik6QqLL3QZZIMVSCL3C450x5K6g+1NEoqyWFi7wmHmm1rKZ1Mih/F7uu0KrgHahN8Ng++26PxKa9cdxDLxx4zr5wMLlXduphkZbVs8vVFwO1w2HDYgU3yhyl+Q4mSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGuqrlO+Z2nsfb0B6f4bykMY9zo8Yyst8rI1UR4sd3s=;
 b=WTk5/jo3Y7zZEHfgTbZySFzP1lhyyXZPuQP8xfxP6m5lt3Nf4Iew/6utS15iPnTgpBvBy0ZNcX0LEfH5vtWF9d0re8gurCidPlgFDFbmup0juuuUbgl8iIM+sNlcm2aW7Ioc7zwLtOxmdMQ/mN0YzTiqB7g+PNHMaIK2AW0+kdL7HL4OLKNGePeONaA57H3FjXm3d84mFDnCudr95JAKvPQwvCuC8yphgnp3Jg1Pi3VlvhBfC4wmhSrCachXZ1SQicSftN/paapI9Jyjh14EPkFKrApYqWIUEtGXcNQN0Iq8T2wLdHCYr3u9wF1byx46OUVklVtAmNrSUWplVBgVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGuqrlO+Z2nsfb0B6f4bykMY9zo8Yyst8rI1UR4sd3s=;
 b=jZ4OsYaaeno8z9Wg/V8j7wA3rnQQkwuI9FeGqRlcVYn9ETGBVpRDVOIS67uXzCHaA6L6DuBd7uM5aNTSlq/IGbhjAD/iv+m0h7GpaIn0HhSS/ZL90Qm2R2GuaB1R1chG2fjvy8/Aeq6DEvYUzbBVRsZKswYcs7pFDEtXpQvKHPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 4/8] igb: implement VFRE and VFTE registers
Date: Thu,  2 Feb 2023 08:26:44 +0100
Message-Id: <20230202072648.4743-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::10) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: a069eef8-758a-445d-5ccd-08db04f0146d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IcIBIw5ILmBOGotalJpyFhLAS6K4jBTilWVTClN1HFuDdfVysHzjnLuQq0HzoDAWADzlD/3X+CwMC0nZq6HNP6XYVvMt9asd+Pln+V1xxi4CL7SaEpAQOTzHYDehvkDFHWbwl1K7g4O2oAN4gqJ2qV8ZHb59N75oYgRvXZXRoZKDvgXEgRrhABWNjGzClTo3agGXxg/lNANZOw1bTJvfbTtkdtxnIaJFOdHVZhxg8eLnMQc517x+YOFmP+21Lc4xfa9YpGf7tKoIgBMjYH2jFLA1vtRHX4Jr2jGgWstYaTx0/4gIPN1xtT/OwcFSUtRWj++VTv1TZ5L+YPqtUAuNydeuV6/ntWVTwLfGk2wXf68XVgnP0m2VGtN04vxYrNJHaeny4POruWD+YjVcws287gd3Thr6qjKaqSHLSYGTW6b/xEs1NNly6C5aMXtuU85rnipp3DEkEEKiN0OO8g26T2W5691wMOOVCCYo2oycIEolSmjxwvm/uMJhzpahppFrkScmJvgva07I3EINpDnihzrRDWt7on+9qe/lzPx3DjQUxQpqnBZt6+VsLToYYv2SrJR9yc39dC0DWWqFgnwF6iGCShkleGs/LCt6ojKhsssLED1Utg9VwggK+52mhqBPVqy4q2tLMLKDqciCFB/pbVKm3R0BSNFc7nFERv4cJSzEw218GRqdmsu+qqcHjf/ZSdezDVBsM/Cjfj3D0pj5PvV0AIwHGyS8pOomcpm2CE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJf41lxSC0F+TRGsJgvRMf2xpLzvM6NmtRYoEt69Rq/yEwJzOAJDnzRnpm1x?=
 =?us-ascii?Q?7hANw/AOv2pPSlgWaDmRytyw38SkAChWGKRS07BLks0oClQnYwBcZGzOvXso?=
 =?us-ascii?Q?PqNsQFJjBbv1EWSem072mb3tl69sLDD3rIZGe+Wsz7l6frHbSIt31V7jHLDm?=
 =?us-ascii?Q?JLFAq19cUNCkaVxYug/EzxZXqDM4Zal0FViCw9TqsZ8xVGJn115wgU6zAany?=
 =?us-ascii?Q?WcdvK/vIwgrDl9VB+HCXDLe8eVEGmagtChPADskVp8ku5PsUSOl9pX0OCUtC?=
 =?us-ascii?Q?EX+8E+/iXqlHOFx0DU3SHVIBP9lRMGy8aWytKKGSTbXYFrYvzbt6vW/xojkI?=
 =?us-ascii?Q?A5m0p9P4vnl1gLhLU1uzwWkvcydILm+j3mXVq0l3LwSJOtSKArtWxFg1wKRa?=
 =?us-ascii?Q?ke4UGKL97Awh3i4Eo3V2yuScev93uSIfOSfLQNfM+BUMKZ0MHzGz2m/8IBYh?=
 =?us-ascii?Q?nmtib1TiwgCa2jDxoe6xctE9DF1g8EDknp6JzB7Tu0Ji8qgP6rYX0qwS+wb5?=
 =?us-ascii?Q?lHlI9aRVHM2XWEUELqTk9wZAYpQeeCUJGIAZKKuq+/y90RzR7B1LebEyHOI2?=
 =?us-ascii?Q?M7wcvICmxiYaWoscB9wNXpiXSKbF2ot3yYOgx05/bdkiroa7jBTRew3os4O7?=
 =?us-ascii?Q?8mcinPrL7mYIMtAAKNRP4/xaWgc9t5EdEEzBn3yFWuVOYfIU241wC/NEryCs?=
 =?us-ascii?Q?sIeJSTpEj7tXN3Q0De25J9UIYc4me6ja119g0ETbroTqDbIwzFKOo3t0ARcd?=
 =?us-ascii?Q?SmMCm+eLD3q5LefaznVdI3WxquiIq7C0kv9ytBtLdRbOCPBYr8B8ZcT6QVgg?=
 =?us-ascii?Q?Qm4SXOWjQbn2rfB7KbpBChWw7OpgtghZkaNSICKAvbvu2bHnfR2+Nw+zv/6r?=
 =?us-ascii?Q?P2fg5wlw/j0CRHaLq34iknilxskQ/xoS4idM3CsfGrKFHHxkAjvlPJgOLJDy?=
 =?us-ascii?Q?779lXWEk6lNT5EqGa9dQLEgh5uyTVnACPSFuzfJxOkxQNB0+L/iFPcXc39qx?=
 =?us-ascii?Q?2LNVUzLuwGvrIhxnfT+4vO9dRu8tMn92oBJ3+vNajEAkEihypHyN0QfvxYKd?=
 =?us-ascii?Q?io0kzjA0cPNHYdqBXMzwVzFe2cgVj41mf1FC30nIJadnTUiDHSjM+dCeSqjw?=
 =?us-ascii?Q?VLEngSGAf5hFRsapwb8OPpmGMsHKSzrvfMaAdmptbtgFBa2A8fRW+U/SMhPU?=
 =?us-ascii?Q?NqIiCZQJ4X8yutwoAhWAc7SMsdNpjws895WbYtfVSZ5C1xpi/t3SPWKC772n?=
 =?us-ascii?Q?y5l8h4ahxgwwY/qfQVch1jVLNfB3BjzKNxVagcmpUtnw8MTmKYF3du/j2phP?=
 =?us-ascii?Q?/D+ghbGdtbuKUSxK7NBjrMferRUE0y0xWgehjju4LV/Ygviom4yEA40mQbRa?=
 =?us-ascii?Q?C3qkH6aaHuQt4KoqRG7e+hn6vdB3ZG72t2A90Yr0pA4Vdg1cEULV/vaKfRiJ?=
 =?us-ascii?Q?zw1HXv76o58XzvOloDvvlG7d071jXaHmu7ANDjKsGwYkymP2BJpgkJqJNOy3?=
 =?us-ascii?Q?XNxmSxz3wi9/BA6klXEKq4KymVIg1rixWCekzTvOAOkV2xWc7EOLl2YYso8M?=
 =?us-ascii?Q?2gUZYyFLYm9AkircG+0ShQVrGhJzBNaSChIWqt1bllNVvssIl+emzZHHIRS5?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a069eef8-758a-445d-5ccd-08db04f0146d
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.5368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjKZ/xso+8EnC7ELM7GJiQFxjfxKLOcTrD41esg+SjyPZAy3Qb6Ii5x4+h11YuZ7LOCTxYk3cdEcgxa6JxGa5Ej7VCCr+H0svYaBsypjlUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Also introduce:
- Checks for RXDCTL/TXDCTL queue enable bits
- IGB_NUM_VM_POOLS enum (Sec 1.5: Table 1-7)

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 39 +++++++++++++++++++++++++++++++--------
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1ddf54f630..8437cd6829 100644
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
@@ -1562,12 +1577,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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
@@ -1966,9 +1981,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
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
@@ -3874,6 +3896,7 @@ igb_phy_reg_init[] = {
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


