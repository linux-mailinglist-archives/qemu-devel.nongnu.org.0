Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C92B9385
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:20:54 +0100 (CET)
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjrp-0001g0-6t
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfjpW-0007y8-Kl
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:18:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfjpU-0006Ty-MH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 08:18:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id p1so6349528wrf.12
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 05:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+P15iR/bWrJBHOJx33YiIQBU3fpyBSJHI3jMMJ+Wa4=;
 b=PyRluMnB6sOSJC/aVzwP5aBGsCZO3No5faIa2Dr4W3eh/FdGks9RH1oU1OeywoT1Pf
 bdIVr3R89a1AWoMbTFynL9kNwgdoqBueN9rbBGxmzFC+uQN4RlEhX8WjYpB8HrWWDWug
 f29bZbgTED9xB4zE1if6OZ1u8VM5x+MupkM6sd5T6n+l8kNVSMIVfRSq+1KmbndpGYzl
 Y5rjcWZj9CauVMBn1aAfbOuYj8cnGRRfpKsXahlklxXkTfRFBpUwbsZyJxwLbLZoRYYs
 0YxYFMNRR8z76CqFv12STwcuysk+T43FIZZ+iqhGbaYGVFN6Rzh75fzZQqLNUK6CY5Qw
 AE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O+P15iR/bWrJBHOJx33YiIQBU3fpyBSJHI3jMMJ+Wa4=;
 b=s9olcb49dT6hF/rEtK7qIfWpeq1C9bmj/4JsP0/Lb87+OKCa+IHwlRyXZbN1XrWu4C
 mX1QfCIEMUwT4tSRVoFWmow6jK04d1Dg4pUxV93oTPg9dVQDYYSFINS3j12a2DGVMNfZ
 y+YyXKHXYOiaIKrQNA3UYB0/zN0oC8ZVndQ4HO6TI2d8kB8OMzg2f05x1fmtFYiKbx96
 qk4q/MvsuRwIrgXU0uEaYszBvqHBwZVV7vAZzJQnDdrpLkRWGPINralolj7SHl59R/KH
 C37td49A10xh+oXdZ6z3mfK5yz7OGStVB8D5s5IGk88SKZbBlDJgb+18og+mckKDHXNM
 WXxQ==
X-Gm-Message-State: AOAM532CUxPL1yAvwqm0TjqXjBjvoRTiln8DIMuX2Gpb2pRJUx9EFVnd
 1yuRtLmbB7oqev714TZv6YKgZsaHAFM=
X-Google-Smtp-Source: ABdhPJy3V3xPkabk19+hgK5VKCGDd+vjfYak3+1kkTRArv1dEXLBqC2KJOlpwiSyUd7s9Zr23PAyBQ==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr10037808wrm.159.1605791906842; 
 Thu, 19 Nov 2020 05:18:26 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j8sm35148282wrx.11.2020.11.19.05.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 05:18:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips/helper: Also display exception names in user-mode
Date: Thu, 19 Nov 2020 14:18:24 +0100
Message-Id: <20201119131824.1898439-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently MIPS exceptions are displayed as string in system-mode
emulation, but as number in user-mode.
Unify by extracting the current system-mode code as excp_name()
and use that in user-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/helper.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 063b65c0528..f566bd6da50 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -978,6 +978,7 @@ hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
         return physical;
     }
 }
+#endif
 
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
@@ -1018,7 +1019,14 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_MSADIS] = "MSA disabled",
     [EXCP_MSAFPE] = "MSA floating point",
 };
-#endif
+
+static const char *excp_name(int32_t exception)
+{
+    if (exception < 0 || exception > EXCP_LAST) {
+        return "unknown";
+    }
+    return excp_names[exception];
+}
 
 target_ulong exception_resume_pc(CPUMIPSState *env)
 {
@@ -1091,19 +1099,14 @@ void mips_cpu_do_interrupt(CPUState *cs)
     bool update_badinstr = 0;
     target_ulong offset;
     int cause = -1;
-    const char *name;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && cs->exception_index != EXCP_EXT_INTERRUPT) {
         if (cs->exception_index < 0 || cs->exception_index > EXCP_LAST) {
-            name = "unknown";
-        } else {
-            name = excp_names[cs->exception_index];
-        }
-
         qemu_log("%s enter: PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx
                  " %s exception\n",
-                 __func__, env->active_tc.PC, env->CP0_EPC, name);
+                 __func__, env->active_tc.PC, env->CP0_EPC,
+                 excp_name(cs->exception_index));
     }
     if (cs->exception_index == EXCP_EXT_INTERRUPT &&
         (env->hflags & MIPS_HFLAG_DM)) {
@@ -1490,8 +1493,8 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
 {
     CPUState *cs = env_cpu(env);
 
-    qemu_log_mask(CPU_LOG_INT, "%s: %d %d\n",
-                  __func__, exception, error_code);
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
+                  __func__, exception, excp_name(exception), error_code);
     cs->exception_index = exception;
     env->error_code = error_code;
 
-- 
2.26.2


