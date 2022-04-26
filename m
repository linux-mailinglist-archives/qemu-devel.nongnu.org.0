Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560650F6F8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:01:36 +0200 (CEST)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njH4h-0000FG-L9
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGv5-0006xQ-Cf
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGv3-0000el-JW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDs6u8MKFRfFKRAxcoyD1ePLpJCy0KVNZ2hTII/yAlA=;
 b=FJA4tQyZhRyhEjcwNoZSpIkooOkLanbPc/CWWpA6C7dEL8Q4MnhxeobaXvQoymINNSH8l+
 vthyt6gW3DpfhEDe4HCD6onBnKbxkIQrLy/h2QLgS/KtovsB6SX3PP0dCKMa43HNF0Burj
 hlUeWLPmsLTjuLOjsCrmoSnMsxyR/SU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-6sanNp-cNa2HM243q1Un_A-1; Tue, 26 Apr 2022 04:51:32 -0400
X-MC-Unique: 6sanNp-cNa2HM243q1Un_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27416185A7A4;
 Tue, 26 Apr 2022 08:51:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71C24047D3B;
 Tue, 26 Apr 2022 08:51:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 4/8] async: register/unregister aiocontext in graph
 lock list
Date: Tue, 26 Apr 2022 04:51:10 -0400
Message-Id: <20220426085114.199647-5-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add/remove the AioContext in aio_context_list in graph-lock.c only when
it is being effectively created/destroyed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 util/async.c     | 4 ++++
 util/meson.build | 1 +
 2 files changed, 5 insertions(+)

diff --git a/util/async.c b/util/async.c
index 2ea1172f3e..3a73f83910 100644
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
@@ -368,6 +369,7 @@ aio_ctx_finalize(GSource     *source)
     qemu_rec_mutex_destroy(&ctx->lock);
     qemu_lockcnt_destroy(&ctx->list_lock);
     timerlistgroup_deinit(&ctx->tlg);
+    unregister_aiocontext(ctx);
     aio_context_destroy(ctx);
 }
 
@@ -563,6 +565,8 @@ AioContext *aio_context_new(Error **errp)
 
     ctx->aio_max_batch = 0;
 
+    register_aiocontext(ctx);
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
diff --git a/util/meson.build b/util/meson.build
index 3736988b9f..c85d8695de 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -64,6 +64,7 @@ endif
 
 if have_block
   util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
+  util_ss.add(files('../block/graph-lock.c'))
   util_ss.add(files('base64.c'))
   util_ss.add(files('buffer.c'))
   util_ss.add(files('bufferiszero.c'))
-- 
2.31.1


