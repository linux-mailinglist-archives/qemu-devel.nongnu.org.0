Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D7323F68
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:14:24 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvrr-0000x1-R3
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvT6-0005dS-Ir
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvT1-0004al-RW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faV1fytnu9kfTicVOySI1fjQDibiqsL8dnlFfQwFpTg=;
 b=JwxO5aJQ1p0IplUMuaw65F+3rvSEWLRxxa4iGr4pYCIyefqKoA2IhBrCNG7O9nQxVh51r3
 iCMczZQRY+jQOA1Dk4eswMvZDllDJgS9QiWYOQ7eYER7y/2O0T8d/fyw72+bbek/O6p9xj
 7U8FqqpiUG+ui/rjKASHRpsdyVuWcQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-NQtq88VDOkmCO3rbvx1kKw-1; Wed, 24 Feb 2021 09:47:39 -0500
X-MC-Unique: NQtq88VDOkmCO3rbvx1kKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 853F218A2EDC;
 Wed, 24 Feb 2021 13:56:41 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 946855D6AD;
 Wed, 24 Feb 2021 13:56:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/31] vl: QAPIfy -object
Date: Wed, 24 Feb 2021 14:52:54 +0100
Message-Id: <20210224135255.253837-31-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This switches the system emulator from a QemuOpts-based parser for
-object to user_creatable_parse_str() which uses a keyval parser and
enforces the QAPI schema.

Apart from being a cleanup, this makes non-scalar properties accessible.

This adopts a similar model as -blockdev uses: When parsing the option,
create the ObjectOptions and queue them. At the later point where we
used to create objects for the collected QemuOpts, the ObjectOptions
queue is processed instead.

A complication compared to -blockdev is that object definitions are
supported in -readconfig and -writeconfig.

After this patch, -readconfig still works, though it still goes through
the QemuOpts parser, which means that improvements like non-scalar
properties are still not available in config files.

