Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1656476F1E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:49:15 +0100 (CET)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoK3-0002z9-2L
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mxoHl-0008Rg-6C
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:46:54 -0500
Received: from [2a00:1450:4864:20::136] (port=37551
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mxoHj-0003Lz-6m
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:46:52 -0500
Received: by mail-lf1-x136.google.com with SMTP id c32so48923821lfv.4
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 02:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8hC57Zk7fXOc3sduHbFd/yh6uJwyBHoagTvV+dWSgM=;
 b=NVbUtYGaF2bsaZLq3dx1hWaY5mEV9PCncEvBuaMrN9gH8vyIF27MvokYmvGx4nz/nX
 3/Woi3RvoQ1vkrJtGl+wpK9uTpUVA3ZogndalBPh0xPFXXH5A2v+Ewms/ia5Zumm5LQK
 s5CMIPc1bzVXeh6PEPw8flsazP29yrZFfIMog2v/TgYIsNgNUeDBA+wOkoAzprA3qA0X
 1fg3kOmaa5Vvv4mUV+Sr0yFajakk668VVrQ2oqG/Fkzzyox+JMk6uqWAfjdx8f3oO1hB
 4HLc6+xAcfP1oso0FJ7BaU0KIGBuCrWN53aAoX5PfDtq+kFdaMGALWFnraZdWlTt2kDn
 nrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8hC57Zk7fXOc3sduHbFd/yh6uJwyBHoagTvV+dWSgM=;
 b=vzkXCQruseVccxnl8pLnuxa5D4f9ZHtAJK0A7rBPwYPkbcPrrwlMoHxLmJgnuJ9y1x
 JRdK9LL0/amZn/qGQFR0XINWDdS1lkyMZlEsNQ/DKhWWiCkxlJPIIBzMPnhgCIFjSuPH
 Jj589stsb54x5vAaKs81VtLZupiUA0l2lNd4PGlVaQjtWptM6fBBHyfXmFN2HgGGPJYh
 S69QRVTAeawgefXDcsRqCGxyD4y2xH8rmxWwpJTLXPAl20rcywZPZ2puiY6Em85BXKC2
 /CkGbiJhtAs9zdU+8QiRWe4+kZsoMXTm8NdBSh10sI1HH2fy18xy5DAeL3nuLYPNowA4
 ZCKQ==
X-Gm-Message-State: AOAM530lcTO0wojDmZXMW2NzauTquSEH1BDLK81SB8Nl+GrjGjN4GtxH
 fFF0G6JbLrTa1U1BCTplm/PPgl5ShjJsWhu2
X-Google-Smtp-Source: ABdhPJzCK8zaMlWhc40pGing1yQ4ZxmzwMrkajV+1M1KM4b4x/f22ZmlQbklXVhj9hpXTek9lQI8Pg==
X-Received: by 2002:a05:6512:3f28:: with SMTP id
 y40mr14043506lfa.609.1639651607810; 
 Thu, 16 Dec 2021 02:46:47 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id b6sm1018908ljr.103.2021.12.16.02.46.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Dec 2021 02:46:47 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7] isa-applesmc: provide OSK forwarding on Apple hosts
Date: Thu, 16 Dec 2021 13:46:21 +0300
Message-Id: <20211216104621.85108-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, f4bug@amsat.org,
 laurent@vivier.eu, r.bolshakov@yadro.com, agraf@csgraf.de, pbonzini@redhat.com,
 gsomlo@gmail.com, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apple hosts we can read AppleSMC OSK key directly from host's
SMC and forward this value to QEMU Guest.

New 'hostosk' property is added:
  `-device isa-applesmc,hostosk=on`
The property is set to 'on' by default for machine version > 6.2

Apple licence allows use and run up to two additional copies
or instances of macOS operating system within virtual operating system
environments on each Apple-branded computer that is already running
the Apple Software, for purposes of:
  * software development
  * testing during software development
  * using macOS Server
  * personal, non-commercial use

Guest macOS requires AppleSMC with correct OSK. The most legal
way to pass it to the Guest is to forward the key from host SMC
without any value exposion.

Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 hw/arm/virt.c              |   1 +
 hw/core/machine.c          |   5 ++
 hw/i386/pc_piix.c          |   1 +
 hw/i386/pc_q35.c           |   1 +
 hw/m68k/virt.c             |   1 +
 hw/misc/applesmc.c         | 123 ++++++++++++++++++++++++++++++++++++-
 hw/ppc/spapr.c             |   1 +
 hw/s390x/s390-virtio-ccw.c |   1 +
 include/hw/boards.h        |   3 +
 9 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..4d6b72fe6f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2858,6 +2858,7 @@ type_init(machvirt_machine_init);
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc56..afa871378e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,11 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_2[] = {
+    { "isa-applesmc", "hostosk", "off" }
+};
+const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
+
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
     { "nvme-ns", "shared", "off" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 223dd3e05d..1c2ab5222e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -420,6 +420,7 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
     m->alias = "pc";
     m->is_default = true;
     pcmc->default_cpu_version = 1;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 
 DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e1e100316d..7186d736d3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -366,6 +366,7 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
     pc_q35_machine_options(m);
     m->alias = "q35";
     pcmc->default_cpu_version = 1;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 
 DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0efa4a45c7..10281a81c5 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -306,6 +306,7 @@ type_init(virt_machine_register_types)
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 DEFINE_VIRT_MACHINE(6, 2, true)
 
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..72755db380 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -37,6 +37,11 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "qapi/error.h"
+
+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+#endif
 
 /* #define DEBUG_SMC */
 
@@ -109,6 +114,7 @@ struct AppleSMCState {
     uint8_t data_pos;
     uint8_t data[255];
     char *osk;
+    bool hostosk;
     QLIST_HEAD(, AppleSMCData) data_def;
 };
 
@@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops = {
     },
 };
 
