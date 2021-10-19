Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3585D432D91
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:58:23 +0200 (CEST)
Received: from localhost ([::1]:54270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mci8k-0001VL-BD
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci7C-0007OS-4J
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci78-0002yd-Qb
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-zLUNfAYuOqKlW5vRYcvR4Q-1; Tue, 19 Oct 2021 01:56:37 -0400
X-MC-Unique: zLUNfAYuOqKlW5vRYcvR4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E209126D;
 Tue, 19 Oct 2021 05:56:36 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4E119C59;
 Tue, 19 Oct 2021 05:56:35 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] rcu: Introduce force_rcu notifier
Date: Tue, 19 Oct 2021 07:56:31 +0200
Message-Id: <20211019055632.252879-2-groug@kaod.org>
In-Reply-To: <20211019055632.252879-1-groug@kaod.org>
References: <20211019055632.252879-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Prepare ground for this by adding a notifier list to the RCU reader
struct and use it in wait_for_readers() if drain_rcu_call() is in
progress. An API is added for readers to register their notifiers.

This is largely based on a draft from Paolo Bonzini.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qemu/rcu.h | 16 ++++++++++++++++
 util/rcu.c         | 22 +++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf11c..d8c4fd8686b4 100644
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
@@ -66,6 +67,14 @@ struct rcu_reader_data {
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
+    void *force_rcu_data;
 };
=20
 extern __thread struct rcu_reader_data rcu_reader;
@@ -180,6 +189,13 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_au=
to_unlock)
 #define RCU_READ_LOCK_GUARD() \
     g_autoptr(RCUReadAuto) _rcu_read_auto __attribute__((unused)) =3D rcu_=
read_auto_lock()
=20
+/*
+ * Force-RCU notifiers tell readers that they should exit their
+ * read-side critical section.
+ */
+void rcu_add_force_rcu_notifier(Notifier *n, void *data);
+void rcu_remove_force_rcu_notifier(Notifier *n);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb2a..0c68f068e23d 100644
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
+                notifier_list_notify(&index->force_rcu, index->force_rcu_d=
ata);
             }
         }
=20
@@ -293,7 +296,6 @@ void call_rcu1(struct rcu_head *node, void (*func)(stru=
ct rcu_head *node))
     qemu_event_set(&rcu_call_ready_event);
 }
=20
-
 struct rcu_drain {
     struct rcu_head rcu;
     QemuEvent drain_complete_event;
@@ -339,8 +341,10 @@ void drain_call_rcu(void)
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
@@ -363,6 +367,22 @@ void rcu_unregister_thread(void)
     qemu_mutex_unlock(&rcu_registry_lock);
 }
=20
+void rcu_add_force_rcu_notifier(Notifier *n, void *data)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_list_add(&rcu_reader.force_rcu, n);
+    rcu_reader.force_rcu_data =3D data;
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
+void rcu_remove_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    rcu_reader.force_rcu_data =3D NULL;
+    notifier_remove(n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
 static void rcu_init_complete(void)
 {
     QemuThread thread;
--=20
2.31.1


