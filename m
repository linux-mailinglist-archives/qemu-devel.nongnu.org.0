Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335F1DE01A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 08:47:25 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc1Sm-0006fJ-Mq
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 02:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jc1RO-0006AW-8h
 for qemu-devel@nongnu.org; Fri, 22 May 2020 02:45:58 -0400
Received: from mail.ispras.ru ([83.149.199.45]:39940)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jc1RN-0000uL-Fr
 for qemu-devel@nongnu.org; Fri, 22 May 2020 02:45:57 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2AC89CD462;
 Fri, 22 May 2020 09:45:54 +0300 (MSK)
Subject: [PATCH] replay: fix replay shutdown for console mode
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 22 May 2020 09:45:54 +0300
Message-ID: <159012995470.27967.18129611453659045726.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, rth@twiddle.net, alex.bennee@linaro.org,
 pavel.dovgaluk@ispras.ru, dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QEMU is used without any graphical window,
QEMU execution is terminated with the signal (e.g., Ctrl-C).
Signal processing in QEMU does not include
qemu_system_shutdown_request call. That is why shutdown
event is not recorded by record/replay in this case.
This patch adds shutdown event to the end of the record log.
Now every replay will shutdown the machine at the end.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 0 files changed

diff --git a/replay/replay.c b/replay/replay.c
index 53edad1377..83ed9e0e24 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -366,6 +366,11 @@ void replay_finish(void)
     /* finalize the file */
     if (replay_file) {
         if (replay_mode == REPLAY_MODE_RECORD) {
+            /*
+             * Can't do it in the signal handler, therefore
+             * add shutdown event here for the case of Ctrl-C.
+             */
+            replay_shutdown_request(SHUTDOWN_CAUSE_HOST_SIGNAL);
             /* write end event */
             replay_put_event(EVENT_END);
 


