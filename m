Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E2C30CBB1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:34:19 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l71RK-00037G-UI
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O9-0008J9-Nx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l71O7-0001Fs-8y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 14:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612294257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGiRvX/miiDra234/3N3CmVjK/lJzDKYceY/6z9WJE8=;
 b=CVdKox/ZS7qRepxacCRNnykoHd9RouUKOUDHL8jrc/CBpy3Tj0QF6sXkb8oHLEK/D05rUd
 PW8bydgUK0nK/jD7XiDdbQ9iRkVBcOeizDerDB/HdbOGg+6jwOsrnhV2brYzzaI+REBE8Q
 4MtQNSzABFyXnyLm623luvm3aZg9g5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-wdoEUUNeNSGxKnGM6sCnUA-1; Tue, 02 Feb 2021 14:30:54 -0500
X-MC-Unique: wdoEUUNeNSGxKnGM6sCnUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF07C7432;
 Tue,  2 Feb 2021 19:30:25 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014106EF57;
 Tue,  2 Feb 2021 19:30:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/3] hostmem-file: add readonly=on|off option
Date: Tue,  2 Feb 2021 14:30:19 -0500
Message-Id: <20210202193020.4107711-3-ehabkost@redhat.com>
In-Reply-To: <20210202193020.4107711-1-ehabkost@redhat.com>
References: <20210202193020.4107711-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Let -object memory-backend-file work on read-only files when the
readonly=on option is given. This can be used to share the contents of a
file between multiple guests while preventing them from consuming
Copy-on-Write memory if guests dirty the pages, for example.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210104171320.575838-3-stefanha@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 backends/hostmem-file.c | 28 +++++++++++++++++++++++++++-
 qemu-options.hx         |  5 ++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index e8276921244..733408e076f 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -29,6 +29,7 @@ struct HostMemoryBackendFile {
     uint64_t align;
     bool discard_data;
     bool is_pmem;
+    bool readonly;
 };
 
 static void
@@ -56,7 +57,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
                                      backend->size, fb->align,
                                      (backend->share ? RAM_SHARED : 0) |
                                      (fb->is_pmem ? RAM_PMEM : 0),
-                                     fb->mem_path, false, errp);
+                                     fb->mem_path, fb->readonly, errp);
     g_free(name);
 #endif
 }
@@ -151,6 +152,28 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
     fb->is_pmem = value;
 }
 
+static bool file_memory_backend_get_readonly(Object *obj, Error **errp)
+{
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(obj);
+
+    return fb->readonly;
+}
+
+static void file_memory_backend_set_readonly(Object *obj, bool value,
+                                             Error **errp)
+{
+    HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(obj);
+
+    if (host_memory_backend_mr_inited(backend)) {
+        error_setg(errp, "cannot change property 'readonly' of %s.",
+                   object_get_typename(obj));
+        return;
+    }
+
+    fb->readonly = value;
+}
+
 static void file_backend_unparent(Object *obj)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
@@ -182,6 +205,9 @@ file_backend_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_add_bool(oc, "pmem",
         file_memory_backend_get_pmem, file_memory_backend_set_pmem);
+    object_class_property_add_bool(oc, "readonly",
+        file_memory_backend_get_readonly,
+        file_memory_backend_set_readonly);
 }
 
 static void file_backend_instance_finalize(Object *o)
diff --git a/qemu-options.hx b/qemu-options.hx
index d0410f05125..c09c4646e28 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4426,7 +4426,7 @@ SRST
     they are specified. Note that the 'id' property must be set. These
     objects are placed in the '/objects' path.
 
-    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align``
+    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
         Creates a memory file backend object, which can be used to back
         the guest RAM with huge pages.
 
@@ -4509,6 +4509,9 @@ SRST
         4.15) and the filesystem of ``mem-path`` mounted with DAX
         option.
 
+        The ``readonly`` option specifies whether the backing file is opened
+        read-only or read-write (default).
+
     ``-object memory-backend-ram,id=id,merge=on|off,dump=on|off,share=on|off,prealloc=on|off,size=size,host-nodes=host-nodes,policy=default|preferred|bind|interleave``
         Creates a memory backend object, which can be used to back the
         guest RAM. Memory backend objects offer more control than the
-- 
2.28.0


