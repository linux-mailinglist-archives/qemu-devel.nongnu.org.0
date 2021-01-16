Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA962F8F7D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:54:37 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tWm-0005dL-Qk
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQK-0005D5-4t; Sat, 16 Jan 2021 16:47:57 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQI-00076Z-3Y; Sat, 16 Jan 2021 16:47:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1Vt9I4/1v3noM1DHS5rG3s/ncU8GewHXjsBXRTxn53vC8MzNJikJCxdTpLgKM3da1bNJ37ViDjThwlmXYccJyf8Xc0Azj4YlklLYdLzz2Tm2cqf9JA7dFaX5zzTsW0ms0v5FXvWXjb6gfAsIrShFiFKjmEHzIu9D7xDiiV8OqXnatHQSVx0EwsjDbnNoc5FWVeaiw9Vy5VdwCEpuXXvFdQMP+PXVXmERNqq3zFYHoFKfwd0Wy26yT3X51FqZSIIhLbFQYRDQjZPH5glj3Db//v41MPyTECt+AEFRqnpC5WMuGObAcW+7pO/PmbPDWu2M+mqKsTKNgitcYvA8r/LvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKu6nHeIPRlSdal5nlFPB9bhXEqTrEyq8tK+7gZzEhQ=;
 b=D4BiLHii07bNaqUY+29/Wf/dD30R480f+vo29jHuiXj3urSdePhcXWQzvZntP8OTHPmKUSCu4ZSTrQUWABaJL1wws9XLHlSna645tL2jh238xm3tSWDJ1o3dGtNuMM3SQM37qQ6WOyNTwF3R9YLw3yFVfXmvx7WztZbODP/wHmXY/F9A5IvlB1JxgoSo7K2b40KCi8szTz5cp/KY8NFQ3vCfQEstbxeLxUGWXDcGMU9DWdixBaqWH+N80HbYd1o1jXBmfhBZNnnkFFRrp01NFq4h3y3nQmhfE5Ed71NS/2jkQHh/AJqk7HiR8FMz1KWIFsQYvVL85XOLIyeL0oMvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKu6nHeIPRlSdal5nlFPB9bhXEqTrEyq8tK+7gZzEhQ=;
 b=IAV7+5mD6qL/3dkv6Z88DZvvoEi5rS3LzBKJAu8hXIu0NWn9ZX+Ku2hQPN8lcrCNmluia5GLqCDCaSCH1vCz+5KgMcfzaGIfLU8LXxJvz3hCs3iVIuzWKdzpfIimkUHsGWWi8RpHsXaS5uCv7+2WWXQCHr5WGLM+8YJ54xsz2ME=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 04/23] block/block-copy: add max_chunk and max_workers
 parameters
