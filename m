Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75712DBB26
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:23:08 +0100 (CET)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQDM-00084w-0a
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ87-0002me-8a; Wed, 16 Dec 2020 01:17:43 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ85-0001CD-Bc; Wed, 16 Dec 2020 01:17:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIYOGSAnVoYPz4yA0lN9kJCA7vcYvIQSCFVy2w7dOSfuZfgul7woiC2o5077TaJrDfthuIWgGEFxZCnZMChzCabfrwDg6mcVLEqsLYQpkOyHt0+ZHF28Q2M77mVachsmuYKYsL58fIoir50Cj9BEekysUkIKucqaSoWOyA5awte1tYdOETtXsq/SG/HUWzWIAfRQjuL6Nax6PHww/LoFRJOUUIGM+F3q8enaxfVkHaR+dQoEnhCJos+MGmPhr61qVgGv22GN0/yNKTxhK7VZY6KFuW65+tVLTAOqSmbEfHhZseYpL78dtLB5eB/V2aY2bYLa4ec6Jgmbb4S5rkhrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sckIrKV/n6gtHxZ1OrslJy6szM3D7oCMQC98Y1jUEw=;
 b=DSMwapFm6uPDwLvl7Wjs68iKcTu93rf0ACf9OaIb6BjxKC8iOcYnb95O70EfOYojHgXzh/AbcMlAt9CQEGkwkYrNCgXM5Jj28xGc3M2t8GvlRQnXiZnWVWPX/gVKTHfeGXnooXEvzTzt5/omULAqTqcJ5vvMlHxg7SL20xM18sO0F8vuBHn/xjT6kZ9nNaLF8EleG5N9AFBZ2hP7p4UCfYjRGNHKBzHijiJMC8ycLC1le4VWpAPkByuFWuoFSom7Hv2HQlA+wEhzLjyC8BI/tKVZdTG5pl8tCk+wfwBsQ4iyw1ea1x5hq7fVhdEY/xCivz1tAWeCSKUwiE3VMxIrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sckIrKV/n6gtHxZ1OrslJy6szM3D7oCMQC98Y1jUEw=;
 b=NJUbSSZ1D8RpHL9VV312K5ANBMEB50fCzlto9kRXWE7l0Qv6QTTn6Z/8zZvm5QBtkmGEiZj6AsUzKH+XFJN8Kgh43JaTtJfFzORCW+SBzniHCjyLcuMCNS50uIx1UkDRobHF3ZJIPj00ygBhYP2bS8H9ymDHejRYyf8ySAHQWDk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 09/13] stream: rework backing-file changing
