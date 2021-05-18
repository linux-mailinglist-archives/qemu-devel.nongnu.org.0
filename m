Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FE387175
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:53:15 +0200 (CEST)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisfK-0004C0-9U
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKb-0007IS-PJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:49 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKY-00072y-2h
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:49 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N4Qbu-1lJ8Z73ego-011O5a; Tue, 18
 May 2021 07:31:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 21/59] linux-user/sparc: Fix the stackframe structure
Date: Tue, 18 May 2021 07:30:53 +0200
Message-Id: <20210518053131.87212-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MB8TZn1JvmotdVuY4Vs1YvdS3+Jt2ru8wETuXRzGeOrUASHQa9T
 2LIQQvIEbu2LSdGJu5r7rr2J66/4DybFGU6PWMt5JCQXvRzH4rorfFYfI5UlV4M7+ZdOYUL
 3gchfatSgMArrq+N9MjblS4T7D5W5Occ5ss6d3q56HwZURN1w/44bzTFISFfCT0Z/qdkEvS
 xGR3Tqz5WcLzT9Ot0JY1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C1oN28GB6XY=:6s4HCu6cZy5gAfGSWBdyPK
 5yc61zOSzWlIZ1G0LojMcoh48CdF5OPJcEin2kPBRuyEY2gFhHevjLUyQwntH0+3ynejlzcbQ
 4FGBrPHanIiSXmxzuzRj1vM1L05URVX4HGfOje5GxZoOmB7JSoepwPehSz5ibGwcc1LsnEDgN
 wEioOBROg6CvnDHKmVFU73UF5ksVgSy56ueGsd713CWKnT/AKDr49owmhHqZvA8tEM6EBXUBp
 bMR/0gpMXNAmhL2TSUyaDJDp37Oqrj0r1W6S6DTWBBCn0nqsJmz6+GOLUk6v/HT6yYerdeAa9
 JW2/TOFXxP5DlDNwWws1KWuv9MyuFPlv3WBa/BloVUry3LG9Nt2+eBpZO8Pw1Hav4AmJNcyv5
 GdlwLmpv3mnVDylKGveqEB2nHit6eIvKZeFTNQ1RXeC9Md/RSPafvaWl6uDIYrlDfTd7yErdh
 OpMaN4D1lyCjSgjH64ix+G+PdkGmUvY06/P01OD4aZ4cNpaKh1WJDbNhGpztd4VzuRTtPTvWv
 xhfGRVihmQ9JkdrQGKEJ+4=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move target_reg_window up and use it.  Fold structptr and xxargs
into xargs -- the use of a host pointer was incorrect anyway.
Rename the structure to target_stackf for consistency.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-15-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 29c5e3b0c0be..3474098641a6 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -21,16 +21,26 @@
 #include "signal-common.h"
 #include "linux-user/trace.h"
 
-/* A Sparc stack frame */
-struct sparc_stackf {
+/* A Sparc register window */
+struct target_reg_window {
     abi_ulong locals[8];
     abi_ulong ins[8];
-    /* It's simpler to treat fp and callers_pc as elements of ins[]
-         * since we never need to access them ourselves.
-         */
-    char *structptr;
-    abi_ulong xargs[6];
-    abi_ulong xxargs[1];
+};
+
+/* A Sparc stack frame. */
+struct target_stackf {
+    /*
+     * Since qemu does not reference fp or callers_pc directly,
+     * it's simpler to treat fp and callers_pc as elements of ins[],
+     * and then bundle locals[] and ins[] into reg_window.
+     */
+    struct target_reg_window win;
+    /*
+     * Similarly, bundle structptr and xxargs into xargs[].
+     * This portion of the struct is part of the function call abi,
+     * and belongs to the callee for spilling argument registers.
+     */
+    abi_ulong xargs[8];
 };
 
 typedef struct {
@@ -56,7 +66,7 @@ typedef struct {
 
 
 struct target_signal_frame {
-    struct sparc_stackf ss;
+    struct target_stackf ss;
     __siginfo_t         info;
     abi_ulong           fpu_save;
     uint32_t            insns[2] QEMU_ALIGNED(8);
@@ -150,10 +160,10 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_L0], &sf->ss.locals[i]);
+        __put_user(env->regwptr[i + WREG_L0], &sf->ss.win.locals[i]);
     }
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_I0], &sf->ss.ins[i]);
+        __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
     }
     if (err)
         goto sigsegv;
@@ -349,12 +359,6 @@ struct target_ucontext {
     target_mcontext_t tuc_mcontext;
 };
 
-/* A V9 register window */
-struct target_reg_window {
-    abi_ulong locals[8];
-    abi_ulong ins[8];
-};
-
 /* {set, get}context() needed for 64-bit SparcLinux userland. */
 void sparc64_set_context(CPUSPARCState *env)
 {
-- 
2.31.1


