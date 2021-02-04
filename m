Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68EE30F370
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:52:05 +0100 (CET)
Received: from localhost ([::1]:43406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7e79-0003O8-Pv
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7e4f-0001fz-9Z
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7e4d-0001rz-MB
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612442967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynMJTfwaNSR3HsJ9IrEmQzWVa4G06sXcl6vMY6ARawc=;
 b=cK/buD5KYMYndvA3DlXpFuOrGNCfK06BY5fSgn5fFp4wHPyu908ksBSLuANQTRjNpr1ibe
 PkNX3h7ssLDYZKBvLbZE2fU2EHJ5TJ0GpxNb7mEuvM/kcTFDTq10DrrfgCF1X8IWpCsjII
 tEaoYZqza0yaH1Z9jaOGOgXIkqawpvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-fnlz_cOJMlaqUih3rNg6zw-1; Thu, 04 Feb 2021 07:49:25 -0500
X-MC-Unique: fnlz_cOJMlaqUih3rNg6zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8353E100CCC1;
 Thu,  4 Feb 2021 12:49:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-169.ams2.redhat.com
 [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694DC5B4AE;
 Thu,  4 Feb 2021 12:49:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 09/12] migration: introduce a delete_snapshot wrapper
Date: Thu,  4 Feb 2021 12:48:31 +0000
Message-Id: <20210204124834.774401-10-berrange@redhat.com>
In-Reply-To: <20210204124834.774401-1-berrange@redhat.com>
References: <20210204124834.774401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make snapshot deletion consistent with the snapshot save
and load commands by using a wrapper around the blockdev
layer. The main difference is that we get upfront validation
of the passed in device list (if any).

Reviewed-by: Eric Blake <eblake@redhat.com>
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
index fde680efc6..48186918a3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3036,6 +3036,20 @@ err_drain:
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
index ad8bf23577..f8dc3861a6 100644
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
2.29.2


