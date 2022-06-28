Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D155BF5A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:13:51 +0200 (CEST)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66M2-0008TO-Bx
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JW-00020U-1p
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:05 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JS-0000W5-NE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:00 -0400
Received: by mail-pj1-x1032.google.com with SMTP id d14so11436914pjs.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmyDAD2u3RMCBNdl3aDHlvaK8YHnvUt0O1mqd+xCUGE=;
 b=yPzNIlLRl02tY5GNzHcbg5Ftr7Gjp5ATtWtnUDHZPiKklVbnNPhT7rJxV+gHfo3Xrz
 f1ZcnpJNXy4fwBm8RE77G4i2NscTtm0TpHKOI76D2wseGoKuF3Ly7PXKst+2euCL15wv
 oCIWyzHMwQXxporJ3VB+xzV6Fr2ETRFQxjOEqKX67PmRdLkXOdWrw9AXpo2YLVmhlIrk
 XtEbKfAvGnt2OvAbNYJRJ0zCiGXgphc/p3hgr12G907WdCYhzdib/ry5HxpSBBj6rxLo
 26YHihH0+32s9iG+VM08Y3MdafQwZuiXDU25yYvWDM1xehITMk7rLvSmwjxHpN1m8xTm
 LK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmyDAD2u3RMCBNdl3aDHlvaK8YHnvUt0O1mqd+xCUGE=;
 b=BeIydrsXLtk1WYmX+/BjbdjpJBE2NL9IYhm7S2+D5XazBmq1AyDLWYaJ+5s2KMe1oz
 BCUhwKDwjVesKopPNHgsF+udcYJyajdpGMx8wVt78ONVAaHBaOY2lNF7k52nT8zQDzcf
 49CBGhF3WakDNujzmcU/2LSbGEOe35+UI2gVvl1FMrJl77ms06Of1dimCcFLL/yvVoOW
 VjaC9rab6WAz7pzonb7EBDNl+ZAHXYa0Bm3akbkOcI4v7vC/lilWcZnzV9/NVXacies2
 k2l4aWJgzdLO5d2oV9PcszR6C4hNvLEar/mWivw3l8PqysWOIhOz67gWChpbHFLiwvkT
 dzvw==
X-Gm-Message-State: AJIora+mKedVK5rY7URXi3RqwGpJqiH+BtGbBxfyH/4233LrSNgWUqnm
 Gz5FW83g0UrMfUSrsqh1izMM6fh+TBrk4Q==
X-Google-Smtp-Source: AGRyM1ux7f6mhEiji5rfCMw6SZxBh11Y9BCQWisOF0MsBK8YbVuIuj0sv8no04pokajyYp9orMxv7A==
X-Received: by 2002:a17:90b:3584:b0:1ee:fa46:3986 with SMTP id
 mm4-20020a17090b358400b001eefa463986mr3367219pjb.227.1656392337342; 
 Mon, 27 Jun 2022 21:58:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:58:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 43/60] semihosting: Expand qemu_semihosting_console_inc to read
Date: Tue, 28 Jun 2022 10:23:46 +0530
Message-Id: <20220628045403.508716-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
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

Allow more than one character to be read at one time.
Will be used by m68k and nios2 semihosting for stdio.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 12 +++++++-----
 linux-user/semihost.c         | 10 ++++++----
 semihosting/arm-compat-semi.c | 11 +++++++++--
 semihosting/console.c         | 16 ++++++++++++----
 4 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 27f8e9ae2e..39dbf1b062 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -38,19 +38,21 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
 void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
 
 /**
- * qemu_semihosting_console_inc:
+ * qemu_semihosting_console_read:
  * @cs: CPUState
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
index 40f3730778..fdb143ace8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -428,8 +428,15 @@ void do_common_semihosting(CPUState *cs)
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
index 17ece6bdca..e5ac3f20ba 100644
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


