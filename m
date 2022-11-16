Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51F062BDAB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 13:24:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovHRS-0000fN-Jb; Wed, 16 Nov 2022 07:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRM-0000dQ-Tl
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovHRK-0000uE-2D
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 07:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668601368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qw9glPwvAFH4PaG9gpOC8GJVR/OQjC3FLOWikmUfLto=;
 b=F3FCL+jUwmim6EQ2u9GPJ02hQt8TNOOxcAywMliCeZEza61G1NnskKzCuFR5s2BYihm4+P
 xyAenHtVkzfitDtf+tUQ3v7oqkxhyj9Q4LXe/83vHd+P0descPJM3H3Cao+eKPB38S3AIw
 dtGB47Tux97RhMqSZkCZx2cKO4NzCUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-PDliOkPCPwe9BSLblYGHMA-1; Wed, 16 Nov 2022 07:22:47 -0500
X-MC-Unique: PDliOkPCPwe9BSLblYGHMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B778A3C10222;
 Wed, 16 Nov 2022 12:22:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC8D9E70;
 Wed, 16 Nov 2022 12:22:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 10/11] block: convert bdrv_create to
 generated_co_wrapper_simple
Date: Wed, 16 Nov 2022 07:22:40 -0500
Message-Id: <20221116122241.2856527-11-eesposit@redhat.com>
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
---
 block.c                            | 38 +-----------------------------
 include/block/block-global-state.h | 10 ++++++--
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/block.c b/block.c
index 7a4c3eb540..d3e168408a 100644
--- a/block.c
+++ b/block.c
@@ -528,7 +528,7 @@ typedef struct CreateCo {
     Error *err;
 } CreateCo;
 
-static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
                                        QemuOpts *opts, Error **errp)
 {
     int ret;
@@ -555,42 +555,6 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
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
index 6f35ed99e3..305336bdb9 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -55,8 +55,14 @@ BlockDriver *bdrv_find_protocol(const char *filename,
                                 bool allow_protocol_prefix,
                                 Error **errp);
 BlockDriver *bdrv_find_format(const char *format_name);
-int bdrv_create(BlockDriver *drv, const char* filename,
-                QemuOpts *opts, Error **errp);
+
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char* filename,
+                                QemuOpts *opts, Error **errp);
+int generated_co_wrapper_simple bdrv_create(BlockDriver *drv,
+                                            const char* filename,
+                                            QemuOpts *opts,
+                                            Error **errp);
+
 int coroutine_fn bdrv_create_file(const char *filename, QemuOpts *opts,
                                   Error **errp);
 
-- 
2.31.1


