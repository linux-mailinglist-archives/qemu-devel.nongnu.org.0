Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9053A2B29
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:11:07 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJWc-0003ol-El
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJS3-0002LV-C7; Thu, 10 Jun 2021 08:06:23 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRv-0004D6-Ri; Thu, 10 Jun 2021 08:06:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMh2+HNisaGPEK3t1NraTLgFbbGegnDyiMPT+7SW8RsclbbtTKT0nu/Pg1102I78rv5T1m1IaIY0PIGMYmeGnPtf6BrIRUF763BimpK3tPfLQfGhzZoUBG1aSB62nynz1Un4scNdfQScqKmoE3oWj6vaso/auxVowrzFHW+uhLXqyJ3zm4ONPFZ+ZdSHf7EUr7rr9+tHo9S5NpVBLpdxDD6IOwfaImo3Lde5moKr7EKYx6uMZspn02tzNDWRY9WM37cUkMcFfGVm0aZs6/efC8Ar3+EzmOikGdX2Q/QxFbCpV1DjY0WOtQc/86gPHaZy6NFL4lB9jwla0AuqsMC+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QJOe/GYl8SJ2H5NZjtoK4jH8XcIAFqR+/6sw7/HTpo=;
 b=VQbmP7HWSPiDXCQZj6TkzU1nwi4FeGHQrsRa0iiCMZCfnXu9ltmCBos3vlV+neC4lQnpefHGdMe+Ggmgq1wdQr835YlyBI6XmKvFB5N+873+EXSBMXzemdzTp/Y12i/MIvvf2Ifc0NXOp9Oq7vUCX+0WQiDiebn5r1RKC8q0ilmcO21moX/jHm+2NXx9f/IX9wQI12LhJE0/OHj3d75yuQ57bMo4DldR1z3JK2zC4LHkCVrepeIwZDw8nFgd5qiiCXtl2poltGJrpi68+4QTepNPyRclQllcgoR3S5HjwbA8QuI61LdRV1BrUKs4H7msjM1LN17DVmSs73vjq1qQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QJOe/GYl8SJ2H5NZjtoK4jH8XcIAFqR+/6sw7/HTpo=;
 b=ebtoLdpyCeei5YYw22AbT3AjqoddQw/r94xWqTE4H35K+RgQuPQ2Ir6E9LMywrEEJTBGCSxaIxOtA2xSxzd/00zcYSfEKfH/oi8vwujSlJsPELUovJEbI/P/IoGML9AR1AhrA7f6TPo7p6bWMlDzqig9ANeJnPHveYvtAx0KgMs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:06:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:06:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 8/9] block: Allow changing bs->file on reopen
