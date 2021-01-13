Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240502F47B9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:42:03 +0100 (CET)
Received: from localhost ([::1]:47608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcfC-0000Sn-5m
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUo-0005pu-SF
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcUk-0002xn-Ml
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610530274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dogi5DWyEYa+fVoL1HzL7xVRIrOzAf9cdLWePyL4XsY=;
 b=g6QCn4eRgcJWK6VE7e6u3MOII4KlAT0NBdH0rwfz8jYHgB5VCXTtjNk4jIkm2a2SPOoZMi
 jm+xSdyPUnHOkyEAjC1A52Iha+Rjk4Ywi3f2KHDKsGWtA0+WCP1hI0q0CNhnwD4ASKq4Sh
 pj+kvHOtENvGwI4mkcwcnflUKH8lKdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-FsN-gXJIOFWlwb418jX1Lw-1; Wed, 13 Jan 2021 04:31:11 -0500
X-MC-Unique: FsN-gXJIOFWlwb418jX1Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C53DF8B2;
 Wed, 13 Jan 2021 09:31:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F4660BF1;
 Wed, 13 Jan 2021 09:31:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8384811385EE; Wed, 13 Jan 2021 10:31:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] Introduce yank feature
Date: Wed, 13 Jan 2021 10:30:55 +0100
Message-Id: <20210113093101.550964-2-armbru@redhat.com>
In-Reply-To: <20210113093101.550964-1-armbru@redhat.com>
References: <20210113093101.550964-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: peter.maydell@linaro.org, lukasstraub2@web.de,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

The yank feature allows to recover from hanging qemu by "yanking"
at various parts. Other qemu systems can register themselves and
multiple yank functions. Then all yank functions for selected
instances can be called by the 'yank' out-of-band qmp command.
Available instances can be queried by a 'query-yank' oob command.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <69934ceacfd33a7dfe53db145ecc630ad39ee47c.1609167865.git.lukasstraub2@web.de>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qapi-schema.json |   1 +
 qapi/yank.json        | 119 ++++++++++++++++++++++++
 include/qemu/yank.h   |  97 ++++++++++++++++++++
 util/yank.c           | 207 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS           |   7 ++
 qapi/meson.build      |   1 +
 util/meson.build      |   1 +
 7 files changed, 433 insertions(+)
 create mode 100644 qapi/yank.json
 create mode 100644 include/qemu/yank.h
 create mode 100644 util/yank.c

diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 0b444b76d2..3441c9a9ae 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -86,6 +86,7 @@
 { 'include': 'machine.json' }
 { 'include': 'machine-target.json' }
 { 'include': 'replay.json' }
+{ 'include': 'yank.json' }
 { 'include': 'misc.json' }
 { 'include': 'misc-target.json' }
 { 'include': 'audio.json' }
