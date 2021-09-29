Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76241C570
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:21:26 +0200 (CEST)
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZWW-0003RC-UU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZI0-0006s9-Ik
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:24 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHy-0006C0-0K
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:23 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 o59-20020a9d2241000000b0054745f28c69so2708408ota.13
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/JBwXy3z5lR+XAAxPTtDygRF9ftMDjdSwtnKr4eEXKE=;
 b=Zn2ExfFG6FFHnTnWDlW/TO4P81U/lrd6S7owvw16ltEgEHafFUATWLp7XDFMDwr0cY
 fXcf3oasfOVA+PODZ+YrPhA0Q3sPPsNV3EDoqptsMD0lZ7AXP7ySw1YUtEI1qIOHTRXO
 x5NYx40Igo3GSHrmWD/b8lnZXhl4FgRA2eJXzA+eZcGJcTXjk5yAcEvThrd1a7DyUS6k
 D/IzOQJxpNaMBQSB96i04g1oeXXSkMicsgu2yaItPYxChoPC6YSUO/2yiQyuc/OcBuqk
 29wSRNl4ZWkCxTVHgng3XJ31FLYrf7BspvVgH4pbKVcO/E4LkChKxBl8IO1ESKkaUfSP
 4lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JBwXy3z5lR+XAAxPTtDygRF9ftMDjdSwtnKr4eEXKE=;
 b=uSTR6ETO66J8YubVHJyhjKA5suECkdYdz8G6QYtV7hGEeoNr9d9DLxsRTXmu62HTm5
 t/0ukIWXgjTeSwF32a4MbYGka2SceXGpY6wHRXKWmNE3oyXuwA1tw3F5t6q+nNj7NssO
 KSlzMYuhenGTx0RdWje1dPxxKiQZGhVUGltI13kS/uiVvkPkhuXNMHl7Ut08K/inqTPN
 mt3wlvVPUeFVTUYNj/ET4RrQX9+azm8o11Ae4CiCD2xKzptRs3hyQpw51DThd9QDdkwZ
 rmYutQG2RRtOwrNAqp6TrTgSmE53DKLUwiv8Y8dn9EhS6xdmdpJxQMmxQaz+ZdJy2xFC
 yXgw==
X-Gm-Message-State: AOAM533bP5jc3Y5URipXOOcfBd9Z6krJys0bw6PLQHiupB6bti20QTRd
 EvoWh3dsqyLMO6E9IX8j8z63eNX8muAXdQ==
X-Google-Smtp-Source: ABdhPJwFmMDhkw3dRBtDjBiBeMlnResamYTz0eRG01V0uo4/o+uRnjxtvJVOJb074jDdEe5w9sHLWA==
X-Received: by 2002:a9d:7746:: with SMTP id t6mr10167697otl.72.1632920780755; 
 Wed, 29 Sep 2021 06:06:20 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/26] linux-user/i386: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:37 -0400
Message-Id: <20210929130553.121567-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.
Note that x86_64 does not use this code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/target_signal.h   |  2 ++
 linux-user/x86_64/target_signal.h |  3 ++
 linux-user/i386/signal.c          | 56 +++++++++++++++++++++----------
 3 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
index 50361af874..64d09f2e75 100644
--- a/linux-user/i386/target_signal.h
+++ b/linux-user/i386/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* I386_TARGET_SIGNAL_H */
diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
index 4ea74f20dd..4673c5a886 100644
--- a/linux-user/x86_64/target_signal.h
+++ b/linux-user/x86_64/target_signal.h
@@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* For x86_64, use of SA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* X86_64_TARGET_SIGNAL_H */
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 3b4b55fc0a..b38b5f108e 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -310,6 +310,22 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
 }
 
 #ifndef TARGET_X86_64
+static void install_sigtramp(void *tramp)
+{
+    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb858, (uint16_t *)(tramp + 0));
+    __put_user(TARGET_NR_sigreturn, (int32_t *)(tramp + 2));
+    __put_user(0x80cd, (uint16_t *)(tramp + 6));
+}
+
+static void install_rt_sigtramp(void *tramp)
+{
+    /* This is movl $syscall,%eax ; int $0x80 */
+    __put_user(0xb8, (uint8_t *)(tramp + 0));
+    __put_user(TARGET_NR_rt_sigreturn, (int32_t *)(tramp + 1));
+    __put_user(0x80cd, (uint16_t *)(tramp + 5));
+}
+
 /* compare linux/arch/i386/kernel/signal.c:setup_frame() */
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUX86State *env)
@@ -338,16 +354,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        abi_ulong retcode_addr;
-        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
-        __put_user(retcode_addr, &frame->pretcode);
-        /* This is popl %eax ; movl $,%eax ; int $0x80 */
-        val16 = 0xb858;
-        __put_user(val16, (uint16_t *)(frame->retcode+0));
-        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+6));
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_sigtramp(frame->retcode);
+        __put_user(default_sigreturn, &frame->pretcode);
     }
 
     /* Set up registers for signal handler */
@@ -416,14 +425,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         __put_user(ka->sa_restorer, &frame->pretcode);
     } else {
-        uint16_t val16;
-        addr = frame_addr + offsetof(struct rt_sigframe, retcode);
-        __put_user(addr, &frame->pretcode);
-        /* This is movl $,%eax ; int $0x80 */
-        __put_user(0xb8, (char *)(frame->retcode+0));
-        __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+5));
+        /* This is no longer used, but is retained for ABI compatibility. */
+        install_rt_sigtramp(frame->retcode);
+        __put_user(default_rt_sigreturn, &frame->pretcode);
     }
 #else
     /* XXX: Would be slightly better to return -EFAULT here if test fails
@@ -592,3 +596,19 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+#ifndef TARGET_X86_64
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_rt_sigtramp(tramp + 8);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
+#endif
-- 
2.25.1


