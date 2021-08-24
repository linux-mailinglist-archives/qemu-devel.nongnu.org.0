Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EBF3F5A43
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:58:49 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISGd-0008Aj-U7
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyQ-00037k-Q9; Tue, 24 Aug 2021 04:39:58 -0400
Received: from mail-eopbgr50092.outbound.protection.outlook.com
 ([40.107.5.92]:39447 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyO-0007cr-Vp; Tue, 24 Aug 2021 04:39:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KL45JxMMyPceO9BOQUrVv0ju/g1UQSHbwQfC4QWKij5SMSyPtbnXlz4Vv56D/2eNf3x3T14Ws6o8jCdpEtzXhnEtKQl1K9RPE+tdy4ElrA7ndLzIp8siNgjFG1Gis43DUd+ZRT+GlWeGJFeUInN+GmrOGYRm8MLltoISXf9aHAoHQ9vi5dBOepdRox6B+576WQ2rumo+JieGISb1Zmg+laXOG6YN412WSfucNhN7o1rwwufYv4PyMkfiFOaGb9tefqcu1I2zkD9xR1yrSJ6VAgbqTfTBA7kuCLBSutagqQLsueyq+tDl8W68KaNjK0CU6n8UtuO9W4dNI10K4Fjjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=DSm1nOCdIfWvMF3LL+D5zTfmv0Xn36HjRjnLw+EQEBCyBpgdwkogT8pxKQHe4mjF4Bt1q0+TxIWX4FdgSpOIQOxiNCehsLrLyx/JRVptjUl5Pe9lpcADq2bUwBZ3AecKqsjdIM49Q1iblJxOdNotEX5oT3x0rW1KLFxHoCyzTK1eGw5jXA2IpvH13uZtH5uNzoOl1RE4qlp+I1EQXnc5L2cOf5/GCjdA1n2BNmzkFm9Zys703VO475Ka1fXIaN7I0oHyjiO1qwT4Av2mUgtdBv60tc7Jov74yBsKpbfg+v3JFnVbF3NDgJxlxf17VjJajjUPNbrWPFnwT5PjtUVQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=eoshUdlInOgXhzzT2v76PWYa02zaM7KaUSu4mm7mlWPGHz1jlFgOCBorKSa5x8JX0wPYADIWkTDWYoaJwLy6g5SP34WLRx13cXEzkrw8/iMgPhuFBHKSvkRJTYyj/HkzOll/HUizTKBHjXnrio29OhFEP1bshbisszTgROfry5g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 19/34] block/copy-before-write: initialize block-copy bitmap
