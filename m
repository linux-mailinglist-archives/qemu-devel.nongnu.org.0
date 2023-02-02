Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C155B68784C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYR-0003nW-DL; Thu, 02 Feb 2023 04:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXs-0003Zx-7a
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:19 -0500
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXq-000664-Hf
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgxAL6H0yU9J1gqW/teysBLHCmvjuczPsypNzwPh+DYaPyfnMDumme3Nq5eJUkPatvddHuXLFhdbnQgZ0kjUd7Lw+8PV9g22VwqUK2wpwKkAxZYXG9W4mWoILfGKPISpye6c/R3NZwX5fOpau1ldfLvdQKI+cSyrOLmf17w8VmwCCad/xbYeiJLGbATn5kd2BjsiwpRG5eJBadVl6tznDFFUpAoDatNtgDtMz69gc9csB6tCP3nCkLOlYX9dzVo8fHyFSDBL6H0Dov+cFjAQaCXSiq4HQL0NY2I3sHdyZKhL7iCHsg/mWLjayZOsUOljinEcpvlwZUxDbvfDc3PAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDqxM6mQhgYPJc17AZMVPs/DvukUuo1y2Z+kDEfDOCs=;
 b=HEhJDv5XHdGgFeXgf6ztaJSfT+hZIi9aXc4koqYJ/AEd3PlZe179N9hp90o/T1r90N/RLg4EsmspzVHltiV5/wKNi4sczewZBliqpxEIIuwKxcqN5Yy+xuFfC7BS7EisjQpJCVHkCPK/qYoqZuQWpLWudHRscHCG1nprCZsdOOn8AF+nIWoEInRUa5TUSTt5UzkQaU2uuC9Qi2T0kil5huKV0eYb1fzOQ135fQQ3r2EotskS5V/IRpzJthKFXbui67j052lwmhk4EL1BdBhBVy+RkHHGNJSFXMdXVgPgIQhgK+UTIYMTVNdeyuVTIzUXOyx9rhhhr43q7Nv4nEtmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDqxM6mQhgYPJc17AZMVPs/DvukUuo1y2Z+kDEfDOCs=;
 b=ORFeE4krQoxbhlIohAwIQcZG6xoL5Y7fDZJSABkTIVzutYbet8KpXTZdrr8pvSMCOhl1oKsBKUz45WQrBlc6LVt93uG3SxVwwKXSa/bmAnMfcPyMl4GeLuwXZv3h4tKZNJBKapnFaxfbgUUJ8iNwbJ14BATTLyTIhOpMBBI5JVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:59 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:59 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 8/8] igb: respect VMVIR and VMOLR for VLAN
