Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1041AF8C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:59:26 +0200 (CEST)
Received: from localhost ([::1]:46322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVChh-0006Or-E3
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa3-0006OZ-JN
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa1-0001M8-Bj
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:31 -0400
Received: by mail-ed1-x52f.google.com with SMTP id dn26so5832713edb.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6Lr8ErbwMyyYfXEZLpi47v8UMegyeRPBkfE+yqfiHU=;
 b=LHAedOQGHuQj2um+8zFKwYCn93thhGbF9UmVN9ZriML0pAz4ezxq0JuokiVTljFkrn
 1N34wrXtFHcznF2TM7xwec539wIL3ToukIdZXwk65SYnZlG5GPCfdWDlmtA74XRaG5Jd
 IuQArWqq2s33pl+uQuNkYsz5m+0X6bK80s2WSuvb5VzRklEaFZt/8ucbcok9ZgTRIyA4
 kwMkc1BMwg9fOiK2n9+M7ifoJheYnXlEiOs8jLjLGl4mMKCnI5MQaHqWsyznzSAvKMD8
 6ZTem1XCwRIQx+TgcCauy0iAoWejD5PN82AQW61SPmHZ3ScdGoPvw9Vxp/mdVxsaVbaz
 ysFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T6Lr8ErbwMyyYfXEZLpi47v8UMegyeRPBkfE+yqfiHU=;
 b=gi2HDLqI8qxFyEm9HLab0C2FKbBLrLbDmEOB0EkcabzLTxvun18LGIDQUEahmThbvW
 4+hxzCIbOZo78tYArIeYmMnPDNrmLJGacC8nSA4gFb8/VWqDLIWuhT848dU3+bZEJarc
 vFgzcbovsRkNPck3wW4g4tXoGCaaBes9DDehsO1D/Ei4uFlZLGdnT35jtC/+Ptlqe84A
 aDppQK832UumgvNJ7a445CvW5xB+yANnk5TWpqBPlTK4FTOt6usdDxUUm7cXoAtJfqJk
 X8KUYdt+kWoTA0zZYRxFNgVtWEH7pFMHy1o+1MWQK29JCouZMuEkR5+rf4J0mL8O2S1E
 oQeA==
X-Gm-Message-State: AOAM533aoBeHCoMkfxipC+nBQFFpq2xM36gx5mqNwYk4ZiYh6s6BSd48
 6y5aZWzyXiAGKJCs4lJUAvJ9EhCv7SY=
X-Google-Smtp-Source: ABdhPJyUOx0QpKktPaQaRi7uS+3dZkp+ADtM853RaFSztuT97ia0hulKf/tQLGt+RTtqvNYq5vgNPw==
X-Received: by 2002:a17:906:12d4:: with SMTP id
 l20mr6063378ejb.43.1632833481224; 
 Tue, 28 Sep 2021 05:51:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] hostmem: Add hostmem-epc as a backend for SGX EPC
Date: Tue, 28 Sep 2021 14:50:46 +0200
Message-Id: <20210928125116.183620-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Message-Id: <20210719112136.57018-3-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/hostmem-epc.c        | 82 +++++++++++++++++++++++++++++++++++
 backends/meson.build          |  1 +
 include/hw/i386/hostmem-epc.h | 28 ++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 include/hw/i386/hostmem-epc.h

diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
new file mode 100644
index 0000000000..b47f98b6a3
--- /dev/null
+++ b/backends/hostmem-epc.c
@@ -0,0 +1,82 @@
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
+#include "hw/i386/hostmem-epc.h"
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
index d4221831fc..6e68945528 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -16,5 +16,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
+softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
diff --git a/include/hw/i386/hostmem-epc.h b/include/hw/i386/hostmem-epc.h
new file mode 100644
index 0000000000..846c726085
--- /dev/null
+++ b/include/hw/i386/hostmem-epc.h
@@ -0,0 +1,28 @@
+/*
+ * SGX EPC backend
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_HOSTMEM_EPC_H
+#define QEMU_HOSTMEM_EPC_H
+
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
+#endif
-- 
2.31.1



