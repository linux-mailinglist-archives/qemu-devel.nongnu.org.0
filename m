Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463054EAFC9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:06:15 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDQE-0005kK-AT
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:06:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJJ-0005Ow-MP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJI-0003AO-2a
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBJkyd0V7is8jylgKvB5kl4q38L29cxJDQDVxs7pwkc=;
 b=MJm29Go4whc2i898yRdKWy8n4uj59v2B/kwlavZLGruf2rXI88R1TjlJpScJq9Ypr0wmZI
 ZB5yiy/nK7Zv7Ej1QWuu3d98yTYL578ZooJaIFxIxU8U6IjVA97t7Iny0gZUOBPgtZTBlU
 bQAmrcQ/mBnlCYzMfX5onf6vZoAqqI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-Gb4JFULaPvqWaQuxkE-w8Q-1; Tue, 29 Mar 2022 10:58:56 -0400
X-MC-Unique: Gb4JFULaPvqWaQuxkE-w8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60ADE805F6C;
 Tue, 29 Mar 2022 14:58:56 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9567F40CF8ED;
 Tue, 29 Mar 2022 14:58:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/4] block/stream: Drain subtree around graph change
Date: Tue, 29 Mar 2022 16:58:48 +0200
Message-Id: <20220329145849.121051-4-hreitz@redhat.com>
In-Reply-To: <20220329145849.121051-1-hreitz@redhat.com>
References: <20220329145849.121051-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the stream block job cuts out the nodes between top and base in
stream_prepare(), it does not drain the subtree manually; it fetches the
base node, and tries to insert it as the top node's backing node with
bdrv_set_backing_hd().  bdrv_set_backing_hd() however will drain, and so
the actual base node might change (because the base node is actually not
part of the stream job) before the old base node passed to
bdrv_set_backing_hd() is installed.

This has two implications:

First, the stream job does not keep a strong reference to the base node.
Therefore, if it is deleted in bdrv_set_backing_hd()'s drain (e.g.
because some other block job is drained to finish), we will get a
use-after-free.  We should keep a strong reference to that node.

Second, even with such a strong reference, the problem remains that the
base node might change before bdrv_set_backing_hd() actually runs and as
a result the wrong base node is installed.

Both effects can be seen in 030's TestParallelOps.test_overlapping_5()
case, which has five nodes, and simultaneously streams from the middle
node to the top node, and commits the middle node down to the base node.
As it is, this will sometimes crash, namely when we encounter the
above-described use-after-free.

Taking a strong reference to the base node, we no longer get a crash,
but the resuling block graph is less than ideal: The expected result is
obviously that all middle nodes are cut out and the base node is the
immediate backing child of the top node.  However, if stream_prepare()
takes a strong reference to its base node (the middle node), and then
the commit job finishes in bdrv_set_backing_hd(), supposedly dropping
that middle node, the stream job will just reinstall it again.

Therefore, we need to keep the whole subtree drained in
stream_prepare(), so that the graph modification it performs is
effectively atomic, i.e. that the base node it fetches is still the base
node when bdrv_set_backing_hd() sets it as the top node's backing node.

Verify this by asserting in said 030's test case that the base node is
always the top node's immediate backing child when both jobs are done.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220324140907.17192-1-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block/stream.c         | 15 ++++++++++++++-
 tests/qemu-iotests/030 |  5 +++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/block/stream.c b/block/stream.c
index 3acb59fe6a..694709bd25 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -64,7 +64,13 @@ static int stream_prepare(Job *job)
     bdrv_cor_filter_drop(s->cor_filter_bs);
     s->cor_filter_bs = NULL;
 
+    bdrv_subtree_drained_begin(s->above_base);
+
     base = bdrv_filter_or_cow_bs(s->above_base);
+    if (base) {
+        bdrv_ref(base);
+    }
+
     unfiltered_base = bdrv_skip_filters(base);
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -75,14 +81,21 @@ static int stream_prepare(Job *job)
                 base_fmt = unfiltered_base->drv->format_name;
             }
         }
+
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
         ret = bdrv_change_backing_file(unfiltered_bs, base_id, base_fmt, false);
         if (local_err) {
             error_report_err(local_err);
-            return -EPERM;
+            ret = -EPERM;
+            goto out;
         }
     }
 
+out:
+    if (base) {
+        bdrv_unref(base);
+    }
+    bdrv_subtree_drained_end(s->above_base);
     return ret;
 }
 
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 567bf1da67..14112835ed 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -436,6 +436,11 @@ class TestParallelOps(iotests.QMPTestCase):
         self.vm.run_job(job='node4', auto_dismiss=True)
         self.assert_no_active_block_jobs()
 
+        # Assert that node0 is now the backing node of node4
+        result = self.vm.qmp('query-named-block-nodes')
+        node4 = next(node for node in result['return'] if node['node-name'] == 'node4')
+        self.assertEqual(node4['image']['backing-image']['filename'], self.imgs[0])
+
     # Test a block-stream and a block-commit job in parallel
     # Here the stream job is supposed to finish quickly in order to reproduce
     # the scenario that triggers the bug fixed in 3d5d319e1221 and 1a63a907507
-- 
2.35.1


