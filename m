Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23775532F6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:09:50 +0200 (CEST)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ddd-0008SX-QX
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTo-0007UY-MN
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from smtpout30.security-mail.net ([85.31.212.38]:60586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTl-0005Fc-Ua
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id 7C5495F46EF
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816376;
 bh=8AoLDKKMDfz7XgrOQZjn193j+3Nd9LcsodtAEQaqICs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eIc49C1r7IZ1gTPKGfM6rX42wRPW7MHuCFyik7ra1AnSn871QbI7CroCIhca62upn
 6dMxIMAn8DS31459VpobgSIV2zuOtPq555FhI2pvubLuiG0L3ppp5t+wxNGc7cpQ15
 mLM0mjB/aMAoX+ljN8DzJXMGlVoxJcOb9N8MqNYo=
Received: from fx308 (localhost [127.0.0.1])
 by fx308.security-mail.net (Postfix) with ESMTP id BE7845F4624;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <83fd.62b1c0b4.3d086.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx308.security-mail.net (Postfix) with ESMTPS id 3D7DB5F460A;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 1C1CD27E04EF;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 004D627E04E7;
 Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 004D627E04E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816372;
 bh=CHdUa5EUCvF0MuxJdZ5rZNLhaXwYjEDCGzXTOWTxyJ0=;
 h=From:To:Date:Message-Id;
 b=e5VZlIMlViugRB3Uqgg6etitTNXbasH044jOQNarMlAgFSVqg/zJj2/Hb7gv8BMzf
 yoXv0lfYBjjMqhW+mrfidmkelrvibyEJAG3FFZIirdCbsk7OJ/VgI96fXpMSchA6H/
 HSeOH0bxnWmKsQ7ezPJG6R7ck6u8l97ZZ2pVb8mc=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ck7MY46QggJy; Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id D22D227E04D7;
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
Subject: [PATCH v2 1/7] softmmu: add qemu_[set|get]_exit_status functions
Date: Tue, 21 Jun 2022 14:59:10 +0200
Message-Id: <20220621125916.25257-2-lmichel@kalray.eu>
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

Add the two function qemu_set_exit_status() and qemu_get_exit_status().
Use qemu_get_exit_status() in main instead of 0 as the return value.

This is in preparation for the semihosting exit request implementation.

Signed-off-by: Luc Michel <lmichel@kalray.eu>
---
 include/sysemu/sysemu.h |  2 ++
 softmmu/main.c          |  2 +-
 softmmu/runstate.c      | 13 ++++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 812f66a31a..49b6970d0e 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,10 +103,12 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 bool defaults_enabled(void);
 
 void qemu_init(int argc, char **argv, char **envp);
 void qemu_main_loop(void);
 void qemu_cleanup(void);
+void qemu_set_exit_status(int status);
+int qemu_get_exit_status(void);
 
 extern QemuOptsList qemu_legacy_drive_opts;
 extern QemuOptsList qemu_common_drive_opts;
 extern QemuOptsList qemu_drive_opts;
 extern QemuOptsList bdrv_runtime_opts;
diff --git a/softmmu/main.c b/softmmu/main.c
index c00432ff09..67b4bb111e 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -34,11 +34,11 @@ int qemu_main(int argc, char **argv, char **envp)
 {
     qemu_init(argc, argv, envp);
     qemu_main_loop();
     qemu_cleanup();
 
-    return 0;
+    return qemu_get_exit_status();
 }
 
 #ifndef CONFIG_COCOA
 int main(int argc, char **argv)
 {
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index fac7b63259..a86ffa91e5 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -336,10 +336,11 @@ void vm_state_notify(bool running, RunState state)
 }
 
 static ShutdownCause reset_requested;
 static ShutdownCause shutdown_requested;
 static int shutdown_signal;
+static int exit_status;
 static pid_t shutdown_pid;
 static int powerdown_requested;
 static int debug_requested;
 static int suspend_requested;
 static WakeupReason wakeup_reason;
@@ -351,10 +352,20 @@ static NotifierList wakeup_notifiers =
     NOTIFIER_LIST_INITIALIZER(wakeup_notifiers);
 static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
 
+void qemu_set_exit_status(int status)
+{
+    exit_status = status;
+}
+
+int qemu_get_exit_status(void)
+{
+    return exit_status;
+}
+
 ShutdownCause qemu_shutdown_requested_get(void)
 {
     return shutdown_requested;
 }
 
@@ -779,11 +790,11 @@ void qemu_init_subsystems(void)
 }
 
 
 void qemu_cleanup(void)
 {
-    gdb_exit(0);
+    gdb_exit(qemu_get_exit_status());
 
     /*
      * cleaning up the migration object cancels any existing migration
      * try to do this early so that it also stops using devices.
      */
-- 
2.17.1


