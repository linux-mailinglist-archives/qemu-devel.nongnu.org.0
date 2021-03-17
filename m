Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF3B33F39F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:45:52 +0100 (CET)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXQl-00052b-Tc
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHf-0004aD-47; Wed, 17 Mar 2021 10:36:27 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHd-0006nM-2p; Wed, 17 Mar 2021 10:36:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUt+p+p0rqNL+AOM5jbbZmSMRDQsTCOPDJgUD+z8QnxtGiS7rWusD9WgjtIlQjCwBGOp+Xy64ObcS8ohxl0IHI/EV5YMnUZK5RX5eV1KyaQ/M575XxJHsPaQ9WoHQIy6ZFoBeT07Nmb70lbWGQv2/6H3MFjII00ACQ8DqDgstQmDgv8ZrcNQGm/4gqcC1e4/wECJ1Zvju/WrjazL9PK0GdkKR4BS7j48GSZ7QLHBjmhRWZnx0bu9lAB3g35HbeneEztBIw//3t25lHk9ufT4k5STDK3uUFJF0fkj6bgCnlBjeJwbbGUEIpIXR/Esb9YbMAa9nabjc2m+nfRHlH1Mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdA3xdhuqzIKtN/wS7LgVVKJD1dOihxJh06GFONPwCc=;
 b=nbT8dPIlp+hy5tKVY4FE8YQDcayLtI6FFBmWUzBdcNH9z20e/ATXQxnHnUDVVIlcRDwPLKW669CITb+z2Z5yZDvhN/vO85tTXw93o8UyCWwL8UL27O1B+EWQH9ylVzuEbVqq8w12CSKFSaUYSFGl4VT5jGHi7B1NO1jyysP9hCW1KtM76AHM7O5vA5jWfe+JTYUJuxnmLmwVC0bCGTEkm6c3pU9eTj9Ciq55HJ5Gb5pIDh2t8sUfchNLTobhMw8OySiIvlQ4TCePOfSBVhITlP/ewLVsFhjs507v5HWVlWLHBa9zbN8u5q0BW0/PNkH83zExYpchmcSIPrGUFoHqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdA3xdhuqzIKtN/wS7LgVVKJD1dOihxJh06GFONPwCc=;
 b=IaTKA55nopUHfYKPWEPoscFtPCX4wZCsiWh5rC/vku/pYrb/faFouJTL8WQ/XxLKjufxXyNCoVg+S7qySIClNRlOH8cRNxRq1fu72zeDnWwXuMaL7+pwy6qaTuJ9iD0VPbbAjN6X/MYREmd9CHgwf3nR61QGKYifmvQRYfNUM0c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 05/36] block: BdrvChildClass: add .get_parent_aio_context
 handler
