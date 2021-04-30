Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5436F91F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:19:46 +0200 (CEST)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRBR-0007ES-Dp
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkf-0003oD-M5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkd-0002L6-P9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rc1VIt4XtcU3X62NVx4GAtKaW345lYBsQzDVc6YGVGM=;
 b=Vc4TduqOCJI1Nc+CRd8R0TQYvb+Gvj3oQynIzu9PkFcBCaoaugfwK6QXEwVatnW0AoPIBz
 X0xU7SsSJBv7RCUAU5woZ4/K5fPJ8ivzm0BlOcu7N8/V5225cw9R3R7DzEA3gveyzOSS9t
 yb6vTl3qjtbHkOeqm4gvgLKd33AkrjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-KAkmXvc9OJaiQ4DuXZiY7g-1; Fri, 30 Apr 2021 06:52:00 -0400
X-MC-Unique: KAkmXvc9OJaiQ4DuXZiY7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82B53107ACCA;
 Fri, 30 Apr 2021 10:51:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41DD317177;
 Fri, 30 Apr 2021 10:51:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/39] tests/test-bdrv-graph-mod: add test_append_greedy_filter
Date: Fri, 30 Apr 2021 12:51:11 +0200
Message-Id: <20210430105147.125840-4-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

bdrv_append() is not quite good for inserting filters: it does extra
permission update in intermediate state, where filter get it filtered
child but is not yet replace it in a backing chain.

Some filters (for example backup-top) may want permissions even when
have no parents. And described intermediate state becomes invalid.

That's (half a) reason, why we need "inactive" state for backup-top
filter.

bdrv_append() will be improved later, now let's add a unit test.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/append-greedy-filter

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-graph-mod.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a8219b131e..5b6934e68b 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -352,6 +352,37 @@ static void test_parallel_perm_update(void)
     bdrv_unref(top);
 }
 
+/*
+ * It's possible that filter required permissions allows to insert it to backing
+ * chain, like:
+ *
+ *  1.  [top] -> [filter] -> [base]
+ *
+ * but doesn't allow to add it as a branch:
+ *
+ *  2.  [filter] --\
+ *                 v
+ *      [top] -> [base]
+ *
+ * So, inserting such filter should do all graph modifications and only then
+ * update permissions. If we try to go through intermediate state [2] and update
+ * permissions on it we'll fail.
+ *
+ * Let's check that bdrv_append() can append such a filter.
+ */
+static void test_append_greedy_filter(void)
+{
+    BlockDriverState *top = exclusive_writer_node("top");
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl = exclusive_writer_node("fl1");
+
+    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+                      &error_abort);
+
+    bdrv_append(fl, base, &error_abort);
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -378,6 +409,8 @@ int main(int argc, char *argv[])
                         test_parallel_exclusive_write);
         g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                         test_parallel_perm_update);
+        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                        test_append_greedy_filter);
     }
 
     return g_test_run();
-- 
2.30.2


