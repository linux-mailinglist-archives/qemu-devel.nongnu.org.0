Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047948631A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:45:20 +0100 (CET)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QGl-0004Sw-4d
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:45:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDU-0007c2-E0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:49495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004is-QF
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:56 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MplPh-1mbusg0abt-00q8dz; Thu, 06
 Jan 2022 11:41:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Thu,  6 Jan 2022 11:41:23 +0100
Message-Id: <20220106104137.732883-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IGLAv4PjXYRfNf36+tR4WJxewjJ2zrK51lwaDARSuCBxwc637fm
 TPlWvs6fPylXQ0Nd3iVgSQ6TcseJrKBLzCgb70vWG9tHAFNgDt1oDsemG/CLcd0IIandZ57
 PJ9AJkC/hhPw1mKRtyjo91a0miib5IticlzVvDclapTjJWB2hiiPZbtHhKEGz2wgSLeGsEb
 BJzcFG1QIE80jFvKxwxRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:484e/hbesAY=:q1HoRBV46w+D19TDtzaPkY
 55r3lXTvFOww9iD/D4WlPT2+KDDkDIOYebGsLRYzo73KgP5/nMgA8EwwRD4fByl9ZE9KIwfe+
 a/8Bgc1rV+kPazxn1M9+qzC2Kq6siK8k+9tdgkGO9tbkHJ70HViEZ69r8h0J/2S6jaYuF8Yho
 kDB3ahCdqPrkw8jK8pOT8Rsfq+4r4jwJthp83mdB/IFxd8ZbNbQaGgWhQnNSOtxKKpzrRBBxL
 q4B/3hIggWk3MSqUK9Ewsx+yXAlAZ7PPe2QeejGL6DQu+7tAZmkGhHSbCKUbGRFwvSoCATwGN
 FCvaN63rCl1rW4fFTCHeS7xfSYAWIpkjLtj16Scpxu/v/43uW71var9sCzTBPp5yiaLeetsXx
 RcR6ocQ9z2gf7Utz4y6QYVDfKDNXybqucOfDJlyEMR+zlyvBeZpN5l84qReAnQoPINyxZUh0e
 uD5VBP+A5X3KyDHeYYDveCPsRO3v+7BjNGiKW0JvqM3CXAig8nPJTKMBwyJtohLK8Rd4+FLF9
 IGoFX7BZJEI53E1X8oBtUnkl/qljsYu3eK2mGogyGNvHp76idx/KLHPb+h4QMT8o+X/fZ/TZy
 IseR8eE/OTxSHJ21DJooeDT1x7fM8EGM3Hod6EYLZPQAM4XRCi3YM0+wTGHMEh1+BX1864zmT
 9UhFyWs3z8zO5Qhb1x8bbhaE4zOjFJg9iX2UqnsTgjzB3OeEN0hUS/C+Q4VTmHYiUlGA=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthias Schiffer <mschiffer@universe-factory.net>

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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 510db73c3424..1229fecf5cd4 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -406,7 +406,12 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
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


