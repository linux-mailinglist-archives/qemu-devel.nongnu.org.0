Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD083372CE3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:23:41 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwtg-0005Pn-A3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrl-0003d1-Dj; Tue, 04 May 2021 11:21:41 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrj-0006zb-I6; Tue, 04 May 2021 11:21:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbO1c3i6blMx/m6PGRrJEi3QRf/4d0js4f8B/7op9ac2uhykv28T0M0si8yGlZCpaI6aIYmoECkTioIKqd/A5dsoRBb8LdmOHJAsyodn2cQFm7UmnYcfdn4GiFofGZfWFakSPx10KjW0NMQK3u+vKTSC9KrFnonpir/+7apAVsRyXDrQFFU6GFsf0XrqseIZaQYD7EaaQ4/DdyxaCsTvr0M9eUc4z8BGZcO20bV6f9zXuDQVlYlTCjS5wWuTeatXHRTYdHKIr/yc96r4zvK1L9v8YQYJNJVVHLaOV0Ta1fH/1N+IRJ4GSnrEjg6gurG8vR/SnkHkEzS23CxpqVN9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAcfjI/zkzlDiEQSP46ONeH2XpYEfqHZddK2k4+K+o=;
 b=B3d/Vc7SIKkYkdGzKCFECGmoG8S++ZLm/46cFd2E+qL5IY9S4p8u7lmGVNr+fROtxRIlyEmmxwCDqmLvPczywKgk7cKdMDa3qi4QhEwstGlGSpR7nA6ZWmUirh5IKL2glvrBteVWLGzp8IDJu406s8wANhIpQCP+otOMKkd0Yn4MvVA5BLrjzix7FRUjzPIvekjpyvCMvSwJLRZmUly7B4/4kO4mA00PPal0uigq0368yfgQI/QwCTSngiFhYDVou2XPIQBJ1w54mBkus2xAQtBgnEJM80AZAThpvBox14q0DVXzg1Oc6XkwCHDc7abIN3Am1VWyd+wMFIfNArx9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAcfjI/zkzlDiEQSP46ONeH2XpYEfqHZddK2k4+K+o=;
 b=aMMXlWJo4XlOzNayjafmESiOgdtopCHwjAEFDncfDPb9y8oNfr6STvVq3+KPWCMTpE+H3/F+ogFycifFnXSb6Ez9X7rKS4KdWbChF9dyBEJ/P+o/E18M/zt9IDpSQWVECc1o96zJDJ3lpzx8xB7NgHyFamf/ww0bza2RCg3sl2Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 01/10] qcow2-refcount: improve style of check_refcounts_l2()
