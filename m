Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F021C680EEE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUA6-0002HF-4Q; Mon, 30 Jan 2023 08:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU87-0007n1-Ta
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:28 -0500
Received: from mail-he1eur04on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::730]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU86-0006AH-2U
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQVd7CtAf9ciowFHer+GJmmyRziQoKUSkqcRFJBG66xzvcw/VPVs6XweddfVPrki1TIUMIjNYAn7vfFkgZUww511JD2L8ZH3dtcBQF9IIowdiuo/ND4KS/DvX+7iFIkYLfsojCEcC+MKlpnhwcJ084BMbtlkeWAmt5Xu6v+rWrpef1cOdoAVsYxGozxxEjetw4Ji7NG8PwCb+lwkR3wPAMQZ002F/UMNNHZVbpvdKsKQFOb4gn7g35C1eYkYhSgYFeKSaLLterZqrT272Wip+0QrMDZ6h+q5zVxxKUm1CMWHXlAFKRlASTBOqFL1HEGVe0atfLlm4jCYINfnaraY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lQYxoJJ0vbL2QDa+/9udYDjqyJ4ndhIcYCSQbYAYlo=;
 b=jqQGq4Yc1T5L6BLRblyZCmqdJ8HUarca92mhgHT9lmarvrkhMiQUijKhegazqZvfW4AvSI2xyAqyq6EuHHm88shv5eAkf8JITyfnORdJfQsH00wUkOutKbQKb9RPvv2o2c+uROKpPXAJpXj6ookeOgzWNABfSHvY3oKe/Kr/zchGfIyv0JtyAeObydKdT3FsCFSw/W0WLNtMqpWJzpVOuFPkPOW6c7sIKs4kA1+0sMyM1PXDLTDEHMOX4/EzKZlJ4NzT/8VS64zI23+uNZwfxTvzKWYk8CBTKLh0HoYidtBC+3QXrHAnRORSXQ0rc1KiSkKN3TSoy5Lj2Xqdh62DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lQYxoJJ0vbL2QDa+/9udYDjqyJ4ndhIcYCSQbYAYlo=;
 b=FliJ1xUJa6kag57ErgaFP1X249AtDw9IWqqekQJKbsLrE1FSDP8zZzCGmD8kKLW0bZBcLu6S/i4v5uMasH5KfGhTGPwOO/+YF9uCcLbl5NW6l75F5SsPJbOlNO430zHiX19tuMAjQCwhST5r97oBZj5ErIrHzYZFM9asFXzTQ60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0885.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:11 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 5/9] igb: check oversized packets for VMDq
