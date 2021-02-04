Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97730FB6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:29:21 +0100 (CET)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jNY-0004pF-Vo
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIl-00086b-8y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIa-0005jP-Ph
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkQzQEOZtsNbJ5a3pC1X3wjE7y7HyONi/y17NLqswl8=;
 b=cCJmNhG60xz1Nnqq446ry1h5Zv5NZeXt93/jaMGMZoJUHox0KHwshvfF7cvFxwI0mmvOZ5
 GJrkjkBjtP1dhI7J4CHFuotQFq+gSdJTeooFda7duRPG8O9Fg/pzZGk7OJieGCxaFwMxgQ
 7RSbpr+F62hDOR5zaD7T9Aw+BwG4lBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-2wwHEEK8MluV0KvNdo3Asg-1; Thu, 04 Feb 2021 12:19:59 -0500
X-MC-Unique: 2wwHEEK8MluV0KvNdo3Asg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9380E801968;
 Thu,  4 Feb 2021 17:19:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 609D160CFA;
 Thu,  4 Feb 2021 17:19:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/33] migration: push Error **errp into
 qemu_savevm_state_complete_precopy_non_iterable()
Date: Thu,  4 Feb 2021 17:19:00 +0000
Message-Id: <20210204171907.901471-27-berrange@redhat.com>
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
 migration/savevm.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3b46fbba32..95e228a646 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1369,7 +1369,8 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy,
 static
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
-                                                    bool inactivate_disks)
+                                                    bool inactivate_disks,
+                                                    Error **errp)
 {
     g_autoptr(JSONWriter) vmdesc = NULL;
     int vmdesc_len;
@@ -1398,9 +1399,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
         ret = vmstate_save(f, se, vmdesc);
-        if (ret) {
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "failed to save device state '%s'", se->idstr);
             qemu_file_set_error(f, ret);
-            return ret;
+            return -1;
         }
         trace_savevm_section_end(se->idstr, se->section_id, 0);
         save_section_footer(f, se);
@@ -1413,10 +1416,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
          * bdrv_invalidate_cache_all() on the other end won't fail. */
         ret = bdrv_inactivate_all();
         if (ret) {
-            error_report("%s: bdrv_inactivate_all() failed (%d)",
-                         __func__, ret);
+            error_setg_errno(errp, -ret,
+                             "failed to deactivate disks when completing precopy save");
             qemu_file_set_error(f, ret);
-            return ret;
+            return -1;
         }
     }
     if (!in_postcopy) {
@@ -1440,7 +1443,6 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks)
 {
-    int ret;
     Error *local_err = NULL;
     bool in_postcopy = migration_in_postcopy();
 
@@ -1464,10 +1466,11 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
         goto flush;
     }
 
-    ret = qemu_savevm_state_complete_precopy_non_iterable(f, in_postcopy,
-                                                          inactivate_disks);
-    if (ret) {
-        return ret;
+    if (qemu_savevm_state_complete_precopy_non_iterable(f, in_postcopy,
+                                                        inactivate_disks,
+                                                        &local_err) < 0) {
+        error_report_err(local_err);
+        return -1;
     }
 
 flush:
-- 
2.29.2


