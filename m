Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369C47D623
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:54:57 +0100 (CET)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05pI-0005Hk-9Q
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bg-0000us-7D; Wed, 22 Dec 2021 12:40:52 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05be-0002Xs-DS; Wed, 22 Dec 2021 12:40:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxjTkGOJDv27lkkpci6VnZfitczlbZVtrqcpCvdD0MzxAWfDud2jbwF6q5uLWtADmxxO0pyW/FmezndTVUnQBmh77sSn7kF5Ut7vkKW6QGL4XnIJXJhpcB6ViDqhpGTJm97umvVxy8PM+dEBM8sTm2e2gENQAY1VTd784z4f1NvXQFdSDvRiLbBeYWdcjtH2Ui7BWOGJNzZ5FcMO05iVwcAMVTwMR8qGsBqsK1rPiodRP8VOMbLjK/9rlbLfur5zvCRONC2QLvi8kuJVQewzq2yfANp5VuThKufA/BYVCtX+zClpY8ZylsVuWI8WTaGcLqGWbl3ZvNns4fwsdvigtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kilZ0cKlui50PjjNGbfGpxKy6GeZgO2xRJyR82+edik=;
 b=HCGLTUc8bq7ta5OuMC5dd0RiKi6rdbK5FUOWpCArDLQrQDAz9iBCmK50OZs666XbXAhKRYCzj3PAYnNp6uQnhrfXK/+vdl4Z1Eq5LjLWRdgVV2vcT+CiC5vj/5kCkgjZBLZrQvO9X3l4CWmpnOjHhhifRCDPFUJhSSwpM+ALFPM6z23zwa2mjPGhSnfVH7wNepXxYI6IilBwP0mF5bzfHIt+O9bnY7yRSs2rkkp/kqgehOGsBnzoUQlwKK5276m5j1FMsxQZtDrWynWIgTpoo2nnjLDShJgDEtXgIrFmTl4tqAjMv55gWjTuvyc03cR4aJGiRrs10twWHAxRwk7AAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kilZ0cKlui50PjjNGbfGpxKy6GeZgO2xRJyR82+edik=;
 b=sIhn43nYypBEYR0FIxa1Ub6WqNm8QKhM4/lEHQV2GfLy+V9W2bm20wXuM60TR/KhfyRz/KSNzzgbYxy1nX5vR0+h33AEUMop6PWy+T4KjeEpWq7vtT+95KdVuWEghm8f+MGePVsSedeq63yNFYsABam/zTL654Rple8scJ+h0vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:41 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 11/19] block/copy-before-write: support fleecing block
 driver
