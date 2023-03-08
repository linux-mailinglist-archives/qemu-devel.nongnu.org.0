Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCB6B095B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtty-0004Xs-CW; Wed, 08 Mar 2023 08:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtrD-0001ql-Pv
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:35 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr3-00069G-66
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:22 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MRnXY-1pykFs3thy-00TF9w; Wed, 08
 Mar 2023 14:29:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 26/28] linux-user/sparc: Handle floating-point exceptions
Date: Wed,  8 Mar 2023 14:28:55 +0100
Message-Id: <20230308132857.161793-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cdCaLCEuPYp6LjNd40NuPkbrygQXunlN85LjOx8UtRkulL4eRbq
 FKWLDDz3DAZGZhlm5QRudExxwxKBjq9lGV+QyeGQMIZoXaPfM8bYtulCyANOuxr+MYNOfN6
 a6Jg9ZIc34/6qyHbP2Ymme4INDwR3SUifVyLfpMsR5jjgsjUL0H4okJYu/RGWj0ivrLdCEK
 zY1Z9e66e/3o71x91LSkA==
UI-OutboundReport: notjunk:1;M01:P0:gKuMY2h/z8M=;gBtJ6krGvV5XDr0qfqEtvX/GGTB
 l4OJ7ROjZ1zZ8+BBjqsi2MMQc+6ZMq32CHMA3lEEgi5T3WtIne9UEKq2MAeLYbxAF1/bYX/Ub
 GMN6sMtR+vVMyy+QaC/JY9K48p+0cr8ryZN1cJw4NrokWx4ehvwlS6nEjZapfxnFB0+fpT4zH
 1YzJbhYrvxInzxdi/PQ3vo+7REfp4/ptEPTmJ7tDX62lP0hRP7X0rN1NtAcqZ9y25iDYifU0C
 /zMTmXgwdn2mpfziWleDCpgT7HK3P2xp+m2it23sRAwuD2u2nxQXhYQpI/ESVmP4pwFLjrbHD
 ZxcVJg4WAx3c7n3m9HoYUcsNd0wEwEBnq5fXWbg8kSPbSW7vei+Hm117OJgsN+AJp0CmO0cbe
 zVDgjh/twz9HPeSDYxoNBopFgBq7cbe9vMPeNe/fB4zhLqe2K6592vKM8V4dMaUF+Fv8+J+ef
 6dlPgVXTYbWPg4UIzIzmLPeaeh3XyDdW1wc2CGMej3pJ8FyIw7O9SnfUoXFPmqa8MWDPDnEY+
 8YTjjt3UAn5l3vlhBO/FN2arNPh9XXzYbnZ+oKZXNlrzr/FWfMeZkSZB6scVzIFXd0PRQgt7m
 jX2rlzcrbW+AZ9up3ZqtZC5yA7xyCBXrYO5aaJCOmHGISXlHMbF198ZG7IKGe7eoJzU/Cdkvy
 c9ff09ZjHaz1NEyvGQvLyhqb/a3Dj+CGd2UxpxwDVw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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


