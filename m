Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC1336DBB5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:33:10 +0200 (CEST)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmBZ-0000Aw-UL
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxi-0005lX-Ka; Wed, 28 Apr 2021 11:18:51 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:17025 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxg-0001uP-Io; Wed, 28 Apr 2021 11:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nwa+mEYn4xwcmLmXdgpe2rEUBUcvKRfAyXqWuy6W5eEAB5N+JMlzKMl6v9JOy3J4E16eBhXx0eV6DSomWx+uew/5G6aPGg1M+4gqWsGtMruKrpLZ/Xny7EXuV5P837cUtmAtBnv7KEb2Nqadg/wAAZACP9gBRY/JYXCURWB7SeiXhAomLcyK8Sf+HJE2dFVz+fwKLASTVICjL0C21pj6HYix0jsjqYDmzHoxF2JVLwSmxNVFiaQlMGO0+d5ylJN3nL45B0waJeb1UlaKAf+4I2nGEoHu+8rN8Z3+1TeeVnUa85+oWV7w94JYRggUc+Epxwqkvn92Bl8o/LRLpbwaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTxNDb/H5pG6wn4VlXrTlpgMuCCoiDfiJ6xRPS/7nn8=;
 b=mBVAD/AlXw4ZXnScNyNh9ZHmVjrzpOboE7OT3fmbYCXVTyM9BZ3FVfBb0CHztUPmKL3AFODCmJ8DAJdRQtb+wv6/8Gk93w6S/8eFaznZkGfDkwt29NufyPSAcFgnyr1nIWevmyjy9g+B9C4htLzkFFRHl02m4iQjqBc1vrQSsn8Zut2ma3/2JbZiFbJF6+FLaOmt8eVdWzz79f9KIjSW1Z7+opxj+8VOWSEcSt6jd+AzD99DW+9dL/8kyUOnqQ1H/oiBvjiqcT7X4SyFH44uWDPwboLvxAVdvTDGlyGs+vRxwtf4c/zMW678RMyGqwpb5iQXnAmsEPyNLAgFrg5PXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTxNDb/H5pG6wn4VlXrTlpgMuCCoiDfiJ6xRPS/7nn8=;
 b=gkoaNNMQ82GyWTEWzsWvsc8ReeLOohA9j7FqQlkDBEMMqc38zASKWOkJD+q6VbZ98yZGkpNvf82E4Ir6OoQoy+RrTUJL2AG7waceXnzJ5fZsDZdXFekjmMQG1APbapfYdYZcs5LeEA32zCATu3pw+thGN3w3kQW9ynniRDYgGrQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v4 06/36] block: drop ctx argument from bdrv_root_attach_child
