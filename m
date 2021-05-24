Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97C038DF62
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:48:35 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0du-0004ZC-Gr
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1ll0d1-0003id-QL; Sun, 23 May 2021 22:47:39 -0400
Received: from mta-12-4.privateemail.com ([198.54.127.107]:17814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1ll0d0-0007qw-49; Sun, 23 May 2021 22:47:39 -0400
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 42ED580063;
 Sun, 23 May 2021 22:47:23 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.249])
 by mta-12.privateemail.com (Postfix) with ESMTPA id AD4448005F;
 Sun, 23 May 2021 22:47:22 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: make process_pending_signals thread-safe
Date: Sun, 23 May 2021 22:46:55 -0400
Message-Id: <20210524024655.11115-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=198.54.127.107;
 envelope-from=someguy@effective-light.com; helo=MTA-12-4.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Hamza Mahfooz <someguy@effective-light.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use pthread_sigmask instead of sigprocmask inside process_pending_signals
to ensure that race conditions aren't possible.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 linux-user/signal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c4..81ff753c01 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1005,9 +1005,8 @@ void process_pending_signals(CPUArchState *cpu_env)
     sigset_t *blocked_set;
 
     while (qatomic_read(&ts->signal_pending)) {
-        /* FIXME: This is not threadsafe.  */
         sigfillset(&set);
-        sigprocmask(SIG_SETMASK, &set, 0);
+        pthread_sigmask(SIG_SETMASK, &set, 0);
 
     restart_scan:
         sig = ts->sync_signal.pending;
-- 
2.31.1


