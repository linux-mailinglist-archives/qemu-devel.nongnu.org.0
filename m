Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAE68AB0E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5v-0005G2-1i; Sat, 04 Feb 2023 11:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5q-0005Ca-9X
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5o-0006x0-A9
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:46 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIxqu-1p449I0CCo-00KOwR; Sat, 04
 Feb 2023 17:08:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 16/22] linux-user: Fix /proc/cpuinfo output for hppa
Date: Sat,  4 Feb 2023 17:08:24 +0100
Message-Id: <20230204160830.193093-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6J504CEHn1Rc8H1oFDl2Q7pG356j0LjPO4dQa0OAbxk6fddwWnd
 aqCddakJB+FyeSbc92DFnQoLpvXit79Fe0IfETmmPBN8wf7cj/YUG/BzdVcY3QgL4lBHRR5
 NeO6+AKanxTP8FOgZWdQkOBQvVWaop2d4YRug01ZyeQ/+CsKzVDzlE9khuzu8E7BW9K7/GT
 mwSMoxlIzF+3lSNZ9WY/w==
UI-OutboundReport: notjunk:1;M01:P0:W19q2aZfjns=;6qemAJC+bAf4EJ3Xlkt06vUfyRi
 QJ/k58Ge5UEQi8CfAUBTtOOV62UQEwn8J/tUfa/tXKx06xyU4O3D0XQp4P6phU0QL8NUTgrJF
 9BGuAqefXro3Sm8fzlCC78a7uZC85zRpgjVMZ7g02ucWI7wuhUpVvM43lGrp3fxzumAXlB84M
 0ny97Pff46tEsS9HPnwLCrZSvE7fcyMtNoXJWRGdT9DtCLxSd/wVs75JxANUBCiPC+cGq/LkA
 hgoH4m7QBYm0aJDQ5/Ax7NREat7abm6On+0dSgsAlta26gMUb1FRYuP0Xne5eDaOiOpJYFoQN
 I4838RfgC5jXEGNps1KcQMfGySIQwgJl1qSpgaoNOqSv7uTWcIiAXugAED4NzRQQqb1IDKSMM
 ph0cmeKz9iPkNRRbp1jOBDMdGxq1piywEcISVT6I6geL2mXN998InugvBGZbad6l7lu2I0FGA
 gs935twcMRr2kWR9Aq79hVU4N0iZqJu4xpqA7z2aYBPg2L4l0EwSOFz+tWgp6v8bGiONJaYhR
 wMbrMtosYvHoUgoupNVKFFLjTYiuyEbk8qWCRlbQEgy4rMIKp/t0W0wGpyOop1M8Gh758Kfi6
 Tuwaxtup9P4o5a4SHNVLQ02V7C/RJlCdpQDktjzxCpCjO07ESzeGhnTxXZDV7/ILX56PnfOLD
 NMW7DHBOQ1tuinXxcYvXEwRLWyznb62e568SNi7Pew==
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

From: Helge Deller <deller@gmx.de>

The hppa architectures provides an own output for the emulated
/proc/cpuinfo file.

Some userspace applications count (even if that's not the recommended
way) the number of lines which start with "processor:" and assume that
this number then reflects the number of online CPUs. Since those 3
architectures don't provide any such line, applications may assume "0"
CPUs.  One such issue can be seen in debian bug report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653

Avoid such issues by adding a "processor:" line for each of the online
CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <Y9QvyRSq1I1k5/JW@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1c42df651801..55d53b344b84 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8232,11 +8232,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_HPPA)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
-    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
-    dprintf(fd, "capabilities\t: os32\n");
-    dprintf(fd, "model\t\t: 9000/778/B160L\n");
-    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "processor\t: %d\n", i);
+        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
+        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
+        dprintf(fd, "capabilities\t: os32\n");
+        dprintf(fd, "model\t\t: 9000/778/B160L - "
+                    "Merlin L2 160 QEMU (9000/778/B160L)\n\n");
+    }
     return 0;
 }
 #endif
-- 
2.39.1


