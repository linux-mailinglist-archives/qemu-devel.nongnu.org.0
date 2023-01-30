Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5F680F09
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU9r-00025O-ET; Mon, 30 Jan 2023 08:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU83-0007UK-6K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:23 -0500
Received: from mail-he1eur04on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::730]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7w-0006AH-Se
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTlKnhi+SOZEc3dhXQVsCkU1kQrHgQion9QHeG1tZQNH+byUK3t3BbOXFZaTG+Ti2dXMZ4VMSgm+Y0P7arl6Q0yA6Q1eT2m2lYP32l9bbbPH1dkK8ZYRdExj0WlBJKXsfJ1+fGfrjVVg80G0JT36hNpqCasjDmrk0KkwdHwk85gVmgagC126BknLb645D+zsA3sLljPoXK9esx6mED+D4x8M3XwCKPxLJi5DZkiu27/S239ibXJ/tYGS+7PbENpsJXsq902XLPqMiqNJEDV1Ne5biEyoUt1jRyNPJ0jxm7YURwpPG1mUAwzuOnoKzJ/9BlR002fnebe0H0LSyhFmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rvm2rwDWBQtu+HtN0+N7rPIxREvWJKQMXr1DfdlB+E=;
 b=E2s03+nJyR6qFn30OL88cmlMLApz9r1jenmrl5pxhwMc3RFfsh6rrVwIPjaftepjG+fK0lqvQG/fyWXTh6rLvtN47EtgYaE4Gkx8A8qmcRhaok8QzPv5EA3NMEUs2N5YggpzZ3eBJYM9ov+b8xh7HzxPcwwz3EShuJGW2TbOQXKTLyUjksPpDg+xbn4wcaGpuqtC6nm5/z4F0I3iJS2awDwyulsG2YirqUFT5hCPV5cSV5bwc8+YUy0dXfTFbQdh9LS6h0GOarnti0l6vnw2+NzobYBZvdcJXOrw4KjPwiMKTXl3Y1tdsTUMkTSOYblfcl3PUeRfZ/C/yuHO484Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rvm2rwDWBQtu+HtN0+N7rPIxREvWJKQMXr1DfdlB+E=;
 b=M+6Ba82VoXZqQhLvcedh+KolYHDzEsoBUWSHuYDVFdvBmoxHCtLc1IaI4DN9017w1k+l5E40Py1MK6vAi/EKhNy5zuszyJY5sPpp4BC523JSDKJTewekx2Lio31NQbKiMbxKSOWHYGYG8bLaHkmsl6bQHG8zRYT59ek3cLfbTIs=
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
 13:23:11 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 4/9] igb: add ICR_RXDW
