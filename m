Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7D645AE8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uLC-0007uP-Hr; Wed, 07 Dec 2022 08:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uL6-0007mt-60
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uL3-0006Wk-FZ
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uELffQwc+vR5UzRhsxqgEQNizbgEpX1pmc9nyyM70mY=;
 b=Z+hS0gwKFSkI4KwVaEq8y360xNQrnldBsEGUQ4aaMGFAoTU7YK/fxBOjRjCTeHBE0sw4pQ
 NWJVlUpyq5uwwNkvk5219Sgn05He7Kzs6Wg+m7rSyP2ClcW/XoMXqowr7wUxEY5LEFLa6I
 +gBzSUwImPNuf0VY0tJFsJsP7CtV4po=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428--okbLpIjMAST-w41Xuz0Bg-1; Wed, 07 Dec 2022 08:19:34 -0500
X-MC-Unique: -okbLpIjMAST-w41Xuz0Bg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74EFD381494E;
 Wed,  7 Dec 2022 13:19:34 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54E0A1121314;
 Wed,  7 Dec 2022 13:19:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 09/18] test-bdrv-drain: Fix incorrrect drain assumptions
Date: Wed,  7 Dec 2022 14:18:29 +0100
Message-Id: <20221207131838.239125-10-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The test case assumes that a drain only happens in one specific place
where it drains explicitly. This assumption happened to hold true until
now, but block layer functions may drain interally (any graph
modifications are going to do that through bdrv_graph_wrlock()), so this
is incorrect. Make sure that the test code in .drained_begin only runs
where we actually want it to run.

When scheduling a BH from .drained_begin, we also need to increase the
in_flight counter to make sure that the operation is actually completed
in time before the node that it works on goes away.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2686a8acee..8cedea4959 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1107,6 +1107,7 @@ struct detach_by_parent_data {
     BlockDriverState *c;
     BdrvChild *child_c;
     bool by_parent_cb;
+    bool detach_on_drain;
 };
 static struct detach_by_parent_data detach_by_parent_data;
 
@@ -1114,6 +1115,7 @@ static void detach_indirect_bh(void *opaque)
 {
     struct detach_by_parent_data *data = opaque;
 
+    bdrv_dec_in_flight(data->child_b->bs);
     bdrv_unref_child(data->parent_b, data->child_b);
 
     bdrv_ref(data->c);
@@ -1128,12 +1130,21 @@ static void detach_by_parent_aio_cb(void *opaque, int ret)
 
     g_assert_cmpint(ret, ==, 0);
     if (data->by_parent_cb) {
+        bdrv_inc_in_flight(data->child_b->bs);
         detach_indirect_bh(data);
     }
 }
 
 static void detach_by_driver_cb_drained_begin(BdrvChild *child)
 {
+    struct detach_by_parent_data *data = &detach_by_parent_data;
+
+    if (!data->detach_on_drain) {
+        return;
+    }
+    data->detach_on_drain = false;
+
+    bdrv_inc_in_flight(data->child_b->bs);
     aio_bh_schedule_oneshot(qemu_get_current_aio_context(),
                             detach_indirect_bh, &detach_by_parent_data);
     child_of_bds.drained_begin(child);
@@ -1174,8 +1185,14 @@ static void test_detach_indirect(bool by_parent_cb)
         detach_by_driver_cb_class = child_of_bds;
         detach_by_driver_cb_class.drained_begin =
             detach_by_driver_cb_drained_begin;
+        detach_by_driver_cb_class.drained_end = NULL;
+        detach_by_driver_cb_class.drained_poll = NULL;
     }
 
+    detach_by_parent_data = (struct detach_by_parent_data) {
+        .detach_on_drain = false,
+    };
+
     /* Create all involved nodes */
     parent_a = bdrv_new_open_driver(&bdrv_test, "parent-a", BDRV_O_RDWR,
                                     &error_abort);
@@ -1227,6 +1244,7 @@ static void test_detach_indirect(bool by_parent_cb)
         .child_b = child_b,
         .c = c,
         .by_parent_cb = by_parent_cb,
+        .detach_on_drain = true,
     };
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
-- 
2.38.1


