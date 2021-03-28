Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361234BD26
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:11:16 +0200 (CEST)
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQY0R-0000B1-5D
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvp-0004aK-N9
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:29 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lQXvn-00073M-8G
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:06:29 -0400
Received: from localhost.localdomain ([82.142.14.126]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MrhDg-1lwIIc43me-00nh5B; Sun, 28 Mar 2021 18:06:23 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] linux-user/s390x: Use the guest pointer for the sigreturn
 stub
Date: Sun, 28 Mar 2021 18:06:18 +0200
Message-Id: <20210328160619.4015954-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210328160619.4015954-1-laurent@vivier.eu>
References: <20210328160619.4015954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qnv3au0zVnYKlYwhvUYG7nMQ1drOu+qXB5MZ/eefT3Eb1I4QUqD
 Yrf3usLI6dnCU6xVdPrE8XhIPKRbUlStrM0IL9jP5wP7HxnNZOJbra2XyL0dxdZ/SmxrGjv
 wgAsIDweP2AhdLYDdk54RXwVZOZc5GCNsYeLmoFG/Vm/l6wdvv0AL9l7RRjVlvc65cJQsUC
 QzMNYmNB+cz8Vy4Tw5uBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZsKBQzB4+U4=:juytdZk3Z5yiL/yqJQ8PCI
 eQZBYV0xC3dYuSNGNfG9w3igh1hB9TfPJ5hlmKMQz+5et2lQgIhZcoBnR/rV8vvwW6YBXVHcK
 4k4UkUnYpT/l2AkI3vyjV0JDQTE0F0i7a/qIHZFUbgOBCLVXYz+xR7Do0SqF7oPyX9x7aPHBB
 RRwMIxxeOIgq1ogCjbV+PzEO1nzg5Od9U0RaVyPjRyD/CnJw6I3BTKo2Lt8NIk9qKIky5+hR4
 qLlr24pw6xZNLt6PZyE0MPOXFAoUZ7IHW6Ll/sJ1UDvu3Egn31n164OAotIr9+1A0fMAMUUBk
 5jDg/fjJCNeuU82DLjlvNRIkJanb+AYNCnqkiuKojeqkCyR1rvF4fTASX1Mm5URwIEf/JktYm
 RSEtsWY1JSavOltl5dw+nQGIpuk/o46/UGC31XFCYu/PQRNIklbCfI2ciwIozuKRyUr44z8Ka
 ZHKTyMFheXuFsZag++HYua/VOApCfuW/+coWov+a1x86yDr0RbgV
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Krebbel <krebbel@linux.ibm.com>

When setting up the pointer for the sigreturn stub in the return
address register (r14) we currently use the host frame address instead
of the guest frame address.

Note: This only caused problems if Qemu has been built with
--disable-pie (as it is in distros nowadays). Otherwise guest_base
defaults to 0 hiding the actual problem.

Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210324185128.63971-1-krebbel@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index ecfa2a14a982..7107c5fb5335 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -211,9 +211,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
+        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
     } else {
-        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
+        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
+                        | PSW_ADDR_AMODE;
         __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
                    (uint16_t *)(frame->retcode));
     }
-- 
2.30.2


