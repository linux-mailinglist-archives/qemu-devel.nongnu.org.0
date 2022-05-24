Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417553236F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:43:28 +0200 (CEST)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOGN-0000LS-K1
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtb-00005L-0H
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:55 -0400
Received: from mga17.intel.com ([192.55.52.151]:42009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtY-0000LD-43
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373192; x=1684909192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jBV91yYHhKnXobqOAYSB7Y2hYo/KgNApTDMAh7AUjek=;
 b=EHuDBt0le/nDRIdNnCEmk4nB3FmfFRvp4CM0UiYAFfdlKv4mNPG/Co7W
 GqEy3WpCHaEMeHyqIYlz7Z8kbE0CCo+1LF4HXp8u+vSx+idpCBrimxysb
 nojKv9P3nfd6KbZvu+t7ekJB+r3U1NpGu6QVFkwpkOy/g3VZQdDv1MWSZ
 RHAqOIcnXRI5g4vZaN6LJBd/NteROyYkzDqiiHhk+Toh7oZeMrXOOLfVa
 R5nQ9YAhiREqoxh7x/ncLOW2iYqDNoZ4M7dFDVF/NN9T+IlDGVAG3C2LS
 YqlW1BxvpOhQjn9sVEVPQOMyDKpxASPIChyV2OIs64Uewd+/Tr3//Uy/b A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943273"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059877"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:45 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 11/13] vfio/migration: add a plugin layer to support
 out-of-band live migration
Date: Tue, 24 May 2022 14:18:46 +0800
Message-Id: <20220524061848.1615706-12-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a plugin mechanism under VFIOMigrationOps layer. Each vendor can
provide a dynamic load library that implements the communication driver to
talk with IPU/DPU backend agent for saving and restoring device state during
live migration.

There are three interfaces between QEMU VFIO and a migration plugin:

    - VFIOLMPluginGetVersion:
        This is a function type. Plugin must expose a function symbol named
        "vfio_lm_get_plugin_version" with this function type to return the
        interface version supported by the plugin.
    - VFIOLMPluginGetOps:
        This is a function type. Plugin must expose a function symbol named
        "vfio_lm_get_plugin_ops" with this function type to return a pointer to
        VFIOMigrationPluginOps struct.
    - VFIOMigrationPluginOps:
        This is a struct type containing a set of callbacks that plugin
        exposes. The callbacks will be invoked by QEMU VFIO during live
        migration for saving and restoring device states.

The interfaces are defined in include/hw/vfio/vfio-migration-plugin.h.

When QEMU loads a migration plugin, it will first find and invoke function
symbol named "vfio_lm_get_plugin_version" to check the interface version that
plugin supports. And then find and invoke function symbol named
"vfio_lm_get_plugin_ops" to get vendor device specific VFIOMigrationPluginOps
which will be used for saving/restoring device states during live migration.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 docs/devel/vfio-migration-plugin.rst    | 165 +++++++++++++++
 hw/vfio/meson.build                     |   1 +
 hw/vfio/migration-plugin.c              | 262 ++++++++++++++++++++++++
 hw/vfio/migration.c                     |  13 +-
 include/hw/vfio/vfio-common.h           |  12 ++
 include/hw/vfio/vfio-migration-plugin.h |  21 ++
 6 files changed, 471 insertions(+), 3 deletions(-)
 create mode 100644 docs/devel/vfio-migration-plugin.rst
 create mode 100644 hw/vfio/migration-plugin.c
 create mode 100644 include/hw/vfio/vfio-migration-plugin.h

diff --git a/docs/devel/vfio-migration-plugin.rst b/docs/devel/vfio-migration-plugin.rst
new file mode 100644
index 0000000000..800d1bac0a
--- /dev/null
+++ b/docs/devel/vfio-migration-plugin.rst
@@ -0,0 +1,165 @@
+============================
+VFIO Device Migration Plugins
+============================
+
+Contents:
+=========
+* Introduction
+* Usage
+* Plugin based VFIO Live Migration Flow
+* Interface Description between QEMU and Plugins
+
+Introduction:
+============
+
+Plugin based VFIO live migration is an extension to VFIO live migration
+mechanism, which is described in ``docs/devel/vfio-migration.rst``. It provides
+an out-of-band migration solution for PCIe functions exposed by Infrastructure
+Processing Units (IPU) and Data Processing Units (DPU).
+
+IPU/DPU usually has an SoC in the backend where a Linux system usually runs
+out-of-band agents to provision and configure the interfaces and communicate
+with a host management stack such as gRPC or JSON-RPC. Plugin based VFIO live
+migration leverage the agents in the Soc to save/restore PCIe device states.
+
+This is a new feature for VFIO live migration and it allows device vendors to
+develop out-of-tree plugins that can be dynamically loaded into a running QEMU
+process during VFIO passthrough devices live migration.
+
+This document describes the interfaces between QEMU VFIO live migration
+framework and the plugins.
+
+Usage:
+======
+
+An example to use VFIO migration plugin is as the following command line:
+
+-device vfio-pci-emu,x-enable-migration=on,x-plugin-path=$plugin_path,x-plugin-arg=$plugin_arg
+
+Where,
+
+- the 'x-enable-migration' controls whether the VFIO device supports live
+  migration (Not supported by default).
+
+- 'x-plugin-path' indicates the path of the plugin on the host.
+
+- 'x-plugin-arg' is a parameter required by QEMU to load and use the out-of-tree
+  plugin, if the plugin communicates with the backend on IPU/DPU by network,
+  this parameter should be <IP: Port>.
+
+Plugin based VFIO Live Migration Flow:
+======================================
+
+The following ASCII graph describes the overall component relationship:
+
+ +----------------------------------------------------+
+ | QEMU                                               |
+ | +------------------------------------------------+ |
+ | |        VFIO Live Migration Framework           | |
+ | |    +--------------------------------------+    | |
+ | |    |         VFIOMigrationOps             |    | |
+ | |    +-------^---------------------^--------+    | |
+ | |            |                     |             | |
+ | |    +-------v-------+     +-------v--------+    | |
+ | |    | VFIO LM Based |     | VFIO LM Based  |    | |
+ | |    |On Local Region|     |   On Plugin    |    | |
+ | |    +-------^-------+     |     +----------+    | |
+ | |            |             |     |Plugin Ops+----+-+------------+
+ | |            |             +-----+----------+    | |            |
+ | |            |                                   | |  +---------v----------+
+ | +------------+-----------------------------------+ |  |  Vendor Specific   |
+ |              |                                     |  |    Plugins(.so)    |
+ +--------------+-------------------------------------+  +----------+---------+
+  UserSpace     |                                                   |
+----------------+---------------------------------------------      |
+  Kernel        |                                                   |
+                |                                                   |
+     +----------v----------------------+                            |
+     |        Kernel VFIO Driver       |                            |
+     |    +-------------------------+  |                            |
+     |    |                         |  |                            | Network
+     |    | Vendor-Specific Driver  |  |                            |
+     |    |                         |  |                            |
+     |    +----------^--------------+  |                            |
+     |               |                 |                            |
+     +---------------+-----------------+                            |
+                     |                                              |
+                     |                                              |
+---------------------+-----------------------------------------     |
+  Hardware           |                                              |
+                     |            +-----+-----+-----+----+-----+    |
+          +----------v------+     | VF0 | VF1 | VF2 | ...| VFn |    |
+          |   Traditional   |     +-----+-----+-----+----+-----+    |
+          |  PCIe Devices   |     |                            |    |
+          +-----------------+     |   +--------+------------+  |    |
+                                  |   |        |   Agent    |<-+----+
+                                  |   |        +------------+  |
+                                  |   |                     |  |
+                                  |   | SOC                 |  |
+                                  |   +---------------------+  |
+                                  | IPU/DPU                    |
+                                  +----------------------------+
+
+Two QEMU command line options (x-plugin-path and x-plugin-arg) are introduced to
+specify the corresponding plugin and its parameters for a passthrough device.
+If they are specified, the plugin will be loaded in vfio_migration_probe(),
+which will check the plugin version and get the pointer to the plugin's
+VFIOMigrationPluginOps. If any failure during the probing, the plugin will not
+be loaded, and this PCIe device will be marked as no supporting of live
+migration.
+
+When live migration happens, VFIO live migration framework will invoke the
+callbacks defined in VFIOMigrationPluginOps to save/restore the device states,
+as described in the following section.
+
+Interface Description between QEMU and Plugins:
+=============================================
+
+The interfaces between QEMU VFIO live migration framework and vendor-specific
+plugin are defined as follows:
+
+    - VFIOLMPluginGetVersion:
+        This is a function type. Plugins must expose a function symbol named
+        ``vfio_lm_get_plugin_version`` with this function type to return the
+        interface version supported by the plugin.
+    - VFIOLMPluginGetOps:
+        This is a function type. Plugins must expose a function symbol named
+        ``vfio_lm_get_plugin_ops`` with this function type to return a pointer
+        to VFIOMigrationPluginOps struct.
+    - VFIOMigrationPluginOps:
+        This is a struct type containing a set of callbacks that plugin
+        exposes. The callbacks will be invoked by QEMU VFIO during live
+        migration for saving and restoring device states.
+
+The interfaces are defined in include/hw/vfio/vfio-migration-plugin.h.
+
+When QEMU loads a migration plugin, it will first find and invoke a function
+symbol named ``vfio_lm_get_plugin_version`` to check the interface version that
+plugin supports. The core code will refuse to load a plugin if it doesn't export
+the symbol or the version doesn't match the one QEMU supports.
+
+Then QEMU finds and invokes function symbol named ``vfio_lm_get_plugin_ops`` to
+get vendor device-specific VFIOMigrationPluginOps which will be used for
+saving/restoring device states.
+
+VFIOMigrationPluginOps is defined as follows:
+
+typedef struct VFIOMigrationPluginOps {
+    void *(*init)(char *devid, char *arg);
+    int (*save)(void *handle, uint8_t *state, uint64_t len);
+    int (*load)(void *handle, uint8_t *state, uint64_t len);
+    int (*update_pending)(void *handle, uint64_t *pending_bytes);
+    int (*set_state)(void *handle, uint32_t value);
+    int (*get_state)(void *handle, uint32_t *value);
+    int (*cleanup)(void *handle);
+} VFIOMigrationPluginOps;
+
+Here:
+    - init(): set the PCIe device BDF and args, and get the plugin handle.
+    - save(): save the VFIO passthrough device states on the source.
+    - load(): restore the VFIO passthrough device states on the destination.
+    - set_state(): set the PCIe device states including SAVING, RUNNING,
+                   STOP, and RESUMING.
+    - get_state(): get the PCIe device states.
+    - update_pending(): get the remaining bytes during data transfer.
+    - cleanup(): unload the plugin and release some resources.
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index 5a72b8c349..592d56536e 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -4,6 +4,7 @@ vfio_ss.add(files(
   'spapr.c',
   'migration.c',
   'migration-local.c',
+  'migration-plugin.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
diff --git a/hw/vfio/migration-plugin.c b/hw/vfio/migration-plugin.c
new file mode 100644
index 0000000000..63124e1571
--- /dev/null
+++ b/hw/vfio/migration-plugin.c
@@ -0,0 +1,262 @@
+/*
+ * QEMU VFIO Migration Support
+ *
+ * Copyright Intel Corporation, 2022
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+
+#include "hw/vfio/vfio-common.h"
+#include "migration/qemu-file.h"
+#include "qapi/error.h"
+#include "hw/vfio/vfio-migration-plugin.h"
+#include "sysemu/sysemu.h"
+
+#define CHUNK_SIZE (1024 * 1024)
+
+static int vfio_migration_load_plugin(VFIODevice *vbasedev)
+{
+    char *path = vbasedev->desc.path;
+    VFIOMigration *migration = vbasedev->migration;
+    VFIOMigrationPlugin *plugin = NULL;
+    VFIOLMPluginGetVersion vfio_lm_get_plugin_version = NULL;
+    VFIOLMPluginGetOps vfio_lm_get_plugin_ops = NULL;
+
+    plugin = g_malloc0(sizeof(VFIOMigrationPlugin));
+    if (!plugin) {
+        error_report("%s: Error allocating buffer", __func__);
+        return -ENOMEM;
+    }
+
+    plugin->module = g_module_open(path, G_MODULE_BIND_LOCAL);
+    if (!plugin->module) {
+        error_report("Failed to load VFIO migration plugin:%s", path);
+        g_free(plugin);
+        return -1;
+    }
+
+    if (!g_module_symbol(plugin->module, "vfio_lm_get_plugin_version",
+                        (void *)&vfio_lm_get_plugin_version)) {
+        error_report("Failed to load plugin ops %s: %s", path,
+                    g_module_error());
+        goto err;
+    }
+
+    if (vfio_lm_get_plugin_version() != VFIO_LM_PLUGIN_API_VERSION) {
+        error_report("Invalid VFIO Plugin API Version %s : %s", path,
+                     g_module_error());
+        goto err;
+    }
+
+    if (!g_module_symbol(plugin->module, "vfio_lm_get_plugin_ops",
+                        (void *)&vfio_lm_get_plugin_ops)) {
+        error_report("Failed to load plugin ops %s: %s", path,
+                     g_module_error());
+        goto err;
+    }
+
+    plugin->ops = vfio_lm_get_plugin_ops();
+    if (!plugin->ops) {
+        error_report("Failed to Get Plugin Ops: %s", path);
+        goto err;
+    }
+
+    migration->plugin = plugin;
+
+    return 0;
+
+err:
+    g_module_close(plugin->module);
+    g_free(plugin);
+    plugin = NULL;
+    return -1;
+}
+
+static int vfio_migration_save_load_setup_plugin(VFIODevice *vbasedev)
+{
+    char *arg = vbasedev->desc.arg;
+    VFIOMigrationPlugin *plugin = vbasedev->migration->plugin;
+
+    /* The name is BDF for PCIe device */
+    plugin->handle = plugin->ops->init(vbasedev->name, arg);
+    if (!plugin->handle) {
+        error_report("Failed to init: %s", vbasedev->desc.path);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void vfio_migration_cleanup_plugin(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIOMigrationPlugin *plugin = migration->plugin;
+
+    if (plugin->ops->cleanup) {
+        plugin->ops->cleanup(plugin->handle);
+        plugin->handle = NULL;
+    }
+
+    if (migration->plugin->module) {
+        g_module_close(migration->plugin->module);
+        migration->plugin->module = NULL;
+    }
+
+    g_free(migration->plugin);
+    migration->plugin = NULL;
+}
+
+static int vfio_migration_update_pending_plugin(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+    VFIOMigrationPlugin *plugin = migration->plugin;
+    uint64_t pending_bytes = 0;
+    int ret = -1;
+
+    ret = plugin->ops->update_pending(plugin->handle, &pending_bytes);
+    if (ret) {
+        migration->pending_bytes = 0;
+        error_report("%s: Failed to get pending size", __func__);
+        return ret;
+    }
+    migration->pending_bytes = pending_bytes;
+
+    return 0;
+}
+
+static int vfio_migration_set_state_plugin(VFIODevice *vbasedev, uint32_t mask,
+                                           uint32_t value)
+{
+    int ret = -1;
+    uint32_t device_state = 0;
+    VFIOMigrationPlugin *plugin = vbasedev->migration->plugin;
+
+    ret = plugin->ops->get_state(plugin->handle, &device_state);
+    if (ret) {
+        error_report("%s: Get device state error", vbasedev->name);
+        return ret;
+    }
+
+    device_state = (device_state & mask) | value;
+
+    if (!VFIO_DEVICE_STATE_VALID(device_state)) {
+        return -EINVAL;
+    }
+
+    ret = plugin->ops->set_state(plugin->handle, device_state);
+    if (ret) {
+        error_report("%s: Device in error state 0x%x", vbasedev->name,
+                     value);
+        return ret;
+    }
+
+    vbasedev->migration->device_state = device_state;
+
+    return 0;
+}
+
+static int vfio_migration_save_buffer_plugin(QEMUFile *f, VFIODevice *vbasedev,
+                                   uint64_t *size)
+{
+    int ret = 0;
+    VFIOMigrationPlugin *plugin = vbasedev->migration->plugin;
+    uint64_t data_size, tmp_size;
+
+    ret = plugin->ops->update_pending(plugin->handle, &data_size);
+    if (ret < 0) {
+        error_report("%s: Failed to get pending size", __func__);
+        return ret;
+    }
+
+    qemu_put_be64(f, data_size);
+    tmp_size = data_size;
+
+    while (tmp_size) {
+        uint64_t sz = tmp_size <= CHUNK_SIZE ? tmp_size : CHUNK_SIZE;
+        void *buf = g_try_malloc(sz);
+
+        if (!buf) {
+            error_report("%s: Error allocating buffer", __func__);
+            return -ENOMEM;
+        }
+
+        ret = plugin->ops->save(plugin->handle, buf, sz);
+        if (ret) {
+            error_report("%s:Failed saving device state", __func__);
+            g_free(buf);
+            return ret;
+        }
+
+        qemu_put_buffer(f, buf, sz);
+        g_free(buf);
+        tmp_size -= sz;
+    }
+
+    ret = qemu_file_get_error(f);
+    if (!ret && size) {
+        *size = data_size;
+    }
+
+    return ret;
+}
+
+static int vfio_migration_load_buffer_plugin(QEMUFile *f, VFIODevice *vbasedev,
+                            uint64_t data_size)
+{
+    int ret = 0;
+    VFIOMigrationPlugin *plugin = vbasedev->migration->plugin;
+
+    while (data_size) {
+        uint64_t sz = data_size <= CHUNK_SIZE ? data_size : CHUNK_SIZE;
+        void *buf = g_try_malloc(sz);
+
+        if (!buf) {
+            error_report("%s: Error allocating buffer", __func__);
+            return -ENOMEM;
+        }
+
+        qemu_get_buffer(f, buf, sz);
+        ret = plugin->ops->load(plugin->handle, buf, sz);
+        g_free(buf);
+        if (ret < 0) {
+            error_report("%s: Error loading device state", vbasedev->name);
+            return ret;
+        }
+
+        data_size -= sz;
+    }
+
+    return ret;
+}
+
+static VFIOMigrationOps vfio_plugin_method = {
+    .save_setup = vfio_migration_save_load_setup_plugin,
+    .load_setup = vfio_migration_save_load_setup_plugin,
+    .update_pending = vfio_migration_update_pending_plugin,
+    .save_buffer = vfio_migration_save_buffer_plugin,
+    .load_buffer = vfio_migration_load_buffer_plugin,
+    .set_state = vfio_migration_set_state_plugin,
+    .cleanup = vfio_migration_cleanup_plugin
+};
+
+int vfio_migration_probe_plugin(VFIODevice *vbasedev)
+{
+    VFIOMigration *migration = vbasedev->migration;
+
+    if (vfio_migration_load_plugin(vbasedev)) {
+        error_report("vfio migration plugin probe failed");
+        return -1;
+    }
+
+    migration->ops = &vfio_plugin_method;
+
+    return 0;
+}
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index bb62e1ca0e..24a3126a56 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -569,9 +569,16 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     vbasedev->migration = g_new0(VFIOMigration, 1);
     vbasedev->migration->vbasedev = vbasedev;
 
-    ret = vfio_migration_probe_local(vbasedev);
-    if (ret) {
-        goto add_blocker;
+    if (vbasedev->desc.arg != NULL && vbasedev->desc.path != NULL) {
+        ret = vfio_migration_probe_plugin(vbasedev);
+        if (ret) {
+            goto add_blocker;
+        }
+    } else {
+        ret = vfio_migration_probe_local(vbasedev);
+        if (ret) {
+            goto add_blocker;
+        }
     }
 
     ret = vfio_migration_register_handlers(vbasedev);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 45d6d75284..2ea016a894 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -22,6 +22,7 @@
 #define HW_VFIO_VFIO_COMMON_H
 
 #include "exec/memory.h"
+#include "qemu/iov.h"
 #include "qemu/queue.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
@@ -30,6 +31,9 @@
 #include <linux/vfio.h>
 #endif
 #include "sysemu/sysemu.h"
+#include "vfio-migration-plugin.h"
+#include <gmodule.h>
+#include <glib.h>
 
 #define VFIO_MSG_PREFIX "vfio %s: "
 
@@ -58,6 +62,12 @@ typedef struct VFIORegion {
     uint8_t nr; /* cache the region number for debug */
 } VFIORegion;
 
+typedef struct VFIOMigrationPlugin {
+    GModule *module;
+    VFIOMigrationPluginOps *ops;
+    void *handle;
+} VFIOMigrationPlugin;
+
 struct vfio_migration_plugin_desc {
     char *path;
     char *arg;
@@ -70,6 +80,7 @@ typedef struct VFIOMigration {
     VMChangeStateEntry *vm_state;
     VFIORegion region;
     VFIOMigrationOps *ops;
+    VFIOMigrationPlugin *plugin;
     uint32_t device_state;
     int vm_running;
     Notifier migration_state;
@@ -263,6 +274,7 @@ int vfio_spapr_remove_window(VFIOContainer *container,
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
 int vfio_migration_probe_local(VFIODevice *vbasedev);
+int vfio_migration_probe_plugin(VFIODevice *vbasedev);
 void vfio_migration_finalize(VFIODevice *vbasedev);
 
 #endif /* HW_VFIO_VFIO_COMMON_H */
diff --git a/include/hw/vfio/vfio-migration-plugin.h b/include/hw/vfio/vfio-migration-plugin.h
new file mode 100644
index 0000000000..02f6cc4608
--- /dev/null
+++ b/include/hw/vfio/vfio-migration-plugin.h
@@ -0,0 +1,21 @@
+#ifndef HW_VFIO_PLUGIN_MIGRATION_H
+#define HW_VFIO_PLUGIN_MIGRATION_H
+
+#include <stdint.h>
+
+#define VFIO_LM_PLUGIN_API_VERSION  0
+
+typedef struct VFIOMigrationPluginOps {
+    void *(*init)(char *devid, char *arg);
+    int (*save)(void *handle, uint8_t *state, uint64_t len);
+    int (*load)(void *handle, uint8_t *state, uint64_t len);
+    int (*update_pending)(void *handle, uint64_t *pending_bytes);
+    int (*set_state)(void *handle, uint32_t value);
+    int (*get_state)(void *handle, uint32_t *value);
+    int (*cleanup)(void *handle);
+} VFIOMigrationPluginOps;
+
+typedef int (*VFIOLMPluginGetVersion)(void);
+typedef VFIOMigrationPluginOps* (*VFIOLMPluginGetOps)(void);
+
+#endif
-- 
2.32.0


