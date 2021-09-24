Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A94170D6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:27:50 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjMr-0002F3-PP
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKS-0007bP-JK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKP-0000Oo-Kn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:20 -0400
Received: by mail-ed1-x52e.google.com with SMTP id v24so34820387eda.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95NMlpuMXDUhR24A45FTB4Ijm/sQEfc61ftCTgPEnVU=;
 b=VgGn+Cg/dGXeU466mhGHcz4LuTsZGt1gMI4nhjP4PHtCn6/6NlqWVksVREWXZTEg+H
 0DuZBKJhnegsQwv/Dvzrp3lAB9R45JO1OZH65dUbsKenbqgWWN2E8VIq3u3M5/4Gzyou
 KOksD3xEbv11lZq+9br3etf8hOA8wHh3gPhSUODq7a8xsOan6GDWSMiP5uU45VvBOdkp
 IEgMZIvU6URKWlVMBWiB9/IcNozj11lGcouVClG8p31aqj9vuuPVYHG9L0njf/9bPQtZ
 xkXkbvvt0gilSnus/lEKxCEWMXPmg4U9xGfqN70M+ahxoSIitvD7zuCZoZqcEn7tGGxH
 35Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=95NMlpuMXDUhR24A45FTB4Ijm/sQEfc61ftCTgPEnVU=;
 b=ASdMCqlStoKu5OJWWL3dXW/3MHT7V8rMWTAkQ0nza6ZvkebZHr7e9tnIWQBQfkJI4z
 XafLfEfgn71dlHmnURrYzC1AS+mVg1a1uHoX9fiTPHEZqSwJYzBqzuPMp1X2sMqAqhdw
 Nr++nFNmCjO3Ez04P93R5RMJad1PT84FX1Ea+AeuIwySTMDI6lwJ5xk3hWRZHGvZUyRk
 8yo+va4+KOe1JG4+lgv0BLhR0f2X5G01s//7f/YCgl7GWT0f7h1GkFML28z2p4oFHk/l
 woFoAi+rcfsNM4n5iwNtQ7CU+OIoG0YImu7AZnXZykK+EZnQm6/RWoWpVg0jp5c2O49c
 4acg==
X-Gm-Message-State: AOAM533rxLVpZpP4yOK89iEWPgiH1OyzSbYK4OgnGygxZ9wo3GD8RATo
 eEGY8mUSayVTB2Lp4lNt8e3tuiaZXAc=
X-Google-Smtp-Source: ABdhPJw85AMhwFlTKAtK6DP+WYTuWzY2miXyltKTZH6Tho/ChVi0goxbeiZtNl9LtBHTjNOiio9W2g==
X-Received: by 2002:a17:906:6dc1:: with SMTP id
 j1mr10802734ejt.324.1632482715806; 
 Fri, 24 Sep 2021 04:25:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/26] vl: Add sgx compound properties to expose SGX EPC
 sections to guest
Date: Fri, 24 Sep 2021 13:24:49 +0200
Message-Id: <20210924112509.25061-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
realized prior to realizing the vCPUs themselves, i.e. long before
generic devices are parsed and realized.  From a virtualization
perspective, the CPUID aspect also means that EPC sections cannot be
hotplugged without paravirtualizing the guest kernel (hardware does
not support hotplugging as EPC sections must be locked down during
pre-boot to provide EPC's security properties).

So even though EPC sections could be realized through the generic
-devices command, they need to be created much earlier for them to
actually be usable by the guest.  Place all EPC sections in a
contiguous block, somewhat arbitrarily starting after RAM above 4g.
Ensuring EPC is in a contiguous region simplifies calculations, e.g.
device memory base, PCI hole, etc..., allows dynamic calculation of the
total EPC size, e.g. exposing EPC to guests does not require -maxmem,
and last but not least allows all of EPC to be enumerated in a single
ACPI entry, which is expected by some kernels, e.g. Windows 7 and 8.

The new compound properties command for sgx like below:
 ......
 -object memory-backend-epc,id=mem1,size=28M,prealloc=on \
 -object memory-backend-epc,id=mem2,size=10M \
 -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-6-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx-epc.c         | 20 ++++++++++++++------
 hw/i386/x86.c             | 29 +++++++++++++++++++++++++++++
 include/hw/i386/pc.h      |  3 +++
 include/hw/i386/sgx-epc.h | 14 ++++++++++++++
 include/hw/i386/x86.h     |  1 +
 qapi/machine.json         | 26 ++++++++++++++++++++++++++
 qemu-options.hx           | 10 ++++++++--
 7 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index c584acc17b..6677dc74b5 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -14,13 +14,8 @@
 #include "hw/i386/sgx-epc.h"
 #include "hw/mem/memory-device.h"
 #include "hw/qdev-properties.h"
-#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/config-file.h"
-#include "qemu/error-report.h"
-#include "qemu/option.h"
-#include "qemu/units.h"
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
 
@@ -56,6 +51,8 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MemoryDeviceState *md = MEMORY_DEVICE(dev);
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     SGXEPCDevice *epc = SGX_EPC(dev);
     HostMemoryBackend *hostmem;
     const char *path;
@@ -77,7 +74,18 @@ static void sgx_epc_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    error_setg(errp, "'" TYPE_SGX_EPC "' not supported");
+    epc->addr = sgx_epc->base + sgx_epc->size;
+
+    memory_region_add_subregion(&sgx_epc->mr, epc->addr - sgx_epc->base,
+                                host_memory_backend_get_memory(hostmem));
+
+    host_memory_backend_set_mapped(hostmem, true);
+
+    sgx_epc->sections = g_renew(SGXEPCDevice *, sgx_epc->sections,
+                                sgx_epc->nr_sections + 1);
+    sgx_epc->sections[sgx_epc->nr_sections++] = epc;
+
+    sgx_epc->size += memory_device_get_region_size(md, errp);
 }
 
 static void sgx_epc_unrealize(DeviceState *dev)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 00448ed55a..41ef9a84a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -30,6 +30,8 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
 #include "sysemu/qtest.h"
 #include "sysemu/whpx.h"
