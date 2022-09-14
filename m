Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577255B895F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:44:39 +0200 (CEST)
Received: from localhost ([::1]:47230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSgw-0006XH-0O
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSML-00082w-8a
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMH-0000b1-1d
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so15494799wma.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x+pcPPFHal1ZQJ+2Orzyi/XOmnBS6T266QkUkL9sejs=;
 b=C180wwalcOZcYIcrbb0PQmbo/AYZJ2OnOP46caGDySCB5QefZL96tV6RDZ2PU8kM8w
 OCVFq8x0kBAyhG/XkY6kdH2Q18XPlsasc4HhbZB88SbSNybqNf46VQzwuqMS4DKPoCAm
 mAy0btyRnLU9qlC1mNjyA3cJ9ZtBv+0EMfIsGBHj8nznsXOJj7hT/ewSZ6r2OuJ0ghuc
 DwHIxEYgL8jNrlCldzI0neCKd0EFaCaK5voek1lf0LqxdZ6P5/RqqhRhU22N/rBak2dO
 xplDWyMjV0py95J6fcgjAZFzvgsF8z5blQQTAqt3G72ONi3j1QjDwE+mkzR9gvyKYuq9
 NvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x+pcPPFHal1ZQJ+2Orzyi/XOmnBS6T266QkUkL9sejs=;
 b=ndvKG1ArmmTO8QNW7XBh2QUQAWM3ExsbC6TBZw1I0+mZZ4GgEdoTh8bDpTioCmuJQd
 usB2iiAikQGTLC0n/9PFwSsf8FdGAetdFLBBBZD0mIwdHM1pMxhGTiXuviRXHWn3/ORO
 aHkyrIsuGcIpFIElNaqhmRpRr2tXaJEsAPNH3vrDTu0vLJfA+QFepdFRVwmqulMi9KPQ
 dGhtQfIohIVldIzdIIeJWtPK4vVb0X+s5lEexHg1ZieLaNQnPHmZqnLVy//kXrqkzm9/
 hzPirGpnnYiqbP7Uuvv9UUL48BfBKo8Da46EjJtmLs9B8mhHdogCHrf15W3e/QIf16AO
 QALw==
X-Gm-Message-State: ACgBeo22h46Ag+eCUzR7nSANYed8Z8D/gz6CjYvd5Qq+t3j5f4MNUyRV
 NiMbFobOvjDbc0u8UOCEWYhygsYCXiM8e7Lw
X-Google-Smtp-Source: AA6agR7ANMdQAAKk4rSB2y6UkAz6Ui/Lm6/AmUCcJs3M/ZY9Co79b50JdjZRYa6C/6I2iFKQwbqeXw==
X-Received: by 2002:a7b:c7d8:0:b0:3b4:5c41:6a6c with SMTP id
 z24-20020a7bc7d8000000b003b45c416a6cmr3011211wmk.139.1663161795259; 
 Wed, 14 Sep 2022 06:23:15 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 05/11] semihosting: Allow optional use of semihosting from
 userspace
Date: Wed, 14 Sep 2022 14:23:02 +0100
Message-Id: <20220914132308.118495-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Currently our semihosting implementations generally prohibit use of
semihosting calls in system emulation from the guest userspace.  This
is a very long standing behaviour justified originally "to provide
some semblance of security" (since code with access to the
semihosting ABI can do things like read and write arbitrary files on
the host system).  However, it is sometimes useful to be able to run
trusted guest code which performs semihosting calls from guest
userspace, notably for test code.  Add a command line suboption to
the existing semihosting-config option group so that you can
explicitly opt in to semihosting from guest userspace with
 -semihosting-config userspace=on

(There is no equivalent option for the user-mode emulator, because
there by definition all code runs in userspace and has access to
semihosting already.)

This commit adds the infrastructure for the command line option and
adds a bool 'is_user' parameter to the function
semihosting_userspace_enabled() that target code can use to check
whether it should be permitting the semihosting call for userspace.
It mechanically makes all the callsites pass 'false', so they
continue checking "is semihosting enabled in general".  Subsequent
commits will make each target that implements semihosting honour the
userspace=on option by passing the correct value and removing
whatever "don't do this for userspace" checking they were doing by
hand.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822141230.3658237-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/semihost.h | 10 ++++++++--
 semihosting/config.c           | 10 ++++++++--
 softmmu/vl.c                   |  2 +-
 stubs/semihost.c               |  2 +-
 target/arm/translate-a64.c     |  2 +-
 target/arm/translate.c         |  6 +++---
 target/m68k/op_helper.c        |  2 +-
 target/nios2/translate.c       |  2 +-
 target/xtensa/translate.c      |  6 +++---
 qemu-options.hx                | 11 +++++++++--
 10 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index 93a3c21b44..efd2efa25a 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -27,7 +27,7 @@ typedef enum SemihostingTarget {
 } SemihostingTarget;
 
 #ifdef CONFIG_USER_ONLY
-static inline bool semihosting_enabled(void)
+static inline bool semihosting_enabled(bool is_user)
 {
     return true;
 }
@@ -52,7 +52,13 @@ static inline const char *semihosting_get_cmdline(void)
     return NULL;
 }
 #else /* !CONFIG_USER_ONLY */
-bool semihosting_enabled(void);
+/**
+ * semihosting_enabled:
+ * @is_user: true if guest code is in usermode (i.e. not privileged)
+ *
+ * Return true if guest code is allowed to make semihosting calls.
+ */
+bool semihosting_enabled(bool is_user);
 SemihostingTarget semihosting_get_target(void);
 const char *semihosting_get_arg(int i);
 int semihosting_get_argc(void);