Date: Tue,  4 May 2021 18:20:14 +0300
Message-Id: <20210504152023.322862-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504152023.322862-1-vsementsov@virtuozzo.com>
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c441787-5b35-48a9-0265-08d90f1049c8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916C5F419E8EC28D232FCE7C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: StTVB4WowFk69XMSgdW2qLSKU3tviGC+X3o9FlC2alco2x2wKWW3UeBKLbD8AW1fzi4LpWtblZTOSHZYVjc7/o9ryB3XxxoKXkBKPneaTLTp4MVdxMslAb/KrJJg80CBJA9zI9usL8A602ftJjVimFneYJXC8BCh1ZE8YCfDQunTu3RCq5SlDpoq9wS126AWHSQ5yo1YCd7odA1eM5q1w2mZpY789V9JkVFPQFEg6n/Vq8ogvpZlJVGA6mwuTWjmDwWq+FSqxL9J6vNJhjrI0k2p0Q6boAemxiAmliG0TS+VmE80wFyfpe0/DIergtkKPL/wIz/MsNce50FpN7BPeKMpFm1FYdi9TkJJuVJiapqRkKRx7pIwBjECYjs1ZIahRgpn1vfgTmjmtdecxCvT8Nt1CR+NagRpHE5TKRIgihpCA/xWLj9zWdP5GyUSjP/BWNbbBgaPsH4uqnbTYRqJuLREm7+6p4WQ84QSwOIB9Afs4goNViD8CngqJiS9AnsNakirOuApsUtilZdcuwgfGoAkOJohKapH4s2ci77MoJk/9sd3raDG/hz4Z5ahqJWbuHwrDH83drAMnr3dzuzO9qUSj45lSOoRTjUXqx0J5QVOUA2vmLjXDuUVgreNNqn6FRpR9Ug/KHrPnhr8b9JqWAZdGmaY+fVPXSsDFMuAtEUqfJOgIAJQNsQjSNou/gtX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pWy+wvHs8pYaDhmLmHbwYjH6JpjeeZ7keOXO0ZSs1JtPJd82oZRPhz6r/4hF?=
 =?us-ascii?Q?TrQzxMHBxnYKJzNtUV6jl7BA0pD+yKD167iFXSCxEodFagQos5DZy3VH7oBi?=
 =?us-ascii?Q?33EKlhDywYb7dBJg8ysu9mmf5E5gsdABJ1KAqkgxAxaEsBLOSaQGy51DfUgp?=
 =?us-ascii?Q?cQex3wPYVoSDq/XCx2ruiL5eqEIPlJNNeU2szAXjhDop/4cwUb3s0mNS0I6h?=
 =?us-ascii?Q?AzffhIwc1GOBqW8hQtYIMCXOQz7z5w1+3ucOemek4cohNDalnKyw5LOZXHkg?=
 =?us-ascii?Q?eQgwD/2UXZyek9StjJT7zrJDRYP/R7kacErffY+fboXYxL/TuBo9MMNP0hnc?=
 =?us-ascii?Q?c6KUfGBYVpZTW6uIjACMtBAFRXGnVWdCe6wf+CPCWM/glxTYk+m42dpNfxn9?=
 =?us-ascii?Q?mHqbUJBR9ASqYibJgU9JjC0ZI+v+pibYTcpBEiX+PVM4u0if2NwaxiawF+dV?=
 =?us-ascii?Q?uodC5utAOxtCBcW0JjCE7Wa5KLt2vaVU4YPS0ljbGze/0eMj5Yxci12gW6MQ?=
 =?us-ascii?Q?8YOSAkVcVhQmoKbWZf17MkZJ8hqU8bFBXVGaYO/p/iZabdegxlhBfWPKXL5f?=
 =?us-ascii?Q?nG9/2sGqJuk9N3s5p8x4cNyYPBSYywPmPjBfraghvF+pOXh4NjpxZloVTVDM?=
 =?us-ascii?Q?Y6anAfczGP3wuFUVZkZhEaA9zzfu6vrBAMren+GiI/pRfV8Slst63qPstI4w?=
 =?us-ascii?Q?AW0FjOg7i4QUIK4Cxr8pM1KWXhBK1528jXqkWGVjjMNeNPuwIBQ6DnZpnmQe?=
 =?us-ascii?Q?26tqeFL8q4YDX5cLSug9wC9d3XF50GLaEyzG/GEfDb7R0XGUEC95m4gJQOjm?=
 =?us-ascii?Q?PX6eeKlv/ZE+ikPcy950KeEHwXjmrWrPuE30lTtQQ9GDAEim14V/LQdrI5+M?=
 =?us-ascii?Q?rZtC9v29XS8kDCzC6Q/CzpMVDCNXSMZMv1ZVzjKEDwzHceHNgT1yVAVXxu3d?=
 =?us-ascii?Q?Vs0M/YVq6fNubdLWjZJ2A3ZFd7PBdDdObhs9qr4gsgTG28IX07bKxOmVAJ17?=
 =?us-ascii?Q?5hgVj+xRoeWaMnTvmEb1WMOE1e2V1+r+Q5tJCyPauajyhLWsnnwE6VHuTPNu?=
 =?us-ascii?Q?MS0Ytmnp0Wz9L7HsQoGeRzk7Ol+Z4Eu09zRP2bsuJGa0xoFL/Z33GKD5JJGx?=
 =?us-ascii?Q?vt1Y1qWCWYJej0crkJ+5aSndhcfEdOKO2IibGi4IIG9C8McQR/KFSF1DpHE0?=
 =?us-ascii?Q?3MRyWcf62M7WH0GgndHVIgCWXhamtISgxhU6QUrK0rNE9BJr4s/f0eCLo6j5?=
 =?us-ascii?Q?U34loI8frLpAt6dfiP+tJ8/6o2Sh5nwEc+tYNEAK4lcEyHdBR3kkBwuRcEkC?=
 =?us-ascii?Q?tYLV0JJhlqI/syK3ZVyZwL3g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c441787-5b35-48a9-0265-08d90f1049c8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:28.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgYPEbBySg7725lfiYDYh8lKL4W6SvDqrpJ+QPYbXd9brapN33u1plRx7kdlTdiQUGViBX/2ujvTPL22tIfv5B/jWPwOVT3ly0vzABa3rtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 - don't use same name for size in bytes and in entries
 - use g_autofree for l2_table
 - add whitespace
 - fix block comment style

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..2734338625 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1601,23 +1601,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l2_table, l2_entry;
+    uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, l2_size, nb_csectors, ret;
+    int i, nb_csectors, ret;
+    size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
+    g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
     /* Read L2 table from disk */
-    l2_size = s->l2_size * l2_entry_size(s);
-    l2_table = g_malloc(l2_size);
-
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size);
+    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
-        goto fail;
+        return ret;
     }
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1647,14 +1646,15 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
                 nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
             if (ret < 0) {
-                goto fail;
+                return ret;
             }
 
             if (flags & CHECK_FRAG_INFO) {
                 res->bfi.allocated_clusters++;
                 res->bfi.compressed_clusters++;
 
-                /* Compressed clusters are fragmented by nature.  Since they
+                /*
+                 * Compressed clusters are fragmented by nature.  Since they
                  * take up sub-sector space but we only have sector granularity
                  * I/O we need to re-read the same sectors even for adjacent
                  * compressed clusters.
@@ -1700,9 +1700,11 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         if (ret < 0) {
                             fprintf(stderr, "ERROR: Overlap check failed\n");
                             res->check_errors++;
-                            /* Something is seriously wrong, so abort checking
-                             * this L2 table */
-                            goto fail;
+                            /*
+                             * Something is seriously wrong, so abort checking
+                             * this L2 table.
+                             */
+                            return ret;
                         }
 
                         ret = bdrv_pwrite_sync(bs->file, l2e_offset,
@@ -1712,13 +1714,17 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fprintf(stderr, "ERROR: Failed to overwrite L2 "
                                     "table entry: %s\n", strerror(-ret));
                             res->check_errors++;
-                            /* Do not abort, continue checking the rest of this
-                             * L2 table's entries */
+                            /*
+                             * Do not abort, continue checking the rest of this
+                             * L2 table's entries.
+                             */
                         } else {
                             res->corruptions--;
                             res->corruptions_fixed++;
-                            /* Skip marking the cluster as used
-                             * (it is unused now) */
+                            /*
+                             * Skip marking the cluster as used
+                             * (it is unused now).
+                             */
                             continue;
                         }
                     }
@@ -1743,7 +1749,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                                refcount_table_size,
                                                offset, s->cluster_size);
                 if (ret < 0) {
-                    goto fail;
+                    return ret;
                 }
             }
             break;
@@ -1758,12 +1764,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    g_free(l2_table);
     return 0;
-
-fail:
-    g_free(l2_table);
-    return ret;
 }
 
 /*
-- 
2.29.2


