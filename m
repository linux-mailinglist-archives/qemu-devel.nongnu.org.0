Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBCA682955
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAT-0002Gd-9w; Tue, 31 Jan 2023 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAC-0002Bi-EQ
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:55 -0500
Received: from mail-he1eur04on2117.outbound.protection.outlook.com
 ([40.107.7.117] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA7-0001hQ-S9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkkcGfCpxWm0K21Tw+w3LSZoiDxKqJB8TzRxtiPnqs9nPJ87cKAPsmBujxlVcU8pZSW7g2Be76cQ9NllRM5pU4qYJZyXe5oJLwEQQY0T0gWQcyrcI2bhVxLPje32N2vkMzc8IDGxMSp3TecL3IZfQrQqpaFYKLi4ZoiMWRq6piTEXXpBY1Ozm+E+WIMjLcM7T3t6uFROnr5XGkUmAvYvS93ZNn4b35DZpPwA0OWo8Epzv5Ywjwm3pBmYtPL1Tt4kzLKx4BNHT/20BmxzBdEDbtIMYqM1vrnZwevq0NpCYRue19NiheOIXU1mYt+y9EYbM8w8KWMq9crh60fAQ3KROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ac9nQzUo0J0ma3UmL0+6PFHjwxSzMYM9UDiqc+YBoQ=;
 b=N3dhcVXnVs602ID1rzUxTvtmqkQgfZoN06FVChhr97BaJV+D756po+ES6/vf4iLa9Sbw24nAnLZjy7XmDBMOt5KvFm7tP27Pz84LAPEHvinnrVTznpnoBUrAad2RI18LuDMQ5VbmAfNZxsg/zVtfZdcLybiVj3Yuspm7JzGx8Iuse3r5rYcClkhOAu01/F7FjNU3a/A9rUawrpN0mdWjrByHixkEb42MylLyvhWc4PCpmzctmdfjVG9l5rTb4IwcYDp2mzuElPrhMct8fbTCvUChBEjGDy59BNtypbwZ7CxjUDoi/0EDHjSb+dnsbI/QUBsatpxeqKzQ1gqfgcNqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ac9nQzUo0J0ma3UmL0+6PFHjwxSzMYM9UDiqc+YBoQ=;
 b=SwW/FNDQ4AWFg79jVAvEbfvgkl1eq91vwF/pCAW7WYj04/Il9TtMXUohD2EdEKLYVO196CpP79Zt3cxcXHPLuyx3gt/QR/86xFpky8d48bovILrypRfaYpKNPkGv1TTaMs8x8EfcQhnvgQCjTnOg7qQPpdGhvqP2ijbXAkpLd3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 4/9] igb: implement VFRE and VFTE registers
