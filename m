Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A167441F60
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:33:52 +0100 (CET)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbBv-00046Z-4r
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5x-0003NY-VH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:41 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5q-0000aZ-Qi
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:41 -0400
Received: by mail-qk1-x72e.google.com with SMTP id n15so3733352qkp.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyOAbtDEe2hsdPtG2fphhVCPp8pp4Epcy5WbMT+mT+o=;
 b=tIIKdMIOIihcW6afyz4OW4RqnYHP5Dr8jHbjp6/60b8FcTMnkD+RJsAR601q2HLpiX
 at3z6kMsV5EiLpuxHgrWDKkiZWPyplPJnV4FmvPncMqaA5G5GV8I9c/0TjNNu1fCK5ht
 D4mtRLhE8e/cxB+cYHDEp3FA0qV1mOXMokEeaHpinYq9jSlj+jOeiu0jPnUle0Q5jg6m
 PtnizY+JXHocm5hcG1svDV8OSX6nzIZ0iwEFi5MB16F8N9pTf/y0l2qj6wxgGdmqDP3l
 Ao9bODqKtEkRQM98CIPo6B2kzr+bl/lvOSS8qcsP/Gk4FfC62OmceiXa4LQarYkMj/G2
 R91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyOAbtDEe2hsdPtG2fphhVCPp8pp4Epcy5WbMT+mT+o=;
 b=Jnts8pPgFjanlClKhTPil4zwy2hAXrn8J13Z+1IPBqlm2Odr4kbyoq4sMj1g5ZMOu0
 OEkimlTPFIb6BBguwLd4sLfDsK86/G4fr0erMGXpG7rlo2ExZ3oGUqxwcZOHKMQKXS5k
 m9dIJgjRBKo7wtxBni9SkMQcX2ZFvKEnNGey39JtSffIlDdCHggUzUUbVPIRQ2BQePBt
 1NqaCyJv+9oj13S6IpI36vshqshl2rjj9LKYqDgQ3YXgHgcyimayny4JV42Nd2gJwBZ+
 yon0+hd2BGG97x/dWYQA7hs3ipvaYU955EXJk/KJptTZjL18jg4wFXqQR2pPU0XdPf1L
 p48Q==
X-Gm-Message-State: AOAM532/+Tw+An81Ix6Uw6/R0C9PUQlftSAKcwPjXbOte9kNK5bxoW1j
 T8Wwworj91CSC3GCBxhGFKSXIuEehra4qw==
X-Google-Smtp-Source: ABdhPJy/EGs6JhlBxvzRGNFllOLvX4nDvrgE4gxRY5x8cK43Ty8WqPFIj+OEiA8EYbgWFSa99G19Xg==
X-Received: by 2002:a05:620a:2485:: with SMTP id
 i5mr6426442qkn.381.1635787653908; 
 Mon, 01 Nov 2021 10:27:33 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/60] configure: Merge riscv32 and riscv64 host
 architectures
Date: Mon,  1 Nov 2021 13:26:34 -0400
Message-Id: <20211101172729.23149-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
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


