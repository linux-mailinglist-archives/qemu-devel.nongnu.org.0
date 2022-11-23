Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CE635C1F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:51:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9M-0002jC-Q4; Wed, 23 Nov 2022 06:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9I-0002dp-6T
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9F-00061e-Fv
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu6WsWdDz3gyTd2v4GhCzqxoC2+4u7w9eDNsfieYH2o=;
 b=TPRZSBN9FCkHXbqBaIGnFT4Cb7gI4IVBMxh+ZITW8BiiaScHuFovQi+pBj06SRxh4+yjKM
 hgGzPFHyEFIxRoJRUzjLBrdJP+WtXJSmiib3NAoSK/k6O7No0D30Hmx/Q9laCY/YjDFKc0
 b+MM3i0YebpJ7a7Hhcnq/jD1Va7otXg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-R9yWKI02OEeVW9Rvv4voCg-1; Wed, 23 Nov 2022 06:42:33 -0500
X-MC-Unique: R9yWKI02OEeVW9Rvv4voCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 394FE802D32;
 Wed, 23 Nov 2022 11:42:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7679C2C8CA;
 Wed, 23 Nov 2022 11:42:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 08/15] block: distinguish between bdrv_create running in
 coroutine and not
Date: Wed, 23 Nov 2022 06:42:20 -0500
Message-Id: <20221123114227.85757-9-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Call two different functions depending on whether bdrv_create
is in coroutine or not, following the same pattern as
generated_co_wrapper functions.

This allows to also call the coroutine function directly,
without using CreateCo or relying in bdrv_create().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 72 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index 9d51e7b6e5..8a7f87f783 100644
--- a/block.c
+++ b/block.c
@@ -528,63 +528,65 @@ typedef struct CreateCo {
     Error *err;
 } CreateCo;
 
-static void coroutine_fn bdrv_create_co_entry(void *opaque)
+static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                       QemuOpts *opts, Error **errp)
 {
-    Error *local_err = NULL;
     int ret;
+    GLOBAL_STATE_CODE();
+    QEMU_IN_COROUTINE();
+    ERRP_GUARD();
+    assert(*errp == NULL);
+    assert(drv);
+
+    if (!drv->bdrv_co_create_opts) {
+        error_setg(errp, "Driver '%s' does not support image creation",
+                   drv->format_name);
+        return -ENOTSUP;
+    }
+
+    ret = drv->bdrv_co_create_opts(drv, filename, opts, errp);
 
+    if (ret < 0 && !*errp) {
+        error_setg_errno(errp, -ret, "Could not create image");
+    }
+
+    return ret;
+}
+
+static void coroutine_fn bdrv_create_co_entry(void *opaque)
+{
     CreateCo *cco = opaque;
-    assert(cco->drv);
     GLOBAL_STATE_CODE();
 
-    ret = cco->drv->bdrv_co_create_opts(cco->drv,
-                                        cco->filename, cco->opts, &local_err);
-    error_propagate(&cco->err, local_err);
-    cco->ret = ret;
+    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts, &cco->err);
 }
 
 int bdrv_create(BlockDriver *drv, const char* filename,
                 QemuOpts *opts, Error **errp)
 {
-    int ret;
-
     GLOBAL_STATE_CODE();
 
-    Coroutine *co;
-    CreateCo cco = {
-        .drv = drv,
-        .filename = filename,
-        .opts = opts,
-        .ret = NOT_DONE,
-        .err = NULL,
-    };
-
-    if (!drv->bdrv_co_create_opts) {
-        error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
-        return -ENOTSUP;
-    }
-
     if (qemu_in_coroutine()) {
         /* Fast-path if already in coroutine context */
-        bdrv_create_co_entry(&cco);
+        return bdrv_co_create(drv, filename, opts, errp);
     } else {
+        Coroutine *co;
+        CreateCo cco = {
+            .drv = drv,
+            .filename = filename,
+            .opts = opts,
+            .ret = NOT_DONE,
+            .err = NULL,
+        };
+
         co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
         qemu_coroutine_enter(co);
         while (cco.ret == NOT_DONE) {
             aio_poll(qemu_get_aio_context(), true);
         }
+        error_propagate(errp, cco.err);
+        return cco.ret;
     }
-
-    ret = cco.ret;
-    if (ret < 0) {
-        if (cco.err) {
-            error_propagate(errp, cco.err);
-        } else {
-            error_setg_errno(errp, -ret, "Could not create image");
-        }
-    }
-
-    return ret;
 }
 
 /**
-- 
2.31.1


