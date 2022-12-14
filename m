Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86264CC58
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S5g-0005SQ-I9; Wed, 14 Dec 2022 08:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S53-0004bp-3i
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4z-0003fI-En
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ltv+A9xGB9XuGuAcxP6x3Hx8R9QNrs1mQwrTcCZLOwc=;
 b=cVlhzUbzNNKsQ/rDvuqlEEjxYE4+t8DzYLY9LQV/6eF99WFDuzaHusnkq8jqahT1TqjRYS
 F1OvaOud++8xaNZZbth7X3K2GUbkF+T8Jz8bLZtxgiCd802A/OhCv6spx2Ikjcdc+ts6Ec
 n6tzohem9/8PpavTx/wGAtw6wKEB0PU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-mH_oD8dmMKKVdNA-iGhkyw-1; Wed, 14 Dec 2022 08:45:44 -0500
X-MC-Unique: mH_oD8dmMKKVdNA-iGhkyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51A371C09B73;
 Wed, 14 Dec 2022 13:45:44 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91CC9140E949;
 Wed, 14 Dec 2022 13:45:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 36/51] graph-lock: Implement guard macros
Date: Wed, 14 Dec 2022 14:44:38 +0100
Message-Id: <20221214134453.31665-37-kwolf@redhat.com>
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

Similar to the implementation in lockable.h, implement macros to
automatically take and release the rdlock.

Create the empty GraphLockable and GraphLockableMainloop structs only to
use it as a type for G_DEFINE_AUTOPTR_CLEANUP_FUNC.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-4-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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


