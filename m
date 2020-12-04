Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB52CF6B6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:27:25 +0100 (CET)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJXw-0002BY-Pr
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFz-0003ji-PD; Fri, 04 Dec 2020 17:08:51 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:31968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFw-00027F-UX; Fri, 04 Dec 2020 17:08:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAdeda9ewKlDE86rHhb/QEF9LFIz3DWvmdLqEFs7/DK7zKJNFM0rMy/ndCW4OLLCXgCzl0Gt6coLVTdZYnqMPJroWyODWwRExcftUx0thNyTN6vDcYXhN5ITw+U7yKkTGPrwbnN3+SEbYKN1dDPxfPlW5bKNa0WwUwyicG4Nxq8QjmenHrDQ5gMEArSe8RqYKkKcRTJcMFtdLbzs9oecjh6C+Fv5EOIrMceUsUfxWpy0nzJX8sziRELEuVNzRxwG3O8V40kjI9qv05hkjffpqnhTXPMca8tskmh1ri5QYT0b92WeLdg1ktX7dD8IUstk7Yx/l6EOpDsJfQfew14fCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CkpcqzYLk184LzGCIOAvBN9VxggUzkMGCT98MeowCo=;
 b=bm9gk4qhcep4xhNxRGG7FgUFo9cTqeA15rvoAvuRG8rh4MI5ADTCcw/7jcHrxXXnl4V/RDqrer22DOeqghvyU/rODlbg7stFyjMhwUuwge0J5cRJ26/4lnRh7eP5gZTLLdSxSytyuODf/JekWPeiEaUfIUukQcqucHGeYCCT5vhkZJkCNyvUFT3uv0hYqhi2ch7rfg/HyL5PaQb5AZz4ESLtnPxNsM+2xdK30ZfSWkSEC6xGOkCJ2lnnQXeA7F41LR5NGF0I8V7M4LOpEe/X3QDxEcKHhUd78xbTjPHlCEGstVFi/3hujHezFVPr50SQQn3E2qO/1szbWlsslJi3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CkpcqzYLk184LzGCIOAvBN9VxggUzkMGCT98MeowCo=;
 b=gSJt46mLo7Ex0N/Yzc0JVNgezvJ7LAy8mS7SKSzJxTaIYsgxVErioI9K445lkpaI4XC+R5eIgkNVX1H7RgFs40YZWvIuLArgNHwKGfiaCD8tIeoc2O3p3p/fG/wy5e81/Z71gRvfLWELWi/8vc6NJuLI5N47LSjJk/wfc9uEsd8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 13/13] block: apply COR-filter to block-stream jobs
