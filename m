Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C1B30A270
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:06:47 +0100 (CET)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6TIM-0003od-Fo
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6THH-0003MP-Ty
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:05:39 -0500
Received: from mail.ispras.ru ([83.149.199.84]:32956)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l6THD-0007Uq-5i
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:05:39 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 59761407626D;
 Mon,  1 Feb 2021 07:05:28 +0000 (UTC)
Subject: [PATCH v2] replay: fix replay of the interrupts
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 01 Feb 2021 10:05:27 +0300
Message-ID: <161216312794.2030770.1709657858900983160.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
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
Cc: peter.maydell@linaro.org, pavel.dovgalyuk@ispras.ru,
 richard.henderson@linaro.org, f4bug@amsat.org, cfontana@suse.de,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes interrupt event comes at the same time with
the virtual timers. In this case replay tries to proceed
the timers, because deadline for them is zero.
This patch allows processing interrupts and exceptions
by entering the vCPU execution loop, when deadline is zero,
but checkpoint associated with virtual timers is not ready
to be replayed.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

---
v2:
 - changed replay mode check condition
---
 accel/tcg/tcg-cpus-icount.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
index 9f45432275..8ed485db01 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-cpus-icount.c
@@ -81,7 +81,13 @@ void icount_handle_deadline(void)
     int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                                   QEMU_TIMER_ATTR_ALL);
 
-    if (deadline == 0) {
+    /*
+     * Instructions, interrupts, and exceptions are processed in cpu-exec.
+     * Don't interrupt cpu thread, when these events are waiting
+     * (i.e., there is no checkpoint)
+     */
+    if (deadline == 0
+        && (replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint())) {
         icount_notify_aio_contexts();
     }
 }