Date: Tue, 24 Aug 2021 11:38:41 +0300
Message-Id: <20210824083856.17408-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8fb34c0-d425-4ba0-1761-08d966dab8d1
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53339DDEBC8DDAB96713D5E1C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zfHUi2liljEAPfb0wBUWkGIjq+hA/FVvV0mx9T3NZRkmsSRNj41iBD4fZDxlGXLhgWLbfjP3pDf6Zi9SiZlFXDMsn6aFScD+1+rD+qRvcxAZIftdlVHbXM2UfKXaPhPMVdYwvzmWkGjbNtKloEx9APVt8Mb5ZmMlxEQdgBlP+igHMKYcT5s/86i/EJJJTFexmA9uZy7QWSHRjtgAezGoYAU0rKUG9g6tYrP+ih/9NAITTQ9rUzm1l4Gcq5oJjrPXWBansx3ciDIPts7XtVNuXE79tqfgiCYlzzotH6gmtLHfpSzgkgEQG/vUY2hxH2Xlwi/Eqfehyq9+Knz+W0zd4P/OGRCGnGJLAf5L27m5WjfCbR5SxbVMPxxZcmuBYOHBCmIsZQlQNcZEqZUL6OeXaVwtYRD1B7YEXOTxcAl1BRCGickZOHXvUQBNHCcYtawxg1TUTrSEwEKnigUXL6XXVLq1Dn/Md9/onwGRSzIAXBuTlXhKaIAKuS2bFCTMiX/jagRGeUOp4otgE2HXeJ2vtenclBBRc/PbTsdhHn6pZmg5N4eUTXwrDAtJTgFDZP/NQhNnVFKMKaapDx0drwJz0QBg7WFj3WJYNxHomQAskvI4wQiRzAIAXMa8S6qgqxBX2+fMjTufwbgclFLVaoUzqNIwodLe5UfpaCw4/s1udTm5+AGjinSd5Dctn/AaZtzbZwJsIQBmrf3DNZzXCDY7Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oBOc/k5SEh+1zl6ZOSngnRj0IH0wg2gSYpG09yzRJT/LfzsMy+l1anUbQlSh?=
 =?us-ascii?Q?7BbX2igy3GPUAgjR2abCV0n2xySx+BA1XIuyTBLxA+Gq4++hTxY8A4qEBM2p?=
 =?us-ascii?Q?IizHX2xKI/apwrTfqAN5nIgNVpCaNx7DPPJf4VmG47P6Zy2HdkQtDXWQoHeQ?=
 =?us-ascii?Q?q1/9f2UV66vVvMpV5N2/j68YkcbR9op5WhsgvYsfNwzGlgrvOuwK/Ip7JV8k?=
 =?us-ascii?Q?yo0ab0BtxqFoqiTyUr4fQ7M7ivnL84Sp/7jeYfrBnaOYHLe9AzhKK/+aQD4a?=
 =?us-ascii?Q?TxVDiHumihyJWsQiQpe3hN5E98hoQ+xCb74OT+npsZzJ9zzAh1VofobEuJUX?=
 =?us-ascii?Q?1b7e+9//ETmINLc60a/FZHP7LxQCqIaTzUmiIjmUaGLg4LS+EEE8Avfau+Y4?=
 =?us-ascii?Q?hS4e1vf4LY+D38qb4gVdzOoCq+F7X+fRbeCRgf13QzrZU0Btdwko2rgf0Z2w?=
 =?us-ascii?Q?mE6vT17TrlrkkCKk/ZJp8ekVRfcMtPKPIcVdP148uKR+naDcnhPbo+cRCRui?=
 =?us-ascii?Q?JuVNHmo6eZ6BUTo6/4IRHXYwat4Qi2DAJHDEK79i9dxlmU0yPnzsu7aKgjh5?=
 =?us-ascii?Q?fA9j4iwFXY8pAUKgJ4iA5PeaFJABOIoACbRxsFQ+0gsL3oYschuM6OfpD7TI?=
 =?us-ascii?Q?QEJaA0gbU5yCV2kXzbOFWb+nlEgXmiwIi60T74b7AFpo6EUtrzYX+Q2pkuHZ?=
 =?us-ascii?Q?GtmtwMVSbsnEfwY55/dDxCDlmwcJZ7kpUef9f6DSAq0qehR9AK6OSVk9hhZb?=
 =?us-ascii?Q?SQdN6MAoLxXhpL7dBHEzqkQdNW7xzjDMnlMS1ZtsmhEDj77ev8plGhrvuioH?=
 =?us-ascii?Q?AX/f8a/EU9r89zYtAvNuN/lsnii+WgoZmQsGfl4gLRoknwFLEBnRoQHPOnik?=
 =?us-ascii?Q?tKCEKLjfeCyc/z9ftKt7FSZFk49ZpdueSvgft/LbZhdTvq0JYXQ4eIlo9Eb3?=
 =?us-ascii?Q?UcgAgDOV50as+W4gQxW3qXxHEIZfv4zZuhRGMEuzQmZQuu55XgbqoqIIa33C?=
 =?us-ascii?Q?/OqYyfQwyL9uBa8VxMF0QOsd2W9JdLwab8dCikZUDSj+qFOa/Q+PWnd14JwJ?=
 =?us-ascii?Q?n9zNO5EprHZ3sU33bOq9mEiZ215VQuQhG23fDoa+8XAfnXDDt2qF3xnlzrl5?=
 =?us-ascii?Q?jb9AvOrTdXraQQTbYcmYYZkX9met5oBefHGEShfFEESGvuVmXWByyzz1gW1Q?=
 =?us-ascii?Q?E0zaPXs82X48zqmcT42nZWexsihV42iWuJ69kGvUDPOgPgVqZGcyTJ6OvwLk?=
 =?us-ascii?Q?v2CrtpS1uv/6UMayE3l6fOSTCMHAriBW0D1cGQYf9RjKO2ysgUr/o4m0Au5D?=
 =?us-ascii?Q?k+cCEieMjDgeadGqkqPL9jwQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fb34c0-d425-4ba0-1761-08d966dab8d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:44.0464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvsWXTq6d/3DdqtMDL9Mcf9IBCDRmzpnrj2syFa8EmQDaW43DEEOx/xQ9Q1F8t2zzAiwlHn5uJ3V2hBuZMaPD1LRPse/HONqYWBvrHPW/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.5.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter to be used in separate
of backup. Future step would support bitmap for the filter. But let's
start from full set bitmap.

We have to modify backup, as bitmap is first initialized by
copy-before-write filter, and then backup modifies it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c            | 16 +++++++---------
 block/copy-before-write.c |  4 ++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 4869f1e5da..687d2882bc 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
+        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
         ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
                                                NULL, true);
         assert(ret);
-    } else {
-        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
-            /*
-             * We can't hog the coroutine to initialize this thoroughly.
-             * Set a flag and resume work when we are able to yield safely.
-             */
-            block_copy_set_skip_unallocated(job->bcs, true);
-        }
-        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
+    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
+        /*
+         * We can't hog the coroutine to initialize this thoroughly.
+         * Set a flag and resume work when we are able to yield safely.
+         */
+        block_copy_set_skip_unallocated(job->bcs, true);
     }
 
     estimate = bdrv_get_dirty_count(bcs_bitmap);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1cefcade78..2efe098aae 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -147,6 +147,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -174,6 +175,9 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
         return -EINVAL;
     }
 
+    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+
     return 0;
 }
 
-- 
2.29.2


