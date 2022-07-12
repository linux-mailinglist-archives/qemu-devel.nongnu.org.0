Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4205727FF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:58:10 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMxN-0003Ky-G9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtw-0006AW-Va
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtu-0007Cw-6P
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r10so6669775wrv.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jkHITop9GlZLzDollgFX8D+ZcnqZzYe+NeYjkL5aFv4=;
 b=cgzyr9IR8kz7WfwftTT5XfynA3NoPljzKZqsqrx4iIkQvASso4DuOZnN0YVdX8f0uU
 cncxfbHgFQ0MO9wbGvvF7pKsb3kli7/3xfVQbZ/U4FrfKa2xAc3YcU28zqBaeJaoLcyo
 HHPrXMfl5/fQGQJUEBZR1necKKutEKvtOTiqmwr2qCMNp/T7AgP+d1v7CIZV/Yt1W8qD
 y051+l1Y+dwR6b6gvm+4BYZHHO7cLvgyGUZDx7LHrcECWOFa8hubMI5PxuFJ4W0fZvuf
 6FlJENicNENz99f5blx7OJAq1gDc1o5aVDz2xLQKLQVNBCg7d2zRDk8jdjKS0hRqOxYX
 HNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jkHITop9GlZLzDollgFX8D+ZcnqZzYe+NeYjkL5aFv4=;
 b=mCQk6egE01mdCahbasQMA5fuKxmcqkQht33yUPXxi01qF3gAw2x6SnUt89drh6dzR8
 DsofZKfJN+hNr70oFa2IZDPNke58o94J+OnB1SMOc5a3Y/x96AKFaiAskJ3qFG9LZ6SM
 w8c6eI185ka2662peJXqWWFZPmchrwtRDGxI50snxY5LRpNt2jcquMcZyUr5rdeI+H97
 FR8NRF4LhF7AxN7rIT57qLpajLFC0yCa9mB96p9XMrAEqebqqcmKMIblbFKYoWblK1dE
 K67H3ikgdopVPyu3X6ZI5rgh82H/ipRlp7ZC7Tt7PcvmQ+rDVWgFL5hbcdpB7HI8zhtX
 c7pA==
X-Gm-Message-State: AJIora9yA9BsXEtBVstLKqg+uoakOo3M783UWTXhlnJFvZ9mf4EclqAC
 eLPrOt0V2U+/pJs6p1PmsoKELPoeez6qcLLu
X-Google-Smtp-Source: AGRyM1tdUcyie61CM3QDYUx4OmE08jS+OtQIR0kxZPU1xz07EqvQT9OItVoA/FdkEq32qlRJTLKQPw==
X-Received: by 2002:a5d:4345:0:b0:21a:3b82:ad57 with SMTP id
 u5-20020a5d4345000000b0021a3b82ad57mr24301603wrr.176.1657659272999; 
 Tue, 12 Jul 2022 13:54:32 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adfe4c6000000b0021d7799cf4csm9124227wrm.61.2022.07.12.13.54.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:32 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/12] target/mips: Avoid qemu_semihosting_log_out for UHI_plog
Date: Tue, 12 Jul 2022 22:53:43 +0200
Message-Id: <20220712205347.58372-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Use semihost_sys_write and/or qemu_semihosting_console_write
for implementing plog.  When using gdbstub, copy the temp
string below the stack so that gdb has a guest address from
which to perform the log.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-5-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 52 +++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 5b78cf21a7..ad11a46820 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -310,20 +310,50 @@ void mips_semihosting(CPUMIPSState *env)
         }
         gpr[2] = copy_argn_to_target(env, gpr[4], gpr[5]);
         break;
+
     case UHI_plog:
-        GET_TARGET_STRING(p, gpr[4]);
-        p2 = strstr(p, "%d");
-        if (p2) {
-            int char_num = p2 - p;
-            GString *s = g_string_new_len(p, char_num);
-            g_string_append_printf(s, "%d%s", (int)gpr[5], p2 + 2);
-            gpr[2] = qemu_semihosting_log_out(s->str, s->len);
-            g_string_free(s, true);
-        } else {
-            gpr[2] = qemu_semihosting_log_out(p, strlen(p));
+        {
+            target_ulong addr = gpr[4];
+            ssize_t len = target_strlen(addr);
+            GString *str;
+            char *pct_d;
+
+            if (len < 0) {
+                report_fault(env);
+            }
+            p = lock_user(VERIFY_READ, addr, len, 1);
+            if (!p) {
+                report_fault(env);
+            }
+
+            pct_d = strstr(p, "%d");
+            if (!pct_d) {
+                FREE_TARGET_STRING(p, addr);
+                semihost_sys_write(cs, uhi_cb, 2, addr, len);
+                break;
+            }
+
+            str = g_string_new_len(p, pct_d - p);
+            g_string_append_printf(str, "%d%s", (int)gpr[5], pct_d + 2);
+            FREE_TARGET_STRING(p, addr);
+
+            /*
+             * When we're using gdb, we need a guest address, so
+             * drop the string onto the stack below the stack pointer.
+             */
+            if (use_gdb_syscalls()) {
+                addr = gpr[29] - str->len;
+                p = lock_user(VERIFY_WRITE, addr, str->len, 0);
+                memcpy(p, str->str, str->len);
+                unlock_user(p, addr, str->len);
+                semihost_sys_write(cs, uhi_cb, 2, addr, str->len);
+            } else {
+                gpr[2] = qemu_semihosting_console_write(str->str, str->len);
+            }
+            g_string_free(str, true);
         }
-        FREE_TARGET_STRING(p, gpr[4]);
         break;
+
     case UHI_assert:
         GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
         printf("assertion '");
-- 
2.36.1


