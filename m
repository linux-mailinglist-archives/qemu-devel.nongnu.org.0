Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB13610DDC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:54:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM36-0002e0-8l; Fri, 28 Oct 2022 05:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2y-0002bs-Kw
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ooM2v-0003i9-Sp
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666950781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioUb/t5cHAoMcHr96Sp0aQhkI+mULUPg3VI4BM/HVPA=;
 b=KAudHWZsmYyV31BVtL6DLOMXAakXaJngFwgvf4ACO9XpCm2Aq5t9ExXA6+ce8LjgpujTl/
 ovqrvLt2ykMuYi17b9YLMJSCQYZLzYVpTlIpVSFIOlQ8LDI9O5oHDwSwVp2ohish7TAugH
 D8EC4wkOP198TGJCZBdKYujaxpOM2EA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-Rc-hkEqAM6yaQ35VnEzF2Q-1; Fri, 28 Oct 2022 05:52:56 -0400
X-MC-Unique: Rc-hkEqAM6yaQ35VnEzF2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 164771C09B77;
 Fri, 28 Oct 2022 09:52:56 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2A51415139;
 Fri, 28 Oct 2022 09:52:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [GIT PULL 5/8] util: Add write-only "node-affinity" property for
 ThreadContext
Date: Fri, 28 Oct 2022 11:52:22 +0200
Message-Id: <20221028095225.86118-6-david@redhat.com>
In-Reply-To: <20221028095225.86118-1-david@redhat.com>
References: <20221028095225.86118-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let's make it easier to pin threads created via a ThreadContext to
all host CPUs currently belonging to a given set of host NUMA nodes --
which is the common case.

"node-affinity" is simply a shortcut for setting "cpu-affinity" manually
to the list of host CPUs belonging to the set of host nodes. This property
can only be written.

A simple QEMU example to set the CPU affinity to host node 1 on a system
with two nodes, 24 CPUs each, whereby odd-numbered host CPUs belong to
host node 1:
    qemu-system-x86_64 -S \
      -object thread-context,id=tc1,node-affinity=1

And we can query the cpu-affinity via HMP/QMP:
    (qemu) qom-get tc1 cpu-affinity
    [
        1,
        3,
        5,
        7,
        9,
        11,
        13,
        15,
        17,
        19,
        21,
        23,
        25,
        27,
        29,
        31,
        33,
        35,
        37,
        39,
        41,
        43,
        45,
        47
    ]

We cannot query the node-affinity:
    (qemu) qom-get tc1 node-affinity
    Error: Insufficient permission to perform this operation

But note that due to dynamic library loading this example will not work
before we actually make use of thread_context_create_thread() in QEMU
code, because the type will otherwise not get registered. We'll wire
this up next to make it work.

Note that if the host CPUs for a host node change due do CPU hot(un)plug
CPU onlining/offlining (i.e., lscpu output changes) after the ThreadContext
was started, the CPU affinity will not get updated.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221014134720.168738-5-david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 qapi/qom.json         |  9 ++++-
 util/meson.build      |  2 +-
 util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 8013ba4b82..20b5735d78 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -839,10 +839,17 @@
 #                threads created in the thread context (default: QEMU main
 #                thread CPU affinity)
 #
+# @node-affinity: the list of host node numbers that will be resolved to a
+#                 list of host CPU numbers used as CPU affinity. This is a
+#                 shortcut for specifying the list of host CPU numbers
+#                 belonging to the host nodes manually by setting
+#                 @cpu-affinity. (default: QEMU main thread affinity)
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
index c921905396..4138245332 100644
--- a/util/thread-context.c
+++ b/util/thread-context.c
@@ -21,6 +21,10 @@
 #include "qemu/module.h"
 #include "qemu/bitmap.h"
 
+#ifdef CONFIG_NUMA
+#include <numa.h>
+#endif
+
 enum {
     TC_CMD_NONE = 0,
     TC_CMD_STOP,
@@ -88,6 +92,11 @@ static void thread_context_set_cpu_affinity(Object *obj, Visitor *v,
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
@@ -159,6 +168,79 @@ static void thread_context_get_cpu_affinity(Object *obj, Visitor *v,
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
@@ -208,6 +290,8 @@ static void thread_context_class_init(ObjectClass *oc, void *data)
     object_class_property_add(oc, "cpu-affinity", "int",
                               thread_context_get_cpu_affinity,
                               thread_context_set_cpu_affinity, NULL, NULL);
+    object_class_property_add(oc, "node-affinity", "int", NULL,
+                              thread_context_set_node_affinity, NULL, NULL);
 }
 
 static void thread_context_instance_init(Object *obj)
-- 
2.37.3


