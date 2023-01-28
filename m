Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B767FB03
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9t-0006YR-51; Sat, 28 Jan 2023 15:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9k-0006X8-Gc
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:37 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9i-0005Ml-U2
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR5gLT+drx17FKV7ra6u1Ru9QMQYgxyG4WDcxzUdJ88zt3rvcJAgMHA/vgbAN7hpfBEzJHz9sYQpYnRxC6lQdH9xlXWLRTHhBuYgYQ8FRhNKId8IaPF8l6FjmI5nSeyEzbUR2R91vP+C0Xg/a91u4HrU7m/+gtcBzbQXek7eJNp9TXCe0QX0AKi9JETnKjcGdz6HNb0I0ys77lA1Q9B34v57lZAHXnFJ9mAJxPu2+9LDdaY9iq5sEWOxYO8kHtaWKEzjkYJFqmOg+ybEpp1Pzg3P+dyvZ3MjBB75Vmdw0Y/syPZEsOhkAcGv+i0RODf0Iy6m7owZBqF104gAiu1fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33pRoHqSngurcZVJ/nxVVZybiroCXA6ts8cAfAJVK2k=;
 b=ZCMV3ZS/ce3szzqb6XA0rMWSDvgWUMxiKaNTNlJrdtdPdFU+1Ireq4IHvGbluLkTbHjj8Z4YfqHfPX1WIN2gD/ss14mSiYZqQYkfrBPkr4tXLAQFeYRdOvVAhdUjGhPojvGdzcXwM83jVtcAd71aLbAVAKz3P0JGIFp7aLgx5OhZz2L39/EvReGQ1vZE6VZS97MrKli5a+xoV+8d/87EK2WBXSb5j5l1ZzD6+9/LuRGuM6PGVM/ScfE4glyMkb59GvAUgfFfXDZuMeJsQ00L3JI4PkwrhA0tdF/8u2SQiBXs3UW0ZY/4JQ3NNiwUHwa1LxukiVTRPnpMKms/NsKsRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33pRoHqSngurcZVJ/nxVVZybiroCXA6ts8cAfAJVK2k=;
 b=TpQ37cMbq3Nam59lUbhycQXthHJXSNVRnI4FBQ/7lt3q2SmA6gzjmRj6VOmeDXScuA9XOBZdkA0crZV3N59t3IdCPzCh4Xr1Su9SuARprjdGbpNOEIzeUlageZVIN6/9+rXXGCJ5/1+X9c1Cm96dXDVlcxM6TfYEJH604HomtJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:20 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:20 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 4/9] igb: check oversized packets for VMDq
