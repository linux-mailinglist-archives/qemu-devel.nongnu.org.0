Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105B6B53E5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvn-0008Ey-OD; Fri, 10 Mar 2023 17:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-0008CC-Gw
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-00031W-MQ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MSLlu-1pyyr11yZ6-00SeRP; Fri, 10
 Mar 2023 23:09:35 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/28] linux-user/sparc: Tidy syscall trap
Date: Fri, 10 Mar 2023 23:09:13 +0100
Message-Id: <20230310220927.326606-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cV4az+v6TnksWP2sepxsrOEm3GVw2zULcW4XLllXVNMC8MZQQx8
 2Z7SfrSJfvyULyNZTqDI/4z0eyHAFWbZa8C2+RlDRLnyenNexYsfyJceJsQhwrbExidWXIJ
 CRS4g7XVG7o6Bm+swKigGZV31/8ISh28cJWgGaQdR9wi9mWDk/Yb+qTgMoajTAgWD3OKnE/
 maAOIieomHrAD/Hnt2CHw==
UI-OutboundReport: notjunk:1;M01:P0:RxtEefxb2Pc=;mdZ5smiUfc+Tra9V+37J+JWQEZu
 Wntycb9iD/AbHfJKVy5KIjs2wRkpW2uOGHxvO5pW061K7fsBtNjWIpUlGVnnycuyRb1xS3Www
 NTicx6/kn4N6q4jzPE0LUmRKCIS8JZLNfNFpyq02WXYQbb7k4ay2u1GCkxtwTDzgR+34qAnaF
 Zhtm5b9mcXPJ25rlDZIPdFHjNMC1SvMnYFW4lXeYvcQ0eldK0Viy/2iqOvyYUMtLTSWMggnTr
 Ved3RFLW85oE48mrUoANPJwi3IM3Im9YT/Wod+LUBeN3CgSfwVT9CNRKf3eomqM58yZKu0zLl
 2kZCR1ZTpF8bhrdZcLlWYLafUm07HRqtaeCMCAnFb5zywumEqHz3waaEf4W2c1dV4SQbkGU4w
 tbPu7wYlIFXf1/VMeyteykDtnExgQag7FG6t1hUxpnL4HNQHx5KBiZFa+vcnIaPgddsL9dtAU
 bEyoH3Q8sFamJI8wtGihmjtrmn/Br776kh4mKDV1Vb/wqPiFFzcjmHdG00M9trgIDv41cgXlI
 KDT7zJSm+HYXU/nNXGtUg0MgF2Gv7ZhLe8STNzaowMveO6sGwScrXdLrQsrk4W8p0GwVUDrT0
 c6JZLrdBV5FNUyVIV/9Nzrp9yStq16BeQcCJrxP/pFf3gmGd8AiOfUz7HhIyAUSzB0pm4V0ib
 OvVGYeXFga2qHgoaZlxv+MvisM9Cp3e3+ILGN4a9YA==
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

Use TT_TRAP.

For sparc32, 0x88 is the "Slowaris" system call, currently BAD_TRAP
in the kernel's ttable_32.S.  For sparc64, 0x110 is tl0_linux32, the
sparc32 trap, now folded into the TARGET_ABI32 case via TT_TRAP.

For sparc64, there does still exist trap 0x111 as tl0_oldlinux64,
which was replaced by 0x16d as tl0_linux64 in 1998.  Since no one
has noticed, don't bother implementing it now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216054516.1267305-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c120c422786a..d31ea057dba1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,12 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+#ifdef TARGET_ABI32
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
+#else
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x6d) /* tl0_linux64 */
+#endif
+
 void cpu_loop (CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -167,13 +173,7 @@ void cpu_loop (CPUSPARCState *env)
         }
 
         switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x88:
-        case 0x90:
-#else
-        case 0x110:
-        case 0x16d:
-#endif
+        case TARGET_TT_SYSCALL:
             ret = do_syscall (env, env->gregs[1],
                               env->regwptr[0], env->regwptr[1],
                               env->regwptr[2], env->regwptr[3],
-- 
2.39.2


