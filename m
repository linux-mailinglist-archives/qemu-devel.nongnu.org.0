Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E706368766E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8Q-0008Vo-S1; Thu, 02 Feb 2023 02:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8J-0008St-OJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:48 -0500
Received: from mail-vi1eur05on20726.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::726]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8H-0001d4-AF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOeMm/MfJuTuhkPNv2l4LTx1z4KLHJm7W+JvPJqi85WkOIVjN1FvV+xx2OPBtG7T+ItdC5/Ux/1e9qfNDx6Sblud1543lXwZp7QD7RMK3QIu5GuKqXNfXcPrh2U7DZ8yuUrzQ2ZUpvLV5UdcXakptALN0lx8/OGAlN2lVidYO2dk4SlyRcbRjR2/lKNP3fzCsIX07sjlg975cqgEJ2yAyJNDVrP3VR7tMWpOfHwT3QnPcg7rB83IfW7Sa9nLMV5fvPKiuXU9gSyQADCvg6jVmDNamCSnk8Pw2eU48Lef0fUDIb2zk3FkcM2paeyuptcCCvIt7rhvEfcPx6wHR9FYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx7ey18JLMTQwWlpCVOL51FSmm5a1QE8LMJ2Xw/B4As=;
 b=M+AaAHEh2wVgui+s5qVtIz+YNrokctlNwamhwmW3CsFrwhWHc+AcKWV/nzBB0iJNOy5JR4cSU6PTzHgTBMiw8JkxVrGfD6exihME1vtuz5v6G6VEXgMsvoX74Ao0xiYqEYXqHAD0P6mnkpXyLTCg/LRdUVz4dhsDQ5l1LEWkLe/JHGryaekhFGQaRU1fYJhNfJgT7/+s5sVXXXkDocpMycQsDfrmwyZ+bfy99opEZgxQnkECWJTcYPLB+J4aI3BDKbMqtpCeEyHCGE/MLz+nceXkVhiBwoJDq8duSmYqY9bo/0JlTXFzHJg3cbDedTBfJA8p92XAPPNP8r2NOAxd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx7ey18JLMTQwWlpCVOL51FSmm5a1QE8LMJ2Xw/B4As=;
 b=At7fufKijq0MCHJEZHsiPVLD6+bKpHYrGe+J73AJpf14aPKGAmwgtWzSQQytoGVERq7ACx9DWqsz/zQedcM2mRfrzm8E1DqMZAQeJg9cxVY4bqfMajV0oQ3+vRU6jfn91SWMMN1qzaF3KznBGQd5VK7ehQk3+j879dIVmZDecMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 5/8] igb: check oversized packets for VMDq
