Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F8F4079C0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:08:21 +0200 (CEST)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6UG-0005k6-Kh
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6I6-0007kX-N1
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6I3-0002kP-Hm
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id i23so7497278wrb.2
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rO0D2OFkHiHdtobaxK4sUMpGxbIKEwY3AB/t5R4+r5g=;
 b=JZh9gkHQ9ffSsEMmhCGZ3142LCjapcN7nNVcr8wm9xUKM4vapI4/b4IxdK0FENL8nf
 JRT8oehyIJm3NVXoM/V3ueRuAGLkuC2wIX9GDnfDNEdckUc7tKfEft97hu22EsQggXRf
 gQ92n0XiHaO4pN44s3MZPpXIPsTokFbe4o2A6sRC3lxKNRF55S4cDSbIpn9OwUtMQ5s6
 O3lxemetgKiuYc+tLJixuRpziMcGv9tE8O9JGQOKkUMDvbHP4VvePyvDtMNM4VLorhp3
 iEuqo2MK8+cL94Zy/9pvb+h0vrveQbLX0TohI6U4FVWVaxgS3nFSQG/E4TiYSGh/LkHI
 XWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rO0D2OFkHiHdtobaxK4sUMpGxbIKEwY3AB/t5R4+r5g=;
 b=R6doWyWyWBYGeXwWjCUkGIS7022+N/YJyp0mEW7E6nVETTgTDdJZjsI8k+QDXQFIku
 qo9VS82GBBlPEYHns3H6/c+XYgvjW/B129vHsrNXiLqkvhpEefivAgPmUS+F/rvum6ZN
 wx9Sw4OiXo3OuIixP1/iSq5uNlYMce5ekBEGII6ghpsXJI6wCIuvem8ygQVE3/ombZN/
 fN/d9EMdntUX0RRteA475E41McF+xjVKFMYAxTd/za8a9VJzSRNlO4iTxXNiD4ni11Dl
 0O4KUmHQH4NA3dsjiEI4xhxAdlhqvFKjTuHsQhiucb85pCtog2wVt4OtFu9Fbd8O0eiS
 3Ekg==
X-Gm-Message-State: AOAM533GUR7WVn6xzcWqg2LLDpp4zxUwpEkk1bREViy89376Yy11QFH8
 BRajtwU8bLNZoOlCWiN9CVg4Hkn3cls=
X-Google-Smtp-Source: ABdhPJxYvehly841dVGlabTxEblZ7tm+GfKKYjSEnqhj3ul816Sc/FcJnkKYGy+dkzrOcZDgtAbCMw==
X-Received: by 2002:a5d:6e09:: with SMTP id h9mr3886973wrz.82.1631379341600;
 Sat, 11 Sep 2021 09:55:41 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t6sm1964798wmj.12.2021.09.11.09.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/24] target/microblaze: Restrict cpu_exec_interrupt()
 handler to sysemu
Date: Sat, 11 Sep 2021 18:54:23 +0200
Message-Id: <20210911165434.531552-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 target/microblaze/cpu.h    |  2 ++
 target/microblaze/cpu.c    |  2 +-
 target/microblaze/helper.c | 13 ++-----------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..40401c33b72 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -355,8 +355,10 @@ struct MicroBlazeCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 72d8f2a0daa..15db277925f 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,10 +365,10 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
     .do_unaligned_access = mb_cpu_do_unaligned_access,
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd673136..dd2aecd1d58 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -26,16 +26,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void mb_cpu_do_interrupt(CPUState *cs)
-{
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
-    CPUMBState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->res_addr = RES_ADDR_NONE;
-    env->regs[14] = env->pc;
-}
-
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -271,7 +261,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     return paddr;
 }
-#endif
 
 bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -289,6 +278,8 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr)
-- 
2.31.1


