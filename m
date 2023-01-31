Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B868294E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAV-0002Gk-3l; Tue, 31 Jan 2023 04:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAP-0002EQ-L9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:05 -0500
Received: from mail-he1eur04on2117.outbound.protection.outlook.com
 ([40.107.7.117] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAM-0001hQ-7Y
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnjegK2hy6yBXbY/AjjzC82+XE+YOzd7CahtJx8ONp0qbmEXonB8VFZQYASW7Vk2QCgq9bDZVwT8o8n095Xqp0a6ZVTeGIWQBUkc52jiXqezjwFiurfigzF6Wt6hAKwhPNNqMffeXADMSq0ukNXoL0D5KITHc1mtTIN0MDDiS4txmXdplB/XansmQPVZ13WKb9HdapTe0yZQzUlv7eXR/QkTxz9hP5O+YEB1l8ef3k7OTNGbhL8TfNxL5SneNudjbcJa/X1sCKTPbJCypnAoCe+k7mWe34ct3f+wrb5i+S0L84Z4THhCXqbV0wqeN/HMjXxkd4jV5Y+W/Nhle1fmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow6ZoLSO0wW5NP8BRjGR6++I/232ED6wivWDj36T2jk=;
 b=AE51xdPI7jWzy9gwH5gUxTJJDPd/SpJcdDO3VBCud8HXq/gvyxbEQQTP7oZ3eQEj+B3EoK8T1RgB3W/dTJFsTcdVZnEbz7lAqcUwZuc2tnLQ9dhdvcuT324fVPfXNfs0+WH5Fcw856aUhkBXcV0s/B7qE75eESdDI7WHwANHqOpv5gXn2Z9MqJHh5NMVA1V9NnnOo/Nj6kUrG9xgj/0suncw5awNNt+lkoC8p1+u7BY4BrFEebHdnom16sgTkxDQ5q7/g53vrVnSzJ5MCyAEhaxj+PLLsfARZ35q0FkOrgGdQSv/Otdwb6b3oB956Ylfn2OSrzYSWp422l9b3oFxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow6ZoLSO0wW5NP8BRjGR6++I/232ED6wivWDj36T2jk=;
 b=bcP/N4SptbanLIdmtqrbLdNgbk98+ru01jP2Pw0ldHmqFgtiTnh+fFVvGACboct7CPdevC9LtMLc5JcbYU+d9f+LmNu8bB83OXxchlXG68JEED2mDZEdhAzaPODiBDRvlyoB8M1D1dMYIX7yuIUaZXZVqSYj2vAKa/v2Te3WXuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:44 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:44 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 9/9] igb: respect VMVIR and VMOLR for VLAN
