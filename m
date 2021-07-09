Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FA3C27A6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:36:21 +0200 (CEST)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tUC-00057q-Rr
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m1t6a-0004Hg-CP
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:11:56 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m1t6W-0001iy-Ks
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:11:56 -0400
Received: by mail-wr1-x434.google.com with SMTP id m2so1822301wrq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4SfwWmdkOVCkT/IbHrk454t5eodPaV5xA4orcSAa8bA=;
 b=IslzJIJTCPMhRZsg/fk/DvbV0xDmrnCmJrO0P8bn0sMKA7pxkP3+LXo+tSSpK+QBUj
 LZbc389LU2F7gacnQ8kSJOMYR83VOMADVzKh0//96V8PqH2dEe2tvmSRD24uzH2SlzJC
 bC3Z69xpXX/JYOSJOc9d+eo7yTYI0yqjnfO/pKqZGSGQ4urOvCk/8HmbvsEPMxj7B2Av
 kuaAEg6o6N47893N+ac6NCby9uOj22tPusuxUIzLe4cRUXQAOGBuZ2+CpHqdRtjkgesK
 JMY3v8Qtn9sarkqhalQXwJPNnnbqPK0mwNoH/3DcIEXR4pC+/6aYDdrRw7n68L5nCpgx
 kouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4SfwWmdkOVCkT/IbHrk454t5eodPaV5xA4orcSAa8bA=;
 b=ufkOs/6OC+5N5uTXG4a1cKEBo5DlJw5tiylJu5v6y+6+p19f2KWpk+wFGCltC/YoMA
 zXCk7WhY9iyXhBw5gK9udZX8gvzj3P7oHQUBsUdD+dQ5Kq2fLGxfrv8QNobu/h8dHd3X
 AFYpAZRKS3oQeKQdQTMjSGZQMBCFztfATHK0FdOR3pX0vvMPseLevNT8e82Qf2YXOVlX
 u7nRmhGaCH3idrPoMpWgOVOd51khLzEousxJzQKxx4A2yZkFmHMNbrZZiQP2hJpSvaNu
 c8jiybb0M+G9A7u3pDWNqtBo6lBL2rSCjsj5OS3M3VmsHIISLoX4HKC9qrikgzMvzqBx
 5QIQ==
X-Gm-Message-State: AOAM5320i37JRfbi6Bjj0zm31zMI7ibt4UzSmxpWDaM/esnf8IHmbx/3
 8he39pl4aQmQr00/k4cbpcA=
X-Google-Smtp-Source: ABdhPJyXstOWgs+WigIqKz6LZjvb6yx6zWNGbjnOy9F6R8MCBbh4oO9DT0uyd9YdSlIwI4eyhVYByw==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr42731581wrf.351.1625847110074; 
 Fri, 09 Jul 2021 09:11:50 -0700 (PDT)
Received: from lb01556.speedport.ip ([2003:f1:1706:da4a:4a24:a8e2:ab18:53c])
 by smtp.gmail.com with ESMTPSA id h15sm5652360wrq.88.2021.07.09.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:11:49 -0700 (PDT)
From: Li Zhang <zhlcindy@gmail.com>
X-Google-Original-From: Li Zhang <li.zhang@ionos.com>
To: armbru@redhat.com, marcandre.lureau@gmail.com, pankaj.gupta@ionos.com,
 qemu-devel@nongnu.org
Subject: [PATCH v3 RESEND 1/2] qmp: Support chardev-change
Date: Fri,  9 Jul 2021 18:08:42 +0200
Message-Id: <20210709160843.339796-1-li.zhang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=zhlcindy@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some scenarios, we'd like to hot-add a monitor device.  But QEMU
doesn't support that, yet.  It does support hot-swapping character
backends with QMP command chardev-change.  This lets us pre-add a
monitor with a null character backend, then chardev-change to a
socket backend.  Except the chardev-change fails with "Chardev user
does not support chardev hotswap" because monitors don't provide the
required callback.  Implement it for QMP monitors.

Signed-off-by: Li Zhang <li.zhang@ionos.com>
---
v3 -> v2: 
  * Rework the patch which is to add hotswap for QMP device
    https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg03167.html 
  * Refactor the functions qmp_chardev_add and qmp_chardev_change

 monitor/monitor-internal.h |  1 +
 monitor/monitor.c          |  4 +-
 monitor/qmp.c              | 84 +++++++++++++++++++++++++++-----------
 3 files changed, 63 insertions(+), 26 deletions(-)

diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..162f73119b 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -182,5 +182,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name);
 void help_cmd(Monitor *mon, const char *name);
 void handle_hmp_command(MonitorHMP *mon, const char *cmdline);
 int hmp_compare_cmd(const char *name, const char *list);
+void monitor_flush_locked(Monitor *mon);
 
 #endif
diff --git a/monitor/monitor.c b/monitor/monitor.c
index b90c0f4051..1b05ef3bdb 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -154,8 +154,6 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
     return !monitor_uses_readline(container_of(mon, MonitorHMP, common));
 }
 
-static void monitor_flush_locked(Monitor *mon);
-
 static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
                                   void *opaque)
 {
@@ -169,7 +167,7 @@ static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
 }
 
 /* Caller must hold mon->mon_lock */
-static void monitor_flush_locked(Monitor *mon)
+void monitor_flush_locked(Monitor *mon)
 {
     int rc;
     size_t len;
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 092c527b6f..29b49ee041 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -46,6 +46,8 @@ struct QMPRequest {
 typedef struct QMPRequest QMPRequest;
 
 QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
+static void monitor_qmp_setup_handlers_bh(void *opaque);
+static void monitor_backend_init(MonitorQMP *mon, Chardev *chr);
 
 static bool qmp_oob_enabled(MonitorQMP *mon)
 {
@@ -481,6 +483,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
     g_queue_free(mon->qmp_requests);
 }
 
+static bool monitor_in_list(Monitor *mon)
+{
+    Monitor *mon_tmp;
+    QTAILQ_FOREACH(mon_tmp, &mon_list, entry) {
+        if (mon_tmp == mon) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static int monitor_qmp_change(void *opaque)
+{
+    MonitorQMP *mon = opaque;
+
+    monitor_data_init(&mon->common, true, false,
+            qemu_chr_has_feature(mon->common.chr.chr,
+                                 QEMU_CHAR_FEATURE_GCONTEXT));
+    monitor_backend_init(mon, mon->common.chr.chr);
+    qemu_mutex_lock(&mon->common.mon_lock);
+    if (mon->common.out_watch) {
+        mon->common.out_watch = 0;
+        monitor_flush_locked(&mon->common);
+    }
+    qemu_mutex_unlock(&mon->common.mon_lock);
+
+    return 0;
+}
+
 static void monitor_qmp_setup_handlers_bh(void *opaque)
 {
     MonitorQMP *mon = opaque;
@@ -491,30 +522,15 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
     assert(context);
     qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                              monitor_qmp_read, monitor_qmp_event,
-                             NULL, &mon->common, context, true);
-    monitor_list_append(&mon->common);
-}
+                             monitor_qmp_change, &mon->common, context, true);
 
-void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
-{
-    MonitorQMP *mon = g_new0(MonitorQMP, 1);
-
-    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
-        g_free(mon);
-        return;
+    if (!monitor_in_list(&mon->common)) {
+        monitor_list_append(&mon->common);
     }
-    qemu_chr_fe_set_echo(&mon->common.chr, true);
-
-    /* Note: we run QMP monitor in I/O thread when @chr supports that */
-    monitor_data_init(&mon->common, true, false,
-                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
-
-    mon->pretty = pretty;
-
-    qemu_mutex_init(&mon->qmp_queue_lock);
-    mon->qmp_requests = g_queue_new();
+}
 
-    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
+static void monitor_backend_init(MonitorQMP *mon, Chardev *chr)
+{
     if (mon->common.use_io_thread) {
         /*
          * Make sure the old iowatch is gone.  It's possible when
@@ -532,7 +548,29 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
     } else {
         qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
                                  monitor_qmp_read, monitor_qmp_event,
-                                 NULL, &mon->common, NULL, true);
-        monitor_list_append(&mon->common);
+                                 monitor_qmp_change, &mon->common, NULL, true);
+        if (!monitor_in_list(&mon->common)) {
+            monitor_list_append(&mon->common);
+        }
     }
 }
+
+void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
+{
+    MonitorQMP *mon = g_new0(MonitorQMP, 1);
+
+    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
+        g_free(mon);
+        return;
+    }
+    qemu_chr_fe_set_echo(&mon->common.chr, true);
+     /* Note: we run QMP monitor in I/O thread when @chr supports that */
+    monitor_data_init(&mon->common, true, false,
+                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));
+
+    mon->pretty = pretty;
+    qemu_mutex_init(&mon->qmp_queue_lock);
+    mon->qmp_requests = g_queue_new();
+    json_message_parser_init(&mon->parser, handle_qmp_command, mon, NULL);
+    monitor_backend_init(mon, chr);
+}
-- 
2.25.1


