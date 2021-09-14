Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E36740A247
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:02:30 +0200 (CEST)
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwqD-0005qA-Ej
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6o-0001ql-LU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6d-0007p3-B0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:30 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso574818pjb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fv+qXdXA72z84c3ahR24hfLQKJLU8yj9tg0pIBi8Kxk=;
 b=YMZCzdNHFF6fuoERDB/PNpKZq1n2EWgNc3II0EjbYzGTS1iaNxAus3ZvRegeKafYfx
 5L3WLlOidyA7VTjUgGVHvhz7bEE5Bz13ZynsI1Om7kQ6uALeJ5gFTjM7BqYz66PtzPdj
 mygvG8o/Q+TYmy8ZpDcYJo//BBLHpyCQM3sUjn90F34xKSpEZ1hhAxM84NGZ/DjvYRqY
 vmPFhzLyLUPOtS/6vnTnsw5B3hygef2bOHh8K3+FWlVzprqKuv2UV7pA1hZR5XLI84WV
 rPWC67ds6vL3TzxpWW+lxnld8Crd/XFyPatalEsCuwUh0yGyKMYgLuIdQe5zHDl9A4q7
 JlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fv+qXdXA72z84c3ahR24hfLQKJLU8yj9tg0pIBi8Kxk=;
 b=vg23a4PYSG3H19H+35x2VKGhDUSlkA75dDaxYDwI8PxAnkMVQIS/80fXLtdIGKonjE
 QmVS0aVeY1PtqISKK1tbd09N+carZyHHoxe3g0B80iFJzJO8EPJ4eWdoIxo6IuyYZxlf
 Qw5sQZS0RMxeael5y9b4pAF17j+hbxuC4uIIhhK/SG7aG5p9FB4ZSHNnZzGukZ/pjI0t
 KndqOIVxln5kxoxG84zLMW+mL3BxjaUlxVvCDyI3H5WAQLm42GG10SXpsDn4FUCN+Vr9
 yzFzx7a6sF+piUyDTzrAZlHCyDuqxOEr8tnwGwu2rI1mvH96Y4bk7gVbQzX+Zdk819Ov
 6eKw==
X-Gm-Message-State: AOAM532sPXLa55pEiiuFH9eIw9EzVZdI6g7d5dic8Xz7/jko9x0d6hE3
 ppGvd1CUjmWAh5oMVUYCX418A8aX9hyr6A==
X-Google-Smtp-Source: ABdhPJznhv6mgJz9ESfnw1LrTHE9Bso9SRh0g1fhiHgeYR1ZJ18usZ5dNtXpcdjf73B8SMyiTRkI+w==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr2442110pjg.75.1631578520090; 
 Mon, 13 Sep 2021 17:15:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/44] target/xtensa: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:42 -0700
Message-Id: <20210914001456.793490-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-23-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h        | 4 ++--
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 1e0cb1535c..cbb720e7cc 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -566,14 +566,14 @@ struct XtensaCPU {
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-#endif /* !CONFIG_USER_ONLY */
+#endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a0862..c1cbd03595 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 10e75ab070..9bc7f50d35 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
-#else
-void xtensa_cpu_do_interrupt(CPUState *cs)
-{
-}
-#endif
 
 bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