-writeconfig stops working for -object. Tough luck. It has never
supported all options (not even the common ones), so supporting one less
isn't the end of the world. As object definitions from -readconfig still
go through QemuOpts, they are still included in -writeconfig output,
which at least prevents destroying your existing configuration when you
just wanted to add another option.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 softmmu/vl.c | 109 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 84 insertions(+), 25 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..205c254542 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -113,6 +113,7 @@
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qapi-visit-block-core.h"
+#include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
@@ -132,6 +133,14 @@ typedef struct BlockdevOptionsQueueEntry {
 
 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
 
+typedef struct ObjectOptionsQueueEntry {
+    ObjectOptions *options;
+    Location loc;
+    QTAILQ_ENTRY(ObjectOptionsQueueEntry) next;
+} ObjectOptionsQueueEntry;
+
+typedef QTAILQ_HEAD(, ObjectOptionsQueueEntry) ObjectOptionsQueue;
+
 static const char *cpu_option;
 static const char *mem_path;
 static const char *incoming;
@@ -143,6 +152,7 @@ static int snapshot;
 static bool preconfig_requested;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
 static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
+static ObjectOptionsQueue obj_queue = QTAILQ_HEAD_INITIALIZER(obj_queue);
 static bool nographic = false;
 static int mem_prealloc; /* force preallocation of physical target memory */
 static ram_addr_t ram_size;
@@ -1691,12 +1701,9 @@ static int machine_set_property(void *opaque,
  * cannot be created here, as it depends on the chardev
  * already existing.
  */
-static bool object_create_early(const char *type, QemuOpts *opts)
+static bool object_create_early(ObjectOptions *options)
 {
-    if (user_creatable_print_help(type, opts)) {
-        exit(0);
-    }
-
+    const char *type = ObjectType_str(options->qom_type);
     /*
      * Objects should not be made "delayed" without a reason.  If you
      * add one, state the reason in a comment!
@@ -1744,6 +1751,56 @@ static bool object_create_early(const char *type, QemuOpts *opts)
     return true;
 }
 
+static void object_queue_create(bool early)
+{
+    ObjectOptionsQueueEntry *entry, *next;
+
+    QTAILQ_FOREACH_SAFE(entry, &obj_queue, next, next) {
+        if (early != object_create_early(entry->options)) {
+            continue;
+        }
+        QTAILQ_REMOVE(&obj_queue, entry, next);
+        loc_push_restore(&entry->loc);
+        user_creatable_add_qapi(entry->options, &error_fatal);
+        loc_pop(&entry->loc);
+        qapi_free_ObjectOptions(entry->options);
+        g_free(entry);
+    }
+}
+
+/*
+ * -readconfig still parses things into QemuOpts. Convert any such
+ *  configurations to an ObjectOptionsQueueEntry.
+ *
+ *  This is more restricted than the normal -object parser because QemuOpts
+ *  parsed things, so no support for non-scalar properties. Help is also not
+ *  supported (but this shouldn't be requested in a config file anyway).
+ */
+static int object_readconfig_to_qapi(void *opaque, QemuOpts *opts, Error **errp)
+{
+    ERRP_GUARD();
+    ObjectOptionsQueueEntry *entry;
+    ObjectOptions *options;
+    QDict *args = qemu_opts_to_qdict(opts, NULL);
+    Visitor *v;
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(args));
+    visit_type_ObjectOptions(v, NULL, &options, errp);
+    visit_free(v);
+    qobject_unref(args);
+
+    if (*errp) {
+        return -1;
+    }
+
+    entry = g_new0(ObjectOptionsQueueEntry, 1);
+    entry->options = options;
+    loc_save(&entry->loc);
+    QTAILQ_INSERT_TAIL(&obj_queue, entry, next);
+
+    return 0;
+}
+
 static void qemu_apply_machine_options(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -1816,8 +1873,8 @@ static void qemu_create_early_backends(void)
     }
 
     qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_early, &error_fatal);
+                      object_readconfig_to_qapi, NULL, &error_fatal);
+    object_queue_create(true);
 
     /* spice needs the timers to be initialized by this point */
     /* spice must initialize before audio as it changes the default auiodev */
@@ -1841,16 +1898,6 @@ static void qemu_create_early_backends(void)
     audio_init_audiodevs();
 }
 
-
-/*
- * The remainder of object creation happens after the
- * creation of chardev, fsdev, net clients and device data types.
- */
-static bool object_create_late(const char *type, QemuOpts *opts)
-{
-    return !object_create_early(type, opts);
-}
-
 static void qemu_create_late_backends(void)
 {
     if (qtest_chrdev) {
@@ -1859,9 +1906,11 @@ static void qemu_create_late_backends(void)
 
     net_init_clients(&error_fatal);
 
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_late, &error_fatal);
+    /*
+     * The remainder of object creation happens after the
+     * creation of chardev, fsdev, net clients and device data types.
+     */
+    object_queue_create(false);
 
     if (tpm_init() < 0) {
         exit(1);
@@ -3407,12 +3456,22 @@ void qemu_init(int argc, char **argv, char **envp)
 #endif
                 break;
             case QEMU_OPTION_object:
-                opts = qemu_opts_parse_noisily(qemu_find_opts("object"),
-                                               optarg, true);
-                if (!opts) {
-                    exit(1);
+                {
+                    ObjectOptionsQueueEntry *entry;
+                    ObjectOptions *options;
+
+                    options = user_creatable_parse_str(optarg, &error_fatal);
+                    if (!options)  {
+                        /* Help was printed */
+                        exit(EXIT_SUCCESS);
+                    }
+
+                    entry = g_new0(ObjectOptionsQueueEntry, 1);
+                    entry->options = options;
+                    loc_save(&entry->loc);
+                    QTAILQ_INSERT_TAIL(&obj_queue, entry, next);
+                    break;
                 }
-                break;
             case QEMU_OPTION_overcommit:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("overcommit"),
                                                optarg, false);
-- 
2.29.2


