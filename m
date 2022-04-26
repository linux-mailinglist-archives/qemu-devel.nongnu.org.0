Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146150F5E0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:55:05 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGyO-0001Nm-K9
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGv3-0006w7-KP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGv2-0000eW-5K
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+wccC5A53d2EmDYvrg5hZcFAZySjf7nYFphAqdnRD0=;
 b=VfZjZGGu9mKmyHUTzwsnsl5DwQsbi63wiTFS+WcugneQYv3+E97gUlxlinA9ALqySc0qXo
 1UiM7G8yskNTRy5Pi69ArI0vEn3clRXY4GMJPshLaypxE21Bfg4zc5kfbB8DwnhLGHEalO
 dJyaFy8fsVqa7CyIs9WFwSIRtOzkf6c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-QZznUMJJMrWPuiuwEh8Yew-1; Tue, 26 Apr 2022 04:51:32 -0400
X-MC-Unique: QZznUMJJMrWPuiuwEh8Yew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30FB73C10ACB;
 Tue, 26 Apr 2022 08:51:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0750340E80E2;
 Tue, 26 Apr 2022 08:51:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 7/8] graph-lock: implement WITH_GRAPH_RDLOCK_GUARD and
 GRAPH_RDLOCK_GUARD macros
Date: Tue, 26 Apr 2022 04:51:13 -0400
Message-Id: <20220426085114.199647-8-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Similar to the implementation in lockable.h, implement macros to
automatically take and release the rdlock.
Create the empty GraphLockable struct only to use it as a type for
G_DEFINE_AUTOPTR_CLEANUP_FUNC.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/graph-lock.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 2211d41286..8d8a6513f1 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -67,5 +67,35 @@ void assert_bdrv_graph_readable(void);
  */
 void assert_bdrv_graph_writable(void);
 
+typedef struct GraphLockable { } GraphLockable;
+
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
+    g_autoptr(GraphLockable)                                         \
+    glue(graph_lockable_auto, __COUNTER__) G_GNUC_UNUSED =          \
+            graph_lockable_auto_lock(GML_OBJ_())
+
 #endif /* BLOCK_LOCK_H */
 
-- 
2.31.1


