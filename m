Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140292FDB3F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:59:00 +0100 (CET)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KZ9-0000Bz-5S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVc-0005Gq-RR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVZ-0006KT-KF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c124so3940559wma.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5GlAb/7pN+l6zznLtiaTMif84j5i4f7lRmC7oIg/6fU=;
 b=jAk+BHBwQx0JjaSDVexKfrShWLyOpx8oUZfpBO66eC6/M7OnfqxlDMZLGm9+auYfNS
 7A1fqr5Sgpbpa7whrqQQJAS/ExsUJ/NclzMjwB7/oKrH8VTFAK4uGalDVqvs2t2ekE83
 aOwUi9OYXvRfOkuAxWQSHZwegwrTS+HftAN6dw+8pzPoh/W8Knv7TlOE0o0wB9Pkt10j
 AkJID83Eu0EjpdUtBRaJhVoHfciYYxaT8Ns9CMoajugsB0EtURHI8VxIbGNVXZ5OCqOV
 l8yk7QIv1ZYpWpu+Ti85DWollwfoB6bVlhoSXj6WyuB/cu3sk3pIo00vlQycRB3+UHx1
 gG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5GlAb/7pN+l6zznLtiaTMif84j5i4f7lRmC7oIg/6fU=;
 b=Q+WAFee1c0ysZAvoyHPLp18Rgm9z1snORW7k2dXcFDJ0B3dYEN+qwNStKIZ/fzIUUK
 IZ07XRAFhg0ztJigv1rbI1UxiYpeSiplye8FuwM1r8gD77BXxKAkJ0mdEOu1SkRGnJQM
 kpSfcbZcKbCqQSUONwPfdatEs8uNB/poM/xystlHjq6XRCcIiUAVsiq16WU5zRzvbJZ4
 sOwMthf1AIWNtb1lEqb8wmdgEIdQbTEHtgsHEPd2bPKomdHygOZVFOdWf1IX2dZbF1j/
 YjuVCBpGwo2cHzqXiKTE2Owjo3GZqx5JnDKQYHFrTIsByf2A4RGQ47CQBxdRZjnNC1B7
 fiTg==
X-Gm-Message-State: AOAM531txbBr1+PXfyAjVZ5pcKvpMAqNKUJScQu17jWozGU1g8bPAfca
 KP3KIeywAoZUOKdeO+ETZuQ=
X-Google-Smtp-Source: ABdhPJy8yV2Xd1v7j7F42KJhjT502lU70TO3ZvPknFmD69ceu15g59jFcIejvM28fkQ600g8On5V3g==
X-Received: by 2002:a1c:149:: with SMTP id 70mr5997843wmb.165.1611176116112;
 Wed, 20 Jan 2021 12:55:16 -0800 (PST)
Received: from lb-xps.. ([176.230.215.91])
 by smtp.gmail.com with ESMTPSA id k10sm5614823wrq.38.2021.01.20.12.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:55:15 -0800 (PST)
From: Leonid Bloch <lb.workbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/4] hw/acpi: Introduce the QEMU Battery
Date: Wed, 20 Jan 2021 22:54:59 +0200
Message-Id: <20210120205501.33918-3-lb.workbox@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120205501.33918-1-lb.workbox@gmail.com>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=lb.workbox@gmail.com; helo=mail-wm1-x32f.google.com
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

The battery device communicates the host's battery state to the guest.
The probing of the host's battery state occurs on guest ACPI requests,
as well as on timed intervals. If a change of the host's battery state is
detected on one of the timed probes (charging/discharging, rate, charge)
an ACPI notification is sent to the guest, so it will be able to update
its battery status accordingly.

The time interval between periodic probes is 2 seconds by default.
A property 'probe_interval' allows to modify this value. The value should
be provided in milliseconds. A zero value disables the periodic probes,
and makes the battery state updates occur on guest requests only.

The host's battery information is taken from the sysfs battery data,
located in:

/sys/class/power_supply/[device of type "Battery"]

