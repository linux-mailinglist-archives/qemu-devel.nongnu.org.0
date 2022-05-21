Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401452F6BB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:24:28 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCux-0006eb-5y
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc7-0008CN-3o
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbw-000449-54
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id bh5so8560640plb.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZGKSwAg+QGOS7FPNjoYkg7xUN0QcDGNw7JjeaNbJgo=;
 b=fv+JnyGZIpYDi4RziscQCTjJ4hOwQc0tcbMkLlBVtjm0Uev+L3RRb5FonAh5y8wzMa
 nH6N/JIqnkU+05iaAFkxlHSDsYYpzDoZPdArLvsDzgHzCIwufIBn+08rh+s7DgXb/0rf
 kBj6H3Eil2M87qO9+PMY6AGgY0S+Hn4gmxvrSJ8QOzcMVhG+hFutzZpvgTLNSwbM00bf
 /yqVNuSRdxnc+VB6fpNK9ZBvjGHtEm6gOwenTSQhbJcbRaO7hwx4EhGaBQotAfJUVzzn
 coQM7IOmB+AEyTvTR6trjlyf9orjreIqFKH1bjXPjXxSh8sUhTVRhRx1jvFrsBwgnh4q
 M74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZGKSwAg+QGOS7FPNjoYkg7xUN0QcDGNw7JjeaNbJgo=;
 b=uP4HGM9Gqj29u7XLZpKteH8J4j8cXcJbeNox4gPThXqN3/y+716zLEsu0bKLU/w+3V
 wPaNVEky/1uQjne+zX5TmYERFrfDl2NUI3NAp82kZq090B39e85ifrVAgYgkf9sgodvE
 V8/7ZaZnPkqdRzzg7+b/gsUIrpwZlgknDPQ8Naew3WPtVu6hmge+nVtcr6qOLk7G+rge
 RU6x+Ji0ZOrW1ClTNz45G3d687/EuxAjqMdnPxXBGI+E8L/mETGkU7+Rl18sYptomsx/
 FZmPtNWPP4H6M/pEVhGblw8oG1qCamF34of7aY4+3X37OMy9dXMu3jCdS7b86h9n3OYw
 ApuQ==
X-Gm-Message-State: AOAM532RV7zhMFdEj97vu5PZlXvrw2KGcGrrXQP8ZjL2cytqneOjTbJf
 OK4FpF45lt6Kr+Tbg52kjM/xKtSf9xBrmw==
X-Google-Smtp-Source: ABdhPJxHi9GBuwl9LQr29n6AEzB6Nwwbj8mskdU3Bx7qZe5lYOgPvdL7RV+cYC7TNER/MwrdO6ZcUQ==
X-Received: by 2002:a17:90a:db95:b0:1df:37e7:6a28 with SMTP id
 h21-20020a17090adb9500b001df37e76a28mr14257375pjv.204.1653091485288; 
 Fri, 20 May 2022 17:04:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 39/49] semihosting: Expand qemu_semihosting_console_inc to
 read
Date: Fri, 20 May 2022 17:03:50 -0700
Message-Id: <20220521000400.454525-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Allow more than one character to be read at one time.
Will be used by m68k and nios2 semihosting for stdio.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 14 ++++++++------
 linux-user/semihost.c         | 10 ++++++----
 semihosting/arm-compat-semi.c | 11 +++++++++--
 semihosting/console.c         | 16 ++++++++++++----
 4 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index afc961057c..39dbf1b062 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -38,19 +38,21 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
 /**
- * qemu_semihosting_console_inc:
- * @: CPUState
+ * qemu_semihosting_console_read:
+ * @cs: CPUState
+ * @buf: host buffer
+ * @len: buffer size
  *
- * Receive single character from debug console.  As this call may block
- * if no data is available we suspend the CPU and will re-execute the
+ * Receive at least one character from debug console.  As this call may
+ * block if no data is available we suspend the CPU and will re-execute the
  * instruction when data is there. Therefore two conditions must be met:
  *
  *   - CPUState is synchronized before calling this function
  *   - pc is only updated once the character is successfully returned
  *
- * Returns: character read OR cpu_loop_exit!
+ * Returns: number of characters read, OR cpu_loop_exit!
  */
-target_ulong qemu_semihosting_console_inc(CPUState *cs);
+int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
 
 /**
  * qemu_semihosting_log_out:
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index f14c6ae21d..2029fb674c 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -56,21 +56,23 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
  * program is expecting more normal behaviour. This is slow but
  * nothing using semihosting console reading is expecting to be fast.
  */
-target_ulong qemu_semihosting_console_inc(CPUState *cs)
+int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 {
-    uint8_t c;
+    int ret;
     struct termios old_tio, new_tio;
 
     /* Disable line-buffering and echo */
     tcgetattr(STDIN_FILENO, &old_tio);
     new_tio = old_tio;
     new_tio.c_lflag &= (~ICANON & ~ECHO);
+    new_tio.c_cc[VMIN] = 1;
+    new_tio.c_cc[VTIME] = 0;
     tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
 
-    c = getchar();
+    ret = fread(buf, 1, len, stdin);
 
     /* restore config */
     tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);
 
-    return (target_ulong) c;
+    return ret;
 }
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5d10a2b932..20d97290ff 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -415,8 +415,15 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        ret = qemu_semihosting_console_inc(cs);
-        common_semi_set_ret(cs, ret);
+        {
+            uint8_t ch;
+            int ret = qemu_semihosting_console_read(cs, &ch, 1);
+            if (ret == 1) {
+                common_semi_cb(cs, ch, 0);
+            } else {
+                common_semi_cb(cs, -1, EIO);
+            }
+        }
         break;
 
     case TARGET_SYS_ISERROR:
diff --git a/semihosting/console.c b/semihosting/console.c
index 7b896fe43b..df618a28a4 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -144,12 +144,14 @@ static void console_read(void *opaque, const uint8_t *buf, int size)
     c->sleeping_cpus = NULL;
 }
 
-target_ulong qemu_semihosting_console_inc(CPUState *cs)
+int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
 {
-    uint8_t ch;
     SemihostingConsole *c = &console;
+    int ret = 0;
 
     g_assert(qemu_mutex_iothread_locked());
+
+    /* Block if the fifo is completely empty. */
     if (fifo8_is_empty(&c->fifo)) {
         c->sleeping_cpus = g_slist_prepend(c->sleeping_cpus, cs);
         cs->halted = 1;
@@ -157,8 +159,14 @@ target_ulong qemu_semihosting_console_inc(CPUState *cs)
         cpu_loop_exit(cs);
         /* never returns */
     }
-    ch = fifo8_pop(&c->fifo);
-    return (target_ulong) ch;
+
+    /* Read until buffer full or fifo exhausted. */
+    do {
+        *(char *)(buf + ret) = fifo8_pop(&c->fifo);
+        ret++;
+    } while (ret < len && !fifo8_is_empty(&c->fifo));
+
+    return ret;
 }
 
 void qemu_semihosting_console_init(void)
-- 
2.34.1


