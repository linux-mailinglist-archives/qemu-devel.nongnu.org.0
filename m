Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D92FDB3E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:58:03 +0100 (CET)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KYE-0007SV-P5
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVf-0005N7-LJ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:23 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVc-0006Lm-T2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id a9so20940625wrt.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+50sXcYbgpoJeb4PTQoSEae1wYSOROdopOFpjZG7mVc=;
 b=MDAmJi4n4wSyDEXYkwOJmZ5vojj6XTGLiWXIA0l5JIzl1ZxNE6Kv1ZMZeuxqEXBn6Z
 hC/2a83X2jCPoWSh2rE3u7EWw3sgIY0pnTiCJ32uxPtu/jFjU/1U3LRPhy/sJChngTQc
 Rguvgs0BjWLmQXScGUHd7ZyK0VA0ugKadyZXjxD/MDgU6hJMck45zxR9YB1fJy5+V44g
 bg+9Ac4S6UpvJWmNaQxPGvuEmR+XTC7nd9U/4+zvnt5VhNYaV3fSXKqzgyYen4pSwe9C
 Za+HzS9pape8KsXQ6W72MWb7yF17Pa3q0kaKG18QeID+MtUgZsDNNTgE+5lP7vj55J/J
 jNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+50sXcYbgpoJeb4PTQoSEae1wYSOROdopOFpjZG7mVc=;
 b=NF9s1wakL8AL5K1GX0kp2md4QcnXjIv/OlPcPa9P66xrPWKjjiz7WogX3OFxZPOYey
 xdRC+GH21AkRYySvzUBXsAPGd+pCf+0ehuhWgCsAHrGdk+8xp/3DjSUWF1D5zFpstgcN
 bk4LMwdKLJKBe8STHx6ccn52b13eYCiPF8Qh9W6AnGYKIYBMrybIHGHgn7Jgf+7qo4EP
 GqK2g5rChP1p8xxXVrtiL1YIpWNKYbMJOchmRIQxPtoE64cKqBldPR1KNOcLzCltRMWL
 mPNf9WvBvExjeBcT2y/Vqy5xnwCcG414UjcuRB1bRshDlyksD6bUMkPgPUG6KYSM5yVN
 tpIA==
X-Gm-Message-State: AOAM5320uaz+5N1Oj627vD3okMNNvdlMxENWX/Nl/tThgzBoo8KCHbLW
 s0TjgPB4/2JcNG6X4AQdOEy8KtOdhvyetAQy/Ao=
X-Google-Smtp-Source: ABdhPJym5Sbuy429QB/QPJZZ0J3aJyQ7S3WYWYNZHhh/0KAUpaOG5f+M1e758jjzNLrnJG0xzqLRAA==
X-Received: by 2002:adf:c106:: with SMTP id r6mr10723756wre.175.1611176119652; 
 Wed, 20 Jan 2021 12:55:19 -0800 (PST)
Received: from lb-xps.. ([176.230.215.91])
 by smtp.gmail.com with ESMTPSA id k10sm5614823wrq.38.2021.01.20.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:55:19 -0800 (PST)
From: Leonid Bloch <lb.workbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 4/4] hw/acpi: Introduce the QEMU lid button
Date: Wed, 20 Jan 2021 22:55:01 +0200
Message-Id: <20210120205501.33918-5-lb.workbox@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120205501.33918-1-lb.workbox@gmail.com>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=lb.workbox@gmail.com; helo=mail-wr1-x433.google.com
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

The button device communicates the host's "lid button" state to the guest.
The probing of the host's lid button state occurs on timed intervals.
If a change of the host's lid button state is detected (open/closed)
an ACPI notification is sent to the guest, so it will be able to act
accordingly.

The time interval between the periodic probes is 2 s by default.
A property 'probe_interval' allows to modify this value. The value
is provided in milliseconds.

The host's lid button information is taken from:

/proc/acpi/button/lid/*/state

And this file is expected to be formatted as:
'state:      open' (if the lid is open)
or:
'state:      closed' (if the lid is closed)

These are based on the Linux 'button' driver.

If the above procfs path differs, or even if a "fake" host lid button
is to be provided, a 'procfs_path' property allows to override the
default path.

Usage example (default values):

'-device button'

Is the same as:

'-device button,procfs_path=/proc/acpi/button,probe_interval=2000'

Signed-off-by: Leonid Bloch <lb.workbox@gmail.com>
---
 MAINTAINERS                          |   5 +
 docs/specs/button.txt                |  35 +++
 hw/acpi/Kconfig                      |   4 +
 hw/acpi/button.c                     | 327 +++++++++++++++++++++++++++
 hw/acpi/meson.build                  |   1 +
 hw/acpi/trace-events                 |   5 +
 hw/i386/Kconfig                      |   1 +
 hw/i386/acpi-build.c                 |  29 +++
 include/hw/acpi/acpi_dev_interface.h |   1 +
 include/hw/acpi/button.h             |  35 +++
 10 files changed, 443 insertions(+)
 create mode 100644 docs/specs/button.txt
 create mode 100644 hw/acpi/button.c
 create mode 100644 include/hw/acpi/button.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a3fc1dd56..72bead7023 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2151,6 +2151,11 @@ M: Leonid Bloch <lb.workbox@gmail.com>
 S: Maintained
 F: hw/acpi/acad.*
 
+Button
+M: Leonid Bloch <lb.workbox@gmail.com>
+S: Maintained
+F: hw/acpi/button.*
+
 Subsystems
 ----------
 Audio
diff --git a/docs/specs/button.txt b/docs/specs/button.txt
new file mode 100644
index 0000000000..48e9f3388d
--- /dev/null
+++ b/docs/specs/button.txt
@@ -0,0 +1,35 @@
+BUTTON DEVICE
+=================
+
+The button device communicates the host's "lid button" state to the guest.
+The probing of the host's lid button state occurs on timed intervals.
+If a change of the host's lid button state is detected (open/closed)
+an ACPI notification is sent to the guest, so it will be able to act
+accordingly.
+
+The time interval between the periodic probes is 2 s by default.
+A property 'probe_interval' allows to modify this value. The value
+is provided in milliseconds.
+
+The host's lid button information is taken from:
+
+/proc/acpi/button/lid/*/state
+
+And this file is expected to be formatted as:
+'state:      open' (if the lid is open)
+or:
+'state:      closed' (if the lid is closed)
+
+These are based on the Linux 'button' driver.
+
+If the above procfs path differs, or even if a "fake" host lid button
+is to be provided, a 'procfs_path' property allows to override the
+default path.
+
+Usage example (default values):
+
+'-device button'
+
+Is the same as:
+
+'-device button,procfs_path=/proc/acpi/button,probe_interval=2000'
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index d35331fbf7..0e78560f0f 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -49,4 +49,8 @@ config AC_ADAPTER
     bool
     depends on ACPI
 
+config BUTTON
+    bool
+    depends on ACPI
+
 config ACPI_HW_REDUCED
