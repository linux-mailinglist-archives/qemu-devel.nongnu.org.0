Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBF680EE5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU8z-0001Un-3P; Mon, 30 Jan 2023 08:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU83-0007UL-8e
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:23 -0500
Received: from mail-he1eur04on2137.outbound.protection.outlook.com
 ([40.107.7.137] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU7y-0006AC-KA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3wY01Jph629ljy8WKjywE47dnSDSNh3hYiJDvHXJ3Nth+sOepXuAFPkO5XxW9rmf/IPfcO81e+Xfr9zdH4UK2e/A0W73Iv9RPY4lY2j2oL6iSmAMaEs78+4K4s1eUcXMloRnj7D3SfPLpcD70R3aWj7asHvz6upFLATB8PrRtqVpT1v73BSphFPuiTU1uObBun5/Am1niSm3FqKf6nZOwjKwRX3vmha8N/XZh4ZQW0lhH1niM7y8WU3d+i+WkSmkjHxktYwMzjNPUgm3Ucdqs5mzXaYNNGgWd+ZE1oeyghxugDTiZxg4uZ67hLithEI3sKkpHSNpBaoBxwYmE602A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2DjtK5IkhlSezGEPvWoQQEIV0AMlrcsmFGiXWKzAq0=;
 b=PK9ECdp+L1AmAm63JNdXXmttooltjZE9YyqGnSvKGhiTj2GG1EgkBF3uHaBYBMOaKliIbfiNmWVPEZXSIY/UofWLp/vEzUQFqp3YuwziwolWl7jnEQdYxX9KztWZ7lYxxiA9NBt6NBOMKDWbUHBNZ3mw2AQCZRsOUJEdzw0D+y9GNZQctiBTGoBdGqMbZgUQFEEyWvJt6Q0b5d53KgfQTaLZEo4OApLSIyMQvI86SSmeCUXMvVW1hNczWGN+EFvJ6IhenifV/4yi2/sQCmuJAiKuJFFlAi4U+tGN2cpu5DkSRvIpZxYn0ZvYK/6fFceB4H/ltmCH2h0IzsZoW7M4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2DjtK5IkhlSezGEPvWoQQEIV0AMlrcsmFGiXWKzAq0=;
 b=L19f3g4TXIz+mvXDsO/QXFnkYaycqNNMQly8BeVTLT1q5rUUbrp6bXBBGbpluaM68kPxWsTB45hw1fwYYkeeDtUrT7TOTtXGXrnGKJmo5GcqalRXdJqK5AkI/NAx+GwQ2T7BACaMmueF1WloM42ebkCwy3qKnuLAYa9t8o/bQBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2237.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:13 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:13 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 9/9] igb: respect VMVIR and VMOLR for VLAN
