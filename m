Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A193EB60E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:25:14 +0200 (CEST)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXBR-0002H0-EL
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-00060N-VH
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4i-0001Au-Tf
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso9690922wmj.0
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mpfyk7/1xkPWCm67v6Q4b34MWfBO1kqI/kzOqeHhh68=;
 b=mpUHRByNGlwsgFsz6qJ1k9zn6TWNEH5dr9CSJ1aYY7KQwHUK7EC1T1fAf7IHbPJfu/
 bdI6SZgL6LGpTcEjPiwpwWc2de2lMy3gTvzLu1ClMXbu8F+MlSeOLb8XNE0Lc7D1JBRJ
 ddYxixB3vcK7SQQbXKv6Y5guHSbMU1+wR9Vn7G0r8VXcI0DYk+tC0OjLcfMNp8PPhzji
 YA5fVP2GFPRLV5uNQA5JE3IQH6rZC6G7wDmFelGtJ5pzTu7wK0YUtIiWwWhcs3kzxpXo
 grhBbJMEzQw2hlXZkkuz5BbOAH5NrjRKJXy0y7KugOxex3qV86iMjiOCW8+x05wcClYe
 fP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mpfyk7/1xkPWCm67v6Q4b34MWfBO1kqI/kzOqeHhh68=;
 b=MkfjSV0Sb4dY6GHReFh4in7Woz9XVbHDdap4uHrZirSyHMVmggluYXQJwYnYTjEpUy
 YMKEtbeI5tUbo3/yfq8aO+yAPPxgG3hhqCNR7OzuUML4hfW+LIhx/HZV+mU98OCJCphX
 9Iv8jOIJHLD57vGjsx28/YWF94SttDulGE+8Bcd0qHpCNDdBogAn+m/aak1XaHzZ3ws/
 dqfw6+xOu8LplpoxqDr0CrOwPGF+lX1GQ7q9ajtlf/fNfYg2rX5aLMfED92dxa/WM4b8
 6BpuXQE3HolumiPxEJrBESBAqJr0dzuDiUywDLhgfRIoSQ/S93PI6zQX6VPP46BSq5EH
 p/yg==
X-Gm-Message-State: AOAM532Nl5nB+Sx8akiqxUTjCfylwpWmH7cYM7zAU2xvTt8WX28s2b18
 FAQXnE/LplwO7D9Zxs4BVqQUag==
X-Google-Smtp-Source: ABdhPJxwxUrZvEcVXoGNo6VZytA4oZXyEGrp25polZasVvIdosfCNP0zTWv6b8/auROU4mpo13vDfw==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr2646248wmi.77.1628860695706; 
 Fri, 13 Aug 2021 06:18:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 5/7] linux-user: Provide new force_sig_fault() function
Date: Fri, 13 Aug 2021 14:18:07 +0100
Message-Id: <20210813131809.28655-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 linux-user/signal-common.h |  1 +
 linux-user/signal.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index ea86328b289..536c7ac2c20 100644
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
index fd3c6a3e60d..5ea8e4584a7 100644
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
2.20.1


