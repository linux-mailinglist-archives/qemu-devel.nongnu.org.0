Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F23268463
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 08:09:05 +0200 (CEST)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHhfk-0006JI-0z
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 02:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kHhdM-0002JG-PS
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:06:36 -0400
Received: from mail.ispras.ru ([83.149.199.84]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kHhdL-0002Gu-0s
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 02:06:36 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 28EB740A2048;
 Mon, 14 Sep 2020 06:06:32 +0000 (UTC)
Subject: [PATCH v4 01/15] replay: don't record interrupt poll
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 14 Sep 2020 09:06:31 +0300
Message-ID: <160006359182.31457.6752163542475006502.stgit@pasha-ThinkPad-X280>
In-Reply-To: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
References: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

Interrupt poll is not a real interrupt event. It is needed only for
thread safety. This interrupt is used for i386 and converted
to hardware interrupt by cpu_handle_interrupt function.
Therefore it is not needed to be recorded, because hardware
interrupt will be recorded after converting.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--

v4 changes:
 - Condition check refactoring (suggested by Alex Bennée)
---
 accel/tcg/cpu-exec.c |   21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 66d38f9d85..c065b4cc77 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -429,8 +429,7 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
 #if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
-        if ((cpu->interrupt_request & CPU_INTERRUPT_POLL)
-            && replay_interrupt()) {
+        if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
             X86CPU *x86_cpu = X86_CPU(cpu);
             qemu_mutex_lock_iothread();
             apic_poll_irq(x86_cpu->apic_state);
@@ -526,6 +525,20 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
     return false;
 }
 
+/*
+ * CPU_INTERRUPT_POLL is a virtual event which gets converted into a
+ * "real" interrupt event later. It does not need to be recorded for
+ * replay purposes.
+ */
+static inline bool need_replay_interrupt(int interrupt_request)
+{
+#if defined(TARGET_I386)
+    return !(interrupt_request & CPU_INTERRUPT_POLL);
+#else
+    return true;
+#endif
+}
+
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
@@ -587,7 +600,9 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
            and via longjmp via cpu_loop_exit.  */
         else {
             if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
-                replay_interrupt();
+                if (need_replay_interrupt(interrupt_request)) {
+                    replay_interrupt();
+                }
                 /*
                  * After processing the interrupt, ensure an EXCP_DEBUG is
                  * raised when single-stepping so that GDB doesn't miss the


