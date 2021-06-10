Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418673A2A7D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:41:39 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ46-00041X-7N
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpl-00037v-LV; Thu, 10 Jun 2021 07:26:49 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpj-0004QC-HA; Thu, 10 Jun 2021 07:26:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzpoo5iwx/XMSMmCMNz/uYItedstommGSPQTXnTifbg6EdD/d9L6Ub9Rp1D39ZLbYBZX4dYjIgxlUNcgAgWLRNndmYHT7gtBGTodYY7mkrNaqqYMdAZiIW31B3H8bmqFK59rCYS08r2nysYLFGjBH8lAfxvjK7hk8+Nx2ehxaW+pjcMxyroQlVgfPXi0huTVM5dor61OCAecgC/5qJPAbkdsHKHwousiM4nUnydWb4jM59FedVm2ogDJwHAtLCqGWL8BKhDJom1NDphxmbhHilhwUoKSS8kghITrtSbhBNs+O07AZMctiCNb+tiMqI/Xz/c5xWzAt3RQ0Ln11YNiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=X3ygWCCFGg/6JiyCpku+O6/XG+8QviJxX6iRX3Hxk7AwVL97auLT2csMiHofLFsT/W21AvVOBcIq1uf7Rr+APNGMm8cQYP7bjXbV6RA3y4ed3Hw5MdN50FOlI47CDvPO/oqQESQvkvMwKSeqWD7JRS44xhUt3AMuNGgZmsRfRy+KZ0iDfAvA8Fe4QfjWwMmWiHTMF4A3rtY2w+l1c1ZJqjiaclGX2SxBAzDlNjcF1XlxVpUZe+i/qIDd3KCYgs1scUpfLR+EQDylfDS4ycUlODBr4odlmLTThtYfwnXEE6tzrs3rWCRZrBo1qivNXjb9xGQJoCeSnvR7KRhMLJSdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=G9BHBNAxdjxK0WkQU7I8+JDPWJHg/UTyNXSWwNk/E/LVIIhs7oDpU0FnaKQ4H5YYlLMpSscYjW0aFgX5SXjzsejmaSjhtNvXw1hU46F8FJ3A0TehLIazxx3zxvoSkEtKlq3FYD2fjD3ysDk111o823IU4OeK7QDICwclmvHf3Eo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 10/35] block/backup: set copy_range and compress after
 filter insertion
