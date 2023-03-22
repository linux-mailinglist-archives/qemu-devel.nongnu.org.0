Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE556C4CBD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0p-0003mf-EC; Wed, 22 Mar 2023 10:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0g-0003jy-KL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:14 -0400
Received: from mail-am7eur03on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::71a]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0e-0002CS-Re
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3oHfLb0Q0z+wmE/OLJBMLoR7w0yiJkW/D5NYOzcXmRmbPi/9qwNsrX5iYrfNEjasr6AnOs4DF7LbkK17bamRXmnjapW+bVoWp71ECxHynZPYhGzXlkoxmqaWNfOhAmSmReQr5iLsRnkAvi5GZA8DY1jFvkoUWB4rqpPRqdguPYBt03AhY6UlWEwddnipStMSOBG0Aks6B/JmLUOmuQI/4e/jlT3lJK5STleD1rSYMOOVinlVXTo5f7bBxM+nfJxXkbtbTzEfxAbtI3mLex09N4MKoAwye/D/WiLp35GKN3MVWAs7UfcDJ4YVsvRG66YdKM/599MxgZXQiXpIWZOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TmHXVaAeeLbzqF+uQBR0nWzC19O7J9V0iHqIvvI6rE=;
 b=PDh+RlSSorkD9OVfYMfBmmDvlrOPVBLEerJQLQQDJkAW1vMNcLUWNQZOSZ0TsGb9tB0ceB8ON3PnN94GjjVEYyZfjCa4h5JpYHYRYbllNZKScLd0yVEYeSNdWVSO2HW5qC2+twdglz5iGfyOhNoMbcgGXPQjG4ZvvL8G0Of01Ak8oIjoMTfIKuCCVGurSWU6dHDFg/pFaWtG1rhzDBlUr0yIDzz9WSRo8Rk58h5q1ywYAbeXm+67iwn95MFkXNKiJK0vsIeMLn46qYcJS34RehFSvoQcGXkVEeXdqnUndOFkyPMbjxa3kloISzRzoD2H4P9eSLZjUyM+UqGDJ+/bUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TmHXVaAeeLbzqF+uQBR0nWzC19O7J9V0iHqIvvI6rE=;
 b=YPgSZkTqPMKyK+Mqbvm9wvcVd6GmHCRA03/hdygCGOwIkYYoe94bLJJOBzhPhPQDPHqSRUfhXJA0ngXcSm7nh6YodxINTDAxcqf4EV6liVcIFrJvZ/S3h5M+e7KSgvTQVbMrrwEif0VAzX4rBpJiYgD806goRUi9tcPItVUH2yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:04 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:04 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 4/8] igb: implement VFRE and VFTE registers
