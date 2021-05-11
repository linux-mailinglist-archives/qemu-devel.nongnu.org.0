Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA837A182
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:16:13 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNYl-0004HF-36
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWi-0001Nt-3a
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWe-0000fB-BA
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnHc5K7SjBy3hljST8HMBanZFxakGZELE1DYlnlUd/0=;
 b=YyydxYxcL6vCsV0Mjk/irBmTxbPreRnSq9Yaz67u3Gaq7wLsZy8Dytv9HWYopb1OnHNyZk
 vMI3D+1SUMjVR8iC2TCNAu6lVNJqc88uEHQDf1UOC/EFyOYfmbjbLo3NT9JAY7fNpqY3g7
 BmePqOgZ2prCmadCLUdPE4hfl0E0w/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-MsKmMzz3M_WmeF4TNtodpA-1; Tue, 11 May 2021 04:13:53 -0400
X-MC-Unique: MsKmMzz3M_WmeF4TNtodpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AEE4107ACF5;
 Tue, 11 May 2021 08:13:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CA285D9E3;
 Tue, 11 May 2021 08:13:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] target/i386: Split out do_fsave, do_frstor, do_fxsave,
 do_fxrstor
Date: Tue, 11 May 2021 04:13:19 -0400
Message-Id: <20210511081350.419428-3-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210322132800.7470-4-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 50 ++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 16 deletions(-)

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
 
-void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
+void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
+{
+    do_fsave(env, ptr, data32, GETPC());
+}
+
+static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
+                      uintptr_t retaddr)
 {
     floatx80 tmp;
     int i;
 
-    do_fldenv(env, ptr, data32, GETPC());
+    do_fldenv(env, ptr, data32, retaddr);
     ptr += (14 << data32);
 
     for (i = 0; i < 8; i++) {
-        tmp = do_fldt(env, ptr, GETPC());
+        tmp = do_fldt(env, ptr, retaddr);
         ST(i) = tmp;
         ptr += 10;
     }
 }
 
+void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
+{
+    do_frstor(env, ptr, data32, GETPC());
+}
+
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



