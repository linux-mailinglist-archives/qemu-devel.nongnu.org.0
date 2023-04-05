Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9556D89B3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAo4-0005IW-3b; Wed, 05 Apr 2023 17:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnw-0005HY-IL
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:32 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnt-0005a5-GS
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:32 -0400
Received: by mail-il1-x130.google.com with SMTP id t5so8184573ilu.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DM3wKZtPkr/t8eKmexvlOqylubu6rNGh4+x7s6epeI=;
 b=pPjsESZjn62wv+C4Rz188U1i9yFRYYpzEtX9xlIfYy7tBi44HU8yO83UxTXs6B5dnS
 CH4HkSaDx0vm6Opo2lZEfhS3qEC5VttA/fEhcgnKrRTVcwqudXTM2DBy7fAmyBaVIe0R
 ou3PySby6jaVP42O464j8JVSCfLE0XTH6f3qEpLYXcufdCpuhBeW8zlldcQhV4ApXEew
 ur5pTbwVLwUynBxgAjspQve1ElnkE6mV1Cti2jAq5z1j+mCxZn1pfgzR0L6IzOiRAyru
 zqdpoU9x8FhFBKKnbCqaXjkxkUsgwBEed41GXYFD1lsFPuFR4TZkJ3zPZnio0WLEF6Rl
 XxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2DM3wKZtPkr/t8eKmexvlOqylubu6rNGh4+x7s6epeI=;
 b=CPYQI0knAx9GsFIALeEFJl41x3KmzP8tJKqQ5JYSWVPDqdSZxNf6umXmBPz8M8UsSA
 vBM0EWu1FJ0+dNLw7BwmMJwWEwit0K/J046od0pE/01s6WUslqTTwYPNK23kbUOwerOc
 H2TltoWHGrBxS0g8XAjY1yaKPfyYn2SiFwFnNetuC+w6YKoPxc9stsC1fzJYREgrUmOe
 EpWwyK8AJjCaderEa+dL8UNzEMUoBJz7/FtCl0Om73dzLvD1Y4RKTa6I0tZTK+FOkitg
 90we15ktThK/f51KgdyWuHH/+0fqtfjLO5Uq30Q0/32nm5f61IABFQXbK9co76YEIs8k
 d5SA==
X-Gm-Message-State: AAQBX9eUSZfbmObn65UbOxFc/F+qlrOUmAulFgNzqBoc8v0yUfAmB3x9
 ATd8ypcQ/7qr+rjUF0b6cYuBexHLljtsb8dA22I=
X-Google-Smtp-Source: AKy350ZF1HWvHI82e9O5d2l+PwKKtFua+xLrUwdQ0M0dy2CjlvTfbFZ/WAE8vJIno4cuqkRbvXxZ4w==
X-Received: by 2002:a92:cc82:0:b0:31f:ba63:382 with SMTP id
 x2-20020a92cc82000000b0031fba630382mr4671292ilo.30.1680730587398; 
 Wed, 05 Apr 2023 14:36:27 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 01/16] bsd-user: Make print_* public
Date: Wed,  5 Apr 2023 15:35:57 -0600
Message-Id: <20230405213612.15942-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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