Date: Wed, 17 Mar 2021 17:34:58 +0300
Message-Id: <20210317143529.615584-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9a4eb5-6da2-4109-1ba8-08d8e9520186
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16506BCDDB48C793CEE24E20C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uessEri0CYVa8x0CtOTUiGKIftxkdSdDkcidlrO2vZCxa/rp6w6mi6vZkUp/oM4RmSBS+r7mzh7QDj9x5TZJTNRuAe72hkn0srmFIbj1lZ+/7414/2JfvOy5AiK6jqVaOqa9zB0BCMEaxswW6+jiT/63HlZdawM9rQZ4NNV5m9sfZ+O18gUbsx9iHcnWzcwRruHs356ifCozmLg5UDB0lKC/nV2466xbDwvFrtp7M9+FfkrGXpdTODnGzZgHA/XEgH+JhIiCkD80NvBWNi4RThV1gmkNcA7SJ/uHZD2vRuaBjYix8hysYjQsqaxwKcfXb+H0AMFYPhvByX7pQN4tAT/oQwlta5jXc/TbafkpkSeQDzol0k0mi05fz5A2tCDBK4/EBKUMmMcTt1EEr/GUCtRZyeYrshpbLBqihFi2iz7O13Ct+kP2zt7c/8Wt+71wfNwKF3LxGWYoqF1wVubbhoVOu/z1Ct6jg2BMJP7sFveO01Kfra2RmJjXKGmNaZRShDbuUY2iYIQjgLq4y3iK53mOuzpv8CKJ2kIvPjts8tqR2madTjF7u0tiHj31/g3SPnNOlr49VI7NnoP8PksCz4XW0M+qa+U3OElzfDNMpjrH9kJ16uNcn2EV6e7FYNDWy5XdfcAZ0r4piSH86pm5Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bJlMuFdI3gurG7KUbXlSKOWxkLc1/FIenuf5N282q0oor70IIiX5uqH6ZOer?=
 =?us-ascii?Q?6mkeObErMQQGse3FmrDntvc6tWvn7w8w9Npi5xBHElIZeWnKDRMMZxhcLiq0?=
 =?us-ascii?Q?zttkPFFfrppqfyAqGkN+oJBtYbOulk9yAmbj9CYojt5JJ+efHyw6Ue453dPC?=
 =?us-ascii?Q?ID1yxl+Onap+kua9RT5p2dPyXdFJO4NrwIgaYN/8lBmLH3P55WuOXZZqCFaA?=
 =?us-ascii?Q?tbQlHTJD8ImdaaNq2Czc4zbU57MjY22WSj7X/U2d1iYVzBqeNsQE3N4lvYgp?=
 =?us-ascii?Q?VYrdT3wHQhzM3BY8eQJmsgnjMed+yKa93GFyQQcQw17Td2TK/2iE+YUoM2rL?=
 =?us-ascii?Q?Wo3a7fdpn5t/q2OalTARpFIk4nWg/hW/buBloN5cOKlzNZqTfXfVciJ8QwuA?=
 =?us-ascii?Q?dkGQzyy4sOnJadvsGPcqH9e4ylArj405fLvtfhYQ32H/XpKwdRPCeEpu2sYz?=
 =?us-ascii?Q?+73/dyR98md3Fzc/6pxI0oOiTaaj8ewvlw0MHqXOik/b2+BD9DaI7awpV5Md?=
 =?us-ascii?Q?IRYMd4jjE9S2MXuLMrTdlzX+vXEMsK3/uBluQVJDGsXpMqGzdrS0TiohMzu8?=
 =?us-ascii?Q?rLsdii6CH5s1QzBuAqPC4bhh9Had8Vr951kLJs7nNtw6DDi3yA835GfKs2MV?=
 =?us-ascii?Q?O6C+HuznHaQRJWT6tlcbsWB40716vacl+rNICx18UCCKTaMou4h/ajHu4af/?=
 =?us-ascii?Q?8j2x4fqZAs+MVt1rrZ3miTe+GhFqXPVRLBxmgsWmarEa2yRNLnug9vz0kSYC?=
 =?us-ascii?Q?lQ3Jjs6JusDms7zL53KO+Aa7xGeaRZxn99EyVH9jewwSf3CwEDiHvc3/Gm8e?=
 =?us-ascii?Q?1hFHZt61WQ1+9+gWz9pAsYWriVfxo/Eptb1bjFMSvJqwuht1UNQ+80lhgPQr?=
 =?us-ascii?Q?Ig5EIoLxFPpZNRCLA9mpOKMNrXpnnC5OWTYq/sol3wfp6geG9y419MySA3hq?=
 =?us-ascii?Q?hHjoSCU0eonjoRLe8VJHMVoZkdHLkpBi3rh+ISEEmDMsdB8qugwB8fcxOmZq?=
 =?us-ascii?Q?nO/1QcojJ7OX8vIOqXE5g0UPU9XyFd7VbDOgCMAYWwcuo6jSyGO5XmHUK9EB?=
 =?us-ascii?Q?vu0b19XXfY6MR9MT2HlubkyBdwOBuCiPh35eUD+BaRhQkh2nQ/yZH5gMN8co?=
 =?us-ascii?Q?ILjEi478Lx8J/iSDDOODDArfM/9EODzcgRcAWTYht/5wqaByXEr8vHIH5aaU?=
 =?us-ascii?Q?+ZAF/nCA5cDcrTr1VA3DEOsjZMxS8aT9wQT+puyIgiZx4gqGtRMQe+9wQ/pI?=
 =?us-ascii?Q?cO09QF6eJmgQRrJaS6apW/SAsFytZMeZiQQ3swWk92451p91oaoCXiKrZYiz?=
 =?us-ascii?Q?9Os/f0FSRSf6w1ox/13DSfQG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9a4eb5-6da2-4109-1ba8-08d8e9520186
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:09.7012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMcQY7runz+QdedZ/GGLeFqDBMXChephB9202JqrTDtCCzhV8EQ8ZjJjOM+xaMYq6h3sCThZkM7hoN52FabB+az513Cr7xlN04JazpybL70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Add new handler to get aio context and implement it in all child
classes. Add corresponding public interface to be used soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |  2 ++
 include/block/block_int.h |  2 ++
 block.c                   | 13 +++++++++++++
 block/block-backend.c     |  9 +++++++++
 blockjob.c                |  8 ++++++++
 5 files changed, 34 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..54279baa95 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -702,6 +702,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp);
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..737ec632c4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -789,6 +789,8 @@ struct BdrvChildClass {
     bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
                             GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
diff --git a/block.c b/block.c
index 297a4f7018..2c80fc1639 100644
--- a/block.c
+++ b/block.c
@@ -1360,6 +1360,13 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
     return 0;
 }
 