Date: Sat,  5 Dec 2020 01:07:58 +0300
Message-Id: <20201204220758.2879-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebeec4f2-720a-4075-9601-08d898a11f9f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072FD4CEF61670B4B1FB4F4C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJYfPpfHWG5QdjaCYrBe6woSNjklDLy8UR1jqBgJIq7nSTxUSxISh8MMIFC0bh2iP90j8Usvteonbj9PLW1CzhnGmZVuMZFlV9+Hef2oYXJq865UM/D2e36WKwtwyHbFfS+bs8CEK2y+UuRvgyuZkwNrBbeNpXDgikLGtmLpIIsBspKmIMZEs+IObZ9k0S0CaKsWl/PAZaMosMBt48+CQipgLmlaqB9Dprv9iFH2jVqC7nO9uuxKcc0RalYVSUOnjljKukv8zUy5rI1EIOthiKbO29Ciss+GrXCaoG9rqXhVVSsRzS6v5TIjx/ngRFTI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(346002)(366004)(66946007)(66556008)(1076003)(5660300002)(956004)(107886003)(6666004)(16526019)(26005)(66476007)(4326008)(36756003)(186003)(86362001)(6506007)(8936002)(2906002)(6916009)(52116002)(30864003)(478600001)(6512007)(316002)(83380400001)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YgRKaSlwCkuwkHF1ABgX3Bh/P4NjcKmF39PC93MICub7FMg0IAXmA1ydPI0Y?=
 =?us-ascii?Q?XkdQF46B0Epu9JjsiSMdeULZeI4WMgpElz0zdTezon6aDpK7wYVQd7HgmyLY?=
 =?us-ascii?Q?7rBJ1P0qpT+BSSrnloWeUNhxYlKNxALoK7jCSiDJFw1jkeUeHqEI4Sn73hku?=
 =?us-ascii?Q?4SLf9Di5FDJKf+1+c3yNAm48nuP7ZWSnCuw8YEPIJd2ZvFiTYdyx7HcGx8Mt?=
 =?us-ascii?Q?UjNtwSwIc/bKxcEugcwbcOgcmofdXZbSKTAfAoo1ByjNrqdhS/NsxvnTeMTO?=
 =?us-ascii?Q?VhgiDivz7PuuyiUvDH2kG7B559/eiQsCiFYZx0PYGYw/bve4fRcSPj+8VBQP?=
 =?us-ascii?Q?9LpinNvIRO1FSxRmDt7Twso/kuvUpZckUweq/y96Nv5qqQGn52ITzqfMkCBW?=
 =?us-ascii?Q?1UL3bGJESADD9wUZRl0SHTb+yFOYR1S7fcyDL3LPJ6U/WjcSc+mG5bNkW4t7?=
 =?us-ascii?Q?HHNFHhriyi6S1QhX5kXsx1Lqn+Frex4+iNQltQ/l6EwmYxM2IpZSl0+g/XhG?=
 =?us-ascii?Q?m4TMoHGhZIH2XVrAvB8XWjH+7of8uIx/eBVFQLVGEyKyHqNtcHGXZJkSDdk4?=
 =?us-ascii?Q?DqxRcB/a4D2gw5/k0zLAGcYKAPsU+E7V5TE4p0qXhOdgfBADou52qYr0RGfq?=
 =?us-ascii?Q?HnA3T7J46BuROlq8y1V0oWBgT6BgjjCJY1EU10W49K7eLJGp6FagquDih0pw?=
 =?us-ascii?Q?xfgckCnrGdqZHJ4jVLqLC2EyISJ5MUHJ0E3Fcj3Pgv98etCpdDPpFXGGlXfH?=
 =?us-ascii?Q?S46cpAFugWHvkYYghOvCkO+KvTo8gJz/5EWewrg0JUJ9F2xw1h4597VhI6qy?=
 =?us-ascii?Q?j/9bLC4QaL2kXG6gBgcphDVjY9BWEZBVTK0gdIYEyg2IpmfW8BKwf6QvWHKK?=
 =?us-ascii?Q?bh3LXEzUKZrp1cNf9R7HOAm7MiAATNoQmoGGxTT4XPgKelL0sltGPpTGEdc/?=
 =?us-ascii?Q?FGB8kTZdtPjUPuGbqzv/GBrS2p+EdTP4y40QiIF27FmhyfgUrRiHo5ZV9A6/?=
 =?us-ascii?Q?6EvY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebeec4f2-720a-4075-9601-08d898a11f9f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:26.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLTPptkrGmENlN0Ly5PvD3E98Qqkwu8hAg2TBCKbBS1wxSGCpDw7QAMV35UXyx9kymSANl8wfg/d6St/A2PAvtPD00xz0jzk7UIOUhR3lp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

This patch completes the series with the COR-filter applied to
block-stream operations.

Adding the filter makes it possible in future implement discarding
copied regions in backing files during the block-stream job, to reduce
the disk overuse (we need control on permissions).

Also, the filter now is smart enough to do copy-on-read with specified
base, so we have benefit on guest reads even when doing block-stream of
the part of the backing chain.

Several iotests are slightly modified due to filter insertion.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c             | 78 ++++++++++++++++++++++++++------------
 tests/qemu-iotests/030     |  8 ++--
 tests/qemu-iotests/141.out |  2 +-
 tests/qemu-iotests/245     | 20 ++++++----
 4 files changed, 72 insertions(+), 36 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index a7fd8945ad..b92f7de55b 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -18,8 +18,10 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
+#include "block/copy-on-read.h"
 
 enum {
     /*
@@ -34,6 +36,7 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *cor_filter_bs;
     BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
@@ -46,8 +49,7 @@ static int coroutine_fn stream_populate(BlockBackend *blk,
 {
     assert(bytes < SIZE_MAX);
 
-    return blk_co_preadv(blk, offset, bytes, NULL,
-                         BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
+    return blk_co_preadv(blk, offset, bytes, NULL, BDRV_REQ_PREFETCH);
 }
 
 static void stream_abort(Job *job)
@@ -55,7 +57,7 @@ static void stream_abort(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
 
     if (s->chain_frozen) {
-        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
+        bdrv_unfreeze_backing_chain(s->cor_filter_bs, s->above_base);
     }
 }
 
@@ -69,7 +71,7 @@ static int stream_prepare(Job *job)
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
+    bdrv_unfreeze_backing_chain(s->cor_filter_bs, s->above_base);
     s->chain_frozen = false;
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -117,6 +119,8 @@ static void stream_clean(Job *job)
         bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
+    bdrv_cor_filter_drop(s->cor_filter_bs);
+
     g_free(s->backing_file_str);
 }
 
@@ -125,7 +129,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
-    bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
     uint64_t delay_ns = 0;
@@ -143,15 +146,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    /* Turn on copy-on-read for the whole block device so that guest read
-     * requests help us make progress.  Only do this when copying the entire
-     * backing chain since the copy-on-read operation does not take base into
-     * account.
-     */
-    if (enable_cor) {
-        bdrv_enable_copy_on_read(s->target_bs);
-    }
-
     for ( ; offset < len; offset += n) {
         bool copy;
         int ret;
@@ -210,10 +204,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
     }
 
-    if (enable_cor) {
-        bdrv_disable_copy_on_read(s->target_bs);
-    }
-
     /* Do not remove the backing file if an error was there but ignored. */
     return error;
 }
