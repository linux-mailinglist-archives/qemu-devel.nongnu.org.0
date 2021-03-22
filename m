Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654F3445D1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:34:00 +0100 (CET)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKgx-0006E0-Jg
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbI-0000k7-Su
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOKbF-0001f4-FN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:28:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F03DAD74;
 Mon, 22 Mar 2021 13:28:03 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v28 01/23] target/i386: Rename helper_fldt, helper_fstt
Date: Mon, 22 Mar 2021 14:27:38 +0100
Message-Id: <20210322132800.7470-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322132800.7470-1-cfontana@suse.de>
References: <20210322132800.7470-1-cfontana@suse.de>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Change the prefix from "helper" to "do".  The former should be
reserved for those functions that are called from TCG; the latter
is in use within the file already for those functions that are
called from the helper functions, adding a "retaddr" argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Tested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/fpu_helper.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..3d9b192901 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -117,8 +117,7 @@ static inline void fpop(CPUX86State *env)
     env->fpstt = (env->fpstt + 1) & 7;
 }
 
-static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
-                                   uintptr_t retaddr)
+static floatx80 do_fldt(CPUX86State *env, target_ulong ptr, uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -127,8 +126,8 @@ static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
     return temp.d;
 }
 
-static inline void helper_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
-                               uintptr_t retaddr)
+static void do_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
+                    uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -405,14 +404,14 @@ void helper_fldt_ST0(CPUX86State *env, target_ulong ptr)
     int new_fpstt;
 
     new_fpstt = (env->fpstt - 1) & 7;
-    env->fpregs[new_fpstt].d = helper_fldt(env, ptr, GETPC());
+    env->fpregs[new_fpstt].d = do_fldt(env, ptr, GETPC());
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
 }
 
 void helper_fstt_ST0(CPUX86State *env, target_ulong ptr)
 {
-    helper_fstt(env, ST0, ptr, GETPC());
+    do_fstt(env, ST0, ptr, GETPC());
 }
 
 void helper_fpush(CPUX86State *env)
@@ -2468,7 +2467,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
-        helper_fstt(env, tmp, ptr, GETPC());
+        do_fstt(env, tmp, ptr, GETPC());
         ptr += 10;
     }
 
@@ -2495,7 +2494,7 @@ void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
 
     for (i = 0; i < 8; i++) {
-        tmp = helper_fldt(env, ptr, GETPC());
+        tmp = do_fldt(env, ptr, GETPC());
         ST(i) = tmp;
         ptr += 10;
     }
@@ -2539,7 +2538,7 @@ static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
         floatx80 tmp = ST(i);
-        helper_fstt(env, tmp, addr, ra);
+        do_fstt(env, tmp, addr, ra);
         addr += 16;
     }
 }
@@ -2703,7 +2702,7 @@ static void do_xrstor_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
-        floatx80 tmp = helper_fldt(env, addr, ra);
+        floatx80 tmp = do_fldt(env, addr, ra);
         ST(i) = tmp;
         addr += 16;
     }
-- 
2.26.2


