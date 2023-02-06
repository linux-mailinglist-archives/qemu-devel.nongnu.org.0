Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42768C45C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP54L-0000jf-4Y; Mon, 06 Feb 2023 12:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54F-0000hY-0J
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:11 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP54A-0001QS-1B
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:14:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id ba1so7006221wrb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=110cMZIFcWWL1/kf503QWtB2fWh8LmnfgN3d4ZXxhlU=;
 b=d4iuiBAkE4gd4YhsO3M7Fhy0oz3Ym6oXmWgEAyu8yjCeFfiiNVJvqK0GOMB/H0TjSF
 btIZV0g0ptgQDAStRg3XjrEhqB54vvM+oX6XxINtm1JuPqkvSuYYXvjdOceKF81hyY3T
 fODm4DrjpAPuKFCMdmL2OT+CyPXxIivN73N56WCxWQm+in5EW9Z9VIeL5DN8jbCiO+C3
 0bjaNssfRYgjKwdZSJpEbEiP7aYz0YkHihMfbGLBlbTr/NPjOkT1FQ4EGN2Iz5yb9/Vk
 7bO/j4F5uS3vALHu5/4VycEamkemRR1Xe2XPpaeGyU/ChsobIKn5gTeyaBYhZ0poucaY
 YkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=110cMZIFcWWL1/kf503QWtB2fWh8LmnfgN3d4ZXxhlU=;
 b=PLQL8OznSX8h/0aV4gF6bip+HgH4m7r2OUUeaIGT85IxXCvPaxyIuqExPX3kLNHzgp
 qOIflIqAXgNh5osFEi71x7oQ6sOWFDcm0ufvViIcA4fcTx3qgM9C38qxGxwcYAt2qweO
 kkBO7gGTbiUVmEZB0zQ2vmM4Gj2VURwieSpHM4I0Ihn3QW9B17sEde/9d1oMD7a2fIdT
 ajdD3yfDkUC6k1RdvYTkf2uDCfMYaN2MQS/ZwD5cWQLu5Rg3IQmpGNjOs5UNRYvbgNXk
 QLQMwzy+9GjIeceYnltTfahcWFKACdLh0C5W3ifGhc+EFkdzQOC4+WCXYCBoCivQtUml
 d0kQ==
X-Gm-Message-State: AO0yUKWwu7OSDF90F0+300jsg5BWyYH9Jf8gs5FgPXy4YPx0Lqdyk3qd
 dmJIvwv0u8ecyfRWNEB0H0j2yO+ms625U1iL
X-Google-Smtp-Source: AK7set/qcbIKgFMM7F4esxMtE8aeNYJod26cIXu+SOAuK8gPrtvTl3PEhgp9Fe03pqGrPR3rU7mqUQ==
X-Received: by 2002:adf:c5c6:0:b0:2bf:c066:dd7e with SMTP id
 v6-20020adfc5c6000000b002bfc066dd7emr17286692wrg.40.1675703643731; 
 Mon, 06 Feb 2023 09:14:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9529841wry.11.2023.02.06.09.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:14:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH 1/5] Rename the singlestep global variable to
 one_insn_per_tb
Date: Mon,  6 Feb 2023 17:13:55 +0000
Message-Id: <20230206171359.1327671-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The 'singlestep' global variable is badly misnamed, because it has
nothing to do with single-stepping the emulation either via the gdb
stub or by emulation of architectural debug facilities.  Instead what
it does is force TCG to put only one instruction into each TB.
Rename it to one_insn_per_tb, so that it reflects what it does better
and is easier to search for in the codebase.

This misnaming is also present in user-facing interfaces: the command
line option '-singlestep', the HMP 'singlestep' command, and the QMP
StatusInfo object.  Those are harder to update because we need to
retain backwards compatibility.  Subsequent patches will add
better-named aliases so we can eventually deprecate-and-drop the old,
bad name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-common.h   | 2 +-
 accel/tcg/cpu-exec.c        | 4 ++--
 bsd-user/main.c             | 4 ++--
 linux-user/main.c           | 4 ++--
 softmmu/globals.c           | 2 +-
 softmmu/runstate-hmp-cmds.c | 4 ++--
 softmmu/runstate.c          | 2 +-
 softmmu/vl.c                | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7b..f2592a1967f 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -163,7 +163,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
                         void *ptr, size_t len, bool is_write);
 
 /* vl.c */
