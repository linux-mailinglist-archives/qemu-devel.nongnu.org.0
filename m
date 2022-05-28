Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A619F536E4D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 22:11:22 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv2mP-0007P8-5w
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 16:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <bounces+27129525-197f-qemu-devel=nongnu.org@em894.thefarbeyond.com>)
 id 1nv2em-0005VA-TM
 for qemu-devel@nongnu.org; Sat, 28 May 2022 16:03:29 -0400
Received: from xtrwkkxd.outbound-mail.sendgrid.net ([167.89.17.173]:19656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <bounces+27129525-197f-qemu-devel=nongnu.org@em894.thefarbeyond.com>)
 id 1nv2ek-0007YA-TX
 for qemu-devel@nongnu.org; Sat, 28 May 2022 16:03:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefarbeyond.com;
 h=from:subject:mime-version:content-transfer-encoding:to:cc:
 content-type;
 s=s1; bh=OvifSN2kEIZBcKNsUintOhK+iHcWKFZKyvhWF66CElo=;
 b=mNv1DqvQFirX3rwbIiwB2HA5CTfs2AhDC8/17vYcZb4LFQGxG1JYzaP+YjUrW4sn13re
 j2+ZiXsYyJizOnX25pQFQha+hEkp+mx4d6TE5oglrLp577WNm+LKGVZdeSWXquqyP2rVat
 4tH+A+cQAflSryF3LBIaqteDgMkqfc+opYyKt71RSqHzu7XHX2ojyHr8P7a2KL/Y0WczQF
 bQAijR/IVGQ13GCN900fJNTVLvOVG/NfaMrRqupkIW7WgdoHDSktcBXi6oALMZIA+/vm8W
 8BtIegg0NkKGHjs4vradWdw8OcSI0ybXgZ2PDY3Ggl91KrwAxFIgNcqXqkdZeDAw==
Received: by filterdrecv-57fb89798f-5rhw2 with SMTP id
 filterdrecv-57fb89798f-5rhw2-1-62927DEC-1D
 2022-05-28 19:54:20.678196528 +0000 UTC m=+4486242.742076986
Received: from mail.thefarbeyond.com (unknown) by geopod-ismtpd-6-0 (SG)
 with ESMTP id 4P-aFhlmTh6Wg9pf9-79OA
 Sat, 28 May 2022 19:54:20.601 +0000 (UTC)
Received: from mail.thefarbeyond.com (localhost [127.0.0.1])
 by mail.thefarbeyond.com (Postfix) with ESMTP id 14996E1707;
 Sat, 28 May 2022 15:54:20 -0400 (EDT)
Received: from dev-vm.. (unknown [192.168.1.1])
 by mail.thefarbeyond.com (Postfix) with ESMTPSA id B2DE5E1706;
 Sat, 28 May 2022 15:54:19 -0400 (EDT)
From: Ben Cohen <ben@thefarbeyond.com>
Subject: [PATCH] Updating gdbstub to allow safe multithreading in usermode
 emulation
Date: Sat, 28 May 2022 19:54:20 +0000 (UTC)
Message-Id: <20220528195344.4160516-1-ben@thefarbeyond.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-SG-EID: =?us-ascii?Q?6JWjqFZbb=2FTVZvRdFmpiJhk34u9tiVzkSWus8J6PalP8DalxhEQEiPdnCZ=2FSDg?=
 =?us-ascii?Q?2YjTAAb0TjOe8rXqtTSdyyRsLD+Cz6a4ZvSX6o6?=
 =?us-ascii?Q?UAA+YcYki7sRzWQfo4ic2+FOelw1Rp8CqnM4gKa?=
 =?us-ascii?Q?ZsL9JbKkedDGRfyRlvaec54Nr6dXnqBKLtrrTWa?=
 =?us-ascii?Q?x8MeQyQ39sBbL4vGNbIi+72+JiuWUthI5B67sIv?=
 =?us-ascii?Q?tLnF6DySfIXmGQkR+o5yppdgPdPtzOaeqI5SBB?=
