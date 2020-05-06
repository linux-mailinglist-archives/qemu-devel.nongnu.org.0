Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98421C6B47
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 10:18:20 +0200 (CEST)
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWFFz-00066Q-Mu
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 04:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jWFF8-0005JI-Qk
 for qemu-devel@nongnu.org; Wed, 06 May 2020 04:17:27 -0400
Received: from mail.ispras.ru ([83.149.199.45]:41424)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jWFF7-0005JD-G9
 for qemu-devel@nongnu.org; Wed, 06 May 2020 04:17:26 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0C679CD460;
 Wed,  6 May 2020 11:17:22 +0300 (MSK)
Subject: [PATCH] replay: synchronize on every virtual timer callback
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 06 May 2020 11:17:22 +0300
Message-ID: <158875304273.3986.105601155554744438.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 03:52:27
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: pbonzini@redhat.com, dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes virtual timer callbacks depend on order
of virtual timer processing and warping of virtual clock.
Therefore every callback should be logged to make replay deterministic.
This patch creates a checkpoint before every virtual timer callback.
With these checkpoints virtual timers processing and clock warping
events order is completely deterministic.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 util/qemu-timer.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index d548d3c1ad..47833f338f 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -588,6 +588,11 @@ bool timerlist_run_timers(QEMUTimerList *timer_list)
         qemu_mutex_lock(&timer_list->active_timers_lock);
 
         progress = true;
+        /*
+         * Callback may insert new checkpoints, therefore add new checkpoint
+         * for the virtual timers.
+         */
+        need_replay_checkpoint = timer_list->clock->type == QEMU_CLOCK_VIRTUAL;
     }
     qemu_mutex_unlock(&timer_list->active_timers_lock);
 


