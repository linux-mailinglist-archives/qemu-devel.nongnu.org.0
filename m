Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0D6C4CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0p-0003pW-VU; Wed, 22 Mar 2023 10:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0h-0003k9-Qh
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:16 -0400
Received: from mail-db8eur05on20704.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::704]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0g-0002Do-82
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT/GSaRODrPzeaIq+0rIqBFXHKEIBKlZO3EOxvfmO4YDaf5oFHISQbTdKtxvZqCqpBE/xmrJ5y2UzppC2hf9c0MeOdYkHdJFD4lBGw2jlCdp64ZqccuTfEUXC6SpIJ+JKKj9isPWaQWx7gtTxr1eQcHIhbQJQ4XFZ8sb2MJ5AaD39bwrMG/zJ2JTFk+UwWgDrxTA5McAurnvKONOC5AAqvm9Jox7zEN1FmYuiHHrxh0Hdo2MES6mO9t/Ax1dJ9nOMsboAiRib4B4V02miz2+eIeiljFHoDfxu0LRLb8dj3SdFRQs7kwxop2g0VSvWyhBBtbT4+jm2apV8sjVCVwf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlu/UoaBaH+uYV6HExvR1/GXjUjY06YD2ftUNqkgTn4=;
 b=Ud3cWQlMa0aZeBFDYlo4FDTo/LR7yaolprOTj6BuqmC2LxMxg/ZQOnfDaHOvmgaW3Fd9iHLoH9k9DJdM5OjS5rmrSQiQ9KMYjmqn2B9F548Zr6lsGpMj0AnzeRHPEmjV8pExpCFusvnwnxWchnRsn/6mFq3LXrV7FiX5+uDeq1NmazIOcdugVQiPTT3WwQ3AvDA+GnKFtblUQ/7dq2u0Szi/hg9vhCVLv2f1VVx5kWlo0JES6lJXD/w86EcG3GX4g33PiIiHw2gx0n+onCw+2JoA8SUYsmm6gQuACKrKN5TuQHQfKhwk2vK8NKcwPdiAP6AvYnYghsKNLGnfC7DIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlu/UoaBaH+uYV6HExvR1/GXjUjY06YD2ftUNqkgTn4=;
 b=hkvp2E7JPMHoSEZujfji1Arxwa3Rw1HfpxJU+gjtvJSdAYzcqjehs8c/wC3UZuN3ztSYtS73VpF1c/NAs1LcOuoh6r6P82GwYshRyt8u8CyhiB6PcFq3tnO3ESKjs9wGUq0aJ4rHkScCZbWQO6vXBWiwoFglcnMX8NzVQ5PuS4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:05 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:05 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 5/8] igb: check oversized packets for VMDq
