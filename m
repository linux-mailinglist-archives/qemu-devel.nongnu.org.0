Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1848B7D6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:06:17 +0100 (CET)
Received: from localhost ([::1]:48890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NPM-0004ql-Rm
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCS-0007kI-Eo
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:56 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCQ-0008Ec-Pk
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:56 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MFL8J-1n9I572SBl-00Fii4; Tue, 11
 Jan 2022 20:52:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] linux-user/i386: Split out maybe_handle_vm86_trap
Date: Tue, 11 Jan 2022 20:52:26 +0100
Message-Id: <20220111195247.1737641-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R9iHoMnEGfQmuUnWl2KXPZh35KbD0kuSWfvYTHA7h3qakAa/Xt7
 Hc11LFW87+OiLjqL5ymjxvhTA+YX9Ku/AAMWy5fQxJh3XF84zb54FGtiN1KYekadiYJUNrQ
 f34jMP9goIrf5cbx51HrVwHh+LgLM+2bX7SyuZjCCojPPES6tBzf5l9Y1vZK8xdt7zKi5oW
 P2pCwJfBLISENBQ51H1Rg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OLryeiNVols=:aC5Gfh2Jq7AvcU2WWVRFv0
 Yk+OTUDpGnbzj1aeu8coi7UD4oysA47nV5Uz47hCf6+3mGm3p7/cDCvrjAM0rJzwDnQk0HXwI
 KLCqDkF5ZTWvlDbtU8T7z2GLGz+bbEzN4Ze5ybDx34KeNr2mOuXrC+v3QAc3IZHnf2DWQyBEz
 C3EdBm9Ho59my3R3th1kLSvgo4XwfA8DW08CN3ah4QbjXYwi9KuttdwFxs3xhpDNAs2fWf+gU
 0BLFlQX1lJ6+dg7UujVtg507nPHjYseSlzH54ywVXd8fBT2oudzZ8NRYpnL1U7x5F5dsRPi3B
 2SmqD7rZmbXVwZdvBFBUaJlDUcUh5zKMM2r1MVWd6XMsbKakifrw3hMP16pwO95r9AJGIAjk3
 OLzEEp7iD1gLXGlB6Aozn9tybIYNsKKToxJ9loNWwP9sZgKUu5kjZxuZ1yEj1XaJIgcWkYbOs
 cC1edysjLMEnnJ8fB3DCAwylmiKt9tB8a10U6hJxsybPgDBnG05Z/IjHLzckDKwcSzrcSu4Xf
 DEf4C/dMSbVGx7G82gaRk9HddK4HYPgXmqoh2qRZsyF+cs17Ozk4QyEAfuad9q8bKmUvFfU48
 NnVlZm7XaSg1G1v+sTuYqylEuUaCwZD4TVbBOzt5Wj3BlfieLFI1N1h+yq5qkQ0bYrWTYOTb9
 OnWj7pmWtcsQWAncheuB5YimIvg/4T83MZ7u4b3Z+IuS5FYeNSW/S8YBWeM4aSuQXuVc=
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reduce the number of ifdefs within cpu_loop().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-10-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/cpu_loop.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 9aaae93e2f5c..ac0f4e321111 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -198,6 +198,17 @@ static void emulate_vsyscall(CPUX86State *env)
 }
 #endif
 
+static bool maybe_handle_vm86_trap(CPUX86State *env, int trapnr)
+{
+#ifndef TARGET_X86_64
+    if (env->eflags & VM_MASK) {
+        handle_vm86_trap(env, trapnr);
+        return true;
+    }
+#endif
+    return false;
+}
+
 void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
@@ -259,12 +270,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP0D_GPF:
             /* XXX: potential problem if ABI32 */
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_fault(env);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP0E_PAGE:
@@ -274,22 +282,16 @@ void cpu_loop(CPUX86State *env)
                        env->cr[2]);
             break;
         case EXCP00_DIVZ:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGFPE, TARGET_FPE_INTDIV, env->eip);
             break;
         case EXCP01_DB:
         case EXCP03_INT3:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             if (trapnr == EXCP01_DB) {
                 gen_signal(env, TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->eip);
             } else {
@@ -298,12 +300,9 @@ void cpu_loop(CPUX86State *env)
             break;
         case EXCP04_INTO:
         case EXCP05_BOUND:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
+            if (maybe_handle_vm86_trap(env, trapnr)) {
                 break;
             }
-#endif
             gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
             break;
         case EXCP06_ILLOP:
-- 
2.33.1


