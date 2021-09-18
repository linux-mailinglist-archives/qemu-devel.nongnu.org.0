Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6B410834
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:54:41 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfU0-0002Gq-AJ
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLF-0004yb-5y
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLC-0006iW-Ph
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:36 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso12370427pjj.0
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNytvLeKtUgPrmZI/TBw9N43J3yDkQk24XcXM4krLhk=;
 b=xQ+e4HNflx/kFwy7DlYyzkV0zwhlsRq2X9B94zZoYQUnj46+cXRIX9rD955pR2e4Yc
 /XDfFyNr4/QdC+Rhttsy7c2DG6DvjN5weSrF+aVah5ZXyxIjFIfuzcQb4hrX57EBQxDP
 ZAI8Qkrkuf9Tv1/+AMP8yMciqdhQpEEwlnB2L8prjECrkqgfGGRyY3J/ubGTCvYlRL3K
 HUGAOO5ZryGNpYTIvbJClA1/frftoKZzhzrhWg6pK+cEKK8WIrAYwOjz2JNRIexBc+wC
 +FPCweNcqLKza0n3u8UiZZznNM7U1UAq/2rl8nXbNgI88zfvvHYC2m/W2f8HiEHbRyuy
 5nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNytvLeKtUgPrmZI/TBw9N43J3yDkQk24XcXM4krLhk=;
 b=eSR7KzaPrLZ2mC4uZQG+JANsyi/EFe493+Ap9L1NfeGBP9Pe8YEBKb8Rj04SgSkiIm
 4p500jF7otEPulgn4EzXyfTPJWVIx83pk2c3x4LVhj2/9YyS+5PQIpDzBK1YGamsARZV
 5M7jybSfMRmK7fjbepIloibFx+m7grlPCKhkarqNNqwgbwe5JOq05q1BA7gDf1aybFdG
 K31IorPtDMBUPF4do7mZ0Jra3qYEoUASi/+W57A2ATIpcCXACkQ+qUlVTmnsjPcQOUif
 OwUy9Ki6shFvKhLjMazYBd1XsfDwXxAAIrV7WKx7N/5aInNn7DnEp/VNg/m6Ld45qk0f
 kYHw==
X-Gm-Message-State: AOAM530GjB04d8pmg8xSbHVMFrdw4g7lcP4B/lG6EbpRATzf/U0JgJfA
 ngvAXNXtHhJkcnWEnviP/5767M79MvTBOw==
X-Google-Smtp-Source: ABdhPJwwqNSwwOMc3eHJBfWQnqWx8rEo3V6rPQG1we/Fr8KZQnuw5LVG2fcpzZB+EX5M1rx/xfxujQ==
X-Received: by 2002:a17:90b:1d02:: with SMTP id
 on2mr28136937pjb.21.1631990733547; 
 Sat, 18 Sep 2021 11:45:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/41] configure: Merge riscv32 and riscv64 host
 architectures
Date: Sat, 18 Sep 2021 11:44:51 -0700
Message-Id: <20210918184527.408540-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing code for safe-syscall.inc.S will compile
without change for riscv32 and riscv64.  We may also
drop the meson.build stanza that merges them for tcg/.

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
index da2501489f..6ff037bac1 100755
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
index 2711cbb789..c35a230bf0 100644
--- a/meson.build
+++ b/meson.build
@@ -56,7 +56,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
@@ -271,8 +271,6 @@ if not get_option('tcg').disabled()
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


