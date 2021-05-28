Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72139440C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:18:46 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdK1-00082a-LT
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdIH-0005QL-IM; Fri, 28 May 2021 10:16:57 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:43062 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmdIF-0006WH-IZ; Fri, 28 May 2021 10:16:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaYxMFeeXnJr0TzHXnI08YqfXITvt/aEAwcsoblK1bc39KrirvHNRqPsHYDPfXT7iRGQT0aRWwPJRjaWdkZiOMqXOyK3+lfetr7NBm+kNg4VNahgTliwfaDoyp2kUbTxDTonMzdmqX9rTbPBe20At1Siyr0tCMPrlJDAQ70DW+UjltMLrXlpcOnNbSlrPdD8Q0eQHU9Lwe4OtOxiyA4AKdBXGiijHvxqBNAXiFf8tMvkJSUnkQbdW/qslKMbBTYpr+0Ir/Yb0v+dkQDJGVA8CsAQwn5xgDOlnA+x+0J7vvDMXjQ2aFccyzdatWj2nhZP9+AtvcduwjN12hQGkKvXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZeU0tH9M+SDsueuaQtv+EiQWfni2L8E39GEEwFL/5s=;
 b=IspiRz5q05dj10PuPmNJzQjy4u8O59+07ov6H8RtYyAq5vMFMUIS4tfkQx4IV2BpkM60ha+Mu+GmY6YhryAqJH0lP2sCWJlM4cq4a8jwgowIyLMqGUcjOwTUv7M3X93YdoEKp58TS/Qwc0U4tEH0mgzXBfnSi0m+9IpDbV/r8+/rFCM3QnuZDJvit7FNjxOlqMM+F7vKjl5UdUVTL+j53zo7iWIYF0mOVGLyr75MKsJiHJdHfBdr/x+cHvr8f+uXgH+K0WeiXFB8niidLB6ACVQnhnBR1VYidzzAo+lhxd168oUZDnkhr7Mu53H+1z9a9x3cGTgpagVtt56aM6mQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZeU0tH9M+SDsueuaQtv+EiQWfni2L8E39GEEwFL/5s=;
 b=qeRop64Vla7p10EvfFT89bmwSdUugVGXotYe6w2i30G7XaTFjtk1SRk0F4SQFdTbAN3pRsmeOnYRWFzFvJaV7Dha9Th6am1NjCDmwr8fFIe8DOWdeANbxKixAQ6ihz9+RMD6TGiOM2Iu8DN1ekjviXVSqLo3whN6jkUtWQLaKL0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 14:16:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 14:16:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com
