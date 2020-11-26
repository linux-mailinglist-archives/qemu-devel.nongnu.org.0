Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE2C2C5AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:39:48 +0100 (CET)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLFD-0005e1-7X
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBv-00031f-Kb
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:36:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBr-0006bg-3y
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXewhcNCgGltfNmr3Bi7b1DKj/AXnoyP9Uy8hoX2KRI=;
 b=epLfNGkS+BZxrNdNm7WZXI+Om4CFnCd5ymYFYVWgaVY+fiIKUWNi4zz9yKFGYUU1DyZqpB
 T8iZbrEkMUuK3IB/BUracO314hXzN6UVN6YzhAeAQoPrtDmK7RnsVGz8tOImI4GyzIMOJ8
 dXss7vQ7wtKo4do/VyMOgOVK096JH24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-s33KoSDdPxui7lg3o-VOlA-1; Thu, 26 Nov 2020 12:36:12 -0500
X-MC-Unique: s33KoSDdPxui7lg3o-VOlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91886190A7B7;
 Thu, 26 Nov 2020 17:36:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C091F04A;
 Thu, 26 Nov 2020 17:36:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/11] migration: introduce a delete_snapshot wrapper
Date: Thu, 26 Nov 2020 17:35:19 +0000
Message-Id: <20201126173521.137580-10-berrange@redhat.com>
In-Reply-To: <20201126173521.137580-1-berrange@redhat.com>
References: <20201126173521.137580-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make snapshot deletion consistent with the snapshot save
and load commands by using a wrapper around the blockdev
layer. The main difference is that we get upfront validation
of the passed in device list (if any).

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/migration/snapshot.h | 13 +++++++++++++
 migration/savevm.c           | 14 ++++++++++++++
 monitor/hmp-cmds.c           |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index 3bdbef435b..e72083b117 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -48,4 +48,17 @@ bool load_snapshot(const char *name,
                    bool has_devices, strList *devices,
                    Error **errp);
 
+/**
+ * delete_snapshot: Delete a snapshot.
+ * @name: path to snapshot
+ * @has_devices: whether to use explicit device list
+ * @devices: explicit device list to snapshot
+ * @errp: pointer to error object
+ * On success, return %true.
+ * On failure, store an error through @errp and return %false.
+ */
+bool delete_snapshot(const char *name,
+                    bool has_devices, strList *devices,
+                    Error **errp);
+
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 7c1c11e83c..4c620cdc7c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3033,6 +3033,20 @@ err_drain:
     return false;
 }
 
+bool delete_snapshot(const char *name, bool has_devices,
+                     strList *devices, Error **errp)
+{
+    if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
+        return false;
+    }
+
+    if (bdrv_all_delete_snapshot(name, has_devices, devices, errp) < 0) {
+        return false;
+    }
+
+    return true;
+}
+
 void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
 {
     qemu_ram_set_idstr(mr->ram_block,
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fb5dc7a4a7..2432a4abb6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1150,7 +1150,7 @@ void hmp_delvm(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
     const char *name = qdict_get_str(qdict, "name");
 
-    bdrv_all_delete_snapshot(name, false, NULL, &err);
+    delete_snapshot(name, false, NULL, &err);
     hmp_handle_error(mon, err);
 }
 
-- 
2.28.0


