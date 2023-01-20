Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95C67562D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrs6-0007mH-PG; Fri, 20 Jan 2023 08:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs2-0007la-Vm
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:55 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrrz-0001n0-RB
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:54 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 074F05FE28;
 Fri, 20 Jan 2023 16:48:09 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:8f3f:2197:162b:4096])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wlngUQ0WWiE1-7YN7AeUl; Fri, 20 Jan 2023 16:48:08 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674222488; bh=ZtTbi4GXRgOO7uoBYaSNdemABJCezVJcSdF4lxOAUcw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=s8C38UC+VC6JVmCa1Fho2ZH0KMiiBSfqMvqFGmQP47+FvffuBx1AXYj+cs9/0huCp
 zwpi82m6lQNoU8u5yjrXzBoDJciH+nPQQ7QEZoJ32qerzPljWw5Z/2Y9lPYQlbOsg6
 2//e7dX4PN7HnQuskrGg08yvpSbmgIfxUoTkC0xw=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
Subject: [PATCH 4/4] backends/hostmem: add an ability to make prealloc timeout
 fatal
Date: Fri, 20 Jan 2023 16:47:49 +0300
Message-Id: <20230120134749.550639-5-d-tatianin@yandex-team.ru>
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

This is controlled via the new 'prealloc-timeout-fatal' property and can
be useful for cases when we cannot afford to not preallocate all guest
pages while being time constrained.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 backends/hostmem.c       | 38 ++++++++++++++++++++++++++++++++++----
 include/sysemu/hostmem.h |  1 +
 qapi/qom.json            |  4 ++++
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index be9af7515e..0808dc6951 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -39,12 +39,21 @@ host_memory_on_prealloc_timeout(void *opaque,
                                 const PreallocStats *stats)
 {
     HostMemoryBackend *backend = opaque;
+    const char *msg = "HostMemory preallocation timeout %"PRIu64"s exceeded, "
+                      "allocated %zu/%zu (%zu byte) pages (%d threads)";
+
+    if (backend->prealloc_timeout_fatal) {
+        error_report(msg, (uint64_t)stats->seconds_elapsed,
+                     stats->allocated_pages, stats->total_pages,
+                     stats->page_size, stats->threads);
+        exit(1);
+
+    }
 
     backend->prealloc_did_timeout = true;
-    warn_report("HostMemory preallocation timeout %"PRIu64"s exceeded, "
-                "allocated %zu/%zu (%zu byte) pages (%d threads)",
-                (uint64_t)stats->seconds_elapsed, stats->allocated_pages,
-                stats->total_pages, stats->page_size, stats->threads);
+    warn_report(msg, (uint64_t)stats->seconds_elapsed,
+                stats->allocated_pages, stats->total_pages,
+                stats->page_size, stats->threads);
 }
 
 char *
@@ -315,6 +324,22 @@ static void host_memory_backend_get_set_prealloc_timeout(Object *obj,
     visit_type_uint32(v, name, &backend->prealloc_timeout, errp);
 }
 
+static bool host_memory_backend_get_prealloc_timeout_fatal(
+        Object *obj, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+
+    return backend->prealloc_timeout_fatal;
+}
+
+static void host_memory_backend_set_prealloc_timeout_fatal(
+        Object *obj, bool value, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+
+    backend->prealloc_timeout_fatal = value;
+}
+
 static void host_memory_backend_init(Object *obj)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
@@ -560,6 +585,11 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "prealloc-timeout",
         "Maximum memory preallocation timeout in seconds");
+    object_class_property_add_bool(oc, "prealloc-timeout-fatal",
+        host_memory_backend_get_prealloc_timeout_fatal,
+        host_memory_backend_set_prealloc_timeout_fatal);
+    object_class_property_set_description(oc, "prealloc-timeout-fatal",
+        "Consider preallocation timeout a fatal error");
     object_class_property_add(oc, "size", "int",
         host_memory_backend_get_size,
         host_memory_backend_set_size,
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 21910f3b45..b501b5eff2 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -67,6 +67,7 @@ struct HostMemoryBackend {
     bool merge, dump, use_canonical_path;
     bool prealloc, is_mapped, share, reserve;
     bool prealloc_did_timeout;
+    bool prealloc_timeout_fatal;
     uint32_t prealloc_threads;
     uint32_t prealloc_timeout;
     ThreadContext *prealloc_context;
diff --git a/qapi/qom.json b/qapi/qom.json
index 9149c064b8..70644d714b 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -584,6 +584,9 @@
 # @prealloc-timeout: Maximum memory preallocation timeout in seconds
 #                    (default: 0) (since 7.3)
 #
+# @prealloc-timeout-fatal: Consider preallocation timeout a fatal error
+#                          (default: false) (since 7.3)
+#
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
@@ -616,6 +619,7 @@
             '*prealloc-threads': 'uint32',
             '*prealloc-context': 'str',
             '*prealloc-timeout': 'uint32',
+            '*prealloc-timeout-fatal': 'bool',
             '*share': 'bool',
             '*reserve': 'bool',
             'size': 'size',
-- 
2.25.1


