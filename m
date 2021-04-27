Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E278A36BFC7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:09:21 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHqS-0001c5-Ou
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lbHH7-0006DO-1c; Tue, 27 Apr 2021 02:32:50 -0400
Received: from mta-09-3.privateemail.com ([68.65.122.19]:13991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <someguy@effective-light.com>)
 id 1lbHH1-0006o4-G5; Tue, 27 Apr 2021 02:32:48 -0400
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 8DC4B60104;
 Tue, 27 Apr 2021 02:32:32 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.204])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 10A1160076;
 Tue, 27 Apr 2021 02:32:31 -0400 (EDT)
From: effective-light <someguy@effective-light.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: make process_pending_signals thread-safe
Date: Tue, 27 Apr 2021 02:32:17 -0400
Message-Id: <20210427063217.60753-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=68.65.122.19;
 envelope-from=someguy@effective-light.com; helo=MTA-09-3.privateemail.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Apr 2021 03:07:59 -0400
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
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu,
 effective-light <someguy@effective-light.com>
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


