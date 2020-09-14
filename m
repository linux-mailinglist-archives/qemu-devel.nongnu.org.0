Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D02684AC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 08:18:36 +0200 (CEST)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHhox-0004Wv-MR
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 02:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kHhea-0004vG-Kj
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:07:52 -0400
Received: from mail.ispras.ru ([83.149.199.84]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kHheX-0002SE-Md
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:07:52 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 989E840A2048;
 Mon, 14 Sep 2020 06:07:47 +0000 (UTC)
Subject: [PATCH v4 14/15] replay: create temporary snapshot at debugger
 connection
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 14 Sep 2020 09:07:47 +0300
Message-ID: <160006366727.31457.2381184404739671543.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
References: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:06:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, pavel.dovgalyuk@ispras.ru,
 ehabkost@redhat.com, alex.bennee@linaro.org, mtosatti@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When record/replay does not uses overlays for storing the snapshots,
user is not capable of issuing reverse debugging commands.
This patch adds creation of the VM snapshot on the temporary
overlay image, when the debugger connects to QEMU.
Therefore the execution can be rewind to the moment
of the debugger connection while debugging the virtual machine.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 gdbstub.c                 |    1 +
 include/sysemu/replay.h   |    2 ++
 replay/replay-debugging.c |   16 ++++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index ac92273018..f19f98ab1a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3321,6 +3321,7 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent event)
         s->g_cpu = s->c_cpu;
 
         vm_stop(RUN_STATE_PAUSED);
+        replay_gdb_attached();
         gdb_has_xml = false;
         break;
     default:
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index b6cac175c4..2aa34b8919 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -94,6 +94,8 @@ bool replay_reverse_continue(void);
 bool replay_running_debug(void);
 /* Called in reverse debugging mode to collect breakpoint information */
 void replay_breakpoint(void);
+/* Called when gdb is attached to gdbstub */
+void replay_gdb_attached(void);
 
 /* Processing the instructions */
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index d02d4e0766..bb9110707a 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -316,3 +316,19 @@ void replay_breakpoint(void)
     assert(replay_mode == REPLAY_MODE_PLAY);
     replay_last_breakpoint = replay_get_current_icount();
 }
+
+void replay_gdb_attached(void)
+{
+    /*
+     * Create VM snapshot on temporary overlay to allow reverse
+     * debugging even if snapshots were not enabled.
+     */
+    if (replay_mode == REPLAY_MODE_PLAY
+        && !replay_snapshot) {
+        Error *err = NULL;
+        if (save_snapshot("start_debugging", &err) != 0) {
+            /* Can't create the snapshot. Continue conventional debugging. */
+            error_free(err);
+        }
+    }
+}