Date: Wed, 22 Mar 2023 14:04:37 +0100
Message-Id: <20230322130440.26808-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0094.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::7)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 831c7c7b-136f-4407-1433-08db2addbb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O29dXfFvBG0HqEtqiE74uW9F2U7QryL4lqe27ITaGIepV17pZwyIbXEE1phFRO3SntH51GODeKy/i1aVIytkMf3eCqOtAXvjIPNmHyV9jyIYdwHYeK6PWipX91vczkQjwdOVvd7fSm6uShNLk0UXweS1TIIY7emt7crpZhIKSJht5SY2/UZivYDawz3kGTdh3T57ARnmlQ5E1mDSs21lFauzZ8zwmTKKh0a6AAbrzIq86py1EYzslKliegpfDoFSjHFZOeVynw/64nhJfz64ynnuVAutqCGNIoYbD7a1xMjPGAGTRmUQCEDYWvjNqTRna2+rc/sg2RC5oEB4MxQRLi4wXBvtVaWDZUIZd2dIl31MHxIi+7X0pqpy54s0Bp+pmbcEbpX3HjHe2Y5JLzzvrqzuKenm1QeZlpkBIUmnoEGuQIw5CnbBWqthota9WkmL8JwK2jEOvTcR9ZDyVJ1ACAitrnQjtY8qJGpIHSN7RfGuy3nufp/wbmATiLGkWl1gyEgPmsFKkrlN8DHb5IiP//j0dJIL4i7HWNB+5Y6LXxjjgHOcrd+3SgV21kcYg7Jaf6hgOyy2NzOqm/Smk6woi2Gz+vaGfvWXVAiflS96r3WHwPNxQoKYO67OwY8eLxRFmunuvb8YcRzX2cOwqz/glQDt9GUypeQFWMa8kOxFeVHwuU9i1PoS3dpHrtEgpFe5Nba1ksAMexngh4UG9lC24k6WSfbtjBdU8LBYRZtbtAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bTNTcbENOe8fKUHHmpO4lX73b8vGwRKyTa3JNEETNk2czuWBN47ctskSmPSG?=
 =?us-ascii?Q?QYR44KTZqC9ej2GalltWzVWdZ9K7DG3Q8cdhPEn4kFvuEmX9Th/0EDskEG8m?=
 =?us-ascii?Q?qZq3l/JGARtTbOXqIN680Nf90SHrCl3GYaiUnCyu2mRzW9EPJtD0Yh2S1vRn?=
 =?us-ascii?Q?AsJwHNCGdunw40Xib2dsLm9RUbeQRcLtyyVs+jMOWL85rL9VSDe6tK4TzIJa?=
 =?us-ascii?Q?6zjbEVm3Ju8fcBgn4AfmvzEv837oDlxtrwDed5tFALjT6yU++t9jYWKw9PIm?=
 =?us-ascii?Q?NSjrnJLfLtNlPfPU2rlIfTeZSEqxvl9Ucm0X+59y7Ebi1h7MVByWAaTsFI7o?=
 =?us-ascii?Q?Pv6aCiIe9jJ0S77GzAPHSVx5fQDxasIV7uoywWwfDNaeZHRCKAYbi873tzAS?=
 =?us-ascii?Q?xhsQcIi+iJXEmojlAgsbCk3WLGegCSR+cKfYY7HDGdXJHzMUqoNwmUQqk3Au?=
 =?us-ascii?Q?C1jvdDmdD4/l18mi8+iWMKOsrOnfvVftek3w4leqyMOfk2zgzNhV8jVzZnPM?=
 =?us-ascii?Q?qiDxBB0umUS0S+jenklNiKm/uVT6myTaNCM5AyjPOeZ1vkw4Q0owXubk1xio?=
 =?us-ascii?Q?BVZmUyXM5Xdvkr1uNVTrng+d5zseaGe7vaoRlXdIdnYt45NYKHD0yu7hrm+N?=
 =?us-ascii?Q?XtJbMc3qM9j2JtnVOqKm9/hPXX2eI3xMX9SmEAkiHF46bdehcHKSc18EiuEA?=
 =?us-ascii?Q?WNa5Jm1li99651+bNvLhJoqVcD1gGhZG0FoREgCyeuDtGv6QYrsdK9TEqqKb?=
 =?us-ascii?Q?HA1K7OweaQRkw0B/JdaHgPNNX/UKNaxaxN2oL+LlSi6RyAQ07YBYtWymns1i?=
 =?us-ascii?Q?VtQw4PcCMz//V0CSDTFmmmZU4Rsl0tKel0ClcoJGcNzRMsIjHy06AQJ7Dp2r?=
 =?us-ascii?Q?rymN8yC8UcTSp8YxmQSyCv6z8c9ERjIy67Cb2GbPdTdO4ByTXE3DDlyy1Loi?=
 =?us-ascii?Q?o9jDlcETC6djhizfJ4cF6e5bZfkVVUY0pl4fbShDv7pVadGtzIaOHeNEhax0?=
 =?us-ascii?Q?1ajGWkKlKlwasiOKc/ma7kwiBzLeBKYatEjIOVcAocJgNB7rwvp0+p2ReZoV?=
 =?us-ascii?Q?JH+qbU0QeSCHStxTHSoUd7hxlfTimZ/U5gPtgNjhhNmfoezZzW8n7ARoMtep?=
 =?us-ascii?Q?8zSmeCV2aKyG8zVEHHEApB5n/CJQD9YT06RKKOhX5gh0LxCULYE6QhmzhJ+q?=
 =?us-ascii?Q?rT035/bIvUxP+xMLaGt0MS0lAjoqbdPWEdmBoguwlhcrFMnIR2U7nJT+DInC?=
 =?us-ascii?Q?XDwvUrKfXKF8tsukhUQrXmIKdF5woEJ0EoYh7YxLjetLG61xrKpTw/UPihoY?=
 =?us-ascii?Q?HMqfJyW6ag1glG0f/otoWGvYd8+nrPMndTRMSArCz+5um3ggXbyuZc+PzrlC?=
 =?us-ascii?Q?L7MOdMS63TBIXCkQQds37yddsbHrBhTYFrMs56hEtHSjsZJuwhREy8OwstGc?=
 =?us-ascii?Q?WxVr3Jos+IyQBo4J89Kqp+MZFlQQYPoeCUQglFnI97JAu/Y6mdIl72dm4yhe?=
 =?us-ascii?Q?Wtwza9ji8X6UgszyRTUccMOGKQg0mbv/in7VspzSZsZ7kPDDzqtcK2GbsZZ1?=
 =?us-ascii?Q?b8WIxK8/B4fe8gfRUwnKTntrpczAwSV96UEGKkcDbo15AJn6h0TfIX7HUnf4?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 831c7c7b-136f-4407-1433-08db2addbb8b
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yHIvdrfuS+PsTDxKKPlAj/BMu+Dv+OLv4Vp0fdgd1h7f2yiWUMTaE4v4N2lECNqPao/BAknqyINPE7I3GbdCg+rs0UzqlNlKfztZChrn4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7e1a::704;
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
index af979b4739..0c5019fd6c 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -918,12 +918,26 @@ igb_rx_l4_cso_enabled(IGBCore *core)
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
@@ -1023,9 +1037,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
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
@@ -1573,7 +1604,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