Date: Wed, 22 Mar 2023 14:04:36 +0100
Message-Id: <20230322130440.26808-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0110.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3836f9-c690-4672-649f-08db2addbb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sq9Aub3bqqJuK30bCAbI+YBXr1XOXmfKa8v9S9jNmD5YcIf12S2c738HbOHCHWd3R9sr4XPgAfPax5f5uDLXSag9snEA62iN5fq6ixFVtM0No5WDYP710I5mSWhkXE36FI+fwCL0g0p4cnoAFpB25BIQbgd+1WWilFh1icozWWjL1LW6q+IshbmTht0MPhc7Gob0iK9b6vGcutkVtghoBWdh8sophFm1JpYsEIsNrZn3cEDt0nuQRewCN5Oov3tPXh/5dhYxAYckVE5MPwlXfO7PalK0iqwlChcKiiUYLFBwPTGvpWhCXWe13IrTZpj607VPg1tQLpAOqUsOgPKDt2rV9pTnKh7J4c5NLXu7cUPnso554KsIhwH8984Q3MKGf8bkoVwJHHTeP+IVR3z0b7TdLoiNcoHtiPpmmJG8FedNhNjgTQBhJPHxxdEKL0aXNgw39T5riqLJUUd4JwYGtoqX+TXs48x3ZoQWKrpe+6/hPKhF2umfZVsGatirNAzZI6oxhWID6ULFPxTbuSLLptwODmmzbehkq+9X7KNU0eGEYznOpOMvqXqTAFq5Jwi2ulL1rgJ0gRTfovXQiNyNRxxGIRqFrBep8j5bBSP5AExwhlSPQ3YqDl+X2m9SPdCAhOvryu1Oa/VFxf7LEAhkrjEvqin/IHxqPSv8/9xd0XsrsOFpTcwF7BH35Qe63Ux5bpWUdoosaen0/dedzq4M0b3P+MRBXVr0L/we5PHiuhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u5+ivS31al1Xgi8t2fKSpQBe4pJADuaNZIRJ69lIeESWpfEYORNK4qT6/u6+?=
 =?us-ascii?Q?U4eH9gEV3JdzDGXygl4hczA62v5/A+DLyb7TKDpsvEcku55BOSpMIYOpJGvL?=
 =?us-ascii?Q?wzwx2hfAdZm8cotN3SGbOWbSMoYU0WYiel5O1pP1KuEvGI5O8ZoyCgfjAhgO?=
 =?us-ascii?Q?eechPflpTrKvoRUIsg6aS3oenPaFjALVrQ4jntAnHsWft8/aNYSykxIfxJCa?=
 =?us-ascii?Q?7Wwpg9cfuHdrNnv1FDwSxI/eWbIHJcJsWbhj8Mth7/4YdqUMeCmHxGUPbHVl?=
 =?us-ascii?Q?zFyLSBYWkaDYZbk0aq83MadrQAtEiD4hOJ85dmXJdf9aLfj87+fnjaiSfq4Y?=
 =?us-ascii?Q?St7w9DJTmdH/qbsvXiJzXPTp9yy+qpvR36mKoO63h3N03Jt57n3sXY6avfAI?=
 =?us-ascii?Q?Q4wxBMDqf4pyi6MsoWe5Tk7/gNIY3+M69C1f4/GkSGVIasJG5+U6Hto/FBFL?=
 =?us-ascii?Q?yMHgBxSHN4/FoyqAPRqyK7p3wWdK7pY+RAMiz0EP/rzoNu0H4sOPXeAZAHGw?=
 =?us-ascii?Q?TpiTudBtg7HLweoJy7ZfqaN0oGkGsMysdc9ROgE2yfzny7AZFTLMR0kdT/io?=
 =?us-ascii?Q?xfWC1FSxrkZM6ZSDNIkjS34jXeYcmBXxvraHssrsj+XwDWo+mrPLlbzCPEAm?=
 =?us-ascii?Q?5SSStEtryYm3o5XvxFLJbNiGFkG6yLxI4Nzh4AKoc9NkbANrydMqLFAxyAxb?=
 =?us-ascii?Q?hrC1MsY1q6IJwoe7ElLgApS2kTfxRXcuL+t6VjwDPpW2GZTRMjvlnbdbdT+b?=
 =?us-ascii?Q?WgEMSwsUzBPZL9weh3NYpqvpwIasMusl4/02T5ewDTwhc+7xGM/so4sTdcC1?=
 =?us-ascii?Q?mVy/3+Yf7kwXxkrSfRpW9c6XFVmm+NWoUHJMYdsEkMB/EZoCV5zKoq0dRp2T?=
 =?us-ascii?Q?p2/KOEueSaoiMi+rvsODCMWsB+fzt9jQOhRXHX9Q3/koby+ROQ+AuK6UZ2Cv?=
 =?us-ascii?Q?VVckPvFi8Y1uEmhC1KQB0dPwCmHqOWYNqBfEIis7zdrTrNJ9bxjDGOZ3cXt7?=
 =?us-ascii?Q?vzALudiGwW5GsyLxbjHKvN/o9c1rZDXAAQdV9vAE9RhCWU9Nk9rjAWqdpjYi?=
 =?us-ascii?Q?uAPwSmNgOSEDiZe0t3r50mDd9lRh3Qhtc+j4l3RYar45407DslfZrvLqYjOU?=
 =?us-ascii?Q?FqTf7pf8QfyrliRhMRuEsj9zpEge9AaHgvzfgNHIKQM3NBZJapnuewrG3UFF?=
 =?us-ascii?Q?gmB/vEzxjXr/pyTRGBmPfzX4+peqt65L1trDjZTzAaQ9yi7ukBNt+pUtI6Id?=
 =?us-ascii?Q?wgSt4J9iT3Dtp2aKLwcVbo2Eoqq1HXFsqSgLXQHJhETxPhwpfkmn/3g4IVQf?=
 =?us-ascii?Q?Qy66PgW00YNhfEWJ06WbifMUT7AbUCuYHaQ37lN3lJHEe2AERdv/KfmogVfG?=
 =?us-ascii?Q?j6Hr0sG3QdZGPrTI1PkpQSYxOtwpCqLkp6OWz1zH8waQPgsNvV2Zb3wpB4Ko?=
 =?us-ascii?Q?i4l9AyKIld1vBJt/lS4VOwtYboMd5SQHuczWoiXW00w180m6SKp7Fi3VAFmB?=
 =?us-ascii?Q?LuzRfGcMv6ndvDky+MxYlOaH1ULU+2dOsOGrqNSb/Jp7KNxj7MlYiMPtsDF6?=
 =?us-ascii?Q?7bi14IEnaAcf++seLsPvb+lCS5QzRDbm8g/Rcbkya1dJBpn6kf1bLHoJgc8K?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3836f9-c690-4672-649f-08db2addbb7a
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.5962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OGePpSKl9PcgiWvZV4cJW0JHsHlOIO5um5G7qIpa/+dDrzp0DvomXXKw1FNnQhX8LGPWCrP6/J8b0AFLtAWkJBjczycVpBktxklYQkZdPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7eaf::71a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
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
index f799f7f84a..af979b4739 100644
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


