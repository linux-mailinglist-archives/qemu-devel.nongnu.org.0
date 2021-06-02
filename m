Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18B398A59
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:24:42 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQrR-0001ov-Tp
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfJ-0000fh-4D; Wed, 02 Jun 2021 09:12:09 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf9-00035G-Nx; Wed, 02 Jun 2021 09:12:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DipiegjNHRwSE1t8Dukyi/8O1gCimIx72OGq/Iz8IjlkpTNBbgvxBV93zjjCp0tawUZJqV2VNidB+mGOAlBQZL1eHEGAxV/NTj3SC7qoLY5QDVDLoKogHeWg1ljYg+f33BCNHZS8qEs7GYe2DJNMWvUboWIqxPsvjE7c00aXPDieGFZif4rFA97iU4+HyYOWy73uGr4IiZb8cxqwc1HvoN7zqQimSMKdusET5ELwvdBjojCINu6eVSE2xw7ww1lqS4XbrQ+DmLCkwIaMctEb5E4XQiZys2691iDlkB4jaEnrg/NRdn0QLiBeS/PP6eaenPkjj2jcQYvSaL7Nil/JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHoTvnykitucvYJIcFD+cBcXCIaLWhU7kSNlyjEqdr4=;
 b=CuUhZ7g4fehuhmQvuUIunBrIqwDDXwTmkAR6s6RNSpCQPbGEeYxDZ1fuAjPtXkk5fuRQIxUQZf+tGtMVb59qzmISdsvYqydD8ikumVhDyN5PS2cNisqdXc9IC9dxPUlq/LCXdJHvIJqgc/jjJnnAnhJS0j+Tee5z83P4OlxkIuiYQqvtjIXie1HD0vZCDSqbiqk1TIJv0dz3COnpEDaYzCX/OR2BTkdgUpxbdT1gF1l/kwEw892YmCVSm+bJL9OKk6efMvtNQJLI4Q5RP3+FXZBVzTG1d/jRWcA1OZUZ+InaJ61Go/4ZdZG4dC4FyuyLdUX0sYZAO4FfYIEgc9Mf7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHoTvnykitucvYJIcFD+cBcXCIaLWhU7kSNlyjEqdr4=;
 b=i4yw1CNWdtWc/en83sw5bnKV8oiy2vM51WePl5w31n4DJeJDs/sNWXz9JuEEi7DcGSvmBceXx1pZi6kyPgMJ1hgchkxBxLhDe+LPcGrq1jwGmgDVZP21pT67bmcOdZ1kNmT5Ej0rPA2o1Ad6AOwr/X4kSrnPZzSE9dg8qZkIF6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 08/35] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Wed,  2 Jun 2021 16:10:41 +0300
