Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5080D43CACD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:37:56 +0200 (CEST)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfj7r-00042J-4M
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfija-00026N-84
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mfijY-0005f7-LJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:12:49 -0400
Received: by mail-ed1-x531.google.com with SMTP id r12so10341656edt.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnp475mRSCE7gq/B7ARMmQozRUpSW+crMgmW9IoFGmY=;
 b=RZEIymymi2b4MA15Ha7oejVuZXKBFzBUoCoCmpwBH6Bf+CJzJ7bRZpzFrglj32gLjl
 WrspqXesqnjt5X958sv57cRrnEOcXQWD3FXU2BeWH26ekJRwgGu494bRDqUxvPnXnedN
 WmNysXeIr/HKoIBxmSXk1aegcD2CRfBUShmkGSbutAdBPx0WuSO7LTXgE6pEQV8YhGK4
 0Wqt11hjoxp4nyJVy9/ETfu2GVjP5gf4a/c/NTvzlR6k5Ekc4qexbzaE4kecBOqg++z6
 BUex0EMhQiek5o76AqhfqCehixlT9GTJNMNhT8xlrjBIWhM0HtWge8SEVIfkPBrWHvsc
 LOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rnp475mRSCE7gq/B7ARMmQozRUpSW+crMgmW9IoFGmY=;
 b=sh/S+SEhQvb9mEcn7cPX/kBcx8JJkiQriqp/WkTuaizAgbdgj1lbxvFAhH9+VMsWDT
 13fBgG2KDJULeqH5zJxiL3/g6SK0baJ5YBNnpPhSlB4hJc0TBw0S7AXkdijhEpAqEFtk
 7nUGczJTeB725Yq1bwGLFDL4GmpNMXfWEP5G2u6JWvxZftUCsNdlunwAYxOBw7XoFVZB
 z3r0bldwuIsQz/xFFuh3FPZg6mAvMewNlJvsH9RgGvJbFnMZFkJ6vw5eh0v1S6JFTv3D
 b9DD6Ci8RIhwNiPVAtc2fVbePpLFbYTHmSWaBa4/1QFeWm3GL0aOgmtwDbM31SjagaZh
 u4gA==
X-Gm-Message-State: AOAM5307STiVxHfIkmKvyz6WhuFPlHpVry2iJ6tDYDKXMt9c5OO9UUJ8
 lndIEPDRmO3hPjgALRF63BRJmL67oMI=
X-Google-Smtp-Source: ABdhPJynS110x4P4Uyqrqqvsf6SjHHqMG0sCdiORl6jHuoKDqLdRhe8k/cCFOuAP9DqFoXAlhcia8Q==
X-Received: by 2002:aa7:dbc1:: with SMTP id v1mr20055423edt.49.1635340362991; 
 Wed, 27 Oct 2021 06:12:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p26sm12716943edu.57.2021.10.27.06.12.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:12:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] watchdog: remove select_watchdog_action
Date: Wed, 27 Oct 2021 15:12:39 +0200
Message-Id: <20211027131239.802564-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027131239.802564-1-pbonzini@redhat.com>
References: <20211027131239.802564-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
index ffe7966870..f411675e32 100644
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
@@ -470,10 +471,18 @@ static void hmp_gdbserver(Monitor *mon, const QDict *qdict)
 
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
index 33908860e7..cf01bd5084 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3225,12 +3225,12 @@ void qemu_init(int argc, char **argv, char **envp)
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


