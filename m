Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6CC645ADD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:26:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKi-0007Yc-6j; Wed, 07 Dec 2022 08:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKf-0007Xf-VN
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKe-0006Pr-DO
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7SwgC3/fh4y0Or5RD32b8UfJ5ohlP1h9rur4sAwWoE=;
 b=DtqiBL7P8ugXoTSFI6seVxmXp5zjG7rCKqh9llGJ9RoaITP7dMHVE12jYXKAzvm7DkEzgF
 Cc/jxDFHOAY6R6Qpd0OoZYQ5ViKSaJaH/JsZQ1bH4iF3+2E83zEZzSaqfn1oBeY0cbHsKy
 tAPurtx/Be+smO7Y8u6kIQWcB/BEYjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-fW0QK2BtNLaocvJwxkGkqw-1; Wed, 07 Dec 2022 08:19:26 -0500
X-MC-Unique: fW0QK2BtNLaocvJwxkGkqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E2D5833AED;
 Wed,  7 Dec 2022 13:19:26 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C5221121314;
 Wed,  7 Dec 2022 13:19:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 03/18] graph-lock: Implement guard macros
Date: Wed,  7 Dec 2022 14:18:23 +0100
Message-Id: <20221207131838.239125-4-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Similar to the implementation in lockable.h, implement macros to
automatically take and release the rdlock.

Create the empty GraphLockable and GraphLockableMainloop structs only to
use it as a type for G_DEFINE_AUTOPTR_CLEANUP_FUNC.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 82edb62cfa..b27d8a5fb1 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -135,5 +135,71 @@ void coroutine_fn bdrv_graph_co_rdunlock(void);
 void bdrv_graph_rdlock_main_loop(void);
 void bdrv_graph_rdunlock_main_loop(void);
 
+typedef struct GraphLockable { } GraphLockable;
+
+/*
+ * In C, compound literals have the lifetime of an automatic variable.
+ * In C++ it would be different, but then C++ wouldn't need QemuLockable
+ * either...
+ */
+#define GML_OBJ_() (&(GraphLockable) { })
+
+static inline GraphLockable *graph_lockable_auto_lock(GraphLockable *x)
+{
+    bdrv_graph_co_rdlock();
+    return x;
+}
+
+static inline void graph_lockable_auto_unlock(GraphLockable *x)
+{
+    bdrv_graph_co_rdunlock();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(GraphLockable, graph_lockable_auto_unlock)
+
+#define WITH_GRAPH_RDLOCK_GUARD_(var)                                         \
+    for (g_autoptr(GraphLockable) var = graph_lockable_auto_lock(GML_OBJ_()); \
+         var;                                                                 \
+         graph_lockable_auto_unlock(var), var = NULL)
+
+#define WITH_GRAPH_RDLOCK_GUARD() \
+    WITH_GRAPH_RDLOCK_GUARD_(glue(graph_lockable_auto, __COUNTER__))
+
+#define GRAPH_RDLOCK_GUARD(x)                                       \
+    g_autoptr(GraphLockable)                                        \
+    glue(graph_lockable_auto, __COUNTER__) G_GNUC_UNUSED =          \
+            graph_lockable_auto_lock(GML_OBJ_())
+
+
+typedef struct GraphLockableMainloop { } GraphLockableMainloop;
+
+/*
+ * In C, compound literals have the lifetime of an automatic variable.
+ * In C++ it would be different, but then C++ wouldn't need QemuLockable
+ * either...
+ */
+#define GMLML_OBJ_() (&(GraphLockableMainloop) { })
+
+static inline GraphLockableMainloop *
+graph_lockable_auto_lock_mainloop(GraphLockableMainloop *x)
+{
+    bdrv_graph_rdlock_main_loop();
+    return x;
+}
+
+static inline void
+graph_lockable_auto_unlock_mainloop(GraphLockableMainloop *x)
+{
+    bdrv_graph_rdunlock_main_loop();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(GraphLockableMainloop,
+                              graph_lockable_auto_unlock_mainloop)
+
+#define GRAPH_RDLOCK_GUARD_MAINLOOP(x)                              \
+    g_autoptr(GraphLockableMainloop)                                \
+    glue(graph_lockable_auto, __COUNTER__) G_GNUC_UNUSED =          \
+            graph_lockable_auto_lock_mainloop(GMLML_OBJ_())
+
 #endif /* GRAPH_LOCK_H */
 
-- 
2.38.1


