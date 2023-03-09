Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D656B6BD6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTW9-0000SG-QA; Sun, 12 Mar 2023 17:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW4-0000Rc-8M
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:08 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW2-0004XO-K7
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBSLr0wfBn7NT72znK+VqNm1wg2xpWs0va/SPKm8OL7ahkau+Caw7a2GiOmt1b4K7JQdGyVUJ9m35W23vIzPNNKXP2BYfIy2tkXu4KDlWPLrKB0kYmgokE4MYkXHpdAoMUouo+ncaiXImGQ+bHrpLhlJ1p74/toTwA5CHjKt77g7CP4hu5zIIn1+p2YHxhCJV/v9TNfWRTyKm5Nd5UhCcgQ0UxGZcp/C+6msbN2Tffqepwj8HeK5smX0CLMzyn+OpHiY2pFw8rEqwJMiQkjidQr/rBp1iipGyJGCLYh2NfeQbm5jBz0uuLMUft1obf4qqnzHnfJWxTuIl89ErU7s6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njnl6LYMteRMPzThXort/qVulvNH4Y6czZRibwJHxcY=;
 b=IUKfwQ77Lhnwq7aIpk+beTvD1RhdqcDekTnu60Nh7CST55s2qAv1vbTko0Ms52EpfzJt1IWkPZy8H9MpyYqkzIzWJbnuR+uyTf/mBNh5reTEXshqO0uYbZnfrph8j8hiquUWoZPvb88rvP+zTOM97dIYzrBvutbWNPbS8R3er+VTYF4V+mjV4C9PEoXmvWjJRxZN/wRPyBsr29PfvK5R/oBVGUSebARkl1Iw5Fpv2/0aPqCw/3DM+orI+LnPhuj/BDabKXagb8An9AxEutgTq9t/4MuXX4c/IW4k8+NPoD1V2vTLM9+Cv3lqkg0Q+Eg4qCq/1wLpNHHfs8/prPZ0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njnl6LYMteRMPzThXort/qVulvNH4Y6czZRibwJHxcY=;
 b=cIp/25QVyudBS6OBZSlHLFEy0h9eBO6TFx8qUc0/wbm2YahzRFWM462rQFgfzRZiVq/k9/4wofZDkHXJit9aXlibgxJsJs6ftrTwnXGiFX9iesOzs5Ffu/cM15a8A+dEoCEvd9/m3/HxoIJPFVvMPLlzYZtVi7H6HXJIs08qcxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 5/8] igb: check oversized packets for VMDq