Date: Tue, 31 Jan 2023 10:42:27 +0100
Message-Id: <20230131094232.28863-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0050.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec36e10-da08-4250-c995-08db036f7d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GmL5ciqd4LtzjAoHUOwfxpkHRKS9+leRcA7bTrtpERVvWBD28hMg3Nffbtuj8Azeaq/ocAZhgC+MwkuegOqe9r1K2nR0As8WaEAkGEL7i3WArnq8v2+tw0TJXXYX5dC0Ovp7iRfCMfkQsxNiHH7F3j/AVeWaqtEwoMaQzxp6tjBBXL/VlO6Y/k/OkdM69aBcNIIQt1/05szUCkaYrYS3u/v1giB4UcxN+8fkUD4BfZ2yHfQutaIIemUwRpNTOc9iQPms17qSrnPikSjkCOGYzCntxRmUVExyJNpPJwzActMVAAD5mJYbghihKn96QbWadKIcveMHuJmxINEUrb8aVdBIgVEDPQjtanqadjAqn7vLln6RmeXZQqKZla4vpgeyLUZWoDcK/yPYm28a/3beByCsKcE7CiuhoBSUT6b8qutPHWu520ArUxuu5NEyzAxAUDqx+CFL5FPPJEcqc+qS4UqM07Z5joKwzvHxncOBSdQI9Sx/YkXNz8yperx36tTSapuzrRWKv8TVIJJebAqCxjMFLKffRa/a1Ezh441Z0ARmBPCkYPYRSG6085ssuEJ0iKbbuicCRZxM/UrXTeDRkTwCPmsxTKEUA2fNHzDJoZICpVX1mz5Gf6YR7B8I6OU2Q/HtseicHBRROZ/Dp8d5pTEZM4xUAn7Xma7RR6AI0FYGFEG4S5MLB2vwXgtjE7x2gA0D5NAFhoNk3gH6IaiWoT3d6fLlOtOVosTGtwzVy3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Je7zSs5sQjA4H5avqd1vyo0i33s7Tn3iyYQEM1Bpq4yosSiCxvdMyTUUQvUA?=
 =?us-ascii?Q?aGYwaaJ3VeqgvPkzLXIVcHP3zy0V5vU0RkPNZ7/l+mcILFFNaThWJrucRHVT?=
 =?us-ascii?Q?3qSLg/ZPdF4PFBDjRNmMkvrXC8+KyzwJGP6pVU4luzpkOeyrcmIsVgUiQ1UW?=
 =?us-ascii?Q?GAlRr7d41chAVB/K3//MP0vcyj8Ti8NXcy6QJbzKVeyQIaC356L+vEgAUQR1?=
 =?us-ascii?Q?usc0O27M9yQPhEvWJASh0y3rJFXp/p8GkORbJvps/f90UD1SGZ0FVbjgCyDi?=
 =?us-ascii?Q?ZEnepBApU/jxM3cdhNZtO71AE6dHfJuqvtHeyAh5411c37yJiikG4BRBAPCR?=
 =?us-ascii?Q?P7FqLAvlmzdTAAW/SoG82Yxp1GIwuU0pgcrS/BJrL9NEN8tiuv6gIZdBx3cq?=
 =?us-ascii?Q?g74ZUe0D7nh8aBpdjeaYzwY/n2eW+7GAewA6egwCsgVVvfWyUR2tx97lqZ6T?=
 =?us-ascii?Q?FY+TPKNvCFkfZtRZ+2z5dWTxiAthJ9qSMJXBzdT/QXkjzJVUGHcnzqqzWPUq?=
 =?us-ascii?Q?GQBilxM20ExNdqZ6vt+xBz7F3W5dMK1/4mEEBps8vPoZLQIAEew7dCChKmjZ?=
 =?us-ascii?Q?fhcdmIC/BOH4Eq0jCfuVHpQZNS1FZ3yfLLCPVUrzFNdIfYkQvOZIt+VfKRyM?=
 =?us-ascii?Q?HSJExcgwFai5qH+KiHGaEmuzOQ8vo2vDcqaxv1azxZ1UHdSsQLUCCfuZJR16?=
 =?us-ascii?Q?LDwxboVbyezkXQnwS73qmXQ0ziEEw5AZAPACXt+nVW8ySqGz9NUAMj1qYU7W?=
 =?us-ascii?Q?7LoHrtuYcNaOkI0zdMEjNFEAnfLdlgUCuGf0oaSPviMoSwZzzjt20vlpU1Ma?=
 =?us-ascii?Q?6o6AW3XVtZ3UXXvv/JLbqEDNj5jlbeODkxcVIHLgRINXtiK1xEhh9nWJu8xB?=
 =?us-ascii?Q?12TzZxe8MfkzMhPWHCJ2yVCPCJgU91/9wlBiLuzCZYRluJeMpsGOlDtvDJMl?=
 =?us-ascii?Q?vWu0yB8GbKLpmEP8o7AGH9Q0IdK8ALnmxC1z/1O+0lwgpxR3ykug43Z0aC2Z?=
 =?us-ascii?Q?2sdqR/FudO4N6fVDKWG+QvMlhEc0peNHsbWca4enAQBEGY018icVb1orH98c?=
 =?us-ascii?Q?8MmQu6NxzkM2gI/Sh1mu4XSFb6k1yvSMJJMrib35QacUuJVmx92/mbvSRmST?=
 =?us-ascii?Q?/wR/818IjmagLfjePRtCEExxYV2xluyvr7g0T988LrZ+Oy1HZloqsZ3GRRdr?=
 =?us-ascii?Q?FP3bbOvo8BO8CJv0aHLOSdm3cuYpwJktkBAKakssuR4SGJJrinvH+7lYQpqL?=
 =?us-ascii?Q?HLVAdwrCE8RmtuqDHG22/BWCmOHWbyhnlEktMjUcYuRs070ozYkmcXVM4xrK?=
 =?us-ascii?Q?zCYM7N1r+5XDJvbtc/To/w79+SKwgSfCWCB6z4VuQ2OBzpoxZn7rghAyvlz9?=
 =?us-ascii?Q?k8ZvKzL7FSjcKhdwMxGs36OfPsmvkswK3Y0tTDZlkfR0JuowzJ5Auggm6gi8?=
 =?us-ascii?Q?qt1Tkp4JEtM97FvMm8QCTZv0eC8UO85A/Y/gMJAr29vMIoVReX1gVf4iVtse?=
 =?us-ascii?Q?Rd1WYeRvJ2bKjTA3eCYEG1E88Y+YTxo1/cvyIDvdzAsC80iZyPKl3D+YG7tW?=
 =?us-ascii?Q?HxG7E6q4pELKYM1UPaaZ425moD77XuvlnNIFOsnoHpyE4nfmA7TLww1vb7zg?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec36e10-da08-4250-c995-08db036f7d09
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:37.8197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q0onai9KrDELV0ilvYG9+2WP0eOhBG/ErPDjt9R+YSiYn5bBDnguPcEv8YC5JXcEwjCVP8TmrBUfP4pb2UBKRkIXpdrbK5omhkzfbfwPG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.117;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Also add checks for RXDCTL/TXDCTL queue enable bits

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 30 +++++++++++++++++++++++++-----
 hw/net/igb_core.h |  1 +
 hw/net/igb_regs.h |  3 +++
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index e78bc3611a..4a1b98bf0e 100644
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
@@ -1005,6 +1016,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1564,12 +1576,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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
             icr_bits |= E1000_ICS_RXO;
             continue;
@@ -1973,9 +1985,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
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
@@ -3881,6 +3900,7 @@ igb_phy_reg_init[] = {
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