Date: Mon, 30 Jan 2023 14:22:59 +0100
Message-Id: <20230130132304.2347-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::11) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB0885:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c02263c-407a-448a-4a78-08db02c521e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hj983TxjAu8XjKTlOBrBEmUHALJb07rqUekyNZsutSKvpvE9RON9hkNpcPOPCAdTaLhYx5YV2falL+Ns+pWBvVkqToQ1y3Ev6fIm4XieayheV4RpLtndDjIHuLwato8Fynmq1rVoc3qytbaZR85s8oDOJyCe2OWhgR9rz9y1o/YE4izVi+MfsgY9r61ykxyMnRvd95qcf5K8gdCE6+yFy539z3c87eBKZExrtSJSQ8v9u2ueP7ndn9kt9+qSHCftQ1B1llLOkrnwi986vt+6hI7UJiZFZQFlQQBgoqha5MnillmvpsvcKlZSnLE+VstRQU2aP7RouwAC+JrgPV2OW3qvL8DZvmiaW70eowhfmrV80xh2CAtYzq3YZuiBDtc3i59g+aacQtFK9zo4Ou9C2XdQvxaV5n7d/dUaw9gxyzLhG6+C43Ro7sWtRXZFLTQvSEyFK1TiAgq0Lpc5M0i7RL2LHxpdc3HXRjrTpwXfhCf3JERshyK1AEzW8vEID+qA7si7Dm6I7AQczwXqBvez9X7EZR7pFkgWwl/JGlNWgUjAdRKnLmC83mcmEpXYeT6viCceyxpYH0gpzjcYqX0pbseopBiZEfdnGEAmdg4ZNlxOhB75ylttoLmbPfW48rAqupVVghqtiCy3GxiXR+IpuMU5QWdl7wcsnBtTTyMR0c8wDxBe63P0TSD08waO0NVEgcE2vQ9a0WAFIdY8PZDZYQJp73iOwTTGCY+Q8DZ0f4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39830400003)(396003)(109986016)(451199018)(86362001)(38100700002)(36756003)(5660300002)(8936002)(70586007)(54906003)(66946007)(66476007)(316002)(4326008)(8676002)(66556008)(2906002)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(26005)(6506007)(186003)(6512007)(1076003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4RAKlHSUzeChErRGL4apppYDijWjqmuvK49ru4R7NwHK9cnToBVqQ0cJzJkz?=
 =?us-ascii?Q?fjAaiu0gMGI5JdPF5PIISOXm0OBYD0CoEECF1mayM8hmDWPpB5fQUsRgrMTo?=
 =?us-ascii?Q?x3Sdj8jNiXSju78Uwd121Dh6vLGJiVB+icdISSGO08GmFLKZnTC5YNUMhXOJ?=
 =?us-ascii?Q?zaywA44JGUcWGHGeJ9M6VatZLOgu/VHGVf5hwVRaNoy/yQiTXDbuLbNBsxvh?=
 =?us-ascii?Q?McgTpz7shoOCO7EAR0Trr8W5xKH76a+MweWvu5smKHxIWuqGevI+Ro5Das2p?=
 =?us-ascii?Q?GZFVcbqzCTRRckpVUQGLQKrkcUbZ4yxKaOwoHkwPQwubg+okCfp2FexYPP9z?=
 =?us-ascii?Q?3NzlMJGxrr2zN2ws+fw0Ndp+V64sYV9kKsLwInqMkyEcKkkFmQ0YHhUhkiya?=
 =?us-ascii?Q?3t1VA6okwg+wV4Rs+ZsjLOoFhcB+KKnINUqF1nANQb4gtyCIeNbzmVmMrzcr?=
 =?us-ascii?Q?QrQmvyRRDijRkOF7ntLvwsIaHTfuXMC06TuOj4YDZC6U9j3slYyQ5FI9zeWS?=
 =?us-ascii?Q?QtDPb1LbsJK2jH7kn895wKKQ8b2KwzfciWgTgqvUOKnROJ2R25II8mWCDUWC?=
 =?us-ascii?Q?OvdsqZ13n9yKK8dUcrDEZ7jJrgGTOnNRXltKPtWdKYIQLZNSqqMDoBQkoQe2?=
 =?us-ascii?Q?LeVCXuENuWT3zbBqepoLqv9J7W783BO4WMDoJgFaPZCYJD5VWPmO207uhmVZ?=
 =?us-ascii?Q?ydQHWaaBT5mvQ4T17NC4Pr4HU+HMlH+qn71O763ETzhFKWgG8c/R/7rDTW1z?=
 =?us-ascii?Q?P+JTGJRM3gQjLw0Jx98/fkxjXwAFrS9vmYr2CcGhvSYS5aOTBX/Lv9CnS0+5?=
 =?us-ascii?Q?d3TFteqWcLp5CxUxKhPajpRRmzzN48xZP6/rR8Vqy0uhKSh6boHeQI+iC2Fn?=
 =?us-ascii?Q?82d94uMAg6r9SPXfzoEpZtJRUcbPHN67T525ixicQiQREvZ18oflYGDMPclQ?=
 =?us-ascii?Q?sYAvAoKQ3RZbMutCup3zdvZCjbSntYH5c4drcqS1bAH4ewkHH8iqIKWszkJ6?=
 =?us-ascii?Q?TA+sCvDXlxJ8QkT8eo1ThO3oXPEWhLxI0p+cL3220KvvaWFLKbk0Ck754gV+?=
 =?us-ascii?Q?1/A9k13xad89YNM/OmKnQLB0tbjOzAxwt/Z0PUpTwU3F77+d7qbqYG0Wc3TW?=
 =?us-ascii?Q?tZda3NPfWKJw3yQJkJaU8RCjFo3FdZ/wUZlMYbv4YPj/bEqQwy6w7UOE5uHE?=
 =?us-ascii?Q?b4KdEflG7wOmbRo+eQFxZ3l/j6y/VAnhtiAIyQDMG5BiSCNmXqCddQEvoNLt?=
 =?us-ascii?Q?WzPpNE8DKPMW9bZR6YWxX7hRXwkcooWF9N81mDR997QcfJuHicibZlmWrGry?=
 =?us-ascii?Q?LewY7Lq5/VgPI73PFclb3L36uqagNhG2gYD2uAE2kpOPn84tO3AF0bIWeWCz?=
 =?us-ascii?Q?6W1xo05mhu0IdiiCuFK4at2ivg+LdaZIrB1BukM+vGRHATm6jr1gLQoznaf4?=
 =?us-ascii?Q?iURNByKhRD6ppB36ayCWqBqVOmcrdnvC+8Yl1Y1ICXS8tkraRynWJB/OI7Pj?=
 =?us-ascii?Q?d/m4GZe4ymMkp6wE02/blSs7b2LyVbI73Z11yJi/YKZw+YBHyz1rLN72NRx2?=
 =?us-ascii?Q?CvP25cgNeWOO5iXDcSrj2W0zLbqYL5ak23iqnL+8rZ8C8cnYfZ0g1psyDvl2?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c02263c-407a-448a-4a78-08db02c521e8
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:10.5459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lc+6UZskxQ0EMTAYbgmiOFAFV+Yg8Cl1HfK/wXmcUyVwHZvd7xPNXZXCmvBT8lpaQEP3LVHUUslwmtlHP4vDSGTFRakPFtnpz1RPkpJVX5Y=
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

IGB uses RXDW ICR bit to indicate that rx descriptor has been written
back. This is the same as RXT0 bit in older HW.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/e1000x_regs.h |  4 ++++
 hw/net/igb_core.c    | 28 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index bb3fb36b8d..3a3431d878 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -335,6 +335,7 @@
 #define E1000_ICR_RXDMT0        0x00000010 /* rx desc min. threshold (0) */
 #define E1000_ICR_RXO           0x00000040 /* rx overrun */
 #define E1000_ICR_RXT0          0x00000080 /* rx timer intr (ring 0) */
+#define E1000_ICR_RXDW          0x00000080 /* rx desc written back */
 #define E1000_ICR_MDAC          0x00000200 /* MDIO access complete */
 #define E1000_ICR_RXCFG         0x00000400 /* RX /c/ ordered set */
 #define E1000_ICR_GPI_EN0       0x00000800 /* GP Int 0 */
@@ -378,6 +379,7 @@
 #define E1000_ICS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_ICS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_ICS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_ICS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_ICS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_ICS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_ICS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -407,6 +409,7 @@
 #define E1000_IMS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -441,6 +444,7 @@
 #define E1000_IMC_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMC_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMC_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMC_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMC_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMC_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMC_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b8c01cb773..cea7c036f0 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1498,7 +1498,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint16_t queues = 0;
-    uint32_t n = 0;
+    uint32_t icr_bits = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     struct eth_header *ehdr;
@@ -1508,7 +1508,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     E1000E_RxRing rxr;
     E1000E_RSSInfo rss_info;
     size_t total_size;
-    ssize_t retval;
+    ssize_t retval = 0;
     int i;
 
     trace_e1000e_rx_receive_iov(iovcnt);
@@ -1570,8 +1570,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
         e1000x_fcs_len(core->mac);
 
-    retval = orig_size;
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i))) {
             continue;
@@ -1579,11 +1577,12 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
-            retval = 0;
+            icr_bits |= E1000_ICS_RXO;
         }
     }
 
