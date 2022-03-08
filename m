Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4694D1B59
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:08:58 +0100 (CET)
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbSL-0006CO-Rs
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:08:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbMJ-0006p8-2U
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:43 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:45533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nRbME-0001Pl-NY
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:40 -0500
Received: from quad ([82.142.8.122]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5n3t-1oFP4O3L35-017FnR; Tue, 08
 Mar 2022 16:02:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
Date: Tue,  8 Mar 2022 16:02:27 +0100
Message-Id: <20220308150228.1616561-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308150228.1616561-1-laurent@vivier.eu>
References: <20220308150228.1616561-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C0YXGPelNegwDbXFjL5CHv+mmF0Vj+sUCn8WE1MWuK31S2WP+4y
 fLM4vwhF/KyxJs8y1UFLPGxC6FKd4irhizXr5gFTIQxWbiEUrANcNkrLQE8NIDDviae7V5x
 OowwfO+fR9e1ro93/JGVdfdZn/xdFY14Wzx3mhH5JuoT6c8uuam8DOfg6pi7AamFhnxKm1I
 yRJYedc/zmXd7E/h9xlSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qxUEWptHZkY=:ITqxbkNX78Om62qm7gHpVN
 zU2fI2/S6ZjNdFW8QOvR8IzVt9Zrf7pc2zsg5NvBpDPP6A/2RbgsXBHfkorqgMNQeOuOTA3ow
 vKF/1TPmYNlAEMle/qgL4HBKKW6HQIm4EL4HPtu9Ur1+8pWkRJXASqstrHIdU6L55Gq7fh9OW
 dZnJ6uu630C6m2uoZB8Nne1lsR6kdCFkvRaPujPdfJC1tQ8LUEq0bn9W4XdEf4U3Yk++tCtjX
 pe6EXUT2T6+7hcqIo8L+YAWLPP7n0T7dRrRZxR9UdyfBO5P3O4wu4B/t/U01fqcHz2Wn+P28G
 /Hm+Kpy0nRMmu2GzJxE9p2j6WjYlR0JoMHO8NJ6k29b1SrNuQ61XoFoppCzWEzdgpXMPEjvDm
 3ioIqcgkMkremmcxgJtplx/32E92X9O4XnNfiYCF7owzUorPXBP25FIU09HQjUmpJO196/U6v
 Ix2EyucQBFgj1UgL/9CTdgchBYaDFUevQPHNQePpiY1opnr63q2Wb/H9Ff47QsF7zXFrsSrLV
 M55ovTRYQa88f4zwxNumwHx2/DeY+Oew925rf8K9GYVypQEiCm7+imenD1bgm6+tuMUaZ8DDK
 /ckysao+VYum0Yv1QzLLEqlq48ByNoy7m5VCqK7Fn3C3pIOaTAPxEX1BWgr+gHUuGYIFkoxcZ
 WALZn+r18IBvIeE6UvSZRBdTSFg9QEOows5JITXhoGFCr2nyP6Fw1gh2/KROee3UNXUc=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
The si_code comes from do_program_check in the kernel source file
arch/powerpc/kernel/traps.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220113170456.1796911-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ppc/cpu_loop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index c5d809916f51..b468f199e4d2 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -181,7 +181,8 @@ void cpu_loop(CPUPPCState *env)
                 }
                 break;
             case POWERPC_EXCP_TRAP:
-                cpu_abort(cs, "Tried to call a TRAP\n");
+                si_signo = TARGET_SIGTRAP;
+                si_code = TARGET_TRAP_BRKPT;
                 break;
             default:
                 /* Should not happen ! */
-- 
2.35.1


