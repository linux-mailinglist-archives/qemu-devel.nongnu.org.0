Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB944448B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:20:05 +0100 (CET)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI3Y-00088L-KF
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0003UW-Rs
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp2-0000a1-5L
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id b71so2227988wmd.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfEPGGdEuQA4tJkhanah7cV7Ub1nKcQ28u2qdP0NjLI=;
 b=aHH1sOCYkPv8n969KKl1eGGy7r9MMnV4os8XAC7JPg4TH02FbggbCQrxwbJXHZKhAm
 FOHBJqzL7GMHJ/SM7WrdrNrJ6M1tLl3F7jG8CKoSLdzlcOQk//1IQ0jblotH/x82SmTE
 e5vZVEnO3g9/AuKnif1Wtj0Vjm1cn56mGPFKnEC1hXWGlZVGjr+Dq8iwJhEVm/cYSIty
 kSGbfZkVDye5J2Z34xk7QDTh3uIUAHeYUcPooJARuokhaKqBomqFm3gNuVLeQ/IsANCK
 qZEoPA3OUfx0y0r1gFCSJgut6fJrtU9la1e9xD6ikkmVP3iu3iJt50k3cihlVmVgybPt
 TlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XfEPGGdEuQA4tJkhanah7cV7Ub1nKcQ28u2qdP0NjLI=;
 b=pkpmq0Ls07NtdVN32G3vkjj5Zz1d/4ktEuz7nLiJ73SBSkYFHCp74GMLOeRMOEGWf6
 aKRkkCtyOAO16ccpmfvJjefCeOHzNnqnnTR6W/OmT9wMl56XjP/Xu1VHoQt/l+hVYWr6
 Wj7sGynFlFwF3PxtUnSQlTKFLxe3cyWgs9uUTiKtrF0+WkYumX/IdWp00lsgie+WEKMH
 YquRLMP5Ib7Ga+cYxAWQRavqZ5rje3NdpjBtgom84JkbViuA58ZCzlvUCM17V7Kv3wzb
 jCumVyS8PgfG4h37njx+326OYZAoICTjqzvsVeVkoWmLiy93Tyf5Z9XzZPiYI2GhDp3R
 DY6w==
X-Gm-Message-State: AOAM533pf1v1pC/YW5WziKGpHixGYqsyDOm5GQqxCBM7WE+E3kq27dEU
 NxF28A/vVeOThXOzxqLxPVDIBAaVR8s=
X-Google-Smtp-Source: ABdhPJxKzyhosCtFpHPZ0FoSz7FF/9mJEEAvdqAFgk/3KqCDw9ajThfwQNgsirWTQXFDOtYztTgkcA==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr15987820wmq.33.1635951902855; 
 Wed, 03 Nov 2021 08:05:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/27] watchdog: remove select_watchdog_action
Date: Wed,  3 Nov 2021 16:04:31 +0100
Message-Id: <20211103150442.387121-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Instead of invoking select_watchdog_action from both HMP and command line,
go directly from HMP to QMP and use QemuOpts as the intermediary for the
command line.

This makes -watchdog-action explicitly a shortcut for "-action watchdog",
so that "-watchdog-action" and "-action watchdog" override each other
based on the position on the command line; previously, "-action watchdog"
always won.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/watchdog/watchdog.c    | 14 --------------
 include/sysemu/watchdog.h |  1 -
 monitor/misc.c            | 15 ++++++++++++---
 softmmu/vl.c              | 10 +++++-----
 4 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 0e98ffb73f..1437e6c5b6 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -76,20 +76,6 @@ int select_watchdog(const char *p)
     return 1;
 }
 
-int select_watchdog_action(const char *p)
-{
-    int action;
-    char *qapi_value;
-
-    qapi_value = g_ascii_strdown(p, -1);
-    action = qapi_enum_parse(&WatchdogAction_lookup, qapi_value, -1, NULL);
-    g_free(qapi_value);
-    if (action < 0)
-        return -1;
-    qmp_watchdog_set_action(action, &error_abort);
-    return 0;
-}
-
 WatchdogAction get_watchdog_action(void)
 {
     return watchdog_action;
diff --git a/include/sysemu/watchdog.h b/include/sysemu/watchdog.h
index a08d16380d..d2d4901dbb 100644
--- a/include/sysemu/watchdog.h
+++ b/include/sysemu/watchdog.h
@@ -37,7 +37,6 @@ typedef struct WatchdogTimerModel WatchdogTimerModel;
 
 /* in hw/watchdog.c */
 int select_watchdog(const char *p);
-int select_watchdog_action(const char *action);
 WatchdogAction get_watchdog_action(void);
 void watchdog_add_model(WatchdogTimerModel *model);
 void watchdog_perform_action(void);
diff --git a/monitor/misc.c b/monitor/misc.c
index c2d227a07c..1759d1e7f1 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -70,6 +70,7 @@
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-trace.h"
 #include "qapi/qapi-init-commands.h"
 #include "qapi/error.h"
@@ -471,10 +472,18 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 
 static void hmp_watchdog_action(Monitor *mon, const QDict *qdict)
 {
-    const char *action = qdict_get_str(qdict, "action");
-    if (select_watchdog_action(action) == -1) {
-        monitor_printf(mon, "Unknown watchdog action '%s'\n", action);
+    Error *err = NULL;
+    WatchdogAction action;
+    char *qapi_value;
+
+    qapi_value = g_ascii_strdown(qdict_get_str(qdict, "action"), -1);
+    action = qapi_enum_parse(&WatchdogAction_lookup, qapi_value, -1, &err);
+    g_free(qapi_value);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
     }
+    qmp_watchdog_set_action(action, &error_abort);
 }
 
 static void monitor_printc(Monitor *mon, int c)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 570120f5c4..1159a64bce 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3265,12 +3265,12 @@ void qemu_init(int argc, char **argv, char **envp)
                      exit(1);
                 }
                 break;
-            case QEMU_OPTION_watchdog_action:
-                if (select_watchdog_action(optarg) == -1) {
-                    error_report("unknown -watchdog-action parameter");
-                    exit(1);
-                }
+            case QEMU_OPTION_watchdog_action: {
+                QemuOpts *opts;
+                opts = qemu_opts_create(qemu_find_opts("action"), NULL, 0, &error_abort);
+                qemu_opt_set(opts, "watchdog", optarg, &error_abort);
                 break;
+            }
             case QEMU_OPTION_parallel:
                 add_device_config(DEV_PARALLEL, optarg);
                 default_parallel = 0;
-- 
2.31.1



