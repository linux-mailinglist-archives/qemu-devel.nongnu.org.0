Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54173116F3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:22:36 +0100 (CET)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AQt-0000Y8-Sk
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3G-0002iX-SX
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:10 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A39-0003ce-Mw
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:10 -0500
Received: by mail-pg1-x533.google.com with SMTP id o7so5597709pgl.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82rA4NMUeG8/5fEhbWdreaJ+KD3ZEBUxvQx5avkDYFY=;
 b=dH8WQo0AEMkHhpYfM75L0jN5sZXefiPMtCOKehdbFjxLsYTw0c1BaqSALoGvprb7QB
 HUJH7QWCkOOFkCVhyQE7y6dPuVbQyf7gJjWezjL/7gDF53/kYnAtOUINf7dnHp5niobr
 sx8SEd00msNEnExaofzOG1iiPcl/Qg6btaCHgiL39KMwGUr61NeBDkJlF+UABVaLOOjk
 xk71ShVbcmb1vTWjfpcL9/2Gcxcg2DgT+CmU6NaX/2LI2vVJ/tIFmjoMNv1Z4kHwFNPY
 UN/0mlyZdQXo28v2V68QoFi0Ui3HHNKRLpONUexLkpSRUyERUTX69pMyhzozV7DuuMOF
 JFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82rA4NMUeG8/5fEhbWdreaJ+KD3ZEBUxvQx5avkDYFY=;
 b=Is1QugGzk7BD6+xu8CYOCndfDyqNU/gO1wjUXUet+ow9JF6MTTv3N9ZQVbryYfXyHR
 0gHuIh0bk96JEycANyqVWNpE/E6uu6tHGuQlmwB0KDjZ6Edhj7KvShhQWJVS2eAUeHBi
 Vj70OCpW5lGrmM+xDi3OqRmL4WkodycgWGx7o3lBV7E3D/iHAPFFYB3sDAXiTVchbB96
 nP2rPrN82/X1l7VLK5uPfnGeqSIo6eLvFkty1qYJpwTyEW/rNdqL3GmQ3MrCtSVKgQ8n
 8B7EhYJ6k4T2+6ycbKUkrflE/7hTUspZoFQ44U0h1SQGifJU5bc6NBpnyVD1Tt+9Rv8s
 VDEA==
X-Gm-Message-State: AOAM531Bj6WK219OGKVF2UkDYSBPix7WVBrX+EQdskMhz3vHNnrlWwMO
 S0ZErd95o/2iFTgblSa6qVAM1kt3oQ59ChJW
X-Google-Smtp-Source: ABdhPJwunxGvmyqX8DIUshMnCY0SD4JmYMt8f+bmzjsVi5xtZk0Jxq9e59vAV0pFeuuchCwnBIK88w==
X-Received: by 2002:a63:4504:: with SMTP id s4mr6551341pga.284.1612565882132; 
 Fri, 05 Feb 2021 14:58:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:58:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/46] target/arm: do not use cc->do_interrupt for KVM directly
Date: Fri,  5 Feb 2021 12:56:40 -1000
Message-Id: <20210205225650.1330794-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

cc->do_interrupt is in theory a TCG callback used in accel/tcg only,
to prepare the emulated architecture to take an interrupt as defined
in the hardware specifications,

but in reality the _do_interrupt style of functions in targets are
also occasionally reused by KVM to prepare the architecture state in a
similar way where userspace code has identified that it needs to
deliver an exception to the guest.

In the case of ARM, that includes:

1) the vcpu thread got a SIGBUS indicating a memory error,
   and we need to deliver a Synchronous External Abort to the guest to
   let it know about the error.
2) the kernel told us about a debug exception (breakpoint, watchpoint)
   but it is not for one of QEMU's own gdbstub breakpoints/watchpoints
   so it must be a breakpoint the guest itself has set up, therefore
   we need to deliver it to the guest.

So in order to reuse code, the same arm_do_interrupt function is used.
This is all fine, but we need to avoid calling it using the callback
registered in CPUClass, since that one is now TCG-only.

Fortunately this is easily solved by replacing calls to
CPUClass::do_interrupt() with explicit calls to arm_do_interrupt().

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210204163931.7358-9-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++++
 target/arm/kvm64.c  | 6 ++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47e266d7e6..1a64bd748c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9969,6 +9969,10 @@ static void handle_semihosting(CPUState *cs)
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
+ *
+ * Note: this is used for both TCG (as the do_interrupt tcg op),
+ *       and KVM to re-inject guest debug exceptions, and to
+ *       inject a Synchronous-External-Abort.
  */
 void arm_cpu_do_interrupt(CPUState *cs)
 {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3c37fc4fb6..dff85f6db9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -946,7 +946,6 @@ static void kvm_inject_arm_sea(CPUState *c)
 {
     ARMCPU *cpu = ARM_CPU(c);
     CPUARMState *env = &cpu->env;
-    CPUClass *cc = CPU_GET_CLASS(c);
     uint32_t esr;
     bool same_el;
 
@@ -962,7 +961,7 @@ static void kvm_inject_arm_sea(CPUState *c)
 
     env->exception.syndrome = esr;
 
-    cc->do_interrupt(c);
+    arm_cpu_do_interrupt(c);
 }
 
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
@@ -1493,7 +1492,6 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 {
     int hsr_ec = syn_get_ec(debug_exit->hsr);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = &cpu->env;
 
     /* Ensure PC is synchronised */
@@ -1547,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     env->exception.vaddress = debug_exit->far;
     env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
-    cc->do_interrupt(cs);
+    arm_cpu_do_interrupt(cs);
     qemu_mutex_unlock_iothread();
 
     return false;
-- 
2.25.1


