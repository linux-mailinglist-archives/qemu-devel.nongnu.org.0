Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6550652F6D9
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:37:41 +0200 (CEST)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD7k-0007Js-Fm
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCf2-00039X-Hh
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:08:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCf0-0004aH-9J
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so12804958pjb.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIETyNF8e+iDYubG7UAr54h79EzcA695Ph0Ym5jO9Uo=;
 b=xsNJcIjxRM8IcFuxnv1J3ocV9SpPogNjRsRIuIHQuMjH/HMOgstJjMM4Mht65QaMKN
 keZfxAvAlJTHwxOajGx0nIidNv2Bf1eaH6MKJn3Ffv4akMuMUdezow7/D2j0dQWA/kT4
 TPpm3cSGagMDZNYcGXxie/w9xFz02ZBX72HFa2xPoboFBz4IWiav2z2NiSSaJoQM9ZBd
 TALnmjvFmTRdc5hMxvMaVeYpVtRWtQwSYmW31OYzza9kFl5ueXITNEk8GfP//3AfaFl4
 2+ycdqt1BykI9/Tl0TiWART7BgDzOJbRl1G5L3QKefBCdG9XbpfXX97aO74CuJMq4J/2
 8Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIETyNF8e+iDYubG7UAr54h79EzcA695Ph0Ym5jO9Uo=;
 b=ptR5aDSgYxiOFc/dJv21MDC74gN4KaQcv+NRE1XISYdbXTo6uLIGR35755fnfN8zcW
 9+HhDIPqaMM1FAqk9h5bhdEtZ63ipyzpqAcgSugXxlCp3LMnDgzxGvrLxePztx1aDdND
 UnRt7ZqtTHO71+xzY1ytli7BscClaX2XM0d4j0kOu3Iz8uBOZAafkFONz39m+6O1rSt4
 yg2KAtgrAuxfPrjvroDBhOY+JhhSXPGEPnvCSGzOi4PlAi058uLvvPgyygrSH/v9N0H/
 IB2sbeyWlFvE3F4W6/+EcjIOS4OV37rcUfYcpNm7e9BXKNpq6j+rMV4NHGYf5PisUhHj
 bTfA==
X-Gm-Message-State: AOAM533dE3NSGCJjFI2s1j9XEPd+aEhw5CiSYGohWxan64V5w1CZhxcW
 BjBcKQAG9+J5pJMnTzD/0nHJ4KApD4lD9Q==
X-Google-Smtp-Source: ABdhPJxpsBEbddukhM+8WMZ8gu9IaTDM4ixoHJGmNleroeOpw+z/3EYRfjLPyhswMVsJs1zPfs8Phg==
X-Received: by 2002:a17:90b:1b4b:b0:1de:d495:8bc3 with SMTP id
 nv11-20020a17090b1b4b00b001ded4958bc3mr14067976pjb.200.1653091676915; 
 Fri, 20 May 2022 17:07:56 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 49/49] semihosting: Create semihost_sys_poll_one
Date: Fri, 20 May 2022 17:04:00 -0700
Message-Id: <20220521000400.454525-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This will be used for implementing the xtensa select_one
system call.  Choose "poll" over "select" so that we can
reuse Glib's g_poll constants and to avoid struct timeval.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h  | 16 ++++++++
 include/semihosting/syscalls.h |  3 ++
 semihosting/console.c          | 19 ++++++++-
 semihosting/syscalls.c         | 70 ++++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 20c31d89d4..61b0cb3a94 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -53,4 +53,20 @@ int qemu_semihosting_console_write(void *buf, int len);
  */
 int qemu_semihosting_log_out(const char *s, int len);
 
+/*
+ * qemu_semihosting_console_block_until_ready:
+ * @cs: CPUState
+ *
+ * If no data is available we suspend the CPU and will re-execute the
+ * instruction when data is available.
+ */
+void qemu_semihosting_console_block_until_ready(CPUState *cs);
+
+/**
+ * qemu_semihosting_console_ready:
+ *
+ * Return true if characters are available for read; does not block.
+ */
+bool qemu_semihosting_console_ready(void);
+
 #endif /* SEMIHOST_CONSOLE_H */
diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 347200cb9f..3a5ec229eb 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -69,4 +69,7 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
                                target_ulong tv_addr, target_ulong tz_addr);
 
+void semihost_sys_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
+                           int fd, GIOCondition cond, int timeout);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/console.c b/semihosting/console.c
index c84ab97ab6..cda7cf1905 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -77,10 +77,17 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
     c->sleeping_cpus = NULL;
 }
 
-int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
+bool qemu_semihosting_console_ready(void)
+{
+    SemihostingConsole *c = &console;
+
+    g_assert(qemu_mutex_iothread_locked());
+    return !fifo8_is_empty(&c->fifo);
+}
+
+void qemu_semihosting_console_block_until_ready(CPUState *cs)
 {
     SemihostingConsole *c = &console;
-    int ret = 0;
 
     g_assert(qemu_mutex_iothread_locked());
 
@@ -92,6 +99,14 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
         cpu_loop_exit(cs);
         /* never returns */
     }
+}
+
+int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
+{
+    SemihostingConsole *c = &console;
+    int ret = 0;
+
+    qemu_semihosting_console_block_until_ready(cs);
 
     /* Read until buffer full or fifo exhausted. */
     do {
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index aa4ee47649..1b87c37437 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -550,6 +550,21 @@ static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(p, tv_addr, sizeof(struct gdb_timeval));
 }
 
+#ifndef CONFIG_USER_ONLY
+static void host_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
+                          GuestFD *gf, GIOCondition cond, int timeout)
+{
+    /*
+     * Since this is only used by xtensa in system mode, and stdio is
+     * handled through GuestFDConsole, and there are no semihosting
+     * system calls for sockets and the like, that means this descriptor
+     * must be a normal file.  Normal files never block and are thus
+     * always ready.
+     */
+    complete(cs, cond & (G_IO_IN | G_IO_OUT), 0);
+}
+#endif
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -658,6 +673,34 @@ static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
     complete(cs, ret ? -1 : 0, ret ? -ret : 0);
 }
 
+#ifndef CONFIG_USER_ONLY
+static void console_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
+                             GuestFD *gf, GIOCondition cond, int timeout)
+{
+    /* The semihosting console does not support urgent data or errors. */
+    cond &= G_IO_IN | G_IO_OUT;
+
+    /*
+     * Since qemu_semihosting_console_write never blocks, we can
+     * consider output always ready -- leave G_IO_OUT alone.
+     * All that remains is to conditionally signal input ready.
+     * Since output ready causes an immediate return, only block
+     * for G_IO_IN alone.
+     *
+     * TODO: Implement proper timeout.  For now, only support
+     * indefinite wait or immediate poll.
+     */
+    if (cond == G_IO_IN && timeout < 0) {
+        qemu_semihosting_console_block_until_ready(cs);
+        /* We returned -- input must be ready. */
+    } else if ((cond & G_IO_IN) && !qemu_semihosting_console_ready()) {
+        cond &= ~G_IO_IN;
+    }
+
+    complete(cs, cond, 0);
+}
+#endif
+
 /*
  * Syscall entry points.
  */
@@ -936,3 +979,30 @@ void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
         host_gettimeofday(cs, complete, tv_addr, tz_addr);
     }
 }
+
+#ifndef CONFIG_USER_ONLY
+void semihost_sys_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
+                           int fd, GIOCondition cond, int timeout)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, G_IO_NVAL, 1);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        complete(cs, G_IO_NVAL, 1);
+        break;
+    case GuestFDHost:
+        host_poll_one(cs, complete, gf, cond, timeout);
+        break;
+    case GuestFDConsole:
+        console_poll_one(cs, complete, gf, cond, timeout);
+        break;
+    case GuestFDStatic:
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif
-- 
2.34.1


