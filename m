Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DE52F6F8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:42:40 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDCZ-0004jt-F6
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCev-00033C-Pv
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:54 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCet-0004ZB-RI
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso9047980pjb.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptZSGC/FODqEi0rLC9tfcDztwNdHfO1v+1vhlJ7WWkE=;
 b=xwfx/tFAozT2gC9ZlgijarS9gaQqbtw5e3K4aQBukELVqnKoZqG92r10eiClVHvb1F
 /LDTdHklEoAtzQzkJEak/SKaSmoPE6Ik2yzlUXWQDkfRCYK+Ee01K0VKJWvoUVKYcmxS
 Obj6mYBQukUMf+S+KDUlS3vSJrmGV7GnmFvavTgkQ1rCiqycejwKFTw1ysj0PFjIfbMG
 4zxGKdenqCLeMQ+Hpy7/6s+oowU6ZdTpFQSumMSUtvA+0AFNTjgyE8mxfVaEHna5IWu5
 c+sQ7XLC99BHPTcJWA7DfuQWvZnwgCI9djdxU2lh4FfA67jPQ9J5e/SJ943cwrNcZCU9
 k1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptZSGC/FODqEi0rLC9tfcDztwNdHfO1v+1vhlJ7WWkE=;
 b=eOL8EWgyxUcInReaATNqlQbaab46qYJB30rJy1+a7GtWkGv0AX4YSyCv7gUczq/vA/
 rU+HjbSQxhuKwvlNnfd4omvzGBYoy+2O9M2lNMbaYWJ73iuZANb0wf4Er0/cL1ZOjcQ0
 4/qSOF4HJVf4DpOPhx24GzFNvVYPAHvdcNgLHAGgQmUil9UQIDyfkaVZ3/JSZcTzVzD7
 A1fxqHNn+rYqrwjF8pPld+hmpfmO7GbhbcZRBAjhvbLyF6zm13W2f6/D3VmSNPJ71VwD
 TDft2N6+1D6pnUQn2YBS8roqTSUL6xfFAk6A73YalZUR7PR4D2wbU55Vi96PhIea6+QH
 21eA==
X-Gm-Message-State: AOAM53197WNDg6KwFUe/KmM5Zdzqn4LCKvdERZwUMG50K5Sa5ed2PVNH
 hJ66LnzduL40yFILPcbqn7qffXToc84STg==
X-Google-Smtp-Source: ABdhPJwIrV8Li6++E34/YyI8kQBvUkjLUMN03G4wqKtHFcpRWVMM19WJa2KLxYp11NF/SVSYnyxAhg==
X-Received: by 2002:a17:902:ea46:b0:15d:dbc:34f2 with SMTP id
 r6-20020a170902ea4600b0015d0dbc34f2mr11934197plg.60.1653091670510; 
 Fri, 20 May 2022 17:07:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 43/49] semihosting: Create qemu_semihosting_guestfd_init
Date: Fri, 20 May 2022 17:03:54 -0700
Message-Id: <20220521000400.454525-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For arm-compat, initialize console_{in,out}_gf;
otherwise, initialize stdio file descriptors.

This will go some way to cleaning up arm-compat, and
will allow other semihosting to use normal stdio.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h  |  7 +++++
 include/semihosting/semihost.h |  1 +
 linux-user/main.c              |  9 ++++++
 semihosting/console.c          |  2 ++
 semihosting/guestfd.c          | 52 +++++++++++++++++++++++++++-------
 5 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index a7ea1041ea..3d426fedab 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -35,6 +35,13 @@ typedef struct GuestFD {
     };
 } GuestFD;
 
+/*
+ * For ARM semihosting, we have a separate structure for routing
+ * data for the console which is outside the guest fd address space.
+ */
+extern GuestFD console_in_gf;
+extern GuestFD console_out_gf;
+
 /**
  * alloc_guestfd:
  *
diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index 5b36a76f08..93a3c21b44 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -64,5 +64,6 @@ int qemu_semihosting_config_options(const char *opt);
 void qemu_semihosting_chardev_init(void);
 void qemu_semihosting_console_init(Chardev *);
 #endif /* CONFIG_USER_ONLY */
+void qemu_semihosting_guestfd_init(void);
 
 #endif /* SEMIHOST_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 7ca48664e4..7faf390df9 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -54,6 +54,10 @@
 #include "loader.h"
 #include "user-mmap.h"
 
+#ifdef CONFIG_SEMIHOSTING
+#include "semihosting/semihost.h"
+#endif
+
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
 #define AT_FLAGS_PRESERVE_ARGV0 (1 << AT_FLAGS_PRESERVE_ARGV0_BIT)
@@ -906,6 +910,11 @@ int main(int argc, char **argv, char **envp)
         }
         gdb_handlesig(cpu, 0);
     }
+
+#ifdef CONFIG_SEMIHOSTING
+    qemu_semihosting_guestfd_init();
+#endif
+
     cpu_loop(env);
     /* never exits */
     return 0;
diff --git a/semihosting/console.c b/semihosting/console.c
index b6a342744d..677ec2b176 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -190,4 +190,6 @@ void qemu_semihosting_console_init(Chardev *chr)
                                  NULL, NULL, &console,
                                  NULL, true);
     }
+
+    qemu_semihosting_guestfd_init();
 }
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index e3122ebba9..b05c52f26f 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -10,15 +10,56 @@
 
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
+#include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
 #include "semihosting/softmmu-uaccess.h"
+#include CONFIG_DEVICES
 #endif
 
 static GArray *guestfd_array;
 
+#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
+GuestFD console_in_gf;
+GuestFD console_out_gf;
+#endif
+
+void qemu_semihosting_guestfd_init(void)
+{
+    /* New entries zero-initialized, i.e. type GuestFDUnused */
+    guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+
+#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
+    /* For ARM-compat, the console is in a separate namespace. */
+    if (use_gdb_syscalls()) {
+        console_in_gf.type = GuestFDGDB;
+        console_in_gf.hostfd = 0;
+        console_out_gf.type = GuestFDGDB;
+        console_out_gf.hostfd = 2;
+    } else {
+        console_in_gf.type = GuestFDConsole;
+        console_out_gf.type = GuestFDConsole;
+    }
+#else
+    /* Otherwise, the stdio file descriptors apply. */
+    guestfd_array = g_array_set_size(guestfd_array, 3);
+#ifndef CONFIG_USER_ONLY
+    if (!use_gdb_syscalls()) {
+        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, 0);
+        gf[0].type = GuestFDConsole;
+        gf[1].type = GuestFDConsole;
+        gf[2].type = GuestFDConsole;
+        return;
+    }
+#endif
+    associate_guestfd(0, 0);
+    associate_guestfd(1, 1);
+    associate_guestfd(2, 2);
+#endif
+}
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -30,11 +71,6 @@ int alloc_guestfd(void)
 {
     guint i;
 
-    if (!guestfd_array) {
-        /* New entries zero-initialized, i.e. type GuestFDUnused */
-        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
-    }
-
     /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
     for (i = 1; i < guestfd_array->len; i++) {
         GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
@@ -61,11 +97,7 @@ static void do_dealloc_guestfd(GuestFD *gf)
  */
 static GuestFD *do_get_guestfd(int guestfd)
 {
-    if (!guestfd_array) {
-        return NULL;
-    }
-
-    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
+    if (guestfd < 0 || guestfd >= guestfd_array->len) {
         return NULL;
     }
 
-- 
2.34.1


