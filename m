Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA437680F0D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU9r-000257-EQ; Mon, 30 Jan 2023 08:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU85-0007f1-MA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:26 -0500
Received: from mail-he1eur04on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::730]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU83-0006AH-Ks
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV7FTPMOIgHW4FRB4pUQYj0llt1megN6pTsXA3Qy7Q0KiPrAkE825Qfwsi884WYH/seqRbL5FG2JTB6eBoDdOtrou3M2o/18yyzGpJKMR0NlSRWAb0/W+kMYfNwROZCno7EORwY7i8VAvnBxt6g1THMAyw2F0rSc+HzbgiJRrAnTNRHv+G0sCtHDrmlvm4yRHiC3lKSOj5AubCjo3fCvSIYKML2eGSqmgf8tw8EvlsVBd/Sbs8tSNbMWkmMmdEmD2SkkpQoI010NUDGFY9fUz3J7X4WpcdiLPWvtnRL5EpcTOILhQ+z8QK2isvBpdiwPv/2Q8FKS6qS2cqcKOzwXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dEwcUviwkk7zELZ7ZkgQ3KfYSaCoF4Qc/Lx7BuSMhk=;
 b=kUVo5BuSCRabWnxJD4qjpVDHYKVqlrNgEeA5tkaCR3YD+9KgLX3H0VSPDGIuYOwBimpemSATBW7WAaKzsd3TCP/S7qibhj0EFOCMDFF3M4sT7Y1nW5AAULz9Lf5Ujorh5XESWegr/zqAHI16raE0/gXRuRRtfnoVJH8+k3pZr0SS7HmkjbMki8sVWb3fYJ5bANafQ/Eq9vGMaKFnuHXWMMAdAJsMvIqyIwITHPEwZ6U6FGI9sXCCJE/P5GAv/merVhBhuL73b6NypFWi/J3OleeLi7vyv6c3L33WmV0ArRxgnQprJOaH02p7p40bBZeZg3a8tIU3K8Xm0g5kmCKAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dEwcUviwkk7zELZ7ZkgQ3KfYSaCoF4Qc/Lx7BuSMhk=;
 b=caadPfHUh206z7GiecXvkm5rRJGAIkDD3PAWfvMjxvfaaRkE8Sw/Pqyks3HMByr7hrZWtRvEt6J574J+eNoBABtWBREpdUlOymKZpzYYtSBNVfnoexvZXxDv5RzWHH7IiYdxfRcMVVDtLy21fKVrVu9nUATEpKjrG3tLbmc/VLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0885.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:10 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 3/9] igb: implement VFRE and VFTE registers
