Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DADA35DB00
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:22:20 +0200 (CEST)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFFT-0005K4-3l
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFAN-0008K4-0S
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFAK-00063d-R9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618305418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0m4NT2eIXVQpgJ9IfKn4W++2NQ0894Nbi2lePdQxRQ=;
 b=CsyFZUqTv4NfrHmAUlbMeQu5D9gTFPoC/5Lrk09no0Uv8KAURw3ZXw+XWNP/ozBTaOaBaa
 /HjW2bkWXho0Kzpb5nvBQlJG0rOJGJhOk6l6uZjdTItJpaoYvgLR0ksh7yeMj+dgoYfAAk
 GKbY7pIyt3uObY1o8B1N/5YJDlWTIYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-6_TS3OkiOAidSgwDR06a3A-1; Tue, 13 Apr 2021 05:16:56 -0400
X-MC-Unique: 6_TS3OkiOAidSgwDR06a3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2FF2107ACC7;
 Tue, 13 Apr 2021 09:16:55 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BF1A1001B2C;
 Tue, 13 Apr 2021 09:16:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/14] hostmem: Wire up RAM_NORESERVE via "reserve" property
Date: Tue, 13 Apr 2021 11:14:16 +0200
Message-Id: <20210413091421.7707-10-david@redhat.com>
In-Reply-To: <20210413091421.7707-1-david@redhat.com>
References: <20210413091421.7707-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's provide a way to control the use of RAM_NORESERVE via memory
backends using the "reserve" property which defaults to true (old
behavior).

Only Linux currently supports clearing the flag (and support is checked at
runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
Windows and other POSIX systems will bail out with "reserve=false".

The target use case is virtio-mem, which dynamically exposes memory
inside a large, sparse memory area to the VM. This essentially allows
avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
virtio-mem and also supporting hugetlbfs in the future.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 backends/hostmem-file.c  | 11 ++++++-----
 backends/hostmem-memfd.c |  1 +
 backends/hostmem-ram.c   |  1 +
 backends/hostmem.c       | 32 ++++++++++++++++++++++++++++++++
 include/sysemu/hostmem.h |  2 +-
 qapi/qom.json            |  4 ++++
 6 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index b683da9daf..9d550e53d4 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -40,6 +40,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                object_get_typename(OBJECT(backend)));
 #else
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
+    uint32_t ram_flags;
     gchar *name;
 
     if (!backend->size) {
@@ -52,11 +53,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     }
 
     name = host_memory_backend_get_name(backend);
-    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
-                                     name,
-                                     backend->size, fb->align,
-                                     (backend->share ? RAM_SHARED : 0) |
-                                     (fb->is_pmem ? RAM_PMEM : 0),
+    ram_flags = backend->share ? RAM_SHARED : 0;
+    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
+    ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
+    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
+                                     backend->size, fb->align, ram_flags,
                                      fb->mem_path, fb->readonly, errp);
     g_free(name);
 #endif
diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 93b5d1a4cf..f3436b623d 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
+    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
                                    backend->size, ram_flags, fd, 0, errp);
     g_free(name);
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index 741e701062..b8e55cdbd0 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -29,6 +29,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
     name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
+    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
                                            backend->size, ram_flags, errp);
     g_free(name);
diff --git a/backends/hostmem.c b/backends/hostmem.c
index c6c1ff5b99..58fdc1b658 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
     Error *local_err = NULL;
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
 
+    if (!backend->reserve && value) {
+        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
+        return;
+    }
+
     if (!host_memory_backend_mr_inited(backend)) {
         backend->prealloc = value;
         return;
@@ -268,6 +273,7 @@ static void host_memory_backend_init(Object *obj)
     /* TODO: convert access to globals to compat properties */
     backend->merge = machine_mem_merge(machine);
     backend->dump = machine_dump_guest_core(machine);
+    backend->reserve = true;
     backend->prealloc_threads = 1;
 }
 
@@ -426,6 +432,28 @@ static void host_memory_backend_set_share(Object *o, bool value, Error **errp)
     backend->share = value;
 }
 
+static bool host_memory_backend_get_reserve(Object *o, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(o);
+
+    return backend->reserve;
+}
+
+static void host_memory_backend_set_reserve(Object *o, bool value, Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(o);
+
+    if (host_memory_backend_mr_inited(backend)) {
+        error_setg(errp, "cannot change property value");
+        return;
+    }
+    if (backend->prealloc && !value) {
+        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
+        return;
+    }
+    backend->reserve = value;
+}
+
 static bool
 host_memory_backend_get_use_canonical_path(Object *obj, Error **errp)
 {
@@ -494,6 +522,10 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         host_memory_backend_get_share, host_memory_backend_set_share);
     object_class_property_set_description(oc, "share",
         "Mark the memory as private to QEMU or shared");
+    object_class_property_add_bool(oc, "reserve",
+        host_memory_backend_get_reserve, host_memory_backend_set_reserve);
+    object_class_property_set_description(oc, "reserve",
+        "Reserve swap space (or huge pages) if applicable");
     /*
      * Do not delete/rename option. This option must be considered stable
      * (as if it didn't have the 'x-' prefix including deprecation period) as
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index df5644723a..9ff5c16963 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -64,7 +64,7 @@ struct HostMemoryBackend {
     /* protected */
     uint64_t size;
     bool merge, dump, use_canonical_path;
-    bool prealloc, is_mapped, share;
+    bool prealloc, is_mapped, share, reserve;
     uint32_t prealloc_threads;
     DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
     HostMemPolicy policy;
diff --git a/qapi/qom.json b/qapi/qom.json
index db5ac419b1..cd9c1ca7e9 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -545,6 +545,9 @@
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
+# @reserve: if true, reserve swap space (or huge pages) if applicable
+#           default: true)
+#
 # @size: size of the memory region in bytes
 #
 # @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
@@ -566,6 +569,7 @@
             '*prealloc': 'bool',
             '*prealloc-threads': 'uint32',
             '*share': 'bool',
+            '*reserve': 'bool',
             'size': 'size',
             '*x-use-canonical-path-for-ramblock-id': 'bool' } }
 
-- 
2.30.2


