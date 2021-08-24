Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF223F59F9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:42:02 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS0P-0006c5-Ik
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy6-0002TT-HO; Tue, 24 Aug 2021 04:39:38 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy4-0007OJ-Lx; Tue, 24 Aug 2021 04:39:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGznxNnNZVnKE7YrRjoxuZiUTc/ROCp89bt+0o0TtJ2uGIXZWAcjfaZ4vcLkuy5XIaIGvnsY9+m9eq9BYkMKbjr8CgKvyqu6uQ0CeHRYEVEENXlagfs+X8F2ElyWkO16vKBfhGTZ7V+WBdR9MWDMnF9fRGbtVCrPMiJnWCm6o2GPslWKgBf/Cob6YYPRbxM6PADRfsDDEpVsLMSHytG1tU1aCSQx/7vdFRukKjAB7INL5P5HCOucOOMGqWlbqgmXnlWvrroWNtaKBxgYvmbefZv72qM8c9Pw1vXUeejfnqD59uJ4s3Fj9wXusBNN980SWPv4A4tnIs1HNgMvZsiqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gufYc6dZp7TrdpREwKrNu2x663dQRVh7KV1g/HXFB4=;
 b=bzsacVtQzkIMqtJjnHW4ZM8HtFSleF3f1a5r+XIL2Mq8fxeeH658w5MkC28zrDoOmh+91w3bk5iEbhBh6qm1NcSkDYPjZWWG7iDYVCTJHKlJrv2j3cYyi3I/JD7uaTtztNqjNEBA83F6jBfj2NHfruu69prIig9fFPsotsbxDCywSDHuaigTG5fUrnLZC0gR7vBTimqymylGaPz3YM9e0723vUBiwCyXd9Rf7o1o/BbcEbgO7llHkLBOWo6JWvTJqgJcxizT/i7yrGb2SmvSpoSQti67viZ+uIgtRIrwY1omuRuDGvw4XOncyEUVMizeRGPXaEJHtw14hfbD0CEN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gufYc6dZp7TrdpREwKrNu2x663dQRVh7KV1g/HXFB4=;
 b=hCNuZJ2hsdRkq+WZY8YOxTPbdqIOmZbcF5eNK0wBE2AP6TEEEHs3P0dO3wo8SNClRUpNS+swA+QlqNfOG+zLic/EsLbfers+tyMdxjNPhIukNzqvVdGFKmNQXpY6iM2F4iBXgC4KzRYZWqzSvWroqE1cuGo+EZX62Zz+bmv1hLw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 08/34] block/backup: set copy_range and compress after
 filter insertion
