Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0A4B9230
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:19:43 +0100 (CET)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQm6-0003YF-Fd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGf-00048Q-BK; Wed, 16 Feb 2022 14:47:16 -0500
Received: from [2a01:111:f400:fe0c::710] (port=6627
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGc-0006Nc-Rn; Wed, 16 Feb 2022 14:47:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9K/Bp5/h395Vd9yFG8SHyGQCHlcuBd7d0Is0u0mNZ8SB6LLpdYD9Xh3/zp80lAi+5IDo+wL19bfN/l06zLMr6Q9EYeWjStMf+c2Ep9BCVhvY/GLFhcK2LBnwr31gbuyhRSHqHQH9WGRVR7iprL4rX/9oZRzU2cS+rWTH0e91aG/8G/NeZy0PBV2DPA29L+sVevJajX+usoXaB5NCadH+26OwCwSG+xjXfTWxNtAfxB9g3nRsoXfIsab7cRuAryiqrJ0Ul51DGlBA+wa8z14K2MKAz/C6pqf9fatYf/EpERnpxaQeHBoRVk4YZW02BttWiZtTPOLkJ3y73VIesITVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH2v8hJ8u7bgt17tZ4+pwgJVfZcjnzhkcFxdy84axr4=;
 b=gVL3V0PPGfckPyLgWXAvay4M/G9PExV36qgRp3rppBYawJcXQ65jrR01ruyK7zBA0qPe2Yz6rX+wuQGN2O6rd70YAslToWwHrAG/lJpOpQ9y1CtfY0QZTZDzv6j3VUqXzX9LZmg7ojhYjjYgZYCQiz5UbrbnpmZSJutNGwiqzH/getI67xx5oZo5BM5STQCLRFB2bCc1qAUU05Cgg0OyrwHf3HPzcEyoxY0IVdHjSnogjfxg/Uqe8MjimpQTc61iBxI6e/aHqHX1NhxFLtTUVaUvZ524LADeDa/iZWEwH7m1ARiRZw7jaGIpeWh8vKJWXiiTejvmShPq7BhoPfiJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH2v8hJ8u7bgt17tZ4+pwgJVfZcjnzhkcFxdy84axr4=;
 b=j89ujDaNzls8Xsr3WmfY0cmrKZLVSDadK4u0KfJejX6+a/TsyDKPHZRnrRIIKA6+l0kTEy7x4sRKs9U8aToqgJOiRMheIimtzAejvL0IlODIpSFsmyYpgWaSWL91HX0D14HmxoZyRTxvOvkiDTXr+soSC9c/G72lUt4Nc4x+894=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AS8PR08MB6856.eurprd08.prod.outlook.com (2603:10a6:20b:351::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 19:46:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 17/18] qapi: backup: add immutable-source parameter
Date: Wed, 16 Feb 2022 20:46:16 +0100
Message-Id: <20220216194617.126484-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f4936b-0997-4e5f-4d8e-08d9f1850f28
X-MS-TrafficTypeDiagnostic: AS8PR08MB6856:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB685605D8762AB5FE9F64E3B2C1359@AS8PR08MB6856.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLWV40Lhg/NNl1F5ZaiJZLls/HoBeAXPY+OpXKZOF1aEjRjF2iWcb5Yx6qaNWXmKZlOibFdABGu/aAyFZwb5jMwU0dGECUGlOHGIS9e7jG5Mh1jP1/w5x5f2ONCdtCN2NBrEb2mFGgN/20OBqnANGwqeqNE8PDzX6W9SAuWvVfEUl16MR1Msrggx518LU8Tbs1YJvRZ/yKxpNbQcJfW0RKucx4k7TvI9CWFIH1aYivbGBzqEAusAGDetGX606ZGb66trMkJxSK2QrYpaZKZ6u+mD0LVzRTf65Hxq/4qSEuljemVCc6IK5efDWEMLP3ELadyhpT7/EgCTITq1NMvGDfXtbFLVwG0r/KE4FzyGQzWi0pu9kJzhq92YlksmjWkLdlgaMIvE/cgcS2lO+/xwPx/WvnMxC33OfZ8KtedFg4ta9Swon4NQBhngWbITI4oe3hJJijECra59e9zBMbBFuflqZsIhxAjFEMYGgzPhhACvsLTPll8xeEshq2aJpblmmE/g7+mCXogWOKS3JeRUmSj8YyjIx5MoubmOB76gsuweo91MVrfU5ZwZsUVV7jCvGgqzNtIWVMBZ29Dd0dEzEDRiUglhY+t9X0rp4gSdQaciG/rOMYY7/xjvDSxOtriSQg8IK5X3VKSdhhrpVm812VD/InnKZ2jZ33zRweEPID2oGKpONju/V2RAZIHvJURrU3STNzZpns08TaDk2mOJ+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6916009)(316002)(4326008)(66476007)(66946007)(8676002)(66556008)(38350700002)(38100700002)(8936002)(86362001)(6486002)(5660300002)(7416002)(508600001)(6512007)(2616005)(186003)(6506007)(83380400001)(1076003)(26005)(52116002)(107886003)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JQNU2BbnWfYbMBN+guokUdVCh+9gQ+wTmjsj9gPgw7vur0tKCqzlAwUjhSXx?=
 =?us-ascii?Q?FtbHcUBNz6zR6zfZGrnlQktJesSUko6B3HbCAUJjIdosXd9KWef3rTbc3QNl?=
 =?us-ascii?Q?hFQyClusEeAk+XUzW+NXr3BNWtYxKjkpEn7PKLodZGLqJP6YC2JIsbCmqk7A?=
 =?us-ascii?Q?YO1gjAw6DOS61Yb8FLcnpVjoHuDo3P3C0Knjout5DN1/lGmnI9CDUOO5FL2J?=
 =?us-ascii?Q?OcqP+viaam7557OnuM9tqoAKJ1kTFDY/gKeBoPGdRShcsREZMz8kuhgXfWgj?=
 =?us-ascii?Q?HXSiKlQVuuAXoM8TVen5CZlRs0boEbXGrhlxZHLkkDMqT2OMxJjAyTmcl6JM?=
 =?us-ascii?Q?ja+BiBUkXiUhIngGYyzmmTCROx4PqsSf1fuUQjRIlzVAmxewVgqVOEsecekd?=
 =?us-ascii?Q?9FcwedsReTJEfXuiCesNqD7QzT7Sb+PyRyiRFPUpcJZpN3oT7QjQrMhs03zD?=
 =?us-ascii?Q?qVR1nTrtll5fn2SSR36Gs+DDoa+phuD8KD5tdx6+3GyN7iwlBLdVi5RF2sXk?=
 =?us-ascii?Q?SGzMD3/PXtOaJCbPQRtc6zowIxir5EbXMZao7v6CMJ4cCLBRBSk5qmzMdWj5?=
 =?us-ascii?Q?yv3s30xgL1eeJhfL6F4Yxrp4EOUgs+H5/vbz0nrhhg14ObhUTQWVqTSO3dBb?=
 =?us-ascii?Q?s4ool44NK6wHj87v7Mtpcf4dIotk5GJKlm4rIFQjJzaRwQkV3PFwp56OQ5r7?=
 =?us-ascii?Q?eCzq0byvZ9vOpVdkdF9bDwP6fs4A6HEytkqvaOUU7c5EG7JelZTkHuS4/4bq?=
 =?us-ascii?Q?rah4J6bco+8dwOmZUtd2a9MbIPXutOI7PimkeoTqu8kRZpjINrNoxZfP7Wag?=
 =?us-ascii?Q?rtwYD7NMtMfB/XFuIyzax+JPO0SaInYPk+CtRR9aLeU04BUaQ3/pfaWFkQXv?=
 =?us-ascii?Q?OJnhaxnCeAxSIWHrwe5VEimRlPKsaD9/6v/6u2aIPKNwxQo5qv0msfIQX46K?=
 =?us-ascii?Q?pxbWSLvYmFPQws/ZPdLtJyiM4kWPb+E4i4C7RbFSs7umG6FeyiZ6PwvINENB?=
 =?us-ascii?Q?SUSARInFMMjcdazDXEErk9TB1MEanHc9IEU788LhSdE71ZdiYxZKPofuk0KH?=
 =?us-ascii?Q?PCIZ4TnE42m5SxP08SZvzb6tmSM1azEUw2C+//9ESCffsMERj7TNlKpgzghj?=
 =?us-ascii?Q?ir/jXBbLgNFwNr24jzborFk63vOlsNI1G1gWN++FZREqXOfcEqDfusiypQTv?=
 =?us-ascii?Q?2VU//XTaKZNp8/k3PcamKQKReqbVFwfi31VRP3LAB81ZzWhPA0cX9g2aHjgs?=
 =?us-ascii?Q?vNp/MMtPERR+MS20wx52o1NxpDHSKcJyPiqx4YydZIsK5yUiF0Q8RWndH+Z8?=
 =?us-ascii?Q?/aRQ0TUN91J9hXlS3y9mFiJk46X9wEL/dkdNg9tpBfLrcYtXj572rKXLXudg?=
 =?us-ascii?Q?7jp2f3NTzR7sJzTuy3MI0ZZ56QIzJe2PFT6DBoOxJtom/nQ2i1kVHdc1C0PS?=
 =?us-ascii?Q?dwVYJT5y//0iqjRq/5apBI3+d9HYkiN7HOlU9Jpk5XnS99vNWpAiyAGoMBMV?=
 =?us-ascii?Q?bKNHKcPWfS/vl2I6wdp+3r0BvRpplbOHYgSivumF/mzARtG4qSfkkkgCYnKC?=
 =?us-ascii?Q?jtHXTWyfbNggfPaoOK4hZO+LeT9I3HvbffOf8wOvROA47SyBTh1XWXLRt5X/?=
 =?us-ascii?Q?/tfd3BXsw4o8TAeZ1D3vdNkODtS3Mbl46YLXnub7hsxpg4giqaA0dqWSWJKg?=
 =?us-ascii?Q?bIHvlw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f4936b-0997-4e5f-4d8e-08d9f1850f28
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:43.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYK/N9qGaIx7GC6AoR3iUNTPKhD81a+OGF49ar7EQUpIprTHH+qgMmUR0c3C8gEn21SWhyPzJTSZB+PHYiMzTeW7pMT8PqLI/tRBSz5ZRRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6856
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are on the way to implement internal-backup with fleecing scheme,
which includes backup job copying from fleecing block driver node
(which is target of copy-before-write filter) to final target of
backup. This job doesn't need own filter, as fleecing block driver node
is a kind of snapshot, it's immutable from reader point of view.

