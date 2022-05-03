Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC8518F03
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:37:59 +0200 (CEST)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzHS-0006Ie-28
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZS-0007f1-3w
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZQ-00065g-5D
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:29 -0400
Received: by mail-pl1-x636.google.com with SMTP id s14so15886650plk.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Zc7fcb162n8E46W3M3k2gzkfPtgh3mAbYwEb/eTCO3o=;
 b=CVZ/4Ngh5/UvAosmCEZ8VjZW3s3gY+rl8DTU4ISd5YUFSlZSEuINedQPPc+udwCXRw
 kVg1tSl6CZ89+qWF+9776Ila84vJdaT5s9CJTKw0jfouWu9TJfMM8dVA6TbwzYGTdKcv
 JDGGqiuYhETSHLF9cmkckgUe9xsolR54Ye3VkhwmO9SZA71IDHxXZXHPT0ayq9+S24E1
 dMv1ehkefq/jhqiyIJZWguzEUXK8EQ1TxEKDRt7Vva6Ni3rUlYfP9ONzIz2qOKKygNsc
 y9duzQ7al5FFcVJwM+B4LgVhrbyJzdmzyw/hLA6lbBwZsXWB6ORr3OnbKh4vbamiB+PR
 3kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zc7fcb162n8E46W3M3k2gzkfPtgh3mAbYwEb/eTCO3o=;
 b=OOfnrhOARM6xjTU2jsGHpDSC16fMrcBJBa6lnNtHckV6JVwKD1Cdxfrtwi4y+6tD5N
 VMvoYpX9szgZpTzWZ3Iqb5eGVOdyPE1/j5Osa7i7F2B7OYRxSrio3/qHg3YoBfQEj4n6
 SyIabL8If7kCk/NHdZRrsQe81i1B2Uq2tS2SzduZIM0SdpnvvkOvx65zUJsz525RsmSH
 P09apoGE0bptav0xAPXe/IdF/rm2S/MrXBQ1CyOpzLHOsHJnILu6RE8bHZq8+ftqGjg6
 bM/4/0j8JnAXreS0I4tO1lD7/WzsBBHxXUt1u+HNMTylg07U0dJnF7rF0KzCT28x3hxM
 PSFw==
X-Gm-Message-State: AOAM530TtsDRaFtCXoV+K6Xp01+qobKACODryrhJTqPGGaSuZ8Z/HXqs
 FSh4dchOPY8S8BJThrKDgMC9qCRVYdSEvQ==
X-Google-Smtp-Source: ABdhPJzOWO0e2fDBj3FrHADB3ivx2drJrExqCC+RQfTC/A3/hKAKt1Q2Y9NXGlXQdBvnrP1/9W/eNg==
X-Received: by 2002:a17:902:868b:b0:156:7afb:2ce2 with SMTP id
 g11-20020a170902868b00b001567afb2ce2mr18070955plo.27.1651607546478; 
 Tue, 03 May 2022 12:52:26 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 41/74] semihosting: Create qemu_semihosting_guestfd_init
Date: Tue,  3 May 2022 12:48:10 -0700
Message-Id: <20220503194843.1379101-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
index 5c3e7cd538..73d8235222 100644
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
 int alloc_guestfd(void);
 void dealloc_guestfd(int guestfd);
 GuestFD *get_guestfd(int guestfd);
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


