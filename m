Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB96DE202
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHVx-0003q0-H2; Tue, 11 Apr 2023 13:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVj-0003oo-H6
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:27 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVh-00066J-7o
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:27 -0400
Received: by mail-io1-xd32.google.com with SMTP id e22so172715ioc.13
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT5fLQSNvwvtBf2Szoe2FViWNomI0FmkPHfn6pZOtis=;
 b=AEmtNKKrq0fcvck5DLkfczuUrLmnkbeU0w7ZC1Yr3p3wpbL5kk+I4Y4ow4E30V86ob
 /h2leh2vcvCTT4hQhUeFyvSOdo2NugLUTseBiQhwnMBcJZmFEeuTxzTRAN+R+Pcd/nkF
 PQMTsMYa9k4OcX6f9eM8ci2nAVnCtAgno1wLHuECnjUyjp07SzP+FfwpgfpD4x/qHGoH
 m9lZJxENA+114wRK1ymILP2YGZgGalG0wbHOq2KxPt1UvGupO82IB1JRYoi+cwG/reRe
 zCA1A++XbNruLFhsXrSBgOSGpzGIoHyIMjy23k0wzUrVZoyTQ40b1TjV4lRuo1uc7Dy+
 0z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZT5fLQSNvwvtBf2Szoe2FViWNomI0FmkPHfn6pZOtis=;
 b=DUEMws+wdb0mSDPEcBgt88q/mdRH2TstuxD8eAZxG1paq1EEu2yGoPe2pqsj3D+NlL
 npwB2LaZPIxHzjIsRIJUjxtzfWYKv0iGn3M8qimBD7ioIOXUYcdOSH2JiZIJNavxhA3k
 G6xPoQAGx8bgSX0r7ZgwwUXru72k/ky7mPT6tWjIvb/lxh1JZiwYDVumEVC1WuVXfZTl
 h9SVPmCREkdX3AgUd8WtrJi0n+z+Aa26ztj+Gsrf4Q3E2HuhCQ43nnV7xQwWljU8SuXa
 CFLgVw1K6mY/oRP4ob1fc4bQe+58384E7Jc2A+yHIbLMYWUw7ro5HJHEl4KiCOAzUlF+
 hy3g==
X-Gm-Message-State: AAQBX9dujkbt/7do/oW7kGlE2rsYLPiV/IDZFgAySDbsZMEi0p5FF8QU
 v4HVCFVpE6EzQA7a47JtIeTqwyipR3Tctzp3fWE=
X-Google-Smtp-Source: AKy350Y9605LtOxSyiorYWDkk03/dhtILlruYIF9mTmlPIC/F/VdG6Jvd4p6NdknOZBam6jvAR/qFg==
X-Received: by 2002:a6b:f402:0:b0:74e:6f06:d5f5 with SMTP id
 i2-20020a6bf402000000b0074e6f06d5f5mr1940646iog.8.1681233023042; 
 Tue, 11 Apr 2023 10:10:23 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/20] bsd-user: Make print_* public
Date: Tue, 11 Apr 2023 11:09:36 -0600
Message-Id: <20230411170955.17358-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Make these functions public. Due to coming restructuring, we'll need to
call these from *bsd/os-syscall.c. Add declarations to qemu.h.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   | 20 ++++++++++++++++++++
 bsd-user/strace.c | 29 +++++++++++++----------------
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 41d84e0b81b..22e16816a9e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -211,6 +211,26 @@ print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
                       abi_long arg4, abi_long arg5, abi_long arg6);
 void print_openbsd_syscall_ret(int num, abi_long ret);
+void print_execve(const struct syscallname *name, abi_long arg1,
+                  abi_long arg2, abi_long arg3, abi_long arg4,
+                  abi_long arg5, abi_long arg6);
+void print_ioctl(const struct syscallname *name,
+                 abi_long arg1, abi_long arg2, abi_long arg3,
+                 abi_long arg4, abi_long arg5, abi_long arg6);
+void print_sysarch(const struct syscallname *name, abi_long arg1,
+                   abi_long arg2, abi_long arg3, abi_long arg4,
+                   abi_long arg5, abi_long arg6);
+void print_sysctl(const struct syscallname *name, abi_long arg1,
+                  abi_long arg2, abi_long arg3, abi_long arg4,
+                  abi_long arg5, abi_long arg6);
+void print_syscall(int num, const struct syscallname *scnames,
+                   unsigned int nscnames, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5,
+                   abi_long arg6);
+void print_syscall_ret(int num, abi_long ret,
+                       const struct syscallname *scnames,
+                       unsigned int nscnames);
+void print_syscall_ret_addr(const struct syscallname *name, abi_long ret);
 /**
  * print_taken_signal:
  * @target_signum: target signal being taken
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 96499751eb0..e45909b8688 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -49,7 +49,7 @@ print_raw_param(const char *fmt, abi_long param, int last)
     gemu_log(format, param);
 }
 
-static void print_sysctl(const struct syscallname *name, abi_long arg1,
+void print_sysctl(const struct syscallname *name, abi_long arg1,
         abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
         abi_long arg6)
 {
@@ -71,9 +71,8 @@ static void print_sysctl(const struct syscallname *name, abi_long arg1,
         (uint32_t)arg2, arg3, arg4, arg5, arg6);
 }
 
-static void print_execve(const struct syscallname *name, abi_long arg1,
-        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
-        abi_long arg6)
+void print_execve(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                  abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     abi_ulong arg_ptr_addr;
     char *s;
@@ -105,9 +104,8 @@ static void print_execve(const struct syscallname *name, abi_long arg1,
     gemu_log("NULL})");
 }
 
-static void print_ioctl(const struct syscallname *name,
-        abi_long arg1, abi_long arg2, abi_long arg3, abi_long arg4,
-        abi_long arg5, abi_long arg6)
+void print_ioctl(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                 abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     /* Decode the ioctl request */
     gemu_log("%s(%d, 0x%0lx { IO%s%s GRP:0x%x('%c') CMD:%d LEN:%d }, 0x"
@@ -124,9 +122,8 @@ static void print_ioctl(const struct syscallname *name,
             arg3);
 }
 
-static void print_sysarch(const struct syscallname *name, abi_long arg1,
-        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
-        abi_long arg6)
+void print_sysarch(const struct syscallname *name, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     /* This is os dependent. */
     do_os_print_sysarch(name, arg1, arg2, arg3, arg4, arg5, arg6);
@@ -136,7 +133,7 @@ static void print_sysarch(const struct syscallname *name, abi_long arg1,
  * Variants for the return value output function
  */
 
-static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
+void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
 {
     if (ret == -1) {
         gemu_log(" = -1 errno=%d (%s)\n", errno, strerror(errno));
@@ -159,9 +156,9 @@ static const struct syscallname openbsd_scnames[] = {
 #include "openbsd/strace.list"
 };
 
-static void print_syscall(int num, const struct syscallname *scnames,
-        unsigned int nscnames, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
+void print_syscall(int num, const struct syscallname *scnames,
+                   unsigned int nscnames, abi_long arg1, abi_long arg2,
+                   abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
 {
     unsigned int i;
     const char *format="%s(" TARGET_ABI_FMT_ld "," TARGET_ABI_FMT_ld ","
@@ -190,8 +187,8 @@ static void print_syscall(int num, const struct syscallname *scnames,
     gemu_log("Unknown syscall %d\n", num);
 }
 
-static void print_syscall_ret(int num, abi_long ret,
-        const struct syscallname *scnames, unsigned int nscnames)
+void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
+                       unsigned int nscnames)
 {
     unsigned int i;
 
-- 
2.40.0


