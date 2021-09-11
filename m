Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACD14079B1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:02:35 +0200 (CEST)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Oe-0002CF-HW
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HU-0006ma-Rc
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HT-0002Li-By
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:08 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so7505828wrb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KL1Kqw8poO/L4JKKXeGzPnOl81Q/NwCgyvh1EIRZFV8=;
 b=LJtloVRzt5IktL3vZL1p9i3JhRNIksbpxj2ML4Gn5UsL0NgYBJjwvOXWoPPr0SnYMg
 OqgcMkvrbRLF2JXYBH4OnRjj3vu/n8jEoDVsRvngRv03VyTVb0NCQ8+SSz7I2WYVfe1N
 NEJPC1fEH0c7zF5IEIk9y6aMFMmAvVHIwNAEmlcz1MCLfFi+xHGi5Z+0SKg93JtDjBFy
 4UuHP0lY7Q92B5OAfLKvjHxeiPhvHNvTQmwMvT7KNOA7eeu5jv5vKgX5pARow6miRbrW
 0hbE6tsRwDr24uXAXvoi8TBLMLellLANQeVgRiA1FFlDQn0vVO7AiSATSk8YMBqxboku
 CR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KL1Kqw8poO/L4JKKXeGzPnOl81Q/NwCgyvh1EIRZFV8=;
 b=J9HCOghqrugkCwUQAKv48NlriGeJzUY789WY/FLgqfknBgAWdigKZqkLjn2c/fWyll
 omaVMDP1r+T0h0IuMDfqOfgtTA0Y5Uj2Yq1OneDvaDmx2GmrSiq9YyqWcLz5ZmAb6oUJ
 rXazb0IsKGuuzbTiVCGs0T2L+emSu8hCoi47F0iQW92VhBVQCM9ggEtNYj0a7WRzsVoM
 4RLuMerXHTIkSzZnDnWN8Sh9u4Fyxfk0GGBUdpmDIJxcv2HuysxQg+Dg1fs68f+cDVo4
 3ACA4YMEkZ93kbdIpsXZae+mliB103/lyhP1C/l+RAxRVg3sGioFWSoKOuYGfmMEjxv+
 ZjpA==
X-Gm-Message-State: AOAM532OJP4IhO/lyfOpKhLTGwwYW8m5mK3jj1wq1KtVomraIHSvdMzH
 +9xLS6z13/VT37tacASlLQEwz+7I4NY=
X-Google-Smtp-Source: ABdhPJyPceiFeTrN3aNbGhOjqUAUyPdgQNvj6Ekm5EsWk99N38UhL4hRexsfpKuQwftajEBoz5oxuw==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr3927863wrq.37.1631379305872; 
 Sat, 11 Sep 2021 09:55:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id a6sm2017569wmb.7.2021.09.11.09.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/24] target/alpha: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:16 +0200
Message-Id: <20210911165434.531552-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
 target/alpha/cpu.h    | 2 +-
 target/alpha/cpu.c    | 2 +-
 target/alpha/helper.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..4e993bd15bd 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -274,10 +274,10 @@ struct AlphaCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
-#endif
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a6..93e16a2ffb4 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
     .do_unaligned_access = alpha_cpu_do_unaligned_access,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d231..81550d9e2ff 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                  prot, mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
-#endif /* USER_ONLY */
 
 void alpha_cpu_do_interrupt(CPUState *cs)
 {
@@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
 
-#if !defined(CONFIG_USER_ONLY)
     switch (i) {
     case EXCP_RESET:
         i = 0x0000;
@@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     /* Switch to PALmode.  */
     env->flags |= ENV_FLAG_PAL_MODE;
-#endif /* !USER_ONLY */
 }
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
@@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     static const char linux_reg_names[31][4] = {
-- 
2.31.1


