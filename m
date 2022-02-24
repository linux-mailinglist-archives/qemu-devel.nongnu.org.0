Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309384C3359
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:17:24 +0100 (CET)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHk3-0007rx-AA
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgt-0005do-3p; Thu, 24 Feb 2022 12:14:07 -0500
Received: from [2a01:111:f400:fe1e::726] (port=14723
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgq-0005pu-NX; Thu, 24 Feb 2022 12:14:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaCIlnQLjIDvnYpF1D+w37nBWUHK1S/i4EQruM1EOn6BYZUMVyH8CXbHVa3waZhK3I++BtwO/xrWstgaQ7hSal5swzvZVDGUGpVymfALDMwV3fxrtGhzUYZnVUzaACSnvwD1pQgNFyOo6F4RjdoLme8yZ06HCuKzFmqF+O/I3kNUQtjlkKEzUYp4vMktqvKfMgYZzt8A/mftWesi1U+FVHxLrJlpx3An1wfpZucx5lvn8uXd55/sAUTXod5EweAn91ZqZxHXlwyM39ao0QFbrERXsunIkm3OyPeo4BypkeJRyHnTRi60E0bEBIMxQLOcteMDN3tfaCgfJxMKa0J1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PEIUGCBX9t1e2g5owSOOuCbnMvA4gr6n9U2JaJhar8=;
 b=WgSSSjaljyuLLC6sT3xl1LbeTjDSH2jMMeKQu//wb9O8JjC9UDTJlwojSaNfvcnyD+leWLf3Qo/Olq63Ycb3lkTmtvY5U21uvDc/8zwIvdnwvfyuAItMFULYzmtXaTGmKtJPvYklaDs0+DDaHh12T0xZ2PlFQb7MEPIFwYXvWbOWUEtqcbJM46YVbwefOZi/0WUI757xEfXc93UlSBiSRFYajKYSWATkGpqKxcguKBJkS+YFvwYjEMUcuojZzqTkfHTrihfi+coOvAHTUglDm7ehDfzP8SOSwiC4+wG+tGFTYmFDFUPZIpaWcyrqs66/OuugCIe+sRvcLlD6NNkQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PEIUGCBX9t1e2g5owSOOuCbnMvA4gr6n9U2JaJhar8=;
 b=JFG7tZ/TGCabAx1APmw0x1lX5YLk5k1AWI1N7cAEdg6zXEFNB/xtWab39bkJl4rrmTAvgj3/M9M8wtbxcFpgj0TTSTMP7t6z2w48WKO+jXN5hyoNK00lvhDcpKrunXNCZ910cUPWO1+zEoc7Uz2EbH3r/7XwgvqxO2Ngj7DD8jQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3197.eurprd08.prod.outlook.com (2603:10a6:803:3e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 17:13:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 17:13:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 1/2] block: transaction support for blockdev-add
Date: Thu, 24 Feb 2022 18:13:27 +0100
Message-Id: <20220224171328.1628047-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220224171328.1628047-1-vsementsov@virtuozzo.com>
References: <20220224171328.1628047-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1acca4f6-453c-48a7-1624-08d9f7b908cd
X-MS-TrafficTypeDiagnostic: VI1PR08MB3197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB319700F0F43540393BC4B662C13D9@VI1PR08MB3197.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9NiMzOWQ/OmwpMnhLJAdx2BT3RaGamphQB/Lv0VXp7c2UMfmktkDSWLntn5MlIHAuKvjC9XQFT+ziVd1H7pkM8J/vUP3eFuNvqiOzD6kOwTAXcfhxRTs9VK3YGtKRuESlmnRLAxK3r7zleMm5qnA7QqsBOBT8/76K5VphBobpzMeDma7BNkumxVxc94faM9P5s1ZfCxtC9/urCuNpM0x87Xe4jW2z9idYUtC/dPSQGRgINRQAxSTX/odzPKkPW7DNAf+7NPHFaRbpGEnb+xGYF7r6F16TlKDHKhpclCMYmBKCtZH5gev3RqaJ8+ZYUqs5od4d5Q1uDIjfHxRew/c8a07KjbaFYc0Pmxf9HOB1wFrlA/CI/bxn8bNgJEzU2IToH8PxSsAxz1NdQPVA5viIKsGM0wedEaHQoFWKheWsQTAzWETimR8Wp8EW9qJX9iexrThq4iiViLcVq85kBxlvMHo4TnR/TT7B0tt8dbKrgd2CK01x2mxGsBUEBYGJqA9jaBQTCFAwQD3QzSnyz8LqTPK1P1S6dqo4nUiuCOfMIYyT4uPG5inI/Lp+QxNjEhOH4X40JyjrWxAxntGsSzbni7zE1YngvENtXfwrJ1cO22+m2EksZw6JVxvAxyl1fe9Ml/lRyuMQa6DWoTJQgttNzJmEUwuSP54ITmhBa+u9AST0esAUHhIXW4RzSw+bimOTEwQO95PBHEKmm/069SEww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(52116002)(508600001)(6666004)(2616005)(86362001)(38100700002)(38350700002)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(316002)(1076003)(8936002)(107886003)(26005)(2906002)(83380400001)(186003)(6512007)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0xRfNxtJ5CG+y4lC9i6HttCA4nOH7rEJ36RVfbNGDuLhv7MldvxvZsooiV0?=
 =?us-ascii?Q?3q1fwLMkeWEjMfTb2pz/WgfjnvfNUjDVOTsWNJm41UrD8imoNdkfVY7lPIG6?=
 =?us-ascii?Q?eSvFFFlvTShFUNsv+Ow+qiR84/ycbMvgy05VyQsbeZuxznInHglpYRndxoQU?=
 =?us-ascii?Q?7hFbq7DHyykTDR/ltosY+VUx4T9UQZCMnps1migkkMCmTFNRBQhuhsId6n2V?=
 =?us-ascii?Q?JYd07Rb9TpJXvhBr/QwM+w5JboR4mwkjqqNf+hR6NxHNcTFoAQzkerrjWsek?=
 =?us-ascii?Q?JF2dKzc1ZsqqNtOOMpjtgjJ6RlQecfI75bQ9StP7VDrM2kbSNkJ9EBEe6J4y?=
 =?us-ascii?Q?TeAQJ82jKf9nxBIurZqhGFX8T5IKZ2bddBuntcKF7YsUEL5+2UN2A6/F1CWa?=
 =?us-ascii?Q?UJFw5MSp33HSi2T7X+hg/YN0rK0DM5DPagqAhG34UTJ2sEVKhUXsNajckwRv?=
 =?us-ascii?Q?Tmjat5vcm1PaZz9MUtseBEMsUWSdzi/NkBUKOUeRJ4CDbWyWgTuRY335qNHP?=
 =?us-ascii?Q?OdkNRn8dFYEaCKc7yIIICsEJqsTYzYV1j6+xNUJj0IBG8qynf5n8+bqVboFR?=
 =?us-ascii?Q?QaSNLBioDfxSKPzwLvKOZCvbm15whGBEMMGqUNjrDjpFdWTUrxYF0jEVZ8Gq?=
 =?us-ascii?Q?05DbA0mseIDfexMEaSTLPc3chMaR1o7SiLSkgUlvj0ZosbGFcj6G4xMksnFo?=
 =?us-ascii?Q?UFQMOEVCoeI4EbVxHRHAtIJcFnjgjSNbt0jD3aSzbgpw838HoqKf4psL6Nwl?=
 =?us-ascii?Q?WekKMG+YxQslX3KF4gJ4aNiZZOoCb0ySMGd0Ym3N5KK/TmTv9AM6TWdMtaEF?=
 =?us-ascii?Q?Azf4TTAelnZEaiIy0bZ0OihSZs7/KCWwapvc03LAF0Yb3BSRbWuihFF1BZRZ?=
 =?us-ascii?Q?FeOTMMWxe3saKkLvdjijBHNVlplvLTJEDbhf3UWzvGUBuEICSC4J2OovzxLo?=
 =?us-ascii?Q?9kRDj7wfG6wfFSp715MmEREVGeeFYA8w3R5xwRPmiQHKQRTdz3kQucRrggZ5?=
 =?us-ascii?Q?IisFWzvGChbppkdCGq1Xv45q3xxcV6YMEzMuxCT+xeHqb2qX2w7J5+noDalL?=
 =?us-ascii?Q?1vJoh7rF/IobiFiJJmNDV++hNDYswKqTuoHR8OkisE993KohO2/Wm8UfovoQ?=
 =?us-ascii?Q?2Gn8ZkcN442Txd7vK1xXD0JriGBQ7iI3J60xOn89zRT8JTuBRkMMTwgZL84Y?=
 =?us-ascii?Q?EieBmifVQD0ehu1MH2ekk2VO6BiU4OROdbuDhWvVobViOPLcAzejkwQVyCOC?=
 =?us-ascii?Q?6OYYtt5VQfTYYNZCve00qRQq8dd8rU6dDMo6Pnl23D6Xnus+WPP2FD9sQnNB?=
 =?us-ascii?Q?kLtt5HCclv/e3ZNWcVr4pCOpu48jWCTAnkeF+4hh5mMBebUbcOwF3wOVhiMe?=
 =?us-ascii?Q?6Qj6e4uttlqs6wte5F2zPJmmI0YEmwMFgzZ48fT4DK10sTrFUCCMIDT7zsAG?=
 =?us-ascii?Q?ergEbHSKI/69JrfSdjfOajd20ptfGgcgU2fJB6ZJmoswxDvmAuG0uNsjXG8V?=
 =?us-ascii?Q?JK+T2ZMn/3gtOe2eCn1JED+intl2u+MdV5pg4pgnUtcZcz9JaRDLG1UVYJq7?=
 =?us-ascii?Q?mfy0X7+NOW8BzzA8N2CMktkvDotihwBWJNy+ET3w7G8KzyF5tedk4E+wsQup?=
 =?us-ascii?Q?fgaoQTvQmn1JBk5S+SNAPb2bnPsKy4+GiSQu6WXDbdgSp3rKPQT3hehFJI1L?=
 =?us-ascii?Q?CNZEajT+UWeUtTnMLpfx9Nzz7F0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acca4f6-453c-48a7-1624-08d9f7b908cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:13:54.0022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LhGpf/sR+RwTS/iJl06bTOFENUSWs4uXlJzaopt9UKLG9RxCrmYt5oyGubqUMsuDLvhNY03F6NGvc9D516WfKcoFiDlywXMC/9c6HuPHc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3197
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

Simply do blockdev_add() in .prepare() and bdrv_unref() in .abort() and
that's it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/transaction.json | 11 ++++++
 blockdev.c            | 80 +++++++++++++++++++++++++++++--------------
 2 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index 381a2df782..a938dc7d10 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -53,6 +53,7 @@
 # @blockdev-snapshot-internal-sync: Since 1.7
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
+# @blockdev-add: since 7.0
 #
 # Features:
 # @deprecated: Member @drive-backup is deprecated.  Use member
@@ -66,6 +67,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
+            'blockdev-add',
             { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
@@ -140,6 +142,14 @@
 { 'struct': 'DriveBackupWrapper',
   'data': { 'data': 'DriveBackup' } }
 
+##
+# @BlockdevAddWrapper:
+#
+# Since: 7.0
+##
+{ 'struct': 'BlockdevAddWrapper',
+  'data': { 'data': 'BlockdevOptions' } }
+
 ##
 # @TransactionAction:
 #
@@ -163,6 +173,7 @@
        'blockdev-snapshot': 'BlockdevSnapshotWrapper',
        'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternalWrapper',
        'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
+       'blockdev-add': 'BlockdevAddWrapper',
        'drive-backup': 'DriveBackupWrapper'
    } }
 
