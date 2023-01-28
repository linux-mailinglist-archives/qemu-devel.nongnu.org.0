Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6344F67FAFC
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLsA0-0006bE-16; Sat, 28 Jan 2023 15:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9t-0006Z1-RU
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:46 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9s-0005Ml-5p
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQq3p+TUHhTpa4LZQMc//Yep3pnAH1zW1CPQghe59aiB2VK31DUPkwCp2bu9B2ekhJdBIVu2zLiIkvWba+FIWdvb8HBWN9jCjZgu9vxyArp7na4yCp66Zp6C73aITT9yLSIKMpBvjXVySPW9l+tN/+Bf0t+8MxdM3fq/hLMW3f3rlyIspskj1+UYFUw9xE/Dq6VIRpakK5TeETVKbavefJS+5eiTCdCs8nAxzwxnwDI6X+ERqNkGnYB27KfQDOnY7FmPhGWVfxH5kd4DdpnFkFDJSD4RzryvyJz0hUz74K8n0PBZKlzRx9bTbiUj/ZkFl6fFRKlfyFrxyRgkou1Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+78nmude9Trd7pf6IUw4ymNxxRA7ckSssJsy7Ml4Qmc=;
 b=HRvClQjyN8hCAUI2/4dEAaBtwp74NXcYqiJcsJ4mqtBz8PTEOgXYSj7IXnBuJHo1k2y8W8MyjcUQyG1YS7wARIcqkAI4WpZbGxn/mcIUdv5S8clpkEz0e8gLyWOHga66Dv60NNqFYSUJrzpyVzeVAPjTQLwiVRp8bTH5SmBWff+rPAxYqyY5GYrNCBJ5vYim552RYwTbseAwWm0154cARK90+mzYSKww1QpJHTdGra7eXTLmOxkFpfnZmS3yzauGVjShCJVMvxw6AEk8nuLDabwCo470MzE73H+tiClTGuDwYmq+4jSbU5FLNrCmw0Ya5Z7BI40zD19l4HnziHCTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+78nmude9Trd7pf6IUw4ymNxxRA7ckSssJsy7Ml4Qmc=;
 b=A5SfuGBzuA6J3oPCriXbTwkMDVqwzsoZZ1vEpFBRZSJx04Q27gt0OmSTEpyU8L/NG5cyJEigMVHC/aOy3tNZh0q1Kxy+8ziKPlCg21VUIkmTMqGsZF32jy2zJKziX/xE1AN/AyneYfHhe3Wb65XN9qk4mSvV6KgNuRz7Th94wuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:22 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:22 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 9/9] igb: respect VMVIR and VMOLR for VLAN
