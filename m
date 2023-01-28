Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C707967FAFA
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9v-0006Z5-VI; Sat, 28 Jan 2023 15:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9m-0006Xg-Ef
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:39 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9k-0005Ml-P2
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIrrhHsPl1R8sq26sAyPki0IBpUNGes/TrycDtDIsDQJKWY5oq6rMzY0zydoGvVry6S58oROxeEnIhe0/vJQp6dyArowFOBYjheXnzaQ8uK9c4Pj0ijXEwK3IgnustrHmbq4ol4y9WLAwpLcBYBvC620uolYkvzFnvpLBOOFK8tGjOAe5vhGnOFCcAMyj0c4sFOwcsM9OnNyii1GWki2duCMBSFrYSbZnYnUIT5RxWV6xI1ZYOyXWTg38hq8+qg6vVmuWof/69qatUE+ikgbKx55NdTdTt6nZlkqXd1PgFOggdoJNripZReUM7thr0DfNwMGk5v+k0yf3ueXEqz8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4NtwebJjmDxYRN+/Qti38Rz25CD4QDP/bcVm6J9YVE=;
 b=lFs7jLCPb3P39DJnODAOj2tCpof71EEfgn/08jXHTv4lRtVhUMVbISYJbSININ8LzqsYy56nfoDl+oDtoI3HJwzKVVcx/nVzwIepe4sg+5zhD5rNdOlAchgkucl4Lb6Qeojsjexp4bRzH7tCYC875FmpylyleGuAwgna0BOAqUN9xlgFgUrjZuqNILGIdVxPZJWSSY2I3C6lYtcEVFjstX1FGO13fNya7RHg97RgV5ZQPOiV4uOCBLNYsL7C9L7wHIi01sbpJceuvIyklV7r2e/pH2k/34q79FwUOBa4hOwha1Sdwi/qmCEoer2oJr/D9Bniybbg+4SDR3YqmV3dJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4NtwebJjmDxYRN+/Qti38Rz25CD4QDP/bcVm6J9YVE=;
 b=N6yzKNAOisUVsn+Gioi2/djCVQBi99szYyEhrojb5FMdqs2RZBHCbTppPUWmEELEa9vT2fxSmPY+2NmYjSrZUA3ejxQfLnq04PGqTzK0vLqrzNnfba3OIUjofMxqGyL4LIScQmWVLMtGSZFvi8NKoEiZctG25OTCnouqXt+x4pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:20 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:20 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 3/9] igb: implement VFRE and VFTE registers
