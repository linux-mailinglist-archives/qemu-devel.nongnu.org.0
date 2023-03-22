Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73076C465D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peuki-0007Ms-0A; Wed, 22 Mar 2023 05:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukf-0007M8-MG
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:25 -0400
Received: from mail-vi1eur05on2072b.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72b]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukY-0003Dm-Fd
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmEjAuYHZL1X4scqJxSHxTXpMvvCOMX7LCFtcWVQqfpCAwx8oqlCqXkk4f/XlJVxbWz2I2r6d8p2RDBnMfOAUSfksLL5m/0GOIfYzi7G+OypRLKvNnYw9gQe6EMvV1D0gDQAVf3NrsIf/S91AZ+FE6b2lYrHR53sC9DKHtSMU2uJvJELGQkS/NAapul9TqRTnSxZNeU4XjfV1pDo/lnWyNl9bYAtHBqKnvvNAOhw/TLwp90b7w/skfAUkxucklJc6ktpU+4xr3C5U24uKomY+LkG5c2w3efRydQgZiyKzeoTxoT2vbpMUj5IctlDXm4dD8Oz+3TkIY+Qt6MfgNQFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fgyQNUdoJC9WMpc8q95LxvwbYTb1xbeoxApQaQk7WE=;
 b=b+s4QM6x3fDUuJ/kjJmuVz5p9ImPPKwlfc5ZJBk+yvVAS0esoOzx4UdR7ucH8Lh78dUQHMdYEfXnG/+A4U7kIXJmFMmM7s1IFQtspxzOC/81qQtohSBbGWfwJm2qPUDzh7qw8dHZ8xFNxsx98/JdVswZxRrzPVO+8owpcqE+tpO8+c3uaF1hbloRunZIN8z4Vy/0J4K1xCwSSLXCtBjwJr1Z3eAdFFZhPuBFOWAzYGEzZbVb9Fgz7QPZtnvaMcwzG3r65uJJC/ykj0L4GteSqBLhHqqj1LSsYqK+67xsS+yZa4nkdMUp44IAwp/+PaAnmCokV2QCTXiCxxaXerc2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fgyQNUdoJC9WMpc8q95LxvwbYTb1xbeoxApQaQk7WE=;
 b=Ii17QWW0VhvD4oCBHSf3r2/+R0jzzGS+Dw064QKQl4C96JiYUhrxVRSkiu5T/fimLwPPe8ZgE21nlAf/qPfrKfWH5bMkdrG2otFK/sZXBpqyLOvNT5fyrww6f+6xNdyyB23mcZhFQiruErS44YqBeq/qCBo815e1j5KaklwwYBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 5/8] igb: check oversized packets for VMDq
