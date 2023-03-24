Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28366C8576
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmdB-0005t2-Vy; Fri, 24 Mar 2023 14:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd9-0005so-38
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:15 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd6-0002ID-UG
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/1wxawUv+sMwSYw59+vwkLbqRklcoU3sY5B4nFQiC04hTDBdGWLOvYiOH4R7EzhktA7XHsXCN9U0ZBbqqm4Z8EVDmiU2isxdI31IsAPYirVyAXiW2VZQwGmGPFFPb5xx5s5VqCHD0LDAcLT+DHG06GkVcSxOt38Kinv4mAoRGjipMrpZpzhGvEoLcLmek7RHhu4h7paYR0N/1iFbAbHweGKTto3jl1dKLlQfCKT3lBuze6RSQ8gB98yjjc50j7f1PCPhzycgYhp+oJgzIU97+i3v2qroYF2sa+0v2HUe93KO224ylYcVtXlmQ4e4f4t9xAd94qduVbREaaZKyrSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlQN8aSXctzk95RQ4xWEXONvfnyQcVTbIWER7lTiW18=;
 b=kuzjo5SJQ0JFGvXUKlTNd6Pt0UYcuQsWqtSv+S9Lyx2fKAWosp7CnVuNX6w/8OaWu/vSM4jsZVeD845ANoJretf34JzBQmvFtyKr4IqPEj6v3q1N/O9q0O8aB2AWSDoMbL2hvbIcqrpp9CMwJvimjyJIbTI5mNX/EEDVvUV9O1fx3FZaqLDdtrpueWqtgmLK69J0vOZA6tFi3Am+mMlIvfygl9oCHgfsbOZgWe5MyfC4OVx9EQfWf5gs24ObjS6Ar3jmVYBZZ1clz9lt00d+FMXRzCSP/Tlij9dT2/BdpxMpYpl5k9Z096quVpeLUa+enyQJ+emYVMIWdKIwoKyGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlQN8aSXctzk95RQ4xWEXONvfnyQcVTbIWER7lTiW18=;
 b=Q8m3fW5OoXU96RsWCDb65B8KRcU/AkC+78f2kR17OR/h+M/WajFYapbkx97JZB5BTpZft9kr7j15qmn/cwOSRE0Q1K5Ys3xdl4xFND6m46pLOwZyGzZ+psuNiHHEkL5UnmmGKpPX7RVP+1rsWtphlqhWUBnS2P1m28QRV9ajNsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Fri, 24 Mar 2023 16:35:01 +0100
