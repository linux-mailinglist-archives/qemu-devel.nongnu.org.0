Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C30635C18
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxo9P-0002k6-BS; Wed, 23 Nov 2022 06:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9L-0002hb-GO
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oxo9H-00063M-W4
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669203759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddKS1lh9/GhCfJBDgfxHHrg3khuU0MI92j9y+mbKtAk=;
 b=hAbNRRUVavqo68Xc21l4QAavivBZxZqd2AVVTlUThnUW6PUo6kahyh2USJPTJyy0tg7/cS
 77f9sA8l8jBBdOURBpPvoT2Sjpefvg1nMMRkjBJrUKM1iKN3LYAJV6+xg+gGViG0hR6Hmg
 IP6bWMSEJR6+97tY+PRxCRH/Zft8CNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-Be9RcqWLM16UmljtSvmQKQ-1; Wed, 23 Nov 2022 06:42:36 -0500
X-MC-Unique: Be9RcqWLM16UmljtSvmQKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F78A833AED;
 Wed, 23 Nov 2022 11:42:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 384C6C2C8C5;
 Wed, 23 Nov 2022 11:42:35 +0000 (UTC)
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
Subject: [PATCH v5 14/15] block: convert bdrv_create to
 generated_co_wrapper_simple
Date: Wed, 23 Nov 2022 06:42:26 -0500
Message-Id: <20221123114227.85757-15-eesposit@redhat.com>
In-Reply-To: <20221123114227.85757-1-eesposit@redhat.com>
References: <20221123114227.85757-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

This function is never called in coroutine context, therefore
instead of manually creating a new coroutine, delegate it to the
block-coroutine-wrapper script, defining it as g_c_w_simple.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                            | 40 ++----------------------------
 include/block/block-global-state.h | 10 ++++++--
 2 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/block.c b/block.c
index 8207f93353..5b4ba02d3a 100644
--- a/block.c
+++ b/block.c
@@ -528,8 +528,8 @@ typedef struct CreateCo {
     Error *err;
 } CreateCo;
 
-static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
-                                       QemuOpts *opts, Error **errp)
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                QemuOpts *opts, Error **errp)
 {
     int ret;
     GLOBAL_STATE_CODE();
@@ -553,42 +553,6 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
     return ret;
 }
 
-static void coroutine_fn bdrv_create_co_entry(void *opaque)
-{
-    CreateCo *cco = opaque;
-    GLOBAL_STATE_CODE();
-
-    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts, &cco->err);
-}
-
-int bdrv_create(BlockDriver *drv, const char* filename,
-                QemuOpts *opts, Error **errp)
-{
-    GLOBAL_STATE_CODE();
-
-    if (qemu_in_coroutine()) {
-        /* Fast-path if already in coroutine context */
-        return bdrv_co_create(drv, filename, opts, errp);
-    } else {
-        Coroutine *co;
-        CreateCo cco = {
-            .drv = drv,
-            .filename = filename,
-            .opts = opts,
-            .ret = NOT_DONE,
-            .err = NULL,
-        };
-
-        co = qemu_coroutine_create(bdrv_create_co_entry, &cco);
-        qemu_coroutine_enter(co);
-        while (cco.ret == NOT_DONE) {
-            aio_poll(qemu_get_aio_context(), true);
-        }
-        error_propagate(errp, cco.err);
-        return cco.ret;
-    }
-}
-
 /**
  * Helper function for bdrv_create_file_fallback(): Resize @blk to at
  * least the given @minimum_size.
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 387a7cbb2e..8f1c8ca910 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -55,8 +55,14 @@ BlockDriver *bdrv_find_protocol(const char *filename,
                                 bool allow_protocol_prefix,
                                 Error **errp);
 BlockDriver *bdrv_find_format(const char *format_name);
-int bdrv_create(BlockDriver *drv, const char* filename,
-                QemuOpts *opts, Error **errp);
+
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                QemuOpts *opts, Error **errp);
+int generated_co_wrapper_simple bdrv_create(BlockDriver *drv,
+                                            const char *filename,
+                                            QemuOpts *opts,
+                                            Error **errp);
+
 int coroutine_fn bdrv_co_create_file(const char *filename, QemuOpts *opts,
                                      Error **errp);
 
-- 
2.31.1


