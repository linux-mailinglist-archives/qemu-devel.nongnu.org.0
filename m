Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B7D533AF5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:52:04 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntocV-0005VO-BY
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRv-0005iI-6n
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:07 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRt-0002Ez-1Q
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:06 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mlvmv-1nTJ7I1VsR-00j5N1; Wed, 25
 May 2022 12:40:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/8] linux-user: Clean up arg_start/arg_end confusion
Date: Wed, 25 May 2022 12:40:50 +0200
Message-Id: <20220525104057.543354-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KUpEMC3ior1D/hsJiWrtM0d+b5G0ENpjZKmmApIAFJC5/TK7Was
 g9EntNZEMZZ+ODoue00pxcL3HLB9wEXSX7E5xRADCGZUIM50QJ/5/fZJcNHCHbYjLblqt0o
 /feTCxEhyX5aMWAGiJyCyDu4LqhtOfpoi3wVIW+9AxDsDoAWk+C4tVeDLZaRGOE7F/5EECP
 EmbOMPWxAnFXkS3LHAb4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G4vrW7JqFP0=:zYzGrUh1bL/xLQHBl5QH4D
 72Y44OkVKE41KBiTBXUwXmG/rNiOXxfemtTdRy4eh5wxaxYYfcbLRFJKdriaa1osffBcttSL0
 FuZcK5DgcFuhlCywtKus4J4me/vDKbBftUIjkZlBvgw94SpWr5RjdHvUbRkjPQPFPMp6A5j3c
 BF8K33DHXFxvyaMuZHaCJy3Sg7AF5Al+aHApJf3iJ56P36ZPzWsFibBSDrU8boWkm2CVy753r
 qrSvnKwSeWWYoHaIgLUfhIaa5jz5HV4FI7wtSpQFNWbm2KGphRH1/+nLAD8x/j9G0Infw+bVz
 4+atUU8eASYKXlNUXAQFSiase+aTzEGDEkhvaBJDT3yMHz8QDVs2Ml63LXGc5gluvDbs5yDLM
 vPm+0et2mNEH4pL9RNPCxjdbcGnE1y/QXYZyas/aat1G+6PW8XUo6DobYp+vr8F5hywFqUveQ
 LSsOgmAcGX9TUbYqNUYe3lZMT7LkFJ+efTUNIlUDQONnONHB03JqwlJUoZxWSjrSzxZRuS5T9
 nLSXKlVR63Ed8CGwdFH6N9v6/e0UjRawBTMWG3CR2N/1dYoCNvDX4JMe7ERgTrG44vFxT4Fer
 pUcu+bVE72gT6dk8xH5wiwBDkLpv4R184mLUgAaUphjCTt+zMo2qyb7BojhBv6Ala5a99rP2z
 7pS0ga4HCqwVSzNpWNvh3M+j4Jmj+jyHh0hgOKJBuQlMNynACI+AfG+NGbo90ngtWFjtpMAUz
 eaN6GfJRPVxSg3hGYRvPaPN6w6pHC7g+/DWBpA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

We had two sets of variables: arg_start/arg_end, and
arg_strings/env_strings.  In linuxload.c, we set the
first pair to the bounds of the argv strings, but in
elfload.c, we set the first pair to the bounds of the
argv pointers and the second pair to the bounds of
the argv strings.

Remove arg_start/arg_end, replacing them with the standard
argc/argv/envc/envp values.  Retain arg_strings/env_strings
with the meaning we were using in elfload.c.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220427025129.160184-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c          | 10 ++++++----
 linux-user/linuxload.c        | 12 ++++++++++--
 linux-user/main.c             |  4 ++--
 linux-user/qemu.h             | 12 ++++++++----
 semihosting/arm-compat-semi.c |  4 ++--
 5 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974e5..8c0765dd4b12 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1516,8 +1516,8 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->iaoq[0] = infop->entry;
     regs->iaoq[1] = infop->entry + 4;
     regs->gr[23] = 0;
-    regs->gr[24] = infop->arg_start;
-    regs->gr[25] = (infop->arg_end - infop->arg_start) / sizeof(abi_ulong);
+    regs->gr[24] = infop->argv;
+    regs->gr[25] = infop->argc;
     /* The top-of-stack contains a linkage buffer.  */
     regs->gr[30] = infop->start_stack + 64;
     regs->gr[31] = infop->entry;