+#if defined(__APPLE__) && defined(__MACH__)
+/*
+ * Based on
+ * https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
+ */
+enum {
+    SMC_HANDLE_EVENT     = 2,
+    SMC_READ_KEY         = 5
+};
+
+struct AppleSMCParam {
+    uint32_t key;
+    uint8_t pad0[22];
+    IOByteCount data_size;
+    uint8_t pad1[10];
+    uint8_t command;
+    uint32_t pad2;
+    uint8_t bytes[32];
+};
+
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)
+{
+    assert(host_osk != NULL);
+
+    io_service_t hostsmc_service = IO_OBJECT_NULL;
+    io_connect_t hostsmc_connect = IO_OBJECT_NULL;
+    size_t smc_param_size = sizeof(struct AppleSMCParam);
+    IOReturn status = kIOReturnError;
+    int i;
+
+    struct AppleSMCParam smc_param[2] = {
+         {
+             .key = ('OSK0'),
+             .data_size = sizeof(smc_param[0].bytes),
+             .command = SMC_READ_KEY,
+         }, {
+             .key = ('OSK1'),
+             .data_size = sizeof(smc_param[0].bytes),
+             .command = SMC_READ_KEY,
+         },
+    };
+
+    hostsmc_service = IOServiceGetMatchingService(
+        kIOMasterPortDefault,
+        IOServiceMatching("AppleSMC"));
+    if (hostsmc_service == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to get host-AppleSMC service");
+        goto error;
+    }
+
+    status = IOServiceOpen(hostsmc_service,
+                           mach_task_self(),
+                           0,
+                           &hostsmc_connect);
+    if (status != kIOReturnSuccess || hostsmc_connect == IO_OBJECT_NULL) {
+        error_setg(errp, "Unable to open host-AppleSMC service");
+        goto error;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(smc_param); ++i) {
+        status = IOConnectCallStructMethod(
+                hostsmc_connect,
+                SMC_HANDLE_EVENT,
+                &smc_param[i],
+                sizeof(struct AppleSMCParam),
+                &smc_param[i],
+                &smc_param_size
+            );
+
+        if (status != kIOReturnSuccess) {
+            error_setg(errp, "Unable to read OSK from host-AppleSMC");
+            goto error;
+        }
+    }
+
+    memcpy(host_osk, smc_param[0].bytes, 32);
+    memcpy(host_osk + 32, smc_param[1].bytes, 32);
+
+    IOServiceClose(hostsmc_connect);
+    IOObjectRelease(hostsmc_service);
+    return true;
+
+error:
+    IOServiceClose(hostsmc_connect);
+    IOObjectRelease(hostsmc_service);
+    return false;
+}
+#else
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)
+{
+    error_setg(errp, "OSK read is not supported on this host");
+    return false;
+}
+#endif
+
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
@@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
-        warn_report("Using AppleSMC with invalid key");
+    if (s->osk && s->hostosk) {
+        error_setg(errp, "-osk property cannot be used with -hostosk=on");
+    }
+
+    if (!s->osk && !s->hostosk) {
         s->osk = default_osk;
+        warn_report("Using AppleSMC with default (dummy) OSK");
+    }
+
+    if (s->hostosk) {
+        s->osk = g_malloc0(65);
+        /* Fail hard if we cannot read requested host OSK */
+        if (!applesmc_read_host_osk(s->osk, errp)) {
+            g_assert_not_reached();
+        }
+    }
+
+    if (s->osk && strlen(s->osk) != 64) {
+        /* Only valid OSK is accepted within 'osk' property */
+        error_setg(errp, "Using AppleSMC with key of invalid length");
     }
 
     QLIST_INIT(&s->data_def);
@@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
                        APPLESMC_DEFAULT_IOBASE),
     DEFINE_PROP_STRING("osk", AppleSMCState, osk),
+    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b5fd749be..fefac898e6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4671,6 +4671,7 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
 static void spapr_machine_6_2_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 
 DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 653587ea62..3abb249c3d 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -797,6 +797,7 @@ static void ccw_machine_6_2_instance_options(MachineState *machine)
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
 {
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 DEFINE_CCW_MACHINE(6_2, "6.2", true);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c190104..b7b68471ff 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -375,6 +375,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_2[];
+extern const size_t hw_compat_6_2_len;
+
 extern GlobalProperty hw_compat_6_1[];
 extern const size_t hw_compat_6_1_len;
 
-- 
2.23.0


