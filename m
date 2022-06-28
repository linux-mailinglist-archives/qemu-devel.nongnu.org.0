Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8D55BF64
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:21:27 +0200 (CEST)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66TO-0003Hd-Sk
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Je-000225-4Z
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jc-0000Wu-AF
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id m14so10041998plg.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lB5ybBGRmrAOm3Wx4wV/l5RlYf9l1nrqsAeZO2RipkU=;
 b=y+8Dn+aa7QQPwv08UEhLc2w3gkwzn1ur98cRK5MdLtldEaEEcNjZoVcC66T6moET+/
 aavLWDihOjqHv1CfnvHwrmBNvY5ARq8mXVE/wjiBuxHAeskJ4mQipFxRWfQHiC8YIJRp
 01v0HbM1VuDmaOoFVS2nv648CgEqan+YoAJzbcp0spi8JO9Eq25mBWWnZ6nWup07LzDf
 FLbSZtgk6agW3B7mcl6gS9kYCo9vPWyaWtnthhRtLomJ3c3HXakvs5YAzEg6Gon6KP/0
 xMShIa/iu53RBYTGNRumacp4tsjf2vcTxgHOYk4AhtXwpwLGm0QDJHIK105QapgxJw7c
 Q1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lB5ybBGRmrAOm3Wx4wV/l5RlYf9l1nrqsAeZO2RipkU=;
 b=n1NoqHvNGbOAy0USXDUS6W2rCwM4P/w6fTNsLub7wXJyf0/KwkQj0EWcn9McM3V7BI
 +4kY/WhWy1NNfj0IAq8Xc8Qh/UP+qj5XgvI0AyUbyLWeANcxSaYf4QoWDlmNEIIj6Euh
 enpYuiqjRThfBsXJYmWpKSifJAW/KRamD4Sz0cxixthHHtPy4kJpRqHjgmLxfiLrkmOZ
 Xh7JQ5JUuZeD94MVJozWDry2zgym5hc8y7htucV4iSon4tAA0aO8c/UuwsV7zTndqDBe
 PvrFL5XNgZF444cgaZSniqNV0/aVp0Q1GZCP2ULJlASjtVjSYUZzDjrakL6x1iC232Jt
 pEgg==
X-Gm-Message-State: AJIora8PzefVjzU36SrdFOlVsAJOoPzQy93rnOQF5g2cQ1elb37JAKuo
 ++HwrIiHGg7G1F+fLMcGaUuyUH7FXSe1kA==
X-Google-Smtp-Source: AGRyM1vzUO7zWXlc2vaZZuMJNs4h4YtrbFcfUa1UD9TtWkJMs1UKGjl4Z1cR8iUqrDIdAbPz2dsw6g==
X-Received: by 2002:a17:903:1cc:b0:16a:73fd:3c87 with SMTP id
 e12-20020a17090301cc00b0016a73fd3c87mr1783853plh.41.1656392346832; 
 Mon, 27 Jun 2022 21:59:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 47/60] semihosting: Create qemu_semihosting_guestfd_init
Date: Tue, 28 Jun 2022 10:23:50 +0530
Message-Id: <20220628045403.508716-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index 651e32f5f2..e44bdb17b8 100644
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
index 540aa0cd4b..955880514e 100644
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


