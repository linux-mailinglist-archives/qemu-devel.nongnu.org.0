Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A46B53F3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvt-0008JH-5V; Fri, 10 Mar 2023 17:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvp-0008Gq-31
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:45 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvn-00034M-4x
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:44 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MvKGv-1qRD3k0ter-00rET9; Fri, 10
 Mar 2023 23:09:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 26/28] linux-user/sparc: Handle floating-point exceptions
Date: Fri, 10 Mar 2023 23:09:25 +0100
Message-Id: <20230310220927.326606-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4P9Zsn7G8HSfHDsvdt0KtNizKfMoOCm/eELvFsgqzdfKLA5o1tg
 Ir5k8FDWW8vRgIEQxdT3grF5Q40hUyvir+wrWCVO2DUEl/Ml9EUHGYcmgR9eTZemVriZU0x
 3iAF+fEcA5LjebEWODkbkyvZWG2W40uAEBjTAbVW4E9de/AWATdaiObMH1jCMQqhr8OUIhS
 6ZbSVYPhecQwdzkQAuKkA==
UI-OutboundReport: notjunk:1;M01:P0:T2yJJb6gBZg=;fOqjSSzcPA0hnDQqZUY3FYNbwvS
 SaC8GvjHFs61FHeXh+EYovzAqcet0VlG+FqRY8ySRbJYO/yGuH8T0kNfcTOU62gHuldjhqTZv
 0Sb4ymrjmJUMcTLumv8oE8d5KHqNiWTmwpChfpqtG5YUdYhyO1QQJMD+FFOEwHUmkfh2I9MnS
 xUDUTWwtSgapDX04/5vxuYBYzQU/GqXl1qm/gmzeNozIPwgK4z+pg5cEMQ8P0AVlXFu2CgGjo
 o6Rsko4CnDmPORyiMzIBR2dwaVTL6bNt93ATwUl7RETtCUCWVNw+RkbKyUYNKtzns+aGTWxyZ
 UGHuKxZklVKGKLNEP85AkNmR1rCKSluSyEepNZk2ub+6CIyQSvIzEwnLGnT+J0fO3WhIjgGeB
 per3Y7P/ZOSRTsIs66zKAdxRtn3q0QVAvLNDpzRTF1AiIfMWNxKKThhZXO29VPvaxQfIIjSsK
 H4/HlnhLBeWPGb1vj8zs/GDFj8q2b9d1ej5sMzhoAq+ZICd6MEjVFMRFugljSTjG3wFGw75Zm
 s4TEoTYz0p2bUaPgywD9TErByC//80A6YFnxq+KIyUw/xyZzhcJXtoO1VjwnbGLr5xXiy0SmE
 X4NF96hQ72gTpYnz0dH5y0MXBuwVDgW5wnlYUa6JxXRvW//wmmw0hY614WDYoAW5Q9V8ObUi8
 B45MHw5zZ3bmFlX8Prg3Av4dNEcpo7ZSwuYBD0lrmQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Raise SIGFPE for ieee exceptions.

The other types, such as FSR_FTT_UNIMPFPOP, should not appear,
because we enable normal emulation of missing insns at the
start of sparc_cpu_realizefn().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230216054516.1267305-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 22 ++++++++++++++++++++++
 target/sparc/cpu.h          |  3 +--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 093358a39a4a..5a8a71e976bc 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -297,6 +297,28 @@ void cpu_loop (CPUSPARCState *env)
             restore_window(env);
             break;
 
+        case TT_FP_EXCP:
+            {
+                int code = TARGET_FPE_FLTUNK;
+                target_ulong fsr = env->fsr;
+
+                if ((fsr & FSR_FTT_MASK) == FSR_FTT_IEEE_EXCP) {
+                    if (fsr & FSR_NVC) {
+                        code = TARGET_FPE_FLTINV;
+                    } else if (fsr & FSR_OFC) {
+                        code = TARGET_FPE_FLTOVF;
+                    } else if (fsr & FSR_UFC) {
+                        code = TARGET_FPE_FLTUND;
+                    } else if (fsr & FSR_DZC) {
+                        code = TARGET_FPE_FLTDIV;
+                    } else if (fsr & FSR_NXC) {
+                        code = TARGET_FPE_FLTRES;
+                    }
+                }
+                force_sig_fault(TARGET_SIGFPE, code, env->pc);
+            }
+            break;
+
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ed0069d0b196..fb98843dad53 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -197,8 +197,7 @@ enum {
 #define FSR_FTT2   (1ULL << 16)
 #define FSR_FTT1   (1ULL << 15)
 #define FSR_FTT0   (1ULL << 14)
-//gcc warns about constant overflow for ~FSR_FTT_MASK
-//#define FSR_FTT_MASK (FSR_FTT2 | FSR_FTT1 | FSR_FTT0)
+#define FSR_FTT_MASK (FSR_FTT2 | FSR_FTT1 | FSR_FTT0)
 #ifdef TARGET_SPARC64
 #define FSR_FTT_NMASK      0xfffffffffffe3fffULL
 #define FSR_FTT_CEXC_NMASK 0xfffffffffffe3fe0ULL
-- 
2.39.2


