Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C277541EF2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:39:21 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhr6-0008Ft-JV
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg98-0005rg-Ud
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0001qE-LX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:50 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso21915809pjl.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dAgm33M1rvCgEdViKgsHiMOPABrkN7+luzk9Bsvwo1g=;
 b=Uwl9gW2B5d/3kVphSlz6bQe5EBpPmNQU/H5iQUWaDzNG0CjfzhAt5H8TeBmNhKLLl0
 3VRV9WBdSYRNgqs/uhNLJVd/mNEoMsrqqGqiNT5WyuEuET0/ZOd6RtLZAXGpAuPp2U2f
 mxUj3FcTMDYrfeUREZZnwIneo7AZ+oOzkXbttn5dHSUr0aZCJCq/r+wNcY65oxvpnXJM
 8Zd8nID68n8lE/3k7Z0ahFZ+dQeJjy0w/k9BvavwPMSfMp9omt8Q2dUDyUiOY0jYLoE0
 hFBlZBR19YDU1w9dq+bxsUi/DrR3eTKBHcF7Prvm69uUBBMAUeE+VVnqVvXXkLkJMXMp
 agdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAgm33M1rvCgEdViKgsHiMOPABrkN7+luzk9Bsvwo1g=;
 b=CRs/BlLOUSk3Qgjrav0hOWeL/M01Yf/GAIZDl0b3Z1x93rYuMQnSUOkbXe6p8Gu3SY
 CdobXVNXt9zL8Xs1An6rI/0oCaHUJTpHoPtWx97DW9eHM4EjAbywXQMLWwUoA8SMKhYh
 OVuJjxkf/7AfWe5vWzN+I0eRLmsz0orPKGbZQ+dSzCBQppWMBJtwI+aR+/wgrmBqeoEX
 FOeeoo6sjw3YXWmywwLoQOS6MSEfFXCdMjhU2p4QwWR4yJML3Di0jcYTehS2zVBRyVY+
 PWs1+SnShBxkr1DrtgfEQT4258W5tKypnLyxNJwUS+wXJimMB/p8r+vW7cn4kklxtPTy
 Ro2A==
X-Gm-Message-State: AOAM533M+4QTS+9QtPxA0aAVjmQ4mMvsMZI7bsYfrIiEHabjkQRvAhtH
 hb5eC1wAwG/ieCW9SWBf658BSb88lXkgbg==
X-Google-Smtp-Source: ABdhPJxn5+JWguBI8ediR06iWBggpO13WXGDIpg0ZqwZFk90KfQ2x9G+Hxtfepq1Qbh/3z8wtK4lxQ==
X-Received: by 2002:a17:90a:4a90:b0:1e8:ad01:701a with SMTP id
 f16-20020a17090a4a9000b001e8ad01701amr4038197pjh.27.1654634986262; 
 Tue, 07 Jun 2022 13:49:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 53/53] semihosting: Create semihost_sys_poll_one
Date: Tue,  7 Jun 2022 13:45:57 -0700
Message-Id: <20220607204557.658541-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
index 9e499b1751..4847f66c02 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -520,6 +520,21 @@ static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -628,6 +643,34 @@ static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -906,3 +949,30 @@ void semihost_sys_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
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