-extern int singlestep;
+extern int one_insn_per_tb;
 
 void list_cpus(const char *optarg);
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 9c857eeb077..08a65f8d506 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -157,12 +157,12 @@ uint32_t curr_cflags(CPUState *cpu)
      * Record gdb single-step.  We should be exiting the TB by raising
      * EXCP_DEBUG, but to simplify other tests, disable chaining too.
      *
-     * For singlestep and -d nochain, suppress goto_tb so that
+     * For one-insn-per-tb and -d nochain, suppress goto_tb so that
      * we can log -d cpu,exec after every TB.
      */
     if (unlikely(cpu->singlestep_enabled)) {
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (singlestep) {
+    } else if (one_insn_per_tb) {
         cflags |= CF_NO_GOTO_TB | 1;
     } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         cflags |= CF_NO_GOTO_TB;
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 6f09180d654..a8de6906ed5 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,7 +50,7 @@
 #include "host-os.h"
 #include "target_arch_cpu.h"
 
-int singlestep;
+int one_insn_per_tb;
 uintptr_t guest_base;
 bool have_guest_base;
 /*
@@ -391,7 +391,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
         } else if (!strcmp(r, "singlestep")) {
-            singlestep = 1;
+            one_insn_per_tb = 1;
         } else if (!strcmp(r, "strace")) {
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 4290651c3cf..99bcd542b42 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -66,7 +66,7 @@
 
 char *exec_path;
 
-int singlestep;
+int one_insn_per_tb;
 static const char *argv0;
 static const char *gdbstub;
 static envlist_t *envlist;
@@ -397,7 +397,7 @@ static void handle_arg_reserved_va(const char *arg)
 
 static void handle_arg_singlestep(const char *arg)
 {
-    singlestep = 1;
+    one_insn_per_tb = 1;
 }
 
 static void handle_arg_strace(const char *arg)
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 527edbefdd0..f46df89d2db 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -43,7 +43,7 @@ int vga_interface_type = VGA_NONE;
 bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
-int singlestep;
+int one_insn_per_tb;
 int fd_bootchk = 1;
 int graphic_rotate;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
diff --git a/softmmu/runstate-hmp-cmds.c b/softmmu/runstate-hmp-cmds.c
index d55a7d4db89..29c9a038863 100644
--- a/softmmu/runstate-hmp-cmds.c
+++ b/softmmu/runstate-hmp-cmds.c
@@ -44,9 +44,9 @@ void hmp_singlestep(Monitor *mon, const QDict *qdict)
 {
     const char *option = qdict_get_try_str(qdict, "option");
     if (!option || !strcmp(option, "on")) {
-        singlestep = 1;
+        one_insn_per_tb = 1;
     } else if (!strcmp(option, "off")) {
-        singlestep = 0;
+        one_insn_per_tb = 0;
     } else {
         monitor_printf(mon, "unexpected option %s\n", option);
     }
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index cab9f6fc075..8272aef43b4 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -236,7 +236,7 @@ StatusInfo *qmp_query_status(Error **errp)
     StatusInfo *info = g_malloc0(sizeof(*info));
 
     info->running = runstate_is_running();
-    info->singlestep = singlestep;
+    info->singlestep = one_insn_per_tb;
     info->status = current_run_state;
 
     return info;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9177d95d4ec..dbe5124b5e7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2957,7 +2957,7 @@ void qemu_init(int argc, char **argv)
                 qdict_put_str(machine_opts_dict, "firmware", optarg);
                 break;
             case QEMU_OPTION_singlestep:
-                singlestep = 1;
+                one_insn_per_tb = 1;
                 break;
             case QEMU_OPTION_S:
                 autostart = 0;
-- 
2.34.1


