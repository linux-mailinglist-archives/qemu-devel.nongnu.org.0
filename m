Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987326C857A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmfi-0001W9-LN; Fri, 24 Mar 2023 15:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmff-0001Tg-1N
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:01:52 -0400
Received: from mail-he1eur01on0726.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::726]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmfc-00034J-VV
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:01:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3cyKPMj2PTNk0o9PN5D4Q0ZNOKTEwRPKMKKpV/FLJ0DdCk6ANBne3qOb8k0GtstIVJxt21YADvCdyk2/1XOBq+mJeukrgMOo+SQxXFp0qDwNz37B4OAgU6c5KAPH2sVLfZYCW3cnrDk3MtJLb1gCYKGYDoNCurwV33+OqOB94CfRRKp5aKrSR8/Yar3ckU4lED1BsInM9JjAlaQq350rNSKgAsy40IK0wooRwnbQL7Eb60pSqdv2nFcVeMHWYCWPJAKrL/WRhNoVH/fidnaTQJZ46rcq7JxOPNI62NKe6jqgYkiqLk72RzbHbBeHDsp02t5Y+xBk82c52N1OtJDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npij/M0YiYbD/I4U8XgJdMzejWTRN6wiqD7L+2mvBx0=;
 b=oB1EPJUskn3tPZbrHHHO4Ngg0HPI6LaMMzAM3GXaQAc1tnAxooIMt6BAbVicG0fgDoEFzRaVIm9Q0WnKPeWNn6w1V7BTcxMXINIt9Ywz8DMtWYhGNbdPMfodWtORv/L6PTPiMgII2xvoVncQ7Yfb0rA2roL/KxLvdtCR5KsGOmlyNgpDcgkWHwS6qhTHoJI9jv81npo1OrsTY9dzCAVteyEyAB6DgdBGVNv4onSKVbIZ0K574KF7BF/e5ODcHeHu+tRNdSf30ktAoiAdVh95Uc8Yr8RND2eC7jqpnXMqUg64vXXsDaeYcCK4XsJg3T1LA4KKvgFzseOmOtcdt0XDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npij/M0YiYbD/I4U8XgJdMzejWTRN6wiqD7L+2mvBx0=;
 b=bySyEgwErmDOnsCDCnbAtuM+dK0b0rrUYDcHH8fx6mXV77M7VfDqkRSA5RtDukIkM58xohLXaKW+XY/gi7iZPKKhMs5l0R+OKKhAAKK+OnX/TFcJeGzITM6vIWPDDByIag80E1fcSau1nqE0Gxp7TusU0LmUNl3IrcD0r8yXnMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 19:01:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 19:01:11 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 5/8] igb: check oversized packets for VMDq
