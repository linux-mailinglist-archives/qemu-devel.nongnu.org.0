Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E506DE200
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHW1-0003rR-N0; Tue, 11 Apr 2023 13:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVo-0003pr-TI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:33 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVm-00067j-F2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:32 -0400
Received: by mail-il1-x12e.google.com with SMTP id q5so22313657ilg.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqE0cOIeNp+kyq+c5+Esj5WEVDxO+dIWwYCwGSiBV/o=;
 b=S5iUUKPly582HzqulVWJXs0jYRWCr4wQ/us0TfsGI9qXg7wl4DhO1ASFcJSEGXW6dt
 9j1FR+ema1qjXMF44pVMdaybk4Z9jjx4OZ5347wMaILFtCCToVIP0r0PbN/A9Dz9y4ms
 bO8ADEO8bCmN035wNhymjdOSwhU0vJGB/kZhuMfoW69+xxYeDmen8W1pPA/soyW+SQ2N
 Hpn0/tLjWA9yb+BQN4+WQjniC6dX5+f3/4hMQOnul/h2/Duuk1xcy3h5AC1utBkhBMs/
 CjOs4ABu8TEwtEWV6/zG8QCRohT5Q/RLrFAPcZXI/4cH8p1lrdjBWFAnXiFrs9VNP38k
 ie0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqE0cOIeNp+kyq+c5+Esj5WEVDxO+dIWwYCwGSiBV/o=;
 b=4srSMLouahyoUI5unu9j8SXTiSN90LJdztyJ/Haf4qNwsKNFSI7fjrga/yhxTuDjCe
 197OG+OdPH4XnKtNSMM/wXf9dzuYUrtAkpPRk3fkjQH+xjJB6XdtCQK5ibKwT0rivZKR
 zOfdSqrDM87J2FuUqiPd84uOuyON5nr46Kn895wQDQkM+Q13NUrM7aGzR0THoXrgrDnF
 dAjs/HG0nNUcbQ/PvjGG6F/ztTQZbdWZHJMujq0Y4jghhkPD2voTwhhbkILKlwYXNcxp
 H9ey4lqL7WvZWsrbZrA0z8xmlA6hV5evEGyxXEGjUv8n+dA6UmPOYX7ssHcx5OE52/Bl
 iiWQ==
X-Gm-Message-State: AAQBX9d5vPYsMaUr+eDPi9bOKSAlIvPgYnR9r4NuTKVTA8lUYTgESKqB
 c7fh5cTBu4Zy501ExG6lKmJNgKl5/9s5RcOT3po=
X-Google-Smtp-Source: AKy350bHjVd4uSBvfm/xCUUKWG6yx4gQ4/afnRYOgIrXIFgyMRsUmIdu5XQ37r2wIjgNIyChcbSozg==
X-Received: by 2002:a92:db42:0:b0:326:2b4e:1f96 with SMTP id
 w2-20020a92db42000000b003262b4e1f96mr2091784ilq.21.1681233026220; 
 Tue, 11 Apr 2023 10:10:26 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:25 -0700 (PDT)
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
Subject: [PATCH v3 04/20] bsd-user: Move system FreeBSD call table to
 freebsd/os-syscall.c
Date: Tue, 11 Apr 2023 11:09:39 -0600
Message-Id: <20230411170955.17358-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


