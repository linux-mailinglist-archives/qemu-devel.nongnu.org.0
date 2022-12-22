Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAEA654356
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8MpH-0008He-Mh; Thu, 22 Dec 2022 09:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jyh-0008UK-2y
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:11 -0500
Received: from mail-he1eur01on2093.outbound.protection.outlook.com
 ([40.107.13.93] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jyf-0007l2-99
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1qcHBZ0dWAIwFiskEHnbSZW/VOEzfLWgoauZOY3GXPFfJWf4JvQj3OOp94cL/aNNaY85k2/IzjKQyxlfxBzhcpQxlh9GIMcC8FY3Ep2iVyPN9zjwaQGFWF6phD/0k1qAhLgCjwlMHqs6erUUUxwZhI4N6Y+rj/Rnx/fC6IoLpJVU1kfaOE0ZqXy8BCYbidMfTnAqi4jPyM+aH9giRH2RnH7ollLxf3p99eiUt9ve5gYHROF7FLPuNZoviNlbauuoR4yHpmcklz97PGYovTP+KH9Vc2Waw0/20QmirRRJC0TZl9ebFRRto+73ptOEiYsjLi2g1breYdDOADm7r6QTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqcTWvHyLYRl57rMJtS0bOUtzDmy3Og6pnT5xSZWFic=;
 b=BHGAbEvMz9YKe5DAsUm1/JA4wSqM/1W8v4fj6GnBtjllOqv6iaFJ279MVXFue0dzFk486Zs7tQUBByzL0qXLDM3tkzkcOVNFJIgXjXfXDa9Rm38Grk+9cMfp0mXJ8yoNH0vr4dQ0WuxJ2Rlue9IhyKU8jqqNIKLC3bnWCX5gGkIKaJ0DWY7hmqOQydsQ8+Z9uepb/kRgRKx5sduAq3fsHIXHJppCPoI+H/bbO4mOoXDnEtWMHm+YCF9hSaMxo8uO5HSAIm46Vp0v6a5ONwiEVPi/PUWeiCjFKK1N5WygSkUZcSxTwd8dbknmlTSk5u3U+ui1eBGMDoJSctpm4/o9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqcTWvHyLYRl57rMJtS0bOUtzDmy3Og6pnT5xSZWFic=;
 b=CgxQFKwO0X3TfxvmlkHEBVKaxSWKZBnvlAGMDj03fBQoeFOZ8Gh/xMVk7aEU3VeouunUfUl25vscyZSzIcXaw44DTKRmzGVan6IRVKFY87daE/Y0Drm12KqorMjTa5nLpCV7j+i+xBRsSBGyrq4IvXh6WXNG3pi8Qpdxx6Q1Mog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS2P189MB2317.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.11; Thu, 22 Dec
 2022 11:43:05 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5944.006; Thu, 22 Dec 2022
 11:43:05 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 2/5] hw/net/net_tx_pkt: helper function to get l2 hdr
