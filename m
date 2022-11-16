Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C862BDA8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRd-0000lz-Qb; Wed, 16 Nov 2022 07:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRQ-0000fe-4T
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRM-0000wK-9h
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NGxTii04B+hdUeAw/OVSdOoNnZ0C0E9Y8mu6Pzt0g4=;
 b=WaBJWMmtW94Ic436g3ugdLTO47avKshKGbgEEjVj75KK+zY8aTPP9/Cn1hhpAmeYk2qhUT
 SHl8yehQkw9IO9n+OnRSeCwILflBH9YYZDyhLnFjyW1FDG2i4kj2cCLvL/CTCq/+e7R3is
 3V/OzkSt5sR0h4jATLLLIgE8wGffKXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Mp1vX58oORu-A7xT18T_lg-1; Wed, 16 Nov 2022 07:22:46 -0500
X-MC-Unique: Mp1vX58oORu-A7xT18T_lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E47885A59D;
 Wed, 16 Nov 2022 12:22:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E62F79E70;
 Wed, 16 Nov 2022 12:22:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 08/11] block: distinguish between bdrv_create running in
 coroutine and not
Date: Wed, 16 Nov 2022 07:22:38 -0500
Message-Id: <20221116122241.2856527-9-eesposit@redhat.com>
In-Reply-To: <20221116122241.2856527-1-eesposit@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 block.c | 76 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/block.c b/block.c
index 577639c7e0..c610a32e77 100644
--- a/block.c
+++ b/block.c
@@ -528,66 +528,66 @@ typedef struct CreateCo {
     Error *err;
 } CreateCo;
 
-static void coroutine_fn bdrv_create_co_entry(void *opaque)
+static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                       QemuOpts *opts, Error **errp)
 {
-    Error *local_err = NULL;
     int ret;
+    char *filename_copy;
+    GLOBAL_STATE_CODE();
+    assert(*errp == NULL);
+    assert(drv);
+
+    if (!drv->bdrv_co_create_opts) {
+        error_setg(errp, "Driver '%s' does not support image creation",
+                   drv->format_name);
+        return -ENOTSUP;
+    }
 
+    filename_copy = g_strdup(filename);
+    ret = drv->bdrv_co_create_opts(drv, filename_copy, opts, errp);
+
+    if (ret < 0 && !*errp) {
+        error_setg_errno(errp, -ret, "Could not create image");
+    }
+
+    g_free(filename_copy);
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
-        .filename = g_strdup(filename),
-        .opts = opts,
-        .ret = NOT_DONE,
-        .err = NULL,
-    };
-
-    if (!drv->bdrv_co_create_opts) {
-        error_setg(errp, "Driver '%s' does not support image creation", drv->format_name);
-        ret = -ENOTSUP;
-        goto out;
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
-out:
-    g_free(cco.filename);
-    return ret;
 }
 
 /**
-- 
2.31.1