To: qemu-devel@nongnu.org
Cc: Ben Cohen <ben@thefarbeyond.com>, Alex =?iso-8859-1?q?Benn=E9e?=
 <alex.bennee@linaro.org>, Philippe =?iso-8859-1?q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
X-Entity-ID: DA2SVfCUNZcNdrSl9vi0hQ==
Content-Type: text/plain; charset=us-ascii
Received-SPF: none client-ip=167.89.17.173;
 envelope-from=bounces+27129525-197f-qemu-devel=nongnu.org@em894.thefarbeyond.com;
 helo=xtrwkkxd.outbound-mail.sendgrid.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 28 May 2022 16:09:01 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I was testing some multi-threaded code in qemu's usermode and ran into
issues with the gdbstub because the user mode qemu emulation spawns new
threads when the process tries to make a new thread but the gdbstub does
not handle the threads well. The current gdbstub has a single global
struct which contains all the state data, and multiple threads can write
to this struct simultaneously, causing gdb packets to be corrupted. The
different threads can also try to read off the gdb socket at the same
time causing the packet to be devided between threads. This patch is
designed to add a single separate thread for the usermode gdbstub which
will handle all the gdb comms and avoid the multithreading issues.

To demonstrate that the mutlithreading was not working properly before
and that it hopefully works properlly now, I wrote a small test program
with some gdb scripts that can be found here:
http://url6163.thefarbeyond.com/ls/click?upn=dUoerjbXT3NK9PiRMHEMD5Fm1RmJf0eUWTDkIDLODGZSRXu94ynuiGwQ-2FCFcimw5rndUfJbozecGKoOE5zbdfRVgadbVSeCrgP5IlB2UqPU-3DUBT-_E8SO-2FEypfU855L0ybQoiQY4Xaj8Z6NYzBoBK89OH-2BiIJOE8-2BoeErelzsKKZyRONZN5M7Gzw0Zs4K0tnG4gxJSOWW89OLEjRW7ISHPWO2lT6fJJUM88-2BLL6sh4BfexcL-2FKt7KhnEpzqyb9bd5UZ-2FR2iPVIjp7zfshwPtjJEHAHaIGeNZbI4nFw81hhs0N1tt9sAcC1ALVazbgnC5E-2F5ZChA-3D-3D

Signed-off-by: Ben Cohen <ben@thefarbeyond.com>
---
 gdbstub.c              | 105 +++++++++++++++++++++++++++++++++++++++++
 include/exec/gdbstub.h |  13 +++++
 linux-user/signal.c    |   4 ++
 3 files changed, 122 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index a3ff8702ce..11a76da575 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -29,6 +29,7 @@
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
+#include "qemu/thread.h"
 #include "trace/trace-root.h"
 #include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
@@ -370,8 +371,103 @@ typedef struct GDBState {
     int sstep_flags;
     int supported_sstep_flags;
 } GDBState;
+typedef struct GDBSignal {
+    CPUState *cpu;
+    int sig;
+} GDBSignal;
 
 static GDBState gdbserver_state;
