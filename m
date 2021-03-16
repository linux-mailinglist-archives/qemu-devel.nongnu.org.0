Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770F33DCCD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:46:53 +0100 (CET)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEiS-0001wl-25
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMET4-0004jA-AI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:30:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:32936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMESo-0004oM-Gu
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:30:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 575B5AE89;
 Tue, 16 Mar 2021 18:30:38 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v27 02/20] target/i386: Split out do_fsave, do_frstor,
 do_fxsave, do_fxrstor
Date: Tue, 16 Mar 2021 19:30:17 +0100
Message-Id: <20210316183035.9424-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316183035.9424-1-cfontana@suse.de>
References: <20210316183035.9424-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The helper_* functions must use GETPC() to unwind from TCG.
The cpu_x86_* functions cannot, and directly calling the
helper_* functions is a bug.  Split out new functions that
perform the work and can be used by both.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Tested-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/fpu_helper.c | 66 +++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 3d9b192901..20e4d2e715 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2457,17 +2457,18 @@ void helper_fldenv(CPUX86State *env, target_ulong ptr, int data32)
     do_fldenv(env, ptr, data32, GETPC());
 }
 
-void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
+static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
+                     uintptr_t retaddr)
 {
     floatx80 tmp;
     int i;
 
-    do_fstenv(env, ptr, data32, GETPC());
+    do_fstenv(env, ptr, data32, retaddr);
 
     ptr += (14 << data32);
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
-        do_fstt(env, tmp, ptr, GETPC());
+        do_fstt(env, tmp, ptr, retaddr);
         ptr += 10;
     }
 
@@ -2485,30 +2486,41 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
     env->fptags[7] = 1;
 }
 
+void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
+{
+    do_fsave(env, ptr, data32, GETPC());
+}
+
+static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
+                      uintptr_t retaddr)
+{
+    floatx80 tmp;
+    int i;
+
+    do_fldenv(env, ptr, data32, retaddr);
+    ptr += (14 << data32);
+
+    for (i = 0; i < 8; i++) {
+        tmp = do_fldt(env, ptr, retaddr);
+        ST(i) = tmp;
+        ptr += 10;
+    }
+}
+
 void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
 {
-    floatx80 tmp;
-    int i;
-
-    do_fldenv(env, ptr, data32, GETPC());
-    ptr += (14 << data32);
-
-    for (i = 0; i < 8; i++) {
-        tmp = do_fldt(env, ptr, GETPC());
-        ST(i) = tmp;
-        ptr += 10;
-    }
+    do_frstor(env, ptr, data32, GETPC());
 }
 
 #if defined(CONFIG_USER_ONLY)
 void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
 {
-    helper_fsave(env, ptr, data32);
+    do_fsave(env, ptr, data32, 0);
 }
 
 void cpu_x86_frstor(CPUX86State *env, target_ulong ptr, int data32)
 {
-    helper_frstor(env, ptr, data32);
+    do_frstor(env, ptr, data32, 0);
 }
 #endif
 
@@ -2593,10 +2605,8 @@ static void do_xsave_pkru(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     cpu_stq_data_ra(env, ptr, env->pkru, ra);
 }
 
-void helper_fxsave(CPUX86State *env, target_ulong ptr)
+static void do_fxsave(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
-    uintptr_t ra = GETPC();
-
     /* The operand must be 16 byte aligned */
     if (ptr & 0xf) {
         raise_exception_ra(env, EXCP0D_GPF, ra);
@@ -2615,6 +2625,11 @@ void helper_fxsave(CPUX86State *env, target_ulong ptr)
     }
 }
 
+void helper_fxsave(CPUX86State *env, target_ulong ptr)
+{
+    do_fxsave(env, ptr, GETPC());
+}
+
 static uint64_t get_xinuse(CPUX86State *env)
 {
     uint64_t inuse = -1;
@@ -2757,10 +2772,8 @@ static void do_xrstor_pkru(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     env->pkru = cpu_ldq_data_ra(env, ptr, ra);
 }
 
-void helper_fxrstor(CPUX86State *env, target_ulong ptr)
+static void do_fxrstor(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
-    uintptr_t ra = GETPC();
-
     /* The operand must be 16 byte aligned */
     if (ptr & 0xf) {
         raise_exception_ra(env, EXCP0D_GPF, ra);
@@ -2779,15 +2792,20 @@ void helper_fxrstor(CPUX86State *env, target_ulong ptr)
     }
 }
 
+void helper_fxrstor(CPUX86State *env, target_ulong ptr)
+{
+    do_fxrstor(env, ptr, GETPC());
+}
+
 #if defined(CONFIG_USER_ONLY)
 void cpu_x86_fxsave(CPUX86State *env, target_ulong ptr)
 {
-    helper_fxsave(env, ptr);
+    do_fxsave(env, ptr, 0);
 }
 
 void cpu_x86_fxrstor(CPUX86State *env, target_ulong ptr)
 {
-    helper_fxrstor(env, ptr);
+    do_fxrstor(env, ptr, 0);
 }
 #endif
 
-- 
2.26.2


