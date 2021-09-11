Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F52B4079B7
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:05:25 +0200 (CEST)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6RQ-0007vQ-Di
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6I2-0007gV-9V
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Hx-0002fm-Os
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id q26so7483442wrc.7
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H6+WFk4l4QrgCDS0Vj4M4XW6RAkhPWPQKWOhbJqzIFQ=;
 b=TddMrYdsJ4aK5Fdwtk+FIKntcogL8nYPD0sQNfBpW3NeMztqinocBKXMRKTrBhsR8B
 POxTaqSkbD1yRSa5DWMepvMWCehjUwaq2mjAnBDSeMOSBCJxDlkFMLwnn2VSljqeqlmu
 NlUBTKKYt+bxj+qanBTUFWz+YKuOe4QrQ9HZhnYcRx9C1HrcQluRo/fy/zqMEUyMUk5s
 N/4Wn0P0XxiPS9TDcOeMp1pOskXoWPDb96HDVbHCIuABVbeawNrnPlFITxtSA40sil9J
 er59Oyvxr83LebvS0ZksJGbZhE6N26vj/yss+GHHkxRF+A3jqRg41P031vMbecF+FgnC
 KXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H6+WFk4l4QrgCDS0Vj4M4XW6RAkhPWPQKWOhbJqzIFQ=;
 b=ylDgwnQhn4ODurcatpe4yOgPS3HhGO29m6dTIW+RLowggTim/CJv62Hd0V1pKfi2dH
 RaxL/mQySqbrdEQIBk+rW2FRXe0w3KuA0g806XMhNd3QJiwqnEaGo4PiQq7tnaEz12sk
 7HGFiYEAvUAC8MRQzfwxehsuSHzdVWnj8N6aQ/rxI6CUzwRvBjfsZ9XKq/P8Cb3cE3qk
 npIEknwYbvZnZyMwuJrABgEYWfxfQCWaXb3KS19tBvop+WS2jEVRhnPVHdvdNMhJqIcn
 +45IYi84hYfzrhjXVzf1cCxvIdIYm8JADg5HvChYpnJ90au6Ifsn7I1e0Th74ozyxIXG
 9Sng==
X-Gm-Message-State: AOAM532RqiXWweLUJonpUWkPRA+dL5sXKHlDqhFlHUaxMCBTagnkF958
 zC4NCNO0rzfS4wFGo9azYqebpd6U0RQ=
X-Google-Smtp-Source: ABdhPJyz5Cfwa5nD5csSd4nuwBAJu4I12qxl8nnZ6hSA/3WC08yKAbP5FPF5JCcKW7l/++k2OXVRFA==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr3891872wrd.286.1631379336419; 
 Sat, 11 Sep 2021 09:55:36 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s15sm2142292wrb.22.2021.09.11.09.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/24] target/m68k: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:22 +0200
Message-Id: <20210911165434.531552-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/cpu.h       |  2 ++
 target/m68k/cpu.c       |  2 +-
 target/m68k/op_helper.c | 16 +++-------------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 997d588911c..550eb028b6e 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -166,8 +166,10 @@ struct M68kCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 72de6e97262..66d22d11895 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,10 +515,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d006d1cb3ea..5d624838ae6 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -24,18 +24,7 @@
 #include "semihosting/semihost.h"
 #include "tcg/tcg.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-void m68k_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
-static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
-{
-}
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 static void cf_rte(CPUM68KState *env)
 {
@@ -516,7 +505,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
         cpu_loop_exit(cs);
     }
 }
-#endif
 
 bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -538,6 +526,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
-- 
2.31.1