Date: Sat, 28 Jan 2023 14:46:33 +0100
Message-Id: <20230128134633.22730-10-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::13) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: de5d1c82-f41d-4b91-dd68-08db01714508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2y4J3avtWR/wEDLoD1d84CcO4xpB4FnBl8JbrYCQLkjBUE3I3a0r0Ov/O2lN+UAGsovl0YJbFut6MtoWj3cMuPhGy7FmB704S13oWtO2QBgVH9F4cYrT196TtnCq9uWfgOXPFmLlqSAvPvmPYe4HCLGPvsfSBxglvsCiEnQpjwFZgz1g+Ls+72Tc2aV8ZM+3WvBAHRSrAP3nsit7/vnEFCICDOd9NkNu7P51NCl0GXTl3CLK9+ukOjNOEo+hdne1iDQ5I7GTPndw/w5SE7RgkeSXAei13vqtwo5/R/Sj/JF4+iv994bk/VxwQZFdGJD3fbClxH4Lfp6moi7FmSTDBXJhfXPKPbq4I392lV5CXId0ChdDQ6eB4Tt8iE9MvOXgs3BZMmmrGZ8RusDzkr/zDcOY1nkAMwQIjhMW3txL4aWPdwTLzhaSh+G+jh5zEXBF4tdHPGbKwYeDLyGlwKM9VrKtxGraratbHHsjMwbjDukfxZJVWNAVGwFYR0Sh1+OQ0VoPb8/DFspVkOb9wfwmBXjlFJUSXm5M9DRm81L1d2Za33+FKaouwA+OW+oYgviWSTzzmvwnZCr4lEQ82/4q/4a8ZBepG0YG9s/6JWnvQUMnY4NAwIZ7lFHvc5qwPOK3bBY4ji6ibcqRo6WqdBTQGOqWKV2d620RnPV/3zm0j+8GZsbp1w97CObcoxMRV0tVIMO8giItiBpXMFAYmQbRi+Z6I9Ehh15rsqgNmslrdm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uxlTB1el2TyiEl4gg47g26o1IS32THGpAEW0LY3ng34WaSAqSl8Nc1EszFIh?=
 =?us-ascii?Q?CoJIfYVoVwAOP1I5kbFHTpoad9rusbfi0uoMyAL6pV1YSK3UWTe5piY3q7Yt?=
 =?us-ascii?Q?OvItJNP4UbjItjLARWHxZo4lJ8sPN7WglJstHtEsM9KygqrEvsQASczaqvEy?=
 =?us-ascii?Q?NmEOXlFPn7GswbTfPqmMXrLn4O5wIfFMidJyqB8SG4aAR7ohyQaO6G0sO5nA?=
 =?us-ascii?Q?T+RpFmluubc5Ad8Or41WiP1oAPnuu940CcMSnJ42NkOPw63AKwF7ZXJGMOhS?=
 =?us-ascii?Q?GrISxFXWmt5kbMAMf4Ctnsc9FSNF3gpHTvj6Uv3sFv1gKHjE2Gu0ZmydGXFt?=
 =?us-ascii?Q?IVg8O2zkv5KJjJxmfrzaE/4RicxtjRs5gmYQ95tfpACLvSpbg+gqfottKthG?=
 =?us-ascii?Q?ypM6/4eSoD/98w0bz50Cu5TOeN/B7vBqo/lddCE1li72UhFgRQJL2qXyEO+k?=
 =?us-ascii?Q?q8CkF2dBr2gqoJ59bW5Q5JchD4Y0evjHeWhSzkipIh+N3U9NBvLB1KVkZ4sQ?=
 =?us-ascii?Q?uoB53cWlW/uXylY68UuvJI/nWQ5GW/7j7CLJQnOxIbqM6OAbi0LHuCNhN9Aj?=
 =?us-ascii?Q?vpvpscWDVm+YCZTGv6M+szbhEeNUO5+Yb/zEbNR9AArDjUwOQnKNjp+C2qhA?=
 =?us-ascii?Q?9m1qduCwvQD2z07NenTgYkXmjciCl2MVGLzUulSfZToP+WLtEdr0/LoF0/B9?=
 =?us-ascii?Q?NDBlm8rFCrIQNyc3zPrM+qhJgItv3My5466z+u74j089SKi+MXyDOu8q7R5J?=
 =?us-ascii?Q?BSx56aGN1cd1u0MzOnwJR5fYoT+xT9iHX8ZAZjPPZNYOgCJ82Ijm2m8lZGw/?=
 =?us-ascii?Q?NSjnvT/RIGMtOJKfXGUfbC9OnQeRZ56nsQ8IpAj/qgAgamImApa4wAggCwrw?=
 =?us-ascii?Q?wRvFT6EWaylJ20M+RFh+WRMRunaz2HkSZu8GNTOV6JAuJCyNaCoJbII6I8vo?=
 =?us-ascii?Q?EQcLOxu4gXXVl/COsmR3B1Oo75v8qqJWz4jIlUcc3OxcJUW6Syr6EgOru9Wm?=
 =?us-ascii?Q?K6DtDL0o3BBTX9rs40KhxaJUF/9RFlxxdzl/qEzXUa/1y2/zQ4+pxq5qMzrC?=
 =?us-ascii?Q?cs0JRMZpYR2W7A6BGgcFvoMfJaUTfGzBKivXWLRj75KTjsJh3x/fEjVsLEnx?=
 =?us-ascii?Q?xPGk1bhR9PCHU/b+9I+tdgxCjLNIORt5tPIGftZWSCvXTPRMz2MCsgoSz4xN?=
 =?us-ascii?Q?aHCUZqlQsxou5D3X/XItcXBys8yxEHtQOJpMxGtT+6GP3BcOYWtUiykhOFSM?=
 =?us-ascii?Q?Rul31dM3LbXOw2fbhR4zidEpD1V1J2rcZAYQPpc531UvQAeYj6Qrgvra4MJ3?=
 =?us-ascii?Q?Xlyh9lXDriooIyrjjmV2uhVr7s24BYKxqIzgkZCf+tipsdlRsk1qqweEgP3T?=
 =?us-ascii?Q?gSl7QUKJdy6RE5ttAM6jdmYh3nensA/2Qo57/nJ8zVMCPOKQcHkgujEaFtoW?=
 =?us-ascii?Q?/Y5YENtaCNbaZxLeh+oRU4jzIOcg9SnwsrwKleF4/IWwtG64NcawjQNgnQ9y?=
 =?us-ascii?Q?C0YTiQhXX6B1tCqZP8VVyWmimOHvz5cfdZS744xcXE/bKKBITgfU9yZM1mgB?=
 =?us-ascii?Q?W5oPrm4OUX8ptV1rEXxRFtyYVTD2DgevWcbQdsY93OIMOr0OCVx0K+MLRCbg?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de5d1c82-f41d-4b91-dd68-08db01714508
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:20.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGqLYNCbGYanBS2sl/dQmisY/fc+xeogNZKlAZTqol76FO8wVxXknqcvv98CTpIafZBzsKGgkIDKUlSr9laI8eNl+2CNpQtd0xKpVGmgR4E=
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

