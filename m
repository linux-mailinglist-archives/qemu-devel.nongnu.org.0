Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9939F6C465F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peul7-0007Re-FS; Wed, 22 Mar 2023 05:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peul0-0007PM-QS
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:46 -0400
Received: from mail-dbaeur03on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70e]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukz-0003H5-6h
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9pPkAPh1TyeUHLGsd+vJLDuG2PZaiZWjz0xbnQs+W5lMT2WQTUbKFjsw1uqxltR9u+G2OOrmz+L/nOlCBvjF7lzt6X4FsV9sSnFLuF9TuZ9x52KROOogJJGdx87cm58ECD7mxVcXPSsps6nWIPXwtEA48z0yW7DXhpgcjGuuZhEvJNy7MtcSptS0kVqOwE7wBpOktZIUUQcXG1/KoYzTLitwEwtnUX6RSJ36KN4Ox8K0D27D8x/I6lOo0+YDAPp3ERAgt2Q/KTE8inlcKkSdYsAkxUYcQt4Ahqyr6Z6NPAzq2TYiFttDDa4L7w7ZG1zzoziJhuJSAbTUzkkELW8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1mSlE4Q1GZuXB7rgEIJdkUtBmVrJxduwNsbf4AuKRE=;
 b=GVyBWhi8hsN22ZwQe21zywzNO/JGYgEDae57gELMQutBlMTSrHD88UhDVXxVylqgkHlgxTkUwe/8PPyILDT5d0as5H+ZdOb50b16lRgFWWA1sTz6ID0ysrOLg4OsBQhjKjx/5s75ZuFOXWAYqflrToZilB9LO0/zS9WoA4JtbjhgDyEIiMvvfaAshWSQQZx/vnu7YNK7esVzw0NmBdtU2hRNB401bW9ptacK8wBs45GZD6mx2CqdC9sJ3uGQER+/TkKL07Blf8np73xWocokmKqsTBk0XpWxTmBmq+AHLnfxNi1+f8UOiJtuhhw+d9GEVPGSz42NFSNovPnaHjpNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1mSlE4Q1GZuXB7rgEIJdkUtBmVrJxduwNsbf4AuKRE=;
 b=GpwM739izgF0/3Ia8n4oa0iKK2YRKZvE+F5/hziorUdJoQMwO+FltFDwX7C3E/km58gvE8XukjL0xbzOcmATXfPUpqOoenMNjW5qs8UAG2AQuPW4ahwTitNxlns1jTGkYCUoP9BIUiveewUprssnghTMYIs3dWpehi5ljvanrdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 4/8] igb: implement VFRE and VFTE registers
