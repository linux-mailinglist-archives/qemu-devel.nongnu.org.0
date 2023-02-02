Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47398687842
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYO-0003c9-3w; Thu, 02 Feb 2023 04:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXp-0003ZI-Vm
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:14 -0500
Received: from mail-db3eur04on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::721]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXo-00065l-9R
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL8Ltlz5L9W6aG1aSc/0rearc/Wo/607mmiBmbQUoLgzu20dWlXUUBde3l6CWbCSz/HL4egAmUc1Ati48l0wHNBXp6ZyloYcXHCgAX9pC9UAOXlWE7iOY0PyYLeat9zIevB1YgpYlqoV5ApwpNPG32zFLR9CsLQJNcd7/0yNoYdA6X21YWnuRjgZQ9fLN58OPTR3aOKW2SXpGf3kaJ2lWkg4cvQT9mT8U1bkWk8ETHkZY/0tVXiQXjq1+D9Jx0Ujpib7I3fxt4pxpwQ1W3/mqRN0Ig7Vqwu3Tt77EiBNNp8Qtua9nojjbxhWlVsuwdviVVVV9GGOmXkUOkmXj4mHTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eipKV4Q1GV/6hefNbqtuBZSer8XvXynLk4NXv8GR/a0=;
 b=VufjDiFBN5s4IhmDb7u75+85L8b/AGvRQS3T8HPaJ6qZHvTzQ8KGvF4Ve0b1mX8XUv5LzzqLC7JJ8v+Q4/ShFMAg3tZ/NIdbvVKQ0ICoI72hyEoyMgbctvZ8Y2tP3m9Dh+HVnD9CpYBxyDQxdybUAKY3v+AtwWY8iTKIO2dDc88d9vfzTeMYP1WbaxE5kG3Jo7a+Kv521vEipTXSUBYzdCkwucoaifHU6Hb7m7lFZnffiaWOjn9Y9UG4fGdI7LOG6txr203fFtj1sDfKbfKPJZDiwFvjktJ/FX9V7EoxIkDFBBZLd/7w3QK67BgXjvT5fIKKy2dGb0gc5lZRSbKdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eipKV4Q1GV/6hefNbqtuBZSer8XvXynLk4NXv8GR/a0=;
 b=KICMcodIxnhDRp/7ZdrPEy5WHlucgVt0dE0T/VRMUQ/UkAhr0ASpk21qNfkxQiWLVyq2V10HVPho2kbbndZYIuwMDGjpgGujuQ3s9QBekllY+K8iNTSc3zvpDuOduEVuQ0aE/oyn/U2UM6ExH0sA5E/2QLAYqRN2dtgpKEKdouw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:58 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:58 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 5/8] igb: check oversized packets for VMDq