+static AioContext *bdrv_child_cb_get_parent_aio_context(BdrvChild *c)
+{
+    BlockDriverState *bs = c->opaque;
+
+    return bdrv_get_aio_context(bs);
+}
+
 const BdrvChildClass child_of_bds = {
     .parent_is_bds   = true,
     .get_parent_desc = bdrv_child_get_parent_desc,
@@ -1373,8 +1380,14 @@ const BdrvChildClass child_of_bds = {
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
+    .get_parent_aio_context = bdrv_child_cb_get_parent_aio_context,
 };
 
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
+{
+    return c->klass->get_parent_aio_context(c);
+}
+
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..3f656ef361 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -298,6 +298,13 @@ static void blk_root_detach(BdrvChild *child)
     }
 }
 
+static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
+{
+    BlockBackend *blk = c->opaque;
+
+    return blk_get_aio_context(blk);
+}
+
 static const BdrvChildClass child_root = {
     .inherit_options    = blk_root_inherit_options,
 
@@ -318,6 +325,8 @@ static const BdrvChildClass child_root = {
 
     .can_set_aio_ctx    = blk_root_can_set_aio_ctx,
     .set_aio_ctx        = blk_root_set_aio_ctx,
+
+    .get_parent_aio_context = blk_root_get_parent_aio_context,
 };
 
 /*
diff --git a/blockjob.c b/blockjob.c
index 207e8c7fd9..160bf38b19 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -163,6 +163,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
     job->job.aio_context = ctx;
 }
 
+static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
+{
+    BlockJob *job = c->opaque;
+
+    return job->job.aio_context;
+}
+
 static const BdrvChildClass child_job = {
     .get_parent_desc    = child_job_get_parent_desc,
     .drained_begin      = child_job_drained_begin,
@@ -171,6 +178,7 @@ static const BdrvChildClass child_job = {
     .can_set_aio_ctx    = child_job_can_set_aio_ctx,
     .set_aio_ctx        = child_job_set_aio_ctx,
     .stay_at_node       = true,
+    .get_parent_aio_context = child_job_get_parent_aio_context,
 };
 
 void block_job_remove_all_bdrv(BlockJob *job)
-- 
2.29.2