Date: Wed, 22 Mar 2023 10:27:00 +0100
Message-Id: <20230322092704.22776-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013EB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc4993a-ddfe-4156-e480-08db2ab7aee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1xMfyGiuYYu1SM2GQ08NyqLlIn4cSXN+SzvRdVkiFHsIsjOozCuN/kZbHFaqZUNHej4ptjWPxyuXB3YimDPNFuRzr64gFScbxmWFL53vgoz2Sza902dHrwD/4awZbyhNnjL+p6gBL0B635DKYg+PRUd7hQeX/RyAxxq7sEwWtpHsNTSNyc7McUZqxAj7L57Rwv9o3ZiFrLR0C/Qe1kqWXljJ+W7hlOQKdYtvTXRDizuo0umt9qIarzILEWXRTBRqyDMj3olwPoYUIOGpPlsm+LOvn6bAv3sTZOvUNwpe6DuI/TUdGY522KgDTFQH/BpugundWj7wNR7XOlEF32MExt+JC24NSkzzDjYKqLfJqarwJmm2objJXrH/JGgpSbAoHMah6/x4OOSSkoN6VZKwYIHPhMGk7YXfudQEGRYSP6r4hnk3mkQhGn5coxl2Cd9mrR3Qqoygu0tl+XdpRKCIOfw+EUGe8AZC4MsW28k9Jt4k2hOVIGnofMyzV0XIPZkgyqI2BTsFFAJuw7fz/cnxt99MEmt2H2N0rN2UwhVW+co2Q3Wk3rhWEeU2y9FDo4juziPmgXYvBXJ6terpdifCMiA7m+jB3OfaH9tDa1qngLjabOa/ycCP2mD+gg1wASPlKDOJH7MAprzwv4e0Yezlo+F6PBLA+98KZy0Fb6XqpeYxLjvC16urL7XDzxv96iEd8CvDhauUzXVyoVM/Z8drNkI8J7nqUe3X4Th/SCuCQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QNWsZ2ziyGmnXe5Y84u3d+rkAL0m65Vob32+Tn8uoBGDxNFxAF9bc0gzGjjt?=
 =?us-ascii?Q?Qf+WI8HLxhbVuopRV/K6xT6CtqWy5wb0XNuvoBJbqMQQkrUacqMMYym8Odre?=
 =?us-ascii?Q?b12gEk/vOmr62gOV3f84sfgeFTF+3o7Eglb93kbrfYFN7A23ahnWcrjle+RY?=
 =?us-ascii?Q?ft7OWFqMzYLjmNWgB8RkvHatYNtngBICu1Gl+IMZkcU7pB/uRjTDsoXwIfy2?=
 =?us-ascii?Q?ymm7O4vQuw6CzJ4vYX2HogAE1grBK0+sBwwk0lJxMpG4lYiI3EwOosWscydR?=
 =?us-ascii?Q?tCugnQih6WzwMmNdmGx8hzYu7y5HEPxq+3lRPJqzeHgHG6th/zIirQvlxfpA?=
 =?us-ascii?Q?XUnjCkuTXsUTivowBumwTdTP0Wj6F0gS62KQgwAt5SqOa32aCyEfqqy7gG7B?=
 =?us-ascii?Q?qDKEdKeK+yunLSi4vSSMAfxvunnEBNIyA6Y4CZ80iPVxPTQqxG7d2fmOYQW9?=
 =?us-ascii?Q?1W9dt63d0ih/ejTviZtklVmoCvVN3mJg7DMxUrPvmXc6wqJzWLMTOlNw90GK?=
 =?us-ascii?Q?MbwADf30rPp9hkYiIfvucFnoAtb0uD0Na8IeukdkkvSufRCc7OMTc/CQCMne?=
 =?us-ascii?Q?vaIUERMS5gekTKuJXTYII3p2tRp2rNnR7Y+oQUgiEIEX3k2zDihPKdZjohZb?=
 =?us-ascii?Q?e/GnH8DlkW+mDJN7+fY26/bboW+3OaexuLNvYtbi8RHbeZORaOS1yeiqQVeV?=
 =?us-ascii?Q?G2iTlyHdl/pRt87j6crkcvyG6/NmqDE66vtNMnZ8GJMi8gg9h+1MjequxfSo?=
 =?us-ascii?Q?iCddFjmnA7IUxzhSbA/8xyomuNUu+H+3Vxr5Ou5y2V4FHEXUlFaBVjwq7516?=
 =?us-ascii?Q?kclcE0m4OMHh4e+2vmH9VeE6OvUkbDrfOt15KEmiNmrFaYpD6tnfOfWq+2aF?=
 =?us-ascii?Q?3VbMVnoMAHtNF08iZLA+B+81eOWU4sEwV5ZdFCOWkakC4IWX325XrE00KmHB?=
 =?us-ascii?Q?0N3JUBhiRUB1vOcIwNA7gLrbIhhoQ+vn3JboLxJvSGKOBrEBW6Z+dIGOsbUu?=
 =?us-ascii?Q?yy0rqqI+ujXYlH/xGF9EBaoJLp/fzIXIjwzW0F2YDOJDOpZ5uxn3l37ZUt/D?=
 =?us-ascii?Q?t2WF+V2Y63z6Emz+ygX8kndWNCXc0hMEibGimAnJHmBD2zHiTAfR6fqaJ97B?=
 =?us-ascii?Q?IpSIl2Ae8HWVD8+v7TU80Ezh7ke7/Qq0DKgx5YoTclAL8LDaA5MMy+hbaPiF?=
 =?us-ascii?Q?DQVloeDoDT/qFxjFW8bcEFqZqyJoQ+4E7QWpP+dipxa1elZ1cb1l5pLadmc2?=
 =?us-ascii?Q?gDDipP8G2H9jZEOw5k9SjayZJVo9Woepsj8vDjXfRJ7/wRbhifOxdkHMSRtJ?=
 =?us-ascii?Q?plWYZOiyjowkuCtUzyyE9qzGWvvrfqq25WY0ii8N3PPKyToIIX2jDOqZOejA?=
 =?us-ascii?Q?h09HDkedhkKqUKAfeASzC+ZyFwoEXzVs4YN3jgFGCsWG4sJIrf9xBeA1ryhk?=
 =?us-ascii?Q?syuS5UHSbrVM6Mq/PGvd59Tf849/PLyKNeV61VY9S0LMXUsJO2d74+ABZS6o?=
 =?us-ascii?Q?cnrrQAsQYIgQHhvk4eJz7+RE0ig3/IqHwBKYDQyLIPROxvmI82njZy4xfSDa?=
 =?us-ascii?Q?wvLAmLRLc5k2gWUwA4HKRYHnd2L0hBmVZ63eq/Zmdg5XQO4SkECdbGHHhQMB?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc4993a-ddfe-4156-e480-08db2ab7aee8
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:40.6499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDESXuPd2mYWBz4Z90K9wIrrj14pCyHax1IXeSoKTxbClSRLerR2Yo57S20yOjYoMucRuwhYIJKdd98FvT9kLWXyD9F83ZqAh/bIuuii2P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70e;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
index c575d4a615..7c8f665f07 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -783,6 +783,18 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
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
@@ -792,8 +804,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -869,6 +880,9 @@ igb_can_receive(IGBCore *core)
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         E1000E_RxRing rxr;
+        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            continue;
+        }
 
         igb_rx_ring_init(core, &rxr, i);
         if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
@@ -935,7 +949,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -969,7 +983,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -992,7 +1006,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1008,6 +1022,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1568,7 +1583,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) ||
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
@@ -1974,9 +1990,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
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
@@ -3911,6 +3934,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 8914e0b801..9cbbfd516b 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -47,6 +47,7 @@
 #define IGB_MSIX_VEC_NUM        (10)
 #define IGBVF_MSIX_VEC_NUM      (3)
 #define IGB_NUM_QUEUES          (16)
+#define IGB_NUM_VM_POOLS        (8)
 
 typedef struct IGBCore IGBCore;
 
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index a658f9b53f..c5c5b3c3b8 100644
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


