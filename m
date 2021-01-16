Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA272F8F7A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:52:13 +0100 (CET)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tUS-00020h-25
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQG-0005A6-91; Sat, 16 Jan 2021 16:47:53 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQE-00076Z-GU; Sat, 16 Jan 2021 16:47:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3+0541usyoAgUbVzviEvzdsQ/bba5F74PRE5B0s2IKlA7ZailfWKOco8RAW+aW6rCOmaW3UJSjx0FjlRnfwWwr2TKkSW6Z2dtq407sx8XM00wAiInQRGeEUQQtJVD2VvMdoQxidbarHlh+Z264pBLYVzhT+unGpCWm7BPTMsZXZHwTtwfebMgNHgTnCQXmm0R/gM5oLLc6033THjBA5U1ppfxUCayGDROOAhZ1jbhca87O10uxp6cKSfaFS9g2Naa7ffkuMhRzxHibYEaFOog/jURwpngaQE73FnEu0a6cC+HwKJt3giEnEaT+5e7dKXj7b4K6BPibPqp/rm6jxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYDSpPmRCBtXKZ7OFwOzin/BSN/9ElEE2Vl6mbgMsY0=;
 b=c309Sb5bk7zfjxEx5hlmdygj1x8k3ZaSXoSbCbiVyVIdXREwNFvZogBvGT9EVU1Sq0XA+NEkKmH3efL3jotRzRP1erEGZQleOlHMcW3emzTHHx+Zp1vzuqPJQTwnypK6WlKKZ1IZdV8Xk6+y61JhZrxWo8TkicDo8HQRZ7diYlcVQorYHuGJdcUoqSThSpfCtxEmaivJZFvj6etwiDMA0x6btDZcOciK+fR4MCQy7PzcXurmMSvIpvZMvgLsMzYwtd5pmGfTl4krWNQkF2HEkIY2Pj6wIzMrJ3iDyFgwDk4PosmUFw03YBQEZkr1gr89t9aLEoIGQXztRXBdFaelFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYDSpPmRCBtXKZ7OFwOzin/BSN/9ElEE2Vl6mbgMsY0=;
 b=PMUAxZILy0vzgDAqiBIFZx2SOWBxmJW55TB4ccYIaiGaUXdmAyhdCarqEG27M2CPUrqo3vlal+05oyV32wXCWPdvmE/YJxNMeDhTvFqGmWyMc/zAwWZbf3wbSohjildecbEI434NwrXYcipZw7OfuV/c/TZSxnrwXRje3Vn7VyY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 03/23] block/block-copy: implement block_copy_async
Date: Sun, 17 Jan 2021 00:46:45 +0300
Message-Id: <20210116214705.822267-4-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 21:47:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5887451-9a16-4ef7-f39f-08d8ba685a9d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033E1ACCCB4A1A871CD05DDC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:50;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mdauCEZR+/AFnqLf8Xi27zl+pepOSP+/+NjmknNXGoehZ2RoFNELR/to6xU6RYj9CWQpAhFl4Q/oDHnn4PbkFkiajZGMJJv9b9pjoGW/OaPk0POKa67LRJQ2lUC6HM6KCPv48XUa6FDy6YbwCl3w+qAwkF0ONZSuCi1mW3gejORXItBRmeul6F4jd8GHAJtBw95M3SoHVbfQSA3gMpzj0U5JhQKL/q96fw4pUfcQW308HPgn90OjGHYfnm3NuTTWLPBAqrbHdSzmZRySBWZtEj4BgOUq0JEtaen7zKVoO3RKynCZAMX6+er37YiflNH0D8ohzGpLTJprsC8wwPphuKmreCvSM86vYFBHuEuh+QWPrLs8foX3bsQOrkGxllpQEIJoA/KKWGD2xtxsXbB1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V0QLbPeR5kQDTt1BXYaJODqbXZaLdPYD2BnWPCsFsGhjOQxGDO+uju1TW8lO?=
 =?us-ascii?Q?zaEDwxgOsHz5vbksWlR5D/u2US+iqkjUphlgSMBIFBvEswQbmYEKzbeS5kLM?=
 =?us-ascii?Q?0udE5rKws1uyAD3TlPJZWBXrVJitLs/fXmFI2E75VCHOOrJNfdOI8ilWaGvL?=
 =?us-ascii?Q?bxLNSPAvV4u60ty9hfeisKuBhH7XNuSzGMO+ufDZhbPeO/z5Wf9iLZJ2N7ry?=
 =?us-ascii?Q?jz/QVYzsx9ZMwQs7oVm8mpHYOFh4ZygtKj2cXHXrPCfs03ma6Wmv5XXMwR6T?=
 =?us-ascii?Q?oG/5c/bjVy4lE9ErmzE2RIeOhdCgvIGd2hf8wg4SXZOtk7s2pQDavCBa4Qhk?=
 =?us-ascii?Q?uMVr+Y9BCK30clJI+bRptNdGf1tvK+euT/aJ3e1hckC7oAyc+K3o6QOJfKLI?=
 =?us-ascii?Q?o2uutLbZS9QOvttOwJcER++Q/SqnmyxdBylPpaknIgfpu5PiaGauWzAXUBwL?=
 =?us-ascii?Q?iorYsx7MhnKTO+/OjhFovSUBBtc6m0l3oBlHIdDPWo/ekm8DMivUO368O787?=
 =?us-ascii?Q?QRGDyBPIzDYiaJCGz6mivdLdHH/wZgDtK1HORm+UlYABJjdCxnz+HEik2j/b?=
 =?us-ascii?Q?P82ho2c8K08t3pbUdVojZ8ksnA5qB25xknyU9gv4qpO29hHktAX97l8D7UeI?=
 =?us-ascii?Q?KOuaGf048x6BGjp5rPakvW+L/aNJKZYnCZL1xGJz1/OCB2+COW1RtJdjmbeP?=
 =?us-ascii?Q?6y1HDz/ciwDgamlMo4kT4EseoZKbWiFH9Z/1ZB1wzi+8o8Z0f/gWESWi6/r8?=
 =?us-ascii?Q?rG4aOE90SwDpnA+vB8DeXrZByU+/bZBZUmQGf0SJgNhucRCzLLLuylpT7g8b?=
 =?us-ascii?Q?9QIb3XIWN7nxtdVUap2tLj4UzM0n9YM0yzeHmWfhgrsXz7slTFgbrOP1mP23?=
 =?us-ascii?Q?6umROYmHhENjM7dsx46gdMGLmvQYe0zHBe9Meiimm/8/g9m+VamnxQcj5l3A?=
 =?us-ascii?Q?QlnR4IESCljXUujJtKgaEJnaytsBCR6gduAJhqSl05PzGQYvafGgrlbAZQY+?=
 =?us-ascii?Q?uKUy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5887451-9a16-4ef7-f39f-08d8ba685a9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:43.5617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJXCJlJQOrd9R5tPJubqWQBbjNNBnalbHoPo+2uclg6y99dDsy0nVDOkByLKCN4Puk4Xc6DUdBOGLfxunIMB70HawBbPvxUl6Rdp5+qPA1Q=
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