Date: Thu, 22 Dec 2022 12:41:17 +0100
Message-Id: <20221222114120.8790-3-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000000EC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:12) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS2P189MB2317:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fe16b4-9a07-4a7c-266c-08dae411b047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFguhB74ntUY+UCpGtnWIGk53C27pwaqrN0YCHx+VXVpOoPeraUxfpkHfXwAGif9vV3mEIxqABzXI+0VgYShmIguzB4YX7Eakzw1iqIjvsDLsMezg/2CgCU5EC2l42pVm4nHmmyrZap87eeNan7zWsedl4ygcOJDBrgDelEGqLtX018kSxnBaV+awTd1IIMkdh46RMLrQKQU/BU5p2op9+3wZu5yv0JKDwUEzWuntIQbYGkdZF4xTmOc7A4KFkKUGd0pM848OBYP9dBGWZ8UA8q3hZcQKhJpU3660xpZBxiom/is/KaEGRDiU2bqgXKIB7QHxBvev65+gdZ4/RY5q5d8YDJzt7nRNG61ByGkQ8SySk264Prd3xI12C8p0FFSE5oe4o0RrjkqryzD4pb4dB5fCk02Sd1yNpl5NRuvmbDEtbTFECd9ItxG0VJe2nq6eVaASe1QVUDEBi+FDzqOXhEE+JAehfHRVyuLapC/4IpReri83FLFbczHXvsqKauCFp3WjkkNgLjch0nbX++oVHKjznPke/GEAddBz4BlL9S9ra19F21A0ST+bcERuCpo28A4wErfZAv4NmO4T8ZZMYggeqQqWWFZ+SMjXgoy1IZlBcHL9lRwFBUVQXEKP9s0u8N2CeTHgJw2O/FE4U2in2LcgmHqnt7Yle1HhQJbLJdP81y4FkkGIE7m3PUlW8a7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(39830400003)(136003)(451199015)(83380400001)(86362001)(1076003)(2906002)(44832011)(38100700002)(41300700001)(8936002)(5660300002)(66946007)(478600001)(6666004)(6506007)(6486002)(2616005)(26005)(186003)(6512007)(4326008)(70586007)(66476007)(8676002)(316002)(66556008)(110136005)(36756003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gyk5T0fCpoP16KeCXFmgbdRj5KrA8B3fFSv9g5/TD7NbNRtTpljtLm1DXSwx?=
 =?us-ascii?Q?3/xuwMD2Boc11JYAJfrGI5lkDzd5ia/KnEkGydgpB+k5I/vKu4UpbhpvOR/v?=
 =?us-ascii?Q?+3a9SiZ1muQJExZPH9rrozkLTAF/blS056ifvn64CZXdoH+DQaRARDuRXeTp?=
 =?us-ascii?Q?F2p5TEK4hOdqeiXSaqQY8pXHIZv/QKUqa2WJyFwNmSCtxCBXZDTulT0KeWQn?=
 =?us-ascii?Q?IMdcRP+UTOsj8f6WuCr8jPuYE3bf16ScpEcgVAZnZhfmb0MREkb+dp7iY9pA?=
 =?us-ascii?Q?M4t73UDdRmKg5kY+xGxNhNgdqHpMp8qX0ywP9G6YhwOZ0ClB8shDjBCmDSB2?=
 =?us-ascii?Q?S5xGVxGq7RBGXErt/XsTtDbnOhlaIUPP1dqgSsNPOXwqQXMqlm7JAeqp6AjG?=
 =?us-ascii?Q?imVnWh4YbtToESpxun+KyhxEc0nzvHsnaiukkqEVNku9qJVqSK84KvlC5s+o?=
 =?us-ascii?Q?Q8ihIgm8I42QEV7kqvjS3CQQDuXa4mcg8wasNd3F4gtDUfePi8qg+4sbc5NX?=
 =?us-ascii?Q?2UtmAF7R8ZaiWlIp3SzAZGHFWMfynjsO/xTQvyv+mo64R7ZvE0G/fLf06y+l?=
 =?us-ascii?Q?JsVuFrz3x+8JbwJVrJRMgaTMbgaw7J09NkPoLMljejFK4FS9k3SFODyatvCG?=
 =?us-ascii?Q?4/jLTynl1nVOcxN/FX2JAh0qBX3DDm0gvGS6QOnTrBPm2op4HTr9YBzL1ZcN?=
 =?us-ascii?Q?GJ0NcI6JXby3BcA6BysppCWtJmOm8pVM8xYixQPw9ZzMCsMDR+cHTRtKNpTC?=
 =?us-ascii?Q?boijGf6/wFzuuvcuubMSPrXw5nbTbuRqxzY9I14nvgohGQ4iZjnw0zvDEaSg?=
 =?us-ascii?Q?DoQ3c+GK5GUswIUuWkYRlr2fjotcAjvwzqU5PG9C3EBX67oW6B9lpK3UNDFg?=
 =?us-ascii?Q?uO1uTWEMIY+LRnSBM8EDWLfsJ1VGzoLq/7i0H53/Ay2/j3Z4uUhNgXIPAf6U?=
 =?us-ascii?Q?m/nkAjDdWMhbWvoIejDr054ncPPjWvTKQjivoqpqjpms4fB2w/NhoxptjH0K?=
 =?us-ascii?Q?lMxgoGWOYqgaOPLA9tS7RS+0btSZkkE+Sh0sMqSbkh14hTHT3yvDXUWz5SKh?=
 =?us-ascii?Q?xOwKJYrmcQdzujx0Ac53e0q4jWyHUP0aS1j2QTkwuWlqOvJLqq2e0xi5XfCj?=
 =?us-ascii?Q?C5dqL1k8+2NEBGIxoZ6+Y6oc/kQpvOfgmRz+G6w71KMf9JziTBKei6l9b1dY?=
 =?us-ascii?Q?4jglyLd1cGqP9YmBrwo3emHV+GoQ/z3NXosqQJlZBIMufXG6eP3NYJvxXj8n?=
 =?us-ascii?Q?aAvDvidTS0atTAY9a5FPqyl9QXr0Z7sfalKj+hsjFKz6RAQDbFxfWgesiRX7?=
 =?us-ascii?Q?pJe0OrtozQGL6a3KsivVAHhLqF7DWZDzwI5dZkb1NPEP18e+/NdAD+EHsnQ8?=
 =?us-ascii?Q?p8LW6eLkp27USqtQFEK0FlIaITb+2UmAd/RLrXBDiPdnRveXyRsxbX1Ry0Qj?=
 =?us-ascii?Q?kH2awBS5Hfo0h/QfYAFYp7q3xYKgGTX6WgIOk1UrSxwUx6wsyoT3PpRpaF6V?=
 =?us-ascii?Q?sZY1mZNk/NB0KN0NxzQDPFxwG63CsW4nc2NCgzxI8hRbKTr0Vf+GE+GjU1bE?=
 =?us-ascii?Q?QVD+zUguMHNQoYeRBBbXH5VstbYh7FI3pEU/G8q7TF6mPbnO4rnZDgGnVQYY?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fe16b4-9a07-4a7c-266c-08dae411b047
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:43:05.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHTrr4xe4Nt+fZ3rfsoWhM45mQBuqBxruzYi61koy5hhExkomrSq4IjqcFViqM9aWbp8X1GXzkGR1sjJnpfKSZ25vVK8+FKTvj7QjZWwpZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2317
Received-SPF: pass client-ip=40.107.13.93;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 09:45:07 -0500
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

Also add return value for to send functions

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/net_tx_pkt.c | 17 +++++++++++------
 hw/net/net_tx_pkt.h |  8 ++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 1cb1125d9f..f2e14008b6 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -284,6 +284,12 @@ struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt)
     return &pkt->virt_hdr;
 }
 
