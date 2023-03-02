Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7D6A80C0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:10:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgoa-0000PB-2V; Thu, 02 Mar 2023 06:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXgoX-0000Ip-By
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:09:33 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fam.zheng@bytedance.com>)
 id 1pXgoV-0001m5-Bg
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:09:33 -0500
Received: by mail-qt1-x832.google.com with SMTP id r5so17546578qtp.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZudvcLwMvUbYZ9rjSI6+sx+hNXnP93f2AUoNGYExEG8=;
 b=D2RcFYPotMEfg7lRsVR1AzKKaNu/QrUO9yMo7J25O1O15bkkLUFF7BIhn2lluGaA/O
 uqfujbZPJjXxpb3iG/+m8xpv7X/9jXRZSyu8jnDQlgy0SQB+v8Wu/9GulFk4zRbfs3Sb
 rVZ2pXC9KKAjklzix70nNs2Rwz0N+DlE4tBsKMzNOEA5sMUzI1rTg2G+gSu4VloG1XzL
 OjVR9YsDc9CrFAV2OGSniL0CR6dG7aAI3PxucctQOd3V5KOx3fW/aAVZlYgZNmUXaywm
 2QAry1gcNZHvqPyztgC/LYOgn+WrY6NYNWTA3m53FuSklnQn+R8toTVwh3JnqVBxhwZ7
 86aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZudvcLwMvUbYZ9rjSI6+sx+hNXnP93f2AUoNGYExEG8=;
 b=W5o4g/pLLbuonUo5qbiO38lLk8EcCAXwPPJqA0J/CsvYzA44K1iHluDSchRfS+xXqc
 8RLSUDhfwQ8qHGjdh42hgqIH9JvJXtwgbEfnafbqSnX14yRS+YOtU2eb4p3AzE+43Q+G
 qZCrpxmWAeS42+bYKInd6ZxJ11nBiCobVK9+r0QqTvqfKpvdr74mT9gy5eRBOv1KzZ7y
 v0uIGXdGq9kHt5il6LoSfJxelEzvxVbUOn/Fj18UkLX6AKeQYrGL/nS4iggvaYcSwFh2
 AhEXLa3cXbSprOLOuKV3YyeRy6wzJQhgmSaV5bWPgS3ey0kscku/A4r7MHT4EWoRYpHl
 yzwg==
X-Gm-Message-State: AO0yUKVDR1Cba418bBfR+8T64848x51jrBL1mmknI7W8WYlpJ0GLFcOx
 AQLuiJnBPdeGCjRFUfQs+xaPG7PyiZVcdhxelZU=
X-Google-Smtp-Source: AK7set9aGs/LaqeyW8wd6ORIGsUjO323cTL+h5JOeZMszHsoF+OVeD79Gc72diHr3YJ6zlzz/k3I6g==
X-Received: by 2002:a05:622a:514:b0:3b9:bc8c:c213 with SMTP id
 l20-20020a05622a051400b003b9bc8cc213mr2313861qtx.30.1677755366478; 
 Thu, 02 Mar 2023 03:09:26 -0800 (PST)
Received: from localhost ([93.115.195.2]) by smtp.gmail.com with ESMTPSA id
 g186-20020a37b6c3000000b007430494ab92sm1498404qkf.67.2023.03.02.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:09:26 -0800 (PST)
From: Fam Zheng <fam.zheng@bytedance.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 fam@euphon.net, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 stefanha@redhat.com, Fam Zheng <fam.zheng@bytedance.com>
Subject: [PATCH] hostmem: Add clear option to file backend
Date: Thu,  2 Mar 2023 11:09:25 +0000
Message-Id: <20230302110925.4680-1-fam.zheng@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=fam.zheng@bytedance.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This adds a memset to clear the backing memory. This is useful in the
case of PMEM DAX to drop dirty data, if the backing memory is handed
over from a previous application or firmware which didn't clean up
before exiting.

