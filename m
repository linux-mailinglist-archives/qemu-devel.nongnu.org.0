Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2603978B7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:08:07 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7s6-0002nt-KX
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bm-0002GH-8I; Tue, 01 Jun 2021 12:51:14 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bh-0001yq-8e; Tue, 01 Jun 2021 12:51:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=linWlZ/cDEBNRIQIiyX/9VaZYtkW5OUk1TCWl/UOUL6KyYmjctvQWad0fvaqxZaYF18zX2XBT3PuXyvq9+2iLH3+7jaDCjFuI2ejHcxRPDVWw/SFWaANeYGMsmuUYFfI7uThD5ZfJPc+Yc8VSByDLHncKQbrXgS9669jH1R8C7VSlUT5g6Ggb/t7JbLK3de5jpF8gn2rP6sVycL+dDm6U9dk6VEtbqoiY3LgRIrfUx1wrujBT3hVQQV43MqXa3v/vk6hFt3ev/KPKa4NbmEew3XIEu1lyOLkDBumknuxAKVrQah2zbo4qcqQciHI3c6MIRITjvKae4meCM7OFysbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re/62tKz9ZrUyOoCli6spfrf/H7kZNIonKQGcWOGyLo=;
 b=FPPkfBbISFjd0DGh4ku5uL/eukoGEq4CWQnzK/1u2RPIq2BldOvp3uUuSenVhvo3XxhixtDLad8fho0hMq19Rp9JMITEHoZ1h0/WRt0zPvuvdT80Rh50EXGfX4Aqck1QBJ0q87l1FYb+qCX4cAkzETx14aF1HG4R6CwaSHiMtjIvhZYTrUjs8BMTLL1qWW0kXXY8pjSq8Ghbv6oEVx6uY2XHBdmkuU9TAZBYoHLY9I+J+cCc1LczffSUc9zT5qXdOrPVIcJhKRK6TyeBevJN2onnMifUMw7dyawUCTArmArPWlFddNA9TGBXDACLzFt/x+LsYEH+IY74XQc4Wt42aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re/62tKz9ZrUyOoCli6spfrf/H7kZNIonKQGcWOGyLo=;
 b=mFNNbFRwa2CHcLWgam30T7COxQKXjNlmmbwQzScSwHv+6dsYEm6EKo4UJCPr26sWlBjvxOAigb+oIOwmhGk0JmhLvISvbb+TP/WZ+NCwVq/qEVPMTA360n0zEoYWn/0HDmTQssRlb2JLAy9IfJQzLTT7osQYqpc9QkiIDaYiowY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 08/35] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Tue,  1 Jun 2021 19:49:59 +0300
Message-Id: <20210601165026.326877-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a182e26-06bc-4e49-10aa-08d9251d6b74
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471B23B374BD137086341ABC13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Bwe7WciZ+GgILUMGEihw/wP00AGAK9OA/OstINQhSbw3DUeogZRuFUAvULRFzKcE7bxOptrvygybGs5vHWwJBs+/SEoLGNNroXHQ6RhEHy3L0NuQHchMgQ+geMNjaCqrY3TmgsOq6WTO9WLes2d9QeovqHWGINlZGGXvm8mIUhmNon3LReWBTNroPjOx4I6niDIOii7ST8q091CMmCZajtPg8AbYFo9l0J71sMbq1XaCEys0TNmdsGV7jrjvWKV2sS1+symxgj4d+lfrmj2KVVuTgU8MnxDoXFQ6Q/KQG/jWyQTOG9wnyB/KfojTVvqU/bpi8wUKtHGiylLfJ4GRz9DbhNWsEl7WKONe6/JXbURkzvnVidPnVSJ26RIFYQlf3o51SVBEBtgcsggYwS1lOPBAC7uRZKd5pLH0qWHcogO3naoBtoKH+bvKP7km43UDxD1/5UWi5RF3S5mS/tDwj72TPcV1HgdtbQv4/nLI5SXcPABi+QaUhEBT/Fi+ucytnArmHdQbmgjwLTx4yGFFc7Xd9j3J7fOlRkJhfCKV7gy4ynTOznHKLHql0X/l5oT03mJONfSF1JYJXdzzFaSjGBv4CNkHQWWdrt0F0RhgfhPb6cTHy4saSD4nVdw7Hladm1jJnzz1iquD7h7bTr4LlCMI8piEbbL7FRVE4Jf5aM1NxOZJLc6/14+2gku04id
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wbbAMef9KBF9l+rReYaYsuKM8+RkayRu1xQZ9bgtLiqzmFykMFx5OOM+TEy0?=
 =?us-ascii?Q?DHHOiyEbPDAHTp1vhdMM33iAqDUbS4Tm3zXxv42ce5fUnSIv/ViV2dSKZH8J?=
 =?us-ascii?Q?lria/VVHrohe3gRW5wMiG3ojoXQn8ORFcLaggqjgy2AEEJdSsHFK12MYGCmx?=
 =?us-ascii?Q?OhkhaYRSjJM3S3YOSH8cmoT8QRZi0Qhnps3SQR5/vL2OhloxkzLzQF9AZka6?=
 =?us-ascii?Q?wKCBcjpJRcjNgiHEjMDKaGRTbdE/rtoCVdFCfqxl+fyyt8lZ+V1ZLv8EddAk?=
 =?us-ascii?Q?HU6citPKY35fCXY0FKOXgWVsL61XZCcQwUKujTSTOvjeU1PJQFNenvuU3Ref?=
 =?us-ascii?Q?s+PlvpPMfaNHAD+esg9hbD7yKDj89eLLTq516tTRC6PqTq2wQk3VagZ7YGZQ?=
 =?us-ascii?Q?4DFdJNCTxjgA+leHuCqEHi/6OCeN6mCZqw2W4J1/jjG8yuFWiq94kBvNT8k1?=
 =?us-ascii?Q?qATotE4zc1RGxgt6bsylmjFoWBcZZCKYhK1x1Wt2Ubg85R2mEuB/VGNcMKOs?=
 =?us-ascii?Q?6+jmdfmUg9kACQXhXhCLbZWLjMvDXWb6c5KOiTJrtJGG8Fl9wne13lVrp9k4?=
 =?us-ascii?Q?BnH6pRa5dLfNZR4j5Q5GieJfWIicJQfzjROUKR4bm2nbEHmlWVpALHoJjd9k?=
 =?us-ascii?Q?HHUa3qjzUdoheKJH/NWHMWKvEEsfN2FU84cmfpIu1PbFEHWjjPvyCub+tXNq?=
 =?us-ascii?Q?AEBuFqvfnO6allQkzVG5V/bm4rynjAMno7s2Rl4+29rufX5LqagemkZuTv/n?=
 =?us-ascii?Q?NX7FqmVdzbTvIfHRwqr7kxVWniWmgK+JohLJQCF9ZscKG2/mIoV4iC8qE/50?=
 =?us-ascii?Q?CwEw86jTnze+8u3gEdCfEQ1Qt1MDMBNYunawAqHvjuwWqS244WAQZpeCoDVS?=
 =?us-ascii?Q?XcG4m05ppXmYFSIzGW8FJrTP6M0ICoZ+9+Yh62Kb2szxQvxvTDBSN3w736Tg?=
 =?us-ascii?Q?0yn9zThr07KhGU3sCZNbJ9is9KVfNrwutuB6nZmODuBU1gD9T1FsLghHIw03?=
 =?us-ascii?Q?Fd/L5dWSSgzAw6WJsPi/jQ8VCQrJ5XFgwJWaR/NA87KsfE6mcWiM0wlN/j5R?=
 =?us-ascii?Q?5V2QEUtLLSIi0J8iAbQ1kXCd6aOhJhOfnXsyPYigkmgahws8IZswFaSjSTBx?=
 =?us-ascii?Q?T4a8PAHOVgMI0i5lV/Xd/JLxym8iroj0Sfli73HVKhSxeHoTU20sEEjBLObJ?=
 =?us-ascii?Q?v4DNG0DwJ5+19yfxibRCeFfkDYo1dnt8R7/dK71HbW4cAkitXgcaWPmO/lEo?=
 =?us-ascii?Q?KM/dES9grFlAlCtvZnOjB41x6gvXg8pw49P88t0Kk8wibnRXT6Gi5EDRe/Ln?=
 =?us-ascii?Q?sKM4UIRT6LeH1Y4LEDa1as7x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a182e26-06bc-4e49-10aa-08d9251d6b74
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:53.7928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q7bCrDvMgVTmmQw8PIeVAIM2m0rJyUHJqdL06yF1FkgxBqrVPQ7gJgRztHaHh2HEOxJGgjSxruW3QlMO9AQ/hyAsoXtFZvSXiES5RJC4+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
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

