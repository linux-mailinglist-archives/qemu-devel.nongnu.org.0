Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725B68653F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:19:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7U-0003jS-7l; Wed, 01 Feb 2023 06:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7S-0003il-Cw
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:38 -0500
Received: from mail-db3eur04on0723.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::723]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7Q-0005AG-MR
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai+mPGJXEINVVd/DFctr0Nmlda63cZlq/BQbgXT5+XHpIG0uXre35MnC3yB8SuBn6N2WRCUfkehdQRABNU59RtNwS+qe4MaU0K8PSNthC+HrTp8+fUYlIJdbPgGB8CScQx0LlCgzARTmkDoE///+TJHIZgAq1VrnQcDOZjv6Zona0vuVFUxC88Cz7IVJNSZOtVTDHr6tmhg2FwRDbM6J3vgFEobXAQPkxKE7/RXTa6n7kGQsSQPmKne7WIIn1gZsbwxnxwORmnSmpRdcu9JkrAoP5nJY84usIbsXh0mqyMcKoWh4KOtSINnp16E6Uk+yR5Xmtv0RVh4cl7ITI//pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuzuG+9i6P4kFIszAt1ctF56WIbt/Xet48loD/b7u1s=;
 b=aqt2Xsb1EdQ12VMlNsGKi092l1n7/i33c1/n8I0pRQQQJLZzKAvBVRzdSRtFLXlF/UjPav24MkUWRH5ykQaA+fu8vE/eAdyBCT/SNj7yCKCUHUWsSLnFP7fR+QYOfEjb2RZ+ZzAuERJxVe1uBCJHTqaaipbh7arUiBtSr3r4Fzx9EoLliAZmvSJ1Cu+BwpHPsvR/GeiHw7ANcvs25YKRDN0lC6RpeQIhj5snXdByrk5y1AxNoUzaGVWXw1RXnZ5GhtRuDu3fv7cKpwyBS8bYAPC+sN3+sVeVDZiem972uM/gQa1OYdI625yScaFjejhw0nAdG7AKOlujKQa+6TuApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuzuG+9i6P4kFIszAt1ctF56WIbt/Xet48loD/b7u1s=;
 b=Ak932mB2l/kUk4OdKHczEMFQtPGfzknimsePoODdFKa/TkKbw5QzmO79wJ8F0YH8//b7IeKXzSc7blH1whLzALcpdur0inb2br4QN1PSPibLtbRjDM2+6eqEzxmzIUW9WOjAIpfeV2Lgu6IvJ/LxcoTHR5X2s02ynGmOO5R2MHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GV2P189MB2407.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:28 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:28 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 9/9] igb: respect VMVIR and VMOLR for VLAN
Date: Wed,  1 Feb 2023 12:17:22 +0100
Message-Id: <20230201111722.28748-10-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::27) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|GV2P189MB2407:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1638e5-fbef-443c-7c98-08db0445e5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FR74vgn9Scbdik6Voac2m3J1KiBBfsuANkLuzOMqdwnqVRviCpt/9RBfzGXyR7ehz4wpM+59ThQ5MX1Dd1K7D1ldk+Hqqlj/z9M9MVvYFgEx69CuEQig2jlImorVYqtJ+5ddoCqsfccZThQThTekXSD7TtMLoUEYRW45SIreasPssw7+kZozKrxc/KsuiKwbYyzRJqgd6xD7u4JQvYkLy32Av+VMbhZ//agr/aajCRTKH9pg9B1rb+XjPMKTwEFhvXJuLJz7LHdNmmM9EzX4WOORv13jK/MoY4iYbYRTrSsec74XK3EAJw34tRSQRpMLk0kHU5ak5m7wZiM8T1HLdcvk4XgvW9tboM12vnf/OGBA2V+F4BX31wXVkrXqCCU/AeUMkP1L9uBLzC74k+8noToY7bcbvbCcwvWPlLkmkaVs5dZQ/JsUfjmIjP7obWIQPI6O52RgU+Lqo7Z/X88FMpTDln1XT16haODpCIu7O4lmuqpB0NSOQuNifQh3IHi4zpUm2JQwGPH9nLTRuwkHAtwTskCRHV10QPCll8OvDj4qdHJgsVztXA4PNHVtFZN4puiTtc07CP+j4Yas1cyzvjmpQ7YLdNOgsB6qzUsim2bmhH8cs3ggIOi+wixYJyqD0Y7eLrBMNxFfrktWNjRhuQJbgb2Dw18W9YujC4alky356TYa+NBnWJJ0xB1y2Ek9aEMsOS7JKAW7e+U48M09/53QBOmzaTIotl1AocZlB2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(39840400004)(451199018)(109986016)(4326008)(44832011)(2906002)(5660300002)(54906003)(1076003)(6506007)(36756003)(6666004)(8936002)(66946007)(83380400001)(186003)(2616005)(41300700001)(26005)(6512007)(70586007)(66556008)(66476007)(8676002)(478600001)(86362001)(6486002)(316002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0DU41V9yuRm9tKfi3MqiRlEXtXXXfYT6rdSV1fSW57a2oehgH/LKSMtNJLO+?=
 =?us-ascii?Q?I8RFuJCGOKWyd5eTc98BN3+KuCq3WDOjNTsAzE2uoOUXKAtyJC21gQMKaAhT?=
 =?us-ascii?Q?ktlosDJP4L4rtUcxfjbUOMlAmL7Zg5iOftr3pyn0pOSCWNs7/U3+Gy2ixOXr?=
 =?us-ascii?Q?kMymkMI+3EzUIBAyI8i4sMTUXhh4gSkkPj8D0yn4onwmYvnom6HVBWdvCCOw?=
 =?us-ascii?Q?msN7ilmtpbUM2w1G5cVDhDXFMbIDHyUzRjWWWv+KOlcl1jUUyAn/Zz+I5qpc?=
 =?us-ascii?Q?f/iG5M0IujtyIsG2I0wZemO17ywACFzWnTgAFGiERhZpZP5ER7koCUNI5LZr?=
 =?us-ascii?Q?knoXcgXhgcJUP205B+CG4x4iO2aybr0ib7DkkWg0dCLwZOrnMvmfFfpspNOZ?=
 =?us-ascii?Q?D1of8KTcEQjKa5l0vIDD+y105EMXFEF7+ekj96ABK/LJr9wcnPzcxK4f3JbB?=
 =?us-ascii?Q?wlI57nHaCA3X3qoSAzlgAkQJS0XNpd/mrxQZIaNTUmyVt+y1UKrpkJKBieKs?=
 =?us-ascii?Q?iaLx+MEv5F8yJJjYistlmfc99CjwC5zpNmoArTLtf+b5qL8by05x3DF5ThLK?=
 =?us-ascii?Q?hn0HvNu7lveNWCB5bwkYfmrbEodSi01hqWa/s+X8+5j+FjfgWG2eFqsrJgft?=
 =?us-ascii?Q?xdE6Y+t6jfyrevs503umlfQ1wPSYM7Qpe6nUe89neR25J7rUevl1qK6P4mys?=
 =?us-ascii?Q?/TpdQ/oQqCBbM3hm7cRQKvimf75BAasEoJdiPS6ZtSsJjgbIcbrDfHbYisIU?=
 =?us-ascii?Q?ub3h7dMxGwSnFgnCKmVPb52aWBnWbB7PYZ5eQxhJprko+jnUBxXUZc0NcBks?=
 =?us-ascii?Q?GMwmwQy2b2TMW7XeYICEmtVFTRMckGVjDhVAgMeflMiYoEsJlqrrSIclfriJ?=
 =?us-ascii?Q?PAyvRj7lZp04xWnqkgNgRAB3YF9orrfZz6gJ4vLvhuZswzGnbtJzmf/le2ky?=
 =?us-ascii?Q?Eg2rKU6jhW/cteLMP0Sbzqj5fsL1s4rAC7IeDN/Dyz6M99Cmu+WXmKe+Ydv8?=
 =?us-ascii?Q?Q0mwMdcMTCWIvSvCBC9EEnIigpTEx8/g2w0lEpPzmv0d+GOq+QpSGhFNNYpz?=
 =?us-ascii?Q?cIyf9UWg9+aymNwvEZ6V2yTbv7NFMQ/mW/AldmJxwlgjcmcNRaTPDDCXXkto?=
 =?us-ascii?Q?IcA02Luj6wq4loHIjDEQGH/8UfbXP7SNoS5l0Oo7FzXfhnVbeXGiMC4abmwy?=
 =?us-ascii?Q?nHZPM4FgRfOeOTccRVeIBnSoBUX39VR05pOW/jJO7YSY0iU1gdV9+/A4MPP+?=
 =?us-ascii?Q?6zdgOOWF5ZqcKEetNL0mn9ZKKqLfPsooFnIGGDzE0LI2A6Yaqg6XsrEP3Mar?=
 =?us-ascii?Q?wQPblI/bNbZJz0FHPWcTo7+2WHob/JR6ZLC0YTsm3QwGT+xOsaUVAIlX66cB?=
 =?us-ascii?Q?6Tfr6CRh3fm2QpuVYl04MrHyjZnf0+gPPs9dr9BMdhGM1E96497LAi+/2Zz6?=
 =?us-ascii?Q?3rohgaTcM5Lz4JaYTxyB+x8/HO9A0v9hVMrvYqMakDKmorGIxJHyuAuFXePw?=
 =?us-ascii?Q?CcuWn2IA0lzydHmqUBGOW2rr79VZQYIU8Y4sUHU/98kM8jXWIfIadCTFM0OP?=
 =?us-ascii?Q?FLFyHxF9AHkZnk6idvIjIk8Nhk7aKkLjjDA6eV9YndJPwYIN7nXUYmCxX4n8?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1638e5-fbef-443c-7c98-08db0445e5bf
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.7624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFlJ5yevXZQ2SaJiPuyUa/PvLGl7QXOU1VIHTVTPKU7757L80Ag5L0R9IK0/2/SdJxQAV7y9B0FB73tGS2ObXm5h1PNmK0hXN3+PkToHn9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2407
Received-SPF: pass client-ip=2a01:111:f400:fe0c::723;
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
index d1448dfcd3..d46aee47ac 100644
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
@@ -1542,6 +1562,20 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
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
@@ -1622,10 +1656,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
@@ -1633,11 +1664,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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
@@ -1645,12 +1671,20 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
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


