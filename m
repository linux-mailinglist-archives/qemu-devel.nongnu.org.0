Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB962CF6A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:17:19 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJOA-0001lb-4q
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFg-0003QZ-BV; Fri, 04 Dec 2020 17:08:32 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:31968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFe-00027F-Ay; Fri, 04 Dec 2020 17:08:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG6jd+pL+VYAp6AYXWn6fnW5VLj8PLzRRA2a3M50lsawciBBGa6H6IzKkornmzCSEY5a2AQljRCvAvUGMxV1hbVjyk4AGHdbq8uIHYJQHimcNwTsSuwDI0DZdcXAezQPpDvEdEfu62usn07ubEMb6eaDBICBQp8cZ4IxebE2TwFMSzc0erRweMOYASOjT1JvCfoO5VT5NCAclzPlbuXTihZPwfcrd5JrxqFsaV3rxX4OD0uuIBSzc2MAO4VoRvABPOwewWiSnVA5chqxWNch5iZG7/VkQKZxJvZhRqQcq3X1Wr0rmR1aoCyeANUpM9Bryb0aWMsH6vYbGUNf3PN1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9eBQsayu5JcWpiHIPJ+2r2YMxmKgmDefuNR6maw/CI=;
 b=UXxNHwJ6Qjb2wCn4y/PrZCOb/N7GpTW+foCoaIVGPyThGeb/ZstLSc8/qNVDPGZ+PW70EEYA/HGq4aVxLb42/Gr4PomX5czbGwAN4toPucTo5cWFZ15DTicmfGRXp5vXKyaPJKQnpBtLUlTzACmXxCCqpEwfsMJfULRkXcnA3dzAeaK6HTxVC+V/k0lQ3NIkiObgfaK1u64DxesNrFJFC0qNd3DZJZ22DoA2KwjEmkWOCWFvmDqt5nkK1KeR7ui2t7YsjnNQ1xGi9TwQ8zeISVxjCHbj7Zv45Ubb+YUtvA6FYboiJQvqDgRhHIUwAw/ixCl6+tU5oprbSmzpRGJp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9eBQsayu5JcWpiHIPJ+2r2YMxmKgmDefuNR6maw/CI=;
 b=wnNYbUTyUEupmaSjXDIMRp3RVhdjdzJMi9uxxowQw4XxAZdE6/n+GtWEjhjBlUv9xzDRTFz1Tmk/bnSA7kQagJdXwEXPAu/ml69QSS41S7GO7lvYk+NgcOx0oR3yDqdnwLi2lsdKlSRP2dTu0743DAtzzW3Xac94M6vyzX3PEUc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 05/13] qapi: create BlockdevOptionsCor structure for COR
 driver
Date: Sat,  5 Dec 2020 01:07:50 +0300
Message-Id: <20201204220758.2879-6-vsementsov@virtuozzo.com>
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
 Transport; Fri, 4 Dec 2020 22:08:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ab4f7b-43ac-4b5c-c40c-08d898a11af7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40723E9052389D8AD558BA5FC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb/NPDaXkyfzBtshDWN3aC2BuYvuJYomV9Jbv8xZmQUOIV5PHLcmL/B3c0FCBNaymoH4qW/ziAdfryKo68coqCtiDEQkZnF/7Kix6hSkCRooOsQnILHP+NkKneHzEZTFi0Lg+mlcQJk1sao4uv2meYYcenyGrXh9gk2L69DsNiUbK8ueMJz+KzY5cTdLfEped/aBvsAhXpe0RR+qB4usVwFp/5R/8HYkQIFdxf2Nli1FL6MKsh7TPIRZR2pffrPO5RlRsKpNSYXTYOUcLYTbTxgGom8cx61xc08DUOi1HIe1H9LMqCkWzr3BKr3MY3OJCWk5owzm51YZ+vC8f9s/Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9jDGlP4Nli6VXhXLfo7+L/Kv6H3fXRWsgD+N5uPyf4my4KFEI1YnmLZFkuqw?=
 =?us-ascii?Q?XmhIi6IjWexcnxNfwQu3i8R8xAQt58J4D+/Yi35PTVXyt0eoCxegf/N0XfYW?=
 =?us-ascii?Q?hvQEjSr9BgEeBBqGsz5zg0waq+eGHzjS72Tz/BKvzsHaVZ6gHTBuGXAN5lDr?=
 =?us-ascii?Q?buhWY8sXn+KJV7e7MizbihrnsEScV5ukiCmdUqQ+OlgOb5S45a7sM8wz+lGV?=
 =?us-ascii?Q?yTPteoStildrDeHt/7dfKh3MGD1EcQvRad0NHvL5OeLQnTiypVVGD6AY7jlf?=
 =?us-ascii?Q?EXvSuv+zo3Iq5ArrJyOzzE78E5GlWlbWP18vTGtPBBQnQFmR7SkWqXXIjZx4?=
 =?us-ascii?Q?E7WGjXhkM9wOOF6L+m5Sd9MLkUBHk2Yt+PUyW4njgQSOhjhfoE/H63Bed0/C?=
 =?us-ascii?Q?7ClDbBcDzFczKCetQaoiHJ2uEdDw39KMGcyweADzGKtfsg8f7RgZ7QEYa3zT?=
 =?us-ascii?Q?ODy7Lg2hhW2fx8xJzy2vP5cn9h9I5K8qusUgOjTbt++LNRSSh/whDo/rZPTj?=
 =?us-ascii?Q?bs4V8grqd2WWR5VEvLpKVOxciGEkcr0T2p13altz/GEyivXX+M8wMis7eEAh?=
 =?us-ascii?Q?W2szrqa+269sJHXkaHsYwNV+UAotH9cYdY8P7mflX0xibInrertmttJrsHVV?=
 =?us-ascii?Q?4/3Dwyz9OOkI7tm80iUidtdt1AIlSH+C90l6r6imBbYk7IJcEpGMOe4UGbVL?=
 =?us-ascii?Q?tQKUHCwIB0D1/SgIVRZ3RpwIhvE62ac24lgba4ZeIZ2Eg7JxernX0xuZOEuN?=
 =?us-ascii?Q?dAvtzDBUnl98n/3yrCJ+pleam5/kFgUHWaV6Cn81URzp7b6DKVEBfKYbyc3E?=
 =?us-ascii?Q?6tJsSYk4oBO1An8RLaTg1i2+rN6tpQzz45VfnpuSgdTJmMoSTAos0pqq5Krg?=
 =?us-ascii?Q?SjGZiYcPKPnTybr9NR/P/reRrpIHhton8gtOiLRlWBa/mX4ydp/O5HbWXxMk?=
 =?us-ascii?Q?tG/XjDu0wmMzqVPrAHvTZh2UqXcCVT4tVnpqlY075/0ARGTFAFmjdZodUjHo?=
 =?us-ascii?Q?pvZN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ab4f7b-43ac-4b5c-c40c-08d898a11af7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:18.4866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjqUA4AZJCEqt/DHoc1HBmi0QpuPX/HzdJa0KOQ2L+p895K4JL3Mj6a3vUSlKonegHqn8IRhqRPHHEakkR8Db8D3mPQIMcjCU/Qi6NO7IAk=
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

