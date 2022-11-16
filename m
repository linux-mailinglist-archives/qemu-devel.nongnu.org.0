Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861962C017
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImx-0000lP-Lx; Wed, 16 Nov 2022 08:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImv-0000k2-6J
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-00080G-6g
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoqI+zJNibzmtJd5D/R+ymj0Tnap71pP+qX6lyvpoVk=;
 b=UUoKkGP0BZqH3tFOsw31yriiWXF9eNJ3+Ddx6LTHCBboyQRggeRnZMM92m/PA7BofnFJ/r
 cJZaDI8Wh9ep4vWVhsgQ3YlvHOxg+sbvS8oNdYi+J17oSKud4JKcDIJMA52dNgJ0pYwHIE
 VL8D/rosG2Z1CziYOeXAUglqAP3oRnY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-XdazSs1qPay5Zj0ECQCwEg-1; Wed, 16 Nov 2022 08:48:53 -0500
X-MC-Unique: XdazSs1qPay5Zj0ECQCwEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3541C1C09B6B;
 Wed, 16 Nov 2022 13:48:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCFA24A9254;
 Wed, 16 Nov 2022 13:48:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 03/20] async: register/unregister aiocontext in graph lock list
Date: Wed, 16 Nov 2022 08:48:33 -0500
Message-Id: <20221116134850.3051419-4-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Add/remove the AioContext in aio_context_list in graph-lock.c only when
it is being effectively created/destroyed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 util/async.c     | 4 ++++
 util/meson.build | 1 +
 2 files changed, 5 insertions(+)

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
diff --git a/util/meson.build b/util/meson.build
index 59c1f467bb..ecee2ba899 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -70,6 +70,7 @@ endif
 
 if have_block
   util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
+  util_ss.add(files('../block/graph-lock.c'))
   util_ss.add(files('base64.c'))
   util_ss.add(files('buffer.c'))
   util_ss.add(files('bufferiszero.c'))
-- 
2.31.1


