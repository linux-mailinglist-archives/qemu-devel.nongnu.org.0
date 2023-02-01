Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C4F68653B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7W-0003jw-Fp; Wed, 01 Feb 2023 06:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7U-0003jb-3V
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:40 -0500
Received: from mail-vi1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::727]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7S-00059m-BC
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adYI1bRvFBsp7cY7MEl2nQkaDMaZyZWGFAIhXB23jIbKlkpmqsprXJdtHai4z7xYtjOu1/KCnZyX5aFw30qx1+GNiEb20qp2UzBBJvSzZbzqqWhZV0fZCBLeS2E2rDopEuwUfQcWp41QNCGFDFdK5ZX3eUDOGXn/WMzn1rSIU29UuMWJ5ZLJ9m9+wCFDuJsSfgGufX67+q/yDU86fXOGxk0uJk0QZelPxM5Kl9HgsGQiH4xbjePEKqvL5TIXU/GC5WlbhVJc4z5FMpWbvZZPPgQYRYw2wLJ6I1bwuq44t8xXtgmTglDHAeNzB51mPAftfHy71a7w/HaG5Xr43J9uSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AS8nMdlVCqEfr0RcTjZDx2EXp1R/N3UANAxZIKsuRw=;
 b=cMyhKeYbx3Bbv8EvbavcpiIU4Y/t7cl1hlTy/Y42B6/3v5/ehGyAxwLrcTfyttJzUzjjjq+gKBCtuKMrboOidkae6ggkQiuOwQwUrvafBaFNS3vGpAPge7pAnKcB0C4hZgWLJycS0llhVnEZzDbpK7Z/lKgBnWjzixxD/04Nkkvh+66koTirN7g0esmrT5tCI45NcpHS8aHe2wd3ggFQAZgqoNm/QqzK6M24NJRo9FVoKw5tJ7BZ3wQ1Guas1iU8H/cJF5i0wHigyrjeBhAXbVMB5iv6hG7hPNUZh+j1irwAIIVyobns8q77vM+A0wNF9xzktMOXMJpICkocaX9FSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AS8nMdlVCqEfr0RcTjZDx2EXp1R/N3UANAxZIKsuRw=;
 b=hTkN/s+/jn8/4ufC+njhuxZiKV6jlgkmX1e8LQsCu0KLYfCdJQBAPgYYVmmS1/Ji1/jI+i/toHV7V2oVPXev3vxWn8gjN0VMliFlA2nlD4jqRiyiGuQUSOd3y0iXPtZXRMVIejimUGpvtG+6gy5VW4X1XT1F9TuSod5m9WORK70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB5P189MB2551.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:26 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:26 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 5/9] igb: check oversized packets for VMDq
