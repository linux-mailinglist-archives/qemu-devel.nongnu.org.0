Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99D6E4E76
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuM-0002Jo-PW; Mon, 17 Apr 2023 12:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuK-0002IO-Av
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuI-0001M5-3z
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so1533228wmr.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749645; x=1684341645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs+iC0C5OHKEybS9WeBQh25/t1gv+/9yrwaTYs2naWg=;
 b=SOgxhaqOVTR0iErt5Cp7OmS4ImrDPTKM4/LeBNLTQib/qGq4YTey8WFslxZASR56Pc
 uxXyJ5X1Ugx1enmfyNsBhLotSKvbxxKplFHOHMeSQBe2MrOd9rnw08+qmTt2JfCKBXDk
 dNh9LndDaibxv9oKoYjm0maOlOX6PMgKUX+/BUUFnDBh5wBITGJcf2XqKZbM77POXO/o
 PzeoK0TntdoBPlp5LWtH8omwdZeuwbEga1mqSFtiR4M/X3dVDRQ3p3KaiUmYpj9O0InL
 wqINLmRp3vq2z6dKM6MbPzO/9v9XIYkGE58OuSXZetTO1Ct99JFNE5gg/+oVa2zk36ZT
 X9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749645; x=1684341645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs+iC0C5OHKEybS9WeBQh25/t1gv+/9yrwaTYs2naWg=;
 b=VCg4vaZFsV3nOai+1racu+sRej7k1SV3SS+WHs5JkT3RRRMN3Zmck5y2FrkmkGBbhZ
 644/YkgQmTVHtUvlRN+iD7Q+gZ66t5M3EaWzvdToU/JDnWjbpXjr43+q0Mf7NAUlF2Ud
 0hNf7Y330gtbidjhZ9cE3o9Abfxvdp6+pLmwiIA8cZS5LEfIYRdysQYTdIgHfov4kiwx
 8XW4J3fMUZwyFsZbeN0+7ilfrerVI3jdL60eLbZ0EwhCqdthkz6ySVd/V6hWGoQqnWyX
 sZmY8GUncFdIjzRuDjA0LQmNrvjguDZw8QeAgzT5QlJAfpXK3lm46gX6SmC6CVq8q4LS
 oDAw==
X-Gm-Message-State: AAQBX9fT4+QOnYNTn5nd5l383geBiKibsMnCbHA6nhmfmKGVOCM2/tnp
 BAEXlb9G5Zl21cR8FdKeDDrd6wCEEAqsu0VJKyw=
X-Google-Smtp-Source: AKy350YcOdKv2EgMDxZ+OpYwt8UDkLQkTXga+4dI5oP3Wq1CqhtxkRMnYrW2JA0x3iLdS1Cuc/S+iQ==
X-Received: by 2002:a05:600c:2051:b0:3f1:6ec5:bc6e with SMTP id
 p17-20020a05600c205100b003f16ec5bc6emr6279173wmg.3.1681749644708; 
 Mon, 17 Apr 2023 09:40:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 03/10] accel/tcg: Use one_insn_per_tb global instead of old
 singlestep global
Date: Mon, 17 Apr 2023 17:40:34 +0100
Message-Id: <20230417164041.684562-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only place left that looks at the old 'singlestep' global
variable is the TCG curr_cflags() function.  Replace the old global
with a new 'one_insn_per_tb' which is defined in tcg-all.c and
declared in accel/tcg/internal.h.  This keeps it restricted to the
TCG code, unlike 'singlestep' which was available to every file in
the system and defined in multiple different places for softmmu vs
linux-user vs bsd-user.

While we're making this change, use qatomic_read() and qatomic_set()
on the accesses to the new global, because TCG will read it without
holding a lock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In discussion on v2, we talked about combining this with the
'nochain' flag so as to have a single 'tcg_cflags_global' that
held the flags for the current (one_insn_per_tb, nochain) state.
I have not attempted that here, because it's a little tricky:
 * util/log.c is built into some binaries that don't have an
   accelerator at all (the tools), so it can't simply call
   current_accel() to get the TCG accelerator
 * the initial value of the logging flags is set before the
   TCG accelerator is even created
So I leave that to somebody else to have a go at if they like.
---
 accel/tcg/internal.h      | 2 ++
 include/exec/cpu-common.h | 2 --
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/tcg-all.c       | 6 ++++--
 bsd-user/main.c           | 1 -
 linux-user/main.c         | 1 -
 softmmu/globals.c         | 1 -
 7 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 96f198b28b4..7bb0fdbe149 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -67,4 +67,6 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 extern int64_t max_delay;
 extern int64_t max_advance;
 
+extern bool one_insn_per_tb;
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7b..0be74f1e706 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -163,8 +163,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
                         void *ptr, size_t len, bool is_write);
 
 /* vl.c */
-extern int singlestep;
-
 void list_cpus(const char *optarg);
 
 #endif /* CPU_COMMON_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8370c92c05e..bc0e1c3299a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -159,7 +159,7 @@ uint32_t curr_cflags(CPUState *cpu)
      */
     if (unlikely(cpu->singlestep_enabled)) {
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (singlestep) {
+    } else if (qatomic_read(&one_insn_per_tb)) {
         cflags |= CF_NO_GOTO_TB | 1;
     } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         cflags |= CF_NO_GOTO_TB;
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index fcf361c8db6..a831f8d7c37 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -31,6 +31,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/accel.h"
+#include "qemu/atomic.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qemu/units.h"
 #if !defined(CONFIG_USER_ONLY)
@@ -110,6 +111,7 @@ static void tcg_accel_instance_init(Object *obj)
 }
 
 bool mttcg_enabled;
+bool one_insn_per_tb;
 
 static int tcg_init_machine(MachineState *ms)
 {
@@ -219,8 +221,8 @@ static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
 {
     TCGState *s = TCG_STATE(obj);
     s->one_insn_per_tb = value;
-    /* For the moment, set the global also: this changes the behaviour */
-    singlestep = value;
+    /* Set the global also: this changes the behaviour */
+    qatomic_set(&one_insn_per_tb, value);
 }
 
 static int tcg_gdbstub_supported_sstep_flags(void)
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 09b84da190c..a9e5a127d38 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -49,7 +49,6 @@
 #include "host-os.h"
 #include "target_arch_cpu.h"
 
-int singlestep;
 static bool opt_one_insn_per_tb;
 uintptr_t guest_base;
 bool have_guest_base;
diff --git a/linux-user/main.c b/linux-user/main.c
index 489694ad654..c7020b413bc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -68,7 +68,6 @@
 char *exec_path;
 char real_exec_path[PATH_MAX];
 
-int singlestep;
 static bool opt_one_insn_per_tb;
 static const char *argv0;
 static const char *gdbstub;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 39678aa8c58..e83b5428d12 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -43,7 +43,6 @@ int vga_interface_type = VGA_NONE;
 bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
-int singlestep;
 int fd_bootchk = 1;
 int graphic_rotate;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
-- 
2.34.1


