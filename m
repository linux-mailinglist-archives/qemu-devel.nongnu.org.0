Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A053A518EB3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:28:50 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz8b-0006D8-Ie
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWW-0002Hx-MT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:29 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWS-0003d0-VU
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id o69so14879610pjo.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9xC9HPdGYz0Z+ceTMk4d0rDxEgPYsoRaTR0YGxBhWY0=;
 b=AYKCtFqbfUzgbf6xqzjjAhnWJ9dPDU8ZH8IpLNrlr98eS+KQsnzHYkE8MzTEJxW+TZ
 52Xcxuf8eV4Vc9WriR+8A061rWRTzVoWbFBK9zQJ5MwElfrDg66yX2rBQdugMhq+koIE
 oRjNeH2bfi+0tLZ3QD+xvmRrfkVkvSF1BMIQ0MQd/6UDvbWxhu2vLGQZC1z5zuFJDgbL
 w71FqmoP3xhvvInqJrGi1UkqSDIV3CRvW3BPciNgbkIqmXf1lsIAlya+e3q6MhzUe3ru
 q21Mz2EDPB/SPx7o8kjz1TUnMNx7d6drGtSspq07LQw/aFbsay7QgntmFeOpzk7mT7k3
 gwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xC9HPdGYz0Z+ceTMk4d0rDxEgPYsoRaTR0YGxBhWY0=;
 b=ayVKlcSemJh22n0xfUryM1389bbN7Ad3fsw5oQEhc7Wce3MITCl2G5ZhLvQSazhNZX
 YYGrBKVAAbyig2n7ToF+f1FX5oOpQzAzxqnPTi61QyrJ80JDUViKbG4cBDkjt/38ApfY
 ThRBUlK5GVuPuk3m5AvqMSU+e2/LOEx40qdkm3zGfZvVgUlUM7xiExXAAezjvOnYMJmu
 wrBRyRMcA7C6mIvQu0/eiDDjajhVdZTSBR8123U9G9xEkmbPjA6BH0b30YyOKSe5mfBA
 GzhIRics/UMxRVyDBHmqtGONrsqk+BKXvGgs+wz/dOujCgk6kttxnDXpqkQDouLm4zX5
 92pA==
X-Gm-Message-State: AOAM5325TSImkHyGh2Rh8f1ipqKsixI6i7apMLPQ9TQs/UE17W97oM0E
 YLH8PUhMs3wrNPkgUvxJ0GNJAZ4DTQqLvg==
X-Google-Smtp-Source: ABdhPJzA6zelEf1pAaLLJMYyRegw9nD7j4CqkJyTOqNaA23g8If8uVHJ4ZhclPv4p7p9V7Sq+Eq4Tg==
X-Received: by 2002:a17:90b:3c4e:b0:1dc:9999:44eb with SMTP id
 pm14-20020a17090b3c4e00b001dc999944ebmr80942pjb.179.1651607362297; 
 Tue, 03 May 2022 12:49:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/74] semihosting: Expand qemu_semihosting_console_inc to
 read
Date: Tue,  3 May 2022 12:48:06 -0700
Message-Id: <20220503194843.1379101-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index c4cf33fe0e..d60f7ed6a4 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -418,8 +418,15 @@ void do_common_semihosting(CPUState *cs)
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


