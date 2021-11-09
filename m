Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C083A44B2C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:37:12 +0100 (CET)
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVzb-0005QU-Sh
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVy3-0003MP-7U
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:35 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:26330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVy1-0001Mj-LN
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:34 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-ppN7qXwtOb-17GroQNXPtw-1; Tue, 09 Nov 2021 13:35:30 -0500
X-MC-Unique: ppN7qXwtOb-17GroQNXPtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEA20802C8F;
 Tue,  9 Nov 2021 18:35:28 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409EA60D30;
 Tue,  9 Nov 2021 18:35:27 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] rcu: Introduce force_rcu notifier
Date: Tue,  9 Nov 2021 19:35:22 +0100
Message-Id: <20211109183523.47726-2-groug@kaod.org>
In-Reply-To: <20211109183523.47726-1-groug@kaod.org>
References: <20211109183523.47726-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Prepare ground for this by adding a notifier list to the RCU reader
struct and use it in wait_for_readers() if drain_rcu_call() is in
progress. An API is added for readers to register their notifiers.

This is largely based on a draft from Paolo Bonzini.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qemu/rcu.h | 15 +++++++++++++++
 util/rcu.c         | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf11c..e69efbd47f70 100644
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
+     * NotifierList used to force an RCU grace period.  Accessed under
+     * rcu_registry_lock.  Note that the notifier is called _outside_
+     * the thread!
+     */
+    NotifierList force_rcu;
 };
=20
 extern __thread struct rcu_reader_data rcu_reader;
@@ -180,6 +188,13 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_au=
to_unlock)
 #define RCU_READ_LOCK_GUARD() \
     g_autoptr(RCUReadAuto) _rcu_read_auto __attribute__((unused)) =3D rcu_=
read_auto_lock()
=20
+/*
+ * Force-RCU notifiers tell readers that they should exit their
+ * read-side critical section.
+ */
+void rcu_add_force_rcu_notifier(Notifier *n);
+void rcu_remove_force_rcu_notifier(Notifier *n);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb2a..c91da9f137c8 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -46,6 +46,7 @@
 unsigned long rcu_gp_ctr =3D RCU_GP_LOCKED;
=20
 QemuEvent rcu_gp_event;
+static int in_drain_call_rcu;
 static QemuMutex rcu_registry_lock;
 static QemuMutex rcu_sync_lock;
=20
@@ -107,6 +108,8 @@ static void wait_for_readers(void)
                  * get some extra futex wakeups.
                  */
                 qatomic_set(&index->waiting, false);
+            } else if (qatomic_read(&in_drain_call_rcu)) {
+                notifier_list_notify(&index->force_rcu, NULL);
             }
         }
=20
@@ -339,8 +342,10 @@ void drain_call_rcu(void)
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
@@ -363,6 +368,20 @@ void rcu_unregister_thread(void)
     qemu_mutex_unlock(&rcu_registry_lock);
 }
=20
+void rcu_add_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_list_add(&rcu_reader.force_rcu, n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
+void rcu_remove_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_remove(n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
 static void rcu_init_complete(void)
 {
     QemuThread thread;
--=20
2.31.1


