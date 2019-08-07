Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFE84DFC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 15:54:43 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvMOo-0000T5-C3
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 09:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dion@linutronix.de>) id 1hvMLi-0006Nk-TP
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 09:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dion@linutronix.de>) id 1hvMLh-0000wn-W5
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 09:51:30 -0400
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1]:42932)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dion@linutronix.de>) id 1hvMLh-0000nv-Qc
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 09:51:29 -0400
Received: from [5.158.153.55] (helo=clara.guests.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <dion@linutronix.de>)
 id 1hvMLX-0002b2-Jk; Wed, 07 Aug 2019 15:51:19 +0200
From: dion@linutronix.de
To: qemu-devel@nongnu.org
Date: Wed,  7 Aug 2019 15:54:58 +0200
Message-Id: <20190807135458.32440-2-dion@linutronix.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807135458.32440-1-dion@linutronix.de>
References: <20190807135458.32440-1-dion@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 2a0a:51c0:0:12e:550::1
X-Mailman-Approved-At: Wed, 07 Aug 2019 09:54:14 -0400
Subject: [Qemu-devel] [PATCH 1/1] linux-user: Handle /proc/self/exe in
 syscall execve
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
Cc: Olivier Dion <dion@linutronix.de>, john.ogness@linutronix.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olivier Dion <dion@linutronix.de>

If not handled, QEMU will execve itself instead of the emulated
process.  This could result in potential security risk.

Signed-off-by: Olivier Dion <dion@linutronix.de>
---
 linux-user/syscall.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8367cb138d..1a475896a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7504,7 +7504,18 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
              * before the execve completes and makes it the other
              * program's problem.
              */
-            ret = get_errno(safe_execve(p, argp, envp));
+            {
+                const char *pathname = p;
+                char real_path[PATH_MAX];
+                if (is_proc_myself(pathname, "exe")) {
+                    if (NULL == realpath(exec_path, real_path)) {
+                        ret = get_errno(-1);
+                        goto execve_efault;
+                    }
+                    pathname = real_path;
+                }
+                ret = get_errno(safe_execve(pathname, argp, envp));
+            }
             unlock_user(p, arg1, 0);
 
             goto execve_end;
-- 
2.22.0


