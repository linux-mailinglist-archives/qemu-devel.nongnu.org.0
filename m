Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418B68766B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8O-0008UX-SY; Thu, 02 Feb 2023 02:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8I-0008Sq-Pc
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:48 -0500
Received: from mail-he1eur01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::702]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8G-0001fz-R3
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js2YL3IWu8hraXGU7LgVqPjDbQHoeIl4irjR4lfE3qTTUQJLoN3NcviQlbcgR1fxSHh5GM4aJ5e5wUqlPJeWi2S8mYdooMPSzH0GEjO15Fvdvu1Ug5FbS9oTdkSy58kniAb1k0RZC9gfIJW5QZcZPBAznAFUa7NXxaQZwHkGjdZoGWr3a4YPbUe4LMv4ePdwU0hR/OgJHPOveHjfN2sP13Xm/B2iiuayuO+ikIYmtJOJpIHTMM1n9VE9Tz+wFoJ/aEe6mjZmbaYpldJedeRP9m6WAgCc69Ooq3bd2Vu1CeoA3qsTz4nkdPsV48ydsS3hqwf29R6pZFKSzzHDO8AUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7JK40CwZeb70AQ+EygfoxIECINj0at+6on8CxGiSh0=;
 b=bmo6mBih5a3eHRyqxITAdD7ggI4ItSQ+P8PkxcvNMfm5N1Iaaq0rccyAGyZOZh0v44Pd0SEs7UiYihOOqgNx8Ilh3kzTZSof/gcDAJXECM+YlzixUG19fAePY95Bx2epxNBxR1BF2jvo+M/F+sV+7fiCcfgeGYcvOUXQUvRK82E/8IDfD1XqO+Lor6jjpRU0klousz9IeqVHDX7tGpQXbP7vEoZWeaSadCXVnQqoyfsjnsPTv8eVYdt+r2AEluIqvHj1TifDVE5/18Bvzx7tvkmQppdXtGJKpsrAG6l566jdv/XP0fX8JDCrb4aIM9V4t1mdxX7X6MdFKsKNg5t5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7JK40CwZeb70AQ+EygfoxIECINj0at+6on8CxGiSh0=;
 b=OKuUAYeUEItAXmRiRX2ZB70g9UxKvt9eYo0BBY93OtN8IuMO/0L0Bh5S1kJA1AUdx9bnBXBapA/m7NBt5FhIautLZKn4FkZkYz1KZ2V95KZlEc+8DV4RY+ucBJHFa3R85gQREdZQvPhjcH61unmjk1Dg32EOBcJGVUWmA7VXep8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAXP189MB1877.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 07:35:40 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:40 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Thu,  2 Feb 2023 08:26:48 +0100
