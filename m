Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C163C207968
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:45:36 +0200 (CEST)
Received: from localhost ([::1]:46514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8Wl-0005Xi-OC
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8V9-0002kn-3h
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:43:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8V6-00053p-7V
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mm/kofzRNyOunuojyEqtb79g/+IEcxiaBep8L7I0mlg=;
 b=AWNv/Om3dTVYaq7KkFJkmMhzW27FKp0fTXsimA5LGYTMgcZ1L7QIy/Z08MGB4ZobAubwkS
 1WCpqPyLweiFYTALQGmNTMXwvV0bf/v0Pu2Z89ZOZIZiWfEeGBghbUjU7oyfilr5QNPXBH
 7AuQhdauSCKb2GCMLxQdjl+TNoAAlNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-m3N-ETyZMoiEV9WMw0000A-1; Wed, 24 Jun 2020 12:43:50 -0400
X-MC-Unique: m3N-ETyZMoiEV9WMw0000A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE4E413E6;
 Wed, 24 Jun 2020 16:43:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74DBB60F8A;
 Wed, 24 Jun 2020 16:43:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 074741138477; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/46] qemu-option: Check return value instead of @err where
 convenient
Date: Wed, 24 Jun 2020 18:43:08 +0200
Message-Id: <20200624164344.3778251-11-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert uses like

    opts = qemu_opts_create(..., &err);
    if (err) {
        ...
    }

to

    opts = qemu_opts_create(..., &err);
    if (!opts) {
        ...
    }

Eliminate error_propagate() that are now unnecessary.  Delete @err
that are now unused.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/parallels.c  |  4 ++--
 blockdev.c         |  5 ++---
 qdev-monitor.c     |  6 ++----
 util/qemu-config.c | 10 ++++------
 util/qemu-option.c | 12 ++++--------
 5 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 860dbb80a2..b15c9ac28d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -823,8 +823,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
-    opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, &local_err);
-    if (local_err != NULL) {
+    opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
+    if (!opts) {
         goto fail_options;
     }
 
diff --git a/blockdev.c b/blockdev.c
index 73736a4eaf..481f36c543 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -504,9 +504,8 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     /* Check common options by copying from bs_opts to opts, all other options
      * stay in bs_opts for processing by bdrv_open(). */
     id = qdict_get_try_str(bs_opts, "id");
-    opts = qemu_opts_create(&qemu_common_drive_opts, id, 1, &error);
-    if (error) {
-        error_propagate(errp, error);
+    opts = qemu_opts_create(&qemu_common_drive_opts, id, 1, errp);
+    if (!opts) {
         goto err_no_opts;
     }
 
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 40c34bb9cf..3143dd2afb 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -792,13 +792,11 @@ void hmp_info_qdm(Monitor *mon, const QDict *qdict)
 
 void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
 {
-    Error *local_err = NULL;
     QemuOpts *opts;
     DeviceState *dev;
 
-    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
+    if (!opts) {
         return;
     }
     if (!monitor_cur_is_qmp() && qdev_device_help(opts)) {
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 772f5a219e..c0d0e9b8ef 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -493,9 +493,8 @@ static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
         goto out;
     }
 
-    subopts = qemu_opts_create(opts, NULL, 0, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    subopts = qemu_opts_create(opts, NULL, 0, errp);
+    if (!subopts) {
         goto out;
     }
 
@@ -538,10 +537,9 @@ static void config_parse_qdict_section(QDict *options, QemuOptsList *opts,
             }
 
             opt_name = g_strdup_printf("%s.%u", opts->name, i++);
-            subopts = qemu_opts_create(opts, opt_name, 1, &local_err);
+            subopts = qemu_opts_create(opts, opt_name, 1, errp);
             g_free(opt_name);
-            if (local_err) {
-                error_propagate(errp, local_err);
+            if (!subopts) {
                 goto out;
             }
 
diff --git a/util/qemu-option.c b/util/qemu-option.c
index fd667ea523..6119f971a4 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -670,11 +670,9 @@ void qemu_opts_set(QemuOptsList *list, const char *id,
                    const char *name, const char *value, Error **errp)
 {
     QemuOpts *opts;
-    Error *local_err = NULL;
 
-    opts = qemu_opts_create(list, id, 1, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    opts = qemu_opts_create(list, id, 1, errp);
+    if (!opts) {
         return;
     }
     qemu_opt_set(opts, name, value, errp);
@@ -1011,10 +1009,8 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
     QemuOpts *opts;
     const QDictEntry *entry;
 
-    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
-                            &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
+    if (!opts) {
         return NULL;
     }
 
-- 
2.26.2


