Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D148DCB5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:13:09 +0100 (CET)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83eu-0001SG-BP
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:13:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n83XN-0004oM-AE; Thu, 13 Jan 2022 12:05:21 -0500
Received: from [201.28.113.2] (port=33800 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n83XL-0006PO-6z; Thu, 13 Jan 2022 12:05:20 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 13 Jan 2022 14:05:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C99B6800134;
 Thu, 13 Jan 2022 14:05:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 2/3] tests/tcg/ppc64le: change signal_save_restore_xer to
 use SIGTRAP
Date: Thu, 13 Jan 2022 14:04:55 -0300
Message-Id: <20220113170456.1796911-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jan 2022 17:05:06.0164 (UTC)
 FILETIME=[B6791340:01D8089F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 groug@kaod.org, clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Now that linux-user delivers the signal on tw, we can change
signal_save_restore_xer to use SIGTRAP instead of SIGILL.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64le/signal_save_restore_xer.c
index e4f8a07dd7..9227f4f455 100644
--- a/tests/tcg/ppc64le/signal_save_restore_xer.c
+++ b/tests/tcg/ppc64le/signal_save_restore_xer.c
@@ -11,7 +11,7 @@
 
 uint64_t saved;
 
-void sigill_handler(int sig, siginfo_t *si, void *ucontext)
+void sigtrap_handler(int sig, siginfo_t *si, void *ucontext)
 {
     ucontext_t *uc = ucontext;
     uc->uc_mcontext.regs->nip += 4;
@@ -23,14 +23,14 @@ int main(void)
 {
     uint64_t initial = XER_CA | XER_CA32, restored;
     struct sigaction sa = {
-        .sa_sigaction = sigill_handler,
+        .sa_sigaction = sigtrap_handler,
         .sa_flags = SA_SIGINFO
     };
 
-    sigaction(SIGILL, &sa, NULL);
+    sigaction(SIGTRAP, &sa, NULL);
 
     asm("mtspr 1, %1\n\t"
-        ".long 0x0\n\t"
+        "trap\n\t"
         "mfspr %0, 1\n\t"
         : "=r" (restored)
         : "r" (initial));
-- 
2.25.1