Message-Id: <20230324153501.20695-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0097.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::29) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 900ec12a-d491-4c0f-0abb-08db2c99d0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hH2dOYIc+zTFys4Oc7Srbw1ua8pj/9SYo4w2y0IrFKqyDFXtDjWMKNOQzdg7jvtWA9YsQgB7aOE68Q+fMuYR+rOPcNKoj5rneZTt8dRVDb6NJN1CkLA0a7xNice6NUSL8UxM0Md6u6ysDn/TZIpZDp4txKT6uimJPcY4y9ynjNAYUw2g8L6g3ZBr96yhSsPPOPnMx5D+HJ/kffuKDlbdLhv8Wt29HGTQ6Oa2jCpqrMX0HEn9/jJrUUIhn/wXrMPCSRIi7JkcYY43+PURGG6VQ+7ivW3wuQeJCjx4ZYrIC1vQrRG0kiZ2OOXPdEwYolSTEkv33UAPsDbHU8ztApx+F5eUUX5NKGWADmFX9h9axXJ+4roK5VBh5CVgHVcOAvN30Xa5Dk+McEPkXmhhOJdv/A66rzi3XlhVstIZ9po4P54S0NgSoFMAptFG8um0GLRNhblHLL8GnA8TnkdUQnFOaGQp3gkUA/Lmu4QC4ctvNf7ZiryccGRwHzmFfMsNq6izbOru8pn3vtEXzOntddKBb2WpHl1oYtriYFq1pvSkyHvTZzgOOZi2CXY/f7Y3KCru+LejPVpEz7l5lmBY5SB1g/TiPTJK8TgcPgdmjl/gdP6UiwXBq87M7LQwAkYjXDbgEuZAVflzvEe7DXH+c87j7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(6666004)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BqqveY/SFPwdxL25MKm+xbBCI+ikOHNXQlbddao4bjf8pvpWuXRnnmSsTDcg?=
 =?us-ascii?Q?wfrDUZQAX8cNt4hzEOjLzLfPp4j7S+SzkjoxYcGpatSXhJgFCEtcKEI4WpgN?=
 =?us-ascii?Q?GAyL5c1xpXDxKRe0W4C3pqeadDQ03/foUd9dRgnuCisElvghzAyevPKcN9cY?=
 =?us-ascii?Q?1TI5IGPKf1hj21A2jy4izHcMAUFtQ8mhbNXXW3VWT11gEkL7ylmCg5ZWQlyS?=
 =?us-ascii?Q?DfeEcjbYdeH6R1fwBy2WvlJjNWvftdT6LDeqkvZqaqm33X4T+UE/fxr4kdn4?=
 =?us-ascii?Q?6/5VRDw6tgL9XJZwI2kQ1Rb9wT1igaJLOpV8WMhRNyW47QXolpI5e1GGcbsJ?=
 =?us-ascii?Q?CvUDW1IE1tq+d26pW8Spz9n4p2s+wNVGzWT/FrfdYoSY5P2nvDk1cDLAY/P+?=
 =?us-ascii?Q?3O+O5VBgh2RDt368BACmOhND55Eotgb5+8S6CN8U2gTPbJgsN3Cg9V39yqZs?=
 =?us-ascii?Q?XUR3AHw0eaPVoFNuM5GKQgiFAANcxKBnbArX40tzNO8NPfAcYvybh8Yb12lb?=
 =?us-ascii?Q?cDiBDj0NJUqUeTDq7PUTgOWumTqkwttycQX+rsSByGw+zVERa4geQ9AyYD8v?=
 =?us-ascii?Q?T245XgN9zm5vMOv/a6li6EYGRBPdsYVX5ekg609Q9lmPV0ItgwZo5Kg2qejX?=
 =?us-ascii?Q?YVPOklfK7Kk2r0WOfCCbKnNAhN64Xy9hwuVoG9PZwHB+IWvY2Ejc9hyS7nUV?=
 =?us-ascii?Q?KVy3DZnO7TAx79mjPIau+9WYTBSRY3CsaR30qHuxyiPBi1s3kOEikfvB48UF?=
 =?us-ascii?Q?F4J/0rEyCPy1PxglQFr8fuy7q9hTrlMOUcSwAi4V+2q8DX3YntRYcyoL3Snq?=
 =?us-ascii?Q?gL7BN6k4ljY/UnFnRR9MbixlsOocU7izEsrgqSnQMERiHIeEXeP7GINEr0L+?=
 =?us-ascii?Q?KQsauufdV5my5QdHlDiKeB4U2Q1NhRahGku/FZG+PJrf2twwdwflbCD1DyLl?=
 =?us-ascii?Q?IAxmDlhDWY02vOM2j4vH8EuOG4g6/g78RVktyNqjNPyCIF+Y370Oxh9x4X7Q?=
 =?us-ascii?Q?3pevyD/U86UtbLkVAjiq/Hud6bwd/iBzbGxsv8AGrr1UlnqEl0ApdQPLLLtT?=
 =?us-ascii?Q?ZwBxHo45Um4bZs5nKgXcv/Ze2Xh+ncKd6u0/8CAuMI39JpIQIRbLdRsAvf9i?=
 =?us-ascii?Q?D+0HJEqjmlvA7k9d+UV/H8dVEgmJbVDIDCT5MulM8TpeOFZnKoBvfBI0YpwB?=
 =?us-ascii?Q?qde1H328mb78enVFIjhmMqVxzT+MxeVy7rKOUY3FV30IRs36zdC8Zonszi6c?=
 =?us-ascii?Q?xGPnU82SH0FzhojJnwvtMI38u73LXgVhH0I23ig24/BaQmLBksfQ4tHlYGeK?=
 =?us-ascii?Q?dzkIXlP3Un2uNkGjnWWEjouC0+neia0F4wOQGvEJpZjtn5C+6HMsVFS1FWY4?=
 =?us-ascii?Q?Y1ArNFXN2LmjEOFrG+RkA2MdU/Yd36vSOyNWtVSlQ+9OcrnlZLPLIbBUke6q?=
 =?us-ascii?Q?QUywNjf4V6wgvUjwuLsP3Uzr/jL2DVV12Yv9qH/6FmeGK+ybL6gUFDjzhqqj?=
 =?us-ascii?Q?t2rxNeVvXrIIb888/YGpIiY3T7LipCxFCg8PyoEo0KYpx5Btc9+m0sXNEn15?=
 =?us-ascii?Q?DlZaJEmzlJ1A8dTpt9DW9q2S1HvN76mjJhH0/YfMuGzjkyhiG5eH6APY580j?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 900ec12a-d491-4c0f-0abb-08db2c99d0f7
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:55.1620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByoYOoKIPDTalSSrctzlH4pKqXEvU9GcJSFcx0Pdq9RLDFnvRVGaB/tIp+LcMBLmWjqS3EO3JugrDS3ntQcQK4oka9DCdzVy3m0cLvfXCR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Add support for stripping/inserting VLAN for VFs.

Had to move CSUM calculation back into the for loop, since packet data
is pulled inside the loop based on strip VLAN decision for every VF.

net_rx_pkt_fix_l4_csum should be extended to accept a buffer instead for
igb. Work for a future patch.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 62 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 162ba8becf..d733fed6cf 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -386,6 +386,28 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
+static void
+igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
+    uint16_t vlan, bool insert_vlan)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
+            /* always insert default VLAN */
+            insert_vlan = true;
+            vlan = core->mac[VMVIR0 + pool] & 0xffff;
+        } else if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_NEVER) {
+            insert_vlan = false;
+        }
+    }
+
+    if (insert_vlan && e1000x_vlan_enabled(core->mac)) {
+        net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan,
+            core->mac[VET] & 0xffff);
+    }
+}
+
 static bool
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
@@ -583,12 +605,11 @@ igb_process_tx_desc(IGBCore *core,
 
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (cmd_type_len & E1000_TXD_CMD_VLE) {
-                idx = (tx->first_olinfo_status >> 4) & 1;
-                uint16_t vlan = tx->ctx[idx].vlan_macip_lens >> 16;
-                uint16_t vet = core->mac[VET] & 0xffff;
-                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
-            }
+            idx = (tx->first_olinfo_status >> 4) & 1;
+            igb_tx_insert_vlan(core, queue_index, tx,
+                tx->ctx[idx].vlan_macip_lens >> 16,
+                !!(cmd_type_len & E1000_TXD_CMD_VLE));
+
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
@@ -1547,6 +1568,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
@@ -1627,10 +1662,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1638,9 +1670,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i)) ||
             !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
@@ -1649,6 +1678,13 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
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
-- 
2.34.1


