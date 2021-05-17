Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131013824C6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:52:17 +0200 (CEST)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX6t-0004YD-QZ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzr-0003RH-95; Mon, 17 May 2021 02:44:59 -0400
Received: from mail-eopbgr10130.outbound.protection.outlook.com
 ([40.107.1.130]:34617 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzn-0001ph-M7; Mon, 17 May 2021 02:44:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWh9qAtmAnAiGhngVD/xn7yZB+qCpLDhHalZzTmWSOJGd+0b68KTSY1ABsFD6Gc3DYS+6fImvwLmJ8NsewoContT19vjPqGws8qG03C1V23CBqnWQdcq5aUzo9eHiCE0FWKguM9MgbxVKRW5CTeSpfVqicBho/agN1MF5FpjRtMUP5YfEha179HtuwrLoiYQOw8HFNowUfeJd42dv9m5E8xegO9/ulSyXVWeb4ujazOiQjVlVbYzFcr1vnQkF1OPDHRFS/+4gS4w670MuSkuBUxyUWKkPy6PdJtk14Vgrn9DNQ6CXYBcF10vkDhFU2nEYWQQsoPKeXO9fx3IhJMh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqBsmd6jB399GpX5GcvreD8qaJNct3QJdMPmxYJgH74=;
 b=PHyTdinBB6Qrl7hg7c45Aoo13DGi3WAW03cZQ/4UqHdC23ugl6DSgRvkmzmhD5O2bC3K52zw7tUXsFXJ0tTFh+e3CxygrDwUapfJfeLFDxFUWDO9Kwt8bpLjq7pvGFPooHHRqJY5ZCSUiy9Vxga4f8CvJoobmySUWXVIHu3vADs0Oh15OKy8g9iGpoD3V3Yql3a2CPMa5+iFooRzNgS6Yk4E+6X10CpJNNdWNVy5Kb/y8uiDyMLNKKNyPQ0/hNZFQVeRlqKY4/bfJpCphESgkycXbTS1KTVKdrINsAbJYPxXtlwOvxzqpn/m87lRikh5eZeZHJEHbJbI+9MutRIH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqBsmd6jB399GpX5GcvreD8qaJNct3QJdMPmxYJgH74=;
 b=rtxhv2Y9TGvjCsAuSeouf160Qomb12E0LAnDw5gG1gKCXQ4Kl6iACI1eaUp6QlHVDBar3Um8ffVVd0QnFW+Lss9IZhLqRJOSfNl2SaSQKYP7qQG7Q8LSmBxxeuo7bdyCcZyMV+kdd3wL8Fu7g7vyUeVr0RzHVkPyaiLHRYjygBk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:44:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 05/21] block: rename backup-top to copy-before-write