Date: Tue, 24 Aug 2021 11:38:30 +0300
Message-Id: <20210824083856.17408-9-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 904bf58e-094a-4420-f7d9-08d966daaf82
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17800184B185E755394C66B4C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMovkDCPb9ER3xJPeJXCgRYtUTHTqDqoIq/HW5ShbZvMCxYPVV4A+x/4XiPIqCRoDPNgzSAU0tVkXHltKcIzM59hThkDbTCsgYp809cHRciX4B+Kc7paO+QXWSFxZ6XDjMuSKYEDnr/pRUSJ2WFCpfMq0pp3tfokoamv6q8zm5T9RulBKDu545qC2yxmSfy8WLoaMI9Y3OaugCrnkrN+bxJiAoCdz30XaOqWMx/0ftM1+E4KajWPxAS5LdhEww81xLz+YI9AagTSXPyFg+C4DWwUvFmexrmTk7UW3l+M2TFJ1DzRajbiujIt2pWBrYjaGkCo8v7M96FMgaBKCDaVArlCzOkupPf+3uibwwjYwDhDDdW3oSuvmVaXXiXARPHEzb3nDdYb9dHDXjhC6BxCKvDAoJEyhYIAWVL9us5X8JoF3i0MdZvf9+QRHhHDn73T34AxJglOvn3U6BBzelgoPqTiP2cGe24OeO0EnOuU1Xqfi2OwclhlNa5+lZ1XBcuhhSm8PikCpHpokLaNc9JZUepPYHIL9zFM/KXi4l2vqKezhFfmdHVbWtGgQ2eS4UZtB2msWTAq0lJLVhXViEDI9Owo/6KbZDG/fanFbZnCK33WoUPzPM2aQx+rdOTF8YoD++HZDkrXKUd4Arhqr9Mt4NNWIrZbovo2eu4bfFGRUsutuZ2Oidea7sbc/s/CpXseYx+g2dunNtkI1Clo2EgonQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(6666004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?seTSAECyEw0NGQGfXiD/m9GPJXZhxudiQsL4+jb+V4u7u/AE7D7Jn72Wf+bN?=
 =?us-ascii?Q?ZZyJLxcpndpOJheTsmh40sp7Xska8VRj0ZeMZxsDUpmwYZAoIrX1j3VRpTjF?=
 =?us-ascii?Q?HJ2jkrv5yQUcmnYo8dHebg1ooEjdv2B4Zv+Z1stiBMKhUC/PsiU0B7cb7PA1?=
 =?us-ascii?Q?TBUqYbdK3oNmSu/h6RvkEJPZJbtaosieYl+4kj5+tSD2CfvaOi7efvH4M0Tk?=
 =?us-ascii?Q?dWe9cjK/1WTjUgNM9Ua50N8UZayn4QAjS1wGJrlzEKf8ikK5OHnPLqo+QSgR?=
 =?us-ascii?Q?jPlryd945bj15gTRmPdQU4CLq/gdm4mIJXTJMhXzxDr8qtJ+iC+CZN7qDTXY?=
 =?us-ascii?Q?U3lKvbrKvuqLgPDQh96XxkC9oJsv2PrkVoag3Sd9yXekunZVa/AW6m/J9qKU?=
 =?us-ascii?Q?6pemD2dqoUOTPzO+3dV5jI2ctgpLUG9OClx3RK+CNjxTd1iN7mYM/2CVd62o?=
 =?us-ascii?Q?OaZmFOw/trluWQ6DDfMpzZCXuEUUz4LzB3C7yVOLbEMdyPqSugkPY8FjYiPU?=
 =?us-ascii?Q?6vFN/KQIaClsbGyjRGxlJSs8NWD6pHS0lPON8bFh6GG8zbY7v448qMsNsrSP?=
 =?us-ascii?Q?cNNntP+AGqVrcVviMSc+7lGgI0/vbprVY5Kt+Zks8C9MmNa/txml2ZoJ8W94?=
 =?us-ascii?Q?UAVjJocIprdlY9IXvh1xdZCPp0HZrMUu3nrru8AFZIJYEkRvwbN62rvK8N+r?=
 =?us-ascii?Q?vWOdiKYNU15nCt46U5IZ+dzBKHVJbJ3mHPQBbW/lcvk8JYe9nBA6ozOdTfrn?=
 =?us-ascii?Q?xgZh4dAgGSyjI+OJPFCHkJv5qg3fY0VD/xhSXQ/Wy/POEvGm5VPQIxzlsit3?=
 =?us-ascii?Q?6qV90olOzKtf3wKTCqJDUUoofFuaBDDPR6HV/6XfuIpt+5Vvj5E153MxYqSO?=
 =?us-ascii?Q?9o5i5VL+HNUtflgZhwzvuI6gxIHi56PT9B06kqyg1uGBrQ0l2Jznc+NBkzaX?=
 =?us-ascii?Q?X0FG9+DfoZn6UhfroIaMcvucZtBKzVnDQmPp4+ZlXkfV4a2gpGahh6yMV+K/?=
 =?us-ascii?Q?7OOfQLJ1EqFlmi545i/XwRjq8MIp5Zf1MWQh7jksAUrX9kXXL66A2w0FPobl?=
 =?us-ascii?Q?Kt4aJRDqI5uFyL57RrMxN2vl9495PN24/A2A1WRti94PaIxcR5qqhoHW+S+V?=
 =?us-ascii?Q?tsnRpkxEqDRfGCE7eA9Ygc99SDJjou+dxCMBmr9Vyf1DMn2DF2UM6Z5V69yC?=
 =?us-ascii?Q?tN50nEWya7gHbxF5D+1lWNWUSayC03z5KenPbjZ0zUFpNRPoCblwtvRBNsWs?=
 =?us-ascii?Q?tZ5RDfDK5z38O+gfzJBR5wVyhlHHbADGrDgwIM37xPM+LZhvlk8hRSHChWSn?=
 =?us-ascii?Q?FsF5TeeHbje8Lk7MyXS6VUh5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904bf58e-094a-4420-f7d9-08d966daaf82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:28.4489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjcldHEP4QSuGSnMhkgpDaIjclGi9+ZV9oU+TfU5wFnagg6CFj9sRU/dfNPSRIWi2Qmj+N9Et4pXnXKx4RMdb78rXjs7qZtOyiui6ftuWOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, so it would be
initialized through options. Still we don't want to publish compress
and copy-range options, as

1. Modern way to enable compression is to use compress filter.

2. For copy-range it's unclean how to make proper interface:
 - it's has experimental prefix for backup job anyway
 - the whole BackupPerf structure doesn't make sense for the filter
 So, let's just add copy-range possibility to the filter later if
 needed.

Still, we are going to continue support for compression and
experimental copy-range in backup job. So, set these options after
filter creation.

Note, that we can drop "compress" argument of bdrv_cbw_append() now, as
well as "perf". The only reason not doing so is that now, when I
prepare this patch the big series around it is already reviewed and I
want to avoid extra rebase conflicts to simplify review of the
following version.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 ++-
 block/copy-before-write.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index f37e2249ae..538aab8bdb 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index 84f9a5f02c..b31fd99ab3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -504,7 +504,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, perf, compress, &bcs, errp);
+                          cluster_size, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
@@ -530,6 +530,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
+    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4337076c1c..235251a640 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      compress, errp);
+                                      cluster_size, false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


