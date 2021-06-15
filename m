Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086EB3A81E1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:09:29 +0200 (CEST)
Received: from localhost ([::1]:40472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9ku-00074x-0F
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hs-00069G-F2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:28 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Ho-0002r0-LK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:27 -0400
Received: by mail-ej1-x634.google.com with SMTP id g8so22657202ejx.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kr3IPZIn3YY4xCSnEba8QHvPCHxkDg0ZjFV9NHyZrb8=;
 b=rWdPaXv0Nzd5vfROXMGhsQGHfjHF4eBQ+f1+CzOCV7wwiOSyszYuww15PnF+F2KgXs
 UPttz1vOcFA3RFySTN2AylO2uJYgFcbavOCpPN9d6o8ybGRyBnc87QstPGfWa7wwOihQ
 Y9Y2YB8rSC7UJSt5h0aBadckIpjmGJ+uMHYVejByjRvm/5E+XUzkN3ozs+zWGeCRETCy
 Ra5Z3JPkgvV9fZC4k03cvFPMMgFDSsBEFyVPGeUYWl84s5xb6ZKjq0oTFUtc+S+/tsgN
 C6UsPL3dPd9vrKk6e2DXOZR6XxCFif6QUXfrz9GKpm1xyVZu/s4LsooDL3fBGrWgClQc
 KjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kr3IPZIn3YY4xCSnEba8QHvPCHxkDg0ZjFV9NHyZrb8=;
 b=uSQYZjQ6e21bek/mO4Suf7y1vidDeITHnw7j0N2XE7Wp1WSRsFq+FpLWMYJOC2sw8+
 0aBSnCaFattK9QpN+1z/lkafdXkfze8zdMQchOZ0UIaFXdS4jtVniec4/ddYmdNrdpcY
 V02qxcwoVePPKVcXc2ve+mMSRutUP/naW0Fp2b0pVXyFAyj/T+W7XpyxtZsIu+8vQivi
 zH46EOYOFmBlDSywEms/rmJe6/MDxRoD/FmrhvDuaJqvjCXEUIv1PLSPrBXPW9e7kckh
 RjS6j3zPxULw0rcTlt1mBNOkgVAIeVZGUSG4MACicFOEc5ONAEz8TpsIacbv/csXPAdY
 694Q==
X-Gm-Message-State: AOAM532LoQaFU2r7nSrs9SyvJvCI+t5nQMYuoUJQb1YBceXOqaO5VtOc
 Zj3lRrcwo7P7hrtdlrA/tR7C0WGniZU=
X-Google-Smtp-Source: ABdhPJw1nj6rRcFjqF42T1KY7zn25oRjE/3yEECGIOPg+UjOlE5VGf9mic/BeiiRkUKHVix3Vj9c6g==
X-Received: by 2002:a17:906:70c1:: with SMTP id
 g1mr14096628ejk.89.1623764362482; 
 Tue, 15 Jun 2021 06:39:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] hostmem: Wire up RAM_NORESERVE via "reserve" property
Date: Tue, 15 Jun 2021 15:38:49 +0200
Message-Id: <20210615133855.775687-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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

As really only Linux implements RAM_NORESERVE right now, let's expose
the property only with CONFIG_LINUX. Setting the property to "false"
will then only fail in corner cases -- for example on very old kernels
or when memory overcommit was completely disabled by the admin.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-11-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem-file.c  | 11 ++++++-----
 backends/hostmem-memfd.c |  1 +
 backends/hostmem-ram.c   |  1 +
 backends/hostmem.c       | 36 ++++++++++++++++++++++++++++++++++++
 include/sysemu/hostmem.h |  2 +-
 qapi/qom.json            | 10 ++++++++++
 6 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 9b1b9f0a56..cd038024fa 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -39,6 +39,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                object_get_typename(OBJECT(backend)));
 #else
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
+    uint32_t ram_flags;
     gchar *name;
 
     if (!backend->size) {
@@ -51,11 +52,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
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
index 3076da146d..3fc85c3db8 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -54,6 +54,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 
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
index aab3de8408..4c05862ed5 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -216,6 +216,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
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
@@ -267,6 +272,7 @@ static void host_memory_backend_init(Object *obj)
     /* TODO: convert access to globals to compat properties */
     backend->merge = machine_mem_merge(machine);
     backend->dump = machine_dump_guest_core(machine);
+    backend->reserve = true;
     backend->prealloc_threads = 1;
 }
 
@@ -425,6 +431,30 @@ static void host_memory_backend_set_share(Object *o, bool value, Error **errp)
     backend->share = value;
 }
 
+#ifdef CONFIG_LINUX
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
+#endif /* CONFIG_LINUX */
+
 static bool
 host_memory_backend_get_use_canonical_path(Object *obj, Error **errp)
 {
@@ -493,6 +523,12 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
         host_memory_backend_get_share, host_memory_backend_set_share);
     object_class_property_set_description(oc, "share",
         "Mark the memory as private to QEMU or shared");
+#ifdef CONFIG_LINUX
+    object_class_property_add_bool(oc, "reserve",
+        host_memory_backend_get_reserve, host_memory_backend_set_reserve);
+    object_class_property_set_description(oc, "reserve",
+        "Reserve swap space (or huge pages) if applicable");
+#endif /* CONFIG_LINUX */
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
index f7ef30f940..652be317b8 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -545,6 +545,9 @@
 # @share: if false, the memory is private to QEMU; if true, it is shared
 #         (default: false)
 #
+# @reserve: if true, reserve swap space (or huge pages) if applicable
+#           (default: true) (since 6.1)
+#
 # @size: size of the memory region in bytes
 #
 # @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
@@ -556,6 +559,12 @@
 #                                        false generally, but true for machine
 #                                        types <= 4.0)
 #
+# Note: prealloc=true and reserve=false cannot be set at the same time. With
+#       reserve=true, the behavior depends on the operating system: for example,
+#       Linux will not reserve swap space for shared file mappings --
+#       "not applicable". In contrast, reserve=false will bail out if it cannot
+#       be configured accordingly.
+#
 # Since: 2.1
 ##
 { 'struct': 'MemoryBackendProperties',
@@ -566,6 +575,7 @@
             '*prealloc': 'bool',
             '*prealloc-threads': 'uint32',
             '*share': 'bool',
+            '*reserve': 'bool',
             'size': 'size',
             '*x-use-canonical-path-for-ramblock-id': 'bool' } }
 
-- 
2.31.1



