Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478583D0C5F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:23:16 +0200 (CEST)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Nj-0006Us-90
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697T-00079l-59; Wed, 21 Jul 2021 06:06:27 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]:41470
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697Q-00020J-DI; Wed, 21 Jul 2021 06:06:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF0fBWUOoqDmECdkqOulOA9ekNirWblOLJD4MqxzFTl4z4LXJh25DRUfzOY0qPYI2XOwfz3mfJJhEDX3GB+k4WBn2fjTmvORZdUcm6wtn2X0tejSa56LC2fJXf6qjY1XpL7TgX/6k9ZlweWQZp6mdbr+xz1QXEYa5ZlH57gUmGcLyqlifwqoHyOsZKBQlUq9MFgdUbYRBamJPjtrrrfdyfqd3MAC60b2eAQyQvr0r3V8U25/lTr/mUCdTV6Hz+MOHS83ONWCxL/K8ZXsrOjgZm1wcA2/tiFBEwDf7W+cwh9oI2yLw1KAuo6tpz+N/9Y+EVDGgM8DqnbUtwWyksJkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=aCa8m4ER3lVOH360JOcmBx0YAJypLkXYjHSYQLwEk4u4baxveQzfGE26kxCzhJx6tZbA78Uc+6mVOEQ++Gk2NAPtlCLpckfHQmjLDDXGIuuIlqEXHYbz/qiVIKN4WoBoaqK9kHOWjBkEb+4zPKZH/hTlHdRXqMVumbGc1WqYEuxsLsTBuXBR80BOzah5eZwofd37MqWcyBLeGM1GUL3VWpMi5SN0+kYsRdmAT3AoxUIXdos+mpjZl5pnpyLCQZJ7RHlCPy9zmCvobqcU8vWBfzfRtHVOp8wocniG+MCvsfcM+T279vFSAu5MnvgY3vCnFOqYoIC1a1eJHNftaOiH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=EiOe9RGa5QHiKN4mURhFCtcwEkuaEw4i8q837IPhWoqT7OgXKVZAbaOilYU6N8hL4PR3eSkrnYEIVtGH/7cOauuaC1QLdFHjenBFlgrVeqTNSIhLHycxLfF+0znlpRdtD7pWpf3HH1gKc2YJRkf/LC7lxXLdEKqTA4FEHqjQyJI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 10:06:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 08/33] block/backup: set copy_range and compress after
 filter insertion
