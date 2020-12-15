Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF12DB329
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:00:31 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEcc-0001fe-EM
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXO-0003A5-E6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXI-0001UZ-Q1
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTlwasYOON7U22E1Xm2fCBLkP4v45f0ECD/SKjhDbmA=;
 b=WDShhXLBhbe4eQxN27Z+jwikT5IpiF/WjCJNtMN3l/CgGYvkkTDaQXaAiHYx0Akmjduks+
 Kckmj29un8XZJ4/7iyTp9uRKaYxmyUpRjvAlePn5XOE48iZTRgN9tJ0LqnTVmSqeTi6iEL
 ldsNXhnhmO8fGT6Sk0K50rYktCWZpd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385--yjcBgl1ORiqwRBsKgjYGw-1; Tue, 15 Dec 2020 12:54:53 -0500
X-MC-Unique: -yjcBgl1ORiqwRBsKgjYGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 690B118B37E0;
 Tue, 15 Dec 2020 17:54:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AC3C100238C;
 Tue, 15 Dec 2020 17:54:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] vl: Add an -action option specifying response to guest
 events
Date: Tue, 15 Dec 2020 12:54:15 -0500
Message-Id: <20201215175445.1272776-16-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>

Several command line options currently in use are meant to modify
the behavior of QEMU in response to certain guest events like:
-no-reboot, -no-shutdown, -watchdog-action.

These can be grouped into a single option of the form:

-action event=action

Which can be used to specify the existing options above in the
following format:

-action reboot=none|shutdown
-action shutdown=poweroff|pause
-action watchdog=reset|shutdown|poweroff|pause|debug|none|inject-nmi

This is done in preparation for adding yet another option of this
type, which modifies the QEMU behavior when a guest panic occurs.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Message-Id: <1607705564-26264-2-git-send-email-alejandro.j.jimenez@oracle.com>
[Use QemuOpts help support, invoke QMP command. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 22 +++++++++++++++++++
 softmmu/vl.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ae8872d1d6..eb55cd0eea 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3894,6 +3894,28 @@ SRST
     changes to the disk image.
 ERST
 
+DEF("action", HAS_ARG, QEMU_OPTION_action,
+    "-action reboot=none|shutdown\n"
+    "                   action when guest reboots [default=none]\n"
+    "-action shutdown=poweroff|pause\n"
+    "                   action when guest shuts down [default=poweroff]\n"
+    "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
+    "                   action when watchdog fires [default=reset]\n",
+    QEMU_ARCH_ALL)
+SRST
+``-action event=action``
+    The action parameter serves to modify QEMU's default behavior when
+    certain guest events occur. It provides a generic method for specifying the
+    same behaviors that are modified by the ``-no-reboot`` and ``-no-shutdown``
+    parameters.
+
+    Examples:
+
+    ``-action reboot=shutdown,shutdown=pause``
+    ``-watchdog i6300esb -action watchdog=pause``
+
+ERST
+
 DEF("loadvm", HAS_ARG, QEMU_OPTION_loadvm, \
     "-loadvm [tag|id]\n" \
     "                start right away with a saved state (loadvm in monitor)\n",
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 04d94da843..6d1a7ebb08 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -30,6 +30,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu-version.h"
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
@@ -477,6 +478,25 @@ static QemuOptsList qemu_fw_cfg_opts = {
     },
 };
 
+static QemuOptsList qemu_action_opts = {
+    .name = "action",
+    .merge_lists = true,
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_action_opts.head),
+    .desc = {
+        {
+            .name = "shutdown",
+            .type = QEMU_OPT_STRING,
+        },{
+            .name = "reboot",
+            .type = QEMU_OPT_STRING,
+        },{
+            .name = "watchdog",
+            .type = QEMU_OPT_STRING,
+        },
+        { /* end of list */ }
+    },
+};
+
 /**
  * Get machine options
  *
@@ -2298,6 +2318,26 @@ static void qemu_process_sugar_options(void)
     }
 }
 
+/* -action processing */
+
+/*
+ * Process all the -action parameters parsed from cmdline.
+ */
+static int process_runstate_actions(void *opaque, QemuOpts *opts, Error **errp)
+{
+    Error *local_err = NULL;
+    QDict *qdict = qemu_opts_to_qdict(opts, NULL);
+    QObject *ret = NULL;
+    qmp_marshal_set_action(qdict, &ret, &local_err);
+    qobject_unref(ret);
+    qobject_unref(qdict);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return 1;
+    }
+    return 0;
+}
+
 static void qemu_process_early_options(void)
 {
 #ifdef CONFIG_SECCOMP
@@ -2310,6 +2350,11 @@ static void qemu_process_early_options(void)
     qemu_opts_foreach(qemu_find_opts("name"),
                       parse_name, NULL, &error_fatal);
 
+    if (qemu_opts_foreach(qemu_find_opts("action"),
+                          process_runstate_actions, NULL, &error_fatal)) {
+        exit(1);
+    }
+
 #ifndef _WIN32
     qemu_opts_foreach(qemu_find_opts("add-fd"),
                       parse_add_fd, NULL, &error_fatal);
@@ -2560,6 +2605,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_icount_opts);
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
+    qemu_add_opts(&qemu_action_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -3010,6 +3056,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 watchdog = optarg;
                 break;
+            case QEMU_OPTION_action:
+                olist = qemu_find_opts("action");
+                if (!qemu_opts_parse_noisily(olist, optarg, false)) {
+                     exit(1);
+                }
+                break;
             case QEMU_OPTION_watchdog_action:
                 if (select_watchdog_action(optarg) == -1) {
                     error_report("unknown -watchdog-action parameter");
@@ -3155,10 +3207,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_opts_parse_noisily(olist, "hpet=off", false);
                 break;
             case QEMU_OPTION_no_reboot:
-                reboot_action = REBOOT_ACTION_SHUTDOWN;
+                olist = qemu_find_opts("action");
+                qemu_opts_parse_noisily(olist, "reboot=shutdown", false);
                 break;
             case QEMU_OPTION_no_shutdown:
-                shutdown_action = SHUTDOWN_ACTION_PAUSE;
+                olist = qemu_find_opts("action");
+                qemu_opts_parse_noisily(olist, "shutdown=pause", false);
                 break;
             case QEMU_OPTION_show_cursor:
                 warn_report("The -show-cursor option is deprecated. Please "
-- 
2.26.2



