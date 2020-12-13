Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C32D9070
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:22:32 +0100 (CET)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXt1-0003O0-3f
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXr6-0001eY-5H
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXr4-0005MF-Hg
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y23so13446794wmi.1
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WU7av211Gw3wbADY6XPgoCLNL0Q/6KDqRZlDd72LlCc=;
 b=lg3Plv9yDZIf0oqfQcqIFKuS+fY1twqqoLWJGkP/0s5QmgX9g+AcAhlXe1vIXb4SkU
 u6+sEEol4i03yQAqE9FQXbu+uJeG4jQ718E7L+3h4cgjvP6xQ1yzqV14WzhsvaDrVG0P
 XTMhtyIG1mGkUbiZ7EkPa89KKSkfSi4+ZKW1Capz0GuBJr3TBqqMgLU9DJ5WgV3BQGZ+
 CdCT70G6GNCe49e0Qzn/arC9q/YMgpkeOdC5fZdvpcze8suLyybPK+ZM84FYfw742Tk0
 SrhkkMAjcR233PY95gVChi8+8HwmS3hTg9g4QhMLzpOsJw2UyGpoLsFgG/Ul6Ol8kqE4
 8OqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WU7av211Gw3wbADY6XPgoCLNL0Q/6KDqRZlDd72LlCc=;
 b=P0rAvTkS4jTcnKlXqAUH2K2qr6vtJlH2px6BBcXY7UfA//rtziANTrc5pSAmjEeGkX
 oCxMiQNghcKYF0zSjJjawoZnvGbjfs+ymNa7sy/UYCdokknVJe0GtoxOGb78o2JLP7gY
 ZUtM/nWg5GEBulgtPlDVTaXOZ+jpyT9CEFXjczzgZPQPJVRFVPWH4aJ6Yhd9X4mjIMi9
 OZqD1UVe78KBJNU5y/+tPy+zs+JMujJg2UmgUBUzOWTQHJxvyQTFV/6nOMjDp3TCueEg
 VfdxBWEs0Ty5EWIpH4IE7CIom0RwWnEIoXKRpt9yLq0XCY9RL6/GUNgg8jGZy3Qt6EmT
 vFDQ==
X-Gm-Message-State: AOAM532jqTTMQW76lxDiUCVDn5/F79LxKPqULQtdHZuQH1Grg817+hI9
 nZs7Vi3gbsVqAWR1IBLHDr0GQr3WOyM=
X-Google-Smtp-Source: ABdhPJwGswfU1INeuc5+Xpdh/7IEhKrZYuniVVNcdgaPCtjzp2Ttm7znjOhHTptaP+0DrvPGZdnyxQ==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr24378018wmh.25.1607890828851; 
 Sun, 13 Dec 2020 12:20:28 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 64sm28192537wmd.12.2020.12.13.12.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] target/mips: Also display exception names in user-mode
Date: Sun, 13 Dec 2020 21:19:28 +0100
Message-Id: <20201213201946.236123-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently MIPS exceptions are displayed as string in system-mode
emulation, but as number in user-mode.
Unify by extracting the current system-mode code as excp_name()
and use that in user-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201119160536.1980329-1-f4bug@amsat.org>
---
 target/mips/helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 041432489d6..59de58fcbc9 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -978,6 +978,7 @@ hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
         return physical;
     }
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
@@ -1018,7 +1019,14 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_MSADIS] = "MSA disabled",
     [EXCP_MSAFPE] = "MSA floating point",
 };
-#endif
+
+static const char *mips_exception_name(int32_t exception)
+{
+    if (exception < 0 || exception > EXCP_LAST) {
+        return "unknown";
+    }
+    return excp_names[exception];
+}
 
 target_ulong exception_resume_pc(CPUMIPSState *env)
 {
@@ -1091,19 +1099,13 @@ void mips_cpu_do_interrupt(CPUState *cs)
     bool update_badinstr = 0;
     target_ulong offset;
     int cause = -1;
-    const char *name;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && cs->exception_index != EXCP_EXT_INTERRUPT) {
-        if (cs->exception_index < 0 || cs->exception_index > EXCP_LAST) {
-            name = "unknown";
-        } else {
-            name = excp_names[cs->exception_index];
-        }
-
         qemu_log("%s enter: PC " TARGET_FMT_lx " EPC " TARGET_FMT_lx
                  " %s exception\n",
-                 __func__, env->active_tc.PC, env->CP0_EPC, name);
+                 __func__, env->active_tc.PC, env->CP0_EPC,
+                 mips_exception_name(cs->exception_index));
     }
     if (cs->exception_index == EXCP_EXT_INTERRUPT &&
         (env->hflags & MIPS_HFLAG_DM)) {
@@ -1490,8 +1492,9 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
 {
     CPUState *cs = env_cpu(env);
 
-    qemu_log_mask(CPU_LOG_INT, "%s: %d %d\n",
-                  __func__, exception, error_code);
+    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
+                  __func__, exception, mips_exception_name(exception),
+                  error_code);
     cs->exception_index = exception;
     env->error_code = error_code;
 
-- 
2.26.2


