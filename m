Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE19440AC3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:52:43 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsX4-00061n-AZ
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryL-0001vc-OI
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryF-00005m-7B
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id g184so12991458pgc.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyOAbtDEe2hsdPtG2fphhVCPp8pp4Epcy5WbMT+mT+o=;
 b=UMBzhAOKiFhR5sShCZxGxtjwH2dabVRQDzgUja23CUN6uIGKg8G3t+8Z/Vzj44UyjV
 98u+h13DGcLF+z7TcpuwRdj0RJaGcmGXKzoRK1Lf3xNntPdImJRKBPJcq70xiYcI3q6/
 QZiCn8Z/jqbgE2aMaR2i+JEBca3aE7g7hV2CWW0O9wNDanGpLModoG2heOdR1+h2fjVg
 l0FFcobXdtX5jyZ2YD3EwNivn5NctgJZ7CQ2w2n5DO8aiqasc0m405NG17jU+vwpQ6h3
 PeO5pf1sFqwec3tbBvslPdMOajSavYPYWNSYSsrI0w+Y7Yv6vpaTmPSrSztbf3Vwd9Xo
 y2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyOAbtDEe2hsdPtG2fphhVCPp8pp4Epcy5WbMT+mT+o=;
 b=XF4MMw7FeiI3NUwrepDk0XXAWJPDEfEU7Y8BczmXPf9o7XZINEd2q2tY5+2Lui8uWq
 p7vvZ2/FFTZX2EtDMqRs44bHaHBemuWZne2oDjKQkaqBdETb12DIEixAKz+NgQXHmi8c
 Ztq5al5c3cwBLUZfW3nRiPYSYlL7wGi6nOUmFedGArN7/7LWxDLMju2ADAokpqAOWJY1
 zYclaIAXTBqmjNjnJzjbcXWzyH15gr9+zYCJCh50G992pUJrXlEpOohEdMJ2jXFOtsBN
 5wyzGZISVz7CCurpkHvOekNs3sc3DhkmqQEqrF2SbIGKzI2CAbeYfrbvc2zxt2RDk0h8
 lBcg==
X-Gm-Message-State: AOAM533SfrJWi5vnMmYRQ5r8W5GrFmzERkx8bIrxYPOIZoZlruqIHiCI
 y5Fp1aoYyjLHQhQmCxh/9htSuFpf1fmKhA==
X-Google-Smtp-Source: ABdhPJxAegXJJDYQbbJUCLKQ4pQjBHDucyxWBD6bix9O4ASuIZ9gNJn0/1uF/LQNWAhggL6qlFFroQ==
X-Received: by 2002:a05:6a00:1ac9:b0:47c:236d:65f1 with SMTP id
 f9-20020a056a001ac900b0047c236d65f1mr18552662pfv.3.1635614201790; 
 Sat, 30 Oct 2021 10:16:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/66] configure: Merge riscv32 and riscv64 host
 architectures
Date: Sat, 30 Oct 2021 10:15:34 -0700
Message-Id: <20211030171635.1689530-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing code for safe-syscall.inc.S will compile
without change for riscv32 and riscv64.  We may also
drop the meson.build stanza that merges them for tcg/.

Reviewed-by: Warner Losh <imp@bsdimp.com>
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
index 039467c04b..d57ad58342 100755
--- a/configure
+++ b/configure
@@ -570,11 +570,7 @@ elif check_define __s390__ ; then
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
@@ -587,7 +583,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
+  ppc|ppc64|s390x|sparc64|x32|riscv)
   ;;
   ppc64le)
     ARCH="ppc64"
diff --git a/meson.build b/meson.build
index 2c5b53cbe2..90e3e85f20 100644
--- a/meson.build
+++ b/meson.build
@@ -55,7 +55,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
@@ -351,8 +351,6 @@ if not get_option('tcg').disabled()
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