Add support for stripping/inserting VLAN for VFs.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 100 ++++++++++++++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 35 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 8e33e15505..96a5c5eca3 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -384,6 +384,26 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
+static inline bool
+igb_tx_insert_vlan(IGBCore *core, uint16_t qn,
+                   struct igb_tx *tx, bool desc_vle)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+
+        if (core->mac[VMVIR0 + pool] & E1000_VMVIR_VLANA_DEFAULT) {
+            /* always insert default VLAN */
+            desc_vle = true;
+            tx->vlan = core->mac[VMVIR0 + pool] & 0xfff;
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
@@ -580,7 +600,8 @@ igb_process_tx_desc(IGBCore *core,
 
     if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (cmd_type_len & E1000_TXD_CMD_VLE) {
+            if (igb_tx_insert_vlan(core, queue_index, tx,
+                (cmd_type_len & E1000_TXD_CMD_VLE))) {
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
                     core->mac[VET] & 0xffff);
             }
@@ -1514,6 +1535,22 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     igb_update_rx_stats(core, rxi, size, total_size);
 }
 
+static inline bool
+igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi,
+    eth_pkt_types_e pkt_type)
+{
+    if (core->mac[MRQC] & 1) {
+        uint16_t qn = rxi->idx;
+        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+        return (pkt_type == ETH_PKT_MCAST) ?
+                core->mac[RPLOLR] & E1000_RPLOLR_STRVLAN :
+                core->mac[VMOLR0 + pool] & E1000_VMOLR_STRVLAN;
+    }
+
+    return e1000x_vlan_enabled(core->mac);
+}
+
 static inline bool
 igb_is_oversized(IGBCore *core, const E1000E_RingInfo *rxi, size_t size)
 {
@@ -1574,6 +1611,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     size_t total_size;
     ssize_t retval = 0;
     int i;
+    bool strip_vlan = false;
 
     trace_e1000e_rx_receive_iov(iovcnt);
 
@@ -1615,10 +1653,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac),
-                               core->mac[VET] & 0xffff);
+    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
 
     queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
     if (!queues) {
@@ -1626,8 +1661,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         return orig_size;
     }
 
-    total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
-        e1000x_fcs_len(core->mac);
+    retval = orig_size;
+    total_size = size + e1000x_fcs_len(core->mac);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i))) {
@@ -1635,43 +1670,38 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         }
 
         igb_rx_ring_init(core, &rxr, i);
+        strip_vlan = igb_rx_strip_vlan(core, rxr.i,
+            get_eth_packet_type(ehdr));
+        net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+            strip_vlan, core->mac[VET] & 0xffff);
+        igb_rx_fix_l4_csum(core, core->rx_pkt);
+
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
             icr_bits |= E1000_ICS_RXO;
+            continue;
         }
-    }
-
-    if (!icr_bits) {
-        retval = orig_size;
-        igb_rx_fix_l4_csum(core, core->rx_pkt);
-
-        for (i = 0; i < IGB_NUM_QUEUES; i++) {
-            if (!(queues & BIT(i))) {
-                continue;
-            }
 
-            igb_rx_ring_init(core, &rxr, i);
-            if (igb_is_oversized(core, rxr.i, size)) {
-                oversized |= BIT(i);
-                continue;
-            }
+        if (igb_is_oversized(core, rxr.i, total_size)) {
+            oversized |= BIT(i);
+            continue;
+        }
 
-            if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
-                continue;
-            }
+        if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            continue;
+        }
 
-            trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
+        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
+        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
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
 
-            /* same as RXDW (rx descriptor written back)*/
-            icr_bits |= E1000_ICR_RXDW;
-        }
+        /* same as RXDW (rx descriptor written back)*/
+        icr_bits |= E1000_ICR_RXDW;
     }
 
     /* 8.19.37 increment ROC only if packet is oversized for all queues */
-- 
2.34.1