diff --git a/blockdev.c b/blockdev.c
index 42e098b458..eb9ad9cb89 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2180,6 +2180,55 @@ static void abort_commit(BlkActionState *common)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
+static BlockDriverState *blockdev_add(BlockdevOptions *options, Error **errp)
+{
+    BlockDriverState *bs = NULL;
+    QObject *obj;
+    Visitor *v = qobject_output_visitor_new(&obj);
+    QDict *qdict;
+
+    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
+    visit_complete(v, &obj);
+    qdict = qobject_to(QDict, obj);
+
+    qdict_flatten(qdict);
+
+    if (!qdict_get_try_str(qdict, "node-name")) {
+        error_setg(errp, "'node-name' must be specified for the root node");
+        goto fail;
+    }
+
+    bs = bds_tree_init(qdict, errp);
+    if (!bs) {
+        goto fail;
+    }
+
+    bdrv_set_monitor_owned(bs);
+
+fail:
+    visit_free(v);
+    return bs;
+}
+
+typedef struct BlockdevAddState {
+    BlkActionState common;
+    BlockDriverState *bs;
+} BlockdevAddState;
+
+static void blockdev_add_prepare(BlkActionState *common, Error **errp)
+{
+    BlockdevAddState *s = DO_UPCAST(BlockdevAddState, common, common);
+
+    s->bs = blockdev_add(common->action->u.blockdev_add.data, errp);
+}
+
+static void blockdev_add_abort(BlkActionState *common)
+{
+    BlockdevAddState *s = DO_UPCAST(BlockdevAddState, common, common);
+
+    bdrv_unref(s->bs);
+}
+
 static const BlkActionOps actions[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
@@ -2253,6 +2302,11 @@ static const BlkActionOps actions[] = {
         .commit = block_dirty_bitmap_remove_commit,
         .abort = block_dirty_bitmap_remove_abort,
     },
+    [TRANSACTION_ACTION_KIND_BLOCKDEV_ADD] = {
+        .instance_size = sizeof(BlockdevAddState),
+        .prepare = blockdev_add_prepare,
+        .abort = blockdev_add_abort,
+    },
     /* Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
      * these jobs do not necessarily adhere to transaction semantics.
@@ -3499,31 +3553,7 @@ out:
 
 void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
 {
-    BlockDriverState *bs;
-    QObject *obj;
-    Visitor *v = qobject_output_visitor_new(&obj);
-    QDict *qdict;
-
-    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
-    visit_complete(v, &obj);
-    qdict = qobject_to(QDict, obj);
-
-    qdict_flatten(qdict);
-
-    if (!qdict_get_try_str(qdict, "node-name")) {
-        error_setg(errp, "'node-name' must be specified for the root node");
-        goto fail;
-    }
-
-    bs = bds_tree_init(qdict, errp);
-    if (!bs) {
-        goto fail;
-    }
-
-    bdrv_set_monitor_owned(bs);
-
-fail:
-    visit_free(v);
+    blockdev_add(options, errp);
 }
 
 void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
-- 
2.31.1


