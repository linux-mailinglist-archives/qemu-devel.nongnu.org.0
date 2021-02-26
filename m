Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D13B326575
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:22:51 +0100 (CET)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFftC-0005nh-As
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfr3-0004Q1-8E
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:37 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfqt-0003lz-IN
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:20:37 -0500
Received: by mail-pf1-x42e.google.com with SMTP id j24so6573299pfi.2
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGhlzn2n59puEvgeyeGF9w2ImBEznNy8+7crWJ3wqH4=;
 b=Sy1e67HRvZr93nZclO/iMk92ZM/MK4T6i50288yM64e19m7AUjbfMUOPn6sxzYl6z7
 /M1TTkjBVnkllqmSlVl0SRG5Oed1nNr7JEFI2EzujdfF0+F4JPkYcoXQ7zIxTfe7v+jY
 kZLO2S6fa0WiS8JD0YwZpxmjsy4ugtAPewM3Ui/Tmi25V8Vtv0jkvJAXH3jjvF3n7Ico
 SILAUvfu/fvOO7DRNlvS67pFaVryiT1dAx6RWLMOc9biFrTeaDstWYhYE5o2rXbje9QX
 DMA8UuZlZ7ejUiS7XCQasyP2wQwOD7lqd7YFw2PVDviSMPqc2QxPFxo3Z63s8Ryt6dLB
 EHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGhlzn2n59puEvgeyeGF9w2ImBEznNy8+7crWJ3wqH4=;
 b=rnmfYjMnQxHST33nq/v+WKvwXkbxBugBjdB/FReHdmwtDvI4KRR8Ug6LVvIfALGHIl
 K0olIqOPl81iLQaiqSVx2bqMTH9DVcdvOscBi+y9CfWdNXAMtSoAKzOwNOlimsC3rRQC
 DcbAz0+DJhXjEkPXsLMifepNRdoBENhfgMUg6OXzTcvejveRj20+FWfxE63Ux0YK4VaS
 O+k8LgmzTz4B6YVNJ2dO6w0MdHXqkTAatiDGkiKKqDrT12JDoKCDCz1ATR99k3zB/xs/
 POxyCguk90pouSOd3eppEISCFIGGOR2LXMnQ989QX+lS5+Rmr29ICboboLhrnmMIoZVH
 DZMA==
X-Gm-Message-State: AOAM530N5KDLRj9utePZwx1MMjpgbPkKMPRLp4nbWrL5bRna+7jJ1XKl
 2MqqSsA35x+0cTV7Xl+uMt6ME0gsFBAskQ==
X-Google-Smtp-Source: ABdhPJx4WjG8owt59MOE9Nx7mOd1irDjAWtzY1rQYvcDZ4H5t5cAi0/KlirRdmBpAc04sj1WyatZZw==
X-Received: by 2002:a63:4662:: with SMTP id v34mr3644017pgk.197.1614356426028; 
 Fri, 26 Feb 2021 08:20:26 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 6sm9141291pgv.70.2021.02.26.08.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:20:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/i386: Split out do_fsave, do_frstor, do_fxsave,
 do_fxrstor
Date: Fri, 26 Feb 2021 08:20:22 -0800
Message-Id: <20210226162022.375654-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226162022.375654-1-richard.henderson@linaro.org>
References: <20210226162022.375654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, philmd@redhat.com, cfontana@suse.de,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_* functions must use GETPC() to unwind from TCG.
The cpu_x86_* functions cannot, and directly calling the
helper_* functions is a bug.  Split out new functions that
perform the work and can be used by both.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


