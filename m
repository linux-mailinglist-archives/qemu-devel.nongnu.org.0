Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE12F8F78
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:50:04 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tSO-0007mh-1A
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQH-0005Ad-U9; Sat, 16 Jan 2021 16:47:53 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:15968 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQE-00078U-IF; Sat, 16 Jan 2021 16:47:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4UnPI3EPudiwt+msjGqo+0G+BD9aMiU1MV0M544g0hQtLWkNammJOXrdkBRBHApjtLK6bQpR0EXOhuITZRoa+Eget511dJYmVYYjskrXeXv93ZYo8/KdFz9yJDxt/GBdSHmXjuOVQndJJ9HF/o2ns/c8y/77n2gljtne7KwU+PuY8mTW4F1VgGCW8suf4V5CpshHCGqV/SIOXtIFHcm4BCnrIjCzYQvQNqneSgtq9bxEBWUkQWQuGjTyCPHNkVnFw7B4QiNJU+1xYt6MCy9U+e8gNBnJQrxKqRagaMJsbwAwTmIPZvtYHN7mWk93z0ssf0oKjrRojonNcY2jXjf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g61eDln8eCbFyY9ciIQj3ViCBiya9Rm8sJ891/0FyHg=;
 b=gdT5s6BueEQW1kn+z4quR0C6a0l7CK+faEj5DGYeCtrH9kN8j9mQ/Zj5Ad01t2x/KDcDuHwe/rvvce3/2SRE1ncSYIEELFyj3yWYh7p+UF5OEEQWL+lMI+gRBC2IkwSenztcXyaqH3U5EOC47iJ8Q3guJcel3Dp8yYK2FO8AXezz9b5Ndpxwgf/fvm8BbhoXI+qpIeElLeU8gSnWYZl/MyqBsJ+qLjwm1kPLPpshqCPtK146gKTW7u4EciTYqsRWE450Slzw8t8TaqjyLn1owHpF1t3X0tvR7ozrydB1cerzETkRSxqwnO6gFHmL7+LaiXNJFnOm/tq1ruvCuHCmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g61eDln8eCbFyY9ciIQj3ViCBiya9Rm8sJ891/0FyHg=;
 b=pYOFLTu2cJANU6RmjdHfmbDz0REl+ja3+stIxyXHBGH2mZ1el8sfZf2M1wFyV4UUd4SIS+9xXgDRN+8oXt2S2LA83lwUOcVHRBh2SXgQVoCs7sj1tQpI+dbcFdvhF7Y775UGA1hf1Pl538fNN4shnUoluVnBnsJLTnBKdUZb3eU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 02/23] block/block-copy: More explicit call_state
Date: Sun, 17 Jan 2021 00:46:44 +0300
Message-Id: <20210116214705.822267-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 623060f0-5acc-4d45-b8bc-08d8ba6859e1
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203341D4CA0FF82B4AD89F08C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZNdFyTofuYlGymajmWAZOw4bJJXdJBWByKgPSJAXsi6gnrA32Bsv9zbnbcJGOGTTtuliWRLwepeJLDltnc+AG3n75dzdojopg9voUD8Uzrc55YbCgjlAgWLwyTe5GiQew82946cY1ibnPcU3eZOuD5j1fLls/0safs0yPlJb5xp6OOrUtphwmc/UW7mXkioWIGr6hDAp2J9eS+SEsvjNE6TAGGg5DatiJS29pd1EQsQ3m909ppBIuhc8nfca0s4ogYKN739p2qDdEOJvcxVJZvEsAfigDxo/pgUvLMTBVQ0D7Ha30cwEMftS2ZZZ8RDh1ZbVjGLBGeiwEjvRIkVKvD6b/eD0HJGwWe6BetwIJ8QFkgmBGUM5fuvBg/1RMhY8r91MCgE2R0pxS/r7QTvNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NVjzRhb3LCZmRUsFOe98Xb9j5Uf+4vLixEghrFLlZawoFSxqOTnvF/shzxtZ?=
 =?us-ascii?Q?PxqPfHVSSmEQ0H6qhBXgo3iRw593pz1uOwShc2fSI+riFTtX9CdiDObzFctu?=
 =?us-ascii?Q?ID392otQ59i0TOlefhkRYnl5uNxfA9CA4zqQJ8iajZAJfrXefsJE0TXjIGb9?=
 =?us-ascii?Q?jTN4+gWwWhbqSUfabYcNIcjth/KaqEha5xKILz/SB7no6XlrZnpRn7VNJad1?=
 =?us-ascii?Q?M/XXdYE8H3GaPYIeLj/WRJr/9yK+E9tqYw9Yq/rWDRuRqEVDRF0X/DnQ7jp+?=
 =?us-ascii?Q?JqChwbZulMMh9NaLVFINxF0ww3pH9bLT2hB2QCGuLURQBybLDLXQ7vsvChBh?=
 =?us-ascii?Q?ttxHhyENVEF3cQZIuOk9n8lRrGqFFb++HQvszQFzfs7ENrmhJT3Wftqc5Oq3?=
 =?us-ascii?Q?5mfDAHep3IHsj5Rs4KV3x1Aw7JlBkClEdbFpnAHyQIrXUaGHywTUJ2XImIJD?=
 =?us-ascii?Q?6gaKVgTGIXxR3HnV/iUVwmHP3rUQ2ICxjl9W53LLuGNIupq1SWJA7tw9IMmL?=
 =?us-ascii?Q?liS0JxvqSkpNkAF4bRENCwshxFoUmLuUjZoiHmR1/kkPOCy8e/qcJqtj5z8Q?=
 =?us-ascii?Q?rYRDck071/JpDQIS0fnVQA4ZisEbn/sFEWSw6NEzhORYv3RxwFiLTMkyJ4b+?=
 =?us-ascii?Q?O9LM1ylNDrsBMM5Vh1OjJuym4AIufjtKTPAm2YuTdb1/be3Pr08E7RUIacR3?=
 =?us-ascii?Q?iGqH+LggafmNxxtZWwpRE+/RoA/s27FDz9n16rUquKjiHmQp0DTpRGyZR88C?=
 =?us-ascii?Q?VK7YtBucBbZLQarGQSFhN7144tvfUAwMW4MZWsOdJS2fDPTWX4K/x9drr4Um?=
 =?us-ascii?Q?fpuWNBw9bwZcm6qm6WA2ocOVY2uTXRcAFQUd+laKbjejqpmH96E+IOPXC15i?=
 =?us-ascii?Q?pd+m3+A03V3K+P+zCSz60EquqG8p61iVJ+aYnCVDHSSjQBkWw9u9VyyuRvHO?=
 =?us-ascii?Q?x1RBOA2IdCnvIFerwewwM1oRwviog+FuoQYdxvQ5jCmQx69TY20wjG8rcmyR?=
 =?us-ascii?Q?vsyS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623060f0-5acc-4d45-b8bc-08d8ba6859e1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:42.4541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MHdhehyHvlb/bc95mpaJk7q1+CzO/gWe3J0IIHQoE87+TDVK0Fhy+0yioqz9XSCBuWz3ciSnYUo+OtAwhoEADWSXX9tE4MhEdq41M5Vt6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor common path to use BlockCopyCallState pointer as parameter, to
