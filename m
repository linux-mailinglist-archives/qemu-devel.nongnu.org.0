Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AE2D9D4B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:12:21 +0100 (CET)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korOW-0000ZW-A8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korJF-0002t7-B9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1korJD-0005dU-CL
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bR0d1JArrAy1qnHujAAvCo8e9rCfTiOxzdxX6U9l434=;
 b=A17hCsS2dLfOAdeLek1rUNWKlSiON6lRiCofKLHx/32gKFAprl3Q7BCsU4qXnAFxpiuCvX
 w+llJLsolyD6t1Ci3p8KhnAtf7i4+RWdwmXlLOvEil/OOOpZ+t2LdrX6n5b1i64KIQjkGS
 se/SAZIwC8lWaQ+osAjiAtu2+3aZ2oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-_8-ouXvpNqK8vTFc4U2Pjg-1; Mon, 14 Dec 2020 12:06:47 -0500
X-MC-Unique: _8-ouXvpNqK8vTFc4U2Pjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAA0800685;
 Mon, 14 Dec 2020 17:06:26 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3A39669FC;
 Mon, 14 Dec 2020 17:06:22 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] block: Close block exports in two steps
Date: Mon, 14 Dec 2020 18:05:19 +0100
Message-Id: <20201214170519.223781-5-slp@redhat.com>
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a cross-dependency between closing the block exports and
draining the block layer. The latter needs that we close all export's
client connections to ensure they won't queue more requests, but the
exports may have coroutines yielding in the block layer, which implies
they can't be fully closed until we drain it.

To break this cross-dependency, this change adds a "bool wait"
argument to blk_exp_close_all() and blk_exp_close_all_type(), so
callers can decide whether they want to wait for the exports to be
fully quiesced, or just return after requesting them to shut down.

Then, in bdrv_close_all we make two calls, one without waiting to
close all client connections, and another after draining the block
layer, this time waiting for the exports to be fully quiesced.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1900505
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block.c                   | 20 +++++++++++++++++++-
 block/export/export.c     | 10 ++++++----
 blockdev-nbd.c            |  2 +-
 include/block/export.h    |  4 ++--
 qemu-nbd.c                |  2 +-
 stubs/blk-exp-close-all.c |  2 +-
 6 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index bc8a66ab6e..41db70ac07 100644
--- a/block.c
+++ b/block.c
@@ -4472,13 +4472,31 @@ static void bdrv_close(BlockDriverState *bs)
 void bdrv_close_all(void)
 {
     assert(job_next(NULL) == NULL);
-    blk_exp_close_all();
+
+    /*
+     * There's a cross-dependency between closing the block exports and
+     * draining the block layer. The latter needs that we close all export's
+     * client connections to ensure they won't queue more requests, but the
+     * exports may have coroutines yielding in the block layer, which implies
+     * they can't be fully closed until we drain it.
+     *
+     * Make a first call to close all export's client connections, without
+     * waiting for each export to be fully quiesced.
+     */
+    blk_exp_close_all(false);
 
     /* Drop references from requests still in flight, such as canceled block
      * jobs whose AIO context has not been polled yet */
     bdrv_drain_all();
 
     blk_remove_all_bs();
+
+    /*
+     * Make a second call to shut down the exports, this time waiting for them
+     * to be fully quiesced.
+     */
+    blk_exp_close_all(true);
+
     blockdev_close_all_bdrv_states();
 
     assert(QTAILQ_EMPTY(&all_bdrv_states));
diff --git a/block/export/export.c b/block/export/export.c
index bad6f21b1c..0124ebd9f9 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -280,7 +280,7 @@ static bool blk_exp_has_type(BlockExportType type)
 }
 
 /* type == BLOCK_EXPORT_TYPE__MAX for all types */
-void blk_exp_close_all_type(BlockExportType type)
+void blk_exp_close_all_type(BlockExportType type, bool wait)
 {
     BlockExport *exp, *next;
 
@@ -293,12 +293,14 @@ void blk_exp_close_all_type(BlockExportType type)
         blk_exp_request_shutdown(exp);
     }
 
-    AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+    if (wait) {
+        AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
+    }
 }
 
-void blk_exp_close_all(void)
+void blk_exp_close_all(bool wait)
 {
-    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX);
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE__MAX, wait);
 }
 
 void qmp_block_export_add(BlockExportOptions *export, Error **errp)
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index d8443d235b..d71d4da7c2 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -266,7 +266,7 @@ void qmp_nbd_server_stop(Error **errp)
         return;
     }
 
-    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD);
+    blk_exp_close_all_type(BLOCK_EXPORT_TYPE_NBD, true);
 
     nbd_server_free(nbd_server);
     nbd_server = NULL;
diff --git a/include/block/export.h b/include/block/export.h
index 7feb02e10d..71c25928ce 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -83,7 +83,7 @@ BlockExport *blk_exp_find(const char *id);
 void blk_exp_ref(BlockExport *exp);
 void blk_exp_unref(BlockExport *exp);
 void blk_exp_request_shutdown(BlockExport *exp);
-void blk_exp_close_all(void);
-void blk_exp_close_all_type(BlockExportType type);
+void blk_exp_close_all(bool wait);
+void blk_exp_close_all_type(BlockExportType type, bool wait);
 
 #endif
diff --git a/qemu-nbd.c b/qemu-nbd.c
index a7075c5419..928f4466f6 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1122,7 +1122,7 @@ int main(int argc, char **argv)
     do {
         main_loop_wait(false);
         if (state == TERMINATE) {
-            blk_exp_close_all();
+            blk_exp_close_all(true);
             state = TERMINATED;
         }
     } while (state != TERMINATED);
diff --git a/stubs/blk-exp-close-all.c b/stubs/blk-exp-close-all.c
index 1c71316763..ecd0ce611f 100644
--- a/stubs/blk-exp-close-all.c
+++ b/stubs/blk-exp-close-all.c
@@ -2,6 +2,6 @@
 #include "block/export.h"
 
 /* Only used in programs that support block exports (libblockdev.fa) */
-void blk_exp_close_all(void)
+void blk_exp_close_all(bool wait)
 {
 }
-- 
2.26.2


