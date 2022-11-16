Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1762C03B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIn2-0000pR-EY; Wed, 16 Nov 2022 08:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImq-0000gN-Vh
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-0007zr-Fj
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Bup4dqvRe9vQAe8Y48N16XATGlyaXL89PUiWG6CZqU=;
 b=ZnrB5tHvh0o2NVSyjtlguCIXoPVADt/j39Fh7hWSk/XOcHxKLufE/358n21pyFmFjf6bmg
 IeUg+1/zBxr0UDzw70c41NNZAo3larfNMRlk7CLuV73ejOV8X6hkLTm/nna82DirGrL7is
 NLqhBz8438FjhZgLwWkFzEOX9+sUsCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-8H906ThtNxmLpbHYBdEVGg-1; Wed, 16 Nov 2022 08:48:55 -0500
X-MC-Unique: 8H906ThtNxmLpbHYBdEVGg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A9F855438;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC754A9266;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 07/20] graph-lock: implement WITH_GRAPH_RDLOCK_GUARD and
 GRAPH_RDLOCK_GUARD macros
Date: Wed, 16 Nov 2022 08:48:37 -0500
Message-Id: <20221116134850.3051419-8-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

Similar to the implementation in lockable.h, implement macros to
automatically take and release the rdlock.
Create the empty GraphLockable struct only to use it as a type for
G_DEFINE_AUTOPTR_CLEANUP_FUNC.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/graph-lock.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 9430707dca..0d886a9ca3 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -141,5 +141,40 @@ void assert_bdrv_graph_readable(void);
  */
 void assert_bdrv_graph_writable(void);
 
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
 #endif /* GRAPH_LOCK_H */
 
-- 
2.31.1