Let's add a parameter for backup to not insert filter but instead
unshare writes on source. This way backup job becomes a simple copying
process.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 11 ++++++-
 include/block/block_int.h |  1 +
 block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
 block/replication.c       |  2 +-
 blockdev.c                |  1 +
 5 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index a904755e98..30d44683bf 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1436,6 +1436,15 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @immutable-source: If true, assume source is immutable, and don't insert filter
+#                    as no copy-before-write operations are needed. It will
+#                    fail if there are existing writers on source node.
+#                    Any attempt to add writer to source node during backup will
+#                    also fail. @filter-node-name must not be set.
+#                    If false, insert copy-before-write filter above source node
+#                    (see also @filter-node-name parameter).
+#                    Default is false. (Since 6.2)
+#
 # @x-perf: Performance options. (Since 6.0)
 #
 # Features:
@@ -1455,7 +1464,7 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str',
+            '*filter-node-name': 'str', '*immutable-source': 'bool',
             '*x-perf': { 'type': 'BackupPerf',
                          'features': [ 'unstable' ] } } }
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index c43315ae6e..0270af29ae 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1348,6 +1348,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             BitmapSyncMode bitmap_mode,
                             bool compress,
                             const char *filter_node_name,
+                            bool immutable_source,
                             BackupPerf *perf,
                             BlockdevOnError on_source_error,
                             BlockdevOnError on_target_error,