If the sysfs path differs, a different battery needs to be probed, or
even if a "fake" host battery is to be provided, a 'sysfs_path' property
allows to override the default one.

Signed-off-by: Leonid Bloch <lb.workbox@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 MAINTAINERS                          |   5 +
 docs/specs/battery.txt               |  23 ++
 hw/acpi/Kconfig                      |   4 +
 hw/acpi/battery.c                    | 512 +++++++++++++++++++++++++++
 hw/acpi/meson.build                  |   1 +
 hw/acpi/trace-events                 |   5 +
 hw/i386/Kconfig                      |   1 +
 hw/i386/acpi-build.c                 |  97 +++++
 include/hw/acpi/acpi_dev_interface.h |   1 +
 include/hw/acpi/battery.h            |  43 +++
 10 files changed, 692 insertions(+)
 create mode 100644 docs/specs/battery.txt
 create mode 100644 hw/acpi/battery.c
 create mode 100644 include/hw/acpi/battery.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3216387521..33eea28c22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2141,6 +2141,11 @@ F: net/can/*
 F: hw/net/can/*
 F: include/net/can_*.h
 
+Battery
+M: Leonid Bloch <lb.workbox@gmail.com>
+S: Maintained
+F: hw/acpi/battery.*
+
 Subsystems
 ----------
 Audio
diff --git a/docs/specs/battery.txt b/docs/specs/battery.txt
new file mode 100644
index 0000000000..e90324ac03
--- /dev/null
+++ b/docs/specs/battery.txt
@@ -0,0 +1,23 @@
+BATTERY DEVICE
+==============
+
+The battery device communicates the host's battery state to the guest.
+The probing of the host's battery state occurs on guest ACPI requests,
+as well as on timed intervals. If a change of the host's battery state is
+detected on one of the timed probes (charging/discharging, rate, charge)
+an ACPI notification is sent to the guest, so it will be able to
+update its battery status accordingly.
+
+The time interval between periodic probes is 2 s by default. A property
+'probe_interval' allows to modify this value. The value should be
+provided in milliseconds. A zero value disables the periodic probes,
+and makes the battery state updates occur on guest requests only.
+
+The host's battery information is taken from the sysfs battery data,
+located in:
+
+/sys/class/power_supply/[device of type "Battery"]
+
+If the sysfs path differs, a different battery needs to be probed,
+or even if a "fake" host battery is to be provided, a 'sysfs_path'
+property allows to override the default one.
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8..6b4c41037a 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -41,4 +41,8 @@ config ACPI_VMGENID
     default y
     depends on PC
 
+config BATTERY
+    bool
+    depends on ACPI
+
 config ACPI_HW_REDUCED
diff --git a/hw/acpi/battery.c b/hw/acpi/battery.c
new file mode 100644
index 0000000000..afd82594b1
--- /dev/null
+++ b/hw/acpi/battery.c
@@ -0,0 +1,512 @@
+/*
+ * QEMU emulated battery device.
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
+#include "hw/acpi/battery.h"
+
+#define BATTERY_DEVICE(obj) OBJECT_CHECK(BatteryState, (obj), TYPE_BATTERY)
+
+#define BATTERY_DISCHARGING  1
+#define BATTERY_CHARGING     2
+
+#define SYSFS_PATH       "/sys/class/power_supply"
+#define BATTERY_TYPE     "Battery"
+
+#define MAX_ALLOWED_STATE_LENGTH  32  /* For convinience when comparing */
+
+#define NORMALIZE_BY_FULL(val, full) \
+    ((full == 0) ? BATTERY_VAL_UNKNOWN \
+     : (uint32_t)(val * BATTERY_FULL_CAP / full))
+
+typedef union bat_metric {
+    uint32_t val;
+    uint8_t acc[4];
+} bat_metric;
+
+typedef struct BatteryState {
+    ISADevice dev;
+    MemoryRegion io;
+    uint16_t ioport;
+    bat_metric state;
+    bat_metric rate;
+    bat_metric charge;
+    uint32_t charge_full;
+    int units;  /* 0 - mWh, 1 - mAh */
+
+    QEMUTimer *probe_state_timer;
+    uint64_t probe_state_interval;
+
+    char *bat_path;
+} BatteryState;
+
+/* Access addresses */
+enum acc_addr {
+    bsta_addr0, bsta_addr1, bsta_addr2, bsta_addr3,
+    brte_addr0, brte_addr1, brte_addr2, brte_addr3,
+    bcrg_addr0, bcrg_addr1, bcrg_addr2, bcrg_addr3
+};
+
+/* Files used when the units are:      mWh             mAh      */
+static const char *full_file[] = { "energy_full", "charge_full" };
+static const char *now_file[]  = { "energy_now",  "charge_now"  };
+static const char *rate_file[] = { "power_now",   "current_now" };
+
+static const char *stat_file = "status";
+static const char *type_file = "type";
+
+static const char *discharging_states[] = { "Discharging", "Not charging" };
+static const char *charging_states[] = { "Charging", "Full", "Unknown" };
+
+static inline bool battery_file_accessible(char *path, const char *file)
+{
+    char full_path[PATH_MAX];
+    int path_len;
+
+    path_len = snprintf(full_path, PATH_MAX, "%s/%s", path, file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        return false;
+    }
+    if (access(full_path, R_OK) == 0) {
+        return true;
+    }
+    return false;
+}
+
+static inline int battery_select_file(char *path, const char **file)
+{
+    if (battery_file_accessible(path, file[0])) {
+        return 0;
+    } else if (battery_file_accessible(path, file[1])) {
+        return 1;
+    } else {
+        return -1;
+    }
+}
+
+static void battery_get_full_charge(BatteryState *s, Error **errp)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    uint32_t val;
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s", s->bat_path,
+                        full_file[s->units]);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        error_setg(errp, "Full capacity file path is inaccessible.");
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        error_setg_errno(errp, errno, "Could not read the full charge file.");
+        return;
+    }
+
+    if (fscanf(ff, "%u", &val) != 1) {
+        error_setg(errp, "Full capacity undetermined.");
+        return;
+    } else {
+        s->charge_full = val;
+    }
+    fclose(ff);
+}
+
+static inline bool battery_is_discharging(char *val)
+{
+    static const int discharging_len = ARRAY_SIZE(discharging_states);
+    int i;
+
+    for (i = 0; i < discharging_len; i++) {
+        if (!strncmp(val, discharging_states[i], MAX_ALLOWED_STATE_LENGTH)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static inline bool battery_is_charging(char *val)
+{
+    static const int charging_len = ARRAY_SIZE(charging_states);
+    int i;
+
+    for (i = 0; i < charging_len; i++) {
+        if (!strncmp(val, charging_states[i], MAX_ALLOWED_STATE_LENGTH)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static void battery_get_state(BatteryState *s)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    char val[MAX_ALLOWED_STATE_LENGTH];
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s", s->bat_path, stat_file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        warn_report("Could not read the battery state.");
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        warn_report("Could not read the battery state.");
+        return;
+    }
+
+    if (fgets(val, MAX_ALLOWED_STATE_LENGTH, ff) == NULL) {
+        warn_report("Battery state unreadable.");
+    } else {
+        val[strcspn(val, "\n")] = 0;
+        if (battery_is_discharging(val)) {
+            s->state.val = BATTERY_DISCHARGING;
+        } else if (battery_is_charging(val)) {
+            s->state.val = BATTERY_CHARGING;
+        } else {
+            warn_report("Battery state undetermined.");
+        }
+    }
+    fclose(ff);
+}
+
+static void battery_get_rate(BatteryState *s)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    uint64_t val;
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s", s->bat_path,
+                        rate_file[s->units]);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        warn_report("Could not read the battery rate.");
+        s->rate.val = BATTERY_VAL_UNKNOWN;
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        warn_report("Could not read the battery rate.");
+        s->rate.val = BATTERY_VAL_UNKNOWN;
+        return;
+    }
+
+    if (fscanf(ff, "%lu", &val) != 1) {
+        warn_report("Battery rate undetermined.");
+        s->rate.val = BATTERY_VAL_UNKNOWN;
+    } else {
+        s->rate.val = NORMALIZE_BY_FULL(val, s->charge_full);
+    }
+    fclose(ff);
+}
+
+static void battery_get_charge(BatteryState *s)
+{
+    char file_path[PATH_MAX];
+    int path_len;
+    uint64_t val;
+    FILE *ff;
+
+    path_len = snprintf(file_path, PATH_MAX, "%s/%s", s->bat_path,
+                        now_file[s->units]);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        warn_report("Could not read the battery charge.");
+        s->charge.val = BATTERY_VAL_UNKNOWN;
+        return;
+    }
+
+    ff = fopen(file_path, "r");
+    if (ff == NULL) {
+        warn_report("Could not read the battery charge.");
+        s->charge.val = BATTERY_VAL_UNKNOWN;
+        return;
+    }
+
+    if (fscanf(ff, "%lu", &val) != 1) {
+        warn_report("Battery charge undetermined.");
+        s->charge.val = BATTERY_VAL_UNKNOWN;
+    } else {
+        s->charge.val = NORMALIZE_BY_FULL(val, s->charge_full);
+    }
+    fclose(ff);
+}
+
+static void battery_get_dynamic_status(BatteryState *s)
+{
+    battery_get_state(s);
+    battery_get_rate(s);
+    battery_get_charge(s);
+
+    trace_battery_get_dynamic_status(s->state.val, s->rate.val, s->charge.val);
+}
+
+static void battery_probe_state(void *opaque)
+{
+    BatteryState *s = opaque;
+
+    uint32_t state_before = s->state.val;
+    uint32_t rate_before = s->rate.val;
+    uint32_t charge_before = s->charge.val;
+
+    battery_get_dynamic_status(s);
+
+    if (state_before != s->state.val || rate_before != s->rate.val ||
+        charge_before != s->charge.val) {
+        Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
+        switch (charge_before) {
+        case 0:
+            break;  /* Avoid marking initiation as an update */
+        default:
+            acpi_send_event(DEVICE(obj), ACPI_BATTERY_CHANGE_STATUS);
+        }
+    }
+    timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+              s->probe_state_interval);
+}
+
+static void battery_probe_state_timer_init(BatteryState *s)
+{
+    if (s->probe_state_interval > 0) {
+        s->probe_state_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                            battery_probe_state, s);
+        timer_mod(s->probe_state_timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
+                  s->probe_state_interval);
+    }
+}
+
+static bool battery_verify_sysfs(BatteryState *s, char *path)
+{
+    int units;
+    FILE *ff;
+    char type_path[PATH_MAX];
+    int path_len;
+    char val[MAX_ALLOWED_STATE_LENGTH];
+
+    path_len = snprintf(type_path, PATH_MAX, "%s/%s", path, type_file);
+    if (path_len < 0 || path_len >= PATH_MAX) {
+        return false;
+    }
+    ff = fopen(type_path, "r");
+    if (ff == NULL) {
+        return false;
+    }
+
+    if (fgets(val, MAX_ALLOWED_STATE_LENGTH, ff) == NULL) {
+        fclose(ff);
+        return false;
+    } else {
+        val[strcspn(val, "\n")] = 0;
+        if (strncmp(val, BATTERY_TYPE, MAX_ALLOWED_STATE_LENGTH)) {
+            fclose(ff);
+            return false;
+        }
+    }
+    fclose(ff);
+
+    units = battery_select_file(path, full_file);
+
+    if (units < 0) {
+        return false;
+    } else {
+        s->units = units;
+    }
+
+    return (battery_file_accessible(path, now_file[s->units])
+            & battery_file_accessible(path, rate_file[s->units])
+            & battery_file_accessible(path, stat_file));
+}
+
+static bool get_battery_path(DeviceState *dev)
+{
+    BatteryState *s = BATTERY_DEVICE(dev);
+    DIR *dir;
+    struct dirent *ent;
+    char bp[PATH_MAX];
+    int path_len;
+
+    if (s->bat_path) {
+        return battery_verify_sysfs(s, s->bat_path);
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
+            if (battery_verify_sysfs(s, bp)) {
+                qdev_prop_set_string(dev, BATTERY_PATH_PROP, bp);
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
+static void battery_realize(DeviceState *dev, Error **errp)
+{
+    ISADevice *d = ISA_DEVICE(dev);
+    BatteryState *s = BATTERY_DEVICE(dev);
+    FWCfgState *fw_cfg = fw_cfg_find();
+    uint16_t *battery_port;
+    char err_details[0x20] = {};
+
+    trace_battery_realize();
+
+    if (!s->bat_path) {
+        strcpy(err_details, " Try using 'sysfs_path='");
+    }
+
+    if (!get_battery_path(dev)) {
+        error_setg(errp, "Battery sysfs path not found or unreadable.%s",
+                   err_details);
+        return;
+    }
+
+    battery_get_full_charge(s, errp);
+
+    isa_register_ioport(d, &s->io, s->ioport);
+
+    battery_probe_state_timer_init(s);
+
+    if (!fw_cfg) {
+        return;
+    }
+
+    battery_port = g_malloc(sizeof(*battery_port));
+    *battery_port = cpu_to_le16(s->ioport);
+    fw_cfg_add_file(fw_cfg, "etc/battery-port", battery_port,
+                    sizeof(*battery_port));
+}
+
+static Property battery_device_properties[] = {
+    DEFINE_PROP_UINT16(BATTERY_IOPORT_PROP, BatteryState, ioport, 0x530),
+    DEFINE_PROP_UINT64(BATTERY_PROBE_STATE_INTERVAL, BatteryState,
+                       probe_state_interval, 2000),
+    DEFINE_PROP_STRING(BATTERY_PATH_PROP, BatteryState, bat_path),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription battery_vmstate = {
+    .name = "battery",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(ioport, BatteryState),
+        VMSTATE_UINT64(probe_state_interval, BatteryState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void battery_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+
+    dc->realize = battery_realize;
+    device_class_set_props(dc, battery_device_properties);
+    dc->vmsd = &battery_vmstate;
+}
+
+static uint64_t battery_ioport_read(void *opaque, hwaddr addr, unsigned size)
+{
+    BatteryState *s = opaque;
+
+    battery_get_dynamic_status(s);
+
+    switch (addr) {
+    case bsta_addr0:
+        return s->state.acc[0];
+    case bsta_addr1:
+        return s->state.acc[1];
+    case bsta_addr2:
+        return s->state.acc[2];
+    case bsta_addr3:
+        return s->state.acc[3];
+    case brte_addr0:
+        return s->rate.acc[0];
+    case brte_addr1:
+        return s->rate.acc[1];
+    case brte_addr2:
+        return s->rate.acc[2];
+    case brte_addr3:
+        return s->rate.acc[3];
+    case bcrg_addr0:
+        return s->charge.acc[0];
+    case bcrg_addr1:
+        return s->charge.acc[1];
+    case bcrg_addr2:
+        return s->charge.acc[2];
+    case bcrg_addr3:
+        return s->charge.acc[3];
+    default:
+        warn_report("Battery: guest read unknown value.");
+        trace_battery_ioport_read_unknown();
+        return 0;
+    }
+}
+
+static const MemoryRegionOps battery_ops = {
+    .read = battery_ioport_read,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void battery_instance_init(Object *obj)
+{
+    BatteryState *s = BATTERY_DEVICE(obj);
+
+    memory_region_init_io(&s->io, obj, &battery_ops, s, "battery",
+                          BATTERY_LEN);
+}
+
+static const TypeInfo battery_info = {
+    .name          = TYPE_BATTERY,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(BatteryState),
+    .class_init    = battery_class_init,
+    .instance_init = battery_instance_init,
+};
+
+static void battery_register_types(void)
+{
+    type_register_static(&battery_info);
+}
+
+type_init(battery_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577212..485eab33b6 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -19,6 +19,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+acpi_ss.add(when: 'CONFIG_BATTERY', if_true: files('battery.c'))
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index f91ced477d..5d2c606496 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -53,3 +53,8 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+
+# battery.c
+battery_realize(void) "Battery device realize entry"
+battery_get_dynamic_status(uint32_t state, uint32_t rate, uint32_t charge) "Battery read state: 0x%"PRIx32", rate: %"PRIu32", charge: %"PRIu32
+battery_ioport_read_unknown(void) "Battery read unknown"
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index eea059ffef..b081be7a0f 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -23,6 +23,7 @@ config PC
     imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
+    imply BATTERY
     select FDC
     select I8259
     select I8254
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f56d699c7f..ecd5380f82 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -35,6 +35,7 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/battery.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
@@ -112,6 +113,7 @@ typedef struct AcpiMiscInfo {
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
     uint16_t pvpanic_port;
+    uint16_t battery_port;
     uint16_t applesmc_io_base;
 } AcpiMiscInfo;
 
@@ -277,6 +279,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->has_hpet = hpet_find();
     info->tpm_version = tpm_get_version(tpm_find());
     info->pvpanic_port = pvpanic_port();
+    info->battery_port = battery_port();
     info->applesmc_io_base = applesmc_port();
 }
 
@@ -1631,6 +1634,100 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
     }
 
+    if (misc->battery_port) {
+        Aml *bat_state  = aml_local(0);
+        Aml *bat_rate   = aml_local(1);
+        Aml *bat_charge = aml_local(2);
+
+        dev = aml_device("BAT0");
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0C0A")));
+
+        method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_return(aml_int(0x1F)));
+        aml_append(dev, method);
+
+        aml_append(dev, aml_operation_region("DBST", AML_SYSTEM_IO,
+                                             aml_int(misc->battery_port),
+                                             BATTERY_LEN));
+        field = aml_field("DBST", AML_DWORD_ACC, AML_NOLOCK, AML_PRESERVE);
+        aml_append(field, aml_named_field("BSTA", 32));
+        aml_append(field, aml_named_field("BRTE", 32));
+        aml_append(field, aml_named_field("BCRG", 32));
+        aml_append(dev, field);
+
+        method = aml_method("_BIF", 0, AML_NOTSERIALIZED);
+        pkg = aml_package(13);
+        /* Power Unit */
+        aml_append(pkg, aml_int(0));             /* mW */
+        /* Design Capacity */
+        aml_append(pkg, aml_int(BATTERY_FULL_CAP));
+        /* Last Full Charge Capacity */
+        aml_append(pkg, aml_int(BATTERY_FULL_CAP));
+        /* Battery Technology */
+        aml_append(pkg, aml_int(1));             /* Secondary */
+        /* Design Voltage */
+        aml_append(pkg, aml_int(BATTERY_VAL_UNKNOWN));
+        /* Design Capacity of Warning */
+        aml_append(pkg, aml_int(BATTERY_CAPACITY_OF_WARNING));
+        /* Design Capacity of Low */
+        aml_append(pkg, aml_int(BATTERY_CAPACITY_OF_LOW));
+        /* Battery Capacity Granularity 1 */
+        aml_append(pkg, aml_int(BATTERY_CAPACITY_GRANULARITY));
+        /* Battery Capacity Granularity 2 */
+        aml_append(pkg, aml_int(BATTERY_CAPACITY_GRANULARITY));
+        /* Model Number */
+        aml_append(pkg, aml_string("QBAT001"));  /* Model Number */
+        /* Serial Number */
+        aml_append(pkg, aml_string("SN00000"));  /* Serial Number */
+        /* Battery Type */
+        aml_append(pkg, aml_string("Virtual"));  /* Battery Type */
+        /* OEM Information */
+        aml_append(pkg, aml_string("QEMU"));     /* OEM Information */
+        aml_append(method, aml_return(pkg));
+        aml_append(dev, method);
+
+        pkg = aml_package(4);
+        /* Battery State */
+        aml_append(pkg, aml_int(0));
+        /* Battery Present Rate */
+        aml_append(pkg, aml_int(BATTERY_VAL_UNKNOWN));
+        /* Battery Remaining Capacity */
+        aml_append(pkg, aml_int(BATTERY_VAL_UNKNOWN));
+        /* Battery Present Voltage */
+        aml_append(pkg, aml_int(BATTERY_VAL_UNKNOWN));
+        aml_append(dev, aml_name_decl("DBPR", pkg));
+
+        method = aml_method("_BST", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_store(aml_name("BSTA"), bat_state));
+        aml_append(method, aml_store(aml_name("BRTE"), bat_rate));
+        aml_append(method, aml_store(aml_name("BCRG"), bat_charge));
+        aml_append(method, aml_store(bat_state,
+                                     aml_index(aml_name("DBPR"), aml_int(0))));
+        aml_append(method, aml_store(bat_rate,
+                                     aml_index(aml_name("DBPR"), aml_int(1))));
+        aml_append(method, aml_store(bat_charge,
+                                     aml_index(aml_name("DBPR"), aml_int(2))));
+        aml_append(method, aml_return(aml_name("DBPR")));
+        aml_append(dev, method);
+
+        aml_append(sb_scope, dev);
+
+        /* Device Check */
+        method = aml_method("\\_GPE._E07", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.BAT0"), aml_int(0x01)));
+        aml_append(dsdt, method);
+
+        /* Status Change */
+        method = aml_method("\\_GPE._E08", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.BAT0"), aml_int(0x80)));
+        aml_append(dsdt, method);
+
+        /* Information Change */
+        method = aml_method("\\_GPE._E09", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.BAT0"), aml_int(0x81)));
+        aml_append(dsdt, method);
+    }
+
     aml_append(dsdt, sb_scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 769ff55c7e..3d98d5636a 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -14,6 +14,7 @@ typedef enum {
     ACPI_NVDIMM_HOTPLUG_STATUS = 16,
     ACPI_VMGENID_CHANGE_STATUS = 32,
     ACPI_POWER_DOWN_STATUS = 64,
+    ACPI_BATTERY_CHANGE_STATUS = 128,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
diff --git a/include/hw/acpi/battery.h b/include/hw/acpi/battery.h
new file mode 100644
index 0000000000..6224a97d9c
--- /dev/null
+++ b/include/hw/acpi/battery.h
@@ -0,0 +1,43 @@
+/*
+ * QEMU emulated battery device.
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
+#ifndef HW_ACPI_BATTERY_H
+#define HW_ACPI_BATTERY_H
+
+#define TYPE_BATTERY                  "battery"
+#define BATTERY_IOPORT_PROP           "ioport"
+#define BATTERY_PATH_PROP             "sysfs_path"
+#define BATTERY_PROBE_STATE_INTERVAL  "probe_interval"
+
+#define BATTERY_FULL_CAP     10000  /* mWh */
+
+#define BATTERY_CAPACITY_OF_WARNING   (BATTERY_FULL_CAP /  10)  /* 10% */
+#define BATTERY_CAPACITY_OF_LOW       (BATTERY_FULL_CAP /  25)  /* 4%  */
+#define BATTERY_CAPACITY_GRANULARITY  (BATTERY_FULL_CAP / 100)  /* 1%  */
+
+#define BATTERY_VAL_UNKNOWN  0xFFFFFFFF
+
+#define BATTERY_LEN          0x0C
+
+static inline uint16_t battery_port(void)
+{
+    Object *o = object_resolve_path_type("", TYPE_BATTERY, NULL);
+    if (!o) {
+        return 0;
+    }
+    return object_property_get_uint(o, BATTERY_IOPORT_PROP, NULL);
+}
+
+#endif
-- 
2.30.0


