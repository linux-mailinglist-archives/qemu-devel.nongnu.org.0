Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA063AB25
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozf42-0005KS-EI; Mon, 28 Nov 2022 09:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf37-0004k9-Ou
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozf2z-0006ud-8j
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669645428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dl3dyOcHIip/hgio5PMyAz2aSn7M9Db/Rqb8n3cIZ6I=;
 b=fooS+TxxOieAu5de75CGigNcjn6oPpGW2bksbckst+uu+lozT7IGK/65nPce/h7MzFcYN+
 JWJRsxSocODBAsqNtScv2REiXCS8b9YYVle+ZdzFLOyJ7en4pmgSZAxXs6d0BOPJHLt+OV
 M1UK97l9Vp90g/2L60yG5EEhSgQqXMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-BOj2nzlaM_KBnOKBl_wHlQ-1; Mon, 28 Nov 2022 09:23:46 -0500
X-MC-Unique: BOj2nzlaM_KBnOKBl_wHlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AB3A8027F5;
 Mon, 28 Nov 2022 14:23:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0BF0140006D;
 Mon, 28 Nov 2022 14:23:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v7 13/14] block: convert bdrv_create to co_wrapper
Date: Mon, 28 Nov 2022 09:23:36 -0500
Message-Id: <20221128142337.657646-14-eesposit@redhat.com>
In-Reply-To: <20221128142337.657646-1-eesposit@redhat.com>
References: <20221128142337.657646-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
block-coroutine-wrapper script, defining it as co_wrapper.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/block/block-global-state.h |  8 ++++--
 block.c                            | 41 ++----------------------------
 2 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 387a7cbb2e..1f8b54f2df 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -55,8 +55,12 @@ BlockDriver *bdrv_find_protocol(const char *filename,
                                 bool allow_protocol_prefix,
                                 Error **errp);
 BlockDriver *bdrv_find_format(const char *format_name);
-int bdrv_create(BlockDriver *drv, const char* filename,
-                QemuOpts *opts, Error **errp);
+
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                QemuOpts *opts, Error **errp);
+int co_wrapper bdrv_create(BlockDriver *drv, const char *filename,
+                           QemuOpts *opts, Error **errp);
+
 int coroutine_fn bdrv_co_create_file(const char *filename, QemuOpts *opts,
                                      Error **errp);
 
diff --git a/block.c b/block.c
index 20a5d7e8cf..8683d24553 100644
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
@@ -549,43 +549,6 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
     return ret;
 }
 
-static void coroutine_fn bdrv_create_co_entry(void *opaque)
-{
-    CreateCo *cco = opaque;
-    GLOBAL_STATE_CODE();
-
-    cco->ret = bdrv_co_create(cco->drv, cco->filename, cco->opts, &cco->err);
-    aio_wait_kick();
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
-- 
2.31.1