Date: Sun, 17 Jan 2021 00:46:46 +0300
Message-Id: <20210116214705.822267-5-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 21:47:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 274fbb9b-6aec-4c4a-bbdb-08d8ba685b8f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203318A6752DFB743A8F854EC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVSPlg16VeCVCISBz2OapycVba0/z+q+w6FUnwxA3/dkW7zrJLBGVhjGWWxOigSFlSVDnbLTAWikYba8t6NDfUSOmK7ji7fNzS5dUPiWC1/ZZCHl5LJ0lK9pN4sWscsbFq/5jRek+i456fdpx5rHxTwHngOvnXsbtk6CWNyh3gzl0ae+qlBbj8n1PUPtMHlZ3YhbYKwRDH/IMStEeR9O+XQ5N9TMV810Ta/6M69YEjFlqvVZ2N5J3y5Pnc9imcd5FbWUgFGB848+o/CsWjkGxMQbXrtYOgfrXIDwdlxYMhGEieJ3k8FdDjVssd4WDNesiN4ZuBZJywwA775YGJFVdb7VjkLX+3C7t/nyfE5PyPhqzZWGNghBhOgHaIekbcWF/ZHmprke9eTktVBvzAhtAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?j6YV60K+/4a/voxXxprjyDtV2mLihqwYu3rdCvdqOHhKOPo8VYJNqPQVWmjs?=
 =?us-ascii?Q?c2Uy5h4bHxl79TfbaMVBGeodSIqDUteUB+xT7pQEkwOCZjBvv0j7IZKFQFh/?=
 =?us-ascii?Q?1kUdapQp45xR8SRwNt1a5cGSim1AjLz5Awg9zbGbsbBMMNiQpCRRiaLExQ2j?=
 =?us-ascii?Q?XYTUh35gKFufJEO4c1B4KiijQ+6nH6ZmSG5EPkGcmketXoHExYjTQ2R6RqcG?=
 =?us-ascii?Q?5cJ7GyeOKsJZ6P16IE7Klf6GECH2LoeqqkxBJQWVXfkVUbwIwtKTN1AWHFRC?=
 =?us-ascii?Q?9ALD9D5zKhMYI+t0z2L6bwf2nHCiKdAJaMjCsjyus0W+gRUEcQJ1gjUbY9WD?=
 =?us-ascii?Q?SfliFA/8svgqdrNWks9aeQYgOkY7/ueM4Vh7mH9akE+Wv0OTwH0UZDU7lNp9?=
 =?us-ascii?Q?IfSabFNfO80c/Om6N656XfgFHcVxEulmwd5AG5EOhkY7Ic50eKBRpPZlPKdd?=
 =?us-ascii?Q?QRUnbeWdFEvaVkIoBvRZ5kuIh5+0OEm56pPBgxADHO2cH8yFyKyw93VBIjmj?=
 =?us-ascii?Q?P6osmXvjZ01szC9ZbbzPkPCbZL6Zm3mGjkvxbolvny6RJ5L+46yqO0y49Kp8?=
 =?us-ascii?Q?b7yxIZ+U7zep1Geu2lBKWMCpNcVioKGKLm0JUQKcxBFGlE1WtquF/BuIrSbD?=
 =?us-ascii?Q?jJZrAImgXuDcHucMw2FnEae8gNg1RI0bW23tkXcLabq2QJ9iMcMsoUWqzpIL?=
 =?us-ascii?Q?9c5o6ZlAxFQsfhjQ1Q/qRwp3+8EwcPrIlZQmEQfvi+Nn8fSuTI3nom1nqVJx?=
 =?us-ascii?Q?i9xqIviQ4Y3M/oVu1CDPTHaRnI/4yamHIudfSMyDI+9oWC3kOY/C5mESKbXN?=
 =?us-ascii?Q?yHduoMlnCXQktX3lF3aYpuKd0QjjCzq5XwWE/iMo/u5CeE8nwhBe+fN9EKEq?=
 =?us-ascii?Q?sMepIjUrbtRPEiNFUYkIpSuLb9PYGl5pnRRV/L7VnGCrewMe1XsRDJNA/JXc?=
 =?us-ascii?Q?rZXOz2nOPnnwitxIBmPS0dYOG6L1tI4v6fSNHAvnsS3qK21/LumQvOYk7Oeo?=
 =?us-ascii?Q?niVd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 274fbb9b-6aec-4c4a-bbdb-08d8ba685b8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:45.1299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii6X85RPvuFD02Cgb4Ed160nUXjCl3Nd9YQOLz716rYyjQ2pvtSVoCkFO2OnIGG0sscwG179fU8s9dP1lLU4tlVFuGiePrDf+e4zD0esyVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They will be used for backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  6 ++++++
 block/block-copy.c         | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 8c225ebf81..22372aa375 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -49,9 +49,15 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
  *
  * Caller is responsible to call block_copy_call_free() to free
  * BlockCopyCallState object.
+ *
+ * @max_workers means maximum of parallel coroutines to execute sub-requests,
+ * must be > 0.
+ *
+ * @max_chunk means maximum length for one IO operation. Zero means unlimited.
  */
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
                                      int64_t offset, int64_t bytes,
+                                     int max_workers, int64_t max_chunk,
                                      BlockCopyAsyncCallbackFunc cb,
                                      void *cb_opaque);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 74655b86f8..35213bd832 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -34,6 +34,8 @@ typedef struct BlockCopyCallState {
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
+    int max_workers;
+    int64_t max_chunk;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
 
@@ -148,10 +150,11 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
                                              int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
+    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
 
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
-                                           s->copy_size, &offset, &bytes))
+                                           max_chunk, &offset, &bytes))
     {
         return NULL;
     }
@@ -623,7 +626,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         bytes = end - offset;
 
         if (!aio && bytes) {
-            aio = aio_task_pool_new(BLOCK_COPY_MAX_WORKERS);
+            aio = aio_task_pool_new(call_state->max_workers);
         }
 
         ret = block_copy_task_run(aio, task);
@@ -701,6 +704,7 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .s = s,
         .offset = start,
         .bytes = bytes,
+        .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
     int ret = block_copy_common(&call_state);
@@ -719,6 +723,7 @@ static void coroutine_fn block_copy_async_co_entry(void *opaque)
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
                                      int64_t offset, int64_t bytes,
+                                     int max_workers, int64_t max_chunk,
                                      BlockCopyAsyncCallbackFunc cb,
                                      void *cb_opaque)
 {
@@ -728,6 +733,8 @@ BlockCopyCallState *block_copy_async(BlockCopyState *s,
         .s = s,
         .offset = offset,
         .bytes = bytes,
+        .max_workers = max_workers,
+        .max_chunk = max_chunk,
         .cb = cb,
         .cb_opaque = cb_opaque,
 
-- 
2.29.2