Date: Wed, 21 Jul 2021 13:05:30 +0300
Message-Id: <20210721100555.45594-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12baa23e-77fe-4072-5ed5-08d94c2f305a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724216CBB919CB30D0C4F10C1E39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iopYn61vh+v+J++WcyjGroQ9d8XOe2i0dl9dFVYtkKx/RzaMl0IEBsHX+a4exFlsXEo73A2Ls1YZJh892gayRqOIlFCqQHqfEfgpnOOngjEA4bEJSAPImlYw1MY/LWVcu8kjeRNMA9bUfezBTqQBAk2E9/QDcXJAhjp4tOSNgxamtHizm5ssUP3uAjiRw9bvidyjI6QAUANYtxRYR2S4wBnGyew7jxWhyoP3Qdyrtu6suaVb8pW1OpLmJy5qmsinBUdXgUwvdjSZ1+U2vF5ykXn5BijxWagMQsF4m980BgWoV3O+/SIp5KMbzErnFwN2ZY9P95IKZ76MrKahb26tPimXBdrhxbG2wmJzaPcRphmJTYrBWHAL0gatMJY0Z0Hm6vaZoEBLsMG/BHnj8JHrCazphnlTMp44J8D+lY6BM2qURw9/WcbRfZbo9HyGUJzvG1FCAfVoWwlSNg7Gx6tcJNEbQVl7rr7CC0Vc1jnBUp9/rk+QoBA4YU/j2mWWZN6eHxfwLwhGyz2bBlxOykUcdV3GJanw1sMdyPu11h9NYQJGnnGstAqLtPLwlx2Z38TWHatMd7xvzdWj31OeK+9+Gdaugc5rNJwFKx6pjD3XPkx7Cd/UYWNBFWOoOx54bZ4YymPR8jybC2KO8hOz78aKXXFw+T97ZhDdE6Vp5sKtBFplYqjXW9c2Iioh2i4RtRnOFGNaExMZAx6Xn96pJ0fNEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(186003)(6486002)(6506007)(8676002)(52116002)(956004)(316002)(86362001)(2616005)(6512007)(83380400001)(5660300002)(478600001)(8936002)(38100700002)(66946007)(66556008)(6666004)(38350700002)(66476007)(2906002)(6916009)(26005)(7416002)(4326008)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V7EFYgJRVnF9WWmHz5wj2QgvjrJZ6VBVoWNwXtTtu/62v0L7EZoP0ZodEyDA?=
 =?us-ascii?Q?e9fdun0lnUhYCVSP+MePJnBK9Hd5xU6xTJIjeLVhahU/aVQhyJkvrLr0RTMh?=
 =?us-ascii?Q?TFtT1cif3gtYz823s7UxZXMhPcHimtjr+/MwSwDkBJ2HB4WEBqgSu+Jui5EY?=
 =?us-ascii?Q?ltl3mQLgA5i/W6jVYPtLK61i4DN4bd4PVhe789giIoX16U1Eugu6GXmkcb0J?=
 =?us-ascii?Q?k5C2iT98FbcHiiQaoW5CFFAYNDvH98odbe/cehcmkxn+gYH/OL+JhjV1vse2?=
 =?us-ascii?Q?d6LkwGPGH8RWSh4CESO63UryMYUnAL6LBOt/jtuVJu4KbJPdDGgODfO7PS3L?=
 =?us-ascii?Q?8TPR1d8rd9dbJTF4PBRd4w/dvk/he21Z9cZRkDRZnvzcXbIjdH88ZiYXSo1+?=
 =?us-ascii?Q?Vgyc5Kpt5AFDWykT3x8Ub6wQQKK2UPyIDcTa2gObPHEzC+2zi7P+qxpznJRD?=
 =?us-ascii?Q?zjyK20u8gYjIMDx+5jAYOcNbKciIU/9XuxhaiitydvL91fe1v5jE9sUMdbX/?=
 =?us-ascii?Q?GTy+8geQYaQm3zKnXHDlWwjL3pzxsKl4QorXLlnv0AGTvi3Abc0NHXLQjEQO?=
 =?us-ascii?Q?D+kmpGg4meEYzY/yIXr5minmPLyaoaz1N6YRD5ukgBhMmNrOZI1P082Gz5DK?=
 =?us-ascii?Q?4GOrRMu2b62DhQPMLRklGGuIih0NnxM6RpddncT1s2uCDLCHk1uDRP0vthcB?=
 =?us-ascii?Q?qGK9+X9qJH3wame98p5+Yhg3IxoRBa9GvQVhmw7NIDWHx/pd881eoVW0BMQD?=
 =?us-ascii?Q?Cv0mnz5U0tgY+5I5YmDuRQq4uTfRJpK6rff/D3G+LmcnQxQRHjMzYN4NGLjs?=
 =?us-ascii?Q?6UOl4Xxlnbl0RXO+gzei/Orsizk9HlAMy7tvZqJrY07zRs++GeRrNcicabw9?=
 =?us-ascii?Q?R3/hXRFD6pJf8NQ6oanvDhLkjIxrXTwlYLnThgNbw93suKB8ipoEnKdNKTZe?=
 =?us-ascii?Q?89kqsyeRLOlHNQner+UEWuCLJ5zs4BC29FArGs5KWUBj7nhC/YY7q5wB7LJM?=
 =?us-ascii?Q?BhbW0oO8pEfh4XYNPQfNFKGvxhRHS8zl1x/3Gcf3UTFAIeEdc8zX6JrCPdFO?=
 =?us-ascii?Q?RKnJqFUHKHZbnqFqlUiBdOFZFwCqUgkkLtQ2Qv2G7gEABCQlN7WvZeu3zVCH?=
 =?us-ascii?Q?juT2EZ1AeJj4rFIdxBWWWdjytmlteQSGH6HzEFdPZuZ+F/9+Ce1yQjNVl+fC?=
 =?us-ascii?Q?HVcDO8gvtK6utB8fnq1qltqDjC1cwxyYG9ukFdvnsfktQ2RKeGrger+fLReZ?=
 =?us-ascii?Q?odjW7fgf8AWNKnAYUvYpBP8RzkS1UWY78aYZSWOw6rdE1c2YYEIjho+D+P1g?=
 =?us-ascii?Q?aO+GHB6/CToJJaqr2hs1rb64?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12baa23e-77fe-4072-5ed5-08d94c2f305a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:20.9392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLJQERDG7h0peHdX4sZfCgg2NfOb4Pr/jvGXvZD45FwtY6L3H7f+NBxYjqyfiWZS4EyW2Y67ogX6Y9y7nB5L6XA9SpqHLVJwEP/gjEPIWI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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


