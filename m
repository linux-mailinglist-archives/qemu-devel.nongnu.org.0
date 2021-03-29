Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FB34C52C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 09:46:13 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQmbE-0006v3-TN
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 03:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQmYx-0005Sz-Qy
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:43:51 -0400
Received: from mail.ispras.ru ([83.149.199.84]:54658)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQmYw-0004Lr-1h
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:43:51 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id A14D340755D9;
 Mon, 29 Mar 2021 07:43:47 +0000 (UTC)
Subject: [PATCH v2] replay: notify CPU on event
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Mon, 29 Mar 2021 10:43:47 +0300
Message-ID: <161700382734.1136014.13372992399972618499.stgit@pasha-ThinkPad-X280>
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
 replay/replay-events.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/replay/replay-events.c b/replay/replay-events.c
index a1c6bb934e..92dc800219 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -126,6 +126,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
 
     g_assert(replay_mutex_locked());
     QTAILQ_INSERT_TAIL(&events_list, event, events);
+    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
 }
 
 void replay_bh_schedule_event(QEMUBH *bh)