-    if (retval) {
+    if (!icr_bits) {
+        retval = orig_size;
         igb_rx_fix_l4_csum(core, core->rx_pkt);
 
         for (i = 0; i < IGB_NUM_QUEUES; i++) {
@@ -1593,28 +1592,29 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             }
 
             igb_rx_ring_init(core, &rxr, i);
+
             trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
             igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
             /* Check if receive descriptor minimum threshold hit */
             if (igb_rx_descr_threshold_hit(core, rxr.i)) {
-                n |= E1000_ICS_RXDMT0;
+                icr_bits |= E1000_ICS_RXDMT0;
             }
 
             core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
-            /* same as RXDW (rx descriptor written back)*/
-            n = E1000_ICR_RXT0;
+            icr_bits |= E1000_ICR_RXDW;
         }
+    }
 
-        trace_e1000e_rx_written_to_guest(n);
+    if (icr_bits & E1000_ICR_RXDW) {
+        trace_e1000e_rx_written_to_guest(icr_bits);
     } else {
-        n = E1000_ICS_RXO;
-        trace_e1000e_rx_not_written_to_guest(n);
+        trace_e1000e_rx_not_written_to_guest(icr_bits);
     }
 
-    trace_e1000e_rx_interrupt_set(n);
-    igb_set_interrupt_cause(core, n);
+    trace_e1000e_rx_interrupt_set(icr_bits);
+    igb_set_interrupt_cause(core, icr_bits);
 
     return retval;
 }
-- 
2.34.1


