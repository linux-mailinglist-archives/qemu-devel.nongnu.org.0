Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B8608032
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:49:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxSh-0006Hh-Am; Fri, 21 Oct 2022 15:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvPA-0004OG-4n; Fri, 21 Oct 2022 13:01:56 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1olvOw-0002Fr-Tk; Fri, 21 Oct 2022 13:01:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 21 Oct 2022 14:01:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3B8CB80020E;
 Fri, 21 Oct 2022 14:01:33 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 1/3] accel/tcg: Add a quicker check for breakpoints
Date: Fri, 21 Oct 2022 14:01:10 -0300
Message-Id: <20221021170112.151393-2-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Oct 2022 17:01:33.0736 (UTC)
 FILETIME=[C5EEE280:01D8E56E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
considerable amount of time was being spent in
check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
amd64), even though it was just checking that its queue was empty
and returning, when no breakpoints were set. It turns out this
function is not inlined by the compiler and it's always called by
helper_lookup_tb_ptr(), one of the most called functions.

By moving the check for empty queue to the have_breakpoints()
macro and calling check_for_breakpoints() only when it returns
true, it's possible to avoid the call overhead. An improvement of
about 3% in total time was measured on POWER9.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 accel/tcg/cpu-exec.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f9e5cc9ba0..9eec01ad9a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -304,16 +304,15 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
     }
 }
 
+#define have_breakpoints(cpu)   (likely(QTAILQ_EMPTY(&(cpu)->breakpoints)) ? \
+                                 false : true)
+
 static bool check_for_breakpoints(CPUState *cpu, target_ulong pc,
                                   uint32_t *cflags)
 {
     CPUBreakpoint *bp;
     bool match_page = false;
 
-    if (likely(QTAILQ_EMPTY(&cpu->breakpoints))) {
-        return false;
-    }
-
     /*
      * Singlestep overrides breakpoints.
      * This requirement is visible in the record-replay tests, where
@@ -392,7 +391,8 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
     cflags = curr_cflags(cpu);
-    if (check_for_breakpoints(cpu, pc, &cflags)) {
+
+    if (have_breakpoints(cpu) && check_for_breakpoints(cpu, pc, &cflags)) {
         cpu_loop_exit(cpu);
     }
 
@@ -990,7 +990,8 @@ int cpu_exec(CPUState *cpu)
                 cpu->cflags_next_tb = -1;
             }
 
-            if (check_for_breakpoints(cpu, pc, &cflags)) {
+            if (have_breakpoints(cpu) &&
+                check_for_breakpoints(cpu, pc, &cflags)) {
                 break;
             }
 
-- 
2.25.1