We'll need async block-copy invocation to use in backup directly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h | 29 ++++++++++++++
 block/block-copy.c         | 81 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 106 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 6397505f30..8c225ebf81 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -19,7 +19,9 @@
 #include "qemu/co-shared-resource.h"
 
 typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
+typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
+typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
@@ -41,6 +43,33 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool *error_is_read);
 
+/*
+ * Run block-copy in a coroutine, create corresponding BlockCopyCallState
+ * object and return pointer to it. Never returns NULL.
+ *
+ * Caller is responsible to call block_copy_call_free() to free
+ * BlockCopyCallState object.
+ */
+BlockCopyCallState *block_copy_async(BlockCopyState *s,
+                                     int64_t offset, int64_t bytes,
+                                     BlockCopyAsyncCallbackFunc cb,
+                                     void *cb_opaque);
+
+/*
+ * Free finished BlockCopyCallState. Trying to free running
+ * block-copy will crash.
+ */
+void block_copy_call_free(BlockCopyCallState *call_state);
+
+/*
+ * Note, that block-copy call is marked finished prior to calling
+ * the callback.
+ */
+bool block_copy_call_finished(BlockCopyCallState *call_state);
+bool block_copy_call_succeeded(BlockCopyCallState *call_state);
+bool block_copy_call_failed(BlockCopyCallState *call_state);
+int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 6ea55f1f9a..74655b86f8 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -30,13 +30,19 @@
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
-    /* IN parameters */
+    /* IN parameters. Initialized in block_copy_async() and never changed. */
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
+    BlockCopyAsyncCallbackFunc cb;
+    void *cb_opaque;
+
+    /* Coroutine where async block-copy is running */
+    Coroutine *co;
 
     /* State */
-    bool failed;
+    int ret;
+    bool finished;
 
     /* OUT parameters */
     bool error_is_read;
@@ -428,8 +434,8 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
 
     ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
                              &error_is_read);
-    if (ret < 0 && !t->call_state->failed) {
-        t->call_state->failed = true;
+    if (ret < 0 && !t->call_state->ret) {
+        t->call_state->ret = ret;
         t->call_state->error_is_read = error_is_read;
     } else {
         progress_work_done(t->s->progress, t->bytes);
@@ -679,6 +685,12 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          */
     } while (ret > 0);
 
+    call_state->finished = true;
+
+    if (call_state->cb) {
+        call_state->cb(call_state->cb_opaque);
+    }
+
     return ret;
 }
 
@@ -700,6 +712,67 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
     return ret;
 }
 
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
+{
+    block_copy_common(opaque);
+}
+
+BlockCopyCallState *block_copy_async(BlockCopyState *s,
+                                     int64_t offset, int64_t bytes,
+                                     BlockCopyAsyncCallbackFunc cb,
+                                     void *cb_opaque)
+{
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
+        .s = s,
+        .offset = offset,
+        .bytes = bytes,
+        .cb = cb,
+        .cb_opaque = cb_opaque,
+
+        .co = qemu_coroutine_create(block_copy_async_co_entry, call_state),
+    };
+
+    qemu_coroutine_enter(call_state->co);
+
+    return call_state;
+}
+
+void block_copy_call_free(BlockCopyCallState *call_state)
+{
+    if (!call_state) {
+        return;
+    }
+
+    assert(call_state->finished);
+    g_free(call_state);
+}
+
+bool block_copy_call_finished(BlockCopyCallState *call_state)
+{
+    return call_state->finished;
+}
+
+bool block_copy_call_succeeded(BlockCopyCallState *call_state)
+{
+    return call_state->finished && call_state->ret == 0;
+}
+
+bool block_copy_call_failed(BlockCopyCallState *call_state)
+{
+    return call_state->finished && call_state->ret < 0;
+}
+
+int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
+{
+    assert(call_state->finished);
+    if (error_is_read) {
+        *error_is_read = call_state->error_is_read;
+    }
+    return call_state->ret;
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


