Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A94D6FDDB4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:24:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiq1-00031p-5N; Wed, 10 May 2023 08:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipR-0002Gs-DG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipO-0007gr-Gj
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gLnN8XK3FCorQV8RrwvIzuunYAR2X0BmI4Yvvv8hScc=;
 b=ilnCzZAyAEHrrQ3mY5K3lxTArmKWc03Zbjfz2JyoRg0kXfDL6bwM/FnlPpSmT2ANdzQN+I
 tS8adGDJNAkTZX+S5+F+npC1aX6tOk6acVVsCROiI4A81JdtuyEJQpur+VUQeV4MNKOgFi
 /VzGhFlnoduRWVFk49JV4onCHnABaEw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-A6LEOrulP9-JZUc2qNF09g-1; Wed, 10 May 2023 08:21:50 -0400
X-MC-Unique: A6LEOrulP9-JZUc2qNF09g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 757643C0CF17;
 Wed, 10 May 2023 12:21:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB75347CD0;
 Wed, 10 May 2023 12:21:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 14/28] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader lock
Date: Wed, 10 May 2023 14:20:57 +0200
Message-Id: <20230510122111.46566-15-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
reader lock for the graph, so the correct annotation for them to use is
TSA_ASSERT_SHARED rather than TSA_ASSERT.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20230504115750.54437-8-kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index f17d1588e7..7574a2de5b 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -205,12 +205,12 @@ typedef struct GraphLockable { } GraphLockable;
 #define GML_OBJ_() (&(GraphLockable) { })
 
 /*
- * This is not marked as TSA_ACQUIRE() because TSA doesn't understand the
+ * This is not marked as TSA_ACQUIRE_SHARED() because TSA doesn't understand the
  * cleanup attribute and would therefore complain that the graph is never
- * unlocked. TSA_ASSERT() makes sure that the following calls know that we
- * hold the lock while unlocking is left unchecked.
+ * unlocked. TSA_ASSERT_SHARED() makes sure that the following calls know that
+ * we hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA coroutine_fn
+static inline GraphLockable * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA coroutine_fn
 graph_lockable_auto_lock(GraphLockable *x)
 {
     bdrv_graph_co_rdlock();
@@ -249,12 +249,12 @@ typedef struct GraphLockableMainloop { } GraphLockableMainloop;
 #define GMLML_OBJ_() (&(GraphLockableMainloop) { })
 
 /*
- * This is not marked as TSA_ACQUIRE() because TSA doesn't understand the
+ * This is not marked as TSA_ACQUIRE_SHARED() because TSA doesn't understand the
  * cleanup attribute and would therefore complain that the graph is never
- * unlocked. TSA_ASSERT() makes sure that the following calls know that we
- * hold the lock while unlocking is left unchecked.
+ * unlocked. TSA_ASSERT_SHARED() makes sure that the following calls know that
+ * we hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockableMainloop * TSA_ASSERT(graph_lock) TSA_NO_TSA
+static inline GraphLockableMainloop * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
 graph_lockable_auto_lock_mainloop(GraphLockableMainloop *x)
 {
     bdrv_graph_rdlock_main_loop();
-- 
2.40.1


