Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CAE263062
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:48436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG1t3-0004RT-Mx
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1m2-0002B0-2w
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kG1lt-0003rh-3E
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 11:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599664348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GRAoEW8XedzP7Dl0ySriHPHHDVP8R9/ZqTh7Mo04Y8=;
 b=i8dxZYIzY2m/WiJ4W1rWuxQ3A0fl9/HokUrIVblwHcq3TIL7Yx5ybmYwPFj0hvzIVxSC3i
 u7NV/2mOuq/QAo2HHGqA23A9w+hMEuuyyDG2bkkkdzFY1MZuB5TuLZvlGcPY4rIVXboQUG
 +fGvEg6xIeHeCmKU2KZO8W0fl/Hjrnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-QlCEJULlMNSCEx58UpeIWw-1; Wed, 09 Sep 2020 11:12:26 -0400
X-MC-Unique: QlCEJULlMNSCEx58UpeIWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49B8D1005E73;
 Wed,  9 Sep 2020 15:12:25 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-221.ams2.redhat.com
 [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEC1660C07;
 Wed,  9 Sep 2020 15:12:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 13/13] block: Convert 'block_resize' to coroutine
Date: Wed,  9 Sep 2020 17:11:49 +0200
Message-Id: <20200909151149.490589-14-kwolf@redhat.com>
In-Reply-To: <20200909151149.490589-1-kwolf@redhat.com>
References: <20200909151149.490589-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:25:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block_resize performs some I/O that could potentially take quite some
time, so use it as an example for the new 'coroutine': true annotation
in the QAPI schema.

bdrv_truncate() requires that we're already in the right AioContext for
the BlockDriverState if called in coroutine context. So instead of just
taking the AioContext lock, move the QMP handler coroutine to the
context.

Call blk_unref() only after switching back because blk_unref() may only
be called in the main thread.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json |  3 ++-
 blockdev.c           | 13 ++++++-------
 hmp-commands.hx      |  1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 0345f6f2d2..d3e49c9419 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1302,7 +1302,8 @@
 { 'command': 'block_resize',
   'data': { '*device': 'str',
             '*node-name': 'str',
-            'size': 'int' } }
+            'size': 'int' },
+  'coroutine': true }
 
 ##
 # @NewImageMode:
diff --git a/blockdev.c b/blockdev.c
index 7f2561081e..064989fc2d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2439,14 +2439,14 @@ BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
     return ret;
 }
 
-void qmp_block_resize(bool has_device, const char *device,
-                      bool has_node_name, const char *node_name,
-                      int64_t size, Error **errp)
+void coroutine_fn qmp_block_resize(bool has_device, const char *device,
+                                   bool has_node_name, const char *node_name,
+                                   int64_t size, Error **errp)
 {
     Error *local_err = NULL;
     BlockBackend *blk = NULL;
     BlockDriverState *bs;
-    AioContext *aio_context;
+    AioContext *old_ctx;
 
     bs = bdrv_lookup_bs(has_device ? device : NULL,
                         has_node_name ? node_name : NULL,
@@ -2456,8 +2456,7 @@ void qmp_block_resize(bool has_device, const char *device,
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
+    old_ctx = bdrv_co_move_to_aio_context(bs);
 
     if (size < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size");
@@ -2479,8 +2478,8 @@ void qmp_block_resize(bool has_device, const char *device,
     bdrv_drained_end(bs);
 
 out:
+    aio_co_reschedule_self(old_ctx);
     blk_unref(blk);
-    aio_context_release(aio_context);
 }
 
 void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 60f395c276..ac360b73f6 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -76,6 +76,7 @@ ERST
         .params     = "device size",
         .help       = "resize a block image",
         .cmd        = hmp_block_resize,
+        .coroutine  = true,
     },
 
 SRST
-- 
2.25.4