Date: Mon, 30 Jan 2023 14:23:00 +0100
Message-Id: <20230130132304.2347-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB0885:EE_
X-MS-Office365-Filtering-Correlation-Id: 616f6354-1422-406e-3e72-08db02c52264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBFjLMYEEhDQ1/vk0RdV0RcJLEf/7102uq/rlfR9J0Z6Fi0VTE8nFkAv3+syT/BRRBScDbI21wrdU3stL/lcUmCKbENVXKcLNXhTTLRT9QwBJDJBBrb+dIkFGDCPQLD7Dg/v/DfsizyNP7qyrzEJXtAzbbJYWx3eNMYwOhODUAMI5kyf3mhh+wGc1sLO0ZZ4E+FdwjN5COD0qLlGAmZjQvQmO2nFeH2r0Q/Ab16maqkgxE4iKPtEAdtaoV6Gr4SW2DO/eW7xkhBk3OdmXP6r/rmx1blgh5vyljbv0ZzueDurwUod2Y9y12xBTpf0/5D9yAUAkdRopnhWTblVoaUSvLB7UvzqZMXagfRChtqZDNwPXfadawNA17ifZxnMYTQoG3kNW3QWdeznVaFBaAp44ZeKDy5TVUEjQakYqGfcMQ8ktxt1rLaBGSfPwFXVl4NgehkceDiEHXgyBj8PI6wDgq0n3+uxc81ilYRgvfU4zLzacQopU5uSMMajfS37FBk75x8l/mAhm5gBXdNlO9kB01muIWYgC4aZyWWUcaCyEZSKyoZh1UW3gCI3x/TJCHNANqYrjdclnCNPcTOiW/zNv7igs22fklirvyov34eJB6mXsKvlGvNYu3JAMuHYdw8YrRuy4yDA9/VPNnx/S6cMq/6TtD1Lv77FzalitSX6Sa9Qs7L2MhiIcBuQ4kGlzdoLChXtfV2NBniDu/SUr/7s/LKKHZybHMauHREUkbN70bk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39830400003)(396003)(109986016)(451199018)(86362001)(38100700002)(36756003)(5660300002)(8936002)(70586007)(54906003)(66946007)(66476007)(316002)(4326008)(8676002)(66556008)(2906002)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(26005)(6506007)(186003)(6512007)(1076003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?24QkIlAdd+9dCnUGxQRXDi6tJlTX5ppEA5KFvgbcmYvN3704i9UW1egcjk+0?=
 =?us-ascii?Q?C1T05akyCxtar6ONAv4AIdPXxFZAugv08ntUp/VElX6LETBT9qoJwwrPHjNg?=
 =?us-ascii?Q?xj3yHOfu6Ng3p0gGp3Ef7nvh6WwHzVjh7tK3b9u0fNr2XC3Z62hwJSF7UwE5?=
 =?us-ascii?Q?uQka2lWQa11TpgbOO7KPyvqNDRUL2qxvjG5pT48PubThOU/ROxiDn7sLbJzh?=
 =?us-ascii?Q?RqoYl4j0yxEiFt+B/jRW8P1sCIEFc9iBbgfi13ZhcpCOCBx77PgmOpF4vpWN?=
 =?us-ascii?Q?xh+jfGIBcbYnm2qEHCdKxjzP6saCrdDNa0LnUM59HbBa1hkRkGnktC5bBgmp?=
 =?us-ascii?Q?4bqexZiHBZrdaYa0CuHn7QZaJtAzcAs5Bk2QNqg6kfeiehs5P2ws5svzRf5B?=
 =?us-ascii?Q?9SZH9B2+1wGXr3oTCBgAptg3uGaEe8eMDPtQHG2brn41axOy8q4m7LS0g7w6?=
 =?us-ascii?Q?f7chablNrcqymnbE4/Ixhc15YxdSwNMgz7O5lKLsDBjZLOHHczOuTPpP85Xi?=
 =?us-ascii?Q?4lQN/qHhiz/bm2MYRgp77ZS6vTtMji/oxLLC0tvC+AWYn94WodYHfBaEjOkf?=
 =?us-ascii?Q?2Tb0Vxc7WIeA227Wh2WPMI9F6d7IaX3kqHUg/RpkwUuVulkqI87fKOSCY5u8?=
 =?us-ascii?Q?rEWD/wITlgEPiIdjDve9V57K2c3d7vOKkpkomIb1aPgg6GgsZbVwk1QXLG9d?=
 =?us-ascii?Q?x2inZaW3LZaknGDsiJY1dyHhSvT8LbYxpHP4lmYoOPmqfiS4lNr3+bxvErNv?=
 =?us-ascii?Q?LbC75svuOm/bQx9p0mLBf79SyoBT2vIqXpg2YDSM+QPOGydITcQR5BjIPHL9?=
 =?us-ascii?Q?pJJI6fGICXHF3nrEHni7SBcVVwxxJ8IPivpbP2xe4yN1/vRLdiO52srXvQrn?=
 =?us-ascii?Q?IpbmBWYlY9ydwJjWkd92/zXY2MWzUyPlRsSPpva3FyLw1N5fBdXxkOwm6WuX?=
 =?us-ascii?Q?a9+LOVHUeVL7vXUcZF8q20BXQqx5OPOHv7foCtLU1sODvkbrKF4h+xCBl1wO?=
 =?us-ascii?Q?IPr3goPYZaV0rt6K7wnuvTNJARWYo3Vwk6lEOq+WpIXt931ajaDjLVRqhT8Y?=
 =?us-ascii?Q?tG2xrnvIX1v+g5o9SzIFwY9atqYkxg8AdrqZ9NUc5xO0MQOIL+c3GUww2h95?=
 =?us-ascii?Q?IOlEba3e5EjuKldb8ZcmxuxChVjvo5OHjQtKqg05spGJdWZvr+pMTDHvjY5f?=
 =?us-ascii?Q?sK7sEiiTdfjtaceeGIQ/oU7NiI5eSn6X87FuY10z90JYRAxE7E/PPMWmTsbn?=
 =?us-ascii?Q?kTNP73ozWp6zdUInSqVIStS1iv3KGKxcp4MqnRvPffZ1FF8B5xJPpyYv9R8k?=
 =?us-ascii?Q?OZ+VH7RR06smycKyNAiLv8uuxq8v4u1j7KXl0PNIu7FEgPq8j2dutxP8PrHe?=
 =?us-ascii?Q?rlwPPbZ4kR5eian3DrBZDFu+VaMpsQWUPHHyNb9Vd4pph91H1JMfALaRJbVK?=
 =?us-ascii?Q?oTjI4Yl53jb5xXvPdcPIBIM8/PXrlpXeVKJOojSQakvLxFut0Cuw/2ql/ZJj?=
 =?us-ascii?Q?pTapvFpgz2cfsdYszuZJmoBN97UIiUcZUKss6q5+TFRvaK50V0Dh10E+FR3E?=
 =?us-ascii?Q?iYe73IFcJoAVdVepMeyOS9Gh9COe8IMEgHQbzmsDRsC7oRSfm6HhbPt0bB+Q?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 616f6354-1422-406e-3e72-08db02c52264
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:11.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQzoPr/b7Ux7IFU5WzfYk1XDzs9GNnwuurK2RPXlKAxUF8eaAZRLEW/W84AUCvF9xNsDSrLNMpoh4uezoFRYgCm7Jd5HAjQL6Hc8P9w//ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0885
Received-SPF: pass client-ip=2a01:111:f400:fe0d::730;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 48 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index cea7c036f0..89650fcfd4 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -910,12 +910,27 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
+static bool
+igb_rx_is_oversized(IGBCore *core, uint16_t qn, size_t size)
+{
+    uint16_t pool = qn % IGB_MAX_VM_POOLS;
+    bool lpe = !!(core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE);
+    int maximum_ethernet_lpe_size =
+        core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK;
+    int maximum_ethernet_vlan_size = 1522;
+
+    return (size > maximum_ethernet_lpe_size ||
+        (size > maximum_ethernet_vlan_size && !lpe));
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
@@ -941,7 +956,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
 
     if (core->mac[MRQC] & 1) {
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
-            for (i = 0; i < 8; i++) {
+            for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
                     queues |= BIT(i);
                 }
@@ -975,7 +990,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                 f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
                 f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
                 if (macp[f >> 5] & (1 << (f & 0x1f))) {
-                    for (i = 0; i < 8; i++) {
+                    for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
                         if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
                             queues |= BIT(i);
                         }
@@ -998,7 +1013,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
                     }
                 }
             } else {
-                for (i = 0; i < 8; i++) {
+                for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
                     if (core->mac[VMOLR0 + i] & E1000_VMOLR_AUPE) {
                         mask |= BIT(i);
                     }
@@ -1015,9 +1030,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         }
 
         queues &= core->mac[VFRE];
-        igb_rss_parse_packet(core, core->rx_pkt, external_tx != NULL, rss_info);
-        if (rss_info->queue & 1) {
-            queues <<= 8;
+        if (queues) {
+            for (i = 0; i < IGB_MAX_VM_POOLS; i++) {
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
@@ -1561,7 +1593,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