Date: Thu, 10 Jun 2021 15:05:36 +0300
Message-Id: <20210610120537.196183-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:06:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4173b4d0-3359-4ff6-b245-08d92c081cf0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277D893BDAD77F37686264EC1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RT7hufi1kguAE6mr2GoDLMD1lWjdiotG2tcebH1l6nCLipIb9ryAV40Aa5oSPGCyvXM9tpe37IRm8/Ye3EKubbJk4PzH66ouMYE62nRt9Zf/E6JdP9e0RO4DKqBomE4xMsmcAwcDA49HxXMozX6ozvnT+pNl5u5NZecHejCxUpaM7r4ukTaZxOI/N6RfKjtCDhnC5tk4iJOSZpfX3S5l6fWqAyLOmkTuRSnB9dfI/ekCX67puwqn7Kc/bJFEHNTm5ksCrHPnSc83waIrvSZKDAKy0fVdEMtFf8TSAtFf6V2eOKoVMQqfUuf9acN/mEYbE5Kzm/xMiNXsYdbKq3tiBJh5ZBt763Ua/cosJzq4C4I4slKZgC+xluLYnT1i1iLwDoDWfGy5e1fcwT/vRBJoF8SfsHXXgxuZ8x1IaFPBMRthspw1fK7jxgTEP7sQhxNIzXrfXLHSoTS3E3RYutMVbqwIljaYcMCcAVe6Yxar3/tYgRDvDDtTy9EwA45CjH3f6SctE4gcFzisFspw2ZpHAvZvmdLiIMNH8CCunp2NrsjA1OHXijWCnrQjFLgmW4wlhGd7kbLSiZnPF1Myg4RCTotuRNVPwKgTXZKbe81MxXKw9hXBdueEbObvRFX232e5ZIXyTGNCtN0vFRczjBEoHzpTtELS/k7JVfkcnaHPpNzx8G6c4mCZemwd1TM1+E48
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(30864003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2oKQLBkHn4weZ0isFa95GcTt1Ax49/3nqHWB05UNnOUDW+5t/Y32tHwqjD39?=
 =?us-ascii?Q?QwLNWZGmYxQMuwkxRApRIEuSKTlWCLVH/Di3x8MFz6T1a6lMT+zZELB9gwjF?=
 =?us-ascii?Q?YVBjU4wWhlrLiwKlYxMt9ToTCxP/rv3SHHsfMLhCEek0VlALoEZcOGBHd9GI?=
 =?us-ascii?Q?nlD2GtTl98pj6N+WUqUnbCw+wLiwvcva1mEivZGLeb1J/zYPRFq82WAAmI1D?=
 =?us-ascii?Q?ow8YoY57y/2uxXOonygBrslWTEFjgUEkCU0xI22tigFh5/62E0XWLgZxYSqT?=
 =?us-ascii?Q?BaXaaBzucMqGH+Z7vk07UkfoXTHiUHWStFa2zHdMJM3BtSWbrb2rLzbO18eN?=
 =?us-ascii?Q?pUu6nVFlBNY6ZWdPhFHpvC8gsjni542fQfHljR6HGOEUlNz9/DNNxzlhmW8l?=
 =?us-ascii?Q?mdDcJ/yeGMpbUNDdTvTTAxYTmHpK6Zhnd7ggbBiRokbXc+9Qmr19IOrCIH2g?=
 =?us-ascii?Q?dkkSRTXZqHXIW+MfqA1H5+L7BwghljV7VJpDMwo5l7CV9ujCZSBwR+g6XqUf?=
 =?us-ascii?Q?zuBB6LuBd/IRRXu3tQSIb5wbL9t4BAUa6w6v9CQx6QJPj2R36wzGUwuhJRUp?=
 =?us-ascii?Q?cWlmhEoTgb3YSv8XUKrut4p/usGbG424wH97JYW/bRhYE0EzAtJS+3tFMBPK?=
 =?us-ascii?Q?NkUzdrK8cH8h2VnXCJnuG5gE4k6tJ9Caloy6e/F3Xhej2CYyfr1Ve5462DZK?=
 =?us-ascii?Q?fhs21M2T9wDaMOV/cMo0+0qVdpqXJ7sDRJybuGTvEN1/T28qOZoSCsbREAe+?=
 =?us-ascii?Q?IDziEE4eAh4v3FPp6FI5d7/KMSq9Yg/21jo9Qpwxmg1cM1unWbAlUY0SEeiB?=
 =?us-ascii?Q?jrbTZpp/BCwbmuNj4QSM2i+VTWXMkzCgMFVW4vBWlYWpTiZdryRAaQ64I1E7?=
 =?us-ascii?Q?J4+uFpKztXzEUrl4JnLTlrmelk4yslVcfuwVDVcUs4X/T2pbjSo8JdZEV6et?=
 =?us-ascii?Q?TaifVWp/AEtu30ZSOtQO1eZY8ub+pPEojTmFxVjkQb6jUbczU9AYE35GZ+vr?=
 =?us-ascii?Q?9rC0sBlSpDUChCgKBPYOhpQV2S0UvZAdlJXJe4sSnHSpjXgPmGahoPHk96en?=
 =?us-ascii?Q?HtdGuWus198pDLAs9LqzmY/sekUEZcjezFFrl8WsWuZ7K+lUeePN/naUZ7e6?=
 =?us-ascii?Q?GB8JHQLYraWLb0InPiOoagStQx+7w3iPjYXF8tYXr1OeyHF16VTleIihDK4h?=
 =?us-ascii?Q?Ybq7btOOnQYx1AXZhiEYGc0Uq0P6KammXbwwd92rTVHMoM33+reU+v3aVIeB?=
 =?us-ascii?Q?59QbDVJel/vHC9cTuSrU5FczVpcQKxJevEpN3+f8weicxfLO1fT7MVGxWyAo?=
 =?us-ascii?Q?w9jKrByuj45R0u9gAwkWo1Gl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4173b4d0-3359-4ff6-b245-08d92c081cf0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:06:00.8613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1wof5YNTk7IiTyIEtADfhMeR8j4vn4bmjhNkSp5+6Su0mH+E4PuXgvk23bUJoBwvcqg/Oj9QzSFAePi+WoTavvVwLtk0n9jKPDQTWYRjq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

From: Alberto Garcia <berto@igalia.com>

When the x-blockdev-reopen was added it allowed reconfiguring the
graph by replacing backing files, but changing the 'file' option was
forbidden. Because of this restriction some operations are not
possible, notably inserting and removing block filters.

This patch adds support for replacing the 'file' option. This is
similar to replacing the backing file and the user is likewise
responsible for the correctness of the resulting graph, otherwise this
can lead to data corruption.

Signed-off-by: Alberto Garcia <berto@igalia.com>
 [vsementsov: bdrv_reopen_parse_file_or_backing() is modified a lot]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h  |  1 +
 block.c                | 78 +++++++++++++++++++++++++++++-------------
 tests/qemu-iotests/245 | 23 +++++++------
 3 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index d28022e761..7ec77ecb1a 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -209,6 +209,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
+    BlockDriverState *old_file_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/block.c b/block.c
index eb98aced9d..d7d309cf52 100644
--- a/block.c
+++ b/block.c
@@ -92,7 +92,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp);
+                               Transaction *change_child_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -4148,6 +4148,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
             refresh_list = bdrv_topological_dfs(refresh_list, found,
                                                 state->old_backing_bs);
         }