Subject: [PATCH 2/2] block-copy: refactor copy_range handling
Date: Fri, 28 May 2021 17:16:28 +0300
Message-Id: <20210528141628.44287-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210528141628.44287-1-vsementsov@virtuozzo.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0701CA0048.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0701CA0048.eurprd07.prod.outlook.com (2603:10a6:3:9e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.11 via Frontend Transport; Fri, 28 May 2021 14:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf5ab5c-5828-4723-bd71-08d921e33a9e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3893:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3893DD05221E70C8702D581DC1229@AM6PR08MB3893.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZWLnp4fszk5ob2r10wZEUQzNTJ/mqmoN7JVUpAP60Bihn4DTOINRlBnA9ntchDZfhm3cIucIa0DVwa4HPiAotx8YLIJvHTdUTXXl8vkFfAH4H8juhloA/BesHlTGo3SB//AeQlbsSF2pxS9Ac42zQ/JIxLOrCTHjioB4+4nAQLPnKi3eEd+3g3e+ZadMrJD5/8Ph4UlOMfwBG4VcrUgkD3MUW7AHNRVZwBwSuP/ooDDUUxRg+fXmz0fLkGjxRTl4BSnv/YoKylZdCwZPPqHPwxKdKMZglsD27bdd1zZZ6xvuitNwMHm6VjIgPdtO0fsaxGs5EESJBSFeRP/uoE6cyi0E2VKk+YSGEyhzMZXv7QNIF99+SozwMQz+1APw8b5piPXvb2iXW+Nyx1NDtYcl+aOj/2vMjIaV8t/wOmIuHZ7y8itPXbviW1H7rXp0VfpS76A2nBwrXpymqEvq7QxGmwaPBTcFSoWipFeu/YPDzAx3ZBxbZJ1/+N8kqNbGYN9ArIKC3ya8qUxddQjtnCSPuPbrEGALY2ubdgJZblyovD3H1b1PWdeeKzIUUGn0K5xNujPUIW9IH2Fx7Ud3j5HiBeWVH+sh8NS8tki4mLA+Q7okGxG/tRGWUv/m6tqOpAQvtPq3nWD+wOSlz5ZY9JA4BE+5hJU9oYyRJZazLO0xapJGLQ2Abkaj73oAaX/nanPw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(396003)(136003)(346002)(366004)(26005)(6512007)(2906002)(83380400001)(38350700002)(186003)(16526019)(86362001)(38100700002)(8936002)(8676002)(4326008)(6506007)(6486002)(6666004)(52116002)(66556008)(66476007)(316002)(1076003)(66946007)(2616005)(956004)(6916009)(5660300002)(36756003)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5w3yWtk7nvUkkbMgBpxwnkSqhj1omb1TtDf4icV1Nx8Y6ohNnCFKwO7AtdiB?=
 =?us-ascii?Q?OdodsfP1flZSyFvwG1h7DaObA0a5uGdXwEqX32JpsU5zzWEKvMFshs2qKsFq?=
 =?us-ascii?Q?88p7gj05aetxU/fLbgOmqgYQH2ZrCIzxEGvhmdPtad6hqJD6M9t1mkLG3WVo?=
 =?us-ascii?Q?5pElKX7VYooEel47kX0v3lE4Eyqn47PZn4nyjluT/Xg3wbo8FEruivRawC4f?=
 =?us-ascii?Q?ePXb0yqmXW9mfKJ7WYvCcVBeNfqDQVVFlt+X4UA/2FTw0IrFIJ3QwpRZBEvd?=
 =?us-ascii?Q?iEQxLU7cxaUyGY3KkYOL77GZVrA5t0p9D2tlhI22ccWMO3Cwgd0gWEnQZrwj?=
 =?us-ascii?Q?poDTJcwLhvveqHIbhMJYiGlxrgMChj21cIlwHXJTn2vjBajy5/tQFoFzMXxr?=
 =?us-ascii?Q?y04JRfzaUUft8IVtpBCuaFXWraf0rYKlPxEmpfXnWOZgIgpFOfG0cozchlqx?=
 =?us-ascii?Q?smNrWesDaEPVmUNlFC+lJdBiOvv7p4MMukdyBhAW9AdR78/Z87fSkOAjh4wT?=
 =?us-ascii?Q?lAUwanpSdyAVPIgQqbtiRWXsfSMKIsrNIR0zMvFQk/iVriRw6dv7AmruY95h?=
 =?us-ascii?Q?u0F0Ny/98sjmaWEk/pHxTMWwYdvBqwpFma3BF9+vu/d/5fh4T/BrW2fk6tI3?=
 =?us-ascii?Q?yP4adpd157V3aTyUF+tjh3p7z9RPn/DOuPrVaDajCfNY0qQClzvpKn5nltYv?=
 =?us-ascii?Q?4gSmKbs/Fu1AHsjzPEJYDt3ank49kVzwuNz1lewkXRKqKo5OcdsdGf2+WcfS?=
 =?us-ascii?Q?cVzmhDtiAfS+tRPNUzRDbfcgbJTolMlMu5eLGSKaRxWyrHARnXUUv5unhh63?=
 =?us-ascii?Q?YGM+mHB26E16Xt7ykin88mP6AR8q8P0gzUvKklAUp3B7QQONCELTLfN3ORdp?=
 =?us-ascii?Q?NCUL4S62984GIuNs2PvAcvABNJe7l1X43R9Kb2o3NYsgpKoEYHOe+VlJ1MQP?=
 =?us-ascii?Q?XF1fVdUBFe5ZkvbJ1yaEMJm+m5/XWgE0zXg5+vxV+/hVZT7eC99hNIoM6B5X?=
 =?us-ascii?Q?vkuuXqZxlzLL8PMXfm9SH1zde9xHYk8tZU0O1XpVCXv9uVpHoN/gxSeVShh9?=
 =?us-ascii?Q?dhfInCVSjdJ+tnThGUglMt5BfWlhM0KiEQM6lHhNGRnyt3mbZkahJhqocvSe?=
 =?us-ascii?Q?VXyy8Py8J1Djgpzdvpu4iiwjFXn+W8LuPD+UAarL83NHFtZMc5F5Pb8bVElI?=
 =?us-ascii?Q?wr+9VeKhK55Kg5DiHPiprR5C6+RNjwTpW6s+nXNCzXR6JvJF3/TqYO8r8yHN?=
 =?us-ascii?Q?uaE4/rHFlnZ44IsAbqALz07XU6MLluartFvTDa0w4iB+aOGAkqvtMUsZYe1O?=
 =?us-ascii?Q?5ww089V/cOBuKp4c6CHeo8EG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf5ab5c-5828-4723-bd71-08d921e33a9e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:16:47.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFzm3+JIhEbLkD2ronx2VY6d4uyEtKHIhXiKu/YD6SxkRUTEGT6gaBgLCx6DiXRR2wjtBX8T94eQTDp2T12a4c/yxVFI5P/TxoDhdzvTWaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3893
Received-SPF: pass client-ip=40.107.8.111;
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

Currently we update s->use_copy_range and s->copy_size in
block_copy_do_copy().

It's not very good:

1. block_copy_do_copy() is intended to be a simple function, that wraps
bdrv_co_<io> functions for need of block copy. That's why we don't pass
BlockCopyTask into it. So, block_copy_do_copy() is bad place for
manipulation with generic state of block-copy process

2. We are going to make block-copy thread-safe. So, it's good to move
manipulation with state of block-copy to the places where we'll need
critical sections anyway, to not introduce extra synchronization
primitives in block_copy_do_copy().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 71 +++++++++++++++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index f9e871b64f..c96fe31054 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -65,6 +65,7 @@ typedef struct BlockCopyTask {
     int64_t offset;
     int64_t bytes;
     bool zeroes;
+    bool copy_range;
     QLIST_ENTRY(BlockCopyTask) list;
     CoQueue wait_queue; /* coroutines blocked on this task */
 } BlockCopyTask;
@@ -183,6 +184,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         .call_state = call_state,
         .offset = offset,
         .bytes = bytes,
+        .copy_range = s->use_copy_range,
     };
     qemu_co_queue_init(&task->wait_queue);
     QLIST_INSERT_HEAD(&s->tasks, task, list);