Date: Thu, 10 Jun 2021 14:25:53 +0300
Message-Id: <20210610112618.127378-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42e57b2a-35eb-4659-8b5f-08d92c02a08c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381F6266FB6AB6AEB7B53C4C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucpGSTYd+DZsEkLwlsE/PixKoR+ePmPBypQ19MAfo/xkPFBfgZJZQihukdEiremKBC9CMpfVr37MXwsGX2DDgwzhZQiylvwSnHrXYRgDHxqna6pIW5785e5Q91nk85rwScAnD9VrSxGrClpm4BroGfky40HJXVW0AtbMqaRgpPTHNI67UPWAXZYAoXwCSRx5sUwGrDML7nuS4bhXEAXwuqbPe8c310myZ0RYlGusUE1UclTNMWpkoNJvrDjEnfgK9BR31MhJxJa6G+QVkae2xBAPHxRj/oBk1q/zn5kUioLmTcTPIU+qO/p3lIrWn1pXTaQ299amIQTbdWBoUUmm1vAtQLTYJyW8uoS5YuUoyrF/TzjkWpcHP3COKAMWEsser1JpIjK3tZ6RIal/wps5dOxa27ucZ0s5ofpmg7H1zaC0YMD5XP1yT4ka7U2s34V/ZNHZMe0z+Ao8Xyxf7kcySpFW88E++6C2No0qFC4XL0SMlGW94G85RHty7moak8XTHjxwI1sM18LNYwtgkhf/9fiIQNmrZnS6kqyVDnFWcZKA+ICVENMvGfJD2rzKqGQFx56SJIG3moQsut5oCVS1HlgLs55pGYqr3nZKCkCwA+ybKxK7mb0H3xGbsxhQtnmwSh6gMGZNNcjyIJZdd5zsSRpkRjcmHtulCIR+vB1vR8c8THL9qBxnTNmKr5PgKiVn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?w++LNqw2UGAQxGNaMSTpHLlyPuO8nytlW/Y5B5jKFasN9ABxi+/NnvOdWjHj?=
 =?us-ascii?Q?Rc6RxvUcVuquHEQ6T6POYIyLIw7gSWM+knFTZ/oxVqo3e6DajQERY5qR87/a?=
 =?us-ascii?Q?aMbRY6pZyiN0HKRuMe0OL/fdM+F+Tq5Ad9cewk3BOle+M6GIT3NZht5Eox2x?=
 =?us-ascii?Q?bl9Y2JPB70o5WSpM2pr6BPkysCOvtN1py7/Tce6j0+GZiFg5UF2v476pzG8u?=
 =?us-ascii?Q?GDbNWG1h41jQjNEDi4mQ/SuzVHuLYJJNjY3PgKIZqA0c8Kxkt7UEHmSE/pZ8?=
 =?us-ascii?Q?t2eGhu7pihp6agvDOD9J01yuP/xnVAQnfRE72NwvzWGp80hSNBZnHWeMrZr2?=
 =?us-ascii?Q?2Dvt78h2cXBJGskxkeTEAXgfsGcBJyI/PCnePp/9HlHZl+NXLZn0y+ADYvUl?=
 =?us-ascii?Q?LDTeObXw6oB+Lspr/xbdl/sA/ZgXx7ZILU08QViLF8cYE3zqlZDB5A/ytN6k?=
 =?us-ascii?Q?PaMLRcKF0TdeY3a5LaGkJ5jZW9cEocEwT3tFywm6f+wYeCJVxd2CHUEePr5s?=
 =?us-ascii?Q?+MiQYaMin7AdSUPNXz4vb1scPCfbTsu5l50V3p0BxNl07Hkhm3qqmoePCKpI?=
 =?us-ascii?Q?A1t7qpbdyy+cnAsQcQyIyuSXTmNXWKGdQhx1Tm1UNBrsiVI26UTagMe7y/bP?=
 =?us-ascii?Q?gNt8kQGrjng1tQ+l9JfM8Xut8fYLCTbaOgtO9bwJcDZJMx9JjerAmK4+/luI?=
 =?us-ascii?Q?BNl2gn/EjfqOnYzZwjirT/O4RXtcOupwa+6yQoUS/bdfcb+Zt9cBcIL5UuQr?=
 =?us-ascii?Q?GIZkqY89YiTeUK1awIdvFSE1ql1bgmnrqHN/JQPPpeNfDFL74fuNTDiFOhKC?=
 =?us-ascii?Q?7KkUCEK6Kp2Bz8mTYjzN/ReqV1woy2FMH6YXjokbw8s+ZNv5QcG/8lS9lOBw?=
 =?us-ascii?Q?g68KlklnriV5dZOikxTEdV6lH7dUP6CJba58rJ2mJz6zGgZP/vPyxi0Wym6p?=
 =?us-ascii?Q?ayDuLilF8C19n8Sk8AlGwOllJJgV1j2FWseY4j5bG6lSVGLN8iRzznmsY5jX?=
 =?us-ascii?Q?nqh3WJgjnmSoWyROuNJ3oJNXvkruSpYTZno5/7agANllbCqNQj5jOhqhVfvu?=
 =?us-ascii?Q?hNtLZ20XkUBJSbEvx4MWGJMRXKEIbmyuA4ccUqmGdNp1rWG1W2NGi2VdQJ4Y?=
 =?us-ascii?Q?zXUHq/N6bTA2bMC2ouSmlfCObdFN3xFLPmNV6bNkV/zwPKEesbvsSRFT4Vlq?=
 =?us-ascii?Q?so8HSfHCXtjSgJjKLnNv8aWMllF8WHNmV8y7YVVRn180PLtBVKtYz1p/xZBZ?=
 =?us-ascii?Q?m16qQtCwVYYFuFMc2ZmJ4U/vT4WVAD113KGZwH+cpu+VbfARekkzlMnLwQ6w?=
 =?us-ascii?Q?ym1Ou+M1ApWtRl65z2AN7qxS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e57b2a-35eb-4659-8b5f-08d92c02a08c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:44.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrWROFkK9sWE9cTgxTrAnkmgQYYabdlbHG0MH1QdzPU+jXQhi7AMS78aahW1l+/fCIYVjhV5DLPSXO7thl33p0Rhp7JpPB5dVlcDiKDZV5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


