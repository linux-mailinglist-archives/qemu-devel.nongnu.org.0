Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0E6B0932
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtt1-00040i-6p; Wed, 08 Mar 2023 08:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr6-0001lD-Mj
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:22 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr2-00068h-NE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:20 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MKKlN-1prHTq2Wad-00LrA1; Wed, 08
 Mar 2023 14:29:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 23/28] linux-user/sparc: Handle privilidged action trap
Date: Wed,  8 Mar 2023 14:28:52 +0100
Message-Id: <20230308132857.161793-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6RAAO4vQwXWGHOqmXZYgz20yoyV/pgSxbMb6vpaprBB/PEqb8cj
 4BSVOdBA1uY9h7Ks+/Sij1xF5Lx2G/yT5Cg9NnbeDS3KUImoj9Ioj1pLNDp3vYEIo8FbwZQ
 GsH8fl4DOijGV7+PzfYe/U1gMVCZ7UTXSvCp9ZDNx3palNwjCuvGdGCeBMnxGDKaA5BzApm
 SZiPMmyaGcIUHJEOsESFw==
UI-OutboundReport: notjunk:1;M01:P0:RWngCclXgUo=;HfFZrVHLYG7zei+NmJOWCSsWni2
 jWyl95S/k89zFlIe/kPm154ZQWN/y34VnssnK7rtpmk4NyiyyViFGYNQsbEy3o14mY8P5GafP
 5+cC/ETlJhR2r/9Kf4kXJJBHHEDSWWtHcs44V7kWTbHdmnL0WqapTfQ0GoiMk8I6rRMxfhRMW
 JIzzwqKxmc0RSxvWfI0T5qO+OCNxe54Xu9ybcFm5xAH9A6CkckyY0WPAVODHPYfmbsopAe30U
 tKVKxGSrx75F3xVDGEeTHE6LItoGof5Bs1NwS0ZpjcM3gwpUJbpcL7E932bz9lDvbVXlHI3E3
 8lubIw725b5Czb6jT1cuh/Rtkoy6LUzaSUKWpVNj8mqNwShwzOyAnpbepvyWU59yl2OhsLPyu
 QqIw6E+ASBovOl3wPHJS4EV8oAk4Gshyjs46WcJypQ6A6Ecf7T6cMfU+C8tfDuFgnmSl24DPk
 uJUT+3ijr0ZIb/V+vKtxB3vsGOP7rMBiV3vldFrg2GLEtIqQXl3lfM0EdITmpZbEdQZP9qUnd
 dqxPfDnh+i4CtgqUAt7abdqstMsto+m9DajH5ooJFZKZHdQIci2HUpYhreuESCLkU7nMwoVkk
 FLx1pPpnhdwn8xLI2bQWERygJ4qHWnJx+DgOYu8nI5j/uCwevyXwW4A5aTfGr4+OQgpdgmqll
 HRs9LJm/u36SHDvQSMZbPmUsujCfoRt14u9ABTYmbg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

This is raised by using an %asi < 0x80 in user-mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-12-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 61b6e81459be..43f19fbd9141 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -306,6 +306,12 @@ void cpu_loop (CPUSPARCState *env)
         case TT_PRIV_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#ifdef TARGET_SPARC64
+        case TT_PRIV_ACT:
+            /* Note do_privact defers to do_privop. */
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+#endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
-- 
2.39.2