@@ -342,11 +344,17 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  *
  * No sync here: nor bitmap neighter intersecting requests handling, only copy.
  *
+ * @copy_range is in-out argument: if *copy_range is false, copy_range is not
+ * done. If *copy_range is true, copy_range attempt is done. If copy_range
+ * attempt failed, the function fallback to usual read+write and *copy_range is
+ * set to false. *copy_range and zeroes must not be true simultaneously.
+ *
  * Returns 0 on success.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
-                                           bool zeroes, bool *error_is_read)
+                                           bool zeroes, bool *copy_range,
+                                           bool *error_is_read)
 {
     int ret;
     int64_t nbytes = MIN(offset + bytes, s->len) - offset;
@@ -359,6 +367,7 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     assert(offset + bytes <= s->len ||
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
+    assert(!(*copy_range && zeroes));
 
     if (zeroes) {
         ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
@@ -370,32 +379,15 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         return ret;
     }
 
-    if (s->use_copy_range) {
+    if (*copy_range) {
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, offset, ret);
-            s->use_copy_range = false;
-            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+            *copy_range = false;
             /* Fallback to read+write with allocated buffer */
         } else {
-            if (s->use_copy_range) {
-                /*
-                 * Successful copy-range. Now increase copy_size.  copy_range
-                 * does not respect max_transfer (it's a TODO), so we factor
-                 * that in here.
-                 *
-                 * Note: we double-check s->use_copy_range for the case when
-                 * parallel block-copy request unsets it during previous
-                 * bdrv_co_copy_range call.
-                 */
-                s->copy_size =
-                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                            QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
-                                                                    s->target),
-                                            s->cluster_size));
-            }
-            goto out;
+            return 0;
         }
     }
 
@@ -431,14 +423,44 @@ out:
     return ret;
 }
 
+static void block_copy_handle_copy_range_result(BlockCopyState *s,
+                                                bool is_success)
+{
+    if (!s->use_copy_range) {
+        /* already disabled */
+        return;
+    }
+
+    if (is_success) {
+        /*
+         * Successful copy-range. Now increase copy_size.  copy_range
+         * does not respect max_transfer (it's a TODO), so we factor
+         * that in here.
+         */
+        s->copy_size =
+                MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                    QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
+                                                            s->target),
+                                    s->cluster_size));
+    } else {
+        /* Copy-range failed, disable it. */
+        s->use_copy_range = false;
+        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+    }
+}
+
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
     bool error_is_read = false;
+    bool copy_range = t->copy_range;
     int ret;
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
-                             &error_is_read);
+                             &copy_range, &error_is_read);
+    if (t->copy_range) {
+        block_copy_handle_copy_range_result(t->s, copy_range);
+    }
     if (ret < 0) {
         if (!t->call_state->ret) {
             t->call_state->ret = ret;
@@ -619,7 +641,10 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             g_free(task);
             continue;
         }
-        task->zeroes = ret & BDRV_BLOCK_ZERO;
+        if (ret & BDRV_BLOCK_ZERO) {
+            task->zeroes = true;
+            task->copy_range = false;
+        }
 
         if (s->speed) {
             if (!call_state->ignore_ratelimit) {
-- 
2.29.2


