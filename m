Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B069372CE8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:27:04 +0200 (CEST)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwwx-0000Dk-8m
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrn-0003gs-JC; Tue, 04 May 2021 11:21:43 -0400
Received: from mail-eopbgr20111.outbound.protection.outlook.com
 ([40.107.2.111]:7358 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrl-000711-DQ; Tue, 04 May 2021 11:21:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBqAX2jmoodOPRzjKKvv/5a4wAKPnO4xgb1nz2MOC1rhaOMGUfHVTbJv4weQimzuXaFMXXbD8gf8YW4DQjEJojNDstaIP4UpmgSSneMxqGpvy4PpftaW/QrPHkv6m17HPUiD4Rcf/oKvQQYto5pFqFP4vLvOFwPfcjUaTijRzfhxm9r0tKr+XExMqGDgYyHHbaY343aRQbSJeTrY9722Zr5W9MZRni/FDZhPrBSjV1TADkWl3UdOREQgKdZ+t6EiqvkAgw/hiMy+DOXdsQ2xjV0G2mPZ6Y+BZuotHqqcPI/RjncHoaHVJFSjBMWnHKP+S8GlWq/OjhU7cloygxH8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GdXUqycvfE+4MVhS7K1tTI5bgyDA/qZB0S7CeN2Cqc=;
 b=oDlfYu9qDprY5r/5rUHNTFb0IbG9RMgYHSSQ0r5FZG+RAr/ZdPkyDQbMJEaviCrBVitFAGz1OKB1z63eVEHBNzQthQ1A1DNW0QtwQCIH0FD67AeamPkDxqH/iGptnPS6U1ecgJTdVGQQIFFAzgyqD+1XJucENb4yrqy8O3X8LPvK4KiWrMzL6c+aUxKcwia8FdcN8jvzfqtMSXFd3roYDBiXYR6hsec4ED11aPfwiX3eS2+gMM5jVTNgH4uci0tEVYuwNYdyGVne3PAqfkMNeCi5Q3U90CQTiwZ43t2RcIzc1OUtp9EJfP+TiDoNgpp6V5fJ4bzc6AbZzl5qxm3ljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GdXUqycvfE+4MVhS7K1tTI5bgyDA/qZB0S7CeN2Cqc=;
 b=DDYxPksrCI78fLHxY8h18gvJii0u1adFybXipBHSDHSJivfqGMdISEcK2HRIlqF9Q781OGsJRDjKIlT55Kg9/OcBWQ5MRop+dihznajuWYgVM2SO6inYDCue9tU5wyEQp/zWTwzgy9jWXiARL8ON4r2CBRQEXvL8vHl89nky/bo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 03/10] qcow2: introduce qcow2_parse_compressed_l2_entry()
 helper
