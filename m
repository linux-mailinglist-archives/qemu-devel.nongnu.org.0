Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78D44B2C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:41:06 +0100 (CET)
Received: from localhost ([::1]:44438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkW3M-0008JC-0s
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:41:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVy5-0003Rm-4d
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:37 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mkVy3-0001NG-D9
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:35:36 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-aTq5WQk6NJehmB_xPE5QGA-1; Tue, 09 Nov 2021 13:35:31 -0500
X-MC-Unique: aTq5WQk6NJehmB_xPE5QGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 996FF87D541;
 Tue,  9 Nov 2021 18:35:30 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A75660D30;
 Tue,  9 Nov 2021 18:35:28 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] accel/tcg: Register a force_rcu notifier
Date: Tue,  9 Nov 2021 19:35:23 +0100
Message-Id: <20211109183523.47726-3-groug@kaod.org>
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

A TCG vCPU doing a busy loop systematicaly hangs the QEMU monitor
if the user passes 'device_add' without argument. This is because
drain_cpu_all() which is called from qmp_device_add() cannot return
if readers don't exit read-side critical sections. That is typically
what busy-looping TCG vCPUs do:

int cpu_exec(CPUState *cpu)
{
[...]
    rcu_read_lock();
[...]
    while (!cpu_handle_exception(cpu, &ret)) {
        // Busy loop keeps vCPU here
    }
[...]
    rcu_read_unlock();

    return ret;
}

For MTTCG, have all vCPU threads register a force_rcu notifier that will
kick them out of the loop using async_run_on_cpu(). The notifier is called
with the rcu_registry_lock mutex held, using async_run_on_cpu() ensures
there are no deadlocks.

For RR, a single thread runs all vCPUs. Just register a single notifier
that kicks the current vCPU to the next one.

For MTTCG:
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

For RR:
Suggested-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add"=
)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/650
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 26 ++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops-rr.c    | 10 ++++++++++
 2 files changed, 36 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttc=
g.c
index 847d2079d21f..29632bd4c0af 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
 #include "hw/boards.h"
@@ -35,6 +36,26 @@
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
=20
+typedef struct MttcgForceRcuNotifier {
+    Notifier notifier;
+    CPUState *cpu;
+} MttcgForceRcuNotifier;
+
+static void do_nothing(CPUState *cpu, run_on_cpu_data d)
+{
+}
+
+static void mttcg_force_rcu(Notifier *notify, void *data)
+{
+    CPUState *cpu =3D container_of(notify, MttcgForceRcuNotifier, notifier=
)->cpu;
+
+    /*
+     * Called with rcu_registry_lock held, using async_run_on_cpu() ensure=
s
+     * that there are no deadlocks.
+     */
+    async_run_on_cpu(cpu, do_nothing, RUN_ON_CPU_NULL);
+}
+
 /*
  * In the multi-threaded case each vCPU has its own thread. The TLS
  * variable current_cpu can be used deep in the code to find the
@@ -43,12 +64,16 @@
=20
 static void *mttcg_cpu_thread_fn(void *arg)
 {
+    MttcgForceRcuNotifier force_rcu;
     CPUState *cpu =3D arg;
=20
     assert(tcg_enabled());
     g_assert(!icount_enabled());
=20
     rcu_register_thread();
+    force_rcu.notifier.notify =3D mttcg_force_rcu;
+    force_rcu.cpu =3D cpu;
+    rcu_add_force_rcu_notifier(&force_rcu.notifier);
     tcg_register_thread();
=20
     qemu_mutex_lock_iothread();
@@ -100,6 +125,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
=20
     tcg_cpus_destroy(cpu);
     qemu_mutex_unlock_iothread();
+    rcu_remove_force_rcu_notifier(&force_rcu.notifier);
     rcu_unregister_thread();
     return NULL;
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index a5fd26190e20..bf59f53dbc2c 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -28,6 +28,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
+#include "qemu/notify.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
=20
@@ -133,6 +134,11 @@ static void rr_deal_with_unplugged_cpus(void)
     }
 }
=20
+static void rr_force_rcu(Notifier *notify, void *data)
+{
+    rr_kick_next_cpu();
+}
+
 /*
  * In the single-threaded case each vCPU is simulated in turn. If
  * there is more than a single vCPU we create a simple timer to kick
@@ -143,10 +149,13 @@ static void rr_deal_with_unplugged_cpus(void)
=20
 static void *rr_cpu_thread_fn(void *arg)
 {
+    Notifier force_rcu;
     CPUState *cpu =3D arg;
=20
     assert(tcg_enabled());
     rcu_register_thread();
+    force_rcu.notify =3D rr_force_rcu;
+    rcu_add_force_rcu_notifier(&force_rcu);
     tcg_register_thread();
=20
     qemu_mutex_lock_iothread();
@@ -255,6 +264,7 @@ static void *rr_cpu_thread_fn(void *arg)
         rr_deal_with_unplugged_cpus();
     }
=20
+    rcu_remove_force_rcu_notifier(&force_rcu);
     rcu_unregister_thread();
     return NULL;
 }
--=20
2.31.1