Date: Sat, 28 Jan 2023 14:46:27 +0100
Message-Id: <20230128134633.22730-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0027.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::26) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: fe135395-a761-4edc-2b15-08db0171445b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZFi71Wnk4ccaBD2vOMGlXJtK7Q4tkjVEy7VfjRGdG8jEgcrjd2CAuTk0WfX624EqnVyHW6Qq6DtqUwWpYNBjLM2WtyOmGjyzmYny5Mug1OEjgizwinNC5pHiefSO+SvMWkCXsJvOV27eYpu5vp6wI6bO4di8zLgL37EqfAxJDErmzbQARke9Vqmg5BzZGFuAhR76qhRhwmWVZn84nv37c4EDvvVuIHjIpaocRlg8XdT7bFG1+Vs7WDhTfyLGNwNCQC/KDXq0QjIqayLpQsPU4JhoObyqX6VhZh24kxludZow+dKW3H99BqfVVZCJWyF323QeAykTjgjxr7YzljTxwEXGKDuyfmVSKHOmj7YDnnRgN2e4AiZX+HvjsND/UYtYFy9V7QZsSDGGW9gATEW+ZQDJ6woDJ5HoTB5Iv98oXBBS33HBWqqiY/i8X6mvhHV/5uZwSr3MawUV0L4/MJ+D/QwtU5NT5GVYj/Md1C3oGdX70dV39NWbnLiBIX7YImx1Zk715GigzaSK9wY1EP1h8yWLgh/cb+iVvvxJ8CF9Gp1CNqWEhuFyvL6o7YiZB9CYuw37IAF5LBsH+MmnpG0zturjaMTfP0tFhrk1qjvbNLKN5T4ke9gJV+ah3BC6zQlbQ00NYu/okXH7vjiSUcX53uDwO3MROCbbzsAlqgoDDvSATeeGLo8zl8TF2AIBc+qKoNCkaqQ3q/S0A2zMOQXj2iWToUtWvchKRhx0uBiE6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nO4gk/EH9m8yA+dLRiITLFpGU6p5BS+fYj4dF6ps7EkVBdLAsBcI6PspXZLE?=
 =?us-ascii?Q?hJem3AGmx1TlWnhW+VOQgrSgCDob8OK9J7Z0F8Uly5BZHihJIE4t1EcBfktn?=
 =?us-ascii?Q?ehQQl8EpQ88bcs4DcRdjDR1WwaugAHlcNjfT9HmLeLcZ1S6nZpuHdOFA0Sx/?=
 =?us-ascii?Q?xc4CoDhPR0zS0YADovyLvz7PI/MCFRTn/0FkusnMV37CUPD1ZUtEF7KHtJ00?=
 =?us-ascii?Q?JFoy8K9s5RPzv2IkTEw7tbXDrvgBuaB8Zp4jpJeJXd/2mkhxSJ2fd/D5RIFF?=
 =?us-ascii?Q?eihJSV13rAGimkL6GByDtoYSb9X0vWIqSbMikE/O6cVdrLGPsU3HJUbrGg3a?=
 =?us-ascii?Q?E1dpXkrNFjxPA9kS5QGKejsR3kTLcrLrD1RdT+6nx4T9zS3bluoYiXeBHnEb?=
 =?us-ascii?Q?Q8UtiWy8jxYJK+Ru7p60yK6NJ3kIJUHi+a+Vf7T3i2WDYv25XlwjRr8wjM5r?=
 =?us-ascii?Q?8ChD6myYt2V9WzUhRJp1r9xIlTwIOINu19FHopqMbzDQARNJX94qjS6Q8fxZ?=
 =?us-ascii?Q?osSIfJwRHwwVoWuci3a0oiSUU+bFT/QA9Aschp91oiLu06dWxOj098MYMZ4N?=
 =?us-ascii?Q?MfBwGG6w55lPtxLsGK6LblXmnd8vQgsPPjPiTyIA0d1KP6xglFbt772o7/D9?=
 =?us-ascii?Q?LZXDLbl7MQ9nm7BK9XVCN8mC9ev3HkNTAH0RzxYZMZkdVE2pt1V7eOi06zJ3?=
 =?us-ascii?Q?Y8dlnuyJW48/W0W5LHCwaZ66Xd14O8MtN+Z7fkibME1n5YFyDNgHhBR8McL4?=
 =?us-ascii?Q?x2MjgusDooK/Mkap43E9XX5Oq9GCCkbxqb0WgcCCwuHvi+tzv3qS8EBtz05F?=
 =?us-ascii?Q?tKJb9iZfYCnTg4VUWA96aGY+rRpbp2ZcviEiX4yPER4Yw+Ss7D93k0c0cs5G?=
 =?us-ascii?Q?GL1dFOLxn7ABTHtTh+rEtNBnFD1xYNk8VJiXzkb02Jn1TWD/7n1Wdwn+VwvN?=
 =?us-ascii?Q?Upk97c1IlOP2GqnMJQNIXT+KjhrK40pD4PxYzpShuAPGNp0ZZ4fWzq4eMyk+?=
 =?us-ascii?Q?ttMHnwsEswpKi2VV+X5EoAkX20hQ1dM3ugpF8Pt/+Wg+xR02TkIZqxzwVCOQ?=
 =?us-ascii?Q?tGwi9Up4bZYdB2bHBXhLG0rJHQoXXb1AkqCqOuNNFBGCSrRq/y+w2ySUWQ4u?=
 =?us-ascii?Q?BbezSGbIryqJjcJGL6jQM3nbwzwix7TsUvqSD847ICTpuk4BEcQAzqfMHp54?=
 =?us-ascii?Q?U1EQL6M7yOi6YNy2rA8OmtKOD/EzANmqWy72dgi+ZPhii8fInfpVPPksC4jF?=
 =?us-ascii?Q?Ds07gLI7j8Rt1KBrMv1TPBWtKH5ZRgWCXI4aKdoGIsgYIWVwFpzusLTAydW3?=
 =?us-ascii?Q?S9ELjMKfHHNwf5QMPEnNf0KSr3wq1apogmUqtScLJj8G1Etw4wGuHCWwsPt8?=
 =?us-ascii?Q?fnZy4hcoWEMToPvPJJ+qMEGdEN5gVft9GV5X5kxMhOBXnSrFMiKjxisnEzjx?=
 =?us-ascii?Q?hxiEr446FvQAojs0dhMVkVCsDh7kfa1bxlq2OTu4DCDqQJfQXL6ThgJOF7R7?=
 =?us-ascii?Q?5xiqA43QE/OSV6yqDrtWWDalMhlx55IqsM9bwB9h8yYmDJqoetkliF2ErmI9?=
 =?us-ascii?Q?uNAv5LkDEwmXDLfhYLNZxszQ5RfEbiAwAfLhQEs2VBSEE977g+KRf9ykVvMx?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fe135395-a761-4edc-2b15-08db0171445b
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:19.5001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67Wo+V3BSYWV/lXc4J3/3BNTu2ClMGMijrpcPGtxheHPlM1u2dx+G0iKYRj0BXkXp7sdO/0TcVMPwXe1knKe1lXd/oSpcbGcUVUrWQQiDCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=2a01:111:f400:7e1a::32d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 hw/net/igb_core.c | 42 +++++++++++++++++++++++++++++++-----------
 hw/net/igb_regs.h |  3 ++-
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9bd53cc25f..6bca5459b9 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -778,6 +778,19 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
     return igb_tx_wb_eic(core, txi->idx);
 }
 