Date: Tue,  4 May 2021 18:20:16 +0300
Message-Id: <20210504152023.322862-4-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30640879-0231-4da6-5501-08d90f104af6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49161B71DD26239534579E61C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BqY3pgVyKWR+aOnKmAncjD//s7Jk7cVDYOXx/lcNCidqlohDcnKil0SzHgdMIvDk++IagifOK3CfYnFFpVPnD9Xn4UUMNsWDCiGCG4jjLaGaSVHbLoHOH9XWvOY7P/qZl7XZUODttYqLBM64nN7kXB93v34A4osFQXCcA4zqpSBEP3QGfExPVkbTv0HHnlwR7e5mcyiM5Wp2T1pIqXZI1Tu+w/igwHUOqjosQHuXVgzeszdFMs/ZjwROnnX1yTmXJGC3NK63vHJpXOxs8mK60PF1ZmJm+idK4fSbwCBArZYHIgH7JaVIGhqFRKBzkzZ4fGOocBx9V44YsBumVevfjFILDRFlHb1UuTlRRxhKGq7F4jRP01fEgeidKqpiwYqqnqjtexMcQwBPGLsUyogynNN7oGIS8yuA18DdIZksv2GbMr+fDJ3d5Gjvds4fleGcQa64NejghjyH7Tdbo5II6I09zHOUgRYd9DTVmYi/FGS2StN7OPbxLKtuuLh862y/9IXOg1k0JJ/LIhkbRblUC9lerVgcuvxsYmxd8I2Xr8K67DD5heJ5m2OfX3Z/QEJLtKpObbx1cllpubKzjNBUIOhTGXHOmA+kmq1PDEnyOO7qxdnD78cB5jCiVV/vEj5FQNZ5yfXlu+3PO2JgAEPW4SV2g/LDoa4f0BrABF31wu5phRNgnxKzzawaBjB1AIJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N7/Z9+f3V0VPCPrCeu5CNQJTzcSTRuWHIV7OOeG00a1mKt35MJeMjiEQZweR?=
 =?us-ascii?Q?o93BuuEOH4N2mHWyLn9vUO0zVnw/mlbZ+sExguc9aCoTNq6nuoPnJfBW+tEg?=
 =?us-ascii?Q?6ATMbvFQPGp0us1eAbwz4Af9/Z62hID6TcWmDkzWO6NfP40wqd/ooFJZwqDt?=
 =?us-ascii?Q?HHn+tCd0FyGC+mI/qxNQI9qAmEaHuhvAOX3ZLo0Xp1bfzOTf0QxvqrIQY22f?=
 =?us-ascii?Q?OXv7HF/CNF+edAx3AZ+krcw3f/Tg7ektTZ5OEMzRQNKK30O4A4raw1ibfpHO?=
 =?us-ascii?Q?OnqalhoHRcE+Z5ulUDBdeU22yMOKN+24NmCnZt/nhDz9Mp7oHiLV+yCVHGWK?=
 =?us-ascii?Q?pbVa9wmGll9a7mzqSMn9STjsE/L+Idfi68LNNO1y0YA6sLKiozcmGUNkwvnv?=
 =?us-ascii?Q?FOdard11cHcNniteYdfvYq0Fr2RIaTg7Dp1j4IwKpCOs7iWyFpWOI6AfEHhR?=
 =?us-ascii?Q?v8atvPddk4O74QWlH+kPOaCehGack15dRWnC+MLP+jaapH+S1rtq6vKreBpZ?=
 =?us-ascii?Q?ou7OY/NoAGghIIsMI3G1khwrEOzTFiB9ojmdoJv7ifXJVCGmeLdrtCWm+9F1?=
 =?us-ascii?Q?805LY86RVQos8Hp6aBUQDFLKr3kwqql6FbRJ3VyskfLAxWGTyBTEfBbIUmKI?=
 =?us-ascii?Q?HsMX6NNaovp2aY5od44sR2v7/4mbEYoGBiOWrcDt0ms1BMOwNOX5IGpaGwd1?=
 =?us-ascii?Q?k4rSoLYJSgS8Zzu6zdvwtRA3eVGFUikNxVJmZVBVB4N8Un1xojd1A/Te0m3L?=
 =?us-ascii?Q?+8srB3c8Ik37Knc0xHxEHwy8CSLdjIuiTnvH0+uieQof9P2Fw1XCmgbWJjCl?=
 =?us-ascii?Q?hcZOTe0H74RrL+Jrxc49oYlQD2LOBBancX8Qx6525lAygOeYiSSzJ/LHPKfY?=
 =?us-ascii?Q?ix/QVMZdbWOT5PGUSXx8yDgPRh0/32022iKKzwasLNSe8nuyJM2q4TKbujBO?=
 =?us-ascii?Q?sqVbAUHi0QdHl66I974S/F4EGHD/X/64od1Q/SrwdRPvoyspLCUHruI0tKLg?=
 =?us-ascii?Q?93o1+qA3N20Sx3W2jVqHWTQm73F+QU5x4uUqQ0obdZBfo5DEy4qIUKQCEypE?=
 =?us-ascii?Q?hHusvPOYkXRpc+JDiEVY54dSqP5AbTdKFvPnZduM9djyX+54iVkt4Bvr7azz?=
 =?us-ascii?Q?NpkrrUh9PS3HDTQHW2Oc4dsWelSoYJVoO4yEa6NyqtTJuSh9b3IrQmly2IAx?=
 =?us-ascii?Q?PVlBk6/r32jOHB/19eLEZ7rMjQzpC3mlRaEPcIM4bZ7gQ0laWloOyRtsAVhI?=
 =?us-ascii?Q?SEUCAWtiRtedZyWoof9fR8+2JIX70DnsGVpugaAcclLAQKvi0K8UVFHxTssZ?=
 =?us-ascii?Q?x8wzimX5bbuylwBHkuzYXsaF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30640879-0231-4da6-5501-08d90f104af6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:30.2620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IY8vmZ/wFS0R1c2WyRQz1Mk5elU8j4nYhuKQ1XGL7Kg+rRfwNg3zW6O0V/YI8Wdj2Yekx+VTRMf0sJ4TnZm0SGudeZt8PmSOSoms/TznvFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.2.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add helper to parse compressed l2_entry and use it everywhere instead
