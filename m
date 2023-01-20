Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB9675631
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:57:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrs8-0007mx-Qu; Fri, 20 Jan 2023 08:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs5-0007mI-1o
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:57 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs2-0001n8-Sp
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:56 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id D25545FD7B;
 Fri, 20 Jan 2023 16:48:07 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:8f3f:2197:162b:4096])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wlngUQ0WWiE1-kiz6Q4ar; Fri, 20 Jan 2023 16:48:07 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674222487; bh=lYyT3PU2ejZSt9ohAhPKNh+ge3LC9xuJBtLV6pXra7w=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=qAKuDeXbi7Q3aI5NqioBcR7DJ5d36hEBM6PF7zwmk7BKFlqe1fNtj5ZAEO8XwehDA
 bqJhJbOIqL5mGks4csPVl9flg9qPmCYTcwN2A2U31UUDz8X3NFvlkwSJwSGmm6xq2c
 n+lch5yoBRZ6XsKceJlb6cqjfKjmOek/LuSma5xg=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
Subject: [PATCH 3/4] backends/hostmem: add an ability to specify prealloc
 timeout
Date: Fri, 20 Jan 2023 16:47:48 +0300
Message-Id: <20230120134749.550639-4-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the new qemu_prealloc_mem_with_timeout api so that we can limit the
maximum amount of time to be spent preallocating guest RAM. We also emit
a warning from the timeout handler detailing the current prealloc
progress and letting the user know that it was exceeded.

The timeout is set to zero (no timeout) by default, and can be
configured via the new 'prealloc-timeout' property.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 backends/hostmem.c       | 48 ++++++++++++++++++++++++++++++++++++++--
 include/sysemu/hostmem.h |  2 ++
 qapi/qom.json            |  4 ++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 842bfa9eb7..be9af7515e 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -34,6 +34,19 @@ QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_BIND != MPOL_BIND);
 QEMU_BUILD_BUG_ON(HOST_MEM_POLICY_INTERLEAVE != MPOL_INTERLEAVE);
 #endif
 
+static void
+host_memory_on_prealloc_timeout(void *opaque,
+                                const PreallocStats *stats)
+{
+    HostMemoryBackend *backend = opaque;
+
+    backend->prealloc_did_timeout = true;
+    warn_report("HostMemory preallocation timeout %"PRIu64"s exceeded, "
+                "allocated %zu/%zu (%zu byte) pages (%d threads)",
+                (uint64_t)stats->seconds_elapsed, stats->allocated_pages,
+                stats->total_pages, stats->page_size, stats->threads);
+}
+
 char *
 host_memory_backend_get_name(HostMemoryBackend *backend)
 {
@@ -223,8 +236,26 @@ static bool do_prealloc_mr(HostMemoryBackend *backend, Error **errp)
     void *ptr = memory_region_get_ram_ptr(&backend->mr);
     uint64_t sz = memory_region_size(&backend->mr);
 
-    qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
-                      backend->prealloc_context, &local_err);
+    if (backend->prealloc_timeout) {
+        PreallocTimeout timeout = {
+            .seconds = (time_t)backend->prealloc_timeout,
+            .user = backend,
+            .on_timeout = host_memory_on_prealloc_timeout,
+        };
+
+        qemu_prealloc_mem_with_timeout(fd, ptr, sz, backend->prealloc_threads,
+                                       backend->prealloc_context, &timeout,
+                                       &local_err);
+        if (local_err && backend->prealloc_did_timeout) {
+            error_free(local_err);
+            local_err = NULL;
+        }
+    } else {
+        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
+                          backend->prealloc_context, &local_err);
+    }
+
+
     if (local_err) {
         error_propagate(errp, local_err);
         return false;
@@ -277,6 +308,13 @@ static void host_memory_backend_set_prealloc_threads(Object *obj, Visitor *v,
     backend->prealloc_threads = value;
 }
 
+static void host_memory_backend_get_set_prealloc_timeout(Object *obj,
+    Visitor *v, const char *name, void *opaque, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+    visit_type_uint32(v, name, &backend->prealloc_timeout, errp);
+}
+
 static void host_memory_backend_init(Object *obj)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
@@ -516,6 +554,12 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         object_property_allow_set_link, OBJ_PROP_LINK_STRONG);
     object_class_property_set_description(oc, "prealloc-context",
         "Context to use for creating CPU threads for preallocation");
+    object_class_property_add(oc, "prealloc-timeout", "int",
+        host_memory_backend_get_set_prealloc_timeout,
+        host_memory_backend_get_set_prealloc_timeout,
+        NULL, NULL);
+    object_class_property_set_description(oc, "prealloc-timeout",
+        "Maximum memory preallocation timeout in seconds");
     object_class_property_add(oc, "size", "int",
         host_memory_backend_get_size,
         host_memory_backend_set_size,
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 39326f1d4f..21910f3b45 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -66,7 +66,9 @@ struct HostMemoryBackend {
     uint64_t size;
     bool merge, dump, use_canonical_path;
     bool prealloc, is_mapped, share, reserve;
+    bool prealloc_did_timeout;
     uint32_t prealloc_threads;
+    uint32_t prealloc_timeout;
     ThreadContext *prealloc_context;
     DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
     HostMemPolicy policy;
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..9149c064b8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -581,6 +581,9 @@
 # @prealloc-context: thread context to use for creation of preallocation threads
 #                    (default: none) (since 7.2)
 #
+# @prealloc-timeout: Maximum memory preallocation timeout in seconds
+#                    (default: 0) (since 7.3)
+#
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
@@ -612,6 +615,7 @@
             '*prealloc': 'bool',
             '*prealloc-threads': 'uint32',
             '*prealloc-context': 'str',
+            '*prealloc-timeout': 'uint32',
             '*share': 'bool',
             '*reserve': 'bool',
             'size': 'size',
-- 
2.25.1


