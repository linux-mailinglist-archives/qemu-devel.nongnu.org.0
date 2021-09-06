Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA50401C32
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:22:48 +0200 (CEST)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEaF-0003yu-DD
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPE-0000hq-RJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPC-0007UV-Q1
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q11so9788194wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dln8prTmajRRRjGUQwEQEBEP968IxcO7qYkDNzD6MX0=;
 b=CQtguAQLtP3JfNtKV3aARGJtaS3JHxouHp0z3NSx0CUb+We08UKVmbP2ZFPofmGNsJ
 FuTIN1lloK1QrTjxRoyl4PIBIzQP7NPeaPzpWLFgI1GP9ggI7JqKS9RYf1rKlK7mQs4p
 1ZFt0C4gMDNzBJtnt7ZmmMV4FxiCcKp0UuhLaSvN+pXrDgP6Me+Bg/wVGDb0/uBPyOVm
 XxryCQcEwK0UrBy7ScWpHj22yocgqwIv2fR9dNRxAiZP08N/m0WMYr2T5k8bVi/lIIom
 ZfUVJtt9w9JDdamt1TVbFVu1Y2jZE0q9EoPAWlLDl1lXkHX++t3LvoJpV1LFU1mv8gmi
 hQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dln8prTmajRRRjGUQwEQEBEP968IxcO7qYkDNzD6MX0=;
 b=d5AJv8WAD9jTqQO5Nn0KApvy35/GUoKQEHsU1PGJGDx/cDXWrilyFOzUM7ubi0tIlk
 JagXVOrs7SUXSbv74T5JRAE2PcY9B+3c+pli+AlwhrUubzkbFtxJwZASvonP7GsyilwA
 cQS8BIYuMLdyCK+L12L/HWKv6Rt0/dDmpEWWwWiP/PeyJey3+zwMN2GD84326pACPpcl
 RveCISeO/YFp7+kDHjbq3mvcqxkqBolAg3SncNZNpbu3jeIxx6W6EnAnQTQZO76pIxyH
 3pAXsp+mNKb7d5RbIfMIQhMWWmk4lEURumdRIoSrnKjUc+fjavscNEtQ8sIyvOAZZ9Qw
 LMnQ==
X-Gm-Message-State: AOAM532Di48sSzPgBAUGhzpKQPuWU2jXGUyBaoDbZ1gHbQ1Ur9duBqt4
 gOB8MrMpC4x0Ay61obcOohvPvmUQcGI=
X-Google-Smtp-Source: ABdhPJwR8Kg6TIFTj4LBRELpc5to6eFcdkN4ABVdiTN0gIBGp3AQduJN2VUlBmGkBNWwF1Rmy3kfNw==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr13618597wrm.429.1630933880441; 
 Mon, 06 Sep 2021 06:11:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/36] hostmem: Add hostmem-epc as a backend for SGX EPC
Date: Mon,  6 Sep 2021 15:10:33 +0200
Message-Id: <20210906131059.55234-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
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
Message-Id: <20210719112136.57018-3-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.31.1