prepare it for use in asynchronous block-copy (at least, we'll need to
run block-copy in a coroutine, passing the whole parameters as one
pointer).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 51 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 63398a171c..6ea55f1f9a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -30,7 +30,15 @@
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
+    /* IN parameters */
+    BlockCopyState *s;
+    int64_t offset;
+    int64_t bytes;
+
+    /* State */
     bool failed;
+
+    /* OUT parameters */
     bool error_is_read;
 } BlockCopyCallState;
 
@@ -544,15 +552,17 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
  * Returns 1 if dirty clusters found and successfully copied, 0 if no dirty
  * clusters found and -errno on failure.
  */
-static int coroutine_fn block_copy_dirty_clusters(BlockCopyState *s,
-                                                  int64_t offset, int64_t bytes,
-                                                  bool *error_is_read)
+static int coroutine_fn
+block_copy_dirty_clusters(BlockCopyCallState *call_state)
 {
+    BlockCopyState *s = call_state->s;
+    int64_t offset = call_state->offset;
+    int64_t bytes = call_state->bytes;
+
     int ret = 0;
     bool found_dirty = false;
     int64_t end = offset + bytes;
     AioTaskPool *aio = NULL;
-    BlockCopyCallState call_state = {false, false};
 
     /*
      * block_copy() user is responsible for keeping source and target in same
@@ -568,7 +578,7 @@ static int coroutine_fn block_copy_dirty_clusters(BlockCopyState *s,
         BlockCopyTask *task;
         int64_t status_bytes;
 
-        task = block_copy_task_create(s, &call_state, offset, bytes);
+        task = block_copy_task_create(s, call_state, offset, bytes);
         if (!task) {
             /* No more dirty bits in the bitmap */
             trace_block_copy_skip_range(s, offset, bytes);
@@ -633,15 +643,12 @@ out:
 
         aio_task_pool_free(aio);
     }
-    if (error_is_read && ret < 0) {
-        *error_is_read = call_state.error_is_read;
-    }
 
     return ret < 0 ? ret : found_dirty;
 }
 
 /*
- * block_copy
+ * block_copy_common
  *
  * Copy requested region, accordingly to dirty bitmap.
  * Collaborate with parallel block_copy requests: if they succeed it will help
@@ -649,16 +656,16 @@ out:
  * it means that some I/O operation failed in context of _this_ block_copy call,
  * not some parallel operation.
  */
-int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool *error_is_read)
+static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
     do {
-        ret = block_copy_dirty_clusters(s, offset, bytes, error_is_read);
+        ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0) {
-            ret = block_copy_wait_one(s, offset, bytes);
+            ret = block_copy_wait_one(call_state->s, call_state->offset,
+                                      call_state->bytes);
         }
 
         /*
@@ -675,6 +682,24 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
     return ret;
 }
 
+int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
+                            bool *error_is_read)
+{
+    BlockCopyCallState call_state = {
+        .s = s,
+        .offset = start,
+        .bytes = bytes,
+    };
+
+    int ret = block_copy_common(&call_state);
+
+    if (error_is_read && ret < 0) {
+        *error_is_read = call_state.error_is_read;
+    }
+
+    return ret;
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


