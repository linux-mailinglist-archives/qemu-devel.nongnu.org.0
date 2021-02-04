Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849930FAFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:14:39 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7j9K-0007HH-2q
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iId-00082B-F6
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iIY-0005jA-Ou
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nU9gbdVdxbA/Vb8LzY88c++3UVYHBPlwcea4+Ts01r8=;
 b=RUTSiQownEvQINJ2H7WP4PNF+3dO/w6f0VUEm8ksfp4/hWjDDTatnfTsfmXtGavwsoR0+t
 Dc+yRUdLZ3+AQpG1Z/oxCac8saDymXiP0ToLHANH89YOqVG/H89TsSp+5/gAp+3j0y+o6K
 F84HsZS2KM7mkhTw5QA4IQYba8xNUfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-R4Vpfpi_NHSTbYxAPGiT7w-1; Thu, 04 Feb 2021 12:20:04 -0500
X-MC-Unique: R4Vpfpi_NHSTbYxAPGiT7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286B0107ACE4;
 Thu,  4 Feb 2021 17:20:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074D860CFA;
 Thu,  4 Feb 2021 17:20:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/33] migration: push Error **errp into
 qemu_savevm_live_state()
Date: Thu,  4 Feb 2021 17:19:03 +0000
Message-Id: <20210204171907.901471-30-berrange@redhat.com>
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
 migration/colo.c   | 4 +++-
 migration/savevm.c | 8 ++++----
 migration/savevm.h | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 4a050ac579..a76b72c984 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -470,7 +470,9 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
      * TODO: We may need a timeout mechanism to prevent COLO process
      * to be blocked here.
      */
-    qemu_savevm_live_state(s->to_dst_file);
+    if (qemu_savevm_live_state(s->to_dst_file, &local_err) < 0) {
+        goto out;
+    }
 
     qemu_fflush(fb);
 
diff --git a/migration/savevm.c b/migration/savevm.c
index deea8854db..884d12c6eb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1594,14 +1594,14 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return -1;
 }
 
-void qemu_savevm_live_state(QEMUFile *f)
+int qemu_savevm_live_state(QEMUFile *f, Error **errp)
 {
-    Error *local_err = NULL;
     /* save QEMU_VM_SECTION_END section */
-    if (qemu_savevm_state_complete_precopy(f, true, false, &local_err) < 0) {
-        error_report_err(local_err);
+    if (qemu_savevm_state_complete_precopy(f, true, false, errp) < 0) {
+        return -1;
     }
     qemu_put_byte(f, QEMU_VM_EOF);
+    return 0;
 }
 
 int qemu_save_device_state(QEMUFile *f)
diff --git a/migration/savevm.h b/migration/savevm.h
index 2d46e848cd..7abd75b668 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -59,7 +59,7 @@ void qemu_savevm_send_postcopy_ram_discard(QEMUFile *f, const char *name,
                                            uint64_t *start_list,
                                            uint64_t *length_list);
 void qemu_savevm_send_colo_enable(QEMUFile *f);
-void qemu_savevm_live_state(QEMUFile *f);
+int qemu_savevm_live_state(QEMUFile *f, Error **errp);
 int qemu_save_device_state(QEMUFile *f);
 
 int qemu_loadvm_state(QEMUFile *f, Error **errp);
-- 
2.29.2


