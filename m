Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD61400DA1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:04:09 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfdo-0005sr-A9
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfX7-00082x-LB
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfX2-0008A4-Nx
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:57:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id g135so1880915wme.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlXQUNKS3c3ZKazmS/+w3RMtDhurrxUzxhSxeew26+k=;
 b=hzIGgxznm9H3VaTKcqWpCaJk0VM0aT5ZLdSRcpKPHj8yFRKoBUxYl5v6gwZAmnshaD
 5UdGU/aWMNECkt6kqxWcEvSX/zkgpQIi5nuf9GPU+hmKCAveF81fbMBcyiX08Ge85jaK
 Ow/YaaMTDtmhBDus/zBrylHXfdCyD22Uvry48xTb2mFjmmBXOatptbxO/ffz75IZ3blY
 rY8ZwemjMHUpWKH2n7DmmjAMi9nQueNlzqTaF7+qLjBzyYuQxP/u9yPgQmytEtN3i9AG
 1JZ18o2Nu2Jr3sccHt5cFo+8/yol0OA52JsBe2yB0vByu5wTjPw2FWku+5SJ/a1ziH8F
 OsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SlXQUNKS3c3ZKazmS/+w3RMtDhurrxUzxhSxeew26+k=;
 b=Mvn2Zh4FSMCkQzokL7eUZGkabDPKKh6Nn7GSkv6UaQs4e0spKQbRdEqtjl5/+PeRhH
 eKUMve3rr3HZDnujqs6k79yAOm2AYvRim6xEp2HsOaROKLNi+MjwvZ1oOEVczrtbwSVy
 rjdR/O1UwRHYceHIauvh1bO8WOrcwKrPGPi5EZAu83sQ2S46RdGVl2gbJnMITbEsTUe2
 CmVpohVn5aenzrZVh/6+/TSmwwKaKl4xkS0W7n3Bhad+CLflpY3WMTAhQ02MQJLBnLbu
 tf4ktpOlDzGBEa6ZZE8j2zYdLlHUNsi3YtuJbQ6TbGAwkDnvthWISULMyXAEGm5OJTgO
 UUxw==
X-Gm-Message-State: AOAM530TQsA71QvDHXUNWsA77Kb3O8FIswKiYCub4FwlY68kOO+w+HAC
 kkPAWnvmiVGHqsCwR1bjy60zDLGLELA=
X-Google-Smtp-Source: ABdhPJw/b4mwGZnqKAEaY+w+qhp89QkO6wW04HmMLf9ZebjXjhDi85HS32WkUpCFkkF5S6rtJdohgg==
X-Received: by 2002:a05:600c:5123:: with SMTP id
 o35mr4979879wms.153.1630799825152; 
 Sat, 04 Sep 2021 16:57:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v62sm3217263wme.21.2021.09.04.16.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:57:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/24] target/openrisc: Restrict cpu_exec_interrupt()
 handler to sysemu
Date: Sun,  5 Sep 2021 01:55:34 +0200
Message-Id: <20210904235542.1092641-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