Date: Mon, 30 Jan 2023 14:23:04 +0100
Message-Id: <20230130132304.2347-10-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::25) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2237:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4e4c17-bd1c-41bc-4156-08db02c523dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sgdwCKPsQmWqN2DILz45ogFvob80NovFmlmBm+uwGucjcXTrRqcVyZD0RGMHcYqN7VbSyr3XGCY+agjv7s6c0QK7ypGNX0pcA8szBbCIhw/SpgR4VU3Bt2vqk56+MqPeTKCC2ovcn6y/bqL40WVClLQ1gD6b2kfDLsgCCGY9OzhiQ7L5P5sfgjbKLqZGH7p4+AubxDZJcQNjnsOokstqti387aA2bAi860ByVEN+4FZZUt/f9vOnoakDEmGOOu/1uTkiK3pBZ1ASlbXhCRG5WnZpCBAz7y+PPjERnqFeS0d235rTrpFLvUqJxXkMcpQZDvlmkL+PIcawZWZ9J0DT5bCaNqQ/eye5U2Sf31wDaOdw564NQZm/ih78IHQ85hbByNgQqOn0JblP1NtpQXMW3Npf00taLNlZaM5/8LNb++EvyMbBKGqyeqgn5oxv4qQLtvFFxcOcG9WaM7mO/0mRLLuNASs2JsykBucEuAf9Tj4fOwG+35sGR3meOJ8l0ZeYiZu6ls49IQ4ZQuDjSbEQVnl77FmCjf8vaRGddYBwvw/WbgBTxFOGXQALIrt8F26JCCzFHFmcmgLFkyl/diGowgliUBPbOGx9FcjPn0oQZIuOpgWUqLILxpG2U2XaPOPWoPj/2HSvo5NJT542/TVQbMKsKZwYyCxjIxCWfXk3RIBNQfrlO+T+TjlWg0yN3m8eGp+rLgkF62JfinDim9Qwt8SvKjpj6XoiRTFc9OWT7Hw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(39840400004)(109986016)(451199018)(316002)(8936002)(6666004)(6506007)(1076003)(478600001)(86362001)(38100700002)(6486002)(2616005)(26005)(186003)(44832011)(36756003)(6512007)(54906003)(5660300002)(2906002)(83380400001)(4326008)(8676002)(70586007)(41300700001)(66946007)(66556008)(66476007)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r5CYo/0RwZ0bGyEM8I31d6ZHb72kwzF3LQFsXgIaj+NLOHICuDiUZBiAANHb?=
 =?us-ascii?Q?0hW1s2+f6zqXnnMAO4MNaUbh2akn/Xdfpgz/SNWzqn/9cagtpUg7l3eQfnxp?=
 =?us-ascii?Q?hiwbvBxU+yIWw+aOMkyhPhxNNOxe6RkovXqPizbNW1TQ0XN6yo06CevOklBj?=
 =?us-ascii?Q?UDZX9RJkfi72OOvTjoGh2QwaE0gxqxTi9RkG+n588vZ57G6G5EqvRC+F7Qsh?=
 =?us-ascii?Q?8KSoYUIjFvjJMOiFmG0GJjS8CdGPJmOz3rUHl2XvsSo3owWO3bKvDqsw/BNn?=
 =?us-ascii?Q?YQzemG+m5WktB4ngGDTjltRPW8tlk6JlNBgrq43T7mEe5xn4f8ubO8ZvaXCD?=
 =?us-ascii?Q?EK261y6cPjoKjADU/s9Roq9SZ9k1WZ9i+rutnwfcqmCxY5udtgSLpopyUsam?=
 =?us-ascii?Q?SzpCulERLT9dEymt9+c8XVwb4+SJ+2SvPquJS9aP9HhF/IvJeRksrwQM4hQq?=
 =?us-ascii?Q?kf0FydeOuJI8R7vkvtNfcIYD7/bzS8ETd+IcItCLGa4mXp4pZOqrO+osThmz?=
 =?us-ascii?Q?/lSr9TXC5FgSJ3SOzw4zaHv234Db4wkka+GInYkMZ5RKwnCSzVdRdd3xpMxR?=
 =?us-ascii?Q?skuPF+4PFeC017ynPV6o1oQTRsliAw2ZRcQWSc+X4Z3m4SwtHzOs3HSBKEfs?=
 =?us-ascii?Q?4oDPycMnNWoGc0SnrycSzxDZKQ1RkwwgLJqVMkrIkQOTSzFkXxvd3CX6pX3Z?=
 =?us-ascii?Q?Xsr+2rI4bOlgvl1ZgNetFSPF9c8pNaxE5OkLQda8UNE91ejXhMPu2AYW/bzq?=
 =?us-ascii?Q?GhdSpYQr51fr3iM0JEdCCFbDHONlujvkq83tFqN96njVHMoGWOx9Y82oadH2?=
 =?us-ascii?Q?RVuJgGndgFwS0SbeBAIGATHab1FgfrSPdSGi2rseVSH3XlbSI8dzr8RwU5hy?=
 =?us-ascii?Q?BBQRHVRA/p9SipGmPCJQMIX3eoDrZH+IvTsZwWGvI7M+z+6ebrk2daf85kjy?=
 =?us-ascii?Q?Fbc0qn/gRR7SYszxDOr9IvdXNshBs8jaEbN60a85ys+Jd0ZY6OKgeAHm5UCy?=
 =?us-ascii?Q?BZCHSFaSu7AsdRaCr84TZmtyVZ7OSMVtYp/TV2pCrpPBPruYeN0PdmqKMlKU?=
 =?us-ascii?Q?UssKCbFsc8mQi/GfW+I1931D/lg2he+G+jpG71ZQtCVlU2iI7n76/JNVbQM/?=
 =?us-ascii?Q?SvxrloH8wQVFqJoMPFoi9R/P13ppfZJj51+AENK/AzDZcQVaJfiNWtky9GNO?=
 =?us-ascii?Q?JwN5IH72t7Y/e/3FKHvmNtb4SDVDPrZ53IQYotWqoA8pkg70S3F1SJYeVcVb?=
 =?us-ascii?Q?bekvRCH8PgI79dj2dM5/RvlVGGOex1xhhOAW9shXztQUSyTZYSKC4kYiRO6q?=
 =?us-ascii?Q?lx5WRt5G0sHNfwDFpHSk2EmN93bW1LEWlgH5qqI/HF3SzFqWAAQMi8PPK2ez?=
 =?us-ascii?Q?ivSHlJHkvUF+CvLFySTUyQ83R6D/z9HkcefeQwN5zr2cwc0ZFXhM83Ij14za?=
 =?us-ascii?Q?OGr2ohtxdz/NU6in2Ipg6HNiMCcrwrx8QnsiVmRqdOSlpFudeIeZRBAVRzMM?=
 =?us-ascii?Q?TvHgjYGyU2nBzDqr8CrmrUDATnsfzvpd/6n6Qvki5wXmlptw9Okbhotd8OgA?=
 =?us-ascii?Q?5P4yVpnE9Ma3fgWCskMSY3Js07skrQkNu1fxHn5c9xTPwIE3jP5yWFymVBf4?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4e4c17-bd1c-41bc-4156-08db02c523dd
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:13.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwaa4Awz5luilqcsLmLvAXwQWA3tnQSuinqQPEUzQ2KJLCEzxqIOjilxT9NfLs4FypcfmMD6AlCXmGJA/4t9CQH8jFxJIr6Gx7EI8r5J8PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2237
Received-SPF: pass client-ip=40.107.7.137;
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

