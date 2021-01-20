Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5F2FDB43
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 22:01:08 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KbD-000194-ST
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 16:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVe-0005L2-Qt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVb-0006LM-Uh
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so3961718wmm.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+tVslsM8xLBzMjIoyI6BiAP2/abaKFwOyL/G4B8rLM=;
 b=PMAvcDtOUXM9GYNIerxTkYhgLHjQN6veWvSf1/EOjDDj9rvwn3AfOs7CmT+1z88+SV
 8dhMee3Om3OxIN2QVNzGIZ/UjbMSG2XVLHY/bVkhB+oFQoHK9vz/KYpgbUbshLN/VMBq
 4CfQ4Lm5I12KLwUpcJ5UqwsWoMDtAhb57GknlwJiagH567OPLtT9kQKqi7PCS5YaYBET
 /RixTNOJIlBCwN65xg31PJk8ncXj2cbVyBOwA5Tfxcw4NisqyXzcO2Zx+GyC8dfkToze
 DzvBVVtEN+fxF8aB8a7VZci8gOKvfO7kTQM3A2fZ9kcrm8H0C6oqgG3fmdicaSwAJId7
 BI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+tVslsM8xLBzMjIoyI6BiAP2/abaKFwOyL/G4B8rLM=;
 b=avBLu23k4znR1WMZa705Su+vosRp+X9LoP6NI/kGwH4B2bsOoliOi+rY813hor2J+/
 a8rHAqOPoNA3dPnJKl4ZS1B0RbVIZANwvlFsUQPo3Gm45YdLSlk5kElR1bi7EdfI8zoi
 ntBCrDJojP32+CfMg9wIHWRLVWw1WVADODVIUdtrJs+jOKSNzWlAOpvMs8StyqVNwgB/
 c78jwjqx80t45KeekoGYjKsPM3FJpxkAHyEajHuUdf+iQwWfnUsRk6M9XwL18paa7/yz
 iPzjaWcthT29n5K+kjp8NXAoeGOSOCMv5KndNL2Kzx7igX8bBhv0TxOlk3cAmhqlvDMn
 dcYA==
X-Gm-Message-State: AOAM530y8dtIx/Ry8lRAZYRctRBb4ZJ6P2sIAXjZ/mxerl9TM+dj9dPn
 Qxle2+wdkE1gzkia7iAt+kE=
X-Google-Smtp-Source: ABdhPJyL/tnSPozD1BtYlv+4yMNWB9H+e5XYfxl3NBz77etZ9SHE0VPEnJK7tHi2HdqRc3aXRNeUFw==
X-Received: by 2002:a1c:18d:: with SMTP id 135mr4775510wmb.33.1611176117882;
 Wed, 20 Jan 2021 12:55:17 -0800 (PST)
Received: from lb-xps.. ([176.230.215.91])
 by smtp.gmail.com with ESMTPSA id k10sm5614823wrq.38.2021.01.20.12.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:55:17 -0800 (PST)
From: Leonid Bloch <lb.workbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 3/4] hw/acpi: Introduce the QEMU AC adapter
Date: Wed, 20 Jan 2021 22:55:00 +0200
Message-Id: <20210120205501.33918-4-lb.workbox@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120205501.33918-1-lb.workbox@gmail.com>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=lb.workbox@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonid Bloch <lb.workbox@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AC adapter device communicates the host's AC adapter state to the
guest. The probing of the host's AC adapter state occurs on guest ACPI
requests, as well as on timed intervals. If a change of the host's AC
adapter state is detected on one of the timed probes (connected/disconnected)
an ACPI notification is sent to the guest, so it will be able to
update its AC adapter status accordingly.

The time interval between the periodic probes is 2 seconds by default.
A property 'probe_interval' allows to modify this value. The value
should be provided in milliseconds. A zero value disables the periodic
probes, and makes the AC adapter state updates occur on guest requests
only.

The host's AC adapter information is taken from the sysfs AC adapter
data, located in:

/sys/class/power_supply/[device of type "Mains"]

If the sysfs path differs, a different AC adapter needs to be probed,
or even if a "fake" host AC adapter is to be provided, a 'sysfs_path'
property allows to override the default one.

Signed-off-by: Leonid Bloch <lb.workbox@gmail.com>
---
 MAINTAINERS                          |   5 +
 docs/specs/acad.txt                  |  24 ++
 hw/acpi/Kconfig                      |   4 +
 hw/acpi/acad.c                       | 318 +++++++++++++++++++++++++++
 hw/acpi/meson.build                  |   1 +
 hw/acpi/trace-events                 |   5 +
 hw/i386/Kconfig                      |   1 +
 hw/i386/acpi-build.c                 |  52 +++++
 include/hw/acpi/acad.h               |  37 ++++
 include/hw/acpi/acpi_dev_interface.h |   1 +
 10 files changed, 448 insertions(+)
 create mode 100644 docs/specs/acad.txt
 create mode 100644 hw/acpi/acad.c
 create mode 100644 include/hw/acpi/acad.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 33eea28c22..1a3fc1dd56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2146,6 +2146,11 @@ M: Leonid Bloch <lb.workbox@gmail.com>
 S: Maintained
 F: hw/acpi/battery.*
 
+AC Adapter
+M: Leonid Bloch <lb.workbox@gmail.com>
+S: Maintained
+F: hw/acpi/acad.*
+
 Subsystems
 ----------
 Audio
diff --git a/docs/specs/acad.txt b/docs/specs/acad.txt
new file mode 100644
index 0000000000..0d563a7b50
--- /dev/null
+++ b/docs/specs/acad.txt
@@ -0,0 +1,24 @@
+AC ADAPTER DEVICE
+=================
+
+The AC adapter device communicates the host's AC adapter state to the
+guest. The probing of the host's AC adapter state occurs on guest ACPI
+requests, as well as on timed intervals. If a change of the host's AC
+adapter state is detected on one of the timed probes (connected/disconnected)
+an ACPI notification is sent to the guest, so it will be able to
+update its AC adapter status accordingly.
+
+The time interval between the periodic probes is 2 s by default.
+A property 'probe_interval' allows to modify this value. The value
+should be provided in milliseconds. A zero value disables the periodic
+probes, and makes the AC adapter state updates occur on guest requests
+only.
+
+The host's AC adapter information is taken from the sysfs AC adapter
+data, located in:
+
+/sys/class/power_supply/[device of type "Mains"]
+
+If the sysfs path differs, a different AC adapter needs to be probed,
+or even if a "fake" host AC adapter is to be provided, a 'sysfs_path'
+property allows to override the default one.
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 6b4c41037a..d35331fbf7 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -45,4 +45,8 @@ config BATTERY
     bool
     depends on ACPI
 
+config AC_ADAPTER
+    bool
+    depends on ACPI
+
 config ACPI_HW_REDUCED