Date: Wed, 22 Dec 2021 18:40:10 +0100
Message-Id: <20211222174018.257550-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6084423-dc93-47c1-08ea-08d9c5722c66
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB396408D207C38430948D664DC17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GO8p6+IbjtWyuillWjWQPhMn7Hi13RomInJqydeIEPxjXwaTlzu7dOv2x3Jb2inLVhRLGGAFKTjYnwE6g5TfpOALRzMJ9j1Uam2sKr9Eujo2Demrj1gBrwE57y8MgGk8gDCQQnOv0ySVo+0aYvHLTAyvSj0bY0xdYRZEW9U9CIxYAtcKCQ4qrux24ZE6VchbJRNX7MSudWg24QoZdOVWAigZVRjQU9EV3BbjQDugonkyQxy6vd6zsptOIzDVbMjA1/RG+vGXsCdUHSOk+zDyNdioYi361bUBnWFXM+JyVw71nB5u4xqdwAxhVggGwpLM8ctVtj1HRQ0epjIylVGDkQoE6aYugHgwoFDmffOqgu6872mTHMZ6J82/yXMAyz6kBcjcQYGufJ0UFg5CvIbXD/w0hbFsQQMdgXeOY2ScfH3BZnDMwad2rX49C2FsC7ns2P5sApYNzeG96jdg8rE04QpOOCDzJnwFUGUWTB+mnb/EivzakH+2a614Ua7Nv0v27zunLZOMmWiOGbX7rh9JckLVJ6wBtW6WFnWxdOtiLyMzWaxIQh//Fxt/blG/UzlCCE06aQUOh7Vd+fmnafiqS6pmh0ZP8CLWD3wKTm8vevC3AxJbvrwL03g2cqNuknJ+8J3lNlo2/CrTcwWdDz1kGPk/cy9ck56P0jLsEb2aX8QU1eFPmRianFZ1+fAKFcOdXSAoS+WzbDzdBbfbh6m9sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbxtpdpYQ/sPUPs4mv11ErOwd+3gNrPPagb5IjGqb/1eES+oVY7zDE8m8dTU?=
 =?us-ascii?Q?l3DRZmDjSJ1riB9zEKBTCi6mmFZs41/DjlSlxrKIIhii0UdjrIjFkdaXiYmk?=
 =?us-ascii?Q?/6IFb5J7ozhadL+VshjP8hAXfDg7ZxbSbmlN6Euu3xmw5CL/N3qxEBSFxYIU?=
 =?us-ascii?Q?QyE66u8O6og/bguAeiDBS6mREbQqabcjQpJ+IU925mUNMsM91RGhOVW1upCS?=
 =?us-ascii?Q?BZqZIBEDJlolnVVEJpOY9GjuVL32/ZFharSBQZWLh04cDNa0Rn2W932B0INi?=
 =?us-ascii?Q?KVhxMAYWDWOgWXsD/2fdrkJu6qoRgCF852Mavtw1JZ2/bOSu9NwMQFAXppxc?=
 =?us-ascii?Q?+cKAs5+/5rJHR2hoF4yfayLGvIkKKrF+YyMDRuMZWE7TbF5cLrQcYa2MDcg+?=
 =?us-ascii?Q?3c/ckQgp87P116G72pwQHQx8OrvhsQFZAik8EsV88KGARSbhOEKj/IZ+7A5G?=
 =?us-ascii?Q?1e5FSMl1nVMkmBFSgKWbZBZojbmnVm+d6nPLNJpmEk15UTpP9BXUybbnJmgh?=
 =?us-ascii?Q?yyqyECEXo5dCU8J4mIDjyQ8KiUKGNmz72HC09NEuVkBfC93FlpnRPoC7SDTV?=
 =?us-ascii?Q?O92de9VafPh2784iMO6xZ6uaP8WaDFN1yrq8f7NJjKIHqVmq0vaK9/SCfTDB?=
 =?us-ascii?Q?5Gfxvvtpd3nw7Kagi1yMNwfE/6h2lCWGGdfUAP3tz0EVct4+fjgOC0JBIp0Z?=
 =?us-ascii?Q?+NsQqNlrRZFKT21YRRqpLeKz8ZswzB/7Ua1DO/fVUJyg5sPUk+UKLShwGJVI?=
 =?us-ascii?Q?3GWj1G6IG1k04u8Q80NOxdoa4HGT3oCwswc7VJHBx+fv5YxpzPp7PghEYYdA?=
 =?us-ascii?Q?Dt//HJG44gJpU0ALUiQ5z8h0XDORZ52wk1vs1S8j25T6GCieO7zSaO1NsW66?=
 =?us-ascii?Q?qZPsG8xE8W8X6u8c8rdJ31/NQy7DBLheLSMlz/zqPxLmttkH4pP7V+ydZDVo?=
 =?us-ascii?Q?R5Esr9vTz3EfpJv+8k+Md/WxHekVxv5mrN4GUUlDmcZfLeH8VVeulasWGHYE?=
 =?us-ascii?Q?5C40o5ZqeaPz6i7bkiIu5vbm7hqJPSPa13pJzClBlCTmdmXxD8Ye97rX/eCN?=
 =?us-ascii?Q?GlQoXgKCmQloY/oIF2tIuYs8Eh4K6U8uzfsePTeFZOSj7QBY4IxYzAGPr//X?=
 =?us-ascii?Q?rS7yoMMr9+Dgiag8FnpOnEXFkRn5qG5s6hSJgaPeFr7cFN9twl/vh/0A26FT?=
 =?us-ascii?Q?jb3vcV52bVzXmeMfC1cdZEVANqyi7//bx1bq9RajpMd7/nzQln3DmPxbOuaM?=
 =?us-ascii?Q?pcjq9W9x06VwrCqdwRdL6LDvYp73biQvdpVgcIQtjxWw3k+lIy1MTd/J7Op/?=
 =?us-ascii?Q?47J4sE6kOnZjws34rxh1VAy8o36FzoYDrHX1JgApQsmJ+KpFjwWr10SkxyCd?=
 =?us-ascii?Q?3buV0pcOe71xXAfQS+F7TmwzqDf7pA3XdTgZU44/8Qi5ZYgJ+Qi0iyba2Wpv?=
 =?us-ascii?Q?IwH8AozeviHUgLISjxFdvNSOkXzVnKQ3pEc1NdjpotTuYVTORMvBpHYOlpQm?=
 =?us-ascii?Q?tS6m40vzuTzKr3lQkN3E/6ujjxyETSeL+Di/JRKlIH9hG2EQrWl+sAyrDgjS?=
 =?us-ascii?Q?q+8fVRNiVLKpJFv7tM1BhW820gSQJ4tATQ9+Al4u/F5SI36U0ZAQhUP9kKNa?=
 =?us-ascii?Q?68+IJ4iyENThRb+C7XO6YUHydh06IM3sehOGwD5wo3qbhdRTTDQe+fulYi4O?=
 =?us-ascii?Q?gAKd9e2KpfDXQlBTsAkE1hTKTXg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6084423-dc93-47c1-08ea-08d9c5722c66
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:41.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6P35FwNXXh25TSb/5qiSrZYLRhSyNNTZ3VWM1D1mcu7Bu+oyp1HxU0AjMkMs3E5Q/w4n5N9rw0wr3r14lmAZLnAZUdnkxbA/DqKiqqNF0jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The last step to make new fleecing scheme work (see block/fleecing.h
for descritption) is to update copy-before-write filter:

If we detect that unfiltered target child is fleecing block driver, we
do:
 - initialize shared FleecingState
 - activate fleecing block driver with it
 - do guest write synchronization with help of
   fleecing_mark_done_and_wait_readers() function

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4cd90d22df..2e39159a7e 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -33,10 +33,13 @@
 #include "block/block-copy.h"
 
 #include "block/copy-before-write.h"
+#include "block/fleecing.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+
+    FleecingState *fleecing;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -50,6 +53,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -60,7 +64,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (s->fleecing) {
+        fleecing_mark_done_and_wait_readers(s->fleecing, off, end - off);
+    }
+
+    return 0;
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
@@ -150,6 +163,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
+    BlockDriverState *unfiltered_target;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +177,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     if (!s->target) {
         return -EINVAL;
     }
+    unfiltered_target = bdrv_skip_filters(s->target->bs);
 
     if (qdict_haskey(options, "bitmap.node") ||
         qdict_haskey(options, "bitmap.name"))
@@ -204,6 +219,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (is_fleecing_drv(unfiltered_target)) {
+        s->fleecing = fleecing_new(s->bcs, unfiltered_target, errp);
+        if (!s->fleecing) {
+            return -EINVAL;
+        }
+        fleecing_drv_activate(unfiltered_target, s->fleecing);
+    }
+
     return 0;
 }
 
@@ -211,6 +234,8 @@ static void cbw_close(BlockDriverState *bs)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
+    fleecing_free(s->fleecing);
+    s->fleecing = NULL;
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
 }
-- 
2.31.1


