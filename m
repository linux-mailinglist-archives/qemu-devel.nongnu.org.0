Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19A1C6A7C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 09:53:25 +0200 (CEST)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWErs-0006TP-6e
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 03:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jWEr0-0005zk-ER
 for qemu-devel@nongnu.org; Wed, 06 May 2020 03:52:30 -0400
Received: from mail.ispras.ru ([83.149.199.45]:36806)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jWEqz-00085O-Fv
 for qemu-devel@nongnu.org; Wed, 06 May 2020 03:52:30 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 907D9CD461;
 Wed,  6 May 2020 10:52:26 +0300 (MSK)
Subject: [PATCH] icount: fix shift=auto for record/replay
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 06 May 2020 10:52:26 +0300
Message-ID: <158875154623.957.4036561733593052357.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes shift=auto when record/replay is enabled.
Now user does not need to guess the best shift value.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 cpus.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 5670c96bcf..dfb9f4717f 100644
--- a/cpus.c
+++ b/cpus.c
@@ -379,7 +379,8 @@ static void icount_adjust(void)
 
     seqlock_write_lock(&timers_state.vm_clock_seqlock,
                        &timers_state.vm_clock_lock);
-    cur_time = cpu_get_clock_locked();
+    cur_time = REPLAY_CLOCK_LOCKED(REPLAY_CLOCK_VIRTUAL_RT,
+                                   cpu_get_clock_locked());
     cur_icount = cpu_get_icount_locked();
 
     delta = cur_icount - cur_time;
@@ -685,6 +686,7 @@ static const VMStateDescription icount_vmstate_timers = {
     .fields = (VMStateField[]) {
         VMSTATE_INT64(qemu_icount_bias, TimersState),
         VMSTATE_INT64(qemu_icount, TimersState),
+        VMSTATE_INT16(icount_time_shift, TimersState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {


