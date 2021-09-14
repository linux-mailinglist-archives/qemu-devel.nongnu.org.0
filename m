Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D421E40A241
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:58:36 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwmR-0002og-Th
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6i-0001oE-TH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6X-0007lr-NT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:25 -0400
Received: by mail-pf1-x432.google.com with SMTP id x7so10429532pfa.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teRtCjAY/nHoQ4anva3SuJ0NvjzOvsr7bIC2cXQ3w2k=;
 b=SR3OJfnpXm58YggcwwV4kURMT6DwoHI312jCGzCmlQRDflUfnVgLM62SAO48c+JLOg
 LNdTUZ+FduF9i6JJteTJpbga9rSim/SmhG68C6Rq0jK1v5DukGpmAceXYPXwp6qgETJQ
 5RQItT0nQNLaBqy5nibIz6SpqlDJ/OkIG5S1IpRG2OBBfQQaSK6J7tOWCG8zqOOOSE8W
 ZkslTgvf2CYY62/UCajHVQjJnpFcGLMxD2KV4nAjOT6y2a3X94WryQ1z+nemFDsYd2FZ
 czqqz2NGvhsr6q6VBlPL8C9vNV+Zkjy20qunW09AaEt9ZalIMXRS+KSc/HZLuj4Yh1ZK
 Ijhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teRtCjAY/nHoQ4anva3SuJ0NvjzOvsr7bIC2cXQ3w2k=;
 b=bmAw+Ra7p/ZHzRTJ4c4lYH8/3qau6Muq1I3bql0FmvjYB1OP/ZcMZNHNcgyOdXpOaX
 8m4ZxRr/n/z4XSwm6a/gGkKKLH6DMgnXa1wUnkGHIQiIT5NUPU3Q1uFVsEZ4PxIQaPKH
 Cfih6+Xr0W8ROL3r2s76SD7O/cJWVGERuTVVqgY/ZNZkV0kpOfWZQslREk5u4hiMF6EH
 DxldVHoNHBBvkFjHFpJ+y71M7lxCBbQ1Q88q4NNBCu8UFT3Wu+J8I4uUGDVB8O214xwn
 9z+phTWvsY9hQ2fOrpMybAiQrkyALZsc3oLZXI2SaGx/EHvsKl1CRWb9bChnYqp2Z6Gu
 PP8A==
X-Gm-Message-State: AOAM531wAt5t8+h55jMd33s2W+ii7+1Z3JZieXZJqFVzOOTwM0kaf01c
 K1idncs79xjQyeAumxIIRGrE54zp/23J3w==
X-Google-Smtp-Source: ABdhPJyfhFGyt10DqaBlEZdo3yY/8Xxl5aKaZQxyKqpFwLUbuFGjO+XYacwK9mxbyGMq0893aIgN+w==
X-Received: by 2002:a62:f90d:0:b0:3e3:5739:d075 with SMTP id
 o13-20020a62f90d000000b003e35739d075mr2016809pfh.19.1631578515811; 
 Mon, 13 Sep 2021 17:15:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/44] target/openrisc: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Mon, 13 Sep 2021 17:14:36 -0700
Message-Id: <20210914001456.793490-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Message-Id: <20210911165434.531552-17-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/cpu.h       | 5 +++--
 target/openrisc/cpu.c       | 2 +-
 target/openrisc/interrupt.c | 2 --
 target/openrisc/meson.build | 6 ++++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f8..be6df81a81 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -312,8 +312,6 @@ struct OpenRISCCPU {
 
 
 void cpu_openrisc_list(void);
-void openrisc_cpu_do_interrupt(CPUState *cpu);
-bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -331,6 +329,9 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_openrisc_cpu;
 
+void openrisc_cpu_do_interrupt(CPUState *cpu);
+bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
 /* hw/openrisc_pic.c */
 void cpu_openrisc_pic_init(OpenRISCCPU *cpu);
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index bd34e429ec..27cb04152f 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
-    .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 3eab771dcd..19223e3f25 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -28,7 +28,6 @@
 
 void openrisc_cpu_do_interrupt(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
     int exception = cs->exception_index;
@@ -96,7 +95,6 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
     } else {
         cpu_abort(cs, "Unhandled exception 0x%x\n", exception);
     }
-#endif
 
     cs->exception_index = -1;
 }
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 9774a58306..e445dec4a0 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -9,7 +9,6 @@ openrisc_ss.add(files(
   'exception_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'interrupt.c',
   'interrupt_helper.c',
   'mmu.c',
   'sys_helper.c',
@@ -17,7 +16,10 @@ openrisc_ss.add(files(
 ))
 
 openrisc_softmmu_ss = ss.source_set()
-openrisc_softmmu_ss.add(files('machine.c'))
+openrisc_softmmu_ss.add(files(
+  'interrupt.c',
+  'machine.c',
+))
 
 target_arch += {'openrisc': openrisc_ss}
 target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}
-- 
2.25.1