diff --git a/hw/acpi/acad.c b/hw/acpi/acad.c
new file mode 100644
index 0000000000..279452e95f
--- /dev/null
+++ b/hw/acpi/acad.c
@@ -0,0 +1,318 @@
+/*
+ * QEMU emulated AC adapter device.
+ *
+ * Copyright (c) 2019 Janus Technologies, Inc. (http://janustech.com)
+ *
+ * Authors:
+ *     Leonid Bloch <lb.workbox@gmail.com>
+ *     Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+ *     Dmitry Fleytman <dmitry.fleytman@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory for details.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "hw/isa/isa.h"
+#include "hw/acpi/acpi.h"
+#include "hw/nvram/fw_cfg.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+#include "hw/acpi/acad.h"
+
+#define AC_ADAPTER_DEVICE(obj) OBJECT_CHECK(ACADState, (obj), \
+                                            TYPE_AC_ADAPTER)
+
+#define AC_STA_ADDR               0
+
+#define SYSFS_PATH                "/sys/class/power_supply"
+#define AC_ADAPTER_TYPE           "Mains"
+#define MAX_ALLOWED_TYPE_LENGTH   16
+
+enum {
+    AC_ADAPTER_OFFLINE = 0,
+    AC_ADAPTER_ONLINE = 1,
+};
+
+typedef struct ACADState {
+    ISADevice dev;
+    MemoryRegion io;
+    uint16_t ioport;
+    uint8_t state;
+
+    QEMUTimer *probe_state_timer;
+    uint64_t probe_state_interval;
+
+    char *acad_path;
+} ACADState;
+
+static const char *online_file = "online";
+static const char *type_file = "type";
+
+static inline bool acad_file_accessible(char *path, const char *file)
+{
+    char full_path[PATH_MAX];
+    int path_len;
+
+    path_len = snprintf(full_path, PATH_MAX, "%s/%s", path, file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        return false;
+    }
+
+    if (access(full_path, R_OK) == 0) {
+        return true;
+    }
+    return false;
+}
+
+static void acad_get_state(ACADState *s)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    uint8_t val;
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s", s->acad_path,
+                        online_file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        warn_report("Could not read the AC adapter state.");
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        warn_report("Could not read the AC adapter state.");
+        return;
+    }
+
+    if (!fscanf(ff, "%hhu", &val)) {
+        warn_report("AC adapter state unreadable.");
+    } else {
+        switch (val) {
+        case AC_ADAPTER_OFFLINE:
+        case AC_ADAPTER_ONLINE:
+            s->state = val;
+            break;
+        default:
+            warn_report("AC adapter state undetermined.");
+        }
+    }
+    fclose(ff);
+}
+
+static void acad_get_dynamic_status(ACADState *s)
+{
+    acad_get_state(s);
+
+    trace_acad_get_dynamic_status(s->state);
+}
+
+static void acad_probe_state(void *opaque)
+{
+    ACADState *s = opaque;
+
+    uint8_t state_before = s->state;
+
+    acad_get_dynamic_status(s);
+
+    if (state_before != s->state) {
+        Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
+        acpi_send_event(DEVICE(obj), ACPI_AC_ADAPTER_CHANGE_STATUS);
+    }
+    timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+              s->probe_state_interval);
+}
+
+static void acad_probe_state_timer_init(ACADState *s)
+{
+    if (s->probe_state_interval > 0) {
+        s->probe_state_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                            acad_probe_state, s);
+        timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  s->probe_state_interval);
+    }
+}
+
+static bool acad_verify_sysfs(ACADState *s, char *path)
+{
+    FILE *ff;
+    char type_path[PATH_MAX];
+    int path_len;
+    char val[MAX_ALLOWED_TYPE_LENGTH];
+
+    path_len = snprintf(type_path, PATH_MAX, "%s/%s", path, type_file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        return false;
+    }
+
+    ff = fopen(type_path, "r");
+    if (ff == NULL) {
+        return false;
+    }
+
+    if (fgets(val, MAX_ALLOWED_TYPE_LENGTH, ff) == NULL) {
+        fclose(ff);
+        return false;
+    } else {
+        val[strcspn(val, "\n")] = 0;
+        if (strncmp(val, AC_ADAPTER_TYPE, MAX_ALLOWED_TYPE_LENGTH)) {
+            fclose(ff);
+            return false;
+        }
+    }
+    fclose(ff);
+
+    return acad_file_accessible(path, online_file);
+}
+
+static bool get_acad_path(DeviceState *dev)
+{
+    ACADState *s = AC_ADAPTER_DEVICE(dev);
+    DIR *dir;
+    struct dirent *ent;
+    char bp[PATH_MAX];
+    int path_len;
+
+    if (s->acad_path) {
+        return acad_verify_sysfs(s, s->acad_path);
+    }
+
+    dir = opendir(SYSFS_PATH);
+    if (dir == NULL) {
+        return false;
+    }
+
+    ent = readdir(dir);
+    while (ent != NULL) {
+        if (ent->d_name[0] != '.') {
+            path_len = snprintf(bp, PATH_MAX, "%s/%s", SYSFS_PATH,
+                                ent->d_name);
+            if (path_len < 0 || path_len >= PATH_MAX) {
+                return false;
+            }
+            if (acad_verify_sysfs(s, bp)) {
+                qdev_prop_set_string(dev, AC_ADAPTER_PATH_PROP, bp);
+                closedir(dir);
+                return true;
+            }
+        }
+        ent = readdir(dir);
+    }
+    closedir(dir);
+
+    return false;
+}
+
+static void acad_realize(DeviceState *dev, Error **errp)
+{
+    ISADevice *d = ISA_DEVICE(dev);
+    ACADState *s = AC_ADAPTER_DEVICE(dev);
+    FWCfgState *fw_cfg = fw_cfg_find();
+    uint16_t *acad_port;
+    char err_details[32] = {};
+
+    trace_acad_realize();
+
+    if (!s->acad_path) {
+        strcpy(err_details, " Try using 'sysfs_path='");
+    }
+
+    if (!get_acad_path(dev)) {
+        error_setg(errp, "AC adapter sysfs path not found or unreadable.%s",
+                   err_details);
+        return;
+    }
+
+    isa_register_ioport(d, &s->io, s->ioport);
+
+    acad_probe_state_timer_init(s);
+
+    if (!fw_cfg) {
+        return;
+    }
+
+    acad_port = g_malloc(sizeof(*acad_port));
+    *acad_port = cpu_to_le16(s->ioport);
+    fw_cfg_add_file(fw_cfg, "etc/acad-port", acad_port,
+                    sizeof(*acad_port));
+}
+
+static Property acad_device_properties[] = {
+    DEFINE_PROP_UINT16(AC_ADAPTER_IOPORT_PROP, ACADState, ioport, 0x53c),
+    DEFINE_PROP_UINT64(AC_ADAPTER_PROBE_STATE_INTERVAL, ACADState,
+                       probe_state_interval, 2000),
+    DEFINE_PROP_STRING(AC_ADAPTER_PATH_PROP, ACADState, acad_path),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription acad_vmstate = {
+    .name = "acad",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(ioport, ACADState),
+        VMSTATE_UINT64(probe_state_interval, ACADState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void acad_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+
+    dc->realize = acad_realize;
+    device_class_set_props(dc, acad_device_properties);
+    dc->vmsd = &acad_vmstate;
+}
+
+static uint64_t acad_ioport_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ACADState *s = opaque;
+
+    acad_get_dynamic_status(s);
+
+    switch (addr) {
+    case AC_STA_ADDR:
+        return s->state;
+    default:
+        warn_report("AC adapter: guest read unknown value.");
+        trace_acad_ioport_read_unknown();
+        return 0;
+    }
+}
+
+static const MemoryRegionOps acad_ops = {
+    .read = acad_ioport_read,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void acad_instance_init(Object *obj)
+{
+    ACADState *s = AC_ADAPTER_DEVICE(obj);
+
+    memory_region_init_io(&s->io, obj, &acad_ops, s, "acad",
+                          AC_ADAPTER_LEN);
+}
+
+static const TypeInfo acad_info = {
+    .name          = TYPE_AC_ADAPTER,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(ACADState),
+    .class_init    = acad_class_init,
+    .instance_init = acad_instance_init,
+};
+
+static void acad_register_types(void)
+{
+    type_register_static(&acad_info);
+}
+
+type_init(acad_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 485eab33b6..2ae756c6ef 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
 acpi_ss.add(when: 'CONFIG_BATTERY', if_true: files('battery.c'))
+acpi_ss.add(when: 'CONFIG_AC_ADAPTER', if_true: files('acad.c'))
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 5d2c606496..496a282cdc 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -58,3 +58,8 @@ tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d n
 battery_realize(void) "Battery device realize entry"
 battery_get_dynamic_status(uint32_t state, uint32_t rate, uint32_t charge) "Battery read state: 0x%"PRIx32", rate: %"PRIu32", charge: %"PRIu32
 battery_ioport_read_unknown(void) "Battery read unknown"
+
+# acad.c
+acad_realize(void) "AC adapter device realize entry"
+acad_get_dynamic_status(uint8_t state) "AC adapter read state: %"PRIu8
+acad_ioport_read_unknown(void) "AC adapter read unknown"
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index b081be7a0f..483b3ccec8 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -24,6 +24,7 @@ config PC
     imply VGA_PCI
     imply VIRTIO_VGA
     imply BATTERY
+    imply AC_ADAPTER
     select FDC
     select I8259
     select I8254
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ecd5380f82..96dbeed22f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -36,6 +36,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu.h"
 #include "hw/acpi/battery.h"
+#include "hw/acpi/acad.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
@@ -114,6 +115,7 @@ typedef struct AcpiMiscInfo {
     unsigned dsdt_size;
     uint16_t pvpanic_port;
     uint16_t battery_port;
+    uint16_t acad_port;
     uint16_t applesmc_io_base;
 } AcpiMiscInfo;
 
@@ -280,6 +282,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->tpm_version = tpm_get_version(tpm_find());
     info->pvpanic_port = pvpanic_port();
     info->battery_port = battery_port();
+    info->acad_port = acad_port();
     info->applesmc_io_base = applesmc_port();
 }
 
@@ -1728,6 +1731,55 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, method);
     }
 
+    if (misc->acad_port) {
+        Aml *acad_state  = aml_local(0);
+
+        dev = aml_device("ADP0");
+        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0003")));
+
+        aml_append(dev, aml_operation_region("ACST", AML_SYSTEM_IO,
+                                             aml_int(misc->acad_port),
+                                             AC_ADAPTER_LEN));
+        field = aml_field("ACST", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+        aml_append(field, aml_named_field("PWRS", 8));
+        aml_append(dev, field);
+
+        method = aml_method("_PSR", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_store(aml_name("PWRS"), acad_state));
+        aml_append(method, aml_return(acad_state));
+        aml_append(dev, method);
+
+        method = aml_method("_PCL", 0, AML_NOTSERIALIZED);
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("_SB"));
+        aml_append(method, aml_return(pkg));
+        aml_append(dev, method);
+
+        method = aml_method("_PIF", 0, AML_NOTSERIALIZED);
+        pkg = aml_package(6);
+        /* Power Source State */
+        aml_append(pkg, aml_int(0));  /* Non-redundant, non-shared */
+        /* Maximum Output Power */
+        aml_append(pkg, aml_int(AC_ADAPTER_VAL_UNKNOWN));
+        /* Maximum Input Power */
+        aml_append(pkg, aml_int(AC_ADAPTER_VAL_UNKNOWN));
+        /* Model Number */
+        aml_append(pkg, aml_string("QADP001"));
+        /* Serial Number */
+        aml_append(pkg, aml_string("SN00000"));
+        /* OEM Information */
+        aml_append(pkg, aml_string("QEMU"));
+        aml_append(method, aml_return(pkg));
+        aml_append(dev, method);
+
+        aml_append(sb_scope, dev);
+
+        /* Status Change */
+        method = aml_method("\\_GPE._E0A", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.ADP0"), aml_int(0x80)));
+        aml_append(dsdt, method);
+    }
+
     aml_append(dsdt, sb_scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/include/hw/acpi/acad.h b/include/hw/acpi/acad.h
new file mode 100644
index 0000000000..be61c57064
--- /dev/null
+++ b/include/hw/acpi/acad.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU emulated AC adapter device.
+ *
+ * Copyright (c) 2019 Janus Technologies, Inc. (http://janustech.com)
+ *
+ * Authors:
+ *     Leonid Bloch <lb.workbox@gmail.com>
+ *     Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+ *     Dmitry Fleytman <dmitry.fleytman@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory for details.
+ *
+ */
+
+#ifndef HW_ACPI_AC_ADAPTER_H
+#define HW_ACPI_AC_ADAPTER_H
+
+#define TYPE_AC_ADAPTER                  "acad"
+#define AC_ADAPTER_IOPORT_PROP           "ioport"
+#define AC_ADAPTER_PATH_PROP             "sysfs_path"
+#define AC_ADAPTER_PROBE_STATE_INTERVAL  "probe_interval"
+
+#define AC_ADAPTER_VAL_UNKNOWN  0xFFFFFFFF
+
+#define AC_ADAPTER_LEN          1
+
+static inline uint16_t acad_port(void)
+{
+    Object *o = object_resolve_path_type("", TYPE_AC_ADAPTER, NULL);
+    if (!o) {
+        return 0;
+    }
+    return object_property_get_uint(o, AC_ADAPTER_IOPORT_PROP, NULL);
+}
+
+#endif
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 3d98d5636a..b577a4db07 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -15,6 +15,7 @@ typedef enum {
     ACPI_VMGENID_CHANGE_STATUS = 32,
     ACPI_POWER_DOWN_STATUS = 64,
     ACPI_BATTERY_CHANGE_STATUS = 128,
+    ACPI_AC_ADAPTER_CHANGE_STATUS = 1024,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
-- 
2.30.0


