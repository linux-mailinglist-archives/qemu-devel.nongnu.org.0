Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D1387187
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:58:46 +0200 (CEST)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liskf-00078f-Bb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKd-0007MV-4L
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:51 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKZ-00073e-Ay
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:50 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4ahC-1ljQpT0i1O-001kxe; Tue, 18
 May 2021 07:31:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 24/59] linux-user/sparc: Clean up get_sigframe
Date: Tue, 18 May 2021 07:30:56 +0200
Message-Id: <20210518053131.87212-25-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y23eJeByVcdaXufsDKSY7vQTyD+/2j5XrkjWQfjC4Cw6M1UUwj7
 02O84q1LlQDwiwsgq9ic0Hx9P1e7apeLMO4s7PJB/fpKN94p2WJpZElxMLxDQY1ZzereVlo
 83w94LfeXNmRNxO7W/xvEuGDnwbaILGQkwR/INu1ZSQXx1LjrIVs5BbUUkKZa9ZVcmtH+eW
 32MZgEbrmmBZpVt77Go9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6s7TOdQVoIs=:duT049otYUhQKW2QHHqqpE
 /1PtXM/U1AVCUtyAl24dCG7EzoRpqAQLsX37D5ZXviFhXW8UgBDFImJP7tyfy3Fnk0qu1lmUP
 9HojYkBk+c3SNpwQT6967FUZCgBbmzqIAhT+9PzNWgYP7/cf6lvC3Y6w270MDv4YkDUizIcVN
 VLpFecs7gPZ4P0I+7Hs4JmBViQpuMGS2D8IYbblRMH7BdXJVVw6rUpCrLsYwMtVMRb1jAcjyO
 DXxHR5Nrj2zQ5CFn3QTNqvw0z7u7Rls7mamojKTGHzHphzIpZs7NtTA7qeHcb3M/MgyqKn/+t
 HeZllctPg4ju8niE45c/tCGQ1FrhDjfWCeV4GdeMOb2QJeuqPJlg44NFG5C5VwDbuwWOuJAP/
 F+6hPThqqoye9/5DmBzPn6fht/ZiUo51GGCkHuGpSqMgsDI2/W/COLuXaV0iVCStFXYdzCtLV
 ic1QGiTTZsdQeUCinHdvARRU7ijHkiHKoG33C1sumVFoBX86PV9J/FfGOH9/jiLS3QZvfyfIk
 TImgco3EmrLj2/NMHd3r8w=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove inline; fix spacing and comment format.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-18-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 69fee5a76a8b..57dbc72c9949 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -65,24 +65,25 @@ struct target_signal_frame {
     qemu_siginfo_fpu_t fpu_state;
 };
 
-static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
-                                     CPUSPARCState *env,
-                                     unsigned long framesize)
+static abi_ulong get_sigframe(struct target_sigaction *sa,
+                              CPUSPARCState *env,
+                              size_t framesize)
 {
     abi_ulong sp = get_sp_from_cpustate(env);
 
     /*
      * If we are on the alternate signal stack and would overflow it, don't.
      * Return an always-bogus address instead so we will die with SIGSEGV.
-         */
+     */
     if (on_sig_stack(sp) && !likely(on_sig_stack(sp - framesize))) {
-            return -1;
+        return -1;
     }
 
     /* This is the X/Open sanctioned signal stack switching.  */
     sp = target_sigsp(sp, sa) - framesize;
 
-    /* Always align the stack frame.  This handles two cases.  First,
+    /*
+     * Always align the stack frame.  This handles two cases.  First,
      * sigaltstack need not be mindful of platform specific stack
      * alignment.  Second, if we took this signal because the stack
      * is not aligned properly, we'd like to take the signal cleanly
-- 
2.31.1