It won't hurt in common case, so let's not bother with detecting image
fleecing.

Also, we want to simplify initialization interface of copy-before-write
filter as we are going to make it public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h  |  2 +-
 include/block/block-copy.h |  3 +--
 block/backup.c             | 21 +--------------------
 block/block-copy.c         | 29 ++++++++++++++++++++++++++---
 block/copy-before-write.c  |  4 ++--
 5 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 5977b7aa31..f37e2249ae 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -34,7 +34,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 338f2ea7fd..c013a20e1e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -24,8 +24,7 @@ typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags,
-                                     Error **errp);
+                                     bool compress, Error **errp);
 
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
diff --git a/block/backup.c b/block/backup.c
index ac91821b08..84f9a5f02c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,7 +407,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t len, target_len;
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
-    BdrvRequestFlags write_flags;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
@@ -504,26 +503,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    /*
-     * If source is in backing chain of target assume that target is going to be
-     * used for "image fleecing", i.e. it should represent a kind of snapshot of
-     * source at backup-start point in time. And target is going to be read by
-     * somebody (for example, used as NBD export) during backup job.
-     *
-     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
-     * intersection of backup writes and third party reads from target,
-     * otherwise reading from target we may occasionally read already updated by
-     * guest data.
-     *
-     * For more information see commit f8d59dfb40bb and test
-     * tests/qemu-iotests/222
-     */
-    write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
-                  (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
-
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                                        cluster_size, perf,
-                                        write_flags, &bcs, errp);
+                          cluster_size, perf, compress, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/block-copy.c b/block/block-copy.c
index c2e5090412..57dfef61f3 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -245,7 +245,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
@@ -257,6 +257,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
 
+    /*
+     * Why we always set BDRV_REQ_SERIALISING write flag:
+     *
+     * Assume source is in backing chain of target assume that target is going
+     * to be used for "image fleecing", i.e. it should represent a kind of
+     * snapshot of source at backup-start point in time. And target is going to
+     * be read by somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already updated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
+     *
+     * Other cases? The only known reasonable case is "just copy to target, and
+     * target is not used for something else". In this case BDRV_REQ_SERIALISING
+     * change nothing, so let's not bother with detecting the "image fleecing"
+     * case and enabling BDRV_REQ_SERIALISING only for it.
+     */
+
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
         .source = source,
@@ -264,7 +286,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = BDRV_REQ_SERIALISING |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
@@ -277,7 +300,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
-    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+    } else if (compress) {
         /* Compression supports only cluster-size writes and no copy-range. */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0dc5a107cf..4337076c1c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -171,7 +171,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -218,7 +218,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
-                                      write_flags, errp);
+                                      compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