Date: Thu,  2 Feb 2023 08:52:54 +0100
Message-Id: <20230202075257.16033-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::8) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dabcfc0-540d-48b3-4bda-08db04fcb290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRIE4meRE+C04afu+OerIOX1jcgVDrphujzdubO7o/BzIrG8Mbs+zegja5MOy+6EFoZSOwyzOB71p/65hOhlxToO282vo1bmWcBKynImELPavWdVX3ot6HZhfVsEtI45NEq8Dbf4NSMIpiAJhhheV3XePq8y6e1H1xaVq8eZNfXv84bazexgnjpcNJGF5WaT2TrdfyeVaGTJvxuO2RI7P8Z6VKGQsxIZpilN7wwQ6cUmrkwUkmZrLbzPGP6zVt5Ksywj8wpS7Kl5X9OLvGtmtn7ngWPngbZkv7g5rOKOv7QaLFFwLP0bxtrPXrGpIT3PuVsoeSIJ1c5hJY/kF38oiZeHEuyg2YkQGH5BKyganKSN53M3uhuhsLtD0CITTgkqw6ZC6XDkXq4sbg7MrjgQLdS0HuM8Ao7zhxb6reVuVBZzZn+nc32CV8uvEF0zXjwAT0hZWp6zdXN/Kgi6cr6dxgz/Ijmc3vB80g9pXQ8iCHr1rbUY3TfH4KR8jHTOoGKuipOt2m+wd4T1q8ttbLql+E9D/5e2ZCqYlGkxaOOPwOTsxu7ET3bl/uxA+O+zkZnO4+AhM4P/mkZJM8cozO5Q5AE5GDx9AQVoMGPk1NPHXHOxsde2UduIeIrfjYX29ViXmCVle9W5xJ+Msx+DJR0Tu0MUYZNrK2TKEfqErZnb8uV+hxVUnTI+ltccpwXvyt5bn6cLQdORd4f77pSb8uYAxPZVTjvORezWw5y5Ty4pmhM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+wbQcTQRbXCun33vTBQ/7pjD6vy7N3+2pjok7uXe2Jwb8fB2d2gY7iS6BGN9?=
 =?us-ascii?Q?Vrv3GRjQ1x1frbRzmm2NWrctO8CL7953rp94LUy4T9TMglEBlBtSC+aAtkb+?=
 =?us-ascii?Q?Bd8Q+q9UxeSBgOntxS8Fp42KiVoZizxmdK8r6MpGjniw46SvAG7mp4+PeZUk?=
 =?us-ascii?Q?f0UXWQJUTXyUHQLFPoiY+2h90fCELAesPIOuOuBlsc1wdmhX5lei5V6fw+Gj?=
 =?us-ascii?Q?2An20fWWyn4fnv53OgwEr4OROKDhNP6qL1imYRRqku8ccDRHRnJdnvbeJT7g?=
 =?us-ascii?Q?8hu9iHiLuFJzBLfOYiIIf9vbAHqzvDtI6//K7et/mYUAe9zCOC/FkXV0/tNo?=
 =?us-ascii?Q?q3gdvJr2OlaEmiQ+SmSCip7O5n7BGos1KxGm++F6IoVOoLoiQ8rE440XO3qZ?=
 =?us-ascii?Q?gC2xOemoznQgBvV+637+zrXKcqCmq4s0ZUVorFfvHNyRB+1RFCLiPk+5pDtQ?=
 =?us-ascii?Q?UCtVi5RZc3TBkVltU4j6lu1Qr6IccRJBXv1OOyPD6tAEgzwe+38oFNf672zu?=
 =?us-ascii?Q?2t46mdmW0VSHK6iCJ++Pf1RRt3kAa2Wjczze91q5u6eojxZpKPrCdBTsZzx2?=
 =?us-ascii?Q?K4wxEkFYxtJOmPGDA2eAY1P9tcKw83m013+yTFJmaa0pXsuQzjor/tU7egOp?=
 =?us-ascii?Q?pp+7pDe3RKHoVemFo8nyGPf+E8s7E6Zxff6PrrsRllZVKVP4ILeMIJkTCXGe?=
 =?us-ascii?Q?aCwAlfiNixj1Dh8nKY1fKHhjTRWjv3nAdqYoU87nQSXebFBhrlhCQ2CaocZt?=
 =?us-ascii?Q?v7+ZiNIaI7QBP43PuhNCGruZkqFH6ybDgqhe3R8AU7CgR9gNgMuK6u/u7ujO?=
 =?us-ascii?Q?4Jm2kGW2v8hWO4B4/NcTFD5nP+LLOIRgFwjtaN7G2nkXG1RpPq3Bw/LogkD4?=
 =?us-ascii?Q?c2bcp+OYQXw/+8cZWBJ9igHhn7LjXz6ZxqmBAW45KLenioUt2dmCobHi/cbI?=
 =?us-ascii?Q?EGb4H9uXjMuMQbRrlXjpA+JSZcRYXw2UrSuyEwz5ZpLruhBTs+/T+gLAnXiZ?=
 =?us-ascii?Q?F0GrNWJAs4RcSs5joL8j+3tfdhQfFIoF8b/FxUSEGdSacE8cOdkdttg21kER?=
 =?us-ascii?Q?RZcldUtYED2V1aBZ/Spl5sIlxlwNzwuGf3kvVZtdUpYsriqMYP5uIQdPlsU+?=
 =?us-ascii?Q?kH1fSVWMQC9byUfyGtmCTr0/GBGE3/JTk/8NFBUKkP7Y78hPh/G2oT6nt43M?=
 =?us-ascii?Q?zo1whxVGGoJW/YxP7TNxRqpJ3F8NUcFJ9IJ/bLjpgjKwGEwuQ4qkkwiAJw9W?=
 =?us-ascii?Q?CXCBWuU2cfGpBSulubbFXo1dRvbS6KOzSainotBtWgoWSKA37tXlp642JXJk?=
 =?us-ascii?Q?Iza2PxJQExXaKZS28CgDYUxymTpceKh3/INdmtpMefW1w8Iy/gg7X3FoZyIv?=
 =?us-ascii?Q?pIV0KuOYkjFG4SzdFEGGBWqW4D5nWzGEjnWwXwN40YOcF27mILIRQc8+CS5U?=
 =?us-ascii?Q?X3Ufd8qomQ4dadrVI1KhKwjteR9OxeXebORQAK5+n2GaQoI91p+pH7wEdScV?=
 =?us-ascii?Q?xt8vmDRha5IRq92oRfMJ7SnNV6jOVYBs0RRHXWOLWnsg2qCQw2bgPusb7rL6?=
 =?us-ascii?Q?Mweko5tQqTWQaJ5KTNRFiCq45n82vX2gjn4HdTlhYYYtl8t3tSt7auC8Jsw9?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dabcfc0-540d-48b3-4bda-08db04fcb290
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:57.8065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XWBsjFyHoGfHIEmDjsl1av3PsF2wuiUnSCpfmgZuIVeyVMNxj9JRarKX4qAUrAfyZabb6oGUSxqJWp8UnZU4u86NONKskzbQkz1oFsgVtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::721;
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c4a2bff4c1..03139c76f7 100644
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


