Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D4D416E90
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:09:34 +0200 (CEST)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThD2-0008Vh-JU
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAC-00052e-D0
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThA6-0003XZ-FG
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLOXu1775eDMROuvd0cnsapq2Z/Q6amD0L48n6m4Sdo=;
 b=ejYMP3luiSbzYPwBxT4oLzx7y9tivzsr5fsr/1ydXWHFnk0NijwgjlCn7pd9bmNKUo2l23
 q7RK20GK2hYOuFs9HskHQzerYAdKT+UTwU225fFwhp6yLr+LccLNT7jzEzklw9g2luB/vV
 GSYaesvCPwwpS7cfp/C2e1BUO3i0NlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-J4oSAEMqNHePpvQYFj9oaQ-1; Fri, 24 Sep 2021 05:06:23 -0400
X-MC-Unique: J4oSAEMqNHePpvQYFj9oaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E66F1006AA8;
 Fri, 24 Sep 2021 09:06:22 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C8E75D9DC;
 Fri, 24 Sep 2021 09:05:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] qdev: Add Error parameter to qdev_set_id()
Date: Fri, 24 Sep 2021 11:04:22 +0200
Message-Id: <20210924090427.9218-7-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_property_add_child() fails (with &error_abort) if an object with
the same name already exists. As long as QemuOpts is in use for -device
and device_add, it catches duplicate IDs before qdev_set_id() is even
called. However, for enabling non-QemuOpts code paths, we need to make
sure that the condition doesn't cause a crash, but fails gracefully.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/qdev.h      |  2 +-
 hw/xen/xen-legacy-backend.c |  3 ++-
 softmmu/qdev-monitor.c      | 16 ++++++++++------
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 389287eb44..7961308c75 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -9,6 +9,6 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-void qdev_set_id(DeviceState *dev, char *id);
+void qdev_set_id(DeviceState *dev, char *id, Error **errp);
 
 #endif
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index dd8ae1452d..17aca85ddc 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev = g_malloc0(ops->size);
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
-    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
+    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
+                &error_abort);
     qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 1207e57a46..c2af906df0 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -593,26 +593,27 @@ static BusState *qbus_find(const char *path, Error **errp)
 }
 
 /* Takes ownership of @id, will be freed when deleting the device */
-void qdev_set_id(DeviceState *dev, char *id)
+void qdev_set_id(DeviceState *dev, char *id, Error **errp)
 {
     if (id) {
         dev->id = id;
     }
 
     if (dev->id) {
-        object_property_add_child(qdev_get_peripheral(), dev->id,
-                                  OBJECT(dev));
+        object_property_try_add_child(qdev_get_peripheral(), dev->id,
+                                      OBJECT(dev), errp);
     } else {
         static int anon_count;
         gchar *name = g_strdup_printf("device[%d]", anon_count++);
-        object_property_add_child(qdev_get_peripheral_anon(), name,
-                                  OBJECT(dev));
+        object_property_try_add_child(qdev_get_peripheral_anon(), name,
+                                      OBJECT(dev), errp);
         g_free(name);
     }
 }
 
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
 {
+    ERRP_GUARD();
     DeviceClass *dc;
     const char *driver, *path;
     DeviceState *dev = NULL;
@@ -691,7 +692,10 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
+    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp);
+    if (*errp) {
+        goto err_del_dev;
+    }
 
     /* set properties */
     if (qemu_opt_foreach(opts, set_property, dev, errp)) {
-- 
2.31.1


