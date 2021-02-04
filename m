Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845930FA8A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:02:33 +0100 (CET)
Received: from localhost ([::1]:38398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ixc-0001nu-7b
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI5-0007NO-5Z
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHv-0005Ko-4I
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHusVvUpENiraCIsO2mGYaSUCOjLQU0oOVgnp9EG2Lk=;
 b=RwCacpWZnK4eDJ5pNdfbcg0xCHdNnP3smQzZgodDDRgGPTvLaoh6zJkDrA3cIdt2POiv9H
 FtG+snmPbP4T6Io3QFLV6g5dwL8FlCymnfKwF7k8MX006xS7ddYX9ZOXsTO2jxFSUPoI5D
 +8eDFPPnYBcvWsLN4xTwznZ+1VAWsrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-d_EizzR7N-uleCWChIcstA-1; Thu, 04 Feb 2021 12:19:24 -0500
X-MC-Unique: d_EizzR7N-uleCWChIcstA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0995D814301;
 Thu,  4 Feb 2021 17:19:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D962A60937;
 Thu,  4 Feb 2021 17:19:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/33] migration: push Error **errp into
 qemu_loadvm_section_start_full()
Date: Thu,  4 Feb 2021 17:18:40 +0000
Message-Id: <20210204171907.901471-7-berrange@redhat.com>
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

This is particularly useful for loading snapshots as this is a likely
error scenario to hit when the source and dest VM configs do not
match. This is illustrated by the improved error reporting in the
QMP load snapshot test.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c                            | 49 +++++++++----------
 .../tests/internal-snapshots-qapi.out         |  3 +-
 2 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index e47aec435c..f2eee0a4a7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2350,7 +2350,8 @@ static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
 }
 
 static int
-qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
+qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis,
+                               Error **errp)
 {
     uint32_t instance_id, version_id, section_id;
     SaveStateEntry *se;
@@ -2360,18 +2361,18 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     /* Read section start */
     section_id = qemu_get_be32(f);
     if (!qemu_get_counted_string(f, idstr)) {
-        error_report("Unable to read ID string for section %u",
-                     section_id);
-        return -EINVAL;
+        error_setg(errp, "Unable to read ID string for section %u",
+                   section_id);
+        return -1;
     }
     instance_id = qemu_get_be32(f);
     version_id = qemu_get_be32(f);
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Failed to read instance/version ID: %d",
-                     __func__, ret);
-        return ret;
+        error_setg(errp, "Failed to read instance/version ID: %d",
+                   ret);
+        return -1;
     }
 
     trace_qemu_loadvm_state_section_startfull(section_id, idstr,
@@ -2379,36 +2380,37 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     /* Find savevm section */
     se = find_se(idstr, instance_id);
     if (se == NULL) {
-        error_report("Unknown savevm section or instance '%s' %"PRIu32". "
-                     "Make sure that your current VM setup matches your "
-                     "saved VM setup, including any hotplugged devices",
-                     idstr, instance_id);
-        return -EINVAL;
+        error_setg(errp, "Unknown savevm section or instance '%s' %"PRIu32". "
+                   "Make sure that your current VM setup matches your "
+                   "saved VM setup, including any hotplugged devices",
+                   idstr, instance_id);
+        return -1;
     }
 
     /* Validate version */
     if (version_id > se->version_id) {
-        error_report("savevm: unsupported version %d for '%s' v%d",
-                     version_id, idstr, se->version_id);
-        return -EINVAL;
+        error_setg(errp, "savevm: unsupported version %d for '%s' v%d",
+                   version_id, idstr, se->version_id);
+        return -1;
     }
     se->load_version_id = version_id;
     se->load_section_id = section_id;
 
     /* Validate if it is a device's state */
     if (xen_enabled() && se->is_ram) {
-        error_report("loadvm: %s RAM loading not allowed on Xen", idstr);
-        return -EINVAL;
+        error_setg(errp, "loadvm: %s RAM loading not allowed on Xen", idstr);
+        return -1;
     }
 
     ret = vmstate_load(f, se);
     if (ret < 0) {
-        error_report("error while loading state for instance 0x%"PRIx32" of"
-                     " device '%s'", instance_id, idstr);
-        return ret;
+        error_setg(errp, "error while loading state for instance 0x%"PRIx32" of"
+                   " device '%s'", instance_id, idstr);
+        return -1;
     }
     if (!check_section_footer(f, se)) {
-        return -EINVAL;
+        error_setg(errp, "failed check for device state section footer");
+        return -1;
     }
 
     return 0;
@@ -2601,11 +2603,8 @@ retry:
         switch (section_type) {
         case QEMU_VM_SECTION_START:
         case QEMU_VM_SECTION_FULL:
-            ret = qemu_loadvm_section_start_full(f, mis);
+            ret = qemu_loadvm_section_start_full(f, mis, errp);
             if (ret < 0) {
-                error_setg(errp,
-                           "Failed to load device state section start: %d",
-                           ret);
                 goto out;
             }
             break;
diff --git a/tests/qemu-iotests/tests/internal-snapshots-qapi.out b/tests/qemu-iotests/tests/internal-snapshots-qapi.out
index 26ff4a838c..fd3e2a9ed0 100644
--- a/tests/qemu-iotests/tests/internal-snapshots-qapi.out
+++ b/tests/qemu-iotests/tests/internal-snapshots-qapi.out
@@ -345,13 +345,12 @@ Formatting 'TEST_DIR/t.qcow2.alt2', fmt=IMGFMT size=134217728
                                      "devices": ["diskfmt0"]}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "load-err-stderr"}}
-qemu-system-x86_64: Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "load-err-stderr"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "STOP"}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "load-err-stderr"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "load-err-stderr"}}
 {"execute": "query-jobs"}
-{"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Error -22 while loading VM state"}]}
+{"return": [{"current-progress": 1, "status": "concluded", "total-progress": 1, "type": "snapshot-load", "id": "load-err-stderr", "error": "Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices"}]}
 {"execute": "job-dismiss", "arguments": {"id": "load-err-stderr"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "load-err-stderr"}}
-- 
2.29.2


