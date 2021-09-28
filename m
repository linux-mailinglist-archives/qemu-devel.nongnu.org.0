Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5741AF8E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:59:45 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVChz-0007W7-Vx
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa3-0006OY-8K
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:33 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa1-0001La-1J
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:30 -0400
Received: by mail-ed1-x530.google.com with SMTP id s17so64107110edd.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4mT6xXkpc8blw20HU3aytQAk+55YTpi/iG5uUvlQ984=;
 b=U8fCiNfK0h8vVypCQlVbdOuMOYtafsuaLH+G6t9L1ve5eeoVJUvy3E/5QrYeQjObNa
 c5JL+pfpn/dHDewH0O/RKsGrvWf/Sccliud7+UTMMTYVsU/rSMmdh+tqAt/SvGKb6ldg
 dTgkRacNfQS79Duhok40WiVvfJ3+Zc9iCRQBdcSAhDmTFXmMT74lPhbO35/o2XGovGnt
 g7sckgzb88i2ZdHmrDNHGh9QdUBuEwRrmB8fxG2YINnc2ACyDdlckCqZj5/A6st1txGh
 R2uPEzrjTCfUqyQL7DMnl+b1IwtHDr1D1gUcoShvSPoLmVyu54C9311EAy5VmZJeCDh6
 wMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4mT6xXkpc8blw20HU3aytQAk+55YTpi/iG5uUvlQ984=;
 b=Q9wtyOdCGq+2yfQdxFnR6JxURT7NS+MwHY5Vptxzy+eP3FRUCUMG4gLtlMd2Rs19h0
 BO/cpc5SxU/0VM1ln+ULXhOShZ4dhZ2u5SnSicpKZCHCSbxKclyZ9qgo21FnhD0OaxR5
 tVLCMpcbyF3ixr9rbvMUKKm3Owl7UJoPBXIMNOsKvP/fks8qDkEz3HFVXA35lgsWTjp6
 4IjLsAcYWxDJybbwOuZdmItulkOgMz2OsHrgdgWCX2KNWEmR+RWjEpGDctLLoximHTM3
 BJkcWsnq0g6rWZCo8dSNlIfsW4BTV+Vp4u5J79mVc7acvpVszG0ExbtFT+MPiG/T7ZRz
 6P6Q==
X-Gm-Message-State: AOAM531TKpfAVGkaxuCMMj62uuYvyiXyeSFK4zIsk8GNOOfDu1AEMeLx
 hNyv5L65NXuPw+Ue94ErGbVRbkUDqj4=
X-Google-Smtp-Source: ABdhPJxPMLnK73Kj0wmL0xGEyQd3Gw++fAuFpGWRV0ZK9dv2es8qyuaS6l/fuTY61hOdNdLmWBea+g==
X-Received: by 2002:a17:906:7d83:: with SMTP id
 v3mr6677412ejo.216.1632833483583; 
 Tue, 28 Sep 2021 05:51:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] vl: Add sgx compound properties to expose SGX EPC
 sections to guest
Date: Tue, 28 Sep 2021 14:50:49 +0200
Message-Id: <20210928125116.183620-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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
 qapi/machine.json         | 26 +++++++++++++++++++++++++-
 qemu-options.hx           | 10 ++++++++--
 7 files changed, 94 insertions(+), 9 deletions(-)

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
index 32d47f4e35..26c539fe2c 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1225,7 +1225,6 @@
 ##
 { 'struct': 'VirtioMEMDeviceInfoWrapper',
   'data': { 'data': 'VirtioMEMDeviceInfo' } }
-
 ##
 # @MemoryDeviceInfo:
 #
@@ -1246,6 +1245,31 @@
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
+  'data': { 'memdev': 'str' } }
+
+##
+# @SgxEPCProperties:
+#
+# SGX properties of machine types.
+#
+# @sgx-epc: list of ids of memory-backend-epc objects.
+#
+# Since: 6.2
+##
+{ 'struct': 'SgxEPCProperties',
+  'data': { 'sgx-epc': ['SgxEPC'] }
+}
+
 ##
 # @query-memory-devices:
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



