Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1B5EE2C9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:14:01 +0200 (CEST)
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odadE-0007dD-GL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaD4-00034j-6M
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1odaCz-0001CP-4U
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664383612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+jLGhYhOFxUpD/aIqbVoqUEt8YU4sfxRpOyCY6mqgw=;
 b=dq0oT719jESKv8+rAu4fPg9+rWc9cqk5N61Z74+QEoceVR9f4z34G7Olypq6jfhZNf65wV
 OYDig/PCgX3MlvIWCO6I2NP6u89dI0ce78v19K9fFVyRloqmCYu/kKCx9QcWp0G8xEIRJ5
 BVEvozkvGgfxF9ZlzdRD4ezdPRFjIKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-5LqALcRNNpu4M2PTug36HQ-1; Wed, 28 Sep 2022 12:46:50 -0400
X-MC-Unique: 5LqALcRNNpu4M2PTug36HQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EA701871CCC;
 Wed, 28 Sep 2022 16:46:50 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DEDB2166B2B;
 Wed, 28 Sep 2022 16:46:43 +0000 (UTC)
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
Subject: [PATCH v1 6/7] hostmem: Allow for specifying a ThreadContext for
 preallocation
Date: Wed, 28 Sep 2022 18:45:41 +0200
Message-Id: <20220928164542.117952-7-david@redhat.com>
In-Reply-To: <20220928164542.117952-1-david@redhat.com>
References: <20220928164542.117952-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Let's allow for specifying a thread context via the "prealloc-context"
property. When set, preallcoation threads will be crated via the
thread context -- inheriting the same CPU affinity as the thread
context.

Pinning preallcoation threads to CPUs can heavily increase performance
in NUMA setups, because, preallocation from a CPU close to the target
NUMA node(s) is faster then preallocation from a CPU further remote,
simply because of memory bandwidth for initializing memory with zeroes.
This is especially relevant for very large VMs backed by huge/gigantic
pages, whereby preallocation is mandatory.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem.c       | 12 +++++++++---
 include/sysemu/hostmem.h |  2 ++
 qapi/qom.json            |  4 ++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 76f0394490..8640294c10 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -232,8 +232,8 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
         void *ptr = memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz = memory_region_size(&backend->mr);
 
-        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads, NULL,
-                          &local_err);
+        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
+                          backend->prealloc_context, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -385,7 +385,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          */
         if (backend->prealloc) {
             qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                              backend->prealloc_threads, NULL, &local_err);
+                              backend->prealloc_threads,
+                              backend->prealloc_context, &local_err);
             if (local_err) {
                 goto out;
             }
@@ -493,6 +494,11 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "prealloc-threads",
         "Number of CPU threads to use for prealloc");
+    object_class_property_add_link(oc, "prealloc-context",
+        TYPE_THREAD_CONTEXT, offsetof(HostMemoryBackend, prealloc_context),
+        object_property_allow_set_link, OBJ_PROP_LINK_STRONG);
+    object_class_property_set_description(oc, "prealloc-context",
+        "Context to use for creating CPU threads for preallocation");
     object_class_property_add(oc, "size", "int",
         host_memory_backend_get_size,
         host_memory_backend_set_size,
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 9ff5c16963..39326f1d4f 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 #include "exec/memory.h"
 #include "qemu/bitmap.h"
+#include "qemu/thread-context.h"
 
 #define TYPE_MEMORY_BACKEND "memory-backend"
 OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
@@ -66,6 +67,7 @@ struct HostMemoryBackend {
     bool merge, dump, use_canonical_path;
     bool prealloc, is_mapped, share, reserve;
     uint32_t prealloc_threads;
+    ThreadContext *prealloc_context;
     DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
     HostMemPolicy policy;
 
diff --git a/qapi/qom.json b/qapi/qom.json
index d36bf3355f..9caa1a60e3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -578,6 +578,9 @@
 #
 # @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
 #
+# @prealloc-context: context to use for creation of preallocation threads
+#                    (default: none) (since 7.2)
+#
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
@@ -608,6 +611,7 @@
             '*policy': 'HostMemPolicy',
             '*prealloc': 'bool',
             '*prealloc-threads': 'uint32',
+            '*prealloc-context': 'str',
             '*share': 'bool',
             '*reserve': 'bool',
             'size': 'size',
-- 
2.37.3