Date: Wed, 16 Dec 2020 09:16:59 +0300
Message-Id: <20201216061703.70908-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e686734-c34e-4720-fc19-08d8a18a424f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63091960300B042DF8B0F5F1C1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z7Yi5forDbAb8hM+VNsbzwMWdJV4b88hoRBrgSVg/Evh3oWgYpIKy/QHkx9wjVW+X1cXBOfBOO7LngdvtmM/y5Sr4ZoOC7hGVLIy+WlPKZZIcYcfrqWwjU2mHUIYN1jCpM7ZfE9tN+p9RafIAPwGIuU97KOmxC54NHTFukY7YFj3RbQjkJCpGg7yCssQ1gzaB2AQukvl8n9NBaax0Heb1GzTeF3pQ3VO/2T+gCpGV/zNmuCUDoEl3R4HcgRwgHXNjoG43CDzuNutfhEzmicafz1k4PVFspqtqr1poV5qGX+ZJX3BBaXeof33b94AeYZkgpG5qpGYqaR9QYp7l0Z0bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2GWR+/KQy80+5zrrswKXDsLdTvGiHnvvQmDog9hgKt/oqeWkuhLaQQ9x4UGG?=
 =?us-ascii?Q?vjqxrI/UmRpmrYbc4ywGNTJwWyPBXn+ks4MvYGsAOLfgxVw6tIAJEZApwVLf?=
 =?us-ascii?Q?4UdvWurE5K8xqdbDEUincTSnnCbQVuSHafwgh4+3t06fbOLk4LZlCwPob9MO?=
 =?us-ascii?Q?Xlx1vbQB0A5JIn1zCLNBhY0QwnFj0AKEoVqIfdYmyA5dE3KOdmNQkNPwDlMv?=
 =?us-ascii?Q?E580cLgWKa8aOOgIDah0ep7kcj94WGJSoOnQlH07B/5t0PSurQTV2DxCqfRa?=
 =?us-ascii?Q?FmuyIDcExL+pbnoyeDrw57Vy9kHuyEWbDcui6HHTeIApME21GrjSKN80YsJz?=
 =?us-ascii?Q?J61A0MtCRjPL/ZizCI8molCHe/ZcWvJrSWjMUh41H0/K9UEb3JzWB5pRmLuJ?=
 =?us-ascii?Q?uEzG7ihJMlrgjL7kjMAogDuoXskhauitP7NlRfbMLKYCOzNIaDg8YknJq10a?=
 =?us-ascii?Q?SQVxESy14suSsjazLX3ZZ1cAiRp5JvT7rvSebTQFSVmtBag8tm/pktXk7nC7?=
 =?us-ascii?Q?AGQBEgcb3S+x0BN7GE9mnRK0+yblqUCVlA14qEdvs+2O3W5QTl+fFWmppa56?=
 =?us-ascii?Q?mF4Th27qHgPMuNp8miPmwsOl/t1R1RUFaqaZze1bwXTfNNElptUJYqE2VVB0?=
 =?us-ascii?Q?mJzoLaYmRHHPAFrfPPcLcIebIB7n3BvUxs0vL3mtqqy/8ivtKs36RA3MgpeJ?=
 =?us-ascii?Q?DmoXefes3qPCjYmd59CWnzqBL0huzkIXCpA+0lOq33HooEjjp0nBUHe6dIhH?=
 =?us-ascii?Q?nE6F4b9EdKgv9UYpgukSHteBSWq8fXijrr2FPP2lXSRyPypT/zFMVi6kwShw?=
 =?us-ascii?Q?iJATbF+RtdyjXufYmNMIJx8Tcto9lvR5egXW0/rtooqMdxtrqt1//olpLK+L?=
 =?us-ascii?Q?5xc4IOMqs60HRLEI2AVDfPs7jgmX8iWhWR48L13F7Opa0YTlb3f3PyRebKVk?=
 =?us-ascii?Q?YaP1HazFLAJTBhTjE2VAHjT0EJUJpqgcYpDg+6MMnpqZqv8Zh26qnK7o3Um1?=
 =?us-ascii?Q?erf/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:26.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e686734-c34e-4720-fc19-08d8a18a424f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQ4ho2g92vmxz6uI8nFcIuMnV/LfF9ewnlpH8S8TD4kYGT2LDFHiBAQL4W4CZAPfgrbLJV9ZJQmKJrySjrFWrRKhkm6KFtiul/DaB+daCMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Stream in stream_prepare calls bdrv_change_backing_file() to change
backing-file in the metadata of bs.

It may use either backing-file parameter given by user or just take
filename of base on job start.

Backing file format is determined by base on job finish.

There are some problems with this design, we solve only two by this
patch:

1. Consider scenario with backing-file unset. Current concept of stream
supports changing of the base during the job (we don't freeze link to
the base). So, we should not save base filename at job start,

  - let's determine name of the base on job finish.

2. Using direct base to determine filename and format is not very good:
base node may be a filter, so its filename may be JSON, and format_name
is not good for storing into qcow2 metadata as backing file format.

  - let's use unfiltered_base

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: change commit subject, change logic in stream_prepare]
---
 block/stream.c | 9 +++++----
 blockdev.c     | 8 +-------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 6e281c71ac..6a525a5edf 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -65,6 +65,7 @@ static int stream_prepare(Job *job)
     BlockDriverState *bs = blk_bs(bjob->blk);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
+    BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
     Error *local_err = NULL;
     int ret = 0;
 
@@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
 
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
-        if (base) {
-            base_id = s->backing_file_str;
-            if (base->drv) {
-                base_fmt = base->drv->format_name;
+        if (unfiltered_base) {
+            base_id = s->backing_file_str ?: unfiltered_base->filename;
+            if (unfiltered_base->drv) {
+                base_fmt = unfiltered_base->drv->format_name;
             }
         }
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
diff --git a/blockdev.c b/blockdev.c
index c290cb1dca..b58f36fc31 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2510,7 +2510,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *base_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
-    const char *base_name = NULL;
     int job_flags = JOB_DEFAULT;
 
     if (!has_on_error) {
@@ -2538,7 +2537,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
             goto out;
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
-        base_name = base;
     }
 
     if (has_base_node) {
@@ -2553,7 +2551,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
         bdrv_refresh_filename(base_bs);
-        base_name = base_bs->filename;
     }
 
     /* Check for op blockers in the whole chain between bs and base */
@@ -2573,9 +2570,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         goto out;
     }
 
-    /* backing_file string overrides base bs filename */
-    base_name = has_backing_file ? backing_file : base_name;
-
     if (has_auto_finalize && !auto_finalize) {
         job_flags |= JOB_MANUAL_FINALIZE;
     }
@@ -2583,7 +2577,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         job_flags |= JOB_MANUAL_DISMISS;
     }
 
-    stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
+    stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
                  job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
-- 
2.25.4


