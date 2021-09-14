Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E140ADD3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:35:45 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7f6-0005Dd-9r
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VD-0001ov-0N; Tue, 14 Sep 2021 08:25:32 -0400
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:32082 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VB-000628-5S; Tue, 14 Sep 2021 08:25:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh+SX2HulcI+UTr47JDkZTjztjTo+iGcmH8OT1mzvR9uGmmO2CHHEMxhZk1ISKcEwrF8h1yaxPV0SJQEKO779Ezv3R/7ryajm4/smBWc3QwpOLPvfvRboD/rlYICSwHTinurfQWutO6xxK9MpWGvRbqxJlIW/kfw9TekEbTAZfNNFinXZkkBBptfRQXTpyt6y1dtmP0I+UJjyrYhzBEFxadmwacIWrwtldvVYdhiXIEnVJl3EqI9XSD9MCGf4m2ZPmcWfjyrStTWVW0BW+5f4kCOm2XAeQtPACIPVKcVoBBuKuW0HRzHL89cXgfX71rBVTVkTmYN0rkCswnqbbqOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MSiABOFcH7Id9Tm3KGA/npPkxqsJWWGPN91EiMSTTMI=;
 b=STav1cvjmbmIy5fW9YAcyytdMoBuZN6THOKWeCY9CzFor7wUNflzqR+laInFHPR622uJzskTLtSkwKrv+2YJ13o7KLo33sZiw0e/dp5jY2Lhdhv6f5PRegr6Az88HB8ieQO74Spz9NO+COzAohq2qJtgigKUN8QfJdqjD527YBdVfiq5TxaTIGWYmB7VoTGsQSSWCHOnE1Ag0OWKSu2+yCKDNxn2W8sSIo4Q+BfEpnWFSmQGZf48+Tfd4vAasbEVzZ0VszqCPy/taABnKo7PqE80h5pyKBhc1UAYTjqE+errBk4oycfci9SRCwhVt2Lbo1+ib9uzREINRsu8HSuzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSiABOFcH7Id9Tm3KGA/npPkxqsJWWGPN91EiMSTTMI=;
 b=K0k7akYxwDjcsmxMN1gXdN20V17AAJJIp9IsmSL58TmsS7P4JHO/qoBLrCSET64cInfx8DDifRnBzUqX/5e9Hj0Y/G+jUTODdW3UbOHqg1Ly4RZaR63KEMIZZzNBjTE3ws+63uzUdS0lG+Ywg0/nrVT+Z+eX3AzRUZLK14kl5CI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 03/10] qcow2: introduce qcow2_parse_compressed_l2_entry()
 helper
