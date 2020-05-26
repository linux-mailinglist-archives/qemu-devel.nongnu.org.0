Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262571DE029
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 08:54:06 +0200 (CEST)
Received: from localhost ([::1]:33408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc1ZF-000788-8H
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 02:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jc1TN-0007Ub-S9
 for qemu-devel@nongnu.org; Fri, 22 May 2020 02:48:01 -0400
Received: from mail.ispras.ru ([83.149.199.45]:40200)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jc1TN-00016S-6H
 for qemu-devel@nongnu.org; Fri, 22 May 2020 02:48:01 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6F2F6CD46A;
 Fri, 22 May 2020 09:47:59 +0300 (MSK)
Subject: [PATCH] replay: notify the main loop when there are no instructions
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 22 May 2020 09:47:58 +0300
Message-ID: <159013007895.28110.2020104406699709721.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 02:35:28
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru,
 dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU is executed in console mode without any external event sources,
main loop may sleep for a very long time. But in case of replay
there is another event source - event log.
This patch adds main loop notification when the vCPU loop has nothing
to do and main loop should process the inputs from the event log.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 0 files changed

diff --git a/cpus.c b/cpus.c
index 7ce0d569b3..b4d0d9f21b 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1362,6 +1362,13 @@ static int64_t tcg_get_icount_limit(void)
     }
 }
 
+static void notify_aio_contexts(void)
+{
+    /* Wake up other AioContexts.  */
+    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
+    qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
+}
+
 static void handle_icount_deadline(void)
 {
     assert(qemu_in_vcpu_thread());
@@ -1370,9 +1377,7 @@ static void handle_icount_deadline(void)
                                                       QEMU_TIMER_ATTR_ALL);
 
         if (deadline == 0) {
-            /* Wake up other AioContexts.  */
-            qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
-            qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
+            notify_aio_contexts();
         }
     }
 }
@@ -1395,6 +1400,10 @@ static void prepare_icount_for_run(CPUState *cpu)
         cpu->icount_extra = cpu->icount_budget - insns_left;
 
         replay_mutex_lock();
+
+        if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
+            notify_aio_contexts();
+        }
     }
 }
 


