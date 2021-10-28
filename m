Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EE43E983
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 22:25:40 +0200 (CEST)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgBxx-00070S-1N
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 16:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWe-0003fF-8k
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:64535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgBWX-0000PF-Qn
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:57:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 61D707561A5;
 Thu, 28 Oct 2021 21:57:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A00C67561C4; Thu, 28 Oct 2021 21:57:05 +0200 (CEST)
Message-Id: <647c291f53b4de0e79b979aaeee761ec4cf01a20.1635449225.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635449225.git.balaton@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 20/23] hw/timer/sh_timer: Rename sh_timer_state to
 SHTimerState
Date: Thu, 28 Oct 2021 21:27:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to coding style types should be camel case, also remove
unneded casts from void *.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
The tmu123_state is left for now, that's the real exported object with
SHTimerState being an internal object for a single timer. I'll come
back to this when QOM-ifying so only handled SHTimerState in this patch.

 hw/timer/sh_timer.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index e1b6145df8..2038adfb0a 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -45,11 +45,11 @@ typedef struct {
     int feat;
     int enabled;
     qemu_irq irq;
-} sh_timer_state;
+} SHTimerState;
 
 /* Check all active timers, and schedule the next timer interrupt. */
 
-static void sh_timer_update(sh_timer_state *s)
+static void sh_timer_update(SHTimerState *s)
 {
     int new_level = s->int_level && (s->tcr & TIMER_TCR_UNIE);
 
@@ -62,7 +62,7 @@ static void sh_timer_update(sh_timer_state *s)
 
 static uint32_t sh_timer_read(void *opaque, hwaddr offset)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
 
     switch (offset >> 2) {
     case OFFSET_TCOR:
@@ -85,7 +85,7 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
 static void sh_timer_write(void *opaque, hwaddr offset,
                             uint32_t value)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
     int freq;
 
     switch (offset >> 2) {
@@ -200,7 +200,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
 
 static void sh_timer_start_stop(void *opaque, int enable)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
 
     trace_sh_timer_start_stop(enable, s->enabled);
     ptimer_transaction_begin(s->timer);
@@ -216,14 +216,14 @@ static void sh_timer_start_stop(void *opaque, int enable)
 
 static void sh_timer_tick(void *opaque)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
     s->int_level = s->enabled;
     sh_timer_update(s);
 }
 
 static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
-    sh_timer_state *s;
+    SHTimerState *s;
 
     s = g_malloc0(sizeof(*s));
     s->freq = freq;
@@ -259,7 +259,7 @@ typedef struct {
 static uint64_t tmu012_read(void *opaque, hwaddr offset,
                             unsigned size)
 {
-    tmu012_state *s = (tmu012_state *)opaque;
+    tmu012_state *s = opaque;
 
     trace_sh_timer_read(offset);
     if (offset >= 0x20) {
@@ -289,7 +289,7 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset,
 static void tmu012_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
-    tmu012_state *s = (tmu012_state *)opaque;
+    tmu012_state *s = opaque;
 
     trace_sh_timer_write(offset, value);
     if (offset >= 0x20) {
-- 
2.21.4


