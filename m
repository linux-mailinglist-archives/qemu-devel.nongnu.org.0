Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB27288308
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 08:54:38 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQmIX-0005lC-QQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 02:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQlzN-00029q-3q
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 02:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kQlzJ-0008Vd-Ld
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 02:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602225285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwBaSYBB/sxiJzmlg84ife1ZA83qDiOPiyoHyauG2Lw=;
 b=iIARToMLqqMh5c+qvWAKiolWpJ2TQWW+CqWi6lRBuOxMMPMv3uxmL7ziel6PzgdvgYEw7b
 GX40JwJZ1KlDN1yBAn4WubanwTXn18r5jS1on5SatG2vsr9Tq0UxWmo6UY9J+srMg4h5Ni
 Jh8+sugPWvr0LTI+4hSfDC7LTG1zRTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-2qxebLqAMyue0duwd84OKA-1; Fri, 09 Oct 2020 02:34:43 -0400
X-MC-Unique: 2qxebLqAMyue0duwd84OKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6178885B686
 for <qemu-devel@nongnu.org>; Fri,  9 Oct 2020 06:34:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71C835D9F3;
 Fri,  9 Oct 2020 06:34:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 272F41129C66; Fri,  9 Oct 2020 08:34:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] util/async: Add aio_co_reschedule_self()
Date: Fri,  9 Oct 2020 08:34:29 +0200
Message-Id: <20201009063432.303441-12-armbru@redhat.com>
In-Reply-To: <20201009063432.303441-1-armbru@redhat.com>
References: <20201009063432.303441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

Add a function that can be used to move the currently running coroutine
to a different AioContext (and therefore potentially a different
thread).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201005155855.256490-12-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/block/aio.h | 10 ++++++++++
 util/async.c        | 30 ++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/block/aio.h b/include/block/aio.h
index ec8c5af642..5f342267d5 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -17,6 +17,7 @@
 #ifdef CONFIG_LINUX_IO_URING
 #include <liburing.h>
 #endif
+#include "qemu/coroutine.h"
 #include "qemu/queue.h"
 #include "qemu/event_notifier.h"
 #include "qemu/thread.h"
@@ -654,6 +655,15 @@ static inline bool aio_node_check(AioContext *ctx, bool is_external)
  */
 void aio_co_schedule(AioContext *ctx, struct Coroutine *co);
 
+/**
+ * aio_co_reschedule_self:
+ * @new_ctx: the new context
+ *
+ * Move the currently running coroutine to new_ctx. If the coroutine is already
+ * running in new_ctx, do nothing.
+ */
+void coroutine_fn aio_co_reschedule_self(AioContext *new_ctx);
+
 /**
  * aio_co_wake:
  * @co: the coroutine
diff --git a/util/async.c b/util/async.c
index f758354c6a..674dbefb7c 100644
--- a/util/async.c
+++ b/util/async.c
@@ -569,6 +569,36 @@ void aio_co_schedule(AioContext *ctx, Coroutine *co)
     aio_context_unref(ctx);
 }
 
+typedef struct AioCoRescheduleSelf {
+    Coroutine *co;
+    AioContext *new_ctx;
+} AioCoRescheduleSelf;
+
+static void aio_co_reschedule_self_bh(void *opaque)
+{
+    AioCoRescheduleSelf *data = opaque;
+    aio_co_schedule(data->new_ctx, data->co);
+}
+
+void coroutine_fn aio_co_reschedule_self(AioContext *new_ctx)
+{
+    AioContext *old_ctx = qemu_get_current_aio_context();
+
+    if (old_ctx != new_ctx) {
+        AioCoRescheduleSelf data = {
+            .co = qemu_coroutine_self(),
+            .new_ctx = new_ctx,
+        };
+        /*
+         * We can't directly schedule the coroutine in the target context
+         * because this would be racy: The other thread could try to enter the
+         * coroutine before it has yielded in this one.
+         */
+        aio_bh_schedule_oneshot(old_ctx, aio_co_reschedule_self_bh, &data);
+        qemu_coroutine_yield();
+    }
+}
+
 void aio_co_wake(struct Coroutine *co)
 {
     AioContext *ctx;
-- 
2.26.2