Date: Wed,  1 Feb 2023 12:17:18 +0100
Message-Id: <20230201111722.28748-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::29) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB5P189MB2551:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4b0d7a-c321-4f3f-f9b8-08db0445e577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvMZC3/Ob1rC17qmc7AB1JtMyjQ/LS9cRpnaaWvaVbx1lAFfVG/6NVMqopqLqBw+yRtb4PH3+Qu7qomDymQ4zYFktc7sJFhermNLlseDNCPShoaX7VWXtZMsNK7y71KWhH8GTD89H2iXyZfWpGisPjjxjwyXriXycg2IZIOU0F4nGXnXMtP4lHK84bgwDWvvPhYSvT/D++ocQEJKXGQ5panp/0i4n8fucSbxtD5Nck68WW/K6L9gFUhy7nRnjXNxlWUKSy2eC2e9l82SG9Wr/xVi6ioXt9Ocmi9bgPQYPisU8s3j23jffgUgPyTZ8p/4MVFJH0JVptPl+ELyFMemK6vmMUjHSP1NLr0t/07CWYlKkReMPK84VCgd8ISuOHizwwE5/axB68fzOzcy06xzh4RqO6EeRkC+ATptOpyJxrB3mdTC7wWSNoTNotdvNPegES6R5O7IUZjFnMnxNg06bU07UGIc+gk8II30qPJNcY817UzijIu6sL+YQd8rcwLW3FQyEyDbA+X4Fg4AT7CykjHM6mZBv2cNdY61UJh4kFBkNRxWKlkBx5G+nl2GhXuuR7WTczQcgRvfE/UWod+VvZbvth/ihTyfgxP08qKc9o84M21qlkxKNa9H9yR5Eg5BLEbZZOedlooBJVcmjoIZRe2WVme1kAIGZjuLNijcAsVAsCtrTAnLvJvII5JybwIxPRNxmkWIx6Mcq8JCXT8V9Ci712h5T/HoC72sUODkPHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(376002)(346002)(396003)(136003)(109986016)(451199018)(36756003)(2616005)(6666004)(6486002)(478600001)(2906002)(86362001)(38100700002)(8936002)(54906003)(1076003)(6506007)(66556008)(8676002)(5660300002)(316002)(41300700001)(44832011)(66476007)(66946007)(70586007)(4326008)(26005)(6512007)(186003)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ULDk8t5MTKNY5C+EtGx8yB+Cxy6V6qcCsRqbWAKujena3a8DhY2bzM41shfT?=
 =?us-ascii?Q?GAUpvE8er/JKw6jrEuGeUMPYRVyMXXhWGm0nUxW4Noe+Ryi3wJiYeLEx4hZx?=
 =?us-ascii?Q?2Q6sAAsMA55T2ygII6IAcQibuw8qfP8AymdEnURWqtRUtnfMQI4Ip62aUJuW?=
 =?us-ascii?Q?4kQ/uNPcoRuCrgQ5DGKLASpOjzGArS0vp3j+9ntYpDQ73itJxMLCWmvoR3z+?=
 =?us-ascii?Q?3Qw+YDakj9xMxVw9AtLytgV6imCZkRZsh2oKKLL/PZgvi2O4lFRwhxHBBopo?=
 =?us-ascii?Q?9L7RDDRHXHzC6SISzN5TdsSPR1eZ80L06exRY6QVbAU36+JwjKt4u6YgasuH?=
 =?us-ascii?Q?ci194zJK3LCBvgDkipG0ev29kASKrl7DPj0pmvG7BIUoP+dSV3K2WlHb+jc2?=
 =?us-ascii?Q?ncQRZc6DzIXuzc6QH3wZ5pT9m7JUUTiAs934toIZPLPzJUipZkSJqRzydESN?=
 =?us-ascii?Q?noja5oIFpzCpj6e7W99oRiot1wioIoDjjNRIeGTBBkvyZKHjYSH6CHrJR7je?=
 =?us-ascii?Q?vpvutvCbW4k2H99JgAbRsuglaHJ69INjepsIWnzxGaBeVaNj4CfOlOe709YJ?=
 =?us-ascii?Q?ULya7oVx582Iy6qZfQyAr7i6poQKnP8FJZN6LlC1+V+DnCxnM+hopc2PN+Oj?=
 =?us-ascii?Q?h1ck1//CtMBRatpQlAng8NiDnoqyPZKBFn+pJxLYEkqJGwZG0t4YPEiK+bi9?=
 =?us-ascii?Q?frwpCHD83vT0iRIjUANbraWDXGrOL+Yo2Osi6SPkR0+GGJCdmmK3Dapl1YQT?=
 =?us-ascii?Q?7VaXM3DPOwOTZVsb/toWPeALZ8Pfqypcu2PEJSa43pwrv50GSf+wfVacfHXI?=
 =?us-ascii?Q?huKfHLePNdffaidJS3ih/GBeGbSv0MVxeQ92o5vn1SQJsy0UECmwMeMhySOt?=
 =?us-ascii?Q?HtsOwx7hE0Fvqb0REbBdTxXDuTe7IWumM43WHyCossU3dn7ELR5t7pusWdxv?=
 =?us-ascii?Q?XROMAE2qGXJmLsqvCZoT7k0dUVD6vrdb9kAbo2w6rRpYahVdypodysCdLcsi?=
 =?us-ascii?Q?2s0qeUHU9fxijjMSCZZhtLgxWYoHFQZ4IYg5tDQx1rFbAo+w/AKar5W5neIB?=
 =?us-ascii?Q?DNX3ZHuKQxO7Dk1Ey4kHzctigHCxc+/Mk/9b3HYzyqG3MTG/PKDfHCZr2v/1?=
 =?us-ascii?Q?7jyeFNTuWsLhDWDz9/rQbtwrB3C0oZbrZjfq4K7TWI3PBMsxiqxzP34CR9Kv?=
 =?us-ascii?Q?YrpHYCSRd3RM55K/8/f3SMdr6M/9O/UTV8ctOGr1rMt//HD4P8MTls4kSObt?=
 =?us-ascii?Q?p05X+SFd+LQxY6ATSyTaUAM5JUA3qfnyqB5v0Jo6AyH7ZWn8+vA30EOHMFPH?=
 =?us-ascii?Q?/xGr5nWzW4iJuTJUMX4riS6BZ2wOd/vDS7SHIl8z3tmcqVISe7U0+HMZiWFw?=
 =?us-ascii?Q?hkRAAIdl23nU61sadrXzdre37HxSMwdGYg7lObQ53032Yu+cztUtXp0Ka5ad?=
 =?us-ascii?Q?IbNJ2BCfd3z1UquNdcnvXVpB6umdDMfwEiXuGuaR+eIzqEJ3VrRm8vLddqGw?=
 =?us-ascii?Q?fWWpEvqG4nOQiwTxe7/V+2NJCk0fAXOgP6Pb6yBEEpCAmmQkVJKPHkcY9zpb?=
 =?us-ascii?Q?FQcWRNw98GIpazXvNTxYldj9QumZEk703shuk71NTYHFdCXrcqpJkzngEcex?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4b0d7a-c321-4f3f-f9b8-08db0445e577
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.3250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPk0xBGLoI0ybdTKu5lziUMMWms4bf9a++CX1N05/fK6pJs4meU/fG1UiAZciVc/LXeDcp6diGd35EA9OquViHOnLTk9WfqyHjr1mFosSJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P189MB2551
Received-SPF: pass client-ip=2a01:111:f400:fe0e::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
index c44b30b6d1..cda81a54bf 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -912,12 +912,26 @@ igb_rx_l4_cso_enabled(IGBCore *core)
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
@@ -1017,9 +1031,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
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
@@ -1562,7 +1593,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