Date: Mon, 17 May 2021 09:44:12 +0300
Message-Id: <20210517064428.16223-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94be239-8832-4db4-afdd-08d918ff45d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341B4835A880D510E85DA15C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6CQOu3wXh7Xip83Pwbj3AH1uLYYqpjYMGue3kTvwB9ljRYwGh+6bnLKKpwlBxObkVQhGADr1WrPubVQIYWRgPT6QRQ0XI4mrGjtdN5VbdPFGxxRPDRtMQYxNk7qRaPfvWDSN+RtoEVZ6wpoEje17cbb14lx2DXidBLYCrvEGqA9kGoafne/iYS4JFA+lkNz0+V+2C/CJluGwqaRQUHpHjOdaFOU+9tjHIqtqjo6djZXBzF6pTu/WgdqpmdUPQyeW69hBUP0AiPfNyuqnM409p+VdvLmlz6DoIESw9A2xZcYvhiuqLNbudqj1GzmKzeuy/PhDHts1XPaG/FWoLcLXOI9ax2Sk2vSBGjNhGVaoMHxkhEIlFTlwHd7bjKmicVVicRXFbhFml8Gmic3ezYrGIJI4aXmE7fG34m/TpU5e5Sqq05iaM2bkVhTNuQyjflNWRIgg7C2u8vCIG3syWvI3Y6fHfzPZvzberLBYto/6g2B835cF+o+zVo4SSlhlJdPSu7hMEjTFqoHsskgPEe5tqWr7CnlW+QuZ1OQRMbd0SmM1rMKcjW2ag4BGLHkjKsu1pA3DNQjkQEPrQ0MTr7vS+JL9TVdEw3MjgaM1fk0gh5K157GxQKKdSlwPWTDuoYj3dNMpGJO4TzI2yLx4W0W4Qaun+9B0QEuL8fFbkNWRB85GccBfDFZVcxnIDra2asIzUNbmTvFcD9IM3XexfUMohE/hOewfA94zORjM8mKfMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39840400004)(366004)(1076003)(30864003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUc0QzZnbXlESExmVEdOR1RSVFpHY0pIQm5zb3ZDeWxFVUpDM0czYk1zWFgy?=
 =?utf-8?B?a3dTZUN4MUdNdGl2M0N6NUY4Z0diYjMvTmtMWUhjVGRZY3FEY0VieWlMbjJs?=
 =?utf-8?B?K0RJTnpPWC9MZ2czU0hENDM1YXZ4NStCNGg2aU1tV3hwbW5qUW1WVmx3WENJ?=
 =?utf-8?B?b092NUN2Q0tBckVydWJOWnRvd0FES3R6bzVVS1FnWlhmZWJoUHE4aTA3aFl4?=
 =?utf-8?B?c3ZJOU9pVVdEbmxBR1Y5Nlc0ZFZ5cTRoRVJhalNDQmJpSkkzU3EzNUx0Y01o?=
 =?utf-8?B?bUVxQnFOUVFyVUJqeW8vN3Z6a0UxZjUxRXVzOExLZkEvMEUwd2xGeS9FV3kv?=
 =?utf-8?B?N1g5eWJCUFNta2VxV0pMa1Brc0lIckxxWGtyVFB4bXFIa2hyTUhvR1IrV3Zr?=
 =?utf-8?B?YlBtbWhPQUpKYjRTcWZQR2QrZzZ0ajhxb3JLOEhEU1Vxb1pEcWk3S3pnSjZF?=
 =?utf-8?B?cVlrenhjcCtCMWx3WjVsYVF1NzdlVU1lSmt0N3RoOFVjSmlUODlJRjBVZTVG?=
 =?utf-8?B?eWJXaXZ1Q3Mza3VEbUJwMm84cUxOU1J0QVNaWC9RR1dKNjZPVjl3aGl6cFY3?=
 =?utf-8?B?MStoRjEwOEdrN05leVJ1ZUUxaS80Ly9BRmV5QXUwSldXdVpQalpxZm40QXNs?=
 =?utf-8?B?M21OaXVrRXQ2Zm9vbWFzUzhOR1M0SkJadU1GUlJNWGpNUW14V3Q3MG9NM3Fm?=
 =?utf-8?B?VkplVXBpa3pGQkVYdmNsbllWUkpqMlM1MVVrLzdnWU4vN2pwdkdwbWFCc0lH?=
 =?utf-8?B?S2dqckVwNDcrZC9vUDZTQ0NFdmVaMGJvOUdXL3RwazF2RHlnWURIZk1ESUVH?=
 =?utf-8?B?MTlXOVNMUExIU2Y2dXlSRklhbTkwUDJkMmU2RGthaFJnWkhnYWY4RTdVMk1j?=
 =?utf-8?B?Q3VxbUpEVmNhRm03VldSOENuYUh1cEExVUxkd0dHQkUvREx5aHViOXJiNEcx?=
 =?utf-8?B?NXBJdjRmQmErNldkTHEwMkh3cXc4U2ZXWHBUdGdRNkc2QWV4UFo0N2RPN2Ju?=
 =?utf-8?B?NllwVlRGTjd1MVNnWWQ5MXgrSHc3ZDRjZDNkbTczemVJMXMxaUtyRXFOQk1K?=
 =?utf-8?B?UnpheGNpNkh0UXo4YmI5c05vR0JzNHc0Q3FrTHozZTk2QjJzdEZyMHllTENy?=
 =?utf-8?B?VXp5QjYzVEY1dlpLY08rODdjUThYVnRlZFRDSnJ0VVNOU2h6QzYyYmFicUZE?=
 =?utf-8?B?aGk2YmhmN2RrSUVwcnFsODhyQlVldnZqTENuRW9DYUpiK1N0WmZCQ2JkZGFO?=
 =?utf-8?B?eE0xYmdDMGYyMERjZ2xYWHM1U2loclVpMExxbXRVSkZHb0dXcWJUWkJzY21r?=
 =?utf-8?B?dk93NEtUOHc3eEZGeFZRWGQ5NjIwS1BncXdFNk9aSm9sd25MeUpQR21SQXVZ?=
 =?utf-8?B?SE12K2YrWWVybDB1a2JpUXFRR3JYMDYxVS95c3lKQS82QnJXcWEwYWNwUTJo?=
 =?utf-8?B?SEpLdHMzd083eWZNdC8vejN4T1lyUlhGNXpSL0o3R3F3bmVoNnZLa0drYXJF?=
 =?utf-8?B?YmIxZ1JzelhIdXJGR3lzVVFlL21VelNROUNvMytzUENLV0hmZmRlcG5yWXBR?=
 =?utf-8?B?ZFBsQmFVK1pqS1FaMHYxM3FUVlBPZHp2N2ZJWjJjTGVwNUFjVGJBMzg1bTNO?=
 =?utf-8?B?d2V1OENrOFAwYS9HMGZ2OFlTMGIrZVFpeVN3OElva0RkaUkxQ0pPcTdVNFBy?=
 =?utf-8?B?OWs4WFQ1aVJDSEtQQ2tZOU9PeklqVnh0NE5EaCtDd3BJSkt3TkVDVk5yYnB2?=
 =?utf-8?Q?wFfPBd0lQ9p5lZb1ZNubg3xESwGF7C2t3x+Xszv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94be239-8832-4db4-afdd-08d918ff45d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:51.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifKzfExWj3OnNfRQKq+CXzaHXjh+pXZSqHdQ05ADy+f84Lbi8Cqfh1Sa8zNaXpBC4L2huF4MygR35faR4czbEjPR2AtcKrlwD22gWR8turw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.130;
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

We are going to convert backup_top to full featured public filter,
which can be used in separate of backup job. Start from renaming from
"how it used" to "what it does".

While updating comments in 283 iotest, drop and rephrase also things
about ".active", as this field is now dropped, and filter doesn't have
"inactive" mode.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/{backup-top.h => copy-before-write.h} |  28 +++---
 block/backup.c                              |  22 ++---
 block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 tests/qemu-iotests/283                      |  35 +++----
 tests/qemu-iotests/283.out                  |   4 +-
 7 files changed, 95 insertions(+), 100 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 rename block/{backup-top.c => copy-before-write.c} (62%)

diff --git a/block/backup-top.h b/block/copy-before-write.h
similarity index 56%
rename from block/backup-top.h
rename to block/copy-before-write.h
index b28b0031c4..5977b7aa31 100644
--- a/block/backup-top.h
+++ b/block/copy-before-write.h
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -23,20 +23,20 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BACKUP_TOP_H
-#define BACKUP_TOP_H
+#ifndef COPY_BEFORE_WRITE_H
+#define COPY_BEFORE_WRITE_H
 
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp);
-void bdrv_backup_top_drop(BlockDriverState *bs);
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp);
+void bdrv_cbw_drop(BlockDriverState *bs);
 