Date: Sat, 28 Jan 2023 14:46:28 +0100
Message-Id: <20230128134633.22730-5-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::27) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: fb242fa5-0d14-4347-7b81-08db0171444a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMpSDuDLfwPItPtQLoe2/yKy7zVzoDnozhLdRFUsml4EUD9iCw9R7xUrjU06C7JmZNnPcZT+GfBALgC2tf8ETZZTYfw8DiGdm7jUvhPelHtbhDZXANUVqTJjEoTCRR0lN8wtRQF9yBEHtG1tt30HlPxsknG/LnPTe9+juB0DC4Tzv/dM+ccu0sFfVbHjmhI0MSNDU344DwpYzqmsPUTkLDhz4NZJ5YoExmyLKN84pg6aBO7PmlJPUHH4S3rRV/GvAxHhhjIWEou+Qv7ZGeQFvj61yUfS5kt609x053J/r8M6b8RBGrR2ouZmfewd4Y+I8uq/CRyTNx6DbdWSWUIgSyRGaT13SLh7n96CIpjxJkyjuNy/wLxcG9TbnEvzMNaVAeK+c5FyrHDDHZIZJhf7mDkTLDzbZ4434dI31e+pAzTTUjqEkXEhbwYwOGj6EQktzk5d+kfwuZy0hwdWBFNyo5RChpq6rugAeE+2DBu0vQhuLybc61AGauupXsygJmGgs7ZmnzHP2iOACv4EtO1HGVY+aeB6fStsWAWZREnoIyTLCc0N4x40LqvtrpRFinQQwJCzrpAWQx3gMaEEvuyQXvU88mJXH8BG4iD1EXKcIi812phT7zJ0Mg2df6FLM68pYFW0+tcPhU/pRjV5BAntiZhkEphH7x61Bn1h0gdiSPQ7UaEHbklxrOoRKVMd/XVDPeMTLu3OdHbl0mCQohSoSXBAlgrxcOft+FyB1wTu2nI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2LFD3I1m1GVlBR2txkQgMMMbLDztXkrlPMB/yllPRlUrgvn5UPuR7A9bGk0A?=
 =?us-ascii?Q?dqdiwH/gfVvX/QPNp5Zw9VakuH3JTN4Ydb6QcE96esDb8/1ngjjsZZT6hHGB?=
 =?us-ascii?Q?AG8Gtq3W3osDr/+ZXEywUnvtPOD5KqNSZ/ppak109bKe9hyaUrZnT1LL30zo?=
 =?us-ascii?Q?QT3hDVHD6gbuYO/hqVNdBBd7tycUZROmf3s4aL5XU5D/FaYsygDCzJKwVheJ?=
 =?us-ascii?Q?GHIpTUktqUuyVukjkAhpw59YQlzj23KdXpb/6dd5bsgPG+rmsvyeea5BCu/x?=
 =?us-ascii?Q?DIV/CWjVtcdyA1xx6mRIypi93e7dhQ53G+pSQVfzDyJalXHGJ2W9MBoTG9Jw?=
 =?us-ascii?Q?N37oGvpTzwMYlRHiRrYQRYZpCqaVZsgBzf/1bXjMivVFXI9kqsIfLJ2F9y3G?=
 =?us-ascii?Q?FHu0/+msSOm+fyuqIbRK/SmsjMW+lh3qsZ/j58rEKoWGkyC1iKQh015XJeh3?=
 =?us-ascii?Q?5v3H30u6/dXkf3mfZr7PGJwWlU2RuaNIFvC4/boUDW2e50PYhanXQBCRUjt5?=
 =?us-ascii?Q?q+bJeh+3QKr9B2/FBhGu9JYZ6gwbK36QrAXZxM9gGDX7HDR+9DBetQZzz9r4?=
 =?us-ascii?Q?sGF0QLRslLVJaZMFp6pROneFSdFbiag2NZ2lWWxcqlaU0NX52B3MQ8XME1ey?=
 =?us-ascii?Q?iWVToycMYW1itkN0XQCUs9GhFhrMjJXmpMoQ079evJFIuiYRIkve/Mo3JUlD?=
 =?us-ascii?Q?48YCiWhcxYdewe4ijWO1Cie7dMqeGFmIczimZuqkbk/VQYY8W2jccxKp0VrG?=
 =?us-ascii?Q?k4KdFYuUUbiPVHEciqNgGU0WIefohQSEDzu0qpUp+T9lvGvHpoem8cPU7twz?=
 =?us-ascii?Q?V6IalaNQSrzodW7VvrKIcZfwB1nzQveW+tctkZa+r8akAHC4cBM3SRgghTH7?=
 =?us-ascii?Q?76lmB82bB/X3VppWFhDEE31ePuRV7mLXj1YaBZC6xcWfvkHe5UVEWv9eWP1p?=
 =?us-ascii?Q?jjmnn+pAcH1cMu6XfkIgdNmgwfNr6mAqwfNY8MzbJhK6dshV1OidihBmu7KN?=
 =?us-ascii?Q?phd35zO3WVgo0WJ1vNfiV7o9EMrtGYk3lvUU6O0cOgMBSwVe9+u4n66r06I1?=
 =?us-ascii?Q?+zT+YDOTqHm9UVR1qmZLFDUx/aLtV9RF2iPvhpjv131aREJ5T0YJMpB294N4?=
 =?us-ascii?Q?XoGW6fCsgR57mLP0FXTqScLWIpQJFKe32TzvEBRnPMzdRU3YLVKxixnWC7Xs?=
 =?us-ascii?Q?IzlZww8iLhtU5WmbsUXSEiWvS88iNDGrbnxcVvaY5IoCww/FKTB7guZeMdO5?=
 =?us-ascii?Q?1Mu+Fthl+l/+HKT8FfXV0qbQ+VWA0EIPGNp8Vrpk/aCNcXT6jy214Vi4NSAq?=
 =?us-ascii?Q?qaBWYz+dkIm7v9sY+IgVUmqNMc3ScDFcRR2ExUYhFYi/FCj4CcS4TY6u+4vi?=
 =?us-ascii?Q?Tjgb4hfM+SlbGjMiTF5gu7pWmqagUM98PP6D5p0v3nsx6KbDnlWfJ4Hjkzzd?=
 =?us-ascii?Q?JYPzTVZnEdXwfCpk9ceL8+68yfNw+EBgzVKquWop2hZdveO8BZKAO++9C5dw?=
 =?us-ascii?Q?ryhEnGq4YMDLb6+b7bxkjMy2N2tnDzQf9VxiANzvyEM3+g4/qCPFuZZZg6u7?=
 =?us-ascii?Q?5H0D/DJkDicj23bAeJLcWq4XXlpIWK9FbMJDOtFBmXZHCGC100oumq5/XyM/?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fb242fa5-0d14-4347-7b81-08db0171444a
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:19.2502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+pXvAL3r3jNZSUfsybH+aK03YRcDfluzQBrV1l14F+mON1ulwAisjssfuEoQp4iF6KluG9h2x0UJU4EHfOLB8H73yl8XcISYM/i4GKAFwA=
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 74 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 20 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 6bca5459b9..1eb7ba168f 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1476,6 +1476,30 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     igb_update_rx_stats(core, size, total_size);
 }
 