Date: Thu,  2 Feb 2023 08:52:57 +0100
Message-Id: <20230202075257.16033-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::22) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a70921-6e22-46d7-7e60-08db04fcb2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bf77z1Eh4GuJ+SP7DdWhrKJL0HhVlMcb98P44o4igUp8hKf3v+QQyx5YCuV9HBEDOJK/NAxrb1Ml/cnWKSoyNz/fqXcLtdy6PybwCTb5h8d7j9xKqo2jgsgtdQ5kqGYJ6TP4pSx+t9zLKkrimKTA647fOPPm8qT5R4YIW3cBOb0+9ApSgzSdxiyTyM0oNVbodc17Rwvnc6Ry7lqNY5WN/uSALH2bjO64UZariIVACsF0yITWQxUezi7OgAFFu+FDsVIrKFO6eOaEQpmzTkjcAGibgVBNHwjwjwka2HekOJPUyTfxomkjh59izJ2zTUmrpc2K6m0U3qwf1i4XAUUSKCJnw0wKA3DOu+Mq+/qBY8LOa2etVHQZrz6LtH9zKVVH3lHmIxqYAPLZudybSJ1SFvAvlkpu5ghtBKOXHAoXC8f0TVtSO2lPO/csDudxJqO+JUPskgwsqBvlKDEvH4H0rJFV7PRf0g0FN0RRvNoKLfOvSPqBBCdW+Pq6ujJiFymGLa5CryX5YCxw/8nUTfcmvZVbnOZmGwZRBWYKVS85MaNAIrV7TarPEc5Hsf0MNjR09rTLGdKgWqTbQAvCiDccLfsewDWODc4FMi0RBWIA1u41the9UgcIYDAdkypXGuhh+8dlNV+HwoZBzWtaufjEGuEmFxdvgMAdl25NEpdQmd0RsDl925ET3qaAl9lbC+6445zHemSUcaMwmIhur4yAzYMT0jiVJ/4vBeiEBPLXF6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2EvmntZTIIsO3ZkcdJmYiuKsJ6VXhSAnJg7JkJpXY82H59HslDr0oj1gNK7y?=
 =?us-ascii?Q?hp11QdaNu2axqktXdKff9JCNAE6omFqvYXpLg6AYG+bT/hqU7wWhQxf7L4D4?=
 =?us-ascii?Q?Ov7L9xjnemPeW2GRY4NLB1MSqgdldCdj40XIbW/avFNROObhmL4bcteWA0PU?=
 =?us-ascii?Q?/8x3BJHQTzYiJSJsdTCJC7cq20dxNo5mv6Rh+9wEkzU9zmveAteS6DN3wTRW?=
 =?us-ascii?Q?WhV3iiHNNYqQmPBhA3Xl9Yfx8bBgZUNLIR2bgSYAofkW0qwvMAuZcXqLgCZm?=
 =?us-ascii?Q?H9U/Mw8f9DAcqqYPc0sNLKEHdR7kaZHj4wKJiZwLOuaf7QkcepoJXNiYX3sV?=
 =?us-ascii?Q?C88cz8GiNMDt/S2iviCS5HrQHCKdqVB8eVUg//NDDWJuek/zdG2/NKdXliYI?=
 =?us-ascii?Q?MZVZrGr0tYHvOe/nbdGMwzzBDYYKYRNrK6L6l/ELe7qpAUQ98aobqJH49fUz?=
 =?us-ascii?Q?OEn6LGqGZOMOAXIfVZvK5+HJsBoCgj1Ka315CBdvvpdVt1DzKCAA3xzeF+Tq?=
 =?us-ascii?Q?X9+RP53ecQ2MFi4VnMsfswrl8wPZUJDbuLtxS9PfdO8qku6TESTPqbUMwtjR?=
 =?us-ascii?Q?bB3gG6U9aGHuj2ISfgbM5eMiqWB6OJ8uJ6Q9n4PI53hcotQw2qn3SCz1xOLf?=
 =?us-ascii?Q?m/kIULmYoAKEnyMlKpS2ad7V139ynEljSy1z8136Axv1or2ZCc5SvkuZ3cbm?=
 =?us-ascii?Q?tg9MmAyeIQ75rdsIO6yhOoFztnrxU/JiXrBgYCLgLdB35LpSSbfAfOcTcL3Q?=
 =?us-ascii?Q?ZmcdVB4m3rp0HzejYeLBLKP2mr6s6GFYohOmfnIWaFJ72VrDWvkGG0mzw6o1?=
 =?us-ascii?Q?um73wkwmKclI628vucf0WILDL+83W4jgq87TODro+FMW5pqMV6xsGxZVvhpF?=
 =?us-ascii?Q?UOO0WifsYgGFPvPu7wVlsHjlAAigvVzgjMemnUXL7DnWv1RHAPdT4c3UDqJB?=
 =?us-ascii?Q?ELzq/erOKLiV1y8kwlrEtoG5Itdiu3s/VtJPSR0QrCgiJTZB/yt8dpGTKz5T?=
 =?us-ascii?Q?YeA+twN5Mj6y4gz/mCVzLN64pQFwfQwOXx8EKY0ZHn52u1kB7UlyiaqEN17k?=
 =?us-ascii?Q?VhnvtMF+hV7Bp45vo6w6i7+Nvz8xbqhiaGu7QCtIE2zrJmTdJIbAXN03NJrH?=
 =?us-ascii?Q?oCMwpJwTitglISzBuxTlxO5NgtMUry3zO/jKqsqKo/n+ilRIJf6zMNqceQo0?=
 =?us-ascii?Q?vUANvtdc4mf7j/iDw/fMaC+/qNX8RupV6LmXW+PShK/vgyYYL4073T1Bmqss?=
 =?us-ascii?Q?lXHI+4UTzlfFp7bYhgoGdA5P99yTH72IblYq5bOeo0SRh5bZviG0Sk5214h7?=
 =?us-ascii?Q?j/NwX9UXPxY5LYX/dAYYD6ITKl1p5uZNHz0kWK6VWbk/RpUVGWEahk2w/SnF?=
 =?us-ascii?Q?iJ1A2AxzvwBXeuOxSIQtvnAnG1ImHopRL8tb8pXkr8SwJBBNgqpWiN//H3bV?=
 =?us-ascii?Q?ddj+Er2pHfK1crrgwqAesIlfu4JmHS0xe31BDLCBBzQe7GJLMYtJLoaHCBSf?=
 =?us-ascii?Q?6oOsaPgGo7qll+ex3wYDf/zXwyBO24BikdotQvQ6S/kL2OSy7WhydVRVXomQ?=
 =?us-ascii?Q?+HTNAlkP4ifxYIbmW6oG0uyQ5giFSszUna0mq+/uj1sH0fBJrpuiQM58v8cM?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a70921-6e22-46d7-7e60-08db04fcb2e8
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:58.3845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/lwt7HaVv4tt1TJKLBlDzD3vyWtFYXQSNHfjDcEniqp7JhtQSuJ653mdwjyfWqZYlhzrdP1qaz3kbmY1KK/cuEK3JzvAo/Tg7L39FVcJpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
index 25a5e0ec87..cd4fba383c 100644
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
@@ -1640,12 +1666,20 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
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