Add support for stripping/inserting VLAN for VFs.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 84 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 30 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 5ca666229e..a511c64773 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -384,6 +384,25 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
+static inline bool
+igb_tx_insert_vlan(IGBCore *core, uint16_t qn,
+                   struct igb_tx *tx, bool desc_vle)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_MAX_VM_POOLS;
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
@@ -579,7 +598,8 @@ igb_process_tx_desc(IGBCore *core,
 
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (cmd_type_len & E1000_TXD_CMD_VLE) {
+            if (igb_tx_insert_vlan(core, queue_index, tx,
+                !!(cmd_type_len & E1000_TXD_CMD_VLE))) {
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
                     core->mac[VET] & 0xffff);
             }
@@ -1541,6 +1561,19 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     igb_update_rx_stats(core, rxi, size, total_size);
 }
 
+static bool
+igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = rxi->idx % IGB_MAX_VM_POOLS;
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
@@ -1622,10 +1655,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1633,44 +1663,38 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
+    retval = orig_size;
+    total_size = size + e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
-        if (!(queues & BIT(i))) {
+        if (!(queues & BIT(i)) &&
+            !(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
             continue;
         }
 
         igb_rx_ring_init(core, &rxr, i);
+        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+                                   igb_rx_strip_vlan(core, rxr.i),
+                                   core->mac[VET] & 0xffff);
+        igb_rx_fix_l4_csum(core, core->rx_pkt);
+
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             icr_bits |= E1000_ICS_RXO;
+            continue;
         }
-    }
 
-    if (!icr_bits) {
-        retval = orig_size;
-        igb_rx_fix_l4_csum(core, core->rx_pkt);
-
-        for (i = 0; i < IGB_NUM_QUEUES; i++) {
-            if (!(queues & BIT(i)) ||
-                !(core->mac[E1000_RXDCTL(i) >> 2] & E1000_RXDCTL_QUEUE_ENABLE)) {
-                continue;
-            }
-
-            igb_rx_ring_init(core, &rxr, i);
+        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
+        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
-            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
-
-            /* Check if receive descriptor minimum threshold hit */
-            if (igb_rx_descr_threshold_hit(core, rxr.i)) {
-                icr_bits |= E1000_ICS_RXDMT0;
-            }
+        /* Check if receive descriptor minimum threshold hit */
+        if (igb_rx_descr_threshold_hit(core, rxr.i)) {
+            icr_bits |= E1000_ICS_RXDMT0;
+        }
 
-            core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
+        core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
-            icr_bits |= E1000_ICR_RXDW;
-        }
+        /* same as RXDW (rx descriptor written back)*/
+        icr_bits |= E1000_ICR_RXDW;
     }
 
     if (icr_bits & E1000_ICR_RXDW) {
-- 
2.34.1


