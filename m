Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72EB41F2EC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:18:36 +0200 (CEST)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMB9-0004rF-Px
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4s-0004dD-5n
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:06 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4p-0004yk-VM
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:05 -0400
Received: by mail-qt1-x829.google.com with SMTP id r16so9588673qtw.11
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXiWOopBLOLRsE3QCVjUHoJD6t3B8cBROMNMjuCuDVo=;
 b=X3O4gEzGg1mctSpI3dZ6269FnKmFbcvGRc+uVudRl7jOU5d361v4MgkDB6OkYrNEfJ
 KJ1wdDlAT9WONdescOBnOmT7cusKEzTnB/Fc0ZHgsF1H3b07uJ/mC9Q05SL7mhSWLYoN
 Z+6uX1N82UFFROma29kXPJbiwr3Pq7BSJZqVeqQGvkABUBMEOO8qguZbuQMY5gJtxfRn
 hE/3WurCYWzJpGxr3Ak03kt3SPCaYh5M20huvLtVXX84Y1qgLTbMexdwcbTdvZLtnnL9
 JA6XdCrAq3fvfDjyvSVSLOhKno5/W1/0m9YzCA/EE+zITqEcTwebFyqog1L6KLiyW12m
 3D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXiWOopBLOLRsE3QCVjUHoJD6t3B8cBROMNMjuCuDVo=;
 b=mW9syXIygv6jEt4YILePCueFDo9exV70sFYcsrVMwEJSWDlPbhypQChJlY3tkf9VxG
 uyvR65KauLFkqosGl3TaskgkirBZdQXb6X9EiRFPDBAY/wUlCLW5UNmq2JlF827G2O6L
 9S/hD28sXLcM5xAC590DyPnrfaDzpXTyuNow2eBlzl/pOCb/B44Fwhnbzo+dqHvyRsvT
 VGuEawCBjOA7uHkqKwSSCd/W7harqU9bE/E5VsNZFBe/p2SkTmCOAcHRUUktS0sjRue+
 mbtce4Juep+yc2RRVImN5mbO7z07rI5EXH72bz8f0zemXO15F5AxGUPgEk39LKu5Zmyh
 Xjkw==
X-Gm-Message-State: AOAM533/fvRMZSLrjqZ//cCQHeQmgLDJKg13w0oPTrEjTn8dsnd/O2Ry
 khZ64xZs9yZnBDoxaSh/jUR9j+jGUWVy/Q==
X-Google-Smtp-Source: ABdhPJzRxe84bmpxl/XMJY3aiezDfpAciwVqDUR0awPEwGQXPcxVxEHFnDWSSkyB8nUneHDZIDSnhQ==
X-Received: by 2002:ac8:7143:: with SMTP id h3mr14624556qtp.242.1633108317952; 
 Fri, 01 Oct 2021 10:11:57 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:11:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/41] configure: Merge riscv32 and riscv64 host
 architectures
Date: Fri,  1 Oct 2021 13:11:15 -0400
Message-Id: <20211001171151.1739472-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing code for safe-syscall.inc.S will compile
without change for riscv32 and riscv64.  We may also
drop the meson.build stanza that merges them for tcg/.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                                             |  8 ++------
 meson.build                                           |  4 +---
 linux-user/host/{riscv64 => riscv}/hostdep.h          |  4 ++--
 linux-user/host/riscv32/hostdep.h                     | 11 -----------
 linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S |  0
 5 files changed, 5 insertions(+), 22 deletions(-)
 rename linux-user/host/{riscv64 => riscv}/hostdep.h (94%)
 delete mode 100644 linux-user/host/riscv32/hostdep.h
 rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)

diff --git a/configure b/configure
index 1043ccce4f..23ede08582 100755
--- a/configure
+++ b/configure
@@ -650,11 +650,7 @@ elif check_define __s390__ ; then
     cpu="s390"
   fi
 elif check_define __riscv ; then
-  if check_define _LP64 ; then
-    cpu="riscv64"
-  else
-    cpu="riscv32"
-  fi
+  cpu="riscv"
 elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
@@ -667,7 +663,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
+  ppc|ppc64|s390x|sparc64|x32|riscv)
   ;;
   ppc64le)
     ARCH="ppc64"
diff --git a/meson.build b/meson.build
index 7bdbbbdf02..30cb165b3b 100644
--- a/meson.build
+++ b/meson.build
@@ -56,7 +56,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
@@ -278,8 +278,6 @@ if not get_option('tcg').disabled()
     tcg_arch = 'i386'
   elif config_host['ARCH'] == 'ppc64'
     tcg_arch = 'ppc'
-  elif config_host['ARCH'] in ['riscv32', 'riscv64']
-    tcg_arch = 'riscv'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
                         language: ['c', 'cpp', 'objc'])
diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv/hostdep.h
similarity index 94%
rename from linux-user/host/riscv64/hostdep.h
rename to linux-user/host/riscv/hostdep.h
index 865f0fb9ff..2ba07456ae 100644
--- a/linux-user/host/riscv64/hostdep.h
+++ b/linux-user/host/riscv/hostdep.h
@@ -5,8 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef RISCV64_HOSTDEP_H
-#define RISCV64_HOSTDEP_H
+#ifndef RISCV_HOSTDEP_H
+#define RISCV_HOSTDEP_H
 
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
diff --git a/linux-user/host/riscv32/hostdep.h b/linux-user/host/riscv32/hostdep.h
deleted file mode 100644
index adf9edbf2d..0000000000
--- a/linux-user/host/riscv32/hostdep.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef RISCV32_HOSTDEP_H
-#define RISCV32_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/riscv64/safe-syscall.inc.S b/linux-user/host/riscv/safe-syscall.inc.S
similarity index 100%
rename from linux-user/host/riscv64/safe-syscall.inc.S
rename to linux-user/host/riscv/safe-syscall.inc.S
-- 
2.25.1