Date: Tue, 14 Sep 2021 15:24:47 +0300
Message-Id: <20210914122454.141075-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59cfcd87-0572-44f8-49a6-08d9777ab7b6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69469069E7235A16841CED18C1DA9@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJdVi5XiIpreymsPqFpO9jB157jgPP6a9L+7mdA1Z7jPZHZL/ibVdRGRrVj32lF7tsvFrjBncqHtupW82WILDH0mbIWWPdBgv5W/dXf7zxUet2pKXkL7VjKZokje7tQ28EHX/nqF79p19JkwCt0stfdxW2W+GdE6NcaJb9mzBeiqFAUFDjbcp4datjlWYXtBDYJehHCUIqHKy70JlROLe7GvPA4ZnnJTbzchCBP/CItO5FiUqgtGHTXTq86A6JsKcIjNo0OmQXq9Vbv7TfQRpdFezM4ng72aY/iZ+pmDh8MsF+jsqZoqyScxVle/sINsjUU2/HCsCZjzzCTUapJiz9LmxGOSMrqaFZnBoGxnXxc08qCta3phkV+MNYMcnC0b3XvkK1NM71uXyUqkWGv3FXkhK2ich1GCI+ivxeohw9hJW84JDUc2CKbvOPgNaqTCfPWq+6GFYwbGAgnjCV5GYZPgqCv1PoNn9nXYGYMcbVPFWwuIgP5nVbhAmqsLlxz7PSrG/OXejZDnTUTT3FictjWAUzyB2MGIudounRmkSheEOI2vos5mV2sLhuR2jyOH+8B9tZywouiwf+DnH0p8TPhfFyW2xzoQrxnmUkuzE9p5tm6TicrIVJwcHRPwM6Ys6Wdm0q/YbU+ZAECa1LkUdvqcan6KvGvKi3+Y1vNtA8scAARQRLxa/jd4Csj95/p3aP0zHHq6U627imaQQns4fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(66556008)(66476007)(2616005)(38350700002)(26005)(86362001)(107886003)(2906002)(6916009)(66946007)(4326008)(508600001)(186003)(5660300002)(6512007)(316002)(6666004)(8936002)(6506007)(6486002)(36756003)(8676002)(83380400001)(52116002)(1076003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+jH+tAQbdvtiaeC7G7/U/Lk9ClRyuhXZx95Rff979pBWop0OJVwqMII1oiXR?=
 =?us-ascii?Q?PsUCNwcZsbCXXHMvp34kNIIAwoj+4ngrDdllMikSOccqErQCD0L8Wb+XzMMf?=
 =?us-ascii?Q?hhAAfIE2C5fMbjRhJVO4ElNbHpQPRFNXrbnscwWGmuaC5QOgQaSBi/K5WXCZ?=
 =?us-ascii?Q?m3ry+YE1zkGoqZZhrKKON1+991aZypShLLzyuWIiG+QxzwXpc5CKc1pD10aW?=
 =?us-ascii?Q?s9CFuCDPssbGpbmD96gnhuBfseL0jjCLWQmV+NPnfMKOlhhaNa2gTC52LiQK?=
 =?us-ascii?Q?/iWcP/BREwCj7AY70RELibC9sRWL48qYBEyH/o1c6DVAJGku62Ny1mzw5Ba5?=
 =?us-ascii?Q?fsddks4bcpIMcQ9VAzvAfnGWBmtrHe7BE7Oy/0JT9tZCIudj6KO9JxXgKQ3S?=
 =?us-ascii?Q?IEQ4SmIdB6sxQcinsY5dUVb9WbgRjYu/A4auWIJuQMCgI68ULxLjNvnF3MAE?=
 =?us-ascii?Q?98V90l8dXTYNCEJCVjUerrGrKsY4kb/DW5rZ7otw4g+rHn03qhZScmYnR6Pt?=
 =?us-ascii?Q?W6nxs4mIJO9Z8WVEqlqTBaebYavZGvxnakuEdvMJ70spPGnecS7myLNUGreb?=
 =?us-ascii?Q?lPCPkCiw9ShT0lYzlSFMKIYep7OW4oKsJP9RbPiQtxXhprIfg6D6dlyAGhwb?=
 =?us-ascii?Q?sU7ISbKne84hS2ILhHof6bQwPscGGwZL0NdC1p7pJ2k3cv0YVqtBq6rgOlFA?=
 =?us-ascii?Q?7GAd0xrHcl4UZe59H3nwzylaKktbJaI8lpWxRKqpiSDuX+9ZPmTx53SBQVfF?=
 =?us-ascii?Q?yBw9q7pUDhSZvIL9fm7FlReGno3kJi3S0SwEmZ2MMe5fU3A0pNIA4Cx6q7DL?=
 =?us-ascii?Q?aR98bgenYEIs3MIs4nH6Dcswe0KEMO3TsqgNoSmLF/9M1Ooc6Bn79ORDXnXN?=
 =?us-ascii?Q?LtwO4RJBaO7nfs8hS0SC2S9r1t2RRiDQjOeeWjDNFj2fIdhzCwFQ4zf+ng9u?=
 =?us-ascii?Q?OmcBJIS7RQsaT1BxtCepUh0HOCus6Uou9UZWHo/F+ivBIlx+ecv8Z0FFN9mW?=
 =?us-ascii?Q?ZXLR+/KBZaMc0XXyp3bIt08eQrgxnNdFEJTkM3PAeLKc/CHeEKKlSsAeztTM?=
 =?us-ascii?Q?TgXUJ88bkkGncA6rhM5Gp44qa2J/mtg8R8e+meHVFL0hazZhMJGi6NIV8Yny?=
 =?us-ascii?Q?7OxMGV5xaiCYTyJoyQ+vC/zuvuclPh6p2X+uCuMeJOF9Oh34dEYeXXv6Ujww?=
 =?us-ascii?Q?n9pWDMMmiUgPxxMwNdH4OBxKYwqc5PgSqb3SCplPTK4lvahCYAUomWBLS8aM?=
 =?us-ascii?Q?852H60XzZiXU2S9d+Ljsgc0H+mJO2ubyivjMPPk5F8nwupDKNiSoCfWj1F9I?=
 =?us-ascii?Q?rueYSBks8IhKRi2aXwb/dT+m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cfcd87-0572-44f8-49a6-08d9777ab7b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:20.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZnOrQndJCRIsXqNR7b08Q2Y/7eL1MhQsPY9CJDH8uY+YMtZw46h4Vkmscv1WOrWVZd34Ska6BdMVnzeEhjWT+avkNKMNvakqwsmxQEaZYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Add helper to parse compressed l2_entry and use it everywhere instead
of open-coding.

Note, that in most places we move to precise coffset/csize instead of
sector-aligned. Still it should work good enough for updating
refcounts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index e5d8ab679e..02f9f3e636 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4700,17 +4700,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
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


