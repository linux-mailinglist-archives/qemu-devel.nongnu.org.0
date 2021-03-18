Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3771340721
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:46:33 +0100 (CET)
Received: from localhost ([::1]:42260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsyu-0007rz-9j
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lMsv1-0005tD-8v
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:42:31 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:49117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lMsux-00020S-VM
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:42:30 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3F65E434EE;
 Thu, 18 Mar 2021 14:36:05 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Date: Thu, 18 Mar 2021 14:35:50 +0100
Message-Id: <20210318133550.13120-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If OOB is disabled, events received in monitor_qmp_event will be handled
in the main context. Thus, we must not acquire a qmp_queue_lock there,
as the dispatcher coroutine holds one over a yield point, where it
expects to be rescheduled from the main context. If a CHR_EVENT_CLOSED
event is received just then, it can race and block the main thread by
waiting on the queue lock.

Run monitor_qmp_cleanup_queue_and_resume in a BH on the iohandler
thread, so the main thread can always make progress during the
reschedule.

The delaying of the cleanup is safe, since the dispatcher always moves
back to the iothread afterward, and thus the cleanup will happen before
it gets to its next iteration.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---


We've had some spurious reports of people reporting (usually multiple) total VM
hangs on our forum, and finally got our hands on some stack traces:

Thread 1 (Thread 0x7fa59d476340 (LWP 1306954)):
#0 __lll_lock_wait () at ../sysdeps/unix/sysv/linux/x86_64/lowlevellock.S:103
#1 0x00007fa5a8335714 in __GI___pthread_mutex_lock (mutex=mutex@entry=0x55722bf3a848) at ../nptl/pthread_mutex_lock.c:80
#2 0x000055722a475e39 in qemu_mutex_lock_impl (mutex=0x55722bf3a848, file=0x55722a5d7149 "../monitor/qmp.c", line=80) at ../util/qemu-thread-posix.c:79
#3 0x000055722a3fb686 in monitor_qmp_cleanup_queue_and_resume (mon=0x55722bf3a730) at ../monitor/qmp.c:80
#4 monitor_qmp_event (opaque=0x55722bf3a730, event=<optimized out>) at ../monitor/qmp.c:421
#5 0x000055722a3f9505 in tcp_chr_disconnect_locked (chr=0x55722bc68fa0) at ../chardev/char-socket.c:507
#6 0x000055722a3f9550 in tcp_chr_disconnect (chr=0x55722bc68fa0) at ../chardev/char-socket.c:517
#7 0x000055722a3f959e in tcp_chr_hup (channel=<optimized out>, cond=<optimized out>, opaque=<optimized out>) at ../chardev/char-socket.c:557
#8 0x00007fa5a9c2edd8 in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
#9 0x000055722a47a848 in glib_pollfds_poll () at ../util/main-loop.c:221
#10 os_host_main_loop_wait (timeout=<optimized out>) at ../util/main-loop.c:244
#11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:520
#12 0x000055722a2570a1 in qemu_main_loop () at ../softmmu/vl.c:1678
#13 0x0000557229fc178e in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:50

I managed to reproduce it reliably by adding a 'sleep(1)' to the beginning of
handle_qmp_command, then running this:

  ./build/qemu-system-x86_64 \
    -chardev 'socket,id=qmp,path=./qmp.socket,server=on,wait=off' \
    -mon 'chardev=qmp,mode=control'
  yes "query-version" | timeout 2s ./scripts/qmp/qmp-shell ./qmp.socket

When the timeout hits, the main loop always ends up in the trace above, with the
dispatch coroutine having just yielded to reschedule itself.

Holding a QemuMutex over a yield point seems pretty dangerous in general, but it
seems to be working for now...


 monitor/qmp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 2b0308f933..83eb440b29 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -74,8 +74,9 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
     }
 }
 
-static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
+static void monitor_qmp_cleanup_queue_and_resume(void *opaque)
 {
+    MonitorQMP *mon = opaque;
     QEMU_LOCK_GUARD(&mon->qmp_queue_lock);
 
     /*
@@ -453,8 +454,18 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
          * backend is still open.  For example, when the backend is
          * stdio, it's possible that stdout is still open when stdin
          * is closed.
+         *
+         * monitor_qmp_cleanup_queue_and_resume must not run in main
+         * context, as it acquires a qmp_queue_lock, which is held by
+         * the dispatcher coroutine during a reschedule/yield to the
+         * main context, and could thus lead to a deadlock.
+         *
+         * This is safe to delay, since the dispatcher also moves
+         * back to the iohandler context before reaquiring any
+         * queue locks.
          */
-        monitor_qmp_cleanup_queue_and_resume(mon);
+        aio_bh_schedule_oneshot(iohandler_get_aio_context(),
+                                monitor_qmp_cleanup_queue_and_resume, mon);
         json_message_parser_destroy(&mon->parser);
         json_message_parser_init(&mon->parser, handle_qmp_command,
                                  mon, NULL);
-- 
2.20.1



