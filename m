Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616606A0B20
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:48:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvf-0001zf-OQ; Thu, 23 Feb 2023 08:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvd-0001yJ-SE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvb-0001Lu-Ao
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfJ0CUF+hd4V2TZHuoU9TMc+u0nzgLF22q4HOavaYaE=;
 b=D1NbExF6gIIZFaKdxeFGED0lj+akOMfLXTdZjv6eZTBNl7JQWCdGZ0bvg4EqOWFUHTUnhJ
 knsrSMVWSg4iJMs9i9dK46mvQZqqDIf6ua2Igd8l/Guxk0dIsSnM+rzqbVoq+noUbjwfD8
 Vm9TOUePjSVdZr+KrwWlbP843kyhUw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-E656rAbPP0espFXL7c3KVA-1; Thu, 23 Feb 2023 08:46:29 -0500
X-MC-Unique: E656rAbPP0espFXL7c3KVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7CE8828C1;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3E340C945A;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5CAD21E6A36; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/12] replay: Simplify setting replay blockers
Date: Thu, 23 Feb 2023 14:46:23 +0100
Message-Id: <20230223134626.2107382-10-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

replay_add_blocker() takes an Error *.  All callers pass one created
like this:

    error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "some feature");

Folding this into replay_add_blocker() simplifies the callers, losing
a bit of generality we haven't needed in more than six years.

Since there are no other uses of macro QERR_REPLAY_NOT_SUPPORTED,
replace the remaining one by its expansion, and drop the macro.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-10-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h |  3 ---
 include/sysemu/replay.h   |  2 +-
 replay/replay.c           |  6 +++++-
 replay/stubs-system.c     |  2 +-
 softmmu/rtc.c             |  5 +----
 softmmu/vl.c              | 13 +++----------
 6 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 87ca83b155..09006e69f7 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -59,9 +59,6 @@
 #define QERR_QGA_COMMAND_FAILED \
     "Guest agent command failed, error was '%s'"
 
-#define QERR_REPLAY_NOT_SUPPORTED \
-    "Record/replay feature is not supported for '%s'"
-
 #define QERR_UNSUPPORTED \
     "this feature or command is not currently supported"
 
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
index 7ec0882b50..6e5ab09f71 100644
--- a/include/sysemu/replay.h
+++ b/include/sysemu/replay.h
@@ -72,7 +72,7 @@ void replay_start(void);
 /*! Closes replay log file and frees other resources. */
 void replay_finish(void);
 /*! Adds replay blocker with the specified error description */
-void replay_add_blocker(Error *reason);
+void replay_add_blocker(const char *feature);
 /* Returns name of the replay log file */
 const char *replay_get_filename(void);
 /*
diff --git a/replay/replay.c b/replay/replay.c
index 9a0dc1cf44..c39156c522 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -376,8 +376,12 @@ void replay_finish(void)
     replay_mode = REPLAY_MODE_NONE;
 }
 
-void replay_add_blocker(Error *reason)
+void replay_add_blocker(const char *feature)
 {
+    Error *reason = NULL;
+
+    error_setg(&reason, "Record/replay feature is not supported for '%s'",
+               feature);
     replay_blockers = g_slist_prepend(replay_blockers, reason);
 }
 
diff --git a/replay/stubs-system.c b/replay/stubs-system.c
index 5c262b08f1..50cefdb2d6 100644
--- a/replay/stubs-system.c
+++ b/replay/stubs-system.c
@@ -12,7 +12,7 @@ void replay_input_sync_event(void)
     qemu_input_event_sync_impl();
 }
 
-void replay_add_blocker(Error *reason)
+void replay_add_blocker(const char *feature)
 {
 }
 void replay_audio_in(size_t *recorded, void *samples, size_t *wpos, size_t size)
diff --git a/softmmu/rtc.c b/softmmu/rtc.c
index f7114bed7d..4b2bf75dd6 100644
--- a/softmmu/rtc.c
+++ b/softmmu/rtc.c
@@ -152,11 +152,8 @@ void configure_rtc(QemuOpts *opts)
         if (!strcmp(value, "utc")) {
             rtc_base_type = RTC_BASE_UTC;
         } else if (!strcmp(value, "localtime")) {
-            Error *blocker = NULL;
             rtc_base_type = RTC_BASE_LOCALTIME;
-            error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
-                      "-rtc base=localtime");
-            replay_add_blocker(blocker);
+            replay_add_blocker("-rtc base=localtime");
         } else {
             rtc_base_type = RTC_BASE_DATETIME;
             configure_rtc_base_datetime(value);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 459588aa7d..6e526d95bb 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1852,9 +1852,7 @@ static void qemu_apply_machine_options(QDict *qdict)
     }
 
     if (current_machine->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
+        replay_add_blocker("smp");
     }
 }
 
@@ -2774,13 +2772,8 @@ void qemu_init(int argc, char **argv)
                 drive_add(IF_PFLASH, -1, optarg, PFLASH_OPTS);
                 break;
             case QEMU_OPTION_snapshot:
-                {
-                    Error *blocker = NULL;
-                    snapshot = 1;
-                    error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED,
-                               "-snapshot");
-                    replay_add_blocker(blocker);
-                }
+                snapshot = 1;
+                replay_add_blocker("-snapshot");
                 break;
             case QEMU_OPTION_numa:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("numa"),
-- 
2.39.0