-#endif /* BACKUP_TOP_H */
+#endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/backup.c b/block/backup.c
index 6cf2f974aa..0b5887269c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -27,13 +27,13 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef struct BackupBlockJob {
     BlockJob common;
-    BlockDriverState *backup_top;
+    BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
 
@@ -104,7 +104,7 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_backup_top_drop(s->backup_top);
+    bdrv_cbw_drop(s->cbw);
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -408,7 +408,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
     BdrvRequestFlags write_flags;
-    BlockDriverState *backup_top = NULL;
+    BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
     assert(bs);
@@ -521,22 +521,22 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
-    backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
+    cbw = bdrv_cbw_append(bs, target, filter_node_name,
                                         cluster_size, perf,
                                         write_flags, &bcs, errp);
-    if (!backup_top) {
+    if (!cbw) {
         goto error;
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, backup_top,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
         goto error;
     }
 
-    job->backup_top = backup_top;
+    job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
     job->on_source_error = on_source_error;
@@ -552,7 +552,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
-    /* Required permissions are already taken by backup-top target */
+    /* Required permissions are taken by copy-before-write filter target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
 
@@ -562,8 +562,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(sync_bitmap, NULL);
     }
-    if (backup_top) {
-        bdrv_backup_top_drop(backup_top);
+    if (cbw) {
+        bdrv_cbw_drop(cbw);
     }
 
     return NULL;
diff --git a/block/backup-top.c b/block/copy-before-write.c
similarity index 62%
rename from block/backup-top.c
rename to block/copy-before-write.c
index 425e3778be..40e91832d7 100644
--- a/block/backup-top.c
+++ b/block/copy-before-write.c
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -32,25 +32,25 @@
 #include "block/qdict.h"
 #include "block/block-copy.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
-typedef struct BDRVBackupTopState {
+typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     int64_t cluster_size;
-} BDRVBackupTopState;
+} BDRVCopyBeforeWriteState;
 
-static coroutine_fn int backup_top_co_preadv(
+static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
-static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, BdrvRequestFlags flags)
+static coroutine_fn int cbw_cbw(BlockDriverState *bs, uint64_t offset,
+                                uint64_t bytes, BdrvRequestFlags flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
@@ -63,10 +63,10 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     return block_copy(s->bcs, off, end - off, true);
 }
 
-static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
+                                        int64_t offset, int bytes)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, 0);
+    int ret = cbw_cbw(bs, offset, bytes, 0);
     if (ret < 0) {
         return ret;
     }
@@ -74,10 +74,10 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->backing, offset, bytes);
 }
 
-static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
+static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         int64_t offset, int bytes, BdrvRequestFlags flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_cbw(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -85,12 +85,12 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
 }
 
-static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
-                                              uint64_t offset,
-                                              uint64_t bytes,
-                                              QEMUIOVector *qiov, int flags)
+static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_cbw(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -98,7 +98,7 @@ static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
+static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
     if (!bs->backing) {
         return 0;
@@ -107,7 +107,7 @@ static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
-static void backup_top_refresh_filename(BlockDriverState *bs)
+static void cbw_refresh_filename(BlockDriverState *bs)
 {
     if (bs->backing == NULL) {
         /*
@@ -120,11 +120,11 @@ static void backup_top_refresh_filename(BlockDriverState *bs)
             bs->backing->bs->filename);
 }
 
-static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
-                                  BdrvChildRole role,
-                                  BlockReopenQueue *reopen_queue,
-                                  uint64_t perm, uint64_t shared,
-                                  uint64_t *nperm, uint64_t *nshared)
+static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
+                           BdrvChildRole role,
+                           BlockReopenQueue *reopen_queue,
+                           uint64_t perm, uint64_t shared,
+                           uint64_t *nperm, uint64_t *nshared)
 {
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
@@ -149,41 +149,41 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-BlockDriver bdrv_backup_top_filter = {
-    .format_name = "backup-top",
-    .instance_size = sizeof(BDRVBackupTopState),
+BlockDriver bdrv_cbw_filter = {
+    .format_name = "copy-before-write",
+    .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
-    .bdrv_co_preadv             = backup_top_co_preadv,
-    .bdrv_co_pwritev            = backup_top_co_pwritev,
-    .bdrv_co_pwrite_zeroes      = backup_top_co_pwrite_zeroes,
-    .bdrv_co_pdiscard           = backup_top_co_pdiscard,
-    .bdrv_co_flush              = backup_top_co_flush,
+    .bdrv_co_preadv             = cbw_co_preadv,
+    .bdrv_co_pwritev            = cbw_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = cbw_co_pdiscard,
+    .bdrv_co_flush              = cbw_co_flush,
 
-    .bdrv_refresh_filename      = backup_top_refresh_filename,
+    .bdrv_refresh_filename      = cbw_refresh_filename,
 
-    .bdrv_child_perm            = backup_top_child_perm,
+    .bdrv_child_perm            = cbw_child_perm,
 
     .is_filter = true,
 };
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp)
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp)
 {
     ERRP_GUARD();
     int ret;
-    BDRVBackupTopState *state;
+    BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
+    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
         return NULL;
@@ -210,7 +210,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
-        error_prepend(errp, "Cannot append backup-top filter: ");
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
@@ -231,7 +231,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        bdrv_backup_top_drop(top);
+        bdrv_cbw_drop(top);
     } else {
         bdrv_unref(top);
     }
@@ -241,9 +241,9 @@ fail:
     return NULL;
 }
 
-void bdrv_backup_top_drop(BlockDriverState *bs)
+void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
     bdrv_drop_filter(bs, &error_abort);
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 78561a223f..4321f67fef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2281,8 +2281,8 @@ F: block/mirror.c
 F: qapi/job.json
 F: block/block-copy.c
 F: include/block/block-copy.c
-F: block/backup-top.h
-F: block/backup-top.c
+F: block/copy-before-write.h
+F: block/copy-before-write.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index e687c54dbc..6e27aa9624 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -4,7 +4,7 @@ block_ss.add(files(
   'aio_task.c',
   'amend.c',
   'backup.c',
-  'backup-top.c',
+  'copy-before-write.c',
   'blkdebug.c',
   'blklogwrites.c',
   'blkverify.c',
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 010c22f0a2..a09e0183ae 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: auto quick
 #
-# Test for backup-top filter permission activation failure
+# Test for copy-before-write filter permission conflict
 #
 # Copyright (c) 2019 Virtuozzo International GmbH.
 #
@@ -31,13 +31,13 @@ size = 1024 * 1024
 """ Test description
 
 When performing a backup, all writes on the source subtree must go through the
-backup-top filter so it can copy all data to the target before it is changed.
-backup-top filter is appended above source node, to achieve this thing, so all
-parents of source node are handled. A configuration with side parents of source
-sub-tree with write permission is unsupported (we'd have append several
-backup-top filter like nodes to handle such parents). The test create an
-example of such configuration and checks that a backup is then not allowed
-(blockdev-backup command should fail).
+copy-before-write filter so it can copy all data to the target before it is
+changed.  copy-before-write filter is appended above source node, to achieve
+this thing, so all parents of source node are handled. A configuration with
+side parents of source sub-tree with write permission is unsupported (we'd have
+append several copy-before-write filter like nodes to handle such parents). The
+test create an example of such configuration and checks that a backup is then
+not allowed (blockdev-backup command should fail).
 
 The configuration:
 
@@ -57,11 +57,10 @@ The configuration:
                         │    base     │ ◀──────────── │ other │
                         └─────────────┘               └───────┘
 
-On activation (see .active field of backup-top state in block/backup-top.c),
-backup-top is going to unshare write permission on its source child. Write
-unsharing will be propagated to the "source->base" link and will conflict with
-other node write permission. So permission update will fail and backup job will
-not be started.
+copy-before-write filter wants to unshare write permission on its source child.
+Write unsharing will be propagated to the "source->base" link and will conflict
+with other node write permission. So permission update will fail and backup job
+will not be started.
 
 Note, that the only thing which prevents backup of running on such
 configuration is default permission propagation scheme. It may be altered by
@@ -99,13 +98,9 @@ vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
 vm.shutdown()
 
 
-print('\n=== backup-top should be gone after job-finalize ===\n')
+print('\n=== copy-before-write filter should be gone after job-finalize ===\n')
 
-# Check that the backup-top node is gone after job-finalize.
-#
-# During finalization, the node becomes inactive and can no longer
-# function.  If it is still present, new parents might be attached, and
-# there would be no meaningful way to handle their I/O requests.
+# Check that the copy-before-write node is gone after job-finalize.
 
 vm = iotests.VM()
 vm.launch()
@@ -131,7 +126,7 @@ vm.qmp_log('blockdev-backup',
 
 vm.event_wait('BLOCK_JOB_PENDING', 5.0)
 
-# The backup-top filter should still be present prior to finalization
+# The copy-before-write filter should still be present prior to finalization
 assert vm.node_info('backup-filter') is not None
 
 vm.qmp_log('job-finalize', id='backup')
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..e08f807dab 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,9 +5,9 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
-=== backup-top should be gone after job-finalize ===
+=== copy-before-write filter should be gone after job-finalize ===
 
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "source"}}
 {"return": {}}
-- 
2.29.2


