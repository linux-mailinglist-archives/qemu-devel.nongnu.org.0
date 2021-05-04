Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7E37273D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:30:08 +0200 (CEST)
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqRT-000206-7B
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNr-0007xw-FS; Tue, 04 May 2021 04:26:24 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNm-0007EP-Cx; Tue, 04 May 2021 04:26:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLpSVULnTfX9FlnPOwm6CHILyc8O5rzti0UBeQmLPLmxPfAHDoeqVD/vSz4NKSIB8xO3s/qB/waviMH9kuStiUuQZes+cQIdrw84fv8hdEcq4NvzyQlvpOXjoaKEV22G600xtEfNfwUf3H6GikeviaPJScaJ6Ld0Xu4oGopsjIVxYuATXszZSiJ9Blb8Q1Aam7QDtnXaneH4he4HvaZSGm3iQgY6r41ozHpoXqtRDW8tYVZKjgPPIvzR6VafE8DmV1h0FU+L6mrXJdSiK/sL917r+4sFs8ZMYEl4GBVuYLS3TLAZ9Vy5peubbLrzvomvs0iE7VUpHytwhouO5OossQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmHB0lj8TabK4FS3vkmWqcWawAA1oj+0/hNte/Jhqaw=;
 b=ceZtXJ7v+BvuHiTpDdHgPbIHICmc6Ag5kw4sdgJ8ASwwZTSoC5g2xBKkSTdPWvE5/H+XKRdjZAKi+sSgHGY86Im9cReYDRspvWwxkUa84grtPIVmNrUdYtVl+9Np2pccNk5w50KvMSgxFOXSgicBKcPCEEI5w+7egyWf4wteShEeIZcVMrCXidFoPvyjbs4ta6prBOrU1XFaOG4wh1Eam6bb8UO+3mH3gx+myr4Ybk616bdOQBCKIyGsASUR9s/jO9WoIivw0z3IVm44CxShEohrjRbfdr02WoRYYxc6eAgYcxsItKQunsepfjRBMMnAAb+N5/Cf7kWBbZxJlorLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmHB0lj8TabK4FS3vkmWqcWawAA1oj+0/hNte/Jhqaw=;
 b=OfhMKVRW7LwV6peugACNCTExrDd7EAefg3ZrLHzZhXnIgjmIVTISITsCdXH7MuhdQtDvAPP5UNocvx4V/7WUC2/oXWa9D3DIBMqcDZsPIp5xGU4URKSjliiOBSs0u1ic6eichXhGl46e0/7E7aADuIEhTgow25x3CFvBySiv94Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 1/9] block/write-threshold: don't use write notifiers
