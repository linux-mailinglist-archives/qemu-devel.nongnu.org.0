Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174976BEAF7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAuZ-0006Zj-6s; Fri, 17 Mar 2023 10:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuX-0006Yu-7f; Fri, 17 Mar 2023 10:18:25 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuV-0004w5-JE; Fri, 17 Mar 2023 10:18:24 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MqrwN-1qH8M61Mp7-00mtln; Fri, 17
 Mar 2023 15:18:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/3] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
Date: Fri, 17 Mar 2023 15:18:07 +0100
Message-Id: <20230317141808.826875-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317141808.826875-1-laurent@vivier.eu>
References: <20230317141808.826875-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EIj+NJU9KlUXb/iuch3xmxLd/XK1NveMT1T9/vfq2jXLStFhjLI
 M+iv4e7qBaLdEQNB+r3Uv13b+hHsLnBWtvd2hZMmGJxNMVRGCKdFjvDM+aanHjlac9XPc6X
 IwVN4f2EEd7izCMYhqqIkPS073Scoh3Fal88ORu8XQkEFWNZVSiRcRkpwVAKjlVFbQ13z4b
 YrWpak1x4mgL/pjy6q0Ew==
UI-OutboundReport: notjunk:1;M01:P0:H5mTWCljFz0=;q076jwn0eQy/tNgbQjkMLo2YnW/
 lN89AHm4YeGXEIk142/IgfdI2kB6sQx1P+65/NBKm6LMNkaw/zAYv7qgDLp1c0jlN9DbIS68K
 9HvmKHKlmpCyQIKXuskVfnj4yhBcLigl/Q4iUGmgPvAFdvmhdOdPawebvEQZ5yI+bs3Ark5Vq
 BUrgvuGeEKIFinfh2lXtnj/TP0caFCjkD5Y5WeIt38Q0jA3yGRprGTVeqvvVNceRnnBhVQOI1
 cIkU1UOCLCRmk477EZb0UH4K3cVznKWtnY2rzGJ8Z2EKg96ZKdWpHKghyc9gy8jpbmSDD3FiM
 uq91L1OYlhMDseDvvqHLBLdyjkd4RW1Y9Cd5/gyLjeYX+pNlq52AXk41ULOnsQateOdtoatbe
 VoXZuhsUHg8uY7vSW9L4T5ia6LoVJf1HoQ+8CsFXN8OoHAKDL34Y39DiGAQ1+UAJQPRe33s1x
 DrMuR+TS9h9hk6X+rrGU7m81YxQcQos/EhZlcHEmhPhhHFYkFjH8fq+jJGw0BPwhdkSFFpc4S
 8RouwxkRvqUxvKive0ETmBPlT8+qEUWLuPpny7qSnHD+fZa67Ewb2Iwdc8IHFAtsgXzY2ZxQX
 F6h83z07YYNLAmiIMMJA/+ksW8PGnTH5COIWooVe56ucmEO0wlcw0JpfFW8URt/neUQ4AKnx6
 yH75rLKpFJQenjQoJh9RS2WCg+OgidCQCcVwnlGvJw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
Fix by using qemu_fprintf() instead of qemu_printf() in the respective
places.

Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230316003411.129462-1-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sh4/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 97da8bce488e..6e40d5dd6a1f 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -171,16 +171,16 @@ void superh_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "sgr=0x%08x dbr=0x%08x delayed_pc=0x%08x fpul=0x%08x\n",
                  env->sgr, env->dbr, env->delayed_pc, env->fpul);
     for (i = 0; i < 24; i += 4) {
-        qemu_printf("r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-		    i, env->gregs[i], i + 1, env->gregs[i + 1],
-		    i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
+        qemu_fprintf(f, "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
+                     i, env->gregs[i], i + 1, env->gregs[i + 1],
+                     i + 2, env->gregs[i + 2], i + 3, env->gregs[i + 3]);
     }
     if (env->flags & TB_FLAG_DELAY_SLOT) {
-        qemu_printf("in delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & TB_FLAG_DELAY_SLOT_COND) {
-        qemu_printf("in conditional delay slot (delayed_pc=0x%08x)\n",
-		    env->delayed_pc);
+        qemu_fprintf(f, "in conditional delay slot (delayed_pc=0x%08x)\n",
+                     env->delayed_pc);
     } else if (env->flags & TB_FLAG_DELAY_SLOT_RTE) {
         qemu_fprintf(f, "in rte delay slot (delayed_pc=0x%08x)\n",
                      env->delayed_pc);
-- 
2.39.2


