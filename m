Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7972C5232A4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 14:07:55 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nol8E-0002Dk-0c
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 08:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nol6O-0000u1-T7
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:06:00 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nol6N-0005uf-3x
 for qemu-devel@nongnu.org; Wed, 11 May 2022 08:06:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s16so1621700pgs.3
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5Z75Op+Qfma/PkdUohGyYV59LtbUakczX5kZXRHi0o=;
 b=Q5duOVweUOK+/OJhfLT3AcCR0eyO4lAH1zhwoG6oAvxkmQB0SArpD0RoPRPG7UX1Xq
 drsvWe2AxUgwb/EIbh0zDxr+kfSdvFEB40sC8mWXo1AA9g7DrlvfzFW8af0gSEWOYAVi
 cg8w5GUo3bFHs8IRxuNMb/FVP0XsGMVvDFIVasnl18jemwlbNt6tG2LLTgRR0ibbmta2
 SMfuF5WDPgkYNyA3cY9rT2JzzsHz4lhYF/S6XpMN3RF1SzjjV2TcB/gHRbNUHk4KZ2Ya
 1z7E3QykrKbLzrr4RNn18PiJ63aYUBBtiDBKC/8VfwkEda+0fbrgY9orWnpYb8mB5zic
 lLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5Z75Op+Qfma/PkdUohGyYV59LtbUakczX5kZXRHi0o=;
 b=J8lwbIXmkQoKuQpkyw42VzH/dnqonx6I0e1NfBZMKADMxScdxqaaWC87sGTUYItMxS
 oEFbZc+316I9A/XMjw5RkknB7yyxqVbcay9BC5KBW0pzJX4ssXpSAwiMWGlMj0d0ChHa
 wlnM8mXhFnDG8276He9T3Jv2e1mNaZqdK7HKOa98Jrn+ctKhdtZvhf+Q0rU2zE8lwrk3
 6NlDy1B1q4kRc6jSqH95/KUMQtwnreJDN2X/kfOfkJ1ELN0JNUxt+m5Ii1aawkCXk0xZ
 qTkVDCNnRMGt5B9Mz0cZLJPWek5B1HcPR0mJygpB88jHW8cbtWUhAhhAHm6/dB6icD3e
 9JLg==
X-Gm-Message-State: AOAM533uk3Hhy9yVkPJZeV2V+EsKxcbuZ1kO8v5slV3iylMtm4VzBMgl
 yy5v2kJBtTgBm7sqsKOnCoay2lT4NHI=
X-Google-Smtp-Source: ABdhPJz6nHnD8/Jgp7otuMBYQyo0Pf07wo7xXiyj47TejgxNZveBnCt7i3rD7KeQjQkqojMLpKDisQ==
X-Received: by 2002:a63:4d17:0:b0:3da:eda2:444a with SMTP id
 a23-20020a634d17000000b003daeda2444amr5995251pgb.180.1652270756665; 
 Wed, 11 May 2022 05:05:56 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 bb1-20020a170902bc8100b0015e8d4eb29asm1625813plb.228.2022.05.11.05.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 05:05:55 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] target/openrisc: Do not reset delay slot flag on early tb exit
Date: Wed, 11 May 2022 21:05:41 +0900
Message-Id: <20220511120541.2242797-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This was found when running linux crypto algorithm selftests used by
wireguard.  We found that randomly the tests would fail.  We found
through investigation that a combination of a tick timer interrupt,
raised when executing a delay slot instruction at a page boundary caused
the issue.

This was caused when handling the TB_EXIT_REQUESTED case in cpu_tb_exec.
On OpenRISC, which doesn't implement synchronize_from_tb, set_pc was
being used as a fallback.  The OpenRISC set_pc implementation clears
dflag, which caused the exception handling logic to not account for the
delay slot.  This was the bug, because it meant when execution resumed
after the interrupt was handling it resumed in the wrong place.

Fix this by implementing synchronize_from_tb which simply updates pc,
and not clear the delay slot flag.

Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index dfbafc5236..41d1b2a24a 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -30,6 +31,15 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
+                                             const TranslationBlock *tb)
+{
+    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
+
+    cpu->env.pc = tb->pc;
+}
+
+
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
@@ -186,6 +196,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
+    .synchronize_from_tb = openrisc_cpu_synchronize_from_tb,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = openrisc_cpu_tlb_fill,
-- 
2.31.1


