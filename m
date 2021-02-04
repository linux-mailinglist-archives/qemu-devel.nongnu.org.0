Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2430FA0F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:46:46 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iiL-00017u-SN
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iI3-0007Ji-Mz
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHs-0005K1-Gc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV60K5iSYGZO/NHqiWupOSBXYV3hOJzXZFsSGX6KjIg=;
 b=cvZkq2K3G8f3jM1Ea3uE6kp0u8oZCxYKzYYPgp7x3qvMYM/viJuwqhkFEO/JAec/cwZjeE
 tQ/0rRkFwyMxtkirrh1+DyN0aNGeJpP6GU8htPO3NtP7+DWC9VnxqLUgcYrKQAqaeQr5pV
 gzpVl7A+5k9k9naV7bv05RAxbxYMbko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-25ZctDZ5PWmPjM_Psku5JA-1; Thu, 04 Feb 2021 12:19:21 -0500
X-MC-Unique: 25ZctDZ5PWmPjM_Psku5JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F33A1936B65;
 Thu,  4 Feb 2021 17:19:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F072360937;
 Thu,  4 Feb 2021 17:19:18 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/33] migration: push Error **errp into
 qemu_load_device_state()
Date: Thu,  4 Feb 2021 17:18:38 +0000
Message-Id: <20210204171907.901471-5-berrange@redhat.com>
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
 migration/colo.c   | 3 +--
 migration/savevm.c | 4 ++--
 migration/savevm.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index de27662cab..e344b7cf32 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -748,9 +748,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
     qemu_mutex_lock_iothread();
     vmstate_loading = true;
     colo_flush_ram_cache();
-    ret = qemu_load_device_state(fb);
+    ret = qemu_load_device_state(fb, errp);
     if (ret < 0) {
-        error_setg(errp, "COLO: load device state failed");
         vmstate_loading = false;
         qemu_mutex_unlock_iothread();
         return;
diff --git a/migration/savevm.c b/migration/savevm.c
index f4ed14a230..dd41292d4e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2726,7 +2726,7 @@ int qemu_loadvm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
-int qemu_load_device_state(QEMUFile *f)
+int qemu_load_device_state(QEMUFile *f, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     int ret;
@@ -2734,7 +2734,7 @@ int qemu_load_device_state(QEMUFile *f)
     /* Load QEMU_VM_SECTION_FULL section */
     ret = qemu_loadvm_state_main(f, mis);
     if (ret < 0) {
-        error_report("Failed to load device state: %d", ret);
+        error_setg(errp, "Failed to load device state: %d", ret);
         return ret;
     }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index 1069e2dd4f..c727bc103e 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -63,6 +63,6 @@ int qemu_save_device_state(QEMUFile *f);
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
 void qemu_loadvm_state_cleanup(void);
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
-int qemu_load_device_state(QEMUFile *f);
+int qemu_load_device_state(QEMUFile *f, Error **errp);
 
 #endif
-- 
2.29.2


