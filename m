Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F358009C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:19:29 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyvg-0001vz-Sp
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiM-000126-RV
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiK-0000Gg-8P
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id h8so16116332wrw.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ihqfEvf8e/Rp4WltOhylJI2GJRKNwsRtW1sLAed2GPk=;
 b=KhO+eDQRv/tNj6WCHJcUbvR2+qTjPD9vigWGI1LGmWjjhWcc101ygfnHK+zdYt0vuu
 2NEU9J1JtH/PcapKuQSwnUHqUonxOADRdLAA1z4+EWwrv5yLd6JR7GI4gJJ/7D7AtnVC
 ZmiRUAM3u8RTjxIs2O51qn19tDBiQiW3H/IShqMr90N85ayuyYPhzvfD7cm4t2VWBRIo
 5j/De+xAmI0/qU5EAmD1UpNZ1wqKjhcJTLEUu4Nn9NVYnc8MAz74iFmSJMv3pP5N3IP6
 4JKxkrNudLCZmKQE2kYuNHapFrOlmpGkl4/n2USWsUsHIBWc3fbconX3ekIOAzgvTrDp
 4rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ihqfEvf8e/Rp4WltOhylJI2GJRKNwsRtW1sLAed2GPk=;
 b=KXwngdAe8gZb19R0GLo1EJ5KN8PiDbacIZMNRxeyf5vraVTagdptNszI4ayfA6BvbO
 E8MydH6vBnjGc8Ar9xbas2mK9brR4iVj41m9D3CdC7sWR/mkLPLp4S3qBYQNA4yZgsKM
 lx8hvGrAH3DHUmguRG9NuKwwu8iXmx2ABtLma1Y7pxxE/4NSJrb/S+/9Y2C5nwb+abF/
 tBDAyucqKYv3mkgyRQFQlpVcjifJXn77n8+SFZv8gzRKXdZ3CBo7oOS8NWTvulMm0PxH
 rNpredwi6WvDfk7P3RWZYyZrDKM6y4GZy7x2c4CG9Dx0nvM9wMuX4jn8UpTwCdpq8zrg
 FVIw==
X-Gm-Message-State: AJIora+6JMSA4ZEyq/E/573th1W/DHDr25Pb7p6pzhIt7a49gPacc6Mv
 CFK84tpBwz1oSUZ44Is8VIt3Tw==
X-Google-Smtp-Source: AGRyM1shHO40JCF7qq6oeV2WGMaSzt8Fvk8eOmNQGQS91CKYsrKstGrXWHWH5AVfCny0ZYM8F80qLA==
X-Received: by 2002:a05:6000:1863:b0:21e:8588:b0c1 with SMTP id
 d3-20020a056000186300b0021e8588b0c1mr3933962wri.363.1658757939498; 
 Mon, 25 Jul 2022 07:05:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a056000104500b0021e82cf35efsm4715729wrx.107.2022.07.25.07.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 717141FFC2;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH  v1 10/13] qapi: Add exit-failure PanicAction
Date: Mon, 25 Jul 2022 15:05:17 +0100
Message-Id: <20220725140520.515340-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220722233614.7254-2-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 qapi/run-state.json     |  4 +++-
 include/sysemu/sysemu.h |  2 +-
 softmmu/main.c          |  6 ++++--
 softmmu/runstate.c      | 17 +++++++++++++----
 qemu-options.hx         |  2 +-
 5 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 6e2162d7b3..d42c370c4f 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -364,10 +364,12 @@
 #
 # @shutdown: Shutdown the VM and exit, according to the shutdown action
 #
+# @exit-failure: Shutdown the VM and exit with nonzero status
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