Message-Id: <20230202072648.4743-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0001.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::31) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAXP189MB1877:EE_
X-MS-Office365-Filtering-Correlation-Id: 892d8861-a1ac-4c6d-1b43-08db04f014b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w36Nh3aAAeOD2OvwuN3CDayRLZPP7+46cS/83TV9e9X12ER2pyQcXkL5DBmpRoixdzdcCC894aNCZqwcjUwyMN8sWrmcwojmHS0naJxBhZw5WU2XlXGNmAOwov9+O+m6unRoTwh+C/vdPBQQltHkIEBs5o9/wCh6xsnyE2W2bHSeKdQ0noxCoM/lpktQIXLYnIGVRONoqjstzrxfbm/7wrqUGruATu/uWFP7LlSEfToHV3tbqt9yu1hoi56LL/atASy+QtGwXYEPuWqOoGQPQqR/2Wg69AMS9Gnu3aetTHUugJ1erJwNBITlwXsALdTjmMhdlpgSh/lhzyqz9O6uXiabTOarlL9Mbk0+2+tBnq8DcabCWmyfmCCmKaDdK3qzzK71FXrnFtiGyZAFZJr/xCobVha9gglH1wV+6t6IFQjwnlzE54nUHC1GXchcLi3r+p7yjJHQOLk01cXad95EVG3zW0NiP0MavRYJahZs/myWOvAmp6bsfbgH6dBb559pkaBfi4uRxQa1/p6o87pEtWWW9fH1uQBw9ERtiGIiVXHTicbwO7YQv2ylli5Tve2YSLNIdq0cHgcpabBXlE6EuL9hZ8HP3+VaFqbAuqiDXo5ud6Pl2sZq7iTM4Sja5yBohL3ygAXAL8xNSERIvCUys9CBxpbuzu8OFJCTmG3pLwp/luHt2dDLmchURV1xApTkPTMpWmtZ6VzOvqzJmBOi9RkrTbZls2lwaCmvLySHxRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(346002)(39840400004)(376002)(109986016)(451199018)(44832011)(36756003)(2906002)(83380400001)(6512007)(186003)(26005)(38100700002)(6506007)(1076003)(2616005)(70586007)(86362001)(316002)(66946007)(5660300002)(54906003)(8936002)(8676002)(66476007)(4326008)(66556008)(41300700001)(6486002)(478600001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zigOcep19B0WtY5qtbeGsSodvXyN598suqV8gT5OUncABfRzyYZQMTIhL5A0?=
 =?us-ascii?Q?MHHMCmq8c5z8Rm9MzU1hDnLDKJRck3vwT2luCIIBuQGnCM+ohGDn8J1bfWyS?=
 =?us-ascii?Q?yi2lD0wBDMLozHlWjdM+ut3MnpA6ySQhQh0iCCZgJATTCH0sqwraEBWcT82K?=
 =?us-ascii?Q?yzV+froQw+/PqVFeset6XAc0NU4WZ/6ok5tUAUE8IcPbuBKrUvG7zaUCFK+d?=
 =?us-ascii?Q?HVXZb04ZVj/XPTAo6tA/vcR7rxKdYynipT2wHbq09d/5o7lW1I55SsYayRdi?=
 =?us-ascii?Q?blO5hsgJ2yAPlovDUlE+hoSMBpql13MZHBk800mA1Wa45UNkNppHsP8vupFP?=
 =?us-ascii?Q?NHRnjPVIRVKQJJb6qx/dYNk+aDCtAq4FF0halDaofPJ2BFs4dBojAygVFRBy?=
 =?us-ascii?Q?lRcb+XolAKgT+HclvfM/31L60quqL+Lrff1KP4PNcvv6sV2XtbUP70e8/2j7?=
 =?us-ascii?Q?MSGBNg/o6+q48iGUXRAYdu1fMvlIyZJ0V3peX+ccYumh584vr2uIUqPWNcrU?=
 =?us-ascii?Q?/AgzmL1Q7HZZOsEYyOAZ1SpDau7UvPlNVoqEjliTjamK9FPIUSygQoFodaqc?=
 =?us-ascii?Q?EzsUzqvkoHUxtr0TRiF4YFE2AlNd/D3p6wUzLKmaTdP3I0tUPN1FmrhSeJl9?=
 =?us-ascii?Q?4L8Fl98hO8U5kBNLx2C0cEbVCREqRyYHlZOYg9hpa1CYvIS5ML3s3lobj6fD?=
 =?us-ascii?Q?FbvIceUqBXip9CISRaniaVL9B/gnW1F7/qPaifESXLSfiuOVkBvLh7CZzRL1?=
 =?us-ascii?Q?f3JkEurcnkLan3y0S3anh5UdbnTGV0ePp6k+3wYwarajSHhWjfswz35PDaXj?=
 =?us-ascii?Q?o1tqtfeQb9Lf1Gz35kE6ruW23Hrag3rkSjbzU8kXCpNUUek/5A1b+Kr214Vj?=
 =?us-ascii?Q?M/rvcfsP51QpU3UJ/CklWe5cTtTY2y3P4JFLgcv7Mdfk5MArCJ7E8XQ3F+Wc?=
 =?us-ascii?Q?osNGUPcQthQMKaMtSyE6UoTr6vrQBx/+rx3tQ79xp4cNxGs7OLa+sBze3BYh?=
 =?us-ascii?Q?1Ewct72q/uMx5yHVgA0MLqy+H/P6SJMEh43B9JoPVMPMOON2u9IuQcL0ryU2?=
 =?us-ascii?Q?U5+eOM5qBKdkVe7AZwjUPTTgMhgje9UqvcV66DwlNK61Y36WYeQ/X4nqpYFk?=
 =?us-ascii?Q?VKcYNdnzT7nNPvfAPzwD6SUe0kQHnFl+d1VzcLm47zsrv47Eygtb/0nYGn20?=
 =?us-ascii?Q?Li8StTYhmX1r9NuiZXRdnyOWpQlXq72PBN1lHerKUiy5nE9yM0WQPDaI+lT0?=
 =?us-ascii?Q?cndbbTGhceBrRxnWhGPtD9ub88BSQHeOnT2odWanrci7p4wVjl3CLwp9oJOf?=
 =?us-ascii?Q?sjnxR9eK1c8qbCi/Rjae5bX5nkeNlOZ8HSfGL9HhiVAXknG+skkJb/zZQrqX?=
 =?us-ascii?Q?J1622+9AriwNWJPv0n5GAJXthYoCe1+le/gUZVOQdyZ/FuQjgXxm42Ou70RX?=
 =?us-ascii?Q?Ljsl30KEyUqCKswPnxzKZ90M0sR7DaoW0pDtekHfw8pi40UyXRP2wYV8LHoX?=
 =?us-ascii?Q?EAFdE3y8pRI6bF3ULPWQgYt74AwjceGzSDSnuoIgbGuhrgoUgd3eb0qKAgTf?=
 =?us-ascii?Q?fbh7w3mQbrHQS48iI8mHGBzFwjwoA6Weut1vZ+SorJQgx0scewdSMJBBQkSX?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 892d8861-a1ac-4c6d-1b43-08db04f014b0
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.9911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlpxhypfMrNy8r6GCGzdsn1L4vITRztzvul+dW0eNzM+bP0A/iofvfdazn0bGHODaljppLRpe+PEi9Ko0d4/2CKjR5MlifkHiJ+c2jSn2gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1877
Received-SPF: pass client-ip=2a01:111:f400:fe1e::702;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Add support for stripping/inserting VLAN for VFs.

Had to move CSUM calculation back into the for loop, since packet data
is pulled inside the loop based on strip VLAN decision for every VF.

net_rx_pkt_fix_l4_csum should be extended to accept a buffer instead for
igb. Work for a future patch.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 54 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 42e3517695..d85f39a25f 100644
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
@@ -1536,6 +1556,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
@@ -1616,10 +1650,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1627,11 +1658,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
-
-    igb_rx_fix_l4_csum(core, core->rx_pkt);
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i)) ||
             !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
@@ -1639,12 +1665,20 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         }
 
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
             continue;
         }
 
+        igb_rx_fix_l4_csum(core, core->rx_pkt);
         igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
         core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
-- 
2.34.1


