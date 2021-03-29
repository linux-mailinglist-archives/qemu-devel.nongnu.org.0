Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC534CDDE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 12:23:53 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQp3o-0008NT-Jp
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 06:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQp2g-0007qy-D6
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:22:42 -0400
Received: from mail.ispras.ru ([83.149.199.84]:52110)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQp2d-0005cy-0K
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:22:42 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id ECF4B407624A;
 Mon, 29 Mar 2021 10:22:30 +0000 (UTC)
Subject: [PATCH] icount: get rid of static variable
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 29 Mar 2021 13:22:30 +0300
Message-ID: <161701335066.1180180.7104085247702343395.stgit@pasha-ThinkPad-X280>
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch moves static last_delta variable into timers_state
structure to allow correct vmstate operations with icount shift=auto enabled.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 softmmu/cpu-timers.c   |    5 +++--
 softmmu/icount.c       |    9 +++------
 softmmu/timers-state.h |    2 ++
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index cd38595245..34ddfa02f1 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -188,11 +188,12 @@ static const VMStateDescription icount_vmstate_adjust_timers = {
 
 static const VMStateDescription icount_vmstate_shift = {
     .name = "timer/icount/shift",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = icount_shift_state_needed,
     .fields = (VMStateField[]) {
         VMSTATE_INT16(icount_time_shift, TimersState),
+        VMSTATE_INT64(last_delta, TimersState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/softmmu/icount.c b/softmmu/icount.c
index dbcd8c3594..21341a4ce4 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -176,9 +176,6 @@ static void icount_adjust(void)
     int64_t cur_icount;
     int64_t delta;
 
-    /* Protected by TimersState mutex.  */
-    static int64_t last_delta;
-
     /* If the VM is not running, then do nothing.  */
     if (!runstate_is_running()) {
         return;
@@ -193,20 +190,20 @@ static void icount_adjust(void)
     delta = cur_icount - cur_time;
     /* FIXME: This is a very crude algorithm, somewhat prone to oscillation.  */
     if (delta > 0
-        && last_delta + ICOUNT_WOBBLE < delta * 2
+        && timers_state.last_delta + ICOUNT_WOBBLE < delta * 2
         && timers_state.icount_time_shift > 0) {
         /* The guest is getting too far ahead.  Slow time down.  */
         qatomic_set(&timers_state.icount_time_shift,
                     timers_state.icount_time_shift - 1);
     }
     if (delta < 0
-        && last_delta - ICOUNT_WOBBLE > delta * 2
+        && timers_state.last_delta - ICOUNT_WOBBLE > delta * 2
         && timers_state.icount_time_shift < MAX_ICOUNT_SHIFT) {
         /* The guest is getting too far behind.  Speed time up.  */
         qatomic_set(&timers_state.icount_time_shift,
                     timers_state.icount_time_shift + 1);
     }
-    last_delta = delta;
+    timers_state.last_delta = delta;
     qatomic_set_i64(&timers_state.qemu_icount_bias,
                     cur_icount - (timers_state.qemu_icount
                                   << timers_state.icount_time_shift));
diff --git a/softmmu/timers-state.h b/softmmu/timers-state.h
index db4e60f18f..8c262ce139 100644
--- a/softmmu/timers-state.h
+++ b/softmmu/timers-state.h
@@ -43,6 +43,8 @@ typedef struct TimersState {
 
     /* Conversion factor from emulated instructions to virtual clock ticks.  */
     int16_t icount_time_shift;
+    /* Icount delta used for shift auto adjust. */
+    int64_t last_delta;
 
     /* Compensate for varying guest execution speed.  */
     int64_t qemu_icount_bias;


