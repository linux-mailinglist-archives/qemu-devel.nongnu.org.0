Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51E5532F5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:09:09 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dcy-0007JG-DQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTn-0007Sc-An
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:39 -0400
Received: from smtpout30.security-mail.net ([85.31.212.38]:60438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTl-0005FS-25
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 746375F4687
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816374;
 bh=SfEW9suPlkpGJlWDKl3GzFUdjV5M+7KNQtrNHmkhoSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qi3YBFarl8Hfo4u57PbucBzwGVRLQyMBAnqBG83BBky0d0sPdod9CbkFYKMb9fX8+
 RgQesnXljuYPpah2OjpM3sIEv/+uahVIHMQVuduV22rkhpbUTpth+J2oI45b3CcSIp
 OLFXGEwufiy6ea8Km/bSx1ZA79aR73WHWAfKr/kM=
Received: from fx308 (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id BB7AD5F4620;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <8268.62b1c0b4.47c47.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx308.security-mail.net (Postfix) with ESMTPS id 487825F460C;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 26E5527E04D7;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 082AC27E04D6;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 082AC27E04D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=mLTrh3fiun7GkKJwThgXSRhdmxYNZJ8lsvtbYcZqR74=;
 h=From:To:Date:Message-Id;
 b=HXEkOp9hYB7HV8Tk/7JGz3QJQclfzO1ZuqpQNEUvoSTI7w2fbn66SO7zcbSHPgHvu
 M+6uJjAkuuXVzb54loHXMEp8wRIIyOZwXBcSJQlFIBlphtAmrADXTb7goB0tRj1t0B
 +PmnxhIaH7Z9igHexfWYvXjdfZ5S1QV4LZTi4Hjw=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yOdLYC9SD72F; Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id E4F9D27E04DA;
 Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 2/7] semihosting: add the semihosting_exit_request function
Date: Tue, 21 Jun 2022 14:59:11 +0200
Message-Id: <20220621125916.25257-3-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220621125916.25257-1-lmichel@kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.38; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add the semihosting_exit_request function to be used by targets when
handling an `exit' semihosted syscall. This function calls gdb_exit to
close existing GDB connections, and qemu_system_shutdown_request with
the new `guest-semi-exit' exit reason. It sets the QEMU exit status
given by the exit syscall parameter. Finally it stops the CPU to prevent
further execution, and exit the CPU loop as the syscall caller expects
this syscall to not return.

This function is meant to be used in place of a raw exit() call when
handling semihosted `exit' syscalls. Such a call is not safe because
it does not allow other CPU threads to exit properly, leading to e.g.
at_exit callbacks being called while other CPUs still run. This can lead
to strange bugs, especially in plugins with a registered at_exit function.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
---
 qapi/run-state.json            |  4 +++-
 include/semihosting/semihost.h |  5 +++++
 semihosting/config.c           | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 6e2162d7b3..a4f08dd32e 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -80,20 +80,22 @@
 # @guest-reset: Guest reset request, and command line turns that into
 #               a shutdown
 #
 # @guest-panic: Guest panicked, and command line turns that into a shutdown
 #
+# @guest-semi-exit: Guest exit request via a semi-hosted exit syscall
+#
 # @subsystem-reset: Partial guest reset that does not trigger QMP events and
 #                   ignores --no-reboot. This is useful for sanitizing
 #                   hypercalls on s390 that are used during kexec/kdump/boot
 #
 ##
 { 'enum': 'ShutdownCause',
   # Beware, shutdown_caused_by_guest() depends on enumeration order
   'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
             'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
-            'guest-panic', 'subsystem-reset'] }
+            'guest-panic', 'guest-semi-exit', 'subsystem-reset'] }
 
 ##
 # @StatusInfo:
 #
 # Information about VCPU run state
diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index 0c55ade3ac..63b5641241 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -54,10 +54,14 @@ static inline const char *semihosting_get_cmdline(void)
 
 static inline Chardev *semihosting_get_chardev(void)
 {
     return NULL;
 }
+static inline G_NORETURN void semihosting_exit_request(int status)
+{
+    g_assert_not_reached();
+}
 static inline void qemu_semihosting_console_init(void)
 {
 }
 #else /* !CONFIG_USER_ONLY */
 bool semihosting_enabled(void);
@@ -65,10 +69,11 @@ SemihostingTarget semihosting_get_target(void);
 const char *semihosting_get_arg(int i);
 int semihosting_get_argc(void);
 const char *semihosting_get_cmdline(void);
 void semihosting_arg_fallback(const char *file, const char *cmd);
 Chardev *semihosting_get_chardev(void);
+G_NORETURN void semihosting_exit_request(int status);
 /* for vl.c hooks */
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
 void qemu_semihosting_connect_chardevs(void);
 void qemu_semihosting_console_init(void);
diff --git a/semihosting/config.c b/semihosting/config.c
index 3afacf54ab..e60a32a3f7 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -22,10 +22,15 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "semihosting/semihost.h"
 #include "chardev/char.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
+#include "sysemu/cpus.h"
+#include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 
 QemuOptsList qemu_semihosting_config_opts = {
     .name = "semihosting-config",
     .merge_lists = true,
     .implied_opt_name = "enable",
@@ -183,5 +188,16 @@ void qemu_semihosting_connect_chardevs(void)
             exit(1);
         }
         semihosting.chardev = chr;
     }
 }
+
+void semihosting_exit_request(int status)
+{
+    qemu_set_exit_status(status);
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SEMI_EXIT);
+    cpu_stop_current();
+
+    current_cpu->exception_index = EXCP_HLT;
+    current_cpu->halted = 1;
+    cpu_loop_exit(current_cpu);
+}
-- 
2.17.1


