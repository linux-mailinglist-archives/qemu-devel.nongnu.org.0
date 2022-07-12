Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A3572842
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:11:02 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBN9q-0000Qy-35
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMuH-00079e-Lt
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMuG-0007IY-0k
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id f2so12814627wrr.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J+fYyUK4Wn/KdMxUP+5nF/zpMZEk/uz6FzEWPHrbQtQ=;
 b=fLcXoP5nHs2nXupXU8cRkw1+IAK5146OcyGyGjC5xXkKLXFMhb4Zi3+GsZd8EFP9Nz
 9+OLUPNG2St9HT4RilRdsxKVQJIu1CcL/T9FAxjDHr9UwBxTjQWNuh8pX3AWpCX0ryBI
 7IUyFpmKQ2s6KK+A3YGvaBNOzoJI7+edGJxyCpfXmvTTYKc59at47NPwIzdTU5PWftAL
 /HbpfwSFm3DGQaWbdl1shq+1B9NzGVkJzKXRAVvB7BuKZDC/bY5ZVnRCzZcF8cH+xQBm
 40Jw0X9l8goKIdU3wgQF0weRLL4t2vT1njtq6lpypqwDyZnPh9ag7pXMF8nIZxSK2CIJ
 32Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J+fYyUK4Wn/KdMxUP+5nF/zpMZEk/uz6FzEWPHrbQtQ=;
 b=QkmZL96XxgiapxgkNuJdtXvPPQtE/HGItGIxrmcV4u5EsqfzGLGGhLrzVefiz4qeCo
 Ns+h11dQpwjDdj6sIHXCFAmPVb5UFDWW/84Keq/mW4bfq/lm6I5KoCPYWmzu1+SgnBiz
 /ttcdMv7t85Rzd6ORFhpyFpEb2aKcMssbWbo5chhdNeLqdjVWJ6jsaNN7xpTDohprmsg
 JSMfs0/upPPfae0/VxwhqV8mPP1BWThTB27CPEhw6lvhuertZ1lXJaOV+AdwgGD+ul97
 jqPyJSomIk7ElkoBYru+3hGSsHFtwV7Quk2gTkjxR4jr11zHbc7H2F3OgsgHkJr8Hejw
 qxDA==
X-Gm-Message-State: AJIora9QKVoJnpY1vZzfIOE1cFQTwBKqBmGVSCwf1iu7pU6frx48WF6y
 cXF1lAq+KkcblN8HkYp1+T7tiEzp7prkaXAJ
X-Google-Smtp-Source: AGRyM1soun2R9vZ4GXwv9N5Rg658M+GnTn+hwGBL1jkmO2SI8KT47XlVvppgDebVY8lNNZAHKMdFeg==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr24447112wrz.690.1657659294357; 
 Tue, 12 Jul 2022 13:54:54 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc450000000b003a2d6f26babsm105028wmi.3.2022.07.12.13.54.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:53 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/12] target/mips: Remove GET_TARGET_STRING and
 FREE_TARGET_STRING
Date: Tue, 12 Jul 2022 22:53:47 +0200
Message-Id: <20220712205347.58372-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Inline these macros into the only two callers.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220628111701.677216-9-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index b54267681e..5fb1ad9092 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -198,19 +198,6 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
     uhi_cb(cs, ret, err);
 }
 
-#define GET_TARGET_STRING(p, addr)              \
-    do {                                        \
-        p = lock_user_string(addr);             \
-        if (!p) {                               \
-            report_fault(env);                  \
-        }                                       \
-    } while (0)
-
-#define FREE_TARGET_STRING(p, gpr)              \
-    do {                                        \
-        unlock_user(p, gpr, 0);                 \
-    } while (0)
-
 void mips_semihosting(CPUMIPSState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -225,9 +212,13 @@ void mips_semihosting(CPUMIPSState *env)
 
     case UHI_open:
         {
+            target_ulong fname = gpr[4];
             int ret = -1;
 
-            GET_TARGET_STRING(p, gpr[4]);
+            p = lock_user_string(fname);
+            if (!p) {
+                report_fault(env);
+            }
             if (!strcmp("/dev/stdin", p)) {
                 ret = 0;
             } else if (!strcmp("/dev/stdout", p)) {
@@ -235,7 +226,7 @@ void mips_semihosting(CPUMIPSState *env)
             } else if (!strcmp("/dev/stderr", p)) {
                 ret = 2;
             }
-            FREE_TARGET_STRING(p, gpr[4]);
+            unlock_user(p, fname, 0);
 
             /* FIXME: reusing a guest fd doesn't seem correct. */
             if (ret >= 0) {
@@ -243,7 +234,7 @@ void mips_semihosting(CPUMIPSState *env)
                 break;
             }
 
-            semihost_sys_open(cs, uhi_cb, gpr[4], 0, gpr[5], gpr[6]);
+            semihost_sys_open(cs, uhi_cb, fname, 0, gpr[5], gpr[6]);
         }
         break;
 
@@ -314,14 +305,14 @@ void mips_semihosting(CPUMIPSState *env)
 
             pct_d = strstr(p, "%d");
             if (!pct_d) {
-                FREE_TARGET_STRING(p, addr);
+                unlock_user(p, addr, 0);
                 semihost_sys_write(cs, uhi_cb, 2, addr, len);
                 break;
             }
 
             str = g_string_new_len(p, pct_d - p);
             g_string_append_printf(str, "%d%s", (int)gpr[5], pct_d + 2);
-            FREE_TARGET_STRING(p, addr);
+            unlock_user(p, addr, 0);
 
             /*
              * When we're using gdb, we need a guest address, so
-- 
2.36.1