Date: Mon, 30 Jan 2023 14:22:58 +0100
Message-Id: <20230130132304.2347-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0039.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::8)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB0885:EE_
X-MS-Office365-Filtering-Correlation-Id: cefeb85d-16d2-4156-4a78-08db02c521e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5IoOuvRz+2z9s4eZgypuaHkccfB4glSVeTjzurvPk/jrEMMQPho0G+x1olFMWn4lUmC1aBV++kDM6xHzFs4AGwOAZjuac4EboTK3gsJ+kuehFz1Vuz/sVwu4JfmCynxTKXuFTOFpGF2cIW3A7R/syFIqypmB0/21kyEfv5hssI5iQ9sYvdFUqnHdQAFnqXA70jzn5TrZneh67fHkbyw16hiAiAaCptIHjB5jDdqBvrg3fN6zuiYnirPEvp+NildSZLa9d7ihUmj+WJ36kXjwuDW1KITG9abZFE3BllrYjlH1z4bTtax/OQzkIrh1kwuLgiH3Ar9y64jDkTtzewQljm8SQ3p3dxmoJBZBwNbMZl6Tl/5ZpNkU1ufQ+F3j/dHhxTdaNT/bSqV45OqDwEYY0tyM9a6/b6fCmiVsonUjPfaIs6OPIKRTkHpEBtKGexdysJBwptbyy77OJ9X0o0LyjNn3s+TjNqUgsnmQYuwvvew5a0hYsOTp0W7MHCogT0FuRBQtMbry0pNRQGeP7RaL2b9God3ETHpS+/FILzZL55Irm4OFuySSBF9YqsHrc4F31iHnQumK2oHcQT9Y/OydosUItCuTTrl+psQ9A1fL5VVZ32fCWfNuJVtU76rImg5LWu0xQqQHkgnkfCj/ceF1t6ic7/Xe4FyRaQVM2yGkiFomQw2FKrdN5L+HdXJJD+LmzBqBOppDRPMJr/FEQjOzuxc7M9t6ZtpAl3hA7KmlUzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39830400003)(396003)(109986016)(451199018)(86362001)(38100700002)(36756003)(5660300002)(8936002)(70586007)(54906003)(66946007)(66476007)(316002)(4326008)(8676002)(66556008)(2906002)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(26005)(6506007)(186003)(6512007)(1076003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxHVKUwlOUN27inZ3dds1Y4fGW3P+eK2g84tSU+V4Zb7LvOy5enmrfjHtYDb?=
 =?us-ascii?Q?MY0m27gbRpWwlz47ghOVJZrYOFKojm9HBosZDd6xvYD0zv55VY2jPeapcsel?=
 =?us-ascii?Q?2Nijhz/c8Mugf9unp38mh9bmiOx03ZTfhJ5Vu4gUjTGAHbIm2So9RGSr7byT?=
 =?us-ascii?Q?VplosqB8Wj8YA7yB88dz710QZWNWRVY3EMrjKIU2JeINYtn+Zf5Vt538DIfh?=
 =?us-ascii?Q?qpNMafYfUoP3GNIWOnHtKeqRvyxHNK3zxj/62aAGpT9b0kFb3WqQ2gD1YPjI?=
 =?us-ascii?Q?cgVsDDKK6Kdta6BlQLZ8sINXnvzUQHfUheT4XUKz/SydTkKD3lMAjMqzjPEO?=
 =?us-ascii?Q?QRMTagnI+2nEQn3XDpdq77aif2faDQbYeap05CcqHZzCUooQ0vQQVvSLCmXW?=
 =?us-ascii?Q?UYaaj9SnMMMhquOZ/zGpnZ6EZMkjG2TXrfuVOnNKH0ct2HMhcbp8mDXTZL5Q?=
 =?us-ascii?Q?Mx6MpsvxpIyyuEziRTitxsl3P2YIcxY812x6SAQ9gf+t7H4ckPHFSbhD2UEH?=
 =?us-ascii?Q?yjAGF7fsAFeh5Gnyq9nouSI+HS6EvilKZlpv5exak2O5gd/4ZMZwNjLGv2DZ?=
 =?us-ascii?Q?8JSNeXHMW3K3Gx9SVzLDTAta+2RKSqiYGL+L3bp5qe/ppOUpDROu91k1weMH?=
 =?us-ascii?Q?RKEiEIQcbuu59KykJre0WiVhjBINky9S4n7+29vA8Ge4cYd0sVx4+MqsxDIH?=
 =?us-ascii?Q?xrlKa7ZdpAwsE/zhW8EU3h1KyPdnTpQkfxLtSwRLpblVVVg+MJ11FwL+RIRn?=
 =?us-ascii?Q?uj1bf3JzGfETKhrgGfWcm0xULZbI9I14ppljZR8VwGC9mopC6VGn7F0mMrUY?=
 =?us-ascii?Q?9kM3PEU15DYuUtj92dlsXol7S1EXJ1q74DGd//TF9Ojg4pQN+ApQnUhwJkbK?=
 =?us-ascii?Q?bNWm1uhkbF2Glo95kyCdkfQBwY5YWEcP5SK5EFJ26vHQoowgCwi7gnRlRAoE?=
 =?us-ascii?Q?zl3Jo2E5fAfbX8uk7Lg+tVb6/5IKa6nCpHi3GQUY9ZDXV3FyVcmf+ija3zFF?=
 =?us-ascii?Q?lSEptdrrRgOAR78xwTH6cdz86XZiGn/EvUnA5j85v093N6eZbOvqXVwxER/L?=
 =?us-ascii?Q?U/Y/gBgkShu2BEQax9beZplHLnsJEDYsCZq7gPA9iCcvSqQ+jIPp5rNwCY3v?=
 =?us-ascii?Q?LwT5P0Hn4jiv84yAyFrBQOvBQtG+3E1uomhzTc9dA1eikxhk5ndvrFA6eHIC?=
 =?us-ascii?Q?7YN6SoolRKY4ZDm7mlmV/fKKGoN/OSsWNDGENCepML2A80TJoHVavxryHtPZ?=
 =?us-ascii?Q?pa3ylrFz6Mj6eKkNeaKwr0PgzN5Hn18zu20zzSZkR4Qmn3c3ZfCTQXcTNsAP?=
 =?us-ascii?Q?EaUCV+7EkWil0hUo3fAWKRNyhvM/3v0vs71o9jIyPRemjTsyI3HScZqTB3Ye?=
 =?us-ascii?Q?K3WQo1eUtIJ1eeZP5J6/RgY2m3n+qIE7Mub28jMr0nK/zbwICILT9uXrkrsn?=
 =?us-ascii?Q?dGcQBBqnaVTOum0/Vxp1mfD2OgGC8YwK1ZKp5RlHeSdTLx5Jwn6C4c6/V4qw?=
 =?us-ascii?Q?AAzeP0wXVd4+zLUaKKhyx8/R+nY+aJ1qEcSwbQoLDz/M4FqXJ9KHhaoglfwx?=
 =?us-ascii?Q?EhPW9dNWhTsxuJi9NMg3Tg+6YPSG374WcrzHRBJ3uHhd5XTnLUuFrca8gMAx?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cefeb85d-16d2-4156-4a78-08db02c521e8
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:10.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugNJJX7ZsKpEQ/7c5SDA6loSjCx4fy26lcgOrCvPaVV/IS0HRID3XwZBXoMLmE04aCM+ysCyM1O/pVRqoquN1ME4ljL3ff6ra+btzIy/+Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0885
Received-SPF: pass client-ip=2a01:111:f400:fe0d::730;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Also add checks for RXDCTL/TXDCTL queue enable bits

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h |  4 +++-
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9bd53cc25f..b8c01cb773 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -778,6 +778,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
     return igb_tx_wb_eic(core, txi->idx);
 }
 
