Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A907230FB46
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:24:25 +0100 (CET)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jIm-0006AM-Nn
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIQ-0007yF-UO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIJ-0005a1-R8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03rQyzYNbnbeQL60CxRXjxb69PwBp7A6niFqMdrWlDk=;
 b=H7bKFbfA57gKmIGS3yPL6IQqZ4IeBjU25oEc0ezBOL9STB64Cp245yWDPaAo44qPD8CXgS
 xlngUEN7tTGPHX5C451RmEkYjdBOrxKdp2/CNXkyxoA9/6sdAbyTmOpEePfWAw//iFnb+g
 gCCXaQGNDGruzZB912hhoKYXoCNumJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-2lwIi4wzOGKw-pk_VMtciw-1; Thu, 04 Feb 2021 12:19:49 -0500
X-MC-Unique: 2lwIi4wzOGKw-pk_VMtciw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C5F835E33;
 Thu,  4 Feb 2021 17:19:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2890260CFA;
 Thu,  4 Feb 2021 17:19:47 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/33] migration: push Error **errp into check_section_footer()
Date: Thu,  4 Feb 2021 17:18:53 +0000
Message-Id: <20210204171907.901471-20-berrange@redhat.com>
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
 migration/savevm.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index ace76e32f7..289a3d55bb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2320,9 +2320,9 @@ static int loadvm_process_command(QEMUFile *f, Error **errp)
  * Read a footer off the wire and check that it matches the expected section
  *
  * Returns: true if the footer was good
- *          false if there is a problem (and calls error_report to say why)
+ *          false if there is a problem
  */
-static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
+static bool check_section_footer(QEMUFile *f, SaveStateEntry *se, Error **errp)
 {
     int ret;
     uint8_t read_mark;
@@ -2337,21 +2337,21 @@ static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
 
     ret = qemu_file_get_error(f);
     if (ret) {
-        error_report("%s: Read section footer failed: %d",
-                     __func__, ret);
+        error_setg(errp, "read section footer failed: %d",
+                   ret);
         return false;
     }
 
     if (read_mark != QEMU_VM_SECTION_FOOTER) {
-        error_report("Missing section footer for %s", se->idstr);
+        error_setg(errp, "Missing section footer for %s", se->idstr);
         return false;
     }
 
     read_section_id = qemu_get_be32(f);
     if (read_section_id != se->load_section_id) {
-        error_report("Mismatched section id in footer for %s -"
-                     " read 0x%x expected 0x%x",
-                     se->idstr, read_section_id, se->load_section_id);
+        error_setg(errp, "Mismatched section id in footer for %s -"
+                   " read 0x%x expected 0x%x",
+                   se->idstr, read_section_id, se->load_section_id);
         return false;
     }
 
@@ -2418,8 +2418,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis,
                    " device '%s'", instance_id, idstr);
         return -1;
     }
-    if (!check_section_footer(f, se)) {
-        error_setg(errp, "failed check for device state section footer");
+    if (!check_section_footer(f, se, errp)) {
         return -1;
     }
 
@@ -2460,8 +2459,7 @@ qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis,
                    section_id, se->idstr);
         return -1;
     }
-    if (!check_section_footer(f, se)) {
-        error_setg(errp, "failed check for device state section footer");
+    if (!check_section_footer(f, se, errp)) {
         return -1;
     }
 
-- 
2.29.2