diff --git a/hw/acpi/button.c b/hw/acpi/button.c
new file mode 100644
index 0000000000..edca46ce6d
--- /dev/null
+++ b/hw/acpi/button.c
@@ -0,0 +1,327 @@
+/*
+ * QEMU emulated lid button device
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
+#include "hw/acpi/button.h"
+
+#define BUTTON_DEVICE(obj) OBJECT_CHECK(BUTTONState, (obj), \
+                                        TYPE_BUTTON)
+
+#define BUTTON_STA_ADDR            0
+
+#define PROCFS_PATH                "/proc/acpi/button"
+#define LID_DIR                    "lid"
+#define LID_STATE_FILE             "state"
+#define MIN_BUTTON_PROBE_INTERVAL  10  /* ms */
+#define MAX_ALLOWED_LINE_LENGTH    32  /* For convenience when comparing */
+
+enum {
+    LID_CLOSED = 0,
+    LID_OPEN = 1,
+};
+
+static const char *lid_state[] = { "closed", "open" };
+
+typedef struct BUTTONState {
+    ISADevice dev;
+    MemoryRegion io;
+    uint16_t ioport;
+    uint8_t lid_state;
+
+    QEMUTimer *probe_state_timer;
+    uint64_t probe_state_interval;
+
+    char *button_path;
+    char lid_dir[MAX_ALLOWED_LINE_LENGTH];
+} BUTTONState;
+
+static inline bool button_file_accessible(char *path, const char *dir,
+                                          char *subdir, const char *file)
+{
+    char full_path[PATH_MAX];
+    int path_len;
+
+    path_len = snprintf(full_path, PATH_MAX, "%s/%s/%s/%s", path, dir, subdir,
+                        file);
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
+static void button_get_lid_state(BUTTONState *s)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    char line[MAX_ALLOWED_LINE_LENGTH];
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s/%s/%s", s->button_path,
+                        LID_DIR, s->lid_dir, LID_STATE_FILE);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        warn_report("Could not read the lid state.");
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        warn_report("Could not read the lid state.");
+        return;
+    }
+
+    if (fgets(line, MAX_ALLOWED_LINE_LENGTH, ff) == NULL) {
+        warn_report("Lid state unreadable.");
+    } else {
+        if (strstr(line, lid_state[LID_OPEN]) != NULL) {
+            s->lid_state = LID_OPEN;
+        } else if (strstr(line, lid_state[LID_CLOSED]) != NULL) {
+            s->lid_state = LID_CLOSED;
+        } else {
+            warn_report("Lid state undetermined.");
+        }
+    }
+
+    fclose(ff);
+}
+
+static void button_get_dynamic_status(BUTTONState *s)
+{
+    trace_button_get_dynamic_status();
+
+    button_get_lid_state(s);
+}
+
+static void button_probe_state(void *opaque)
+{
+    BUTTONState *s = opaque;
+
+    uint8_t lid_state_before = s->lid_state;
+
+    button_get_dynamic_status(s);
+
+    if (lid_state_before != s->lid_state) {
+        Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
+        acpi_send_event(DEVICE(obj), ACPI_BUTTON_CHANGE_STATUS);
+    }
+    timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+              s->probe_state_interval);
+}
+
+static void button_probe_state_timer_init(BUTTONState *s)
+{
+    if (s->probe_state_interval > 0) {
+        s->probe_state_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                            button_probe_state, s);
+        timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  s->probe_state_interval);
+    }
+}
+
+static inline bool button_verify_lid_procfs(char *path, char *lid_subdir)
+{
+    return button_file_accessible(path, LID_DIR, lid_subdir, LID_STATE_FILE);
+}
+
+static bool button_get_lid_dir(BUTTONState *s, char *path)
+{
+    DIR *dir;
+    char lid_path[PATH_MAX];
+    int path_len;
+    struct dirent *ent;
+
+    path_len = snprintf(lid_path, PATH_MAX, "%s/%s", path, LID_DIR);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        return false;
+    }
+
+    dir = opendir(lid_path);
+    if (dir == NULL) {
+        return false;
+    }
+
+    ent = readdir(dir);
+    while (ent != NULL) {
+        if (ent->d_name[0] != '.') {
+            if (button_verify_lid_procfs(path, ent->d_name)) {
+                path_len = snprintf(s->lid_dir, strlen(ent->d_name) + 1, "%s",
+                                    ent->d_name);
+                if (path_len < 0 || path_len > strlen(ent->d_name)) {
+                    return false;
+                }
+                closedir(dir);
+                return true;
+            }
+        }
+        ent = readdir(dir);
+    }
+    closedir(dir);
+    return false;
+}
+
+static bool get_button_path(DeviceState *dev)
+{
+    BUTTONState *s = BUTTON_DEVICE(dev);
+    char procfs_path[PATH_MAX];
+    int path_len;
+
+    if (s->button_path) {
+        path_len = snprintf(procfs_path, strlen(s->button_path) + 1, "%s",
+                            s->button_path);
+        if (path_len < 0 || path_len > strlen(s->button_path)) {
+            return false;
+        }
+    } else {
+        path_len = snprintf(procfs_path, sizeof(PROCFS_PATH), "%s",
+                            PROCFS_PATH);
+        if (path_len < 0 || path_len >= sizeof(PROCFS_PATH)) {
+            return false;
+        }
+    }
+
+    if (button_get_lid_dir(s, procfs_path)) {
+        qdev_prop_set_string(dev, BUTTON_PATH_PROP, procfs_path);
+        return true;
+    }
+
+    return false;
+}
+
+static void button_realize(DeviceState *dev, Error **errp)
+{
+    ISADevice *d = ISA_DEVICE(dev);
+    BUTTONState *s = BUTTON_DEVICE(dev);
+    FWCfgState *fw_cfg = fw_cfg_find();
+    uint16_t *button_port;
+    char err_details[32] = {};
+
+    trace_button_realize();
+
+    if (s->probe_state_interval < MIN_BUTTON_PROBE_INTERVAL) {
+        error_setg(errp, "'probe_state_interval' must be greater than %d ms",
+                   MIN_BUTTON_PROBE_INTERVAL);
+        return;
+    }
+
+    if (!s->button_path) {
+        strcpy(err_details, " Try using 'procfs_path='");
+    }
+
+    if (!get_button_path(dev)) {
+        error_setg(errp, "Button procfs path not found or unreadable.%s",
+                   err_details);
+        return;
+    }
+
+    isa_register_ioport(d, &s->io, s->ioport);
+
+    button_probe_state_timer_init(s);
+
+    if (!fw_cfg) {
+        return;
+    }
+
+    button_port = g_malloc(sizeof(*button_port));
+    *button_port = cpu_to_le16(s->ioport);
+    fw_cfg_add_file(fw_cfg, "etc/button-port", button_port,
+                    sizeof(*button_port));
+}
+
+static Property button_device_properties[] = {
+    DEFINE_PROP_UINT16(BUTTON_IOPORT_PROP, BUTTONState, ioport, 0x53d),
+    DEFINE_PROP_UINT64(BUTTON_PROBE_STATE_INTERVAL, BUTTONState,
+                       probe_state_interval, 2000),
+    DEFINE_PROP_STRING(BUTTON_PATH_PROP, BUTTONState, button_path),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription button_vmstate = {
+    .name = "button",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(ioport, BUTTONState),
+        VMSTATE_UINT64(probe_state_interval, BUTTONState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void button_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+
+    dc->realize = button_realize;
+    device_class_set_props(dc, button_device_properties);
+    dc->vmsd = &button_vmstate;
+}
+
+static uint64_t button_ioport_read(void *opaque, hwaddr addr, unsigned size)
+{
+    BUTTONState *s = opaque;
+
+    button_get_dynamic_status(s);
+
+    switch (addr) {
+    case BUTTON_STA_ADDR:
+        return s->lid_state;
+    default:
+        warn_report("Button: guest read unknown value.");
+        trace_button_ioport_read_unknown();
+        return 0;
+    }
+}
+
+static const MemoryRegionOps button_ops = {
+    .read = button_ioport_read,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void button_instance_init(Object *obj)
+{
+    BUTTONState *s = BUTTON_DEVICE(obj);
+
+    memory_region_init_io(&s->io, obj, &button_ops, s, "button",
+                          BUTTON_LEN);
+}
+
+static const TypeInfo button_info = {
+    .name          = TYPE_BUTTON,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(BUTTONState),
+    .class_init    = button_class_init,
+    .instance_init = button_instance_init,
+};
+
+static void button_register_types(void)
+{
+    type_register_static(&button_info);
+}
+
+type_init(button_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 2ae756c6ef..0f66766dd3 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -21,6 +21,7 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
 acpi_ss.add(when: 'CONFIG_BATTERY', if_true: files('battery.c'))
 acpi_ss.add(when: 'CONFIG_AC_ADAPTER', if_true: files('acad.c'))
+acpi_ss.add(when: 'CONFIG_BUTTON', if_true: files('button.c'))
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 496a282cdc..7554f0c8b6 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -63,3 +63,8 @@ battery_ioport_read_unknown(void) "Battery read unknown"
 acad_realize(void) "AC adapter device realize entry"
 acad_get_dynamic_status(uint8_t state) "AC adapter read state: %"PRIu8
 acad_ioport_read_unknown(void) "AC adapter read unknown"
+
+# button.c
+button_realize(void) "Button device realize entry"
+button_get_dynamic_status(void) "Button read dynamic status entry"
+button_ioport_read_unknown(void) "Button read unknown"
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 483b3ccec8..2a09e6f742 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -25,6 +25,7 @@ config PC
     imply VIRTIO_VGA
     imply BATTERY
     imply AC_ADAPTER
+    imply BUTTON
     select FDC
     select I8259
     select I8254
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 96dbeed22f..ee5537a1b4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -37,6 +37,7 @@
 #include "hw/acpi/cpu.h"
 #include "hw/acpi/battery.h"
 #include "hw/acpi/acad.h"
+#include "hw/acpi/button.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
@@ -116,6 +117,7 @@ typedef struct AcpiMiscInfo {
     uint16_t pvpanic_port;
     uint16_t battery_port;
     uint16_t acad_port;
+    uint16_t button_port;
     uint16_t applesmc_io_base;
 } AcpiMiscInfo;
 
@@ -283,6 +285,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->pvpanic_port = pvpanic_port();
     info->battery_port = battery_port();
     info->acad_port = acad_port();
+    info->button_port = button_port();
     info->applesmc_io_base = applesmc_port();
 }
 
@@ -1780,6 +1783,32 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, method);
     }
 
+    if (misc->button_port) {
+        Aml *button_state  = aml_local(0);
+
+        dev = aml_device("LID0");
+        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0D")));
+
+        aml_append(dev, aml_operation_region("LSTA", AML_SYSTEM_IO,
+                                             aml_int(misc->button_port),
+                                             BUTTON_LEN));
+        field = aml_field("LSTA", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+        aml_append(field, aml_named_field("LIDS", 8));
+        aml_append(dev, field);
+
+        method = aml_method("_LID", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_store(aml_name("LIDS"), button_state));
+        aml_append(method, aml_return(button_state));
+        aml_append(dev, method);
+
+        aml_append(sb_scope, dev);
+
+        /* Status Change */
+        method = aml_method("\\_GPE._E0B", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.LID0"), aml_int(0x80)));
+        aml_append(dsdt, method);
+    }
+
     aml_append(dsdt, sb_scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index b577a4db07..5ba37a42d2 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -16,6 +16,7 @@ typedef enum {
     ACPI_POWER_DOWN_STATUS = 64,
     ACPI_BATTERY_CHANGE_STATUS = 128,
     ACPI_AC_ADAPTER_CHANGE_STATUS = 1024,
+    ACPI_BUTTON_CHANGE_STATUS = 2048,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
diff --git a/include/hw/acpi/button.h b/include/hw/acpi/button.h
new file mode 100644
index 0000000000..6da17d7cee
--- /dev/null
+++ b/include/hw/acpi/button.h
@@ -0,0 +1,35 @@
+/*
+ * QEMU emulated button device.
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
+#ifndef HW_ACPI_BUTTON_H
+#define HW_ACPI_BUTTON_H
+
+#define TYPE_BUTTON                  "button"
+#define BUTTON_IOPORT_PROP           "ioport"
+#define BUTTON_PATH_PROP             "procfs_path"
+#define BUTTON_PROBE_STATE_INTERVAL  "probe_interval"
+
+#define BUTTON_LEN                   1
+
+static inline uint16_t button_port(void)
+{
+    Object *o = object_resolve_path_type("", TYPE_BUTTON, NULL);
+    if (!o) {
+        return 0;
+    }
+    return object_property_get_uint(o, BUTTON_IOPORT_PROP, NULL);
+}
+
+#endif
-- 
2.30.0


