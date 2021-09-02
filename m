Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658E3FF049
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:34:35 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoja-0005jN-HJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoU3-0004o2-UA; Thu, 02 Sep 2021 11:18:31 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoU2-0002dE-Bb; Thu, 02 Sep 2021 11:18:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1605726wmi.5; 
 Thu, 02 Sep 2021 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztcTTnkmE3Sy1SDB/uPjtWzU/LrMfSjAGUpWvTwvo3w=;
 b=BUqC7PaF7PzoMYvp5taCbjdhSwKs5a3L3G6rE6UCOzDEFmY+e7iZ/tPOdsuPZ7RPLK
 XRGdfIMRn69UAeSJ//SsTfOz6FKq0wbS451YbfELFBQeVp5ajbEsjewt5EoLI1KnhGmK
 ey6vfKSr1f5lCq1YVjRlenq+Ik+N9xh4qkVdNJnRNSbv6zv8InbxtOmRKZrcU5y1jdl1
 /rvp7qbhqsKhL4azgAIssVrG3DOUN3gkN9CVztK8/p0Y6FbmodAp/0SZ7WLhu/edxKoy
 jZ7Fc+NzXCUF31Nq0q4KkzhW0FfGahTZOqxVWuWXoBNIcfVhDH8ea54WrA8T2UcSxlyt
 Hi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ztcTTnkmE3Sy1SDB/uPjtWzU/LrMfSjAGUpWvTwvo3w=;
 b=FNpAxQoyvq62mmGRI+0boytuZrMqrRNGtHA2X3n63Bvuv96tFefqpKz/net5oWUYP+
 3g94+11uyJYP7+SxExB84Bw1Ou+8fVM07ydN8J9lj/TJ69KE8fYBMAtQFoFyv33pgfC+
 JSAT52LxBuddAufDh6FwOb3Vel7md14ne7Z2GpUg46VmPahshuV8TDmKBfIXIZTlZ224
 YKmdwCA2C7KEJVBxdqxc44TWtSu3i9N01gYuQzlHcDhs3JuB6BY5uFNitxsi1DcLBAFy
 7qFbRkUsG6vBdNeaIdTUkOhSHCVYIJYr9M3CG46rM24ZjO0eR1qP6yb/KMYCkGcvl5Al
 TXHQ==
X-Gm-Message-State: AOAM530NwlEailflDJ9weCMztUt1mFiSllRyzuay6OqSVpqcixWeAerk
 TdV1JMQEsMCj0OYNvilbg/5nJCDNnEw=
X-Google-Smtp-Source: ABdhPJzAY+gEFr74wmw6KyBf2KbIWUrFnxTkLQzFaB4Bc1Ln2DAgVSsIVE0jXNvSrGRcCpuRlOL4Uw==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr3687535wmk.96.1630595907666;
 Thu, 02 Sep 2021 08:18:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x11sm2016661wro.83.2021.09.02.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/24] target/microblaze: Restrict cpu_exec_interrupt()
 handler to sysemu
Date: Thu,  2 Sep 2021 17:17:04 +0200
Message-Id: <20210902151715.383678-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

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