Date: Wed, 22 Mar 2023 10:27:01 +0100
Message-Id: <20230322092704.22776-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0147.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::20) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dae886-4ef5-4aa9-b758-08db2ab79da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tk1NYo14nzFeI1ztuK9/j5MQQWSxRCqTNFjzDfu+I+eqsTfC2lXu+ASLRKOWJmTubZTmAcJO62XQPHxJm0JEVT3XfS94ZR3hJmUkkzr5dfLo9sBYWBo7RAFhVMJ4Fw9xYkR54eBsjeALTHCCien8W7fJdwLY69ZH7PFqRYAW6WpZQZfTIdhIfi89p8Tl9521Ui2J7iW9TuMMQIfUtm1uRW0i1V0CFK6MQDRHOdk7U43qI8Z0ha7K45kS/hl6clD3ryI8pKJfOou0EX8taxyVK7QIQSERbAJtqdN2ozZKwwqpLULuWoGA14Nk7r6yYm93RrR1BbhG74SR3UNp4KJ+OrjSEzjZNQ7q+SWIoorCV6YD/+CpI7CiZzVAOIa9p/k101boZ9pbvieyDjL2jcoY/MhtgViylSqZ7OmmOgnF0QKh8VLSIlZGf7qgMnvN286NxihqQ1tXkRjy3CIHBJuyGLBmYw0XgIL7u5I94/TZHEq650okjGIuagz5xJegmqgwV1PCRVSofc9oanrsrCXMh+cx4GvX6uRK7ZK4WWsYIFDY/EWMI5ViGIwoZMrgjZxHOXMjSLyNAQesy2zl91YtPk69MuEjUPdFQ1sdSekso1lhHuX3nc8cF23jAxvokK9qhhde7tGX1LouFk2Qe0dQD7bw6mQ36lzWYzjUMSM5/eS6e7iYNvEfl0IT+UXWUMqWPU6bvYjydg5gmvxF77mm09wINFQFrfV+jYPl4JQi3LY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQNViTV+a8EwBXZ6dJPl3acg+bBMrnaeU9Pkw+omIosxhHSY79gjxvmgaiuG?=
 =?us-ascii?Q?wpvemtBwfz48Qa42WJfbVsq2IdmdP76b9qZVQ1Gtdc5BaflXoCnlwjIHzkVL?=
 =?us-ascii?Q?SbbldZwmP8Qh7LS9SwIOMJRZ5MNSqebu6dTwCK7QwsiwBwEs+4aIXI8NXXzh?=
 =?us-ascii?Q?eeRK5gTGm/cmRIz4hWzqdOeWgdAdy8jHxJnEjAa3rg8P+S9ZfC0pmvofBRPp?=
 =?us-ascii?Q?8aO2bgTfKAwF2RMGWZ2s32gTv1YgqX7ErCY8QP3O8cj8b5nyLzFD3Vlow7Yn?=
 =?us-ascii?Q?BRcWIzLtPQszJYGDSXIJMnO+/E9d2BZwOZqI0Fx1bs44ACqAMyuQRbO3Wb+E?=
 =?us-ascii?Q?NaQweh/xdmcu7fu8TtcZJJ1PALXkpEyeQOrZ5WAiHxoCxwDy4/lodoSrbPAw?=
 =?us-ascii?Q?ui7bKjS/AAl27HQMQjS1uomlb5JwYW8BkS9H1rWrAfu3CL2uo9/gSKOWRx8k?=
 =?us-ascii?Q?kC7/1Co9qVqhxmYCnYgFHeNIYNTzi98o9WmUTs2TU5BsHV3ApklhAsMI9fOc?=
 =?us-ascii?Q?DNdpg4bnHixcUY/IuXNnSMtIFiFpeq0p8JLE1Pvn060uEqfvx6K/72gMqSyl?=
 =?us-ascii?Q?jzS6afaCabIrZf4FzGdDv3eflx4+29VXPW4aNCr0DkJzxfEI7ZsoRTSPfWpL?=
 =?us-ascii?Q?hEa/9/3xbIrucMvgjRsPU+27RaQX+xXubfIqXQR/365W8ZDutvDJutUeY9r0?=
 =?us-ascii?Q?N7i4G89AuSlp4RB1w7gbvgx8r8KFF14kro3/eaxXaP9R6pZ3b7tKl7wUtTKK?=
 =?us-ascii?Q?Oiq05HMqNo2QmeuC4bti+H7H6xgUflEB6N51Qtm9IH5623Ril9ZjARWnC7Ov?=
 =?us-ascii?Q?CqHCQz6SCBewoyrb2GQkS1l9hBD4Znp7OYTlQn/mhswc0JFZexBCyFAyr4BG?=
 =?us-ascii?Q?hxZvTbVW+fk+ts9ihqrRshr/bek0AXsVUKgHvGqmcZGElbTuJAKC5Sr74BXR?=
 =?us-ascii?Q?wrov2+dlj/rzbm0wV0eZRgng62fjLuLgLY34VZO8C6Kp5BD3gSgRkCsnenZ0?=
 =?us-ascii?Q?opfhxChhMyJn+YEGpSAzeKDOSkImqYKMsG4J4eigg1EjoiSyvbo3FqoW+vfc?=
 =?us-ascii?Q?+A1D5AW0mWFhLaK1brp+FjIfP7zO8ipsR78tsbaasddQj2Rubtm3DDZMvyaS?=
 =?us-ascii?Q?jgWFau0AQ46XC19K5+W+CCHiKYmr0JcfpC31Kei9xtaQ6rbqd66SkCkblJRT?=
 =?us-ascii?Q?Mvm20RNmJYUzXwmxXL92c4ohhPuPw0qzWh7ttdbmjEYI0xCnDxHzyftALQmk?=
 =?us-ascii?Q?LX09TSS6SRwys26iC6sXUcBTGa9b3oKPISuQcRK/Y/S63SEOGa2/WKBAK1Vm?=
 =?us-ascii?Q?IY89RGtatVIayAakcLVKW238Swlt1M4WL9n9Q99Iz2CALixUmauSVB9eAGn0?=
 =?us-ascii?Q?oUg1TBz9R9LTjnApJAXvaRiRoDesCU8Kfh/jq8oKCZo+3wMdwgXIc0BQUYks?=
 =?us-ascii?Q?AdT1v/iLJ569DeAxNufdIcfb5l7TBm+FOD2vTPTfpowuTisumZM7KtIcXknv?=
 =?us-ascii?Q?Jatb37XAwJikr37OK1ijfsVSSx5gYuPev4rotE2znYjKklus/vmN49CqGfjM?=
 =?us-ascii?Q?UueJ/9IkPYWR2mdPt1GjYP/UjkaMY+VFV8v/SgE5aNuhjP8GQCrDkAMBUhgr?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dae886-4ef5-4aa9-b758-08db2ab79da9
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:11.6833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsEaVktci1hOC8PNoHFtfdaG/glHnwDkTj4NgtS38FAv2gPPiBqz57uY//L6PcIrHcbvUG2M3AFvIq+4CUgccIKTSJKcmWFD1k4whCcrSfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:7d00::72b;
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
index 7c8f665f07..1de24ffde2 100644
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