diff --git a/semihosting/config.c b/semihosting/config.c
index e171d4d6bc..89a1759687 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -34,6 +34,9 @@ QemuOptsList qemu_semihosting_config_opts = {
         {
             .name = "enable",
             .type = QEMU_OPT_BOOL,
+        }, {
+            .name = "userspace",
+            .type = QEMU_OPT_BOOL,
         }, {
             .name = "target",
             .type = QEMU_OPT_STRING,
@@ -50,6 +53,7 @@ QemuOptsList qemu_semihosting_config_opts = {
 
 typedef struct SemihostingConfig {
     bool enabled;
+    bool userspace_enabled;
     SemihostingTarget target;
     char **argv;
     int argc;
@@ -59,9 +63,9 @@ typedef struct SemihostingConfig {
 static SemihostingConfig semihosting;
 static const char *semihost_chardev;
 
-bool semihosting_enabled(void)
+bool semihosting_enabled(bool is_user)
 {
-    return semihosting.enabled;
+    return semihosting.enabled && (!is_user || semihosting.userspace_enabled);
 }
 
 SemihostingTarget semihosting_get_target(void)
@@ -137,6 +141,8 @@ int qemu_semihosting_config_options(const char *optarg)
     if (opts != NULL) {
         semihosting.enabled = qemu_opt_get_bool(opts, "enable",
                                                 true);
+        semihosting.userspace_enabled = qemu_opt_get_bool(opts, "userspace",
+                                                          false);
         const char *target = qemu_opt_get(opts, "target");
         /* setup of chardev is deferred until they are initialised */
         semihost_chardev = qemu_opt_get(opts, "chardev");
diff --git a/softmmu/vl.c b/softmmu/vl.c
index dea4005e47..263f029a8e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1822,7 +1822,7 @@ static void qemu_apply_machine_options(QDict *qdict)
 {
     object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
 
-    if (semihosting_enabled() && !semihosting_get_argc()) {
+    if (semihosting_enabled(false) && !semihosting_get_argc()) {
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
     }
diff --git a/stubs/semihost.c b/stubs/semihost.c
index f486651afb..d65c9fd5dc 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -23,7 +23,7 @@ QemuOptsList qemu_semihosting_config_opts = {
 };
 
 /* Queries to config status default to off */
-bool semihosting_enabled(void)
+bool semihosting_enabled(bool is_user)
 {
     return false;
 }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 163df8c615..3decc8da57 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2219,7 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * it is required for halting debug disabled: it will UNDEF.
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
-        if (semihosting_enabled() && imm16 == 0xf000) {
+        if (semihosting_enabled(false) && imm16 == 0xf000) {
 #ifndef CONFIG_USER_ONLY
             /* In system mode, don't allow userspace access to semihosting,
              * to provide some semblance of security (and for consistency
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9474e4b44b..b1e013270d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1169,7 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled() &&
+    if (semihosting_enabled(false) &&
 #ifndef CONFIG_USER_ONLY
         s->current_el != 0 &&
 #endif
@@ -6556,7 +6556,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     /* BKPT is OK with ECI set and leaves it untouched */
     s->eci_handled = true;
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        semihosting_enabled() &&
+        semihosting_enabled(false) &&
 #ifndef CONFIG_USER_ONLY
         !IS_USER(s) &&
 #endif
@@ -8764,7 +8764,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
     const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
 
-    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled() &&
+    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled(false) &&
 #ifndef CONFIG_USER_ONLY
         !IS_USER(s) &&
 #endif
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d9937ca8dc..4b3dfec130 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -203,7 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled()
+            if (semihosting_enabled(false)
                     && (env->sr & SR_S) != 0
                     && (env->pc & 3) == 0
                     && cpu_lduw_code(env, env->pc - 4) == 0x4e71
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index c588e8e885..ff631a42f6 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -818,7 +818,7 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifndef CONFIG_USER_ONLY
     /* The semihosting instruction is "break 1".  */
     R_TYPE(instr, code);
-    if (semihosting_enabled() && instr.imm5 == 1) {
+    if (semihosting_enabled(false) && instr.imm5 == 1) {
         t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
         return;
     }
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8b864ef925..afae8a1bea 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2366,9 +2366,9 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
     bool ill = true;
 #else
     /* Between RE.2 and RE.3 simcall opcode's become nop for the hardware. */
-    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled();
+    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled(false);
 #endif
-    if (ill || !semihosting_enabled()) {
+    if (ill || !semihosting_enabled(false)) {
         qemu_log_mask(LOG_GUEST_ERROR, "SIMCALL but semihosting is disabled\n");
     }
     return ill ? XTENSA_OP_ILL : 0;
@@ -2378,7 +2378,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
                               const uint32_t par[])
 {
 #ifndef CONFIG_USER_ONLY
-    if (semihosting_enabled()) {
+    if (semihosting_enabled(false)) {
         gen_helper_simcall(cpu_env);
     }
 #endif
diff --git a/qemu-options.hx b/qemu-options.hx
index 31c04f7eea..1bb02363ab 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4627,12 +4627,12 @@ SRST
     information about the facilities this enables.
 ERST
 DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
-    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
+    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
-``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
+``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]``
     Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
@@ -4659,6 +4659,13 @@ SRST
         Send the output to a chardev backend output for native or auto
         output when not in gdb
 
+    ``userspace=on|off``
+        Allows code running in guest userspace to access the semihosting
+        interface. The default is that only privileged guest code can
+        make semihosting calls. Note that setting ``userspace=on`` should
+        only be used if all guest code is trusted (for example, in
+        bare-metal test case code).
+
     ``arg=str1,arg=str2,...``
         Allows the user to pass input arguments, and can be used
         multiple times to build up a list. The old-style
-- 
2.34.1


