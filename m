Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140E83510C6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:22:47 +0200 (CEST)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsbG-0001Ia-5t
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lRsYf-000774-Ki
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:20:07 -0400
Received: from mail.ispras.ru ([83.149.199.84]:52406)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lRsYc-0003Ch-9D
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:20:05 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id D4E3E407624A;
 Thu,  1 Apr 2021 08:19:51 +0000 (UTC)
Subject: [PATCH v3] replay: notify CPU on event
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 01 Apr 2021 11:19:51 +0300
Message-ID: <161726519158.1476949.7614181684462079836.stgit@pasha-ThinkPad-X280>
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enables vCPU notification to wake it up
when new async event comes in replay mode.

The motivation of this patch is the following.
Consider recorded block async event. It is saved into the log
with one of the checkpoints. This checkpoint may be passed in
vCPU loop. In replay mode when this async event is read from
the log, and block thread task is not finished yet, vCPU thread
goes to sleep. That is why this patch adds waking up the vCPU
to process this finished event.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 replay/replay-events.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/replay/replay-events.c b/replay/replay-events.c
index a1c6bb934e..15983dd250 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -15,6 +15,7 @@
 #include "replay-internal.h"
 #include "block/aio.h"
 #include "ui/input.h"
+#include "hw/core/cpu.h"
 
 typedef struct Event {
     ReplayAsyncEventKind event_kind;
@@ -126,6 +127,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
 
     g_assert(replay_mutex_locked());
     QTAILQ_INSERT_TAIL(&events_list, event, events);
+    qemu_cpu_kick(first_cpu);
 }
 
 void replay_bh_schedule_event(QEMUBH *bh)