Date: Tue,  4 May 2021 11:25:45 +0300
Message-Id: <20210504082553.20377-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5320de76-e798-4700-89fd-08d90ed644c3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381FE96F556A94E4AD2A9DBC15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ou7o9U3VtQFyA5fzY8EscaD2GNFWyCiWxPYwL954bLrB9jiQAdQ/YzIWM2XCSK8ectbVGKOAvwH0J6F1EuMHkJ661BDyRsDEUaqaxlJci4C/U6vJy7k3bD9xG0vUPZGBldhgkFNA6FR9U9EvUtCDiUiVypI36513TMbBrFaOLX3jL4QJEncEIWnAanE5d5kWboTvJbVLjH6LHW8lG6wcg9mUOvAAV1JgzBwv72+GbfTq5UNkq/83qkEKWntb+Oi4ZVdnG0i6DEnirhOnCJ2g8AKKceKdgeQydOXG45Zb/biwtgr2baRb3cQYRaSTS+aT9r0fL035qdOMp10ECqtoTpmtLHU65BtdNMzSdYZGbtdVs6fpG8UzVi7I3Dj5/j/RqsuEyOZYR0wt5ZUVXvAYfMZQVquLHoa3B6bBttItXCcKmNJHX55NH4AnIvVAID0SJwjmc+dffwOAWL0M7AFQYNQoE1V+4cgzsxYmify+NVylvvomDpOTonP70yL/GZ6JWjrFtNzJOgjBGengmsGOwyGyms5a8b8hqCqAK/ElFHt9KVGwTp0ALD0niuiGF3TmpbKECwNtOAceepvcF7gxJ6T+6qVk/NCGHXSFjFAgDpqE+1SvOKV7H+bDpo2JBYMDoR6CJE86SBWLcLJ3/fhCWqlItivTvUtNe5g4oTssTlGprTIe6fvBytUDgTESnz4V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ovFvRi1YPAcuajgE8vpjx/w/v9Bs20IETYn1ZFkyaNyoDCGC9fVWWfivtQxy?=
 =?us-ascii?Q?UdvN/l5E0iTTdpyEBFZQ9pScnvP6fryWV5YklazFrStEnXmhRax3np6Lbt2Y?=
 =?us-ascii?Q?ORdpXFyGE1VjK4Sr2LQynxWFe255n3wRzyxne9k7/L16E+uWe5pgoy7cckGy?=
 =?us-ascii?Q?XT5R65luMVaOXfEtJJ/HQWEOxCbLfex7n0mnOvwTbcXYGJZpqwJvQPkzVr/c?=
 =?us-ascii?Q?iKDxPTqgyHJYiu9pPJfHC1aff/a8oUiXxBWF+Ju21aRhE1m30We4D8/F3mTr?=
 =?us-ascii?Q?y+p1Bvkepi0Dp6t5Webzj1qJQFsgPRj18G+fe8Wun/WeQFXJtb8XZGg+gCdb?=
 =?us-ascii?Q?mEMAjXTvhacljXvhn6EUujHvIQnWpd6MQQZ+gJLC8YjqWfI/oZFq3kTfx96d?=
 =?us-ascii?Q?8ZrgbcjTXGutgWuKeBw21vPVop9S7s0bC4FL3ea36w12uvyLKbqwKAKrNrcV?=
 =?us-ascii?Q?VllggpsCJSngz8AjIK/mrNOEHqxoCsdoq2t4bO1oF07ung9dmSUYColhvmS3?=
 =?us-ascii?Q?ZDh9kFTL3KtMofex64XTXh7Kft7aK4ngE07brn3hWq+5ZGpKXPLKhw0a/p2q?=
 =?us-ascii?Q?yspxkTuC8fMyqNcRoV0yxawzugPWRecM9LrFRtgHWps94TtR3JWtP0LGzqBN?=
 =?us-ascii?Q?9hhvqqF8noLFdb2onndi9QoL9MPq/04rogoSp6GOzFKL50pKZdjpPYcWibt5?=
 =?us-ascii?Q?RrQ2Aw8ku5qYvuqiG8dYwLW/1r4Haws8tF6RuswqQ89qLlP+T5ZZeqB3XXb1?=
 =?us-ascii?Q?LA5uNB8KNUHbO6rx7NVDI+FqXo7Llbghm0pKdSOFd35ld0LnIW+Zxaxk4EPI?=
 =?us-ascii?Q?sD9T9OPbDupoo1B1m9D2fT8ljeu7c7dMkLnSYTr9jODnfUjZ8S0zS1jHGT/T?=
 =?us-ascii?Q?DYSCbufzxaSdSqJluxtJa3lsl+zg8j8PJ/xD4otiFuzfkNJXf/HGYj5n5j27?=
 =?us-ascii?Q?i14n7diy8mkGVNFfQcMOifphWRqghJXHAXstWgT//qKAZAbUWWcg9kIl2SnJ?=
 =?us-ascii?Q?6y6DhbUILPdoL/dOjZd/edQ1wP6pZCBIaHDybiHqFrAgZixeVgWaJo2MDg2P?=
 =?us-ascii?Q?Eihe+UKdudH/+44P02m0GHPpwzvWf6TvL5ahUZ56mK4tKeLUN98pB9ide+HG?=
 =?us-ascii?Q?hz7IGUU6uBDjNgql9oHkfOe36yMZmRx9oyZI2xNzdyS4iHfQsr8npyxo01GD?=
 =?us-ascii?Q?bvCYwpyYk5k17VylV7vnvquw778n/c9IwRUL6SJcB6UFtuxPPAGGTD30bsHA?=
 =?us-ascii?Q?EBxaOP/3bPJBffe5IAcDTA3C/1v5wizR4fIqp3vuVK6Y2mUZwWae14OUtMO+?=
 =?us-ascii?Q?f+ezAR2Z/Iz4k3WuQHQYUyQX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5320de76-e798-4700-89fd-08d90ed644c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:09.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRg7Argva3cqqVY4SO/29FIi0uVZWNa0Epi+aGhuBCgnWlSYW/9UacT+NhrrYgY3oyZ0PHie8ALnhQrfnoIQEebYgB26asipR93dPwD+aWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