diff --git a/qapi/yank.json b/qapi/yank.json
new file mode 100644
index 0000000000..167a775594
--- /dev/null
+++ b/qapi/yank.json
@@ -0,0 +1,119 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Yank feature
+##
+
+##
+# @YankInstanceType:
+#
+# An enumeration of yank instance types. See @YankInstance for more
+# information.
+#
+# Since: 6.0
+##
+{ 'enum': 'YankInstanceType',
+  'data': [ 'block-node', 'chardev', 'migration' ] }
+
+##
+# @YankInstanceBlockNode:
+#
+# Specifies which block graph node to yank. See @YankInstance for more
+# information.
+#
+# @node-name: the name of the block graph node
+#
+# Since: 6.0
+##
+{ 'struct': 'YankInstanceBlockNode',
+  'data': { 'node-name': 'str' } }
+
+##
+# @YankInstanceChardev:
+#
+# Specifies which character device to yank. See @YankInstance for more
+# information.
+#
+# @id: the chardev's ID
+#
+# Since: 6.0
+##
+{ 'struct': 'YankInstanceChardev',
+  'data': { 'id': 'str' } }
+
+##
+# @YankInstance:
+#
+# A yank instance can be yanked with the @yank qmp command to recover from a
+# hanging QEMU.
+#
+# Currently implemented yank instances:
+#  - nbd block device:
+#    Yanking it will shut down the connection to the nbd server without
+#    attempting to reconnect.
+#  - socket chardev:
+#    Yanking it will shut down the connected socket.
+#  - migration:
+#    Yanking it will shut down all migration connections. Unlike
+#    @migrate_cancel, it will not notify the migration process, so migration
+#    will go into @failed state, instead of @cancelled state. @yank should be
+#    used to recover from hangs.
+#
+# Since: 6.0
+##
+{ 'union': 'YankInstance',
+  'base': { 'type': 'YankInstanceType' },
+  'discriminator': 'type',
+  'data': {
+      'block-node': 'YankInstanceBlockNode',
+      'chardev': 'YankInstanceChardev' } }
+
+##
+# @yank:
+#
+# Try to recover from hanging QEMU by yanking the specified instances. See
+# @YankInstance for more information.
+#
+# Takes a list of @YankInstance as argument.
+#
+# Returns: - Nothing on success
+#          - @DeviceNotFound error, if any of the YankInstances doesn't exist
+#
+# Example:
+#
+# -> { "execute": "yank",
+#      "arguments": {
+#          "instances": [
+#               { "type": "block-node",
+#                 "node-name": "nbd0" }
+#          ] } }
+# <- { "return": {} }
+#
+# Since: 6.0
+##
+{ 'command': 'yank',
+  'data': { 'instances': ['YankInstance'] },
+  'allow-oob': true }
+
+##
+# @query-yank:
+#
+# Query yank instances. See @YankInstance for more information.
+#
+# Returns: list of @YankInstance
+#
+# Example:
+#
+# -> { "execute": "query-yank" }
+# <- { "return": [
+#          { "type": "block-node",
+#            "node-name": "nbd0" }
+#      ] }
+#
+# Since: 6.0
+##
+{ 'command': 'query-yank',
+  'returns': ['YankInstance'],
+  'allow-oob': true }
diff --git a/include/qemu/yank.h b/include/qemu/yank.h
new file mode 100644
index 0000000000..5b93c70cbf
--- /dev/null
+++ b/include/qemu/yank.h
@@ -0,0 +1,97 @@
+/*
+ * QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef YANK_H
+#define YANK_H
+
+#include "qapi/qapi-types-yank.h"
+
+typedef void (YankFn)(void *opaque);
+
+/**
+ * yank_register_instance: Register a new instance.
+ *
+ * This registers a new instance for yanking. Must be called before any yank
+ * function is registered for this instance.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @errp: Error object.
+ *
+ * Returns true on success or false if an error occured.
+ */
+bool yank_register_instance(const YankInstance *instance, Error **errp);
+
+/**
+ * yank_unregister_instance: Unregister a instance.
+ *
+ * This unregisters a instance. Must be called only after every yank function
+ * of the instance has been unregistered.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ */
+void yank_unregister_instance(const YankInstance *instance);
+
+/**
+ * yank_register_function: Register a yank function
+ *
+ * This registers a yank function. All limitations of qmp oob commands apply
+ * to the yank function as well. See docs/devel/qapi-code-gen.txt under
+ * "An OOB-capable command handler must satisfy the following conditions".
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @func: The yank function.
+ * @opaque: Will be passed to the yank function.
+ */
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque);
+
+/**
+ * yank_unregister_function: Unregister a yank function
+ *
+ * This unregisters a yank function.
+ *
+ * This function is thread-safe.
+ *
+ * @instance: The instance.
+ * @func: func that was passed to yank_register_function.
+ * @opaque: opaque that was passed to yank_register_function.
+ */
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque);
+
+/**
+ * yank_generic_iochannel: Generic yank function for iochannel
+ *
+ * This is a generic yank function which will call qio_channel_shutdown on the
+ * provided QIOChannel.
+ *
+ * @opaque: QIOChannel to shutdown
+ */
+void yank_generic_iochannel(void *opaque);
+
+#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
+        .type = YANK_INSTANCE_TYPE_BLOCK_NODE, \
+        .u.block_node.node_name = (the_node_name) })
+
+#define CHARDEV_YANK_INSTANCE(the_id) (&(YankInstance) { \
+        .type = YANK_INSTANCE_TYPE_CHARDEV, \
+        .u.chardev.id = (the_id) })
+
+#define MIGRATION_YANK_INSTANCE (&(YankInstance) { \
+        .type = YANK_INSTANCE_TYPE_MIGRATION })
+
+#endif
diff --git a/util/yank.c b/util/yank.c
new file mode 100644
index 0000000000..fc08f65209
--- /dev/null
+++ b/util/yank.c
@@ -0,0 +1,207 @@
+/*
+ * QEMU yank feature
+ *
+ * Copyright (c) Lukas Straub <lukasstraub2@web.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/thread.h"
+#include "qemu/queue.h"
+#include "qemu/lockable.h"
+#include "qapi/qapi-commands-yank.h"
+#include "qapi/qapi-visit-yank.h"
+#include "qapi/clone-visitor.h"
+#include "io/channel.h"
+#include "qemu/yank.h"
+
+struct YankFuncAndParam {
+    YankFn *func;
+    void *opaque;
+    QLIST_ENTRY(YankFuncAndParam) next;
+};
+
+struct YankInstanceEntry {
+    YankInstance *instance;
+    QLIST_HEAD(, YankFuncAndParam) yankfns;
+    QLIST_ENTRY(YankInstanceEntry) next;
+};
+
+typedef struct YankFuncAndParam YankFuncAndParam;
+typedef struct YankInstanceEntry YankInstanceEntry;
+
+/*
+ * This lock protects the yank_instance_list below. Because it's taken by
+ * OOB-capable commands, it must be "fast", i.e. it may only be held for a
+ * bounded, short time. See docs/devel/qapi-code-gen.txt for additional
+ * information.
+ */
+static QemuMutex yank_lock;
+
+static QLIST_HEAD(, YankInstanceEntry) yank_instance_list
+    = QLIST_HEAD_INITIALIZER(yank_instance_list);
+
+static bool yank_instance_equal(const YankInstance *a, const YankInstance *b)
+{
+    if (a->type != b->type) {
+        return false;
+    }
+
+    switch (a->type) {
+    case YANK_INSTANCE_TYPE_BLOCK_NODE:
+        return g_str_equal(a->u.block_node.node_name,
+                           b->u.block_node.node_name);
+
+    case YANK_INSTANCE_TYPE_CHARDEV:
+        return g_str_equal(a->u.chardev.id, b->u.chardev.id);
+
+    case YANK_INSTANCE_TYPE_MIGRATION:
+        return true;
+
+    default:
+        abort();
+    }
+}
+
+static YankInstanceEntry *yank_find_entry(const YankInstance *instance)
+{
+    YankInstanceEntry *entry;
+
+    QLIST_FOREACH(entry, &yank_instance_list, next) {
+        if (yank_instance_equal(entry->instance, instance)) {
+            return entry;
+        }
+    }
+    return NULL;
+}
+
+bool yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    YankInstanceEntry *entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+
+    if (yank_find_entry(instance)) {
+        error_setg(errp, "duplicate yank instance");
+        return false;
+    }
+
+    entry = g_new0(YankInstanceEntry, 1);
+    entry->instance = QAPI_CLONE(YankInstance, instance);
+    QLIST_INIT(&entry->yankfns);
+    QLIST_INSERT_HEAD(&yank_instance_list, entry, next);
+
+    return true;
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+    YankInstanceEntry *entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry = yank_find_entry(instance);
+    assert(entry);
+
+    assert(QLIST_EMPTY(&entry->yankfns));
+    QLIST_REMOVE(entry, next);
+    qapi_free_YankInstance(entry->instance);
+    g_free(entry);
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry = yank_find_entry(instance);
+    assert(entry);
+
+    func_entry = g_new0(YankFuncAndParam, 1);
+    func_entry->func = func;
+    func_entry->opaque = opaque;
+
+    QLIST_INSERT_HEAD(&entry->yankfns, func_entry, next);
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    entry = yank_find_entry(instance);
+    assert(entry);
+
+    QLIST_FOREACH(func_entry, &entry->yankfns, next) {
+        if (func_entry->func == func && func_entry->opaque == opaque) {
+            QLIST_REMOVE(func_entry, next);
+            g_free(func_entry);
+            return;
+        }
+    }
+
+    abort();
+}
+
+void yank_generic_iochannel(void *opaque)
+{
+    QIOChannel *ioc = QIO_CHANNEL(opaque);
+
+    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+}
+
+void qmp_yank(YankInstanceList *instances,
+              Error **errp)
+{
+    YankInstanceList *tail;
+    YankInstanceEntry *entry;
+    YankFuncAndParam *func_entry;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    for (tail = instances; tail; tail = tail->next) {
+        entry = yank_find_entry(tail->value);
+        if (!entry) {
+            error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Instance not found");
+            return;
+        }
+    }
+    for (tail = instances; tail; tail = tail->next) {
+        entry = yank_find_entry(tail->value);
+        assert(entry);
+        QLIST_FOREACH(func_entry, &entry->yankfns, next) {
+            func_entry->func(func_entry->opaque);
+        }
+    }
+}
+
+YankInstanceList *qmp_query_yank(Error **errp)
+{
+    YankInstanceEntry *entry;
+    YankInstanceList *ret;
+
+    ret = NULL;
+
+    QEMU_LOCK_GUARD(&yank_lock);
+    QLIST_FOREACH(entry, &yank_instance_list, next) {
+        YankInstanceList *new_entry;
+        new_entry = g_new0(YankInstanceList, 1);
+        new_entry->value = QAPI_CLONE(YankInstance, entry->instance);
+        new_entry->next = ret;
+        ret = new_entry;
+    }
+
+    return ret;
+}
+
+static void __attribute__((__constructor__)) yank_init(void)
+{
+    qemu_mutex_init(&yank_lock);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..ddbf0fc1e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2732,6 +2732,13 @@ F: util/uuid.c
 F: include/qemu/uuid.h
 F: tests/test-uuid.c
 
+Yank feature
+M: Lukas Straub <lukasstraub2@web.de>
+S: Odd fixes
+F: util/yank.c
+F: include/qemu/yank.h
+F: qapi/yank.json
+
 COLO Framework
 M: zhanghailiang <zhang.zhanghailiang@huawei.com>
 S: Maintained
diff --git a/qapi/meson.build b/qapi/meson.build
index 0e98146f1f..ab68e7900e 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -47,6 +47,7 @@ qapi_all_modules = [
   'trace',
   'transaction',
   'ui',
+  'yank',
 ]
 
 qapi_storage_daemon_modules = [
diff --git a/util/meson.build b/util/meson.build
index a3dfc0f966..540a605b78 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -50,6 +50,7 @@ endif
 
 if have_system
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
+  util_ss.add(files('yank.c'))
 endif
 
 if have_block
-- 
2.26.2


