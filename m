Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2853AD2F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:38:02 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKJV-0007xU-IM
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBl-0001TQ-AL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:01 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBf-0001Pl-H7
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so8692543pjs.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9tona3FrkUxASE7ND04pERUPgqb3UguvkZrVQbmfTs=;
 b=XGhyRH02Fyr4/voCKwCAPEr0B4x8vc3L2NbBDdzNQsnHxPxANwVl8h5L50DOc8i55e
 bk0OmD06VXOypemhj2suNsbaVy7qjQ697b+RC4+YR3B+4K4Xk8M5gUsh4tLJudADHeTv
 yhOwKr/vAg38gCqGksA03Zj8FcGuKaF3IDZXcCeVjYmn+QaCvpHHtBsedEwAuwcMu3nq
 fweYBRTpvmim2QmTotKfFPeH5llUAeJjdCh4Z+8j7Y56AqjdUtzkpFG0vLNk7GBmD1VM
 Y+koyFj40SWI3zJJDdn3yAccCIBTNI+LPGEpmUVQOoq9pNv15eekpIMPUebNTPflj5o7
 DGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9tona3FrkUxASE7ND04pERUPgqb3UguvkZrVQbmfTs=;
 b=kAplMkpPY2E9RlD0STrhCsZPk2Kw2bITQZv33QwG9M8D5PC8Gj6Pti/cDIdxQX5Mnq
 NuKb+uVDALHm7I71Y9oITxcQkAiUgIZfcTgq2/hu/6SCl6Gt4f8QqNyHw1L5Yf589fLS
 9Z4sWVD9OP+aaOHz5gbvldt1oVGIrlgf/DncF5eLp/LtAPDmDZBWYmM4uCwhInNZOL90
 ZwwSYbUsRFgKZ7S9L2XH+89vD0jB7iLJlrjWQcBa5IeX+qUJKJr5HF/tKMX+0F065vFJ
 NbCyWcLRiMNRK6RzRRbbJ5xoar5pIKTu0+qAMB3lzLDY/Wqg5mEuUxc2A4145D/rFKbi
 z0kQ==
X-Gm-Message-State: AOAM532CXUvoIKgx/u68ATJWOe5sda2m0e40Fv8gdAkJqG4LPaM9PRkp
 2NdSwwfADgLdAzggMs2/GZ3xEaVeq/HISw==
X-Google-Smtp-Source: ABdhPJzJufPgqfIgvKOVF7cL0CRM36A6/sUC56obCxvRpklek7Pm7gkPCs8WqjpKoGhXatvJa050iw==
X-Received: by 2002:a17:90a:4311:: with SMTP id
 q17mr22724216pjg.204.1624044593605; 
 Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] linux-user/aarch64: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:30 -0700
Message-Id: <20210618192951.125651-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  2 ++
 linux-user/aarch64/signal.c        | 28 ++++++++++++++++++----------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 18013e1b23..7580d99403 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 662bcd1c4e..65b84eb04e 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -108,7 +108,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -495,15 +494,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
@@ -576,3 +567,20 @@ long do_sigreturn(CPUARMState *env)
 {
     return do_rt_sigreturn(env);
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * mov x8,#__NR_rt_sigreturn; svc #0
+     * Since these are instructions they need to be put as little-endian
+     * regardless of target default or current CPU endianness.
+     */
+    __put_user_e(0xd2801168, &tramp[0], le);
+    __put_user_e(0xd4000001, &tramp[1], le);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