@@ -1263,6 +1265,27 @@ static void x86_machine_set_bus_lock_ratelimit(Object *obj, Visitor *v,
     visit_type_uint64(v, name, &x86ms->bus_lock_ratelimit, errp);
 }
 
+static void machine_get_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    SgxEPCList *list = x86ms->sgx_epc_list;
+
+    visit_type_SgxEPCList(v, name, &list, errp);
+}
+
+static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    SgxEPCList *list;
+
+    list = x86ms->sgx_epc_list;
+    visit_type_SgxEPCList(v, name, &x86ms->sgx_epc_list, errp);
+
+    qapi_free_SgxEPCList(list);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
@@ -1322,6 +1345,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
                                 x86_machine_set_bus_lock_ratelimit, NULL, NULL);
     object_class_property_set_description(oc, X86_MACHINE_BUS_LOCK_RATELIMIT,
             "Set the ratelimit for the bus locks acquired in VMs");
+
+    object_class_property_add(oc, "sgx-epc", "SgxEPC",
+        machine_get_sgx_epc, machine_set_sgx_epc,
+        NULL, NULL);
+    object_class_property_set_description(oc, "sgx-epc",
+        "SGX EPC device");
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 4d2e35a152..668e48be8a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -12,6 +12,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/hotplug.h"
 #include "qom/object.h"
+#include "hw/i386/sgx-epc.h"
 
 #define HPET_INTCAP "hpet-intcap"
 
@@ -49,6 +50,8 @@ typedef struct PCMachineState {
 
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
+
+    SGXEPCState sgx_epc;
 } PCMachineState;
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
index cf3ed5c0cd..83269972e0 100644
--- a/include/hw/i386/sgx-epc.h
+++ b/include/hw/i386/sgx-epc.h
@@ -41,4 +41,18 @@ typedef struct SGXEPCDevice {
     HostMemoryBackendEpc *hostmem;
 } SGXEPCDevice;
 
+/*
+ * @base: address in guest physical address space where EPC regions start
+ * @mr: address space container for memory devices
+ */
+typedef struct SGXEPCState {
+    uint64_t base;
+    uint64_t size;
+
+    MemoryRegion mr;
+
+    struct SGXEPCDevice **sections;
+    int nr_sections;
+} SGXEPCState;
+
 #endif
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 6e9244a82c..23267a3674 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -62,6 +62,7 @@ struct X86MachineState {
     unsigned pci_irq_mask;
     unsigned apic_id_limit;
     uint16_t boot_cpus;
+    SgxEPCList *sgx_epc_list;
 
     OnOffAuto smm;
     OnOffAuto acpi;
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..5132abf152 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1194,6 +1194,32 @@
           }
 }
 
+##
+# @SgxEPC:
+#
+# Sgx EPC cmdline information
+#
+# @memdev: memory backend linked with device
+#
+# Since: 6.2
+##
+{ 'struct': 'SgxEPC',
+  'data': { 'memdev': 'str' }
+}
+
+##
+# @SgxEPCProperties:
+#
+# Properties for SgxEPC objects.
+#
+# @sgx-epc: sgx epc section properties.
+#
+# Since: 6.2
+##
+{ 'struct': 'SgxEPCProperties',
+  'data': { 'sgx-epc': ['SgxEPC'] }
+}
+
 ##
 # @MemoryDeviceInfo:
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e6..ceca52818a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -126,8 +126,14 @@ SRST
             -m 512M
 ERST
 
-HXCOMM Deprecated by -machine
-DEF("M", HAS_ARG, QEMU_OPTION_M, "", QEMU_ARCH_ALL)
+DEF("M", HAS_ARG, QEMU_OPTION_M,
+    "                sgx-epc.0.memdev=memid\n",
+    QEMU_ARCH_ALL)
+
+SRST
+``sgx-epc.0.memdev=@var{memid}``
+    Define an SGX EPC section.
+ERST
 
 DEF("cpu", HAS_ARG, QEMU_OPTION_cpu,
     "-cpu cpu        select CPU ('-cpu help' for list)\n", QEMU_ARCH_ALL)
-- 
2.31.1



