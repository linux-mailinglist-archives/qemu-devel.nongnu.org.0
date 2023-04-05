Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCAC6D89B5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAo4-0005IV-3E; Wed, 05 Apr 2023 17:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnx-0005Ho-30
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:34 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnv-0005aP-Ev
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:32 -0400
Received: by mail-il1-x135.google.com with SMTP id h14so18153701ilj.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhXur0mol2eJRCuT8H9O7gNE5+OMCeuHhvCsZFIq5AU=;
 b=Hu3iTcR0bmj5FTe+D3yBkxQHhjT6G0r33E3HzDRpgvXSl7QAYQPsJIySwcyjATIKWZ
 zD1dsnxRGfCgxwXweBpmGObiSItcFVHxZTS6tBtvuQD2QjZyzgvYYc+j5fuhhlkVuGA9
 75v76qiHEqF9tVozIhH1GsfDKKopCAYpGSXJfBHcIU+GIcVKlf1ZSudjF8Czjo5JzCyx
 mvO+fQV0V6u4kOfnr0L9vRXjEma1MbOPk/yZlwLStV1yDVVfeovUaqSR20vIy17ZNqo8
 gNY1kmMY052nxrhntI4NavsREugm7sbIoBXD+xG7vw0CO9hXacjGTpBbjS5ci+y0tL8y
 keng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhXur0mol2eJRCuT8H9O7gNE5+OMCeuHhvCsZFIq5AU=;
 b=BvX4xd9TMPKcLWaPElTfj7DL5OU8igtsYFMHhoPutCWYciS3nkcYeUzfBFUtSnOWpP
 /6KDG8xyrE7zvEIYf1UtdF60htdQe5fnIMBGKuLLYiUywwOZq5lRo/pjjm6kyWZmJS9t
 FE9VteQjKL9AMBO/sdLVQcbt3gedS88wOGZ7tHz0QiuKj0VUPp/jC3gCNZOPMu8di3z9
 E8r6Zgf7MXhvrVw5VC2lg9DWAQigA+baSwjSZ1rYqZFW9G4udo+ZBj1JINRtDkn7PD1T
 Ukqk1kJMqD0yX5QQMFo9/H2+JxWMQ01Rm5BMYr2eIx2QddhB84jg63N4Ggk6M86mt3oZ
 phqw==
X-Gm-Message-State: AAQBX9dnCPUzGctBgkvRKlQgfYbhs9MjA4ASDNARrENvJq5OlhI7X2Fm
 m2/SqhtHpU45Ifp52syGudTpikc+svuRRRDlVoc=
X-Google-Smtp-Source: AKy350ZUFAXgFwqZbkFWPXtZMovi1xYv9yaAP0EJQow5fpCn9n2QgZ8i0brSvnyV1eZuOrOQUTXiDA==
X-Received: by 2002:a92:d38f:0:b0:315:420e:a77b with SMTP id
 o15-20020a92d38f000000b00315420ea77bmr2658964ilo.10.1680730589887; 
 Wed, 05 Apr 2023 14:36:29 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:29 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 04/16] bsd-user: Move system FreeBSD call table to
 freebsd/os-syscall.c
Date: Wed,  5 Apr 2023 15:36:00 -0600
Message-Id: <20230405213612.15942-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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

Move the system call table, and FreeBSD helper routines out of strace.c.
We do not support multiple BSD-types in one binary, so simplify things
by moving it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 19 +++++++++++++++++++
 bsd-user/qemu.h               |  5 -----
 bsd-user/strace.c             | 17 -----------------
 3 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec1..354a38943e5 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -517,6 +517,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     return ret;
 }
 
+static const struct syscallname freebsd_scnames[] = {
+#include "freebsd/strace.list"
+};
+
+static void print_freebsd_syscall(int num, abi_long arg1, abi_long arg2,
+                                  abi_long arg3, abi_long arg4, abi_long arg5,
+                                  abi_long arg6)
+{
+
+    print_syscall(num, freebsd_scnames, ARRAY_SIZE(freebsd_scnames), arg1, arg2,
+            arg3, arg4, arg5, arg6);
+}
+
+static void print_freebsd_syscall_ret(int num, abi_long ret)
+{
+
+    print_syscall_ret(num, ret, freebsd_scnames, ARRAY_SIZE(freebsd_scnames));
+}
+
 /*
  * do_freebsd_syscall() should always have a single exit point at the end so
  * that actions, such as logging of syscall results, can be performed. This
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 22e16816a9e..c5240938da7 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_freebsd_syscall(int num,
-                      abi_long arg1, abi_long arg2, abi_long arg3,
-                      abi_long arg4, abi_long arg5, abi_long arg6);
-void print_freebsd_syscall_ret(int num, abi_long ret);
 void
 print_netbsd_syscall(int num,
                      abi_long arg1, abi_long arg2, abi_long arg3,
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index e45909b8688..7d0117fd3cf 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -146,9 +146,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
  * An array of all of the syscalls we know about
  */
 
-static const struct syscallname freebsd_scnames[] = {
-#include "freebsd/strace.list"
-};
 static const struct syscallname netbsd_scnames[] = {
 #include "netbsd/strace.list"
 };
@@ -212,20 +209,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
 /*
  * The public interface to this module.
  */
-void print_freebsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, freebsd_scnames, ARRAY_SIZE(freebsd_scnames), arg1, arg2,
-            arg3, arg4, arg5, arg6);
-}
-
-void print_freebsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, freebsd_scnames, ARRAY_SIZE(freebsd_scnames));
-}
-
 void print_netbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
         abi_long arg4, abi_long arg5, abi_long arg6)
 {
-- 
2.40.0


