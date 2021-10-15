Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7242F7EA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 18:16:54 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbPt7-0002Dn-Ja
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 12:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbPor-0006a3-Pu
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:12:29 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mbPop-00083g-UA
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:12:29 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-sAK_swEVMYi_oaStG3ErmQ-1; Fri, 15 Oct 2021 12:12:24 -0400
X-MC-Unique: sAK_swEVMYi_oaStG3ErmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 297C41007905;
 Fri, 15 Oct 2021 16:12:23 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B6E5F4E2;
 Fri, 15 Oct 2021 16:12:21 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] rcu: Introduce force_rcu notifier
Date: Fri, 15 Oct 2021 18:12:17 +0200
Message-Id: <20211015161218.1231920-2-groug@kaod.org>
In-Reply-To: <20211015161218.1231920-1-groug@kaod.org>
References: <20211015161218.1231920-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The drain_rcu_call() function can be blocked as long as an RCU reader
stays in a read-side critical section. This is typically what happens
when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
monitor as reported in https://gitlab.com/qemu-project/qemu/-/issues/650 .

This can be avoided by allowing drain_rcu_call() to enforce an RCU grace
period. Since each reader might need to do specific actions to end a
read-side critical section, do it with notifiers.

Prepare ground for this by adding a NotifierList and use it in
wait_for_readers() if drain_rcu_call() is in progress. Readers can
now optionally specify a Notifier to be called in this case at
thread registration time. The current rcu_register_thread() API is
preserved for readers that don't need this. The notifier is removed
automatically when the thread unregisters.

This is largely based on a draft from Paolo Bonzini.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qemu/rcu.h | 21 ++++++++++++++++++++-
 util/rcu.c         | 23 +++++++++++++++++++++--
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf11c..498e4e5e3479 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -27,6 +27,7 @@
 #include "qemu/thread.h"
 #include "qemu/queue.h"
 #include "qemu/atomic.h"
+#include "qemu/notify.h"
 #include "qemu/sys_membarrier.h"
=20
 #ifdef __cplusplus
@@ -66,6 +67,13 @@ struct rcu_reader_data {
=20
     /* Data used for registry, protected by rcu_registry_lock */
     QLIST_ENTRY(rcu_reader_data) node;
+
+    /*
+     * Notifier used to force an RCU grace period.  Accessed under
+     * rcu_registry_lock.  Note that the notifier is called _outside_
+     * the thread!
+     */
+    Notifier *force_rcu;
 };
=20
 extern __thread struct rcu_reader_data rcu_reader;
@@ -114,8 +122,19 @@ extern void synchronize_rcu(void);
=20
 /*
  * Reader thread registration.
+ *
+ * The caller can specify an optional notifier if it wants RCU
+ * to enforce grace periods. This is needed by drain_call_rcu().
+ * Note that the notifier is executed in the context of the RCU
+ * thread.
  */
-extern void rcu_register_thread(void);
+extern void rcu_register_thread_with_force_rcu(Notifier *n);
+
+static inline void rcu_register_thread(void)
+{
+    rcu_register_thread_with_force_rcu(NULL);
+}
+
 extern void rcu_unregister_thread(void);
=20
 /*
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb2a..da3506917fa8 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -46,9 +46,17 @@
 unsigned long rcu_gp_ctr =3D RCU_GP_LOCKED;
=20
 QemuEvent rcu_gp_event;
+static int in_drain_call_rcu;
 static QemuMutex rcu_registry_lock;
 static QemuMutex rcu_sync_lock;
=20
+/*
+ * NotifierList used to force an RCU grace period.  Accessed under
+ * rcu_registry_lock.
+ */
+static NotifierList force_rcu_notifiers =3D
+    NOTIFIER_LIST_INITIALIZER(force_rcu_notifiers);
+
 /*
  * Check whether a quiescent state was crossed between the beginning of
  * update_counter_and_wait and now.
@@ -107,6 +115,8 @@ static void wait_for_readers(void)
                  * get some extra futex wakeups.
                  */
                 qatomic_set(&index->waiting, false);
+            } else if (qatomic_read(&in_drain_call_rcu)) {
+                notifier_list_notify(&force_rcu_notifiers, NULL);
             }
         }
=20
@@ -293,7 +303,6 @@ void call_rcu1(struct rcu_head *node, void (*func)(stru=
ct rcu_head *node))
     qemu_event_set(&rcu_call_ready_event);
 }
=20
-
 struct rcu_drain {
     struct rcu_head rcu;
     QemuEvent drain_complete_event;
@@ -339,8 +348,10 @@ void drain_call_rcu(void)
      * assumed.
      */
=20
+    qatomic_inc(&in_drain_call_rcu);
     call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
     qemu_event_wait(&rcu_drain.drain_complete_event);
+    qatomic_dec(&in_drain_call_rcu);
=20
     if (locked) {
         qemu_mutex_lock_iothread();
@@ -348,10 +359,14 @@ void drain_call_rcu(void)
=20
 }
=20
-void rcu_register_thread(void)
+void rcu_register_thread_with_force_rcu(Notifier *n)
 {
     assert(rcu_reader.ctr =3D=3D 0);
     qemu_mutex_lock(&rcu_registry_lock);
+    if (n) {
+        rcu_reader.force_rcu =3D n;
+        notifier_list_add(&force_rcu_notifiers, rcu_reader.force_rcu);
+    }
     QLIST_INSERT_HEAD(&registry, &rcu_reader, node);
     qemu_mutex_unlock(&rcu_registry_lock);
 }
@@ -360,6 +375,10 @@ void rcu_unregister_thread(void)
 {
     qemu_mutex_lock(&rcu_registry_lock);
     QLIST_REMOVE(&rcu_reader, node);
+    if (rcu_reader.force_rcu) {
+        notifier_remove(rcu_reader.force_rcu);
+        rcu_reader.force_rcu =3D NULL;
+    }
     qemu_mutex_unlock(&rcu_registry_lock);
 }
=20
--=20
2.31.1