+        if (state->old_file_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_file_bs);
+        }
     }
 
     /*
@@ -4240,64 +4244,81 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
-static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
-                                     Transaction *set_backings_tran,
-                                     Error **errp)
+static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
+                                             bool is_backing, Transaction *tran,
+                                             Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *new_backing_bs;
+    BlockDriverState *new_child_bs;
+    BlockDriverState *old_child_bs = is_backing ? child_bs(bs->backing) :
+                                                  child_bs(bs->file);
+    const char *child_name = is_backing ? "backing" : "file";
     QObject *value;
     const char *str;
 
-    value = qdict_get(reopen_state->options, "backing");
+    value = qdict_get(reopen_state->options, child_name);
     if (value == NULL) {
         return 0;
     }
 
     switch (qobject_type(value)) {
     case QTYPE_QNULL:
-        new_backing_bs = NULL;
+        assert(is_backing); /* The 'file' option does not allow a null value */
+        new_child_bs = NULL;
         break;
     case QTYPE_QSTRING:
         str = qstring_get_str(qobject_to(QString, value));
-        new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
-        if (new_backing_bs == NULL) {
+        new_child_bs = bdrv_lookup_bs(NULL, str, errp);
+        if (new_child_bs == NULL) {
             return -EINVAL;
-        } else if (bdrv_recurse_has_child(new_backing_bs, bs)) {
-            error_setg(errp, "Making '%s' a backing file of '%s' "
-                       "would create a cycle", str, bs->node_name);
+        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
+            error_setg(errp, "Making '%s' a %s child of '%s' would create a "
+                       "cycle", str, child_name, bs->node_name);
             return -EINVAL;
         }
         break;
     default:
-        /* 'backing' does not allow any other data type */
+        /*
+         * The options QDict has been flattened, so 'backing' and 'file'
+         * do not allow any other data type here.
+         */
         g_assert_not_reached();
     }
 
