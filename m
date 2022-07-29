Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B0584E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:47:26 +0200 (CEST)
Received: from localhost ([::1]:57364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMab-0004xl-LJ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA8-0002Yf-O1
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA6-0005sZ-9g
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so3808386wmb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOlc+wxUC6YsZtcE4bDc4ixFDql/BQBCzStcRkhv26g=;
 b=uif8XDG29+A31dEeU4MCabM4YLFTyW5SgD9PqVO8tHr/74pw8okeXqbHXmpj0gC+Xy
 6XNWTg2ssAbxKfNXv72dj1LkfPPRGiCoNEcQrKspPQ4PpF237eutePvgNjgzXaNALsXf
 G+RFyljjBfC7dszyiduTguPvkL8cABL/J5vg4x+fFtLuSaXEuoarNo8ZV1phJ9ISAzKp
 jJ3hSTUoXnYBzQ7gHpziJgJqQium27ZgTysXww4YU70AjOFgZn7ZJmAG46kmsxQQFlkN
 LFG/t5i1bXYysX7H4uPoT/bs21ox2CTTyjS6EzPC72ckxqZopCTsH4tUJtRbf+EAcod0
 fg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOlc+wxUC6YsZtcE4bDc4ixFDql/BQBCzStcRkhv26g=;
 b=5s/ojqTtXJ8vLWOF+JuJN+bQyhFMMFOyGr+lk8FqRe6q4YAfWbzT2ysk+C9gtJrggw
 2bqBCMBNBz3cF2XsRvJcZOlgMMvmaxf9vgcoUt5Ot0aBI6eGq7avbmBjJgTLPzw9I0J0
 SxJ1ilGUKiwOdtLJyeGfnFvwFurJSWHJ7n7CsKyWagsKjhxxcjPHUC9wYmuo003SvNGU
 TBKkQj20rtq9Vo9cfKHSJEvQC0NfIelqFjkRfOXHM0+fsVNqhq02VQXgghq7+SXyKgYx
 T9frwOgsmbXGuJV+4sP3BvREwULXXWq+yx179gmke0VXpEvmPZ2nkJ4JS8yYoXVjXUvS
 pfag==
X-Gm-Message-State: AJIora9Bnh9YJj+oZKj0hUUjohKTHlL/4vyy4bHL7Hryxk1BRZ+lL31X
 9tg6TXB9R2r/ccOgsAbpF7Y51nCO/Q7uCQ==
X-Google-Smtp-Source: AGRyM1t3Xhu1Y2aH5Wlm/1AamMo+18AE86dz2vTy48u2ZFPu8zi8rk7rWQjt2T6fASg58DQNSdGfcA==
X-Received: by 2002:a05:600c:154f:b0:3a3:4383:e1eb with SMTP id
 f15-20020a05600c154f00b003a34383e1ebmr1808023wmg.111.1659086401488; 
 Fri, 29 Jul 2022 02:20:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003a31673515bsm9475712wmq.7.2022.07.29.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEC5A1FFC2;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 10/13] qapi: Add exit-failure PanicAction
Date: Fri, 29 Jul 2022 10:19:40 +0100
Message-Id: <20220729091943.2152410-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently QEMU exits with code 0 on both panic an shutdown. For tests
it is useful to return 1 on panic, so that it counts as a test
failure.

Introduce a new exit-failure PanicAction that makes main() return
EXIT_FAILURE. Tests can use -action panic=exit-failure option to
activate this behavior.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220725223746.227063-2-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 6e2162d7b3..9273ea6516 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -364,10 +364,13 @@
 #
 # @shutdown: Shutdown the VM and exit, according to the shutdown action
 #
+# @exit-failure: Shutdown the VM and exit with nonzero status
+#                (since 7.1)
+#
 # Since: 6.0
 ##
 { 'enum': 'PanicAction',
-  'data': [ 'pause', 'shutdown', 'none' ] }
+  'data': [ 'pause', 'shutdown', 'exit-failure', 'none' ] }
 
 ##
 # @watchdog-set-action:
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 812f66a31a..31aa45160b 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -103,7 +103,7 @@ void qemu_boot_set(const char *boot_order, Error **errp);
 bool defaults_enabled(void);
 
 void qemu_init(int argc, char **argv, char **envp);
-void qemu_main_loop(void);
+int qemu_main_loop(void);
 void qemu_cleanup(void);
 
 extern QemuOptsList qemu_legacy_drive_opts;
diff --git a/softmmu/main.c b/softmmu/main.c
index c00432ff09..1b675a8c03 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -32,11 +32,13 @@
 
 int qemu_main(int argc, char **argv, char **envp)
 {
+    int status;
+
     qemu_init(argc, argv, envp);
-    qemu_main_loop();
+    status = qemu_main_loop();
     qemu_cleanup();
 
-    return 0;
+    return status;
 }
 
 #ifndef CONFIG_COCOA
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 168e1b78a0..1e68680b9d 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -482,7 +482,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
                                         !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
-    } else if (panic_action == PANIC_ACTION_SHUTDOWN) {
+    } else if (panic_action == PANIC_ACTION_SHUTDOWN ||
+               panic_action == PANIC_ACTION_EXIT_FAILURE) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
@@ -662,7 +663,7 @@ void qemu_system_debug_request(void)
     qemu_notify_event();
 }
 
-static bool main_loop_should_exit(void)
+static bool main_loop_should_exit(int *status)
 {
     RunState r;
     ShutdownCause request;
@@ -680,6 +681,10 @@ static bool main_loop_should_exit(void)
         if (shutdown_action == SHUTDOWN_ACTION_PAUSE) {
             vm_stop(RUN_STATE_SHUTDOWN);
         } else {
+            if (request == SHUTDOWN_CAUSE_GUEST_PANIC &&
+                panic_action == PANIC_ACTION_EXIT_FAILURE) {
+                *status = EXIT_FAILURE;
+            }
             return true;
         }
     }
@@ -715,12 +720,14 @@ static bool main_loop_should_exit(void)
     return false;
 }
 
-void qemu_main_loop(void)
+int qemu_main_loop(void)
 {
+    int status = EXIT_SUCCESS;
 #ifdef CONFIG_PROFILER
     int64_t ti;
 #endif
-    while (!main_loop_should_exit()) {
+
+    while (!main_loop_should_exit(&status)) {
 #ifdef CONFIG_PROFILER
         ti = profile_getclock();
 #endif
@@ -729,6 +736,8 @@ void qemu_main_loop(void)
         dev_time += profile_getclock() - ti;
 #endif
     }
+
+    return status;
 }
 
 void qemu_add_exit_notifier(Notifier *notify)
diff --git a/qemu-options.hx b/qemu-options.hx
index 79e00916a1..8e17c5064a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4239,7 +4239,7 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
     "                   action when guest reboots [default=reset]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
-    "-action panic=pause|shutdown|none\n"
+    "-action panic=pause|shutdown|exit-failure|none\n"
     "                   action when guest panics [default=shutdown]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
-- 
2.30.2