diff --git a/block/backup.c b/block/backup.c
index 21d5983779..104f8fd835 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -34,6 +34,14 @@ typedef struct BackupBlockJob {
     BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
+    BlockBackend *source_blk;
+    BlockBackend *target_blk;
+    /*
+     * Note that if backup runs with filter (immutable-source parameter is
+     * false), @cbw is set but @source_blk and @target_blk are NULL.
+     * Otherwise if backup runs without filter (immutable-source paramter is
+     * true), @cbw is NULL but @source_blk and @target_blk are set.
+     */
 
     BdrvDirtyBitmap *sync_bitmap;
 
@@ -102,7 +110,17 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_cbw_drop(s->cbw);
+    if (s->cbw) {
+        assert(!s->source_blk && !s->target_blk);
+        bdrv_cbw_drop(s->cbw);
+    } else {
+        block_copy_state_free(s->bcs);
+        s->bcs = NULL;
+        blk_unref(s->source_blk);
+        s->source_blk = NULL;
+        blk_unref(s->target_blk);
+        s->target_blk = NULL;
+    }
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -357,6 +375,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BitmapSyncMode bitmap_mode,
                   bool compress,
                   const char *filter_node_name,
+                  bool immutable_source,
                   BackupPerf *perf,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
@@ -369,6 +388,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t cluster_size;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
+    BlockBackend *source_blk = NULL, *target_blk = NULL;
 
     assert(bs);
     assert(target);
@@ -377,6 +397,12 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     assert(sync_mode != MIRROR_SYNC_MODE_INCREMENTAL);
     assert(sync_bitmap || sync_mode != MIRROR_SYNC_MODE_BITMAP);
 
+    if (immutable_source && filter_node_name) {
+        error_setg(errp, "immutable-source and filter-node-name should not "
+                   "be set simultaneously");
+        return NULL;
+    }
+
     if (bs == target) {
         error_setg(errp, "Source and target cannot be the same");
         return NULL;
@@ -451,9 +477,30 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
-    if (!cbw) {
-        goto error;
+    if (immutable_source) {
+        source_blk = blk_new_with_bs(bs, BLK_PERM_CONSISTENT_READ,
+                                        BLK_PERM_WRITE_UNCHANGED |
+                                        BLK_PERM_CONSISTENT_READ, errp);
+        if (!source_blk) {
+            goto error;
+        }
+
+        target_blk  = blk_new_with_bs(target, BLK_PERM_WRITE,
+                                      BLK_PERM_CONSISTENT_READ, errp);
+        if (!target_blk) {
+            goto error;
+        }
+
+        bcs = block_copy_state_new(blk_root(source_blk), blk_root(target_blk),
+                                   NULL, errp);
+        if (!bcs) {
+            goto error;
+        }
+    } else {
+        cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
+        if (!cbw) {
+            goto error;
+        }
     }
 
     cluster_size = block_copy_cluster_size(bcs);
@@ -465,7 +512,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw ?: bs,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
@@ -475,6 +522,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
+    job->source_blk = source_blk;
+    job->target_blk = target_blk;
     job->on_source_error = on_source_error;
     job->on_target_error = on_target_error;
     job->sync_mode = sync_mode;
@@ -502,6 +551,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (cbw) {
         bdrv_cbw_drop(cbw);
     }
+    blk_unref(source_blk);
+    blk_unref(target_blk);
 
     return NULL;
 }
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..c6c4d3af85 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -590,7 +590,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
                                 0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
-                                &perf,
+                                false, &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 42e098b458..6997eccb4d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2878,6 +2878,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                             backup->sync, bmap, backup->bitmap_mode,
                             backup->compress,
                             backup->filter_node_name,
+                            backup->immutable_source,
                             &perf,
                             backup->on_source_error,
                             backup->on_target_error,
-- 
2.31.1