@@ -2120,8 +2120,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     u_envp = u_argv + (argc + 1) * n;
     u_auxv = u_envp + (envc + 1) * n;
     info->saved_auxv = u_auxv;
-    info->arg_start = u_argv;
-    info->arg_end = u_argv + argc * n;
+    info->argc = argc;
+    info->envc = envc;
+    info->argv = u_argv;
+    info->envp = u_envp;
 
     /* This is correct because Linux defines
      * elf_addr_t as Elf32_Off / Elf64_Off
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 2ed5fc45ed8c..745cce70abfa 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -92,6 +92,11 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     envp = sp;
     sp -= (argc + 1) * n;
     argv = sp;
+    ts->info->envp = envp;
+    ts->info->envc = envc;
+    ts->info->argv = argv;
+    ts->info->argc = argc;
+
     if (push_ptr) {
         /* FIXME - handle put_user() failures */
         sp -= n;
@@ -99,19 +104,22 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
         sp -= n;
         put_user_ual(argv, sp);
     }
+
     sp -= n;
     /* FIXME - handle put_user() failures */
     put_user_ual(argc, sp);
-    ts->info->arg_start = stringp;
+
+    ts->info->arg_strings = stringp;
     while (argc-- > 0) {
         /* FIXME - handle put_user() failures */
         put_user_ual(stringp, argv);
         argv += n;
         stringp += target_strlen(stringp) + 1;
     }
-    ts->info->arg_end = stringp;
     /* FIXME - handle put_user() failures */
     put_user_ual(0, argv);
+
+    ts->info->env_strings = stringp;
     while (envc-- > 0) {
         /* FIXME - handle put_user() failures */
         put_user_ual(stringp, envp);
diff --git a/linux-user/main.c b/linux-user/main.c
index 7ca48664e447..651e32f5f248 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -878,9 +878,9 @@ int main(int argc, char **argv, char **envp)
             fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n",
                     info->entry);
             fprintf(f, "argv_start  0x" TARGET_ABI_FMT_lx "\n",
-                    info->arg_start);
+                    info->argv);
             fprintf(f, "env_start   0x" TARGET_ABI_FMT_lx "\n",
-                    info->arg_end + (abi_ulong)sizeof(abi_ulong));
+                    info->envp);
             fprintf(f, "auxv_start  0x" TARGET_ABI_FMT_lx "\n",
                     info->saved_auxv);
             qemu_log_unlock(f);
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 46550f5e2178..7d90de1b1549 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -40,15 +40,19 @@ struct image_info {
         abi_ulong       data_offset;
         abi_ulong       saved_auxv;
         abi_ulong       auxv_len;
-        abi_ulong       arg_start;
-        abi_ulong       arg_end;
-        abi_ulong       arg_strings;
-        abi_ulong       env_strings;
+        abi_ulong       argc;
+        abi_ulong       argv;
+        abi_ulong       envc;
+        abi_ulong       envp;
         abi_ulong       file_string;
         uint32_t        elf_flags;
         int             personality;
         abi_ulong       alignment;
 
+        /* Generic semihosting knows about these pointers. */
+        abi_ulong       arg_strings;   /* strings for argv */
+        abi_ulong       env_strings;   /* strings for envp; ends arg_strings */
+
         /* The fields below are used in FDPIC mode.  */
         abi_ulong       loadmap_addr;
         uint16_t        nsegs;
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7a51fd0737d1..b6ddaf863ade 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1106,7 +1106,7 @@ target_ulong do_common_semihosting(CPUState *cs)
 #else
             unsigned int i;
 
-            output_size = ts->info->arg_end - ts->info->arg_start;
+            output_size = ts->info->env_strings - ts->info->arg_strings;
             if (!output_size) {
                 /*
                  * We special-case the "empty command line" case (argc==0).
@@ -1146,7 +1146,7 @@ target_ulong do_common_semihosting(CPUState *cs)
                 goto out;
             }
 
-            if (copy_from_user(output_buffer, ts->info->arg_start,
+            if (copy_from_user(output_buffer, ts->info->arg_strings,
                                output_size)) {
                 errno = EFAULT;
                 status = set_swi_errno(cs, -1);
-- 
2.36.1


