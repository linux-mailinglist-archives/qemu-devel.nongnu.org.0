Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA56F6AB2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:01:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbY-0003Q9-29; Thu, 04 May 2023 07:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbD-00039R-VZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbC-0004D9-0V
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOHQtQr3/59fDREj7disi55ITHVjHcEhzH/D1IWPZUU=;
 b=c9HPUFwxkpnv5oLcGMtGnnkdAdXKO8Yr2uSe+AQwkP9uBkxVGSOuFTOlqsMpndw2jKZt5M
 C4oJk6re395G4/gS0Z7KggfmKE7H8ebmuvrDX1mPXP/UoEpEPMEU90SYK09JAYUVKP9x2V
 tTkuAxXao1YUxYFZKKSND/eKI/BJ2do=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-0R--2_3XNkO3QkxV8Av7Fw-1; Thu, 04 May 2023 07:58:10 -0400
X-MC-Unique: 0R--2_3XNkO3QkxV8Av7Fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5712811E7B;
 Thu,  4 May 2023 11:58:09 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD36EC15BAD;
 Thu,  4 May 2023 11:58:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader
 lock
Date: Thu,  4 May 2023 13:57:37 +0200
Message-Id: <20230504115750.54437-8-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