+static inline bool
+igb_is_oversized(IGBCore *core, const E1000E_RingInfo *rxi, size_t size)
+{
+    bool vmdq = core->mac[MRQC] & 1;
+    uint16_t qn = rxi->idx;
+    uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                   (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+
+    bool lpe = (vmdq ? core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE :
+                core->mac[RCTL] & E1000_RCTL_LPE);
+    bool sbp = core->mac[RCTL] & E1000_RCTL_SBP;
+    int maximum_ethernet_vlan_size = 1522;
+    int maximum_ethernet_lpe_size =
+        (vmdq ? core->mac[VMOLR0 + pool] & E1000_VMOLR_RLPML_MASK :
+         core->mac[RLPML] & E1000_VMOLR_RLPML_MASK);
+
+    if (size > maximum_ethernet_lpe_size ||
+        (size > maximum_ethernet_vlan_size && !lpe && !sbp)) {
+        return true;
+    }
+
+    return false;
+}
+
 static inline void
 igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
 {
@@ -1499,7 +1523,8 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint16_t queues = 0;
-    uint32_t n = 0;
+    uint16_t oversized = 0;
+    uint32_t icr_bits = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     struct eth_header *ehdr;
@@ -1509,7 +1534,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     E1000E_RxRing rxr;
     E1000E_RSSInfo rss_info;
     size_t total_size;
-    ssize_t retval;
+    ssize_t retval = 0;
     int i;
 
     trace_e1000e_rx_receive_iov(iovcnt);
@@ -1550,11 +1575,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         filter_buf = min_buf;
     }
 
-    /* Discard oversized packets if !LPE and !SBP. */
-    if (e1000x_is_oversized(core->mac, size)) {
-        return orig_size;
-    }
-
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
 
@@ -1571,8 +1591,6 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
         e1000x_fcs_len(core->mac);
 
-    retval = orig_size;
-
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i))) {
             continue;
@@ -1580,42 +1598,58 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
-            retval = 0;
+            icr_bits |= E1000_ICS_RXO;
         }
     }
 
-    if (retval) {
+    if (!icr_bits) {
+        retval = orig_size;
         igb_rx_fix_l4_csum(core, core->rx_pkt);
 
         for (i = 0; i < IGB_NUM_QUEUES; i++) {
-            if (!(queues & BIT(i)) ||
-                !(core->mac[E1000_RXDCTL(i) >> 2] & E1000_RXDCTL_QUEUE_ENABLE)) {
+            if (!(queues & BIT(i))) {
                 continue;
             }
 
             igb_rx_ring_init(core, &rxr, i);
+            if (igb_is_oversized(core, rxr.i, size)) {
+                oversized |= BIT(i);
+                continue;
+            }
+
+            if (!(core->mac[RXDCTL0 + (i * 16)] & E1000_RXDCTL_QUEUE_ENABLE)) {
+                continue;
+            }
+
             trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
             igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
             /* Check if receive descriptor minimum threshold hit */
             if (igb_rx_descr_threshold_hit(core, rxr.i)) {
-                n |= E1000_ICS_RXDMT0;
+                icr_bits |= E1000_ICS_RXDMT0;
             }
 
             core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
             /* same as RXDW (rx descriptor written back)*/
-            n = E1000_ICR_RXT0;
+            icr_bits |= E1000_ICR_RXT0;
         }
+    }
+
+    /* 8.19.37 increment ROC only if packet is oversized for all queues */
+    if (oversized == queues) {
+        trace_e1000x_rx_oversized(size);
+        e1000x_inc_reg_if_not_full(core->mac, ROC);
+    }
 
-        trace_e1000e_rx_written_to_guest(n);
+    if (icr_bits & E1000_ICR_RXT0) {
+        trace_e1000e_rx_written_to_guest(icr_bits);
     } else {
-        n = E1000_ICS_RXO;
-        trace_e1000e_rx_not_written_to_guest(n);
+        trace_e1000e_rx_not_written_to_guest(icr_bits);
     }
 
-    trace_e1000e_rx_interrupt_set(n);
-    igb_set_interrupt_cause(core, n);
+    trace_e1000e_rx_interrupt_set(icr_bits);
+    igb_set_interrupt_cause(core, icr_bits);
 
     return retval;
 }
-- 
2.34.1