@@ -244,7 +234,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     BlockDriverState *base_overlay;
+    BlockDriverState *cor_filter_bs = NULL;
     BlockDriverState *above_base;
+    QDict *opts;
 
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
@@ -295,17 +287,49 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    /* Prevent concurrent jobs trying to modify the graph structure here, we
-     * already have our own plans. Also don't allow resize as the image size is
-     * queried only at the job start and then cached. */
-    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
-                         basic_flags | BLK_PERM_GRAPH_MOD,
+    opts = qdict_new();
+
+    qdict_put_str(opts, "driver", "copy-on-read");
+    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
+    /* Pass the base_overlay node name as 'bottom' to COR driver */
+    qdict_put_str(opts, "bottom", base_overlay->node_name);
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
+
+    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
+    if (cor_filter_bs == NULL) {
+        goto fail;
+    }
+
+    if (!filter_node_name) {
+        cor_filter_bs->implicit = true;
+    }
+
+    if (bdrv_freeze_backing_chain(cor_filter_bs, bs, errp) < 0) {
+        bdrv_cor_filter_drop(cor_filter_bs);
+        cor_filter_bs = NULL;
+        goto fail;
+    }
+
+    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
+                         BLK_PERM_CONSISTENT_READ,
                          basic_flags | BLK_PERM_WRITE,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    /*
+     * Prevent concurrent jobs trying to modify the graph structure here, we
+     * already have our own plans. Also don't allow resize as the image size is
+     * queried only at the job start and then cached.
+     */
+    if (block_job_add_bdrv(&s->common, "active node", bs, 0,
+                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
+        goto fail;
+    }
+
     /* Block all intermediate nodes between bs and base, because they will
      * disappear from the chain after this operation. The streaming job reads
      * every block only once, assuming that it doesn't change, so forbid writes
@@ -326,6 +350,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->cor_filter_bs = cor_filter_bs;
     s->target_bs = bs;
     s->bs_read_only = bs_read_only;
     s->chain_frozen = true;
@@ -339,5 +364,10 @@ fail:
     if (bs_read_only) {
         bdrv_reopen_set_read_only(bs, true, NULL);
     }
-    bdrv_unfreeze_backing_chain(bs, above_base);
+    if (cor_filter_bs) {
+        bdrv_unfreeze_backing_chain(cor_filter_bs, above_base);
+        bdrv_cor_filter_drop(cor_filter_bs);
+    } else {
+        bdrv_unfreeze_backing_chain(bs, above_base);
+    }
 }
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index bd8cf9cff7..c576d55d07 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -278,12 +278,14 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-stream', device='node4', job_id='stream-node4', base=self.imgs[1], speed=1024*1024)
+        result = self.vm.qmp('block-stream', device='node4',
+                             job_id='stream-node4', base=self.imgs[1],
+                             filter_node_name='stream-filter', speed=1024*1024)
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('block-stream', device='node5', job_id='stream-node5', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-stream', device='node3', job_id='stream-node3', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
@@ -296,7 +298,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # block-commit should also fail if it touches nodes used by the stream job
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[4], job_id='commit-node4')
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[1], top=self.imgs[3], job_id='commit-node1')
         self.assert_qmp(result, 'error/desc',
diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
index 08e0aecd65..028a16f365 100644
--- a/tests/qemu-iotests/141.out
+++ b/tests/qemu-iotests/141.out
@@ -99,7 +99,7 @@ wrote 1048576/1048576 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {'execute': 'blockdev-del', 'arguments': {'node-name': 'drv0'}}
-{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
+{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: stream"}}
 {'execute': 'block-job-cancel', 'arguments': {'device': 'job0'}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "job0"}}
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index e60c8326d3..432e837e6c 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -892,20 +892,24 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # hd1 <- hd0
         result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd1', auto_finalize = False)
+                             device = 'hd1', filter_node_name='cor',
+                             auto_finalize = False)
         self.assert_qmp(result, 'return', {})
 
-        # We can't reopen with the original options because that would
-        # make hd1 read-only and block-stream requires it to be read-write
-        # (Which error message appears depends on whether the stream job is
-        # already done with copying at this point.)
+        # We can't reopen with the original options because there is a filter
+        # inserted by stream job above hd1.
         self.reopen(opts, {},
-            ["Can't set node 'hd1' to r/o with copy-on-read enabled",
-             "Cannot make block node read-only, there is a writer on it"])
+                    "Cannot change the option 'backing.backing.file.node-name'")
+
+        # We can't reopen hd1 to read-only, as block-stream requires it to be
+        # read-write
+        self.reopen(opts['backing'], {'read-only': True},
+                    "Cannot make block node read-only, there is a writer on it")
 
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {'backing.read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts['backing'], {'read-only': False},
+                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
-- 
2.21.3


