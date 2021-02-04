Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DAC30FB48
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:24:39 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jIy-0006Wo-Kc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIj-00084d-0j
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIZ-0005jG-Hm
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gp0dO8OmqkAUGx1QgpVFAjfLM1UQ/3yCU2LGWZbxZEI=;
 b=P9Fr4zcLhA2QD7nP+rVV02QY8IzJ4G6UyQjElqAGuS3I8N+d5/bEkWJUkDmvCxSSNOzs+N
 ylKYkGjw4g9xN5uTT89g5Gegf8/DBWpGKw0EqC7fDokFX38DGSuHP95ShDVi+UWHQbiYZd
 J4039jpIXyADZK6LnBPRz3jhhceVTIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-KHjOfA-yMTGSDjYbDg4Y0w-1; Thu, 04 Feb 2021 12:20:02 -0500
X-MC-Unique: KHjOfA-yMTGSDjYbDg4Y0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF495107ACC7;
 Thu,  4 Feb 2021 17:20:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8135860937;
 Thu,  4 Feb 2021 17:20:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/33] migration: push Error **errp into
 qemu_savevm_send_packaged()
Date: Thu,  4 Feb 2021 17:19:02 +0000
Message-Id: <20210204171907.901471-29-berrange@redhat.com>
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
 migration/migration.c | 4 +++-
 migration/savevm.c    | 9 +++++----
 migration/savevm.h    | 3 ++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2ccb1b66b5..984276d066 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2927,7 +2927,9 @@ static int postcopy_start(MigrationState *ms)
     restart_block = false;
 
     /* Now send that blob */
-    if (qemu_savevm_send_packaged(ms->to_dst_file, bioc->data, bioc->usage)) {
+    if (qemu_savevm_send_packaged(ms->to_dst_file, bioc->data, bioc->usage,
+                                  &local_err)) {
+        error_report_err(local_err);
         goto fail_closefb;
     }
     qemu_fclose(fb);
diff --git a/migration/savevm.c b/migration/savevm.c
index d6c36e6b6b..deea8854db 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1002,15 +1002,16 @@ void qemu_savevm_send_open_return_path(QEMUFile *f)
  *
  * Returns:
  *    0 on success
- *    -ve on error
+ *    -1 on error
  */
-int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len)
+int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len,
+                              Error **errp)
 {
     uint32_t tmp;
 
     if (len > MAX_VM_CMD_PACKAGED_SIZE) {
-        error_report("%s: Unreasonably large packaged state: %zu",
-                     __func__, len);
+        error_setg(errp, "unreasonably large packaged state: %zu > %d",
+                   len, MAX_VM_CMD_PACKAGED_SIZE);
         return -1;
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index e3120a4fb0..2d46e848cd 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -46,7 +46,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
                                uint64_t *res_postcopy_only);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
-int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
+int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len,
+                              Error **errp);
 void qemu_savevm_send_postcopy_advise(QEMUFile *f);
 void qemu_savevm_send_postcopy_listen(QEMUFile *f);
 void qemu_savevm_send_postcopy_run(QEMUFile *f);
-- 
2.29.2