Date: Fri, 24 Mar 2023 16:34:58 +0100
Message-Id: <20230324153501.20695-6-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::18) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e96fa52-3b0e-44d0-f8cd-08db2c9a2221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNa5tkHJ+zTE50SjzP/ciYIbdW4//CnHJqsEwXwnMyBH55bTdQlHl6zQfjuIdD6k8GhtueMYJTQ737PtlmAbCrW6c/s1GgZ3pHnHE1leVffsn8Az5QyR3E4MbswVHAtR2+wF4UugCJxeguPqD8yPiUydsMjAaKrZEzTeEY1bXMAJ5SjaY/pjF//0bM5thtYb3eiFN9MHL+5oqMQ1cmMtx8QyGakVPXvakuvNs2yE94HmukRhbEjc9kXFwMvmN9ZJSXHEtnsGHUR3WaFWTUEy2jNsp/fw9LMdQO3lYH4ANONI7KeCUAZvMxS8oiusWRnba0G7e/IKO15ZYqUgW53w5nT/HLB2lsu4K2jzFIeQFWMtgcDukSGizTEbkavtkZVEtxcVv/+R82xWI25ZKHfMB2yacJ3IbYF0am2evni0+bO/aBr1Nfzbt95Acz8Ux3RTQJ6JUBf+0vovlnlUCePJP1mL7MNU8aEfLju/mJ0U28u5mgRx1qDpeXYUcOAXeuGGb11X6eMIcM5aztMt1qHxIPlB7wUIhCrOtJLd8iqFxchXxgxUzt53xguRNFLbgu6JAP133QVsThQE5OEkMK0MPt985ekdRN4BcixIvgWLLMPsIMVzBViIsBWN56Y9nGSM/T9gatposBkSriGDz//PIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(6666004)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oMaacRQTJg5WO9VJ8IpK7VQr30ilP7LaZb/8Rn2OZm/lx++gEF0EtvEboH4N?=
 =?us-ascii?Q?RX43X3mq6RqZ702TF9rB9Ua3u0H7QXg4LM0XL4vD1fj6IN6/InkWj/rbVwgb?=
 =?us-ascii?Q?Z9QAN9eKELdYW56FgUGnh3S1kzeN+QClg3Q5210vjJv0Bp4o248KiTCQlHcC?=
 =?us-ascii?Q?jlkwmTohYnnY292oX/y8uts7bFN9JpfMGeH+THLgGOL0qGPN4jVzv0X+TzCA?=
 =?us-ascii?Q?3pn0RCgNXIc1AqTndiYVV6rHTxXs28ayCGnEs5oGe98yaXz4M4UxXq7mZ5hS?=
 =?us-ascii?Q?MeZemQHHi6O0Bq2fWrGrMpSlEHR6Im0ki/iQldGA2ettX5vibqxg6wV8n98S?=
 =?us-ascii?Q?k37+C+hE0E3Czn0Is4PwxY3qQKNd1FHq05+GXwcvxccdILy4G4gnS6m/TCl2?=
 =?us-ascii?Q?R7+mziDfA+TybBATnShfTfTikTisSJJ47/ogg3208mrQx8EFYab/lUsf+hRr?=
 =?us-ascii?Q?0QJqxnkwgtCVAJlTPAdlCDbrCYYZuIWrAxDasQ/8C1tTlGN5y4aVUdYJ6K/Z?=
 =?us-ascii?Q?qIQS79ENcgzOBmzKH5j0DnlcmZJKZg+vERMS020ophDy3fE6Lr/VgT4NJBgE?=
 =?us-ascii?Q?Thr6M7gH4Y3Av2u23iPqtZXrl1jRT/nGPnzoiD+d3sB9+USl9UnsMQQ+10ht?=
 =?us-ascii?Q?Da7kD1FCdKxm74an5Bcl8gtSCKhyPlRkyM3ORv+b/PyJ6YivfRtLI756CfUJ?=
 =?us-ascii?Q?F2UmWn3P6oLdRvna4Zi4dyMVDGudsWpDAdmi07eEzPbUhLdTglt5EAbh3Ee7?=
 =?us-ascii?Q?dJC4tTOsxCbT75n29QI3Kz1E5b/UTFQhapgbZjJB9nXClh3Vz+bKOmMDWLOI?=
 =?us-ascii?Q?A/7IB9TXK4vyn2Y/mcdodxJT8sdxxw4qm6XCIODaHP+YoTDL3zf3vHkU4BYh?=
 =?us-ascii?Q?pvnPXEACSKjdgp/ADd0B4CD28AlcMnXyhiO3tKuesv1Mh86njlQHw+rJl61d?=
 =?us-ascii?Q?IZ1NDKkakIs2CMUinosjn/uvW2GsFbZpnORtwN+QCgAzc0owre3ygzqSN4+H?=
 =?us-ascii?Q?zd/Kpw182dsBH86LEc4GcZPALk+ZB/+vbEqqhdkKTfTVwu1N6UIuWYEtmVpz?=
 =?us-ascii?Q?r8GCOlP3KC932jQgfPAABs1/IpjSl7wmY5uFefGX0A3pc/8Hu6HT67/79qRJ?=
 =?us-ascii?Q?xihEzXGvF/q5PA7RR2TKCOO/+rtz3qmqRzf7bUsDGovYyRSbX4/dK3uy5+NV?=
 =?us-ascii?Q?QoxlEzmaH6q0RCeXWjKC46vsJLBBsc/3TlyiwzMUihd4ddjx72Dl4/qwUxJq?=
 =?us-ascii?Q?OdOxf9xlbgHEf/SI2gtv7iSNJr2UukfrV2GvQNTgwuvjoIcNzOZPZ3o/W0gt?=
 =?us-ascii?Q?nBjK/h87G7S7npjAM0vpHKHMurI/YyI5mbn1+AWLg26GYWkWhFG3IMF3gV7c?=
 =?us-ascii?Q?EWB/6GNvKXQA4GdKeCmHHR7ErsWIg1vfqt+VZlNY7yECP2Ou+rN/rK0wSFaT?=
 =?us-ascii?Q?tP9dDLhg+vRUmwc81BVqJMiXJWkgNMG2QWAN5oHAL+6KTVMsf2c03Xl8yOeb?=
 =?us-ascii?Q?JljOO4M0CM34alYblxZD+FuzYFGF4o/sUjrgO+vQpkGQHK4P6UWRGqsD4SQ+?=
 =?us-ascii?Q?eRa3zPh9a55IRyfc/+7tc7MQdAnpMWYsV+o+41tMLk4rFSLPaKVDHeqFKqpS?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e96fa52-3b0e-44d0-f8cd-08db2c9a2221
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 19:01:11.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkz6y9P/cRQnmeevcFVJhcDj47o2OtU5OEieK00YQoXp7mwLUG6QiM8cCWUClWkJYcFeJgTiTaKgOVKBVFEK85CeaS5X94wIr6OOhlQJnr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 753f17b40c..38aa4596b1 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -921,12 +921,26 @@ igb_rx_l4_cso_enabled(IGBCore *core)
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
@@ -1026,9 +1040,26 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
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
@@ -1576,7 +1607,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                                e1000x_vlan_enabled(core->mac),
                                core->mac[VET] & 0xffff);
 
-    queues = igb_receive_assign(core, ehdr, &rss_info, external_tx);
+    queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
-- 
2.34.1


