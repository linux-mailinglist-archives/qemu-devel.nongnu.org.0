Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA9379FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:31:57 +0200 (CEST)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLvw-00005B-UZ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLru-0005nj-I8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:46 -0400
Received: from mga11.intel.com ([192.55.52.93]:52336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrh-0004di-Dj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:43 -0400
IronPort-SDR: BbzTHqiBx1w+21nsqrivxsT9BDZte8DqWI7MUYLFQvOdodEvRJbl9m1GpqFzN7ENexFA0qUzGa
 vv++psL8eYTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196274765"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196274765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:27 -0700
IronPort-SDR: GMz6U3rHhOjEiO5Etx+mA4e3iUb4UHjo7AVAjAutJuhSPcHaKUOr4Pjpr3ynm+SDFSTPkn1Z7O
 icSsU/8ydaTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281033"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:25 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/32] hostmem: Add hostmem-epc as a backend for SGX EPC
Date: Tue, 11 May 2021 14:20:21 +0800
Message-Id: <20210511062051.41948-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

EPC (Enclave Page Cahe) is a specialized type of memory used by Intel
SGX (Software Guard Extensions).  The SDM desribes EPC as:

    The Enclave Page Cache (EPC) is the secure storage used to store
    enclave pages when they are a part of an executing enclave. For an
    EPC page, hardware performs additional access control checks to
    restrict access to the page. After the current page access checks
    and translations are performed, the hardware checks that the EPC
    page is accessible to the program currently executing. Generally an
    EPC page is only accessed by the owner of the executing enclave or
    an instruction which is setting up an EPC page.

Because of its unique requirements, Linux manages EPC separately from
normal memory.  Similar to memfd, the device /dev/sgx_vepc can be
opened to obtain a file descriptor which can in turn be used to mmap()
EPC memory.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Unified the "share" and "protected" arguments with ram_flags in the
     memory_region_init_ram_from_fd()(Paolo).
---
 backends/hostmem-epc.c | 92 ++++++++++++++++++++++++++++++++++++++++++
 backends/meson.build   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 backends/hostmem-epc.c

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
new file mode 100644
index 0000000000..b512a68cb0
--- /dev/null
+++ b/backends/hostmem-epc.c
@@ -0,0 +1,92 @@
+/*
+ * QEMU host SGX EPC memory backend
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include <sys/ioctl.h>
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qom/object_interfaces.h"
+#include "qapi/error.h"
+#include "sysemu/hostmem.h"
+
+#define TYPE_MEMORY_BACKEND_EPC "memory-backend-epc"
+
+#define MEMORY_BACKEND_EPC(obj)                                        \
+    OBJECT_CHECK(HostMemoryBackendEpc, (obj), TYPE_MEMORY_BACKEND_EPC)
+
+typedef struct HostMemoryBackendEpc HostMemoryBackendEpc;
+
+struct HostMemoryBackendEpc {
+    HostMemoryBackend parent_obj;
+};
+
+static void
+sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
+{
+    uint32_t ram_flags;
+    char *name;
+    int fd;
+
+    if (!backend->size) {
+        error_setg(errp, "can't create backend with size 0");
+        return;
+    }
+
+    fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
+    if (fd < 0) {
+        error_setg_errno(errp, errno,
+                         "failed to open /dev/sgx_vepc to alloc SGX EPC");
+        return;
+    }
+
+    name = object_get_canonical_path(OBJECT(backend));
+    ram_flags = (backend->share ? RAM_SHARED : 0) | RAM_PROTECTED;
+    memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
+                                   name, backend->size, ram_flags,
+                                   fd, 0, errp);
+    g_free(name);
+}
+
+static void sgx_epc_backend_instance_init(Object *obj)
+{
+    HostMemoryBackend *m = MEMORY_BACKEND(obj);
+
+    m->share = true;
+    m->merge = false;
+    m->dump = false;
+}
+
+static void sgx_epc_backend_class_init(ObjectClass *oc, void *data)
+{
+    HostMemoryBackendClass *bc = MEMORY_BACKEND_CLASS(oc);
+
+    bc->alloc = sgx_epc_backend_memory_alloc;
+}
+
+static const TypeInfo sgx_epc_backed_info = {
+    .name = TYPE_MEMORY_BACKEND_EPC,
+    .parent = TYPE_MEMORY_BACKEND,
+    .instance_init = sgx_epc_backend_instance_init,
+    .class_init = sgx_epc_backend_class_init,
+    .instance_size = sizeof(HostMemoryBackendEpc),
+};
+
+static void register_types(void)
+{
+    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
+    if (fd >= 0) {
+        close(fd);
+
+        type_register_static(&sgx_epc_backed_info);
+    }
+}
+
+type_init(register_types);
diff --git a/backends/meson.build b/backends/meson.build
index d4221831fc..46fd16b269 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -16,5 +16,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
+softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
-- 
2.29.2.334.gfaefdd61ec


