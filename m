Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699CD4AB75C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:13:58 +0100 (CET)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH05t-0003Jz-7K
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:13:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00064H-MH
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:40409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-00079M-4D
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:06 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGQax-1nXmEW3tEL-00GqV2; Mon, 07
 Feb 2022 09:28:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] linux-user/alpha: Fix target rlimits for alpha and
 rearrange for clarity
Date: Mon,  7 Feb 2022 09:27:53 +0100
Message-Id: <20220207082759.180431-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VOgaERXLKga6CpkOKFs9/fgZlALhB8dtd2Kh6k/C4wD/27id7LY
 azSHAn7sWbrp4UXECbSdW4jr7AnWnHHgF0scW1WLpCKaLnNBgDjx0QZAMVk9Pc8lmtVEwt+
 A0ebrzT60CKnzHmjp7ZgOOfykU3k3fku4O4hkCQK9nTY+mGZ+d4x9uN8Vcg46SCsypjo6fS
 HpUTq8Eaw9b+nRs3NraQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uuy+mfXd1LM=://BRaStL8Qo+1hA7LdNJHg
 aT4LMJgP+JTR3Oj3XCz7/EUtthSBM6AF62LbQ10Rdw0Q8iAaFWm1TodA/cJH55TUT4ZoKroV+
 umRCyBNfpH3jGIf5fXkdJRujjt+wGZq6HK+YW0Q/Tg+Ja7ERIE9/XZKp3FSz9qm43udvFF5PF
 SGYbJGja2PStOqraLOYnZL7AYkGBwPk3bpwZiuO8ZTIvr7wzbqI/gZVv+JSojEt9xTS4VD/Um
 jrOb9CGGJmfyk8V4tH3u6vpwExYySswu5YDG5f+vW/xlWDXLYqikZ7wc7sibTIT/TA6oaL9WQ
 i5LgyzxozaVlTqc54Xk7HosQ2rN7WD0WzcXVixdQmH64cZwXU2/DcCpR8moxqa9zhLC3IiaFM
 Vw5U55RACn273QUzz1m4fItrPCh5J6NywkwVMPlVR0jJvNC//Tgg+xSs0SYYSi+aGuPJd8N6a
 eBEWWr0JUQtQl1sNBZfQAEIdEWTBqs1bMwUkFrgPUffgt0ba/x2FOtIeom7jM0wjQyNa8cK7A
 Zb+zHLAk7lvOZHj3qyC0bh/cJd0LUdRMdrNzGpozREYBh/jx7qVIreL1c5eJ4qWojJrdVA9lU
 T7kKrW4muqO7qszsSpovew5h8yMO0vQJWEvpcw8TaZyx43Q1kEWFiJu1T1wBbKZCNndgXAC2z
 4hgX4Yv+oB03YNITxCOFwfHC/vb5lCBCz5cRLzoQ4FuKWzsHEV3V10Oca+ZB3ED6w/JE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Serge Belyshev <belyshev@depni.sinp.msu.ru>

Alpha uses different values of some TARGET_RLIMIT_* constants, which were
missing and caused bugs like #577, fixed thus.  Also rearranged all three
(alpha, mips and sparc) that differ from everyone else for clarity.

Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/577
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <87y236lpwb.fsf@depni.sinp.msu.ru>
[lv: replace tabs by spaces]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 67 +++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index f23f0a2178f8..c8690688b5b7 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -730,44 +730,41 @@ struct target_rlimit {
 #define TARGET_RLIM_INFINITY	((abi_ulong)-1)
 #endif
 
+#define TARGET_RLIMIT_CPU        0
+#define TARGET_RLIMIT_FSIZE      1
+#define TARGET_RLIMIT_DATA       2
+#define TARGET_RLIMIT_STACK      3
+#define TARGET_RLIMIT_CORE       4
 #if defined(TARGET_MIPS)
-#define TARGET_RLIMIT_CPU		0
-#define TARGET_RLIMIT_FSIZE		1
-#define TARGET_RLIMIT_DATA		2
-#define TARGET_RLIMIT_STACK		3
-#define TARGET_RLIMIT_CORE		4
-#define TARGET_RLIMIT_RSS		7
-#define TARGET_RLIMIT_NPROC		8
-#define TARGET_RLIMIT_NOFILE		5
-#define TARGET_RLIMIT_MEMLOCK		9
-#define TARGET_RLIMIT_AS		6
-#define TARGET_RLIMIT_LOCKS		10
-#define TARGET_RLIMIT_SIGPENDING	11
-#define TARGET_RLIMIT_MSGQUEUE		12
-#define TARGET_RLIMIT_NICE		13
-#define TARGET_RLIMIT_RTPRIO		14
-#else
-#define TARGET_RLIMIT_CPU		0
-#define TARGET_RLIMIT_FSIZE		1
-#define TARGET_RLIMIT_DATA		2
-#define TARGET_RLIMIT_STACK		3
-#define TARGET_RLIMIT_CORE		4
-#define TARGET_RLIMIT_RSS		5
-#if defined(TARGET_SPARC)
-#define TARGET_RLIMIT_NOFILE		6
-#define TARGET_RLIMIT_NPROC		7
+#define TARGET_RLIMIT_NOFILE     5
+#define TARGET_RLIMIT_AS         6
+#define TARGET_RLIMIT_RSS        7
+#define TARGET_RLIMIT_NPROC      8
+#define TARGET_RLIMIT_MEMLOCK    9
+#elif defined(TARGET_ALPHA)
+#define TARGET_RLIMIT_RSS        5
+#define TARGET_RLIMIT_NOFILE     6
+#define TARGET_RLIMIT_AS         7
+#define TARGET_RLIMIT_NPROC      8
+#define TARGET_RLIMIT_MEMLOCK    9
+#elif defined(TARGET_SPARC)
+#define TARGET_RLIMIT_RSS        5
+#define TARGET_RLIMIT_NOFILE     6
+#define TARGET_RLIMIT_NPROC      7
+#define TARGET_RLIMIT_MEMLOCK    8
+#define TARGET_RLIMIT_AS         9
 #else
-#define TARGET_RLIMIT_NPROC		6
-#define TARGET_RLIMIT_NOFILE		7
-#endif
-#define TARGET_RLIMIT_MEMLOCK		8
-#define TARGET_RLIMIT_AS		9
-#define TARGET_RLIMIT_LOCKS		10
-#define TARGET_RLIMIT_SIGPENDING	11
-#define TARGET_RLIMIT_MSGQUEUE		12
-#define TARGET_RLIMIT_NICE		13
-#define TARGET_RLIMIT_RTPRIO		14
+#define TARGET_RLIMIT_RSS        5
+#define TARGET_RLIMIT_NPROC      6
+#define TARGET_RLIMIT_NOFILE     7
+#define TARGET_RLIMIT_MEMLOCK    8
+#define TARGET_RLIMIT_AS         9
 #endif
+#define TARGET_RLIMIT_LOCKS      10
+#define TARGET_RLIMIT_SIGPENDING 11
+#define TARGET_RLIMIT_MSGQUEUE   12
+#define TARGET_RLIMIT_NICE       13
+#define TARGET_RLIMIT_RTPRIO     14
 
 struct target_pollfd {
     int fd;           /* file descriptor */
-- 
2.34.1


