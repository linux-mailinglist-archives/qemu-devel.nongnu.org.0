Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4E455C0B3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:30:53 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Qi-0004Mt-3x
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69Dg-0003tR-Cc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:24 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69De-0003BX-J3
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:23 -0400
Received: by mail-pl1-x631.google.com with SMTP id d5so10740968plo.12
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmf1h8nOdErU6TZ6hYcqWua8rMBnQ07/JNvdx/MscPs=;
 b=ouguid+tSAGHPRXsP+HGdII8hmXvBG6zDRb3HcrqFWZZ7pvORmmPGTOJ3lYpv6tIxT
 HsQpopfZBCy+FFpnPEAETELzUkukxtx3RGVksQtNbAhwIErgTdL50I6Ko6fECqZO4dsz
 CkagfonMYNwComw+mwt1vAUj5AqkOjeD6JFT/jJuHUp+rROO31uy1eVT2wHRRaOI0VGV
 p5hAfMFPTmTtNMML4PD30F4o151KkxUbf5CFhK9F7m4hiDchzEu3XWVx9JCLF/bPSjfc
 XDloV+huBJvWfIUzD/VYkxteIo/+jJUWBNeZ4/B3IwXvdU8kP1AFqsc8kK5Yan9YT3oc
 ZQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmf1h8nOdErU6TZ6hYcqWua8rMBnQ07/JNvdx/MscPs=;
 b=NMkGvOdmGDk4+11ma5zJevH1i6PSsPMCMleXTHxVqmAub+pjfwkZ/puz8Sh7yK+bIv
 jdcxO/mWPdYFrBgT6kUmKz5Ppyn78AqpK9Q6VKx3cF+BNPddCy93ph5tSk/X1yexBSBa
 kw6zhMqGVKsrHykdhTaNKE/KO/Xe4xNe1xCK6/3emo+AZjld2a5Hqesbc3a7W73m+2Zv
 Ah7gUsEJNLTcwMVOcy/PZM6rto8AZX80Pd9IyVRzvNW3uSOc63PF5z2o88CHbA29NOKw
 i823nE+DM5Zwb/ElcgWPLHOzMg0er31vNTXlrwmQnItIOBEJFFjZdVZEuYW9vVEpm+/w
 klXQ==
X-Gm-Message-State: AJIora9s9A7zlMH82DFpDvis2wBnwmyc94ndr0Xvol6Tz9lHf5Wnfi4S
 +UzISfW3w7uTgkWfB9daJxVUqZJoyyyxdw==
X-Google-Smtp-Source: AGRyM1vAsvw2ioYqkAyFFP4RBsCkgiodAATNvz6UZN+Q0yRov2VvPqblOt3mRaAoZ01YXvMHt4JbdA==
X-Received: by 2002:a17:90b:17cb:b0:1ec:9d52:46f7 with SMTP id
 me11-20020a17090b17cb00b001ec9d5246f7mr21206084pjb.221.1656415041229; 
 Tue, 28 Jun 2022 04:17:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 4/8] target/mips: Avoid qemu_semihosting_log_out for
 UHI_plog
Date: Tue, 28 Jun 2022 16:46:57 +0530
Message-Id: <20220628111701.677216-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628111701.677216-1-richard.henderson@linaro.org>
References: <20220628111701.677216-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Use semihost_sys_write and/or qemu_semihosting_console_write
for implementing plog.  When using gdbstub, copy the temp
string below the stack so that gdb has a guest address from
which to perform the log.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


