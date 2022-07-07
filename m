Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C556AC2B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:49:18 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9XUz-0002sr-Bx
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1o9XR8-0000af-6x
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:45:18 -0400
Received: from mout.gmx.net ([212.227.15.19]:33185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1o9XR6-0004lT-H0
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1657223103;
 bh=sUgEt7NqMVHa/clUS2/sZFOTZ5VURvEV1QtcjoUQ3KA=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=XFc3BT35IA7mLrSWkjh1wnQQRgIzWL0mesixfUX38FRxviriFR9N+Oyr22rxeXQ8h
 l9O1qeKCqmlaPQh+Oi70lIw44hdQzij0KxUSiOxTqWx3liwU4MgR9KuSKBVOcMEqGL
 RmDH+nNLQvsZqkbjR3qwLukbqJXqkPM/HLoBH3SA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.141.48]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU9Z-1ne21s2fvn-00ecGF; Thu, 07
 Jul 2022 21:45:03 +0200
Date: Thu, 7 Jul 2022 21:45:01 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: [PATCH] linux-user/hppa: Fix segfaults on page zero
Message-ID: <Ysc3vc0T+qfjiyKo@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:YT9mMpdZbDYf+fhgSYMd1VicVfaMbd02dQKlDXL2ucz9qpVSlSB
 G2hKDpN5zaDnHNetfmqQ6cPVWdjOD4DgG/3xSi93MpYNBg1k6IdXzFrmqxb19b/EH3opoz/
 5gEk4H5Dzm2qHRHVkA/xzNzjFJsk+XcGeojoQTLyyWxQXp5uMUVRhzSmgrESxIRuVl029Qn
 0aT6GvZnrO8MBbucAFaAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zqKCV1zjkOY=:lLq0Qp6+K5vcskWh6Oi4eu
 ZwmYn00Iceh65Hn6UFCl9DXDxzEzbvxOxPlaY7BTRdwle/BsPr9MORSVhUKpiK7lVuKPfZlzu
 Y4CxaHUGP6N0Jupn+ja/q4/x+HcaJE8I8kSOiKvsHw0bkyltCXvX2mwQnb9grJpTyS2k/sTEr
 W6iEtpppDj6Id4u6fZQN7rLGlehbCkdVObR+Typoi5biFWum2c5Wd0dru7vrjxGfDEy5+okNH
 fi2IyKHhExahUwqUGVTJT3Jxf2VVVzYjScuUu+zKvKZdKqs3V64rQm6dgN1gffmU5uOYoITQL
 zBPMmj3LqQgbQlSaZuhCsN99IdkKs8YK1Y/P2KVxTBlPa7YamGYeA2XYQk0kS2pYq4ipLe70q
 ltHGwzzLmCjvsdtoUSrIP4YBVDpjNzdwjk/MtsVLCjvwbllr5d7RwQHktuonSALI+bZwD1Hye
 5ArK92YpF53nj+ezsCDPpf/WnwEpiNuW/Cu5LqkXniK54YucwRiA6axOKLcbscmJaN5i/CjMu
 QsNrYjvkm/GPlr5cs/0/EEmrXOHgXeF2s5fa/exRSZBiQYrd+mwUD/LlzeFT98H+aoL959IL4
 QqI5W6aLLPm6a+UFaVNT2HQF3pNBlYIhyfCRS8HayiExk1WJXgvrlHNqY8JOxqd1HAY0ZmiIq
 VqNTuJNcbmYGNLVpwlEGCFx1XR6fA3fIZoG7YFfnXbApvxb/sFQxwCj1wiINojeXUgDsRZHYz
 /AbFpWM+VhdGG5bR1uZyiRreQaiTyiAsneq/lG/ThJmuaHRVoxb1IHTSVReiMNXniWfFJZ7cZ
 DIAynlt1P/mGkH9tArl15l9+X0ggYATlvdGnVU6Wzuic2jdsdys96fd4mZruQryEnDxfPtyjM
 LfoJieSOqDZa31bebnls897yhV9Ocs0zEghv9F9rYQ1iPGo9nWapjbvZtxeGwrAqDPH/Lhktm
 D4AOG26veTxyY9K2BdJioF0o8ZhtAQnFEDcakwK/ZGjpkEeVMz7t6hY/12BS9lhXeFFIl3q19
 sWyzTJqrmsJ7WTbk12VvEPQLTVmcrvgMmtS5I+tq+YBpF4WhezxbH00TbhSeVJFSZdtubrZ+g
 TEMfOLSyqs+Jkj7gB+6KfyhsS5LkrCwCa6Pex3mXmKTEFZBUV6bcrDAgg==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This program:

    int main(void) { asm("bv %r0(%r0)"); return 0; }

produces on real hardware the expected segfault:

--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
+++ killed by SIGSEGV +++
Segmentation fault

But when run on linux-user you get instead internal qemu errors:

ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)

Fix it by adding the missing case for the EXCP_IMP trap in
cpu_loop() and raise a segfault.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a576d1a249..8f374aeef6 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -143,6 +143,9 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
+        case EXCP_IMP:
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
+            break;
         case EXCP_ILL:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;

