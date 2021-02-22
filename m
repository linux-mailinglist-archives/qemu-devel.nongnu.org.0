Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59932224C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:44:22 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJwD-0005rV-BX
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrk-0001Pa-U2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:44 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrj-0005cN-E8
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:44 -0500
Received: by mail-ed1-x532.google.com with SMTP id h25so10276900eds.4
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IX1y81rCSxsmxkLrafmm9o5V9M7N65ucGEOOogWT+Hk=;
 b=XPb/LbDx+Dhpl12y6FfQEWcKWUJfJtfWL/AMEwvn6IfAi1o9Eu1R7G1hXg+3R8jWrT
 Yc3z4CYJixEj2sYDUgXKo/dOVQhJ/zS6e7/DeNUV8gSWnKrPQYDw3LH8PoOYGbhKIYJl
 GfQ6P7LvW75QH38e/7QBf3K/DbSOhVQc7RvfefjS8xYKcu+fjOMHQhTAJk8V9QSOkjgR
 iUWIMSqnBq7rBK3a5RVYV9TSAw4wH0GHTWCJw88J7fWovdCBjQlXoNJUqHFXQEAOvwTS
 oOuOrziUwbnKXiDAw8+yr128XRBNSFJJCBpnLoF4EJXQmFxjYl/PChChX4FQieFidaON
 5bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IX1y81rCSxsmxkLrafmm9o5V9M7N65ucGEOOogWT+Hk=;
 b=DXk7Jd8uSLsfa6qURRCo8TyO50CKCU3fMFD1xBSbo+j5ERJfzsthw4at4+2AvZ+zXZ
 KuSuhEhDPv4TAOEgOoHj5AUpbzXGlqdckfwvMLW+g+Vv56e/Bf3q1jX2r1fo5vtzlmPT
 z6L4plRvK/GAy5su2il3u/WpcOurN3OHwx4c6ghyqto9xQPq/2hfmqfeBrW6KeBOdUrI
 +s8xpuS+W8t6lgfQbBZgZec3yPgylN21aVMv6P2rbsk5yGg47ukitF2jirvFQl2ySzt0
 +L/ZbT8GOv5cO1b7w2aHDxx3kbmc7pn1RvNWD9zYDXmb2BitFpKyzDwZhHnV/ef4XyGQ
 sUvg==
X-Gm-Message-State: AOAM531wRA2IRLZt4xEiAufCRic5oDLEniX05LpHd38awZtW5XIWtn4j
 PaLWCBa4RWMts1gTApGt+PSRIiXnskc=
X-Google-Smtp-Source: ABdhPJx15WZ18nUza30TFraGESL160VTcOu5HPVDOFVRzGrqcGxzRKiAkiabbteoo0bEEAhI8gwSEw==
X-Received: by 2002:aa7:cb0d:: with SMTP id s13mr24462399edt.221.1614033581841; 
 Mon, 22 Feb 2021 14:39:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y11sm10660378edw.18.2021.02.22.14.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/10] target/mips: Introduce mxu_translate_init() helper
Date: Mon, 22 Feb 2021 23:38:58 +0100
Message-Id: <20210222223901.2792336-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the MXU register initialization code from mips_tcg_init()
as a new mxu_translate_init() helper

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c897f3900d8..52a7005e18f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2045,7 +2045,20 @@ static const char * const mxuregnames[] = {
     "XR1",  "XR2",  "XR3",  "XR4",  "XR5",  "XR6",  "XR7",  "XR8",
     "XR9",  "XR10", "XR11", "XR12", "XR13", "XR14", "XR15", "MXU_CR",
 };
-#endif
+
+static void mxu_translate_init(void)
+{
+    for (unsigned i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
+        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
+                                        offsetof(CPUMIPSState, active_tc.mxu_gpr[i]),
+                                        mxuregnames[i]);
+    }
+
+    mxu_CR = tcg_global_mem_new(cpu_env,
+                                offsetof(CPUMIPSState, active_tc.mxu_cr),
+                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
+}
+#endif /* defined(TARGET_MIPS64) */
 
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
@@ -28064,16 +28077,7 @@ void mips_tcg_init(void)
                                    "llval");
 
 #if !defined(TARGET_MIPS64)
-    for (i = 0; i < NUMBER_OF_MXU_REGISTERS - 1; i++) {
-        mxu_gpr[i] = tcg_global_mem_new(cpu_env,
-                                        offsetof(CPUMIPSState,
-                                                 active_tc.mxu_gpr[i]),
-                                        mxuregnames[i]);
-    }
-
-    mxu_CR = tcg_global_mem_new(cpu_env,
-                                offsetof(CPUMIPSState, active_tc.mxu_cr),
-                                mxuregnames[NUMBER_OF_MXU_REGISTERS - 1]);
+    mxu_translate_init();
 #endif /* !TARGET_MIPS64 */
 }
 
-- 
2.26.2


