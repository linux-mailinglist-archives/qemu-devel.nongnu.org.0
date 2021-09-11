Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1714079C5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:11:04 +0200 (CEST)
Received: from localhost ([::1]:43450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Wt-0003W0-RW
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IJ-0007wh-07
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6IH-0002yG-Ea
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:55:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id w29so6731689wra.8
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlXQUNKS3c3ZKazmS/+w3RMtDhurrxUzxhSxeew26+k=;
 b=FbiVsXj3FAZx5ZjncQN9iEIfsVeLqeBuwOPoqI6UQ63fHO+/83LFAhS7XD3vY+Brzw
 Yqa0kWbTn545ks2TCE47BkEDx+3Kb3sVS4u/F6e4iZmu8Ez8h10W5Mjf3bx73dKDyhhm
 16mWBuKeqNAFz6UCKmRBTDjjXYq/eQZ3PJX19S45DSQp71m218kuT3pdHVZvWGc7eGV/
 XMUB9V5ujtfiBgDPgioFwIavDkZEFJ+wYRTvVKGk8YlZhslcngjh8YRqSq7gyZd/fo76
 Wno12siEhYPLD3bpDAtPs9FlhcO9kGC926wkUbeUXViecJeJDvKLH+pevpAokEF5F04u
 z+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SlXQUNKS3c3ZKazmS/+w3RMtDhurrxUzxhSxeew26+k=;
 b=B5GzVTPW4XoChu/G32tUZ6JPtKQzSaa7ryA0b6uLp+jpoIPXovioBn7yOzAzwLpXj2
 n3SW39kuTqvmC23h3+cbcPrM0g9sQvpRy/ByscKGgtEvs7WSo3KZtbtXl050Lux4hgWw
 awzIlmI5hLWZ6UkChwjghTNyP/7WmrauNkW+TNpXE22iRKNoRGhJqFlJtZw17ez/fbNC
 ojKJM5pZkDK7VueUXQKWnUTP+gfKMGA1hEDeLua6DdOFbF9SDpoXeelUGZ1ZD31tzBm7
 hiwvH0QFskFwKo1FIaFfS1F857aApSFNq510qMkr+mGP67shB7lsabbWHbwhInrLTZeg
 zvEw==
X-Gm-Message-State: AOAM5314/hsHrP9/4xCdBnqLMGnc/rkyRTBjdL+eMq/a6QOhSGooSCTs
 U/p9QKhKPtEXaCD8AF8HdtKBW73Kmiw=
X-Google-Smtp-Source: ABdhPJxK+oCZiehRlNPyQF2hLSkfA1CxPBnch9PQF5ryk0EIJOTHvHhl0uHXcZyP//yh8kc+sLuN2g==
X-Received: by 2002:a5d:48c5:: with SMTP id p5mr3745013wrs.303.1631379355868; 
 Sat, 11 Sep 2021 09:55:55 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z19sm2369237wma.0.2021.09.11.09.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:55:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/24] target/openrisc: Restrict cpu_exec_interrupt()
 handler to sysemu
Date: Sat, 11 Sep 2021 18:54:26 +0200
Message-Id: <20210911165434.531552-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 target/openrisc/cpu.h       | 5 +++--
 target/openrisc/cpu.c       | 2 +-
 target/openrisc/interrupt.c | 2 --
 target/openrisc/meson.build | 6 ++++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f84..be6df81a810 100644
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
index bd34e429ecb..27cb04152f9 100644
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
index 3eab771dcda..19223e3f25b 100644
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
index 9774a583065..e445dec4a00 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -9,7 +9,6 @@
   'exception_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'interrupt.c',
   'interrupt_helper.c',
   'mmu.c',
   'sys_helper.c',
@@ -17,7 +16,10 @@
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
2.31.1


