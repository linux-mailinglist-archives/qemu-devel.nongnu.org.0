Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F830FB6F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:29:44 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jNv-0004yf-Qs
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIp-000884-1l
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIf-0005kN-0w
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRaYRd3bi86keHrgnU6pJ7kzGifTS5EX3va68q0833A=;
 b=RJDzTX0BTj4DCzSfqkQzJs65CIjBW9bSmUYyYj3mHBd6Q9h4nR18MeqC/noBuQOz6oXBvO
 tZYjVf4XN0z7JRcE74lnBhm7xwQMv0NRGLJo6L914MqCamoIe4jEPu8npT2XbemIhKhBbN
 dkINkfif2a/q3oraXXVDylywnhSObh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-21irJaa7PaCluITxgd_tFg-1; Thu, 04 Feb 2021 12:20:08 -0500
X-MC-Unique: 21irJaa7PaCluITxgd_tFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65768100C668;
 Thu,  4 Feb 2021 17:20:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72AA860C9B;
 Thu,  4 Feb 2021 17:20:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/33] migration: push Error **errp into
 qemu_save_device_state()
Date: Thu,  4 Feb 2021 17:19:04 +0000
Message-Id: <20210204171907.901471-31-berrange@redhat.com>
In-Reply-To: <20210204171907.901471-1-berrange@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an incremental step in converting vmstate loading code to report
via Error objects instead of printing directly to the console/monitor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/colo.c   |  2 +-
 migration/savevm.c | 51 ++++++++++++++++++++++++++++------------------
 migration/savevm.h |  2 +-
 3 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index a76b72c984..fc824a9732 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -459,7 +459,7 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
         goto out;
     }
     /* Note: device state is saved into buffer */
-    ret = qemu_save_device_state(fb);
+    ret = qemu_save_device_state(fb, &local_err);
 
     qemu_mutex_unlock_iothread();
     if (ret < 0) {
diff --git a/migration/savevm.c b/migration/savevm.c
index 884d12c6eb..994a7c7dab 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1604,9 +1604,10 @@ int qemu_savevm_live_state(QEMUFile *f, Error **errp)
     return 0;
 }
 
-int qemu_save_device_state(QEMUFile *f)
+int qemu_save_device_state(QEMUFile *f, Error **errp)
 {
     SaveStateEntry *se;
+    int ret;
 
     if (!migration_in_colo_state()) {
         qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
@@ -1615,7 +1616,6 @@ int qemu_save_device_state(QEMUFile *f)
     cpu_synchronize_all_states();
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        int ret;
 
         if (se->is_ram) {
             continue;
@@ -1630,8 +1630,9 @@ int qemu_save_device_state(QEMUFile *f)
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
 
         ret = vmstate_save(f, se, NULL);
-        if (ret) {
-            return ret;
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "failed to save device state");
+            return -1;
         }
 
         save_section_footer(f, se);
@@ -1639,7 +1640,12 @@ int qemu_save_device_state(QEMUFile *f)
 
     qemu_put_byte(f, QEMU_VM_EOF);
 
-    return qemu_file_get_error(f);
+    ret = qemu_file_get_error(f);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "I/O error saving device state");
+        return -1;
+    }
+    return 0;
 }
 
 static SaveStateEntry *find_se(const char *idstr, uint32_t instance_id)
@@ -2959,22 +2965,27 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
     f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
     object_unref(OBJECT(ioc));
-    ret = qemu_save_device_state(f);
-    if (ret < 0 || qemu_fclose(f) < 0) {
+    ret = qemu_save_device_state(f, errp);
+    if (ret < 0) {
+        goto the_end;
+    }
+
+    if (qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
-    } else {
-        /* libxl calls the QMP command "stop" before calling
-         * "xen-save-devices-state" and in case of migration failure, libxl
-         * would call "cont".
-         * So call bdrv_inactivate_all (release locks) here to let the other
-         * side of the migration take control of the images.
-         */
-        if (live && !saved_vm_running) {
-            ret = bdrv_inactivate_all();
-            if (ret) {
-                error_setg(errp, "%s: bdrv_inactivate_all() failed (%d)",
-                           __func__, ret);
-            }
+        goto the_end;
+    }
+
+    /* libxl calls the QMP command "stop" before calling
+     * "xen-save-devices-state" and in case of migration failure, libxl
+     * would call "cont".
+     * So call bdrv_inactivate_all (release locks) here to let the other
+     * side of the migration take control of the images.
+     */
+    if (live && !saved_vm_running) {
+        ret = bdrv_inactivate_all();
+        if (ret) {
+            error_setg(errp, "%s: bdrv_inactivate_all() failed (%d)",
+                       __func__, ret);
         }
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index 7abd75b668..a91e097b51 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -60,7 +60,7 @@ void qemu_savevm_send_postcopy_ram_discard(QEMUFile *f, const char *name,
                                            uint64_t *length_list);
 void qemu_savevm_send_colo_enable(QEMUFile *f);
 int qemu_savevm_live_state(QEMUFile *f, Error **errp);
-int qemu_save_device_state(QEMUFile *f);
+int qemu_save_device_state(QEMUFile *f, Error **errp);
 
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(void);
-- 
2.29.2


