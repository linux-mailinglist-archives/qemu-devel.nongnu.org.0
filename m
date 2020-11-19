Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7122B9747
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:07:22 +0100 (CET)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmSv-00016g-7X
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmRL-0000RN-48
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:05:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmRI-0002C5-TN
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:05:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id 23so6972897wrc.8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uY4y2SOxLmAH/47jWYQ27WEhOt045+ttiaLR6ij77aU=;
 b=Cv5I8fmLEsFx/MhLs5bCU3bCElmKgOgd+pVer1/LCJbkM+41ucMDBBXLq1PRug+M4m
 73caqMpzkhwvyJ0N+syfZIMktkbD2NkaDhCOswKLtZ60vH55zTR5pzBbicB248wFn4ZS
 DUPpidzOWwnJBkCG7hXbNvbvFFrv+AVZ3VI+yDGq+N2xpOlF4jAKn2iFFuwB6rZfnKCd
 9i3jhsFJPP+Y0GAXIuBzqdIws0wiLAgTJPEBw7UZ+5TR41DTrE0g3mxmixjJ4N5sPxaC
 KZWxurSQSeuhV/FTjp7/X9p6o1ZIQwwg1TR4umfJQxbjQzMY8hPZF4xi8K8PGFXaq1Ja
 iQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uY4y2SOxLmAH/47jWYQ27WEhOt045+ttiaLR6ij77aU=;
 b=DmiYyNLgM6VjOdj/VsAecmWbkKO3vlotrXayAd8pw+1D5OKDcy7aNqeJy/wGiCZhwO
 kTT8C767eDL0O9lFOcNJOL1tpSvUrI4kZO6VtwyXP/74HCPU4R6F78X2O3DOzFsY/Uvo
 +3p4x1TN+J4jdYVxq2Mi8wKVPSrHXTwBGJp3mJWgDmBO8Lqww/OPgRXVepWI65Vkb8NH
 53wFlOEFvmMoLBWlBA19BUO+qL2bsKXMj5RbTxwOyQigfKJzfWRB4d5Q6wu/PhhvUW9K
 DDE8cV5bHg93gS3VvLluSGJWcb1uPCeBEhONI6SaTMIoyQ6xd6py4BdxprwvCDklQEDz
 lP9A==
X-Gm-Message-State: AOAM53134vOSlbJzLoIBpYtS1EBmdYwC57tnuzbRkh/LDC7TLMUPjiVp
 hsGu2qOoeeV6g5KJcop0Aeksqvo1fa8=
X-Google-Smtp-Source: ABdhPJzv8TJnewqbNExylQSCuFSf+GqcY68KR3e5xGkB75Ty/6ylSeTznhO+wfxtQ2LYtiavhPpQ3Q==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr11725639wrm.403.1605801938990; 
 Thu, 19 Nov 2020 08:05:38 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v6sm292995wrb.53.2020.11.19.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:05:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips/helper: Also display exception names in
 user-mode
Date: Thu, 19 Nov 2020 17:05:36 +0100
Message-Id: <20201119160536.1980329-1-f4bug@amsat.org>
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently MIPS exceptions are displayed as string in system-mode
emulation, but as number in user-mode.
Unify by extracting the current system-mode code as excp_name()
and use that in user-mode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since v1: Fixed failed cherry-pick conflict resolution
---
 target/mips/helper.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index 063b65c0528..b51b557c8c2 100644
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
+                 excp_name(cs->exception_index));
     }
     if (cs->exception_index == EXCP_EXT_INTERRUPT &&
         (env->hflags & MIPS_HFLAG_DM)) {
@@ -1490,8 +1492,8 @@ void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env,
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


