Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13040D855
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 13:20:07 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQpQz-0005gH-Qy
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 07:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQpOQ-0004xj-LH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQpOC-00040e-Ds
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 07:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631791031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q624qY3CwIwhv7XNDAHeyBngdxMwFVAmZRBxP5ODk0A=;
 b=E6iJuLav8jbMs3ZgtxcN0GD5TLG9ingSGdzVneZHmWU4xyFK1nrhUvmcJlzXSmiogcdrN6
 TGJRhbzKHQLEJEdmJ9gTIc66z/cICQlTuciTgWLJCzzLwjCcPYoOx6FHeRbjewSUo6GDZ2
 OvL8glS0adUIEOuxRS0Z1PCi34bQRMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-egTQJ1HuMWqwBbZmGGi5Fw-1; Thu, 16 Sep 2021 07:17:10 -0400
X-MC-Unique: egTQJ1HuMWqwBbZmGGi5Fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7237E1006AA2;
 Thu, 16 Sep 2021 11:17:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B48196F1;
 Thu, 16 Sep 2021 11:17:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C04C4113865F; Thu, 16 Sep 2021 13:17:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor: Tidy up find_device_state()
Date: Thu, 16 Sep 2021 13:17:07 +0200
Message-Id: <20210916111707.84999-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
extended find_device_state() to accept QOM paths in addition to qdev
IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
duplicates the check done for the qdev ID case earlier, except it sets
a *different* error: GenericError "ID is not a hotpluggable device"
when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
when passed a qdev ID.  Fortunately, the latter won't happen as long
as we add only devices to /machine/peripheral/.

Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
unplugged device in 'peripheral' container" rewrote the lookup by qdev
ID to use QOM instead of qdev_find_recursive(), so it can handle
buss-less devices.  It does so by constructing an absolute QOM path.
Works, but object_resolve_path_component() is easier.  Switching to it
also gets rid of the unclean duplication described above.

While there, avoid converting to TYPE_DEVICE twice, first to check
whether it's possible, and then for real.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/qdev-monitor.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index a304754ab9..d1ab3c25fb 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -831,16 +831,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
 static DeviceState *find_device_state(const char *id, Error **errp)
 {
     Object *obj;
+    DeviceState *dev;
 
     if (id[0] == '/') {
         obj = object_resolve_path(id, NULL);
     } else {
-        char *root_path = object_get_canonical_path(qdev_get_peripheral());
-        char *path = g_strdup_printf("%s/%s", root_path, id);
-
-        g_free(root_path);
-        obj = object_resolve_path_type(path, TYPE_DEVICE, NULL);
-        g_free(path);
+        obj = object_resolve_path_component(qdev_get_peripheral(), id);
     }
 
     if (!obj) {
@@ -849,12 +845,13 @@ static DeviceState *find_device_state(const char *id, Error **errp)
         return NULL;
     }
 
-    if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
+    dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
+    if (!dev) {
         error_setg(errp, "%s is not a hotpluggable device", id);
         return NULL;
     }
 
-    return DEVICE(obj);
+    return dev;
 }
 
 void qdev_unplug(DeviceState *dev, Error **errp)
-- 
2.31.1


