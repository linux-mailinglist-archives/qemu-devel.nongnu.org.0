Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48436EE6E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:35:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMX3-0007jJ-N9; Tue, 25 Apr 2023 13:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWb-0006j0-Nl
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWY-0004FX-HW
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WuyYuOH2MjPFVkmvAB0z3dyeNbDva93BWJ6JKtiBcs=;
 b=Ik16IBPAhK9bM8rHB8GTGWUFZRMXZ6fbSat4foyVhatuXMKx+liWLblNIXFflHo1vOtzga
 /7dXH8MtZpTg9eF3rm2qWvretM34CAjmZbEsxnOeiL+El6QtUkVTAVfNP0lYtc9A9f9wba
 KVSGFWGLvp44aVQtwdrG8688pKrUkwg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-G_utfQVSNC6d4kD4bK6t8Q-1; Tue, 25 Apr 2023 13:32:13 -0400
X-MC-Unique: G_utfQVSNC6d4kD4bK6t8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED81C3815EE4;
 Tue, 25 Apr 2023 17:32:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C3C492B03;
 Tue, 25 Apr 2023 17:32:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 07/20] graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader lock
Date: Tue, 25 Apr 2023 19:31:45 +0200
Message-Id: <20230425173158.574203-8-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GRAPH_RDLOCK_GUARD() and GRAPH_RDLOCK_GUARD_MAINLOOP() only take a
reader lock for the graph, so the correct annotation for them to use is
TSA_ASSERT_SHARED rather than TSA_ASSERT.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 7ef391fab3..adaa3ed089 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -210,7 +210,7 @@ typedef struct GraphLockable { } GraphLockable;
  * unlocked. TSA_ASSERT() makes sure that the following calls know that we
  * hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
+static inline GraphLockable * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
 graph_lockable_auto_lock(GraphLockable *x)
 {
     bdrv_graph_co_rdlock();
@@ -254,7 +254,7 @@ typedef struct GraphLockableMainloop { } GraphLockableMainloop;
  * unlocked. TSA_ASSERT() makes sure that the following calls know that we
  * hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockableMainloop * TSA_ASSERT(graph_lock) TSA_NO_TSA
+static inline GraphLockableMainloop * TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
 graph_lockable_auto_lock_mainloop(GraphLockableMainloop *x)
 {
     bdrv_graph_rdlock_main_loop();
-- 
2.40.0


