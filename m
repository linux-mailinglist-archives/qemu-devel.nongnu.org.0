Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD854432D8F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 07:58:12 +0200 (CEST)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mci8Z-000107-W6
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 01:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci7D-0007PK-6u
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:48 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mci7B-000326-Ey
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 01:56:46 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-RNYQXNBLP2Cp1CewDDXbdw-1; Tue, 19 Oct 2021 01:56:39 -0400
X-MC-Unique: RNYQXNBLP2Cp1CewDDXbdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8CD108088C;
 Tue, 19 Oct 2021 05:56:38 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A07E19C79;
 Tue, 19 Oct 2021 05:56:36 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] accel/tcg: Register a force_rcu notifier
Date: Tue, 19 Oct 2021 07:56:32 +0200
Message-Id: <20211019055632.252879-3-groug@kaod.org>
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

A TCG vCPU doing a busy loop systematicaly hangs the QEMU monitor
if the user passes 'device_add' without argument. This is because
drain_cpu_all() which is called from qmp_device_add() cannot return
if readers don't exit read-side critical sections. That is typically
what busy-looping TCG vCPUs do, both in MTTCG and RR modes:

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

Have all vCPUs register a force_rcu notifier that will kick them out
of the loop using async_run_on_cpu(). The notifier is called with the
rcu_registry_lock mutex held, using async_run_on_cpu() ensures there
are no deadlocks.

The notifier implementation is shared by MTTCG and RR since both are
affected.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: 7bed89958bfb ("device_core: use drain_call_rcu in in qmp_device_add"=
)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/650
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c |  3 +++
 accel/tcg/tcg-accel-ops-rr.c    |  3 +++
 accel/tcg/tcg-accel-ops.c       | 15 +++++++++++++++
 accel/tcg/tcg-accel-ops.h       |  2 ++
 4 files changed, 23 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttc=
g.c
index 847d2079d21f..ea4a3217ce3f 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -44,11 +44,13 @@
 static void *mttcg_cpu_thread_fn(void *arg)
 {
     CPUState *cpu =3D arg;
+    Notifier force_rcu =3D { .notify =3D tcg_cpus_force_rcu };
=20
     assert(tcg_enabled());
     g_assert(!icount_enabled());
=20
     rcu_register_thread();
+    rcu_add_force_rcu_notifier(&force_rcu, cpu);
     tcg_register_thread();
=20
     qemu_mutex_lock_iothread();
@@ -100,6 +102,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
=20
     tcg_cpus_destroy(cpu);
     qemu_mutex_unlock_iothread();
+    rcu_remove_force_rcu_notifier(&force_rcu);
     rcu_unregister_thread();
     return NULL;
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index a5fd26190e20..fc0c4905caf5 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -144,9 +144,11 @@ static void rr_deal_with_unplugged_cpus(void)
 static void *rr_cpu_thread_fn(void *arg)
 {
     CPUState *cpu =3D arg;
+    Notifier force_rcu =3D { .notify =3D tcg_cpus_force_rcu };
=20
     assert(tcg_enabled());
     rcu_register_thread();
+    rcu_add_force_rcu_notifier(&force_rcu, cpu);
     tcg_register_thread();
=20
     qemu_mutex_lock_iothread();
@@ -255,6 +257,7 @@ static void *rr_cpu_thread_fn(void *arg)
         rr_deal_with_unplugged_cpus();
     }
=20
+    rcu_remove_force_rcu_notifier(&force_rcu);
     rcu_unregister_thread();
     return NULL;
 }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd60..7f0d2b06044a 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -91,6 +91,21 @@ void tcg_handle_interrupt(CPUState *cpu, int mask)
     }
 }
=20
+static void do_nothing(CPUState *cpu, run_on_cpu_data d)
+{
+}
+
+void tcg_cpus_force_rcu(Notifier *notify, void *data)
+{
+    CPUState *cpu =3D data;
+
+    /*
+     * Called with rcu_registry_lock held, using async_run_on_cpu() ensure=
s
+     * that there are no deadlocks.
+     */
+    async_run_on_cpu(cpu, do_nothing, RUN_ON_CPU_NULL);
+}
+
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
     if (qemu_tcg_mttcg_enabled()) {
diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
index 6a5fcef88980..8742041c8aea 100644
--- a/accel/tcg/tcg-accel-ops.h
+++ b/accel/tcg/tcg-accel-ops.h
@@ -18,5 +18,7 @@ void tcg_cpus_destroy(CPUState *cpu);
 int tcg_cpus_exec(CPUState *cpu);
 void tcg_handle_interrupt(CPUState *cpu, int mask);
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel);
+/* Common force_rcu notifier for MTTCG and RR */
+void tcg_cpus_force_rcu(Notifier *notify, void *data);
=20
 #endif /* TCG_CPUS_H */
--=20
2.31.1


