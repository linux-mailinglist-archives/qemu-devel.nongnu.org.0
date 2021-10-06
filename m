Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C648424429
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:29:00 +0200 (CEST)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAix-0007Hl-3i
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdS-00077a-4l
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:20 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdO-0007wv-6L
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g2so2969268pfc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G543JgxkSKJdl+d3LEEYN3KWdLbLCTWXPJ2l6z881to=;
 b=MXO6y2jfHY1zyNjps4s+9oZwqwq5pXp3aWWQbvE5CUulpbmTIBpfDjVOtYaNKqMVPJ
 BEvJGNYk7pnOqst08+E1FDwlsaSVw22WuJtTlTsuN/xLk58+eASHDf7CDS6ZHZ859Nxz
 d8cfTJJVG8pElCg2DvMhxGgItMHTc6BM1fBoEm0Q7AlEQ7x5ktTOuSCYvxvB7uleOdC/
 nnmou3jOuIgX53OZzgC+8kNwoMe43JG+ENHXQq63ENvxBqKkxatA+JsVoYAZxBVUqttj
 TGB2lVrFWjL9OhJjvSJhEuqKjif6/AKnTHwNsljfFB/thIqsHDN/1bOF9TPk3kGP3SOp
 B5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G543JgxkSKJdl+d3LEEYN3KWdLbLCTWXPJ2l6z881to=;
 b=nI5Pju/EgC7rZUuz/IBUpXU8x2EG9cB2UyUT0LetXXGUr7fL4eTYJcJNSg442bnedM
 13EENQ5S0XveNxdDTk7c4NQhCM0OT12Tun0OpXi06rR304GJShBvVbv0YClQSlLQ/2+S
 yinghyBURYKB2q9syrH3oQe0U+Lt5XdGbQ03DW1RnBTUjESDDRQyVQojFrwPWe51Dufa
 Ax76Vq6DxkITMZqTJ8E1ooX4FolV5wljqVRh/yp75CLlmk0cR2yYoT6pLQ1pdtBazrWz
 0wR1VaeJ64wPCI79Fzx2/hC4/0ZStXaHhfc6khV/bNqr0em0NP1ME7Ztv0luD2r7AAhC
 bTcg==
X-Gm-Message-State: AOAM531tqkZO1kMaa5MTUvuTg3dn6Vzr5B6SXjA7qRYbI9nU76xEkMOj
 CbaQ9o3ENtoh9IFQHrxWCXojHnOt817tzA==
X-Google-Smtp-Source: ABdhPJw9Bct5Xjyou4IZ+qC+ik3H847PmUFaWgOdstlv5eXoou57jTNQya2UMpBIA/CvotOEnoISqg==
X-Received: by 2002:a65:45cd:: with SMTP id m13mr21845070pgr.26.1633540992829; 
 Wed, 06 Oct 2021 10:23:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/41] configure: Merge riscv32 and riscv64 host
 architectures
Date: Wed,  6 Oct 2021 10:22:31 -0700
Message-Id: <20211006172307.780893-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
index 877bf3d76a..3edc06ff16 100755
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
index 99a0a3e689..a06d80cfc4 100644
--- a/meson.build
+++ b/meson.build
@@ -52,7 +52,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
@@ -272,8 +272,6 @@ if not get_option('tcg').disabled()
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