Date: Thu,  9 Mar 2023 23:00:09 +0100
Message-Id: <20230309220012.25642-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0116.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ea7371-fbdc-4212-ddac-08db23432196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CZQ6QrssA48FG6ltJvH6xLL6Qs50BFp93jyEij0uCP7J+gEtr3u0QvKD7ZCBUx1Yn+DYfkZNAwJA3kiRqBvZCB9898l75JMK+MAhr6pC4oxdy46+TvP//A4jJgMq4sDTqvTMCsoc3t/0xWJKUHbAKsLIG4kcPLNtdkv2h+fTG0C4rRcc0TdIWsSqhwwowqlMLAoiVSyiHjg9tzCEsFk/VCadecIFtTw9xzF9Ed/mk7KuX0Kyo1gOjz3mFYQxQb6hHCCqrpF4I+2X6lFh/h6GS5AYDq3PlTpAi9906Tlq+OHGVRVRD/aNVJSHIFh6WgPQSUnSGWo9w4uFDWjvHRI2z1fOPxiidM27RVXhxTBLpvKlG2IeceZzmkRQxgID9lx2WqTguSRvqSMOILF2DNMMl7hkDMpcEC785AeCxfltpiEqlPCM2qPMrSXlIGbYjZd/jEIKHQI8LgmCj080xcAvEFiAldkZpPWBmc8WLE0da/Hgr9WNks/pjCobhVKXtb+Uj6dD4BMOL7t+FTI6YkZnsF8TGGNpuEmlu90vdnTyy9rUwoD1dtgPpEK/hzOPTtWTwVw+iW8vyVkdmq5USgrjY0+Xn2EMmxsdAwE2MwZeCNt7w64nFcgwUf8VrDBpgym4gNzdXfR0dKp7iXthmFIGbr6TXNROjxZHSl4mITGRfwtTNRnGvAIc/Nx4XJWf7nZYDsiRoQGDep/xSDnY8w7oUjIvwzm9CdXRexYCkUBSw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pU7XFx2o8WfJOLx8hREwUxd5uEk96rSZhgVzveXDstF3yZ0Ox88P3FH7/Vxm?=
 =?us-ascii?Q?2eh+dOTDII/P4M4OpTzFKqgO6eS0xinCjktPa1H3DtWpd6l0g04U5ZBTDjYv?=
 =?us-ascii?Q?6eTsawjF2Va11D01Br4cYA+gONXT4kYG7Qr04hv1eRImf8t3/Fh+XBB97e0D?=
 =?us-ascii?Q?hRck/QRGFmZ+6jby154IP7yn0kDUCX1bKf9fTxBtV3llODhTBKxr2vly9ttF?=
 =?us-ascii?Q?Lpcx9w7YPL0en7Hyj7tgaZAjJhZKTQfecpRNeKTY75E4vjtYkBsMdjHLRSt/?=
 =?us-ascii?Q?pqZ4UhMMeATaDL1LfsIi53V4juad6UpiXwUHn9JAs2FCEBOVS/qr0VjuvyPi?=
 =?us-ascii?Q?m6hcX9pta0d7kCT577gYu/uLuDEfH7SRHTvxH+gRifRW46ipx7c8Y7HjLd5r?=
 =?us-ascii?Q?F4l8B1dE3tEkCjXy4ruZX39r62KYQemH4Vh2OG74fAYGiFfpVkGlqj1XxITM?=
 =?us-ascii?Q?aPMehAT3/VxubAbeBZm6Rh3pK8TilR84krLfAPKMBFLQCcQI5MJvXWnMgAgq?=
 =?us-ascii?Q?+ADmeDGhVg+RLmQUkNgKvKpxnDXsofunFRiRs6/R1eHsD2PrYVAHuOpOZdpO?=
 =?us-ascii?Q?gNXFr9BRXeK4vzmhHI5gYshKDTQirIbB0RdAFDe8yYMPzRVh1TZoyMTvj0w0?=
 =?us-ascii?Q?fXPp/2fx0dDPWQ7uLR9EeMYNYL32zykBrGJakvDDAtmg/qUs/lYJXmNQQkJC?=
 =?us-ascii?Q?FCNYnQCcyqHft3XJ/GfFTcSUlCSUpPO15+6TsQDie9NJYIly+OtQd40ooFeD?=
 =?us-ascii?Q?Ic/JGPWS4g8Go0y0qY2rxUtR2cfAK09umK5o446R+lJen/w7SGFds+Ilgt+0?=
 =?us-ascii?Q?OiNmboQv/qOoxzPLw/TvHIrSCZp34xPGK2Uf6oSH5jNAePplg0fHAliVozCA?=
 =?us-ascii?Q?Abe4G91WNVVnmaFtOZBR1EUlMR1/CMXpiGMj4E0B9a3MNc8Y1YvAhITvIylt?=
 =?us-ascii?Q?wTfu3jeuFI3gyubIoI6yAJh/1PWp423loIE8y3BiMRYRAo2L59RJB57oYafZ?=
 =?us-ascii?Q?Gu4uuO9M1HM0cHt47Uqtchq7Pkz9jc635zEmxxwahJCQjUznLvGZRAb1NqGO?=
 =?us-ascii?Q?lIUUz7BXc0WHtLXBFD57hMnQMcWFcTcKv8xFy7/M9EEAT5gONb47JP+4nhvD?=
 =?us-ascii?Q?x6Re5Gul/E4kLOubBiNYWkEgeJnSqlrO9W4neIGezgPHmChSHsEgaCSuppWG?=
 =?us-ascii?Q?YVuP3KON2b0KoqBfSUq1uTx2z0kzY5A1JVaC506DIEjEeO7NSV2kPwsQRPZc?=
 =?us-ascii?Q?4p5GrFGLBHqXFEr/hitT3GNoy6JQT0MrgQWvcyytfvJ5ZgcS6r0YKHTAoJIf?=
 =?us-ascii?Q?hoChbetVJz+OVw7rSc4tkfCByXtI3ixSSS18bShXZTVarQdQRMc6NodXJCV0?=
 =?us-ascii?Q?bzj3xwnDkCPupy1IYjh4ICQPBaUTZFEEZq1DaRAAjw956+dn1AijyMow3Y9Z?=
 =?us-ascii?Q?w+6IzxM7HY8oGduj6AySMl1FFo9FCs68z/MEJSsh3ibsDRJqjanSaA0bF74A?=
 =?us-ascii?Q?s7B2MzgFaKirmUr+Qhr9gDjRYIGGrwUkr25vWp393dtKSsgb7ZxNU4Njyhjy?=
 =?us-ascii?Q?Paw86jf5GhREK0bhcjstj7V6Zq4hK3XXeFnXMYe5jqeWtp7NeK7jYXbytlRr?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ea7371-fbdc-4212-ddac-08db23432196
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAaYic6dNJpTxrxffYPpjWQ3Ge1NzdZgEnbZSVy8zXPPwB4/gKL/2yKtsNjJk1o5wHpwB3nTl5xAF+xZZg8HVXjbrQIBBjs5O2lHowax6tU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b2ea3a18ed..cb6993dd3b 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -915,12 +915,26 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
+static bool
+igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+{
+    uint16_t pool = qn % IGB_NUM_VM_POOLS;
+    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
+    int max_ethernet_lpe_size =
+        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
+    int max_ethernet_vlan_size = 1522;
+
+    return size > (lpe ? max_ethernet_lpe_size : max_ethernet_vlan_size);
+}
+
 static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
-                                   E1000E_RSSInfo *rss_info, bool *external_tx)
+                                   size_t size, E1000E_RSSInfo *rss_info,
+                                   bool *external_tx)
 {
     static const int ta_shift[] = { 4, 3, 2, 0 };
     uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
     uint16_t queues = 0;
+    uint16_t oversized = 0;
     uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
     bool accepted = false;
     int i;
@@ -1020,9 +1034,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         }
 
         queues &= core->mac[VFRE];
-        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
-        if (rss_info->queue & 1) {
-            queues <<= 8;
+        if (queues) {
+            for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                if ((queues & BIT(i)) && igb_rx_is_oversized(core, i, size)) {
+                    oversized |= BIT(i);
+                }
+            }
+            /* 8.19.37 increment ROC if packet is oversized for all queues */
+            if (oversized == queues) {
+                trace_e1000x_rx_oversized(size);
+                e1000x_inc_reg_if_not_full(core->mac, ROC);
+            }
+            queues &= ~oversized;
+        }
+
+        if (queues) {
+            igb_rss_parse_packet(core, core->rx_pkt,
+                                 external_tx != NULL, rss_info);
+            if (rss_info->queue & 1) {
+                queues <<= 8;
+            }
         }
     } else {
         switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
@@ -1570,7 +1601,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