of opencoding.

Note, that in most places we move to precise coffset/csize instead of
sector-aligned. Still it should work good enough for updating
refcounts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h          |  3 ++-
 block/qcow2-cluster.c  | 15 +++++++++++++++
 block/qcow2-refcount.c | 36 +++++++++++++++++-------------------
 block/qcow2.c          |  9 ++-------
 4 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 42a0058ab7..c0e1e83796 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -110,7 +110,6 @@
 
 /* Defined in the qcow2 spec (compressed cluster descriptor) */
 #define QCOW2_COMPRESSED_SECTOR_SIZE 512U
-#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1ULL))
 
 /* Must be at least 2 to cover COW */
 #define MIN_L2_CACHE_SIZE 2 /* cache entries */
@@ -913,6 +912,8 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 04735ee439..70d0570a33 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2462,3 +2462,18 @@ fail:
     g_free(l1_table);
     return ret;
 }
+
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int nb_csectors;
+
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    *coffset = l2_entry & s->cluster_offset_mask;
+
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & (QCOW2_COMPRESSED_SECTOR_SIZE - 1));
+}
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2734338625..66cbb94ef9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1177,11 +1177,11 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     switch (ctype) {
     case QCOW2_CLUSTER_COMPRESSED:
         {
-            int64_t offset = (l2_entry & s->cluster_offset_mask)
-                & QCOW2_COMPRESSED_SECTOR_MASK;
-            int size = QCOW2_COMPRESSED_SECTOR_SIZE *
-                (((l2_entry >> s->csize_shift) & s->csize_mask) + 1);
-            qcow2_free_clusters(bs, offset, size, type);
+            uint64_t coffset;
+            int csize;
+
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
+            qcow2_free_clusters(bs, coffset, csize, type);
         }
         break;
     case QCOW2_CLUSTER_NORMAL:
@@ -1247,7 +1247,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     bool l1_allocated = false;
     int64_t old_entry, old_l2_offset;
     unsigned slice, slice_size2, n_slices;
-    int i, j, l1_modified = 0, nb_csectors;
+    int i, j, l1_modified = 0;
     int ret;
 
     assert(addend >= -1 && addend <= 1);
@@ -1318,14 +1318,14 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 
                     switch (qcow2_get_cluster_type(bs, entry)) {
                     case QCOW2_CLUSTER_COMPRESSED:
-                        nb_csectors = ((entry >> s->csize_shift) &
-                                       s->csize_mask) + 1;
                         if (addend != 0) {
-                            uint64_t coffset = (entry & s->cluster_offset_mask)
-                                & QCOW2_COMPRESSED_SECTOR_MASK;
+                            uint64_t coffset;
+                            int csize;
+
+                            qcow2_parse_compressed_l2_entry(bs, entry,
+                                                            &coffset, &csize);
                             ret = update_refcount(
-                                bs, coffset,
-                                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE,
+                                bs, coffset, csize,
                                 abs(addend), addend < 0,
                                 QCOW2_DISCARD_SNAPSHOT);
                             if (ret < 0) {
@@ -1603,7 +1603,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVQcow2State *s = bs->opaque;
     uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, nb_csectors, ret;
+    int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
@@ -1617,6 +1617,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
     /* Do the actual checks */
     for (i = 0; i < s->l2_size; i++) {
+        uint64_t coffset;
+        int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1638,13 +1640,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             }
 
             /* Mark cluster as used */
-            nb_csectors = ((l2_entry >> s->csize_shift) &
-                           s->csize_mask) + 1;
-            l2_entry &= s->cluster_offset_mask;
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
-                bs, res, refcount_table, refcount_table_size,
-                l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
-                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
+                bs, res, refcount_table, refcount_table_size, coffset, csize);
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/qcow2.c b/block/qcow2.c
index 746ae85b89..418779a43b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4672,17 +4672,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
-
-    coffset = l2_entry & s->cluster_offset_mask;
-    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.29.2


