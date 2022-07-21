Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1F57CA53
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:11:28 +0200 (CEST)
Received: from localhost ([::1]:34324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEV1b-0008B3-Mm
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUyG-0002G0-WE
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oEUyE-0000yp-8s
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658405277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCw1TAqcCJb5ORU7X6193FGqQ1uL8/tP8E9cw5fwHoI=;
 b=NYv2lW45gb0R6tiwJKA9E4EMfyeUFq2VVVc8umKU0YNAxbP37EtN8CvZLmpM4+9cyqAW0a
 YRA7A7ZKQt4hwq9kqLMgLThAb5rL/aGD7VkneadNmeIfnDLK8ZuMjgO+Mc17lR/JTUR63w
 HONfvaiLNdbn/jQvqOuPZZcZZlujEdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-bryPEPrWPFep2ShXY5BDDA-1; Thu, 21 Jul 2022 08:07:49 -0400
X-MC-Unique: bryPEPrWPFep2ShXY5BDDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C74980029D;
 Thu, 21 Jul 2022 12:07:49 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296DE2026609;
 Thu, 21 Jul 2022 12:07:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH RFC 4/7] util: Add write-only "node-affinity" property for
 ThreadContext
Date: Thu, 21 Jul 2022 14:07:29 +0200
Message-Id: <20220721120732.118133-5-david@redhat.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
References: <20220721120732.118133-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make it easier to pin threads created via a ThreadContext to
all current CPUs belonging to given NUMA nodes.

As "node-affinity" is simply a shortcut for setting "cpu-affinity", that
property cannot be read and if the CPUs for a node change due do CPU
hotplug, the CPU affinity will not get updated.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 qapi/qom.json         |  7 +++-
 util/meson.build      |  2 +-
 util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 4775a333ed..d36bf3355f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -838,10 +838,15 @@
 # @cpu-affinity: the CPU affinity for all threads created in the thread
 #                context (default: QEMU main thread affinity)
 #
+# @node-affinity: shortcut for looking up the current CPUs for the given nodes
+#                 and setting @cpu-affinity (default: QEMU main thread
+#                 affinity)
+#
 # Since: 7.2
 ##
 { 'struct': 'ThreadContextProperties',
-  'data': { '*cpu-affinity': ['uint16'] } }
+  'data': { '*cpu-affinity': ['uint16'],
+            '*node-affinity': ['uint16'] } }
 
 
 ##
diff --git a/util/meson.build b/util/meson.build
index e97cd2d779..c0a7bc54d4 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,5 +1,5 @@
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
-util_ss.add(files('thread-context.c'))
+util_ss.add(files('thread-context.c'), numa)
 if not config_host_data.get('CONFIG_ATOMIC64')
   util_ss.add(files('atomic64.c'))
 endif
diff --git a/util/thread-context.c b/util/thread-context.c
index dcd607c532..880f0441be 100644
--- a/util/thread-context.c
+++ b/util/thread-context.c
@@ -22,6 +22,10 @@
 #include "qemu/module.h"
 #include "qemu/bitmap.h"
 
+#ifdef CONFIG_NUMA
+#include <numa.h>
+#endif
+
 enum {
     TC_CMD_NONE = 0,
     TC_CMD_STOP,
@@ -89,6 +93,11 @@ static void thread_context_set_cpu_affinity(Object *obj, Visitor *v,
     int nbits = 0, ret;
     Error *err = NULL;
 
+    if (tc->init_cpu_bitmap) {
+        error_setg(errp, "Mixing CPU and node affinity not supported");
+        return;
+    }
+
     visit_type_uint16List(v, name, &host_cpus, &err);
     if (err) {
         error_propagate(errp, err);
@@ -160,6 +169,79 @@ static void thread_context_get_cpu_affinity(Object *obj, Visitor *v,
     qapi_free_uint16List(host_cpus);
 }
 
+static void thread_context_set_node_affinity(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+#ifdef CONFIG_NUMA
+    const int nbits = numa_num_possible_cpus();
+    ThreadContext *tc = THREAD_CONTEXT(obj);
+    uint16List *l, *host_nodes = NULL;
+    unsigned long *bitmap = NULL;
+    struct bitmask *tmp_cpus;
+    Error *err = NULL;
+    int ret, i;
+
+    if (tc->init_cpu_bitmap) {
+        error_setg(errp, "Mixing CPU and node affinity not supported");
+        return;
+    }
+
+    visit_type_uint16List(v, name, &host_nodes, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (!host_nodes) {
+        error_setg(errp, "Node list is empty");
+        goto out;
+    }
+
+    bitmap = bitmap_new(nbits);
+    tmp_cpus = numa_allocate_cpumask();
+    for (l = host_nodes; l; l = l->next) {
+        numa_bitmask_clearall(tmp_cpus);
+        ret = numa_node_to_cpus(l->value, tmp_cpus);
+        if (ret) {
+            /* We ignore any errors, such as impossible nodes. */
+            continue;
+        }
+        for (i = 0; i < nbits; i++) {
+            if (numa_bitmask_isbitset(tmp_cpus, i)) {
+                set_bit(i, bitmap);
+            }
+        }
+    }
+    numa_free_cpumask(tmp_cpus);
+
+    if (bitmap_empty(bitmap, nbits)) {
+        error_setg(errp, "The nodes select no CPUs");
+        goto out;
+    }
+
+    if (tc->thread_id != -1) {
+        /*
+         * Note: we won't be adjusting the affinity of any thread that is still
+         * around for now, but only the affinity of the context thread.
+         */
+        ret = qemu_thread_set_affinity(&tc->thread, bitmap, nbits);
+        if (ret) {
+            error_setg(errp, "Setting CPU affinity failed: %s", strerror(ret));
+        }
+    } else {
+        tc->init_cpu_bitmap = bitmap;
+        bitmap = NULL;
+        tc->init_cpu_nbits = nbits;
+    }
+out:
+    g_free(bitmap);
+    qapi_free_uint16List(host_nodes);
+#else
+    error_setg(errp, "NUMA node affinity is not supported by this QEMU");
+#endif
+}
+
 static void thread_context_get_thread_id(Object *obj, Visitor *v,
                                          const char *name, void *opaque,
                                          Error **errp)
@@ -209,6 +291,8 @@ static void thread_context_class_init(ObjectClass *oc, void *data)
     object_class_property_add(oc, "cpu-affinity", "int",
                               thread_context_get_cpu_affinity,
                               thread_context_set_cpu_affinity, NULL, NULL);
+    object_class_property_add(oc, "node-affinity", "int", NULL,
+                              thread_context_set_node_affinity, NULL, NULL);
 }
 
 static void thread_context_instance_init(Object *obj)
-- 
2.35.3