+struct eth_header *net_tx_pkt_get_l2hdr(struct NetTxPkt *pkt)
+{
+    assert(pkt);
+    return PKT_GET_ETH_HDR(&pkt->l2_hdr);
+}
+
 static uint8_t net_tx_pkt_get_gso_type(struct NetTxPkt *pkt,
                                           bool tso_enable)
 {
@@ -551,13 +557,13 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     return fetched;
 }
 
-static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
+static inline ssize_t net_tx_pkt_sendv(struct NetTxPkt *pkt,
     NetClientState *nc, const struct iovec *iov, int iov_cnt)
 {
     if (pkt->is_loopback) {
-        qemu_receive_packet_iov(nc, iov, iov_cnt);
+        return qemu_receive_packet_iov(nc, iov, iov_cnt);
     } else {
-        qemu_sendv_packet(nc, iov, iov_cnt);
+        return qemu_sendv_packet(nc, iov, iov_cnt);
     }
 }
 
@@ -632,9 +638,8 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
     if (pkt->has_virt_hdr ||
         pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
-        return true;
+        return (net_tx_pkt_sendv(pkt, nc, pkt->vec,
+            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG) >= 0);
     }
 
     return net_tx_pkt_do_sw_fragmentation(pkt, nc);
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 4ec8bbe9bd..64fae67c58 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -52,6 +52,14 @@ void net_tx_pkt_uninit(struct NetTxPkt *pkt);
  */
 struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt);
 
+/**
+ * get L2 header
+ *
+ * @pkt:            packet
+ * @ret:            L2 header
+ */
+struct eth_header *net_tx_pkt_get_l2hdr(struct NetTxPkt *pkt);
+
 /**
  * build virtio header (will be stored in module context)
  *
-- 
2.34.1