Create the BlockdevOptionsCor structure for COR driver specific options
splitting it off form the BlockdevOptionsGenericFormat. The only option
'bottom' node in the structure denotes an image file that limits the
COR operations in the backing chain.
We are going to use the COR-filter for a block-stream job and will pass
a bottom node name to the COR driver. The bottom node is the first
non-filter overlay of the base. It was introduced because the base node
itself may change due to possible concurrent jobs.

Suggested-by: Max Reitz <mreitz@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  [vsementsov: fix bdrv_is_allocated_above() usage]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json | 21 +++++++++++++++-
 block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 8ef3df6767..04055ef50c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3942,6 +3942,25 @@
   'data': { 'throttle-group': 'str',
             'file' : 'BlockdevRef'
              } }
+
+##
+# @BlockdevOptionsCor:
+#
+# Driver specific block device options for the copy-on-read driver.
+#
+# @bottom: the name of a non-filter node (allocation-bearing layer) that limits
+#          the COR operations in the backing chain (inclusive).
+#          For the block-stream job, it will be the first non-filter overlay of
+#          the base node. We do not involve the base node into the COR
+#          operations because the base may change due to a concurrent
+#          block-commit job on the same backing chain.
+#
+# Since: 5.2
+##
+{ 'struct': 'BlockdevOptionsCor',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*bottom': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -3994,7 +4013,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
-      'copy-on-read':'BlockdevOptionsGenericFormat',
+      'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
       'ftp':        'BlockdevOptionsCurlFtp',
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 618c4c4f43..67f61983c0 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,18 +24,23 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *bottom_bs;
 } BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BlockDriverState *bottom_bs = NULL;
     BDRVStateCOR *state = bs->opaque;
+    /* Find a bottom node name, if any */
+    const char *bottom_node = qdict_get_try_str(options, "bottom");
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (bottom_node) {
+        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
+        if (!bottom_bs) {
+            error_setg(errp, "Bottom node '%s' not found", bottom_node);
+            qdict_del(options, "bottom");
+            return -EINVAL;
+        }
+        qdict_del(options, "bottom");
+    }
     state->active = true;
+    state->bottom_bs = bottom_bs;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
@@ -107,8 +122,46 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
                                            size_t qiov_offset,
                                            int flags)
 {
-    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
-                               flags | BDRV_REQ_COPY_ON_READ);
+    int64_t n;
+    int local_flags;
+    int ret;
+    BDRVStateCOR *state = bs->opaque;
+
+    if (!state->bottom_bs) {
+        return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                   flags | BDRV_REQ_COPY_ON_READ);
+    }
+
+    while (bytes) {
+        local_flags = flags;
+
+        /* In case of failure, try to copy-on-read anyway */
+        ret = bdrv_is_allocated(bs->file->bs, offset, bytes, &n);
+        if (ret <= 0) {
+            ret = bdrv_is_allocated_above(bdrv_backing_chain_next(bs->file->bs),
+                                          state->bottom_bs, true, offset,
+                                          n, &n);
+            if (ret > 0 || ret < 0) {
+                local_flags |= BDRV_REQ_COPY_ON_READ;
+            }
+            /* Finish earlier if the end of a backing file has been reached */
+            if (n == 0) {
+                break;
+            }
+        }
+
+        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                  local_flags);
+        if (ret < 0) {
+            return ret;
+        }
+
+        offset += n;
+        qiov_offset += n;
+        bytes -= n;
+    }
+
+    return 0;
 }
 
 
-- 
2.21.3


