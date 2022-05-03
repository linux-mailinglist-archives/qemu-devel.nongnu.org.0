Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F418B518F5B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:51:13 +0200 (CEST)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzUG-00034p-Vm
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZX-0007vh-7z
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:35 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZV-0006JU-Gb
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:34 -0400
Received: by mail-pg1-x532.google.com with SMTP id 7so10919889pga.12
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yIETyNF8e+iDYubG7UAr54h79EzcA695Ph0Ym5jO9Uo=;
 b=njdA2acRTXfq0e3zkWlru9Um0Vlxkk66C2P9Ew0iF6WhWmOhyew0yKSSwgqokkinsN
 f87EUw4aEmADhyvCVjysRwx/BEh32Q5d0zKsHhGW2A96JtoqfYFvVGDJ+ZV/x/O2B3Uu
 PI2LXIDv/fZB9FoEhgCAEHgxA3XAhWUoqbvR7Db2mRj1Zhg1YHSZMeO+f3xAhxep2+0E
 rX2MmWFg9+XGh2H07SNWxNkFH+0eogzr7t/0SbmRiWovvEsHekCfCO/nu7Kwj5cLjndp
 wJNYzqxCYlbfoS6c5GOZAeimI43RoW+/T9UjY0k8dTh7mHy416C9AR//pjo4sd5n7T99
 nTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIETyNF8e+iDYubG7UAr54h79EzcA695Ph0Ym5jO9Uo=;
 b=X99kyDHJyZN0ZbPUKcQHpgPyvp2vs9qEmOIvgB0hM0ryOEuCkLxtf0wUV6lRKB3GTp
 7dhjL/wO/216e+s9994OkMAcQLE7xUSe0ncLasXmy10vC/uGi+fOu5wohRt9yyIjPK7D
 +J2Qq8aFoghAluiUAaU0oRjzxMSVQfFW1YcP+txxHVyiaUcg09L01bYrISTB8vH150dK
 2FVVdhRAG4lpNmsMppPBS8F72hCA3IiIuj3ZctJJawc0a1j1vuI+DM3biFzHlDn8o3b9
 DOmuOdrfOCqiklrUwuYu1HZOOvCgZuDYP65PKYQJRYLNwBCdyOZaYt0/6Yg+IIFK1uWv
 YBdQ==
X-Gm-Message-State: AOAM532IcsHf0il89cArG2ao49KQ6tPwu60NrBOw15HT8aroF2P6PEJY
 9t4ZTPw6NqiyI7rMfAjrlelnKPZFHZPQIw==
X-Google-Smtp-Source: ABdhPJxNOeA5nOT2XLZrMGLXOM8QQfgWZPOi8EUSfypGz4Pxbiyu53YIQjKpgIKUbP1p4PrRO6OLVQ==
X-Received: by 2002:a62:6c6:0:b0:505:6713:d584 with SMTP id
 189-20020a6206c6000000b005056713d584mr17655927pfg.24.1651607552198; 
 Tue, 03 May 2022 12:52:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/74] semihosting: Create semihost_sys_poll_one
Date: Tue,  3 May 2022 12:48:16 -0700
Message-Id: <20220503194843.1379101-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