+static inline bool
+igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = txi->idx;
+    uint16_t vfn = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                   (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+
+    return (core->mac[TCTL] & E1000_TCTL_EN) &&
+        (vmdq ? (core->mac[VFTE] & BIT(vfn)) : true) &&
+        (core->mac[TXDCTL0 + (qn * 16)] & E1000_TXDCTL_QUEUE_ENABLE);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
@@ -787,8 +800,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     const E1000E_RingInfo *txi = txr->i;
     uint32_t eic = 0;
 
-    /* TODO: check if the queue itself is enabled too. */
-    if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
+    if (!igb_tx_enabled(core, txi)) {
         trace_e1000e_tx_disabled();
         return;
     }
@@ -1003,6 +1015,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             queues = BIT(def_pl >> E1000_VT_CTL_DEFAULT_POOL_SHIFT);
         }
 
+        queues &= core->mac[VFRE];
         igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
         if (rss_info->queue & 1) {
             queues <<= 8;
@@ -1486,7 +1499,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint16_t queues = 0;
-    uint32_t n;
+    uint32_t n = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     struct eth_header *ehdr;
@@ -1566,26 +1579,22 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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
@@ -1594,6 +1603,9 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             }
 
             core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
+
+            /* same as RXDW (rx descriptor written back)*/
+            n = E1000_ICR_RXT0;
         }
 
         trace_e1000e_rx_written_to_guest(n);
@@ -1981,9 +1993,16 @@ static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 
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
@@ -3889,6 +3908,7 @@ igb_phy_reg_init[] = {
 static const uint32_t igb_mac_reg_init[] = {
     [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
+    [TXDCTL0]       = E1000_TXDCTL_QUEUE_ENABLE,
     [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
     [RXDCTL1]       = 1 << 16,
     [RXDCTL2]       = 1 << 16,
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index ebf3e95023..084e751378 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -160,7 +160,8 @@ union e1000_adv_rx_desc {
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
 #define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
 
-/* Additional Receive Descriptor Control definitions */
+/* Additional RX/TX Descriptor Control definitions */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
 #define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
 
 /* Direct Cache Access (DCA) definitions */
-- 
2.34.1