Date: Wed, 28 Apr 2021 18:17:34 +0300
Message-Id: <20210428151804.439460-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aa9c5e3-563f-422a-9a2a-08d90a58e047
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB590980D67862A5AC6131BB28C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CaJKxd5YAbQwplqd6oOG6ThXJHrjr7792uWOziX4tCNQmSdnnvjXNXabAP8fIhWOa5GPZlXZlTE8jTPOC68mbwYvtKHvuvYzoI7PpN4jvNPLmyql4AKLlnm2qUUx+qbgow+savVubWsPk8X9FVIdZDCwVxNNWrzOHUGIhmXsrTQiLtufrJqsv/kaI4zfl1Gx6ZEjzsQNZ6V8s3IAwZpJRj1XwK8nPC9WDbhQNZG7zga3vOHylObC/uHJbbxdDBusVGUi1ActCGv6O5gEYEkaw9ao8tqPY6PfyuTOI9AmGzRpnaYU/PxvuExFpjwKGb6fOviYVujQPFqfmuXGQ4u4xGoI35SG6furdqWsU2Kac2t4jmhReIbdLNrfhGtiUXjni89JrU/rb62Qykl04fRQ3KndvBNB/LYzRJZX6Zawzo1o3tLmZn6FgBMxPf3Gg4df+wXIJiC5ThhjO/o+oeglOO0WfPaGUSRgIRyqQbKYYeYqIib1sRN/iSD0v2ghNfrmovub48lXuPm//kjLzmlzFlc5mU1F0pK9NXod2BqP4bGwjjh/u8/eYZ7oNdIgEjcneFtIv1wpf+a7uzGnX+k27V8ekUprDzDfXUTlE55LCDBS1+2BnQwosUFtL48l7bFL3UHvY0p7L+ROBImk0Zd2c7ozdcX+3ntxOEaNj+qrna4WXokLCqKvDJPyUI15BNVz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?az1kdouxkF1tO69tbUBlKPAIDR5z+rPZkqRFefY9vHvFmAroao81Wn+dYekS?=
 =?us-ascii?Q?06uXts71BmNLoBI6yXl1pJiBI3+6ZQ6vzXH5qw00Y6J+7I6UQ31LUsiTnTUJ?=
 =?us-ascii?Q?jxXfUf95HUP5MFs0UjaMoaJKAzRZDsNzOaGXlqe4svLCbkyoEnP7Yhowmvi5?=
 =?us-ascii?Q?9bDLIWR9+VcXYLwvw8PfjVTuGb4zRpe+uMa15GN9AUA7cbGjTflzS3J2slqY?=
 =?us-ascii?Q?zykGLkfozbYAGxf8cPlrbs+cNFiSwSWZEu/K0tdV8+hzGb99h0anhyS+Eoix?=
 =?us-ascii?Q?GV4KcPDBW/CCPzVoAhXddIBjltjPgIUs8wCYwkYmwQr3c5Q5u8cLEx3+JBOL?=
 =?us-ascii?Q?zXBA9q/XQflKINCRp0kZmp7fPB5X2ZSDobdWG6NWARyXJQUgqHppDxgdeafA?=
 =?us-ascii?Q?9FVVWnYZ+oXmjs2DT0PKWxYc1gkIzwIp/HF9iZ7f7S8V8l7hZ9cp0EAUnN2T?=
 =?us-ascii?Q?kTpLcR8OPeEfhvRw1HR7Aj66GCRL97GQDXJ0fEeBwpGajuE6XfJjzvoEnU96?=
 =?us-ascii?Q?PO+w9X0IN5kzJlbR5kj72i+icqIXyJXWNrbQZkxY9VK9rcKGOQJ56E8csVL4?=
 =?us-ascii?Q?QA6CSmfcZTf1kaON0KXhFcKnOkG6BWlCSwMPnU8Foxk3ITc3oxNq7Nfz9Om9?=
 =?us-ascii?Q?NTskTIayq9N6bykhcxwmC/vJ+K9dlDa+5jSaSstnP65s7A7ZK0Y6ZMntR1Ur?=
 =?us-ascii?Q?TSLyYdG7qYFUmS0pJag8ff8o+2Nttkd+uVpx+MD9eU7TVTwoHWAD7YeqTN0S?=
 =?us-ascii?Q?Cpsx5COBE2VkQVW8vppyud68y9+rFSYArzbHv+zoO519ughVhkUG2L0hbNxR?=
 =?us-ascii?Q?gP9xDKzdOgFD/4DZgGh9W0R3TbeGzssu0e24GGMN6HNDyShAAmkGhz1zrTIE?=
 =?us-ascii?Q?B/eNat6CNJsAlEh+E6oxjeS/oQ4qlbwSBDWuB7+jCv3pf28cngbn414+sf9A?=
 =?us-ascii?Q?p9G+GTreQR6dH9ISGU2n+6RHBsg9/5u7iw8HptNCr31A8F2jn1eTydCxMvdP?=
 =?us-ascii?Q?zXRk4jjN1n8lG63IwDRCUvRs9G2lFkq/tfHPUtje8m2N9KG8uORA49hq6eYV?=
 =?us-ascii?Q?bMD4WgQJ113KS0yGZb0vfvdtfoOnWW6M9pCcywCINrSfRVxKvdpDD7ILIKF2?=
 =?us-ascii?Q?NGZA44REj3vTiCmCLnJtwh6ko5nu8RoY4eDtQITKhmU4kf3suDGB6TtFMwMT?=
 =?us-ascii?Q?Cffveh2AlmMEQcUQsjTdnKcoeyWiCOGz0ZFMpksKtpOIEnzzzLmBrk6ynI2+?=
 =?us-ascii?Q?oXZSLqoDACcGHJk0lXOY6MLq17/OU65NblnsXky1QmpgC9Tsr8Aes8Q55H5R?=
 =?us-ascii?Q?gAan7a7HeDXX/IUeQg26zSsL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa9c5e3-563f-422a-9a2a-08d90a58e047
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:28.6964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQJTmTDvUYeRNWRIwNYxjezJNbKrcTsoFS9KBMEBUqFbBwTG16TnXIK/owEzEhbn32rCBo2JNOctvV0dcd1tet08kltuHco8a/Tnwd7rdBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Passing parent aio context is redundant, as child_class and parent
opaque pointer are enough to retrieve it. Drop the argument and use new
bdrv_child_get_parent_aio_context() interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 1 -
 block.c                   | 8 +++++---
 block/block-backend.c     | 4 ++--
 blockjob.c                | 3 +--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 737ec632c4..dd2de6bd1d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1308,7 +1308,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
diff --git a/block.c b/block.c
index 2833912436..54436c951e 100644
--- a/block.c
+++ b/block.c
@@ -2700,13 +2700,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp)
 {
     BdrvChild *child;
     Error *local_err = NULL;
     int ret;
+    AioContext *ctx;
 
     ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
@@ -2726,6 +2726,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
+    ctx = bdrv_child_get_parent_aio_context(child);
+
     /* If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
      * try moving the parent into the AioContext of child_bs instead. */
@@ -2786,8 +2788,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                     perm, shared_perm, &perm, &shared_perm);
 
     child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, bdrv_get_aio_context(parent_bs),
-                                   perm, shared_perm, parent_bs, errp);
+                                   child_role, perm, shared_perm, parent_bs,
+                                   errp);
     if (child == NULL) {
         return NULL;
     }
diff --git a/block/block-backend.c b/block/block-backend.c
index 3f656ef361..e4892fd6a5 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -435,7 +435,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
+                                       perm, BLK_PERM_ALL, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
@@ -849,7 +849,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, blk->perm, blk->shared_perm,
+                                       blk->perm, blk->shared_perm,
                                        blk, errp);
     if (blk->root == NULL) {
         return -EPERM;
diff --git a/blockjob.c b/blockjob.c
index 160bf38b19..2fe1d788ba 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -229,8 +229,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
-    c = bdrv_root_attach_child(bs, name, &child_job, 0,
-                               job->job.aio_context, perm, shared_perm, job,
+    c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
-- 
2.29.2