Date: Tue, 31 Jan 2023 10:42:32 +0100
Message-Id: <20230131094232.28863-10-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0057.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::25) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f1dc5a-7b6e-495f-8060-08db036f7db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUpKsyHOGRXbRe0J9sE/zzDpHfhX63A2SN7EhFK7gkW4ij4LFZ4FCBMRimGRs3TdfM9GzP6xXTtFXSOe43CyQ8MZEAfdXXgN1VFQOgttos+ywPErc0RsiGdXlXfqBF6s6FMsS1fFAl1KSAeIQ4ZyClZu49+fF5HxkP9dVYKRESyImJzPbq69YYvRz0HR0wN2RCHVtbpQ2jMqOLKde5IPsooj9JkziF5nXcDmW3r5JyIyeGZsdBlzmZQuXQE047LCQJ3lNwWxM5ZVLxDg9J4TBxBxlO7G8bdSbN0DgZsViUJjdu1qB/GR1akSoIpwogYDcT84yVd7u5Sc2Eog1uarfce0A6wzFObqp2R53HSorovRpX0Kx7AZR31K1f8lOm6PAoqe/dtcBl7X0jkIEPWIbuJYMHco1mn7x5p8MTk+UA2ZqQTe/E4mTpBNsn0IfO/NWu7p4v8rCgiyrWF2IJGyzpilY47PpJIfZb4kdfUgKE4J1BBaVHarERFfK2nytgoYHjYaCsWbcyflihV5f2M6PVQ9rDFkOzuWriXP0isUHG7Wdy71c95y/mI6zw2LFHsXKAeAguJcEndaeXyzDhVAPOTSsm+kcUfvATjt/gQBvVOF2mJjJcO7EaMuwX/OPnyh5IATcGR7UUkKKUGn9T/lVyM7Mvx7IfVRscRhXPAncyInLIu2/+hZ+3fHpvMKZQEMmQtzoQBZgOIYkdq1WPJAjHG2R4cEFhhOar5ANV/3Ayg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4s8nreT9pMwc+dZ0O3OsDkGWcUW6BUD3sd6wNHCZjiqGaq1JVf9DOrlxtPc?=
 =?us-ascii?Q?5qmuaR3cq+TrIvyVcb1yB+f9Y/LHwOubng2x2m/RiZ2tO7icR1suIRWsJxWV?=
 =?us-ascii?Q?gZ+pHHnPCyGpusa+uHVcekrTkdCnIZNSzfbxSZ88mu6X5UdcCd5XVtcvmcYg?=
 =?us-ascii?Q?D2RKnoHPH2Y2G1lUhDsVIk8B7L7rPTsZIn1zIT8YKO5qYZ2Z3/IOosW1ZW4Y?=
 =?us-ascii?Q?PY2I3p80OzRJkxwkNz9/xbvMHpXAct31pLCFca3rlNZsOfqqj3xoxM4xWPQD?=
 =?us-ascii?Q?RYLR6CCHsZV/I6nSU+G0zRX6kPsdsPEbyQ+bOvVHpJ2hKfJ7RxALxjKxaMe2?=
 =?us-ascii?Q?22CGNKaowcYvC6b+7fhGlNCHjy1o9BMpAS52N9/AYqdecreIO3O2zNFtwJEU?=
 =?us-ascii?Q?d2I5E36E7+UROs5Bd/4QqWlKXKqz2RDpbZ6zqrnPT9qKXQYlZINvc2fsgCuo?=
 =?us-ascii?Q?Y4O6UDA2aAgjyEK+B8Ok4ruR8bOeBc8DeR1k7Kj6UTtyh/FJ/HeIZ931sV5r?=
 =?us-ascii?Q?ZZlk+UFELuI9AiHWCdHk1hUPkLxfprsjPD3XAvtybBLGnqCeZg/mr3VBNQd9?=
 =?us-ascii?Q?66e1tTfiXoNVqU5Q+KFz01ClR8vmrV9RMedwr95oC33LpZaC7NZPOZ3ByQNE?=
 =?us-ascii?Q?ddWM9RWXA6nCJzWyZZtG1+XYrvdFscysLQKrVT3gr2+vhSOFG6wDm9giDuES?=
 =?us-ascii?Q?lFs8kdw8WCa3CU3s8nu152mLbaYyqwCyMrdPlmXreVPRp/AzaHZ7c+Km0n9J?=
 =?us-ascii?Q?65GLfuJ+hjExoqqBGLt1zp0BeoILG2CY9PbIqhuwpQ+nKsPVdZ194Pkl6KdW?=
 =?us-ascii?Q?0blKHdXHms0/etombjkUFeOLFQW5iL5PDbBbgE+233Y9ZLCHT/v/7xkQuE2H?=
 =?us-ascii?Q?BMgygUwTEaOZncQxo7hW+g4d1qIosPzJZ8zl3eq5AdfQ98kl7240mEXcnDfx?=
 =?us-ascii?Q?AoO0bhoTPiHyoOMjvcmtVsq5HyeThMVjKnN2kLd+COaIcA1KiGYPYSTULndX?=
 =?us-ascii?Q?g/EK3JRgKv/cGna4vzSSNOzAILjR7HTf4RXscl5nGzI61ndOBpbulWIRj+ZG?=
 =?us-ascii?Q?fa5ynyrv9+JfBB1ze26tjwStXY9fsJOc3ug8OTzVPWiAEgPnsLenY3jYEMv9?=
 =?us-ascii?Q?mghN5UZHHFToVE6tkwNkmLsQfcsWvfikjufZOt3VOHk471rvGWWJqIsEU0xH?=
 =?us-ascii?Q?Grz28dRhz2mhqfhiE6sCWEY67kakKIgb7LDXGR/0kZwJRT5AicKvc0TXAY92?=
 =?us-ascii?Q?iXwh9Gna5VbowgEFvF3SD0iyIobFxAYQOnTq5O0JWedWrpdxw8J4itNcDcjT?=
 =?us-ascii?Q?6WMg/FLwWXoAu6v07P9c0G43S/n5aC0HI8FrxNk6CLQK95gMtdZ9rvJneYkI?=
 =?us-ascii?Q?HTkqUjqaAANzbl0PGHnCLuDg4K+PaVD8ogkd2wxrinj3RLS/m8W/5M+D5ylk?=
 =?us-ascii?Q?Yf9EhNuNekRNlb/7ucL0KQ5ZO78uU1iRi0PhnqAYfV6e6D0ffJtiWtHyq7Cv?=
 =?us-ascii?Q?b46Yk2ypoX8AkCyw0hkyKENSzyj9KGcML5Y1EncEF+TarB1jhtX4BioNCSno?=
 =?us-ascii?Q?FEs8pO1MxrkA0guk2QJzCSP156EIe5y/vg3UzrK+6rgODfnm7i/wEffA6dUO?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f1dc5a-7b6e-495f-8060-08db036f7db0
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:38.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0wv2eZHPPIplNUVaOA/PxFRySnPF7Q/XwmPU4MqcKebqRZLVKAZSzh6hq+qpeB7uvOL3sESGZ0mvG2jZ7n5/Wfw1h7kAHzm0PvwKzmb5M8=
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

Add support for stripping/inserting VLAN for VFs.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 51 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 8115be2d76..a697fcf56a 100644
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
@@ -1543,6 +1563,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
@@ -1624,10 +1658,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1635,11 +1666,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
-
     retval = orig_size;
-    igb_rx_fix_l4_csum(core, core->rx_pkt);
+    total_size = size + e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i)) ||
@@ -1648,6 +1676,11 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         }
 
         igb_rx_ring_init(core, &rxr, i);
+        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+                                   igb_rx_strip_vlan(core, rxr.i),
+                                   core->mac[VET] & 0xffff);
+        igb_rx_fix_l4_csum(core, core->rx_pkt);
+
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             icr_bits |= E1000_ICS_RXO;
             continue;
-- 
2.34.1


