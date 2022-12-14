Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A364CBBB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:00:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5j-0005Zr-KS; Wed, 14 Dec 2022 08:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4z-0004Zi-QP
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4u-0003eJ-BW
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpgmtHasgFkPDcRnEJ1VZ0u1kPksulE1hOJjZi6umtc=;
 b=KBl4vT1pXC3iNhz0l9Pu0VpTakEAnV4TCTIuA8x+A82/WsfPhAgADMHtMJ6ZDgv2+dWd5Z
 Te9Q+ZbeWDemtqDRFZXB+bCxgxT3upSCuL69QWevbuv1kN2dKoypmGHesxqM3beHFNTwi4
 u5z11n9Oma4+nCU6zhvqNasZFGJfyAI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Y4N1UB7cPqmRaOy9vBQJQQ-1; Wed, 14 Dec 2022 08:45:40 -0500
X-MC-Unique: Y4N1UB7cPqmRaOy9vBQJQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5890938173C7;
 Wed, 14 Dec 2022 13:45:40 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A6D14171C1;
 Wed, 14 Dec 2022 13:45:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 32/51] block: convert bdrv_create to co_wrapper
Date: Wed, 14 Dec 2022 14:44:34 +0100
Message-Id: <20221214134453.31665-33-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This function is never called in coroutine context, therefore
instead of manually creating a new coroutine, delegate it to the
block-coroutine-wrapper script, defining it as co_wrapper.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20221128142337.657646-14-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
index c8ac91eb63..6191ac1f44 100644
--- a/block.c
+++ b/block.c
@@ -526,8 +526,8 @@ typedef struct CreateCo {
     Error *err;
 } CreateCo;
 
-static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
-                                       QemuOpts *opts, Error **errp)
+int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
+                                QemuOpts *opts, Error **errp)
 {
     int ret;
     GLOBAL_STATE_CODE();
@@ -547,43 +547,6 @@ static int coroutine_fn bdrv_co_create(BlockDriver *drv, const char *filename,
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
2.38.1


