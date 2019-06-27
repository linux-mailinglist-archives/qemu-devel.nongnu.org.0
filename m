Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D02586C0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 18:13:04 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgX1E-00067d-2J
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 12:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hgWOm-0001iS-2t
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 11:33:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hgWOj-0006k5-Rn
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 11:33:19 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56715 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hgWOa-0005rf-H1
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 11:33:12 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id EDAAD1A4560;
 Thu, 27 Jun 2019 17:32:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D0AB81A20BA;
 Thu, 27 Jun 2019 17:32:13 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 27 Jun 2019 17:31:50 +0200
Message-Id: <1561649510-21183-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561649510-21183-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561649510-21183-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v14 5/5] linux-user: Handle EXCP_FPE properly
 for MIPS
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Handle EXCP_FPE properly for MIPS in cpu loop.

Note that a vast majority of FP instructions are not affected by
the absence of the code in this patch, as they use alternative code
paths for handling floating point exceptions (see, for example,
invocations of update_fcr31()) - they rely on softfloat library for
keeping track on exceptions that needs to be raised. However, there
are few MIPS FP instructions (an example is CTC1) that use function
do_raise_exception() directly, and they need the case that is added
in this patch to propagate the FPE exception as designed.

Reported-by: Yunqiang Su <ysu@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/mips/cpu_loop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 43ba267..7d3c6b9 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -540,6 +540,12 @@ done_syscall:
             info.si_code = TARGET_ILL_ILLOPC;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case EXCP_FPE:
+            info.si_signo = TARGET_SIGFPE;
+            info.si_errno = 0;
+            info.si_code = 0;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         /* The code below was inspired by the MIPS Linux kernel trap
          * handling code in arch/mips/kernel/traps.c.
          */
-- 
2.7.4