+#ifdef CONFIG_USER_ONLY
+static GDBSignal *waiting_signal;
+static QemuMutex signal_wait_mutex;
+static QemuMutex signal_done_mutex;
+static QemuMutex another_thread_is_stepping;
+static int signal_result;
+#endif
+
+static void *gdb_signal_handler_loop(void* args)
+{
+    while (TRUE) {
+        if (NULL != waiting_signal) {
+            signal_result = gdb_handlesig(waiting_signal->cpu,
+                    waiting_signal->sig);
+            waiting_signal = NULL;
+            qemu_mutex_unlock(&signal_done_mutex);
+        }
+    }
+    /* Should never return */
+    return NULL;
+}
+
+int gdb_thread_handle_signal(CPUState *cpu, int sig)
+{
+    GDBSignal signal = {
+        .cpu = cpu,
+        .sig = sig
+    };
+    if (!cpu->singlestep_enabled) {
+        /*
+         * This mutex is locked by all threads that are not stepping to allow
+         * only the thread that is currently stepping to handle signals until
+         * it finished stepping. Without this, pending signals that are queued
+         * up while the stepping thread handles its signal will race with the
+         * stepping thread to get the next signal handled. This is bad, because
+         * the gdb client expects the stepping thread to be the first response
+         * back to the step command that was sent.
+         */
+        qemu_mutex_lock(&another_thread_is_stepping);
+    }
+    /*
+     * This mutex is locked to allow only one thread at a time to be
+     * handling a signal. This is necessary, because otherwise multiple
+     * threads will try to talk to the gdb client simultaneously and can
+     * race each other sending and receiving packets, potentially going
+     * out of order or simulatenously reading off of the same socket.
+     */
+    qemu_mutex_lock(&signal_wait_mutex);
+    {
+        /*
+         * This mutex is first locked here to ensure that it is in a locked
+         * state before the gdb_signal_handler_loop handles the next signal
+         * and unlocks it.
+         */
+        qemu_mutex_lock(&signal_done_mutex);
+        waiting_signal = &signal;
+        /*
+         * The thread locks this mutex again to wait until the
+         * gdb_signal_handler_loop is finished handling the signal and has
+         * unlocked the mutex.
+         */
+        qemu_mutex_lock(&signal_done_mutex);
+        /*
+         * Finally, unlock this mutex in preparation for the next call to
+         * this function
+         */
+        qemu_mutex_unlock(&signal_done_mutex);
+        sig = signal_result;
+        if (!cpu->singlestep_enabled) {
+            /*
+             * If this thread is not stepping and is handling its signal
+             * then it can always safely unlock this mutex.
+             */
+            qemu_mutex_unlock(&another_thread_is_stepping);
+        } else {
+            /*
+             * If this thread was already stepping it will already be holding
+             * this mutex so here try to lock instead of waiting on a lock.
+             * This lock will prevent other non-stepping threads from handling
+             * a signal until stepping is done.
+             */
+            qemu_mutex_trylock(&another_thread_is_stepping);
+        }
+    }
+    /*
+     * Unlock here to because we are done handling the signal and
+     * another thread can now start handling a pending signal.
+     */
+    qemu_mutex_unlock(&signal_wait_mutex);
+    return sig;
+}
 
 static void init_gdbserver_state(void)
 {
@@ -381,6 +477,15 @@ static void init_gdbserver_state(void)
     gdbserver_state.str_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
     gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
+#ifdef CONFIG_USER_ONLY
+    waiting_signal = NULL;
+    qemu_mutex_init(&signal_wait_mutex);
+    qemu_mutex_init(&signal_done_mutex);
+    qemu_mutex_init(&another_thread_is_stepping);
+    pthread_t signal_thread;
+    pthread_create(&signal_thread, NULL, gdb_signal_handler_loop, NULL);
+    pthread_setname_np(signal_thread, "gdbstub_handler");
+#endif
 
     /*
      * In replay mode all events will come from the log and can't be
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index c35d7334b4..15bfb76cca 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -47,6 +47,19 @@ void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
 
 #ifdef CONFIG_USER_ONLY
+/**
+ * gdb_thread_handle_signal
+ * @cpu_env: The guest thread's cpu env
+ * @sig: The signal being handled for the guest thread
+ *
+ * This function is a layer in between the gdb_handlesig function and the
+ * guest cpu threads. Instead of directly handling signals in the guest
+ * threads, this function passes off a signal to a handler loop thread running
+ * in the gdbstub that will handle each thread's signal atomically to avoid
+ * having races between threads to read and send data on the gdb socket. The
+ * function returns the signal value from gdb_handlesig
+ */
+int gdb_thread_handle_signal(CPUState *cpu_env, int sig);
 /**
  * gdb_handlesig: yield control to gdb
  * @cpu: CPU
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d29bfaa6b..a252791217 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1068,7 +1068,11 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
     /* dequeue signal */
     k->pending = 0;
 
+#ifdef CONFIG_USER_ONLY
+    sig = gdb_thread_handle_signal(cpu, sig);
+#else
     sig = gdb_handlesig(cpu, sig);
+#endif
     if (!sig) {
         sa = NULL;
         handler = TARGET_SIG_IGN;
-- 
2.32.0


