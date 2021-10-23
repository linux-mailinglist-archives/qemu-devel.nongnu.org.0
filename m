Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03717438525
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:04:08 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNFP-0007AH-1X
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mschiffer@universe-factory.net>)
 id 1meNBU-0006Bv-Bl
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:00:04 -0400
Received: from orthanc.universe-factory.net ([104.238.176.138]:48790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mschiffer@universe-factory.net>)
 id 1meNBS-0004S8-2T
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:00:04 -0400
Received: from avalon.. (unknown [IPv6:2001:19f0:6c01:100::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by orthanc.universe-factory.net (Postfix) with ESMTPSA id C42871F4BB;
 Sat, 23 Oct 2021 21:59:58 +0200 (CEST)
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Sat, 23 Oct 2021 21:59:10 +0200
Message-Id: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=104.238.176.138;
 envelope-from=mschiffer@universe-factory.net;
 helo=orthanc.universe-factory.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Matthias Schiffer <mschiffer@universe-factory.net>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When converting a siginfo_t from waitid(), the interpretation of si_status
depends on the value of si_code: For CLD_EXITED, it is an exit code and
should be copied verbatim. For other codes, it is a signal number
(possibly with additional high bits from ptrace) that should be mapped.

This code was previously changed in commit 1c3dfb506ea3
("linux-user/signal: Decode waitid si_code"), but the fix was
incomplete.

Tested with the following test program:

    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>
    #include <sys/wait.h>

    int main() {
    	pid_t pid = fork();
    	if (pid == 0) {
    		exit(12);
    	} else {
    		siginfo_t siginfo = {};
    		waitid(P_PID, pid, &siginfo, WEXITED);
    		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
    	}

    	pid = fork();
    	if (pid == 0) {
    		raise(SIGUSR2);
    	} else {
    		siginfo_t siginfo = {};
    		waitid(P_PID, pid, &siginfo, WEXITED);
    		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)siginfo.si_status);
    	}
    }

Output with an x86_64 host and mips64el target before 1c3dfb506ea3
(incorrect: exit code 12 is translated like a signal):

    Code: 1, status: 17
    Code: 2, status: 17

After 1c3dfb506ea3 (incorrect: signal number is not translated):

    Code: 1, status: 12
    Code: 2, status: 12

With this patch:

    Code: 1, status: 12
    Code: 2, status: 17

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 linux-user/signal.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 14d8fdfde152..8e3af98ec0a7 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -403,7 +403,12 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
         case TARGET_SIGCHLD:
             tinfo->_sifields._sigchld._pid = info->si_pid;
             tinfo->_sifields._sigchld._uid = info->si_uid;
-            tinfo->_sifields._sigchld._status = info->si_status;
+            if (si_code == CLD_EXITED)
+                tinfo->_sifields._sigchld._status = info->si_status;
+            else
+                tinfo->_sifields._sigchld._status
+                    = host_to_target_signal(info->si_status & 0x7f)
+                        | (info->si_status & ~0x7f);
             tinfo->_sifields._sigchld._utime = info->si_utime;
             tinfo->_sifields._sigchld._stime = info->si_stime;
             si_type = QEMU_SI_CHLD;
-- 
2.33.1