Date: Thu,  2 Feb 2023 08:26:45 +0100
Message-Id: <20230202072648.4743-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0018.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::33) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: 00fc22a3-b21e-4656-71a4-08db04f01461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2PhHTM5COUbn7rUuUmzszOX9zomPG2+OCr796ZRP79L8SsoUDDvNFJJ5zzVTYBesKet3ti4IorwLtkdls6O5FPtvolIXsv7OSj6YUnVpexUBYuwsJODXe1YRQVLaiRecuHYq1+rIpx1KktVY9mUz8s9TnefoLpgvlxWIkCU8L5dNANGxKCL6dvJScymmHyEpKcXHvLyGg5Y3NMlL7wsJcQJb81fxklvhZLVmFfPfud8EZetYyZ1h8OlyA1Um5vm0iw3ue1KlWpqqzpuprhSEIMPtByLxsf9ysY/kj+Ig5rHEWGsXKFLS5J7mAA7ETPwZvWOEi4JhAchYSx6Hked1s2fYtei0udc3N3Ucr3SZ0zuZKlFFrSOiSHbyLPI5MHwAYGZOE6C+IzmUycsiEo36qiXBJzp3uFCxP2RNKNrVAuYVOKPSaFqGKJvLeDuXhzGS98D0PG/hxbn40FZI7CAIK+TUQtL7tvhP/GxgmMtFVbpfzHi4aww5xbOmMGrmj1l3xWDHcp/M1MxX23jniQgoIsOcyV0GxoXeJhkIg4EognG/xaeLl4Ft2iCXMGNbXFPqvG5DRwdlxBNHbiuehwuY7VrxTWRSumS9hUvmGF/9jCKrtBta4BQxguH2mZwymlAsuOYYG1fzLlVQjfSr+noVd+55gMCt9x+iLps5GW1+ngu6/lW3SZyAHZ3cJpuFQJYwu5HlFx3kgG3kXnIqsDxN4o4Nf5GGR+/BaRhwy2v0i0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mf3mq6/h+lz1uzILU0R2DDZ1cvUuQtncy0evicVIVnrmUSHFPbBiFG8N4ynm?=
 =?us-ascii?Q?YPBKBOwEnktb3zedc3jYo3ZLN3y+SCMM5HQfVlRplPq5zxxOy6nZAgevY9TL?=
 =?us-ascii?Q?Z/5N/WklGta+tm1fxvvj/9dAsf4QjA+d4tClS5VUuzHTijM3cQ4UhcsEBMp8?=
 =?us-ascii?Q?pTj1qPvVYS+J+4CU5BkKgVdLmIiQhAC3VkVeS4kujjjgMk+9mRHwYfHHH8/n?=
 =?us-ascii?Q?yHpL0YLyCq7Goy2wbnORrRTvi1vt5pMqdLyoa2a8+0nUm8vooJ2mbgY3Hy1n?=
 =?us-ascii?Q?kfpv0OEa3q/sKmSR0aQGAlyAuRq1JGbanbTXI7MG94toalU+X9dkeLWgqQGq?=
 =?us-ascii?Q?fHA5W8OYmq5gJZly8o17SEJCC2oSqYgZtc7deuVfPG5xirm/3WLA17j8HBKf?=
 =?us-ascii?Q?yX8DvpPoWcD00qVEVWt7y5MvS1F2rZSZYdFb2VUxSxAlkAxI5NAOjFEyQGsX?=
 =?us-ascii?Q?2NAkAYus9OHoQMIU6rCZNfMUR6Qt5E146e/7+H6n66gewXa6RG2qAi7cf523?=
 =?us-ascii?Q?a5XoT3w/zoxOdNqZwc4jWaGtCSVWkGWkiLEkBN/kIuDG/JrLg2hOZndC72T0?=
 =?us-ascii?Q?uHxc69QUf4XxZi193pkY5UY6e1JnEuMEWK7CoiQ+T2rzBtdU0Z6nBE/JUKHW?=
 =?us-ascii?Q?BdTJ/zUA3TnUHv5QAnLnAUyTNTxgNjHxslZY//Ev86bfLCxthrDtn1gJnQ/L?=
 =?us-ascii?Q?n8tLU4hTloqPowZWwBCHMV7t5t+7q0GHybXIrBGXPs6KQdUkuFBpa2lHi8Rh?=
 =?us-ascii?Q?pHJRHRrZvqn4+LVLeiypPyqlNOZz2hN1xXvuhMhSbnd0RSEng2CywGMLOb6m?=
 =?us-ascii?Q?IIl4Cqdxlw35EpV+3urSD1Jo99blW3C8zF3mWGa2ASwdjssCMEa9zLWX7USo?=
 =?us-ascii?Q?+rnL/bmhpxMqSRGptmfxVz67iq24QL/m+WL7hgYiCwxloazBRiIC5FCDWHzt?=
 =?us-ascii?Q?NX4512fNXEMaqUtXDJJILYbjl8qIO+fPZDG57vHPW4wyApQivY/IIrOXEcEE?=
 =?us-ascii?Q?cEPcVK/Gr362T+pS9cL87BW0RZOASRAY/gHgThS0AOiJeNvEN7iDSPQnOrkD?=
 =?us-ascii?Q?pWTPieXt3mxUlOPw4g6BQ7mgYTusjkX+SFHStmlby9sh401vr+qhMUyMbOlc?=
 =?us-ascii?Q?F0E6ZZ9VLcdA0K8HRGcxCJmzyoZzJaclhUojDEHHE/TCMCK/mojJua59fKCg?=
 =?us-ascii?Q?lI0w36PZn/j3ZPfL1Vy9d3QuSNwBnQc4ADiFea7lNTXh2NotgLDN2OagRumn?=
 =?us-ascii?Q?IPlvfWMT9Vlh1aQLHFCI4cLzKBaXrBp8nE6tJOpjnoTZFZ9au2JVbLaLyQFu?=
 =?us-ascii?Q?H39P8WGVMqEMCUMS/FkGyrTDqVax5sAwjTVDQDXWRFlFxyoCwEc2NISkDFB8?=
 =?us-ascii?Q?ObPs6Cvrh6OisKMx85RbJVd8DFAc6qiHnyuqQ2rk1+emtFzD0YVv2Xadu9vX?=
 =?us-ascii?Q?6jNjqRA73GCvw9VIc8gu5FdPlL4OpXAXC1u48z+iFAMVevusKXtKOY0GILRs?=
 =?us-ascii?Q?fFLXhywV5QCm2E45go92uxGUyZ6tQmELS/TufuoQbn9FkG6vh8Gy8gCKTVy2?=
 =?us-ascii?Q?StARRiM2s1hCxtqulZmbWXq61jJkBSB1UUtCOGT+ul6icRFA+HQeCmG7t474?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fc22a3-b21e-4656-71a4-08db04f01461
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phe6qIb64rC6w9EgG8IvIf7m9bDkx2VTgZ7yD5BCgwfVTBHk5qlNHnoLx+OKiY9CGB2/0OXD8GV9mFN8LoU+Kt9UD0UJDSrHg2TPoZmR760=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::726;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
index 8437cd6829..eab140070b 100644
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
@@ -1565,7 +1596,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