write-notifiers are used only for write-threshold. New code for such
purpose should create filters.

Let's better special-case write-threshold and drop write notifiers at
all. (Actually, write-threshold is special-cased anyway, as the only
user of write-notifiers)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h       |  1 -
 include/block/write-threshold.h |  9 +++++
 block/io.c                      |  5 ++-
 block/write-threshold.c         | 68 +++++++--------------------------
 4 files changed, 25 insertions(+), 58 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c823f5b1b3..51f51286a5 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -959,7 +959,6 @@ struct BlockDriverState {
 
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
-    NotifierWithReturn write_threshold_notifier;
 
     /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
      * Reading from the list can be done with either the BQL or the
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index c646f267a4..7942dcc368 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -59,4 +59,13 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req);
 
+/*
+ * bdrv_write_threshold_check_write
+ *
+ * Check, does specified request exceeds write threshold. If it is, send
+ * corresponding event and unset write threshold.
+ */
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes);
+
 #endif
diff --git a/block/io.c b/block/io.c
index 35b6c56efc..3520de51bb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -30,6 +30,7 @@
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
 #include "block/coroutines.h"
+#include "block/write-threshold.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -2008,8 +2009,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
         } else {
             assert(child->perm & BLK_PERM_WRITE);
         }
-        return notifier_with_return_list_notify(&bs->before_write_notifiers,
-                                                req);
+        bdrv_write_threshold_check_write(bs, offset, bytes);
+        return 0;
     case BDRV_TRACKED_TRUNCATE:
         assert(child->perm & BLK_PERM_RESIZE);
         return 0;
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 85b78dc2a9..11152c60df 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -29,14 +29,6 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
     return bs->write_threshold_offset > 0;
 }
 
-static void write_threshold_disable(BlockDriverState *bs)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        notifier_with_return_remove(&bs->write_threshold_notifier);
-        bs->write_threshold_offset = 0;
-    }
-}
-
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req)
 {
@@ -51,55 +43,9 @@ uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
-                                            void *opaque)
-{
-    BdrvTrackedRequest *req = opaque;
-    BlockDriverState *bs = req->bs;
-    uint64_t amount = 0;
-
-    amount = bdrv_write_threshold_exceeded(bs, req);
-    if (amount > 0) {
-        qapi_event_send_block_write_threshold(
-            bs->node_name,
-            amount,
-            bs->write_threshold_offset);
-
-        /* autodisable to avoid flooding the monitor */
-        write_threshold_disable(bs);
-    }
-
-    return 0; /* should always let other notifiers run */
-}
-
-static void write_threshold_register_notifier(BlockDriverState *bs)
-{
-    bs->write_threshold_notifier.notify = before_write_notify;
-    bdrv_add_before_write_notifier(bs, &bs->write_threshold_notifier);
-}
-
-static void write_threshold_update(BlockDriverState *bs,
-                                   int64_t threshold_bytes)
-{
-    bs->write_threshold_offset = threshold_bytes;
-}
-
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (threshold_bytes > 0) {
-            write_threshold_update(bs, threshold_bytes);
-        } else {
-            write_threshold_disable(bs);
-        }
-    } else {
-        if (threshold_bytes > 0) {
-            /* avoid multiple registration */
-            write_threshold_register_notifier(bs);
-            write_threshold_update(bs, threshold_bytes);
-        }
-        /* discard bogus disable request */
-    }
+    bs->write_threshold_offset = threshold_bytes;
 }
 
 void qmp_block_set_write_threshold(const char *node_name,
@@ -122,3 +68,15 @@ void qmp_block_set_write_threshold(const char *node_name,
 
     aio_context_release(aio_context);
 }
+
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes)
+{
+    int64_t end = offset + bytes;
+    uint64_t wtr = bs->write_threshold_offset;
+
+    if (wtr > 0 && end > wtr) {
+        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
+        bdrv_write_threshold_set(bs, 0);
+    }
+}
-- 
2.29.2


