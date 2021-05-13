Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CE37F7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:23:48 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhANX-0000Wb-9B
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK8-00061w-Ok
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:17 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK6-0001GX-Dq
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:16 -0400
Received: by mail-qt1-x82b.google.com with SMTP id t20so15258120qtx.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBNO43ndtkHe3HspPtwZPAlVXKJsSD5gwavNah1YJ6o=;
 b=odounVDkwM9Wwv/e7AgnKS82o6mwKSBFVzddxEYLB9dZ9q4KYU/ihykOsqxmUY1ITY
 nzum+FoYtYmsQE+tlPp/McYAG/SeKyiYIgRWIxEx3hX8y7iuOCM9dQjANat34ZX/MUss
 WCy0sp4RQI/k7ToMWi26lBhNfZbJvpLc/rYTVKmvQAMCSZzCV7KDP75zoQ8WB7jCtflW
 X1DMLawJXPJO1FTUI/hP1HxDts58vgaS5mmMXC9TW1jnGoflfq/9rfOT28BheHiXu+Zm
 GpUI4oVqI74qzxwwJQ0kvWfn7u8Exv+5iuXFNcN0BJ5GJD2Dr70vXY0vwqMPyE7kbbmh
 RReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBNO43ndtkHe3HspPtwZPAlVXKJsSD5gwavNah1YJ6o=;
 b=UrJbrwC1dr/XERRng016JCG6ui19fjO5MMXf1u14AvmOimZtnyn+Pggdq8k2cLUtgD
 tUVSWFZHbjseCARHYepZyGObwXGBsYLu1zoTka0NjIpiIFL9s9r3VQTQIOC6vnmUaKQo
 /o6i2ZCgDyddgqj3Bxypfrscx7I92KMY5llpl5OWCWr4TZdyAPeJXBLMBeX3zZDVeb87
 p0Xj2gvVVkwaamOyJjn9Opi2zGzIp0HBnECip4cWLY4RCyCirsPnPvzFM3dz6NkCAwwC
 3dTfhDMmb6PkZz+IHdZvNRDgrKxrHmi51s3h98VtdcJPNLtcalENllwNiibrFyt/enXd
 7CyA==
X-Gm-Message-State: AOAM533wstIS7YaqYPRWqSoUjT5ZJp8zloWaidQ+16WM0IRhtI0peTON
 jTZZf7/EjABggx+pa32A8Jji7US5Cuu2hEBLr+4=
X-Google-Smtp-Source: ABdhPJxZur472MJCmYxcBAzb8YvKPijFuU30reodLcDXaCXyFMlU+MdLBRVB+Tn17W0her05TburWg==
X-Received: by 2002:a05:622a:138c:: with SMTP id
 o12mr39155299qtk.190.1620908413319; 
 Thu, 13 May 2021 05:20:13 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b3sm847262qtg.55.2021.05.13.05.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:20:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] tcg: Use correct trap number for page faults on *BSD
 systems
Date: Thu, 13 May 2021 07:20:07 -0500
Message-Id: <20210513122008.207491-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513122008.207491-1-richard.henderson@linaro.org>
References: <20210513122008.207491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: peter.maydell@linaro.org, Mark Johnston <markj@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Juergen Lock <nox@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
used by Linux and represents the intel hardware trap vector. The BSD kernels,
however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
handlers. This is true for i386 and x86_64, though the name of the trap hanlder
can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it instead to
avoid uglier ifdefs.

Signed-off-by: Mark Johnston <markj@FreeBSD.org>
Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[ Rework to avoid ifdefs and expand it to i386 ]
Signed-off-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210506173826.72832-1-imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fb2d43e6a9..d2acf6e82c 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -259,6 +259,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -266,16 +267,19 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 #define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #elif defined(__OpenBSD__)
 #define EIP_sig(context)     ((context)->sc_eip)
 #define TRAP_sig(context)    ((context)->sc_trapno)
 #define ERROR_sig(context)   ((context)->sc_err)
 #define MASK_sig(context)    ((context)->sc_mask)
+#define PAGE_FAULT_TRAP      T_PAGEFLT
 #else
 #define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
 #define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)    ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP      0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -301,7 +305,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = EIP_sig(uc);
     trapno = TRAP_sig(uc);
     return handle_cpu_signal(pc, info,
-                             trapno == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             trapno == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
@@ -312,11 +317,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 #define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__OpenBSD__)
 #define PC_sig(context)       ((context)->sc_rip)
 #define TRAP_sig(context)     ((context)->sc_trapno)
 #define ERROR_sig(context)    ((context)->sc_err)
 #define MASK_sig(context)     ((context)->sc_mask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #elif defined(__FreeBSD__) || defined(__DragonFly__)
 #include <ucontext.h>
 
@@ -324,11 +331,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 #define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
 #define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       T_PAGEFLT
 #else
 #define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
 #define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
 #define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
 #define MASK_sig(context)     ((context)->uc_sigmask)
+#define PAGE_FAULT_TRAP       0xe
 #endif
 
 int cpu_signal_handler(int host_signum, void *pinfo,
@@ -346,7 +355,8 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.25.1


