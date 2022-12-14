Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AA64CB8C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:47:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5b-0005Bz-Fi; Wed, 14 Dec 2022 08:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S57-0004kG-Vp
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S55-0003hb-3C
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1fyZqE0NKofeu+LosXoRbZ+V8c57Pw+JWql3/Vvx58=;
 b=TieOm6JcsTy4TwY/E2UgwBC2OJLFDgooQ8CuduSIuvWrEg+BbyFS6Nf35jz1VFyPD23OBu
 1N/nvvQyRDd2Yqy9Q8jzl85hkNJM/HFybGq+zAr0fv4PIe3bbV8f/3soY1hbwtjS8a40BQ
 SWAag+3PKAEoIL6D9W6J/r7nptkRlnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-soQAWS7TPmG6K75jy1ValA-1; Wed, 14 Dec 2022 08:45:45 -0500
X-MC-Unique: soQAWS7TPmG6K75jy1ValA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D55885C06A;
 Wed, 14 Dec 2022 13:45:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0E214171C0;
 Wed, 14 Dec 2022 13:45:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 37/51] async: Register/unregister aiocontext in graph lock list
Date: Wed, 14 Dec 2022 14:44:39 +0100
Message-Id: <20221214134453.31665-38-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Add/remove the AioContext in aio_context_list in graph-lock.c when it is
created/destroyed. This allows using the graph locking operations from
this AioContext.

In order to allow linking util/async.c with binaries that don't include
the block layer, introduce stubs for (un)register_aiocontext().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-5-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 stubs/graph-lock.c | 10 ++++++++++
 util/async.c       |  4 ++++
 stubs/meson.build  |  1 +
 3 files changed, 15 insertions(+)
 create mode 100644 stubs/graph-lock.c

diff --git a/stubs/graph-lock.c b/stubs/graph-lock.c
new file mode 100644
index 0000000000..177aa0a8ba
--- /dev/null
+++ b/stubs/graph-lock.c
@@ -0,0 +1,10 @@
+#include "qemu/osdep.h"
+#include "block/graph-lock.h"
+
+void register_aiocontext(AioContext *ctx)
+{
+}
+
+void unregister_aiocontext(AioContext *ctx)
+{
+}
diff --git a/util/async.c b/util/async.c
index 63434ddae4..14d63b3091 100644
--- a/util/async.c
+++ b/util/async.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "block/aio.h"
 #include "block/thread-pool.h"
+#include "block/graph-lock.h"
 #include "qemu/main-loop.h"
 #include "qemu/atomic.h"
 #include "qemu/rcu_queue.h"
@@ -376,6 +377,7 @@ aio_ctx_finalize(GSource     *source)
     qemu_rec_mutex_destroy(&ctx->lock);
     qemu_lockcnt_destroy(&ctx->list_lock);
     timerlistgroup_deinit(&ctx->tlg);
+    unregister_aiocontext(ctx);
     aio_context_destroy(ctx);
 }
 
@@ -574,6 +576,8 @@ AioContext *aio_context_new(Error **errp)
     ctx->thread_pool_min = 0;
     ctx->thread_pool_max = THREAD_POOL_MAX_THREADS_DEFAULT;
 
+    register_aiocontext(ctx);
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
diff --git a/stubs/meson.build b/stubs/meson.build
index c96a74f095..981585cbdf 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -13,6 +13,7 @@ stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
+stub_ss.add(files('graph-lock.c'))
 if linux_io_uring.found()
   stub_ss.add(files('io_uring.c'))
 endif
-- 
2.38.1