+static inline bool
+igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = txi->idx;
+    uint16_t vfn = qn % IGB_MAX_VM_POOLS;
+
+    return (core->mac[TCTL] & E1000_TCTL_EN) &&
+        (!vmdq || core->mac[VFTE] & BIT(vfn)) &&
+        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
@@ -787,8 +799,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -1003,6 +1014,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1486,7 +1498,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint16_t queues = 0;
-    uint32_t n;
+    uint32_t n = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     struct eth_header *ehdr;
@@ -1566,26 +1578,22 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         }
 
         igb_rx_ring_init(core, &rxr, i);
-
-        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             retval = 0;
         }
     }
 
     if (retval) {
-        n = E1000_ICR_RXT0;
-
         igb_rx_fix_l4_csum(core, core->rx_pkt);
 
         for (i = 0; i < IGB_NUM_QUEUES; i++) {
-            if (!(queues & BIT(i))) {
+            if (!(queues & BIT(i)) ||
+                !(core->mac[E1000_RXDCTL(i) >> 2] & E1000_RXDCTL_QUEUE_ENABLE)) {
                 continue;
             }
 
             igb_rx_ring_init(core, &rxr, i);
-
+            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
             igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
             /* Check if receive descriptor minimum threshold hit */
@@ -1594,6 +1602,9 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             }
 
             core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
+
+            /* same as RXDW (rx descriptor written back)*/
+            n = E1000_ICR_RXT0;
         }
 
         trace_e1000e_rx_written_to_guest(n);
@@ -1981,9 +1992,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
 static void igb_vf_reset(IGBCore *core, uint16_t vfn)
 {
+    uint16_t qn0 = vfn;
+    uint16_t qn1 = vfn + IGB_MAX_VF_FUNCTIONS;
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
@@ -3889,6 +3907,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index ebf3e95023..c8ce5b1671 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -147,6 +147,7 @@ union e1000_adv_rx_desc {
 #define IGB_MAX_TX_QUEUES          8
 #define IGB_MAX_VF_MC_ENTRIES      30
 #define IGB_MAX_VF_FUNCTIONS       8
+#define IGB_MAX_VM_POOLS           8
 #define IGB_MAX_VFTA_ENTRIES       128
 #define IGB_82576_VF_DEV_ID        0x10CA
 #define IGB_I350_VF_DEV_ID         0x1520
@@ -160,7 +161,8 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
-/* Additional Receive Descriptor Control definitions */
+/* Additional RX/TX Descriptor Control definitions */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
 #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
 
 /* Direct Cache Access (DCA) definitions */
-- 
2.34.1


