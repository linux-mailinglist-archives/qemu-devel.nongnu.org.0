Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3013F2E11
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:27:58 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5Uz-0001gF-A1
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5OO-0005Xn-I6
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5OM-00055M-Nw
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5CskrLd77eeKr4+xXrKL0C9POYBhZR7shpz6e+wIjQ=;
 b=D1g1/pqqzisOHQyGRmMSfmHOtN4NWWF0es+6e9Pp8JQ/y0xKDljiwXTbWKdtmCL1vsTBDr
 zVIp07iJ5ujOV3atgoHYUc+N+F/PlZXmLirdQAALSSlhi6+7128uX6aq2FAVrjTb5Zie/2
 C22Uxt0bYqp/umzvKPUgN8TtO3Gw+hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-IB8vn10OM1-Fvc1stfATRg-1; Fri, 20 Aug 2021 10:21:04 -0400
X-MC-Unique: IB8vn10OM1-Fvc1stfATRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0CA9107ACF5;
 Fri, 20 Aug 2021 14:21:03 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80D786EF4F;
 Fri, 20 Aug 2021 14:21:01 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 8/8] failover: qemu-opts: manage hidden device list
Date: Fri, 20 Aug 2021 16:20:02 +0200
Message-Id: <20210820142002.152994-9-lvivier@redhat.com>
In-Reply-To: <20210820142002.152994-1-lvivier@redhat.com>
References: <20210820142002.152994-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

failover relies on the command line parameters to store and detect
failover devices because while the device is hidden it doesn't appears
in qdev objects and so we don't have the list anywhere else.

But this doesn't work if the the device is hotplugged because it is
not added to the qemu opts list (and the opts list memory is released
after the qdev_device_add() if the device object is not created as it is
the case when it is hidden).

It seems cleaner to manage our own list of hidden devices.

To do that, this patch adds some qemu_opts functions to store the opts
list of the device when it is hidden. This list will be used to actually
plug the device when it will be enabled for the guest.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/qemu/option.h |  4 +++
 hw/core/qdev.c        |  1 +
 hw/net/virtio-net.c   |  5 ++-
 hw/pci/pci.c          |  4 +--
 util/qemu-option.c    | 82 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 306bf0757509..d44550f02542 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -150,4 +150,8 @@ QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 void keyval_merge(QDict *old, const QDict *new, Error **errp);
 
+int qemu_opts_hidden_device_foreach(qemu_opts_loopfunc func,
+                                    void *opaque, Error **errp);
+QemuOpts *qemu_opts_hidden_device_find(const char *id);
+void qemu_opts_store_hidden_device(QemuOpts *opts);
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 13f4c1e696bf..f402309a3af9 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -218,6 +218,7 @@ bool qdev_should_hide_device(QemuOpts *opts, Error **errp)
     QTAILQ_FOREACH(listener, &device_listeners, link) {
         if (listener->hide_device) {
             if (listener->hide_device(listener, opts, errp)) {
+                qemu_opts_store_hidden_device(opts);
                 return true;
             }
         }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 35e3d024f8d6..dc971bc9885b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -831,8 +831,7 @@ static char *failover_find_primary_device_id(VirtIONet *n)
     FailoverId fid;
 
     fid.n = n;
-    if (!qemu_opts_foreach(qemu_find_opts("device"),
-                           failover_set_primary, &fid, &err)) {
+    if (!qemu_opts_hidden_device_foreach(failover_set_primary, &fid, &err)) {
         return NULL;
     }
     return fid.id;
@@ -874,7 +873,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
                           " failover_pair_id=%s\n", n->netclient_name);
         return;
     }
-    opts = qemu_opts_find(qemu_find_opts("device"), id);
+    opts = qemu_opts_hidden_device_find(id);
     g_assert(opts); /* cannot be NULL because id was found using opts list */
     dev = qdev_device_add(opts, &err);
     if (err) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 31ab80b81b6b..d222623a68b2 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -142,8 +142,8 @@ static int bus_post_load(void *opaque, int version_id)
     Error *err = NULL;
     PCIBus *bus = opaque;
 
-    if (qemu_opts_foreach(qemu_find_opts("device"),
-                          pci_dev_replug_on_migration, bus->qbus.name, &err)) {
+    if (qemu_opts_hidden_device_foreach(pci_dev_replug_on_migration,
+                                        bus->qbus.name, &err)) {
         error_report_err(err);
         return -EINVAL;
     }
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 61cb4a97bdb6..90bdec030624 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -37,6 +37,8 @@
 #include "qemu/id.h"
 #include "qemu/help_option.h"
 
+static QTAILQ_HEAD(, QemuOpts) hidden_devices =
+                               QTAILQ_HEAD_INITIALIZER(hidden_devices);
 /*
  * Extracts the name of an option from the parameter string (@p points at the
  * first byte of the option name)
@@ -1224,3 +1226,83 @@ QemuOptsList *qemu_opts_append(QemuOptsList *dst,
 
     return dst;
 }
+
+/* create a copy of an opts */
+static QemuOpts *qemu_opts_duplicate(QemuOpts *opts)
+{
+    QemuOpts *new;
+    QemuOpt *opt;
+
+    new = g_malloc0(sizeof(*new));
+    new->id = g_strdup(opts->id);
+    new->list = opts->list;
+
+    QTAILQ_INIT(&new->head);
+
+    QTAILQ_FOREACH_REVERSE(opt, &opts->head, next) {
+        QemuOpt *new_opt = g_malloc0(sizeof(*new_opt));
+
+        new_opt->name = g_strdup(opt->name);
+        new_opt->str = g_strdup(opt->str);
+        new_opt->opts = new;
+        QTAILQ_INSERT_TAIL(&new->head, new_opt, next);
+    }
+
+    QTAILQ_INSERT_TAIL(&new->list->head, new, next);
+
+    return new;
+}
+
+/*
+ * For each member of the hidded device list,
+ * call @func(@opaque, name, value, @errp).
+ * @func() may store an Error through @errp, but must return non-zero then.
+ * When @func() returns non-zero, break the loop and return that value.
+ * Return zero when the loop completes.
+ */
+int qemu_opts_hidden_device_foreach(qemu_opts_loopfunc func,
+                                    void *opaque, Error **errp)
+{
+    QemuOpts *hidden;
+    int rc = 0;
+
+    QTAILQ_FOREACH(hidden, &hidden_devices, next) {
+        rc = func(opaque, hidden, errp);
+        if (rc) {
+            break;
+        }
+    }
+    return rc;
+}
+
+/* scan the list of hidden devices to find opts for the one with id @id */
+QemuOpts *qemu_opts_hidden_device_find(const char *id)
+{
+    QemuOpts *hidden;
+
+    QTAILQ_FOREACH(hidden, &hidden_devices, next) {
+        if (g_strcmp0(id, hidden->id) == 0) {
+            return hidden;
+        }
+    }
+
+    return NULL;
+}
+
+/* add the @opts to the list of hidden devices */
+void qemu_opts_store_hidden_device(QemuOpts *opts)
+{
+    QemuOpts *copy;
+
+    if (qemu_opts_hidden_device_find(opts->id)) {
+        return;
+    }
+
+    /*
+     * we need to duplicate opts because qmp_device_add() calls
+     * qemu_opts_del(opts) if the device is not added,
+     * and this is what happens when it is hidden
+     */
+    copy = qemu_opts_duplicate(opts);
+    QTAILQ_INSERT_TAIL(&hidden_devices, copy, next);
+}
-- 
2.31.1