Signed-off-by: Fam Zheng <fam.zheng@bytedance.com>
---
 backends/hostmem-file.c | 20 ++++++++++++++++++++
 include/exec/memory.h   |  3 +++
 qapi/qom.json           |  3 +++
 qemu-options.hx         |  4 +++-
 softmmu/physmem.c       |  6 +++++-
 5 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index 25141283c4..f7468d24ce 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -30,6 +30,7 @@ struct HostMemoryBackendFile {
     bool discard_data;
     bool is_pmem;
     bool readonly;
+    bool clear;
 };
 
 static void
@@ -56,6 +57,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
+    ram_flags |= fb->clear ? RAM_CLEAR : 0;
     memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
                                      backend->size, fb->align, ram_flags,
                                      fb->mem_path, fb->readonly, errp);
@@ -168,6 +170,21 @@ static void file_memory_backend_set_readonly(Object *obj, bool value,
     fb->readonly = value;
 }
 
+static bool file_memory_backend_get_clear(Object *obj, Error **errp)
+{
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(obj);
+
+    return fb->clear;
+}
+
+static void file_memory_backend_set_clear(Object *obj, bool value,
+                                             Error **errp)
+{
+    HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(obj);
+
+    fb->clear = value;
+}
+
 static void file_backend_unparent(Object *obj)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
@@ -204,6 +221,9 @@ file_backend_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "readonly",
         file_memory_backend_get_readonly,
         file_memory_backend_set_readonly);
+    object_class_property_add_bool(oc, "clear",
+        file_memory_backend_get_clear,
+        file_memory_backend_set_clear);
 }
 
 static void file_backend_instance_finalize(Object *o)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..3345db5241 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -232,6 +232,9 @@ typedef struct IOMMUTLBEvent {
 /* RAM that isn't accessible through normal means. */
 #define RAM_PROTECTED (1 << 8)
 
+/* Clear these pages when mapping */
+#define RAM_CLEAR (1 << 9)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..2c4aa5b0d5 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -629,6 +629,8 @@
 #         specify the required alignment via this option.
 #         0 selects a default alignment (currently the page size). (default: 0)
 #
+# @clear: if true, the memory is memset to 0 during init. (default: false)
+#
 # @discard-data: if true, the file contents can be destroyed when QEMU exits,
 #                to avoid unnecessarily flushing data to the backing file. Note
 #                that ``discard-data`` is only an optimization, and QEMU might
@@ -649,6 +651,7 @@
 { 'struct': 'MemoryBackendFileProperties',
   'base': 'MemoryBackendProperties',
   'data': { '*align': 'size',
+            '*clear': 'bool',
             '*discard-data': 'bool',
             'mem-path': 'str',
             '*pmem': { 'type': 'bool', 'if': 'CONFIG_LIBPMEM' },
diff --git a/qemu-options.hx b/qemu-options.hx
index beeb4475ba..6c8345c62e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4859,7 +4859,7 @@ SRST
     they are specified. Note that the 'id' property must be set. These
     objects are placed in the '/objects' path.
 
-    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
+    ``-object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off,clear=on|off,discard-data=on|off,merge=on|off,dump=on|off,prealloc=on|off,host-nodes=host-nodes,policy=default|preferred|bind|interleave,align=align,readonly=on|off``
         Creates a memory file backend object, which can be used to back
         the guest RAM with huge pages.
 
@@ -4886,6 +4886,8 @@ SRST
         Documentation/vm/numa\_memory\_policy.txt on the Linux kernel
         source tree for additional details.
 
+        Setting clear=on will make QEMU memset the backend to 0.
+
         Setting the ``discard-data`` boolean option to on indicates that
         file contents can be destroyed when QEMU exits, to avoid
         unnecessarily flushing data to the backing file. Note that
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index df54b917a9..573c686fd1 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1409,6 +1409,10 @@ static void *file_ram_alloc(RAMBlock *block,
         return NULL;
     }
 
+    if (block->flags & RAM_CLEAR) {
+        memset(area, 0, memory);
+    }
+
     block->fd = fd;
     return area;
 }
@@ -1868,7 +1872,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
 
     /* Just support these ram flags by now. */
     assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
-                          RAM_PROTECTED)) == 0);
+                          RAM_PROTECTED | RAM_CLEAR)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
-- 
2.20.1


