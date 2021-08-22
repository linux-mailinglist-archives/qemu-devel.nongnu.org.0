Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2C3F3D59
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:57:30 +0200 (CEST)
Received: from localhost ([::1]:41424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHebx-00027a-GF
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaI-0007jb-2V
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:46 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaF-0000aT-Hb
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:45 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 7so12293899pfl.10
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=979JNGT4wJobTC0t4pJ3IOQQyDJEP0/xlu4yVxqsbGA=;
 b=sXIQlFWXzLiSGVi1spYyK05n9F/FbpM+1VGYghNS1BTmETFZcZSldOC9MNjoKyIOM6
 9Mp1HZ7cJxidGiDSHi+lUcKusX0VA6dl8zhUFR6mnxSJpAE2cQIOmLAzxeqMKhSfo1od
 JC6oyjniG1qBgXjEMLGZMCqBTKk3XS/lPZjPwKFHo0ngPDMIy/oBchGCx/vgqFyrJyUC
 UOxDTAxIADVSzWEEuyX+j6SjCcv7f9zvEUUJIUW0TwahgRDqvJcYftQckuuzSkf4RkB2
 Rx+CoTQTkveKXe0EncT6MPATlbETFTiiOSiOlQ55QIcLCZJxkIMKjdZQmE9g8PkGa8Hq
 Bj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=979JNGT4wJobTC0t4pJ3IOQQyDJEP0/xlu4yVxqsbGA=;
 b=RHe7bSm+btPU2iFkO2o4LDUZovVGKmG8Xk+TGol/ieUmaYVVPJgI6RNbfe/3w7wp9w
 ZbhK5W7MVMQOqzimcYX7i3k2um+TXraXzcFEOa4e8UbEfC+i933TvGxGtC57xTULWIf4
 j0F5Sy2ebGXn0iM8YxPlhuar+K/svDAepf2DeR3JClT7SFd2qYaccxXiPoSykVNQzix0
 SFOB127LlN7A8RTQv66+Pw4l/snNF6NFELzZJQCTt+h563dsz4yDwJNn4KvuRDb0+bU3
 PVWvo0DkJ/zs19aSGLMXXiivkyYqGDtKUQOulHdLqrs4M0NbHLIlGwFp56YDBWtB5bz/
 Z4IA==
X-Gm-Message-State: AOAM532Ehd147mrJjUphKYMcSsquuI+6J0/FAI/Y2CrRabpNWJ9MIej7
 vJ6K8xWEmpu0NStqADOA/uymny5x4V48dQ==
X-Google-Smtp-Source: ABdhPJyIVhfS8WPv06uOwq8+p15g0aFUJFJrfqXYqaCSvHj+kMzISFRHVL/nhH3MRQse2/AH9KTQTg==
X-Received: by 2002:a63:b91d:: with SMTP id z29mr25949433pge.436.1629604542211; 
 Sat, 21 Aug 2021 20:55:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/30] linux-user: Provide new force_sig_fault() function
Date: Sat, 21 Aug 2021 20:55:12 -0700
Message-Id: <20210822035537.283193-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In many places in the linux-user code we need to queue a signal for
the guest using the QEMU_SI_FAULT si_type.  This requires that the
caller sets up and passes us a target_siginfo, including setting the
appropriate part of the _sifields union for the si_type. In a number
of places the code forgets to set the _sifields union field.

Provide a new force_sig_fault() function, which does the same thing
as the Linux kernel function of that name -- it takes the signal
number, the si_code value and the address to use in
_sifields._sigfault, and assembles the target_siginfo itself.  This
makes the callsites simpler and means it's harder to forget to pass
in an address value.

We follow force_sig() and the kernel's force_sig_fault() in not
requiring the caller to pass in the CPU pointer but always acting
on the CPU of the current thread.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210813131809.28655-6-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal-common.h |  1 +
 linux-user/signal.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index ea86328b28..536c7ac2c2 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -40,6 +40,7 @@ void tswap_siginfo(target_siginfo_t *tinfo,
 void set_sigmask(const sigset_t *set);
 void force_sig(int sig);
 void force_sigsegv(int oldsig);
+void force_sig_fault(int sig, int code, abi_ulong addr);
 #if defined(TARGET_ARCH_HAS_SETUP_FRAME)
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUArchState *env);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index fd3c6a3e60..5ea8e4584a 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -646,6 +646,23 @@ void force_sig(int sig)
     queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
 }
 
+/*
+ * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
+ * 'force' part is handled in process_pending_signals().
+ */
+void force_sig_fault(int sig, int code, abi_ulong addr)
+{
+    CPUState *cpu = thread_cpu;
+    CPUArchState *env = cpu->env_ptr;
+    target_siginfo_t info = {};
+
+    info.si_signo = sig;
+    info.si_errno = 0;
+    info.si_code = code;
+    info._sifields._sigfault._addr = addr;
+    queue_signal(env, sig, QEMU_SI_FAULT, &info);
+}
+
 /* Force a SIGSEGV if we couldn't write to memory trying to set
  * up the signal frame. oldsig is the signal we were trying to handle
  * at the point of failure.
-- 
2.25.1


