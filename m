Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2F230FB04
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:17:23 +0100 (CET)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jBy-0001CL-6H
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI2-0007HE-VK
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHr-0005JW-A5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGKgElaIhsvlpt+cRXr/iFaG/Eh4AjDHbnagqgiYya8=;
 b=JU6KLESi7Gq/EVUVwVnAkjAp/t3JGo4BRh2wtPpJquQ3DtUOgapD++PZkXfPgPj+aldpuX
 tXkPRpKhZalXkVEYBj2yD/OTMwtwNTZUNGR0A81fbpeH/yKEFQz7Vn0gA6HdrPDp+P1zwI
 d/lItdOpDHg/QgC6Kk9HjPngMP2yaBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-XtZCNDgVNMaC6Z2LblLfqw-1; Thu, 04 Feb 2021 12:19:18 -0500
X-MC-Unique: XtZCNDgVNMaC6Z2LblLfqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33DC9100C660;
 Thu,  4 Feb 2021 17:19:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDA460CCF;
 Thu,  4 Feb 2021 17:19:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/33] migration: push Error **errp into
 qemu_loadvm_state_header()
Date: Thu,  4 Feb 2021 17:18:36 +0000
Message-Id: <20210204171907.901471-3-berrange@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 migration/savevm.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index c8d93eee1e..870199b629 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2448,38 +2448,43 @@ qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
-static int qemu_loadvm_state_header(QEMUFile *f)
+static int qemu_loadvm_state_header(QEMUFile *f, Error **errp)
 {
     unsigned int v;
     int ret;
 
     v = qemu_get_be32(f);
     if (v != QEMU_VM_FILE_MAGIC) {
-        error_report("Not a migration stream");
-        return -EINVAL;
+        error_setg(errp, "Not a migration stream, magic %x != %x",
+                   v, QEMU_VM_FILE_MAGIC);
+        return -1;
     }
 
     v = qemu_get_be32(f);
     if (v == QEMU_VM_FILE_VERSION_COMPAT) {
-        error_report("SaveVM v2 format is obsolete and don't work anymore");
-        return -ENOTSUP;
+        error_setg(errp, "SaveVM v2 format is obsolete and don't work anymore");
+        return -1;
     }
     if (v != QEMU_VM_FILE_VERSION) {
-        error_report("Unsupported migration stream version");
-        return -ENOTSUP;
+        error_setg(errp, "Unsupported migration stream, version %x != %x",
+                   v, QEMU_VM_FILE_VERSION);
+        return -1;
     }
 
     if (migrate_get_current()->send_configuration) {
-        if (qemu_get_byte(f) != QEMU_VM_CONFIGURATION) {
-            error_report("Configuration section missing");
+        v = qemu_get_byte(f);
+        if (v != QEMU_VM_CONFIGURATION) {
+            error_setg(errp, "Configuration section missing, %x != %x",
+                       v, QEMU_VM_CONFIGURATION);
             qemu_loadvm_state_cleanup();
-            return -EINVAL;
+            return -1;
         }
         ret = vmstate_load_state(f, &vmstate_configuration, &savevm_state, 0);
 
         if (ret) {
+            error_setg(errp, "Error %d while loading VM state", ret);
             qemu_loadvm_state_cleanup();
-            return ret;
+            return -1;
         }
     }
     return 0;
@@ -2647,9 +2652,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
         return -1;
     }
 
-    ret = qemu_loadvm_state_header(f);
-    if (ret) {
-        error_setg(errp, "Error %d while loading VM state", ret);
+    if (qemu_loadvm_state_header(f, errp) < 0) {
         return -1;
     }
 
-- 
2.29.2


