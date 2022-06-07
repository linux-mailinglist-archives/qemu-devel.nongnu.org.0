Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25475541F34
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:49:50 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi1F-0008UZ-7u
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0005hG-UT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:47 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg8z-0001oq-7a
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id d13so167711plh.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HU5FIL8krVKmFqQext3ojwIXl0oRCXQ5TpFvX+W81lE=;
 b=LRrjgaAcsdNIRTmBwO4RtkSOy/RZWYBltUq3bHMUT6RE2py6CB0Ya9BFR+Wd0Lw2h/
 hoxUjL2nWMGRX2369rNzDihgwDuSR1xNxRLu9NHnOUQgeh+PdYrME/lPeQhv/iQnj7Y/
 CYIJeHLFyuYtyg59GG5e/11na38Hvy5pAQ65Uo97SdeO05yoql6EmuK2wmma3CrcthMz
 kGGqKV3oWzFUsB97JxY29pN0ZpZ01yWyz8DFn9GlpaN5dZxoceiu2KO0HbGxJ4gp6Q3q
 OoeEIoimZGa7bpjpIJS5WeBkNe5cj00EjxhzWYapAianK3dIowH1l4S+roI7Q+D9AjOC
 piLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HU5FIL8krVKmFqQext3ojwIXl0oRCXQ5TpFvX+W81lE=;
 b=nYnhYU8lvT08M0moqKFos5/5yX+N3pJv1Gx06C8Fx1aTr8lP1Ih4ltptLs523HSqRj
 0jup383wBuwQEe+KHThg3sh7xK+J87+Yrw2HqEqjHciCMsL15Lvwecdqbvvpv5kLxB2k
 AG3NziARGKxXBXqfa2XZ2INQE0rk+gx3mzW3Pv6WmLsrbvVf7zOTMtkURSzsrU+TBye1
 jVEfVD+/7aC/jGnsEEoBb6j2WAhRysUMWg9bcG9dBq8u7B3PYl2eoY/sapSW6Wos1rHw
 lAShvA1Gxcjy0RIsEqz/BoJTV3mIVTCY5o91Y+PeG934BScdH+sq7I+Khs4yHFdvJSJr
 Fn2g==
X-Gm-Message-State: AOAM531ppROqXDdTOoODZ11W+M8N2CNpgZClkCvwqfP8HxtGMVncbQlT
 j+qYBhKxCQWPwxoJ5LHURmnyT+MI5qZ2aA==
X-Google-Smtp-Source: ABdhPJzGTXBYQUwcvsRiRc3ojXgjO42IKCZPCONIhHsDQsedyLg2uIx0aSOw3iwfp8RfTBI88THzAQ==
X-Received: by 2002:a17:90a:930b:b0:1bf:ac1f:6585 with SMTP id
 p11-20020a17090a930b00b001bfac1f6585mr33687030pjo.88.1654634978154; 
 Tue, 07 Jun 2022 13:49:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/53] semihosting: Expand qemu_semihosting_console_inc to
 read
Date: Tue,  7 Jun 2022 13:45:47 -0700
Message-Id: <20220607204557.658541-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index e7de52d042..20e99cdcc0 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -427,8 +427,15 @@ void do_common_semihosting(CPUState *cs)
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