-    if (bs->backing) {
-        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+    if (old_child_bs == new_child_bs) {
+        return 0;
+    }
+
+    if (old_child_bs) {
+        if (bdrv_skip_implicit_filters(old_child_bs) == new_child_bs) {
             return 0;
         }
 
-        if (bs->backing->bs->implicit) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
+        if (old_child_bs->implicit) {
+            error_setg(errp, "Cannot replace implicit %s child of %s",
+                       child_name, bs->node_name);
             return -EPERM;
         }
     }
 
-    if (bs->drv->is_filter && !bs->backing) {
+    if (bs->drv->is_filter && !old_child_bs) {
         /*
          * Filters always have a file or a backing child, so we are trying to
          * change wrong child
          */
         error_setg(errp, "'%s' is a %s filter node that does not support a "
-                   "backing child", bs->node_name, bs->drv->format_name);
+                   "%s child", bs->node_name, bs->drv->format_name, child_name);
         return -EINVAL;
     }
 
-    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
+    if (is_backing) {
+        reopen_state->old_backing_bs = old_child_bs;
+    } else {
+        reopen_state->old_file_bs = old_child_bs;
+    }
+
+    return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
+                                           tran, errp);
 }
 
 /*
@@ -4319,7 +4340,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
-                               Transaction *set_backings_tran, Error **errp)
+                               Transaction *change_child_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4439,12 +4460,21 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true,
+                                            change_child_tran, errp);
     if (ret < 0) {
         goto error;
     }
     qdict_del(reopen_state->options, "backing");
 
+    /* Allow changing the 'file' option. In this case NULL is not allowed */
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false,
+                                            change_child_tran, errp);
+    if (ret < 0) {
+        goto error;
+    }
+    qdict_del(reopen_state->options, "file");
+
     /* Options that are not handled are only okay if they are unchanged
      * compared to the old state. It is expected that some options are only
      * used for the initial open, but not reopen (e.g. filename) */
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index c7d671366a..d955e0dfd3 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -146,8 +146,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
         self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
         self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
-        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
-        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
+        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")
+        self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
         self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
         self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
         self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
@@ -443,7 +443,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal operation: hd2 is a child of hd1
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
 
         # hd2 <- hd0, hd2 <- hd1
         self.reopen(opts[0], {'backing': 'hd2'})
@@ -454,8 +454,9 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # More illegal operations
         self.reopen(opts[2], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd2' would create a cycle")
-        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
+                    "Making 'hd1' a backing child of 'hd2' would create a cycle")
+        self.reopen(opts[2], {'file': 'hd0-file'},
+                    "Permission conflict on node 'hd0-file': permissions 'write, resize' are both required by node 'hd0' (uses node 'hd0-file' as 'file' child) and unshared by node 'hd2' (uses node 'hd0-file' as 'file' child).")
 
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -497,18 +498,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd2 is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # hd1 <- hd0 <- hd2
         self.reopen(opts[2], {'backing': 'hd0'})
 
         # Illegal: hd2 is backed by hd0, which is backed by hd1
         self.reopen(opts[1], {'backing': 'hd2'},
-                    "Making 'hd2' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd2' a backing child of 'hd1' would create a cycle")
 
         # Illegal: hd1 cannot point to itself
         self.reopen(opts[1], {'backing': 'hd1'},
-                    "Making 'hd1' a backing file of 'hd1' would create a cycle")
+                    "Making 'hd1' a backing child of 'hd1' would create a cycle")
 
         # Remove all backing files
         self.reopen(opts[0])
@@ -530,7 +531,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # Illegal: hd0 is a child of the blkverify node
         self.reopen(opts[0], {'backing': 'bv'},
-                    "Making 'bv' a backing file of 'hd0' would create a cycle")
+                    "Making 'bv' a backing child of 'hd0' would create a cycle")
 
         # Delete the blkverify node
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
@@ -563,7 +564,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # You can't make quorum0 a backing file of hd0:
         # hd0 is already a child of quorum0.
         self.reopen(hd_opts(0), {'backing': 'quorum0'},
-                    "Making 'quorum0' a backing file of 'hd0' would create a cycle")
+                    "Making 'quorum0' a backing child of 'hd0' would create a cycle")
 
         # Delete quorum0
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'quorum0')
@@ -969,7 +970,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # We can't remove hd1 while the commit job is ongoing
         opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
+        self.reopen(opts, {}, "Cannot replace implicit backing child of hd0")
 
         # hd2 <- hd0
         self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
-- 
2.29.2