Message-Id: <20210602131108.74979-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c82250a-3f8c-4b61-9763-08d925c7f3e4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376F6FFD450F8A5CF3ED387C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkyxTjyFT9PSvvcwp56MG56XoVB3InjN6jfY6kBdmXga9TIGeMAMMfaBeiiDoM7BF898+R1C3jO9eHzApgfpjj5I61Hexl+Sb/+WjeVKBo6ml/QtBUXUmToArgrlaE6Qu+Pe08TKZlqVnc6gcQQ6Nt9eWpSPX1lKJXhD9a3FfUp41FLvNRrSyCdtOcXa6zDCozZ2Sdp0W8ovczrQLJthru8bv+rbgJPcECugFa0XoSF+y94IeqCNI3jMgPnR2rAK784us7cgpMmSfc6XLz5ARD/GmlaHLDMHDGuk8uyzp+sA+baEs6HpW3R9/IzJiZjSjtfb83dRBzEyfma0atovzDIvTEefANo5BYhJ0mn9+rYy4g1lFflEU32C5wXk94g/joxxEebCgLDH2GQnGXVWSpxaPn9ZquHtVdIo9i0SEUgLfIYPzY3VqjGtDvffSN3LG9ng5ohNcCoAfNXbKn11SIi2VzRXxZ1zpk9Ej5dDsPAKp3ZliihFOIUcmb1P2GoysCsss+emYEiYP7iEMy5PV+KCzFD3CARIVj/072LR1TC/DKrsd6v7iLTdoU81mgueGP8trTKFgNNkdklQjLM2y2d+jcAlMktREg9n3jditYTZL7y/duaiZn7WnzpNN0CrTq9wqFqxExZIWau1V5FLkBRg9YVFobNNuUIZCy2dRVbgBYSnTW3HpeAjq6IN8/px
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l5XAYRsuBLmVKJVkKl1NwB5cEAJUgi+VfJDy6iem2U+nv4Z4szxRdrlZ22JP?=
 =?us-ascii?Q?6cf/vqSXAnXT95VLsORUPDfequVD/fPrQS8rNDgR1bsE11RHE4I9T319Z9z6?=
 =?us-ascii?Q?bhXpe9PbIVvJrpNzE3fCGAXbgBkuFw7t3/R6HI5xSdOizMuH2Cc61OD0ryAK?=
 =?us-ascii?Q?jeX59AXu9DsXv+dTDYMX6ku3kwVCUdSG0xflBh0ylE/vs/maSqKBtmua0YLj?=
 =?us-ascii?Q?es5onM7mi5ngzJQsXmW26GlyXmfYrnb68VLQxz2La0fF58PYcqvAetdbN/v7?=
 =?us-ascii?Q?zDkNgMPN3F3QQUTuxpEMU2RCg3qFGDTRks0uZhZQiU2HlkLffBIpxiwbihec?=
 =?us-ascii?Q?nRfTtW8wUWchECS+ifgs44snSf0Og414eQt36FqyiXJqqm5LTD5TQdqYUiny?=
 =?us-ascii?Q?7kQIJUrjiHCH+r+PsrFtQmLdCDZrI2RGb35ceveP1JFK2ESmbA+oc0I9n6CS?=
 =?us-ascii?Q?MsU2neZs7+KWzOQ5Ue9/XXMZzT/g3f3UaCj+tAlA7u0eDEIbNvdw3jghLA+p?=
 =?us-ascii?Q?Rn2isv1/7SgCBu9weaaDWEDRZMOEl/wHZHyLya3h/xp8hmr1yiooFlMwsQx1?=
 =?us-ascii?Q?oybYbsB3a1BmaftLD4M/XobMk9vEUDS8VbJ1Pr1SEBi/gpon2tkgXAvQkvne?=
 =?us-ascii?Q?igF9v4mNkH/CIS6Qfv4hhKpI1vX6ODQNp9AzUZEwSpoPL8Twj7d5nz7y6kFr?=
 =?us-ascii?Q?gLoEX4NZ2J5aqI9RgN/YElqCtdI3tl4lA/5ct3nJ76Mb7pRRyikx9q0T0KhN?=
 =?us-ascii?Q?7MnK8YBbrs8IiSCTj7vvbkRRsNM9IGHpX0ghJB1zYui25LgBk66x5eXh1kXW?=
 =?us-ascii?Q?PqaSsOEuON/6C2fVYB1FGad9lcgOG5hv0/zT8HX6xAUOlNCGjruYgBG5aIoE?=
 =?us-ascii?Q?F4jqlhBn9gxLLp7XQQ0FZfxmpXNyhDvcPDF+837SdauxObLq7/mb0i3wxXfM?=
 =?us-ascii?Q?GjNa6ZIqchiWNJmbsTMnbFda05ES6xH4ywTahUyVC6putEBLnVOTLFmN0JNd?=
 =?us-ascii?Q?twKBHRagXbD27hfTIBTKbb1xT6NmfRM/HZluC3QMJGxun2d/4BE4rJBZddDF?=
 =?us-ascii?Q?iOfnrU/GGcp0Dt4VUpVFUJOaiXwdT2Fkw9V/ibwvEUQRO/HSo4KgNFGGAB88?=
 =?us-ascii?Q?JY7Ug2jusm/0kFfhShqwFERXBolYZxELo2JGUVsGQjSg4pslcWWbElv/Jl0e?=
 =?us-ascii?Q?652+cLY7aMzFAX8EFEFGSsAlaiaUegqUpPCdX4Cab1ZHFqFXB2CMyUqZTgl0?=
 =?us-ascii?Q?EdFwXcdAVInEda8mEwoeefAXDDgh8Y38t4fFBkgNjOfYJLFFbZUG615LyHwx?=
 =?us-ascii?Q?Mh4l358dFIdubcxmkMMht6B9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c82250a-3f8c-4b61-9763-08d925c7f3e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:37.1444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myA2rG0JJtszCuS+P7Inp2bPLjzXfmFXRK68doSo16NzFlCcL5sEzBwORYbkV/nak1bNxQ/odv5mnzcxoL7YdtTmcLqCQbgZ+T8Hp/3SSmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index 5808cfe657..22a7c64c10 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -247,7 +247,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
@@ -259,6 +259,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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
@@ -266,7 +288,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = BDRV_REQ_SERIALISING |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
@@ -279,7 +302,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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


