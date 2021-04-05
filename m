Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900FA353D5A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 11:39:43 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTLhu-0006YM-2n
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 05:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTLgf-00068B-UX
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 05:38:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTLgc-0004E0-Lh
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 05:38:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id h8so5395314plt.7
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gStgo+6mHMyR4igOpuLM0s43NMh2kyQ4gMwdJ7OaAc=;
 b=yp/1njVOb9rpJ7xKMR5JmAvOp5FZTqh79AiO5YchJWgUVkX1+a8tyCrZyvlsbxthcq
 ecqZehQ3DCljcBck3lMouk0R05nir9l3oZXYYfr9IenOUrwG491h8LBsCTE9WCPAKnsA
 Gnw88QF0tmB/O44G93F7c6ba+W2p94dfKaXYLmNzLJA4cwMzrYW9kY0LH4hog28u7j6h
 7h/a4NeZu+5B/oOO4ff/7IbktTvAomPpRye+B53ela1eRNZtgl1u59fHJPRJk6FaDOe1
 qrRpfsHGMG1pwcaCSBw/A1sbjB3qZT9l8bI2lmO9VN/EDs+g41rV+aksz2bmo7v2HWj6
 3iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gStgo+6mHMyR4igOpuLM0s43NMh2kyQ4gMwdJ7OaAc=;
 b=N0Xs9YV5v4HfPvrewH+jaabfe6ltX1WhjX91pbDAqSr8iP1O3RtyGLsR+3cKyW+FZm
 eQe11HvMYX0LR++h7SJ2zyKOG7P7rKoNs3P1fIH7oTnhCyRpTIKa3elGI1yVSggzi43b
 2Jc9l37ztTk1n62/QTfrxEldSue80KfRamNXV14IKuv9HWuvBR4VzOX3ZfzCX5ifJDay
 qIU8ewEq5jHLt00Y3WR7oaLsjkNAXJ4ecxpGfxXejNUSx5VDTekCTW3Ni0SUWixWsOZI
 4O4F8Ig4Ev3x0UcpocTKZmpYR2zW2vEHxlH8RGplt5H39k4CfrxFVsLn1me6lXk8gK0x
 TsCg==
X-Gm-Message-State: AOAM532BwLVUhKjlrPsWzkvXYUs6n4RcV5na7G99tKFJBTjDyFfENIrR
 VaddAoDHEL/HFneU1mIqQ9nBsSl9QpFAnw==
X-Google-Smtp-Source: ABdhPJwO0M9BPPWq9W2t+B8V9j5I2FxhR+qQ2LNg3QSE3QwmKBybtYPzgbbyFXfCbVQy899ZbiNWKw==
X-Received: by 2002:a17:903:2303:b029:e6:faf5:875e with SMTP id
 d3-20020a1709032303b02900e6faf5875emr23504761plh.41.1617615500625; 
 Mon, 05 Apr 2021 02:38:20 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id q3sm5680735pgb.80.2021.04.05.02.38.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Apr 2021 02:38:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2.1 4/6] tools/vhost-user-i2c: Add backend driver
Date: Mon,  5 Apr 2021 15:08:15 +0530
Message-Id: <cc3560b392efb6ac04a35be34ef0e4dcf0026a28.1617614056.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
References: <cover.1617614056.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the vhost-user backend driver to support virtio based I2C and
SMBUS devices.

vhost-user-i2c --help

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->2.1
- Check for more smbus functionalities.
- Use better glibc helpers for string parsing.
- Remove code to check return value of memory allocation.
- Elaborate a comment.
- Minor update to meson.build

 tools/meson.build                        |   8 +
 tools/vhost-user-i2c/50-qemu-i2c.json.in |   5 +
 tools/vhost-user-i2c/main.c              | 800 +++++++++++++++++++++++
 tools/vhost-user-i2c/meson.build         |  10 +
 4 files changed, 823 insertions(+)
 create mode 100644 tools/vhost-user-i2c/50-qemu-i2c.json.in
 create mode 100644 tools/vhost-user-i2c/main.c
 create mode 100644 tools/vhost-user-i2c/meson.build

diff --git a/tools/meson.build b/tools/meson.build
index 3e5a0abfa29f..8271e110978b 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,3 +24,11 @@ endif
 if have_virtiofsd
   subdir('virtiofsd')
 endif
+
+have_virtioi2c= (have_system and
+    have_tools and
+    'CONFIG_LINUX' in config_host)
+
+if have_virtioi2c
+  subdir('vhost-user-i2c')
+endif
diff --git a/tools/vhost-user-i2c/50-qemu-i2c.json.in b/tools/vhost-user-i2c/50-qemu-i2c.json.in
new file mode 100644
index 000000000000..dafd1337fa9c
--- /dev/null
+++ b/tools/vhost-user-i2c/50-qemu-i2c.json.in
@@ -0,0 +1,5 @@
+{
+  "description": "QEMU vhost-user-i2c",
+  "type": "bridge",
+  "binary": "@libexecdir@/vhost-user-i2c"
+}
diff --git a/tools/vhost-user-i2c/main.c b/tools/vhost-user-i2c/main.c
new file mode 100644
index 000000000000..b9c7f729e882
--- /dev/null
+++ b/tools/vhost-user-i2c/main.c
@@ -0,0 +1,800 @@
+/*
+ * VIRTIO I2C Emulation via vhost-user
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define G_LOG_DOMAIN "vhost-user-i2c"
+#define G_LOG_USE_STRUCTURED 1
+
+#include <assert.h>
+#include <endian.h>
+#include <fcntl.h>
+#include <gio/gio.h>
+#include <gio/gunixsocketaddress.h>
+#include <glib.h>
+#include <glib-unix.h>
+#include <glib/gstdio.h>
+#include <inttypes.h>
+#include <linux/i2c.h>
+#include <linux/i2c-dev.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "qemu/compiler.h"
+#include "qemu/cutils.h"
+#include "standard-headers/linux/virtio_i2c.h"
+#include "subprojects/libvhost-user/libvhost-user-glib.h"
+#include "subprojects/libvhost-user/libvhost-user.h"
+
+#define VHOST_USER_I2C_MAX_QUEUES       1
+
+/* vhost-user-i2c definitions */
+
+#define MAX_I2C_VDEV                    (1 << 7)
+#define MAX_I2C_ADAPTER                 16
+
+typedef struct {
+    int32_t fd;
+    int32_t bus;
+    bool smbus;
+    bool clients[MAX_I2C_VDEV];
+} VI2cAdapter;
+
+typedef struct {
+    VugDev dev;
+    GMainLoop *loop;
+    VI2cAdapter *adapter[MAX_I2C_ADAPTER];
+    uint16_t adapter_map[MAX_I2C_VDEV];
+    uint32_t adapter_num;
+} VuI2c;
+
+static gboolean print_cap, verbose;
+static gchar *socket_path, *device_list;
+static gint socket_fd = -1;
+
+static GOptionEntry options[] = {
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &socket_path,
+      "Location of vhost-user Unix domain socket, incompatible with --fd",
+      "PATH" },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &socket_fd,
+      "Specify file-descriptor of the backend, don't use with --socket-path",
+      "FD" },
+    { "device-list", 'l', 0, G_OPTION_ARG_STRING, &device_list,
+      "List of i2c-dev bus and attached devices", "I2C Devices" },
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &print_cap,
+      "Output to stdout the backend capabilities in JSON format and exit",
+      NULL},
+    { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose,
+      "Be more verbose in output", NULL},
+    { NULL }
+};
+
+
+/* I2c helpers */
+static void fmt_bytes(GString *s, uint8_t *bytes, int len)
+{
+    int32_t i;
+    for (i = 0; i < len; i++) {
+        if (i && i % 16 == 0) {
+            g_string_append_c(s, '\n');
+        }
+        g_string_append_printf(s, "%x ", bytes[i]);
+    }
+}
+
+static void vi2c_dump_msg(struct i2c_msg *msgs, size_t count)
+{
+    int32_t i;
+
+    for (i = 0; i < count; i++) {
+        g_autoptr(GString) s = g_string_new("\nI2c request: ");
+
+        g_string_append_printf(s, "addr: %x\n", msgs[i].addr);
+        g_string_append_printf(s, "transfer len: %x\n", msgs[i].len);
+
+        g_string_append_printf(s, "%s: ", msgs[i].flags & I2C_M_RD ?
+                               "Data read" : "Data Written");
+        fmt_bytes(s, (uint8_t *)msgs[i].buf, msgs[i].len);
+        g_string_append_printf(s, "\n");
+
+        g_debug("%s: %s", __func__, s->str);
+    }
+}
+
+static int vi2c_map_adapters(VuI2c *i2c)
+{
+    VI2cAdapter *adapter;
+    int32_t i, client_addr;
+
+    /*
+     * Flatten the map for client address and adapter to the array:
+     *
+     * adapter_map[MAX_I2C_VDEV]:
+     *
+     * Adapter        | adapter2 | none  | adapter1 | adapter3 | none| (val)
+     *                |----------|-------|----------|----------|-----|
+     * Slave Address  | addr 1   | none  | addr 2   | addr 3   | none| (idx)
+     *                |<-----------------------MAX_I2C_VDEV---------------->|
+     */
+    for (i = 0; i < i2c->adapter_num; i++) {
+        adapter = i2c->adapter[i];
+
+        for (client_addr = 0; client_addr < MAX_I2C_VDEV; client_addr++) {
+            if (adapter->clients[client_addr]) {
+                if (i2c->adapter_map[client_addr]) {
+                    g_printerr("client addr %x repeated, not supported!\n",
+                               client_addr);
+                    return -1;
+                }
+
+                /* The array is initialized to 0, + 1 for index */
+                i2c->adapter_map[client_addr] = i + 1;
+                if (verbose) {
+                    g_print("client: 0x%x -> i2c adapter: %d\n", client_addr,
+                            adapter->bus);
+                }
+            }
+        }
+    }
+    return 0;
+}
+
+static VI2cAdapter *vi2c_find_adapter(VuI2c *i2c, uint16_t addr)
+{
+    if (addr < MAX_I2C_VDEV && (i2c->adapter_map[addr] != 0)) {
+        return i2c->adapter[i2c->adapter_map[addr] - 1];
+    }
+
+    return NULL;
+}
+
+static bool vi2c_set_client_addr(VI2cAdapter *adapter, uint16_t addr)
+{
+    if (ioctl(adapter->fd, I2C_SLAVE, addr) < 0) {
+        if (errno == EBUSY) {
+            g_printerr("client device %x is busy!\n", addr);
+        } else {
+            g_printerr("client device %d does not exist!\n", addr);
+        }
+        return false;
+    }
+    return true;
+}
+
+static void vi2c_remove_adapters(VuI2c *i2c)
+{
+    VI2cAdapter *adapter;
+    int32_t i;
+
+    for (i = 0; i < MAX_I2C_ADAPTER; i++) {
+        adapter = i2c->adapter[i];
+        if (!adapter) {
+            break;
+        }
+
+        if (adapter->fd > 0) {
+            close(adapter->fd);
+        }
+
+        g_free(adapter);
+        i2c->adapter[i] = NULL;
+    }
+}
+
+static VI2cAdapter *vi2c_create_adapter(int32_t bus, uint16_t client_addr[],
+                                        int32_t n_client)
+{
+    g_autofree VI2cAdapter *adapter = NULL;
+    g_autofree char *path = NULL;
+    uint64_t funcs;
+    int32_t fd, i;
+
+    if (bus < 0) {
+        return NULL;
+    }
+
+    adapter = g_malloc0(sizeof(*adapter));
+    path = g_strdup_printf("/dev/i2c-%d", bus);
+
+    fd = open(path, O_RDWR);
+    if (fd < 0) {
+        g_printerr("virtio_i2c: failed to open %s\n", path);
+        return NULL;
+    }
+
+    adapter->fd = fd;
+    adapter->bus = bus;
+
+    if (ioctl(fd, I2C_FUNCS, &funcs) < 0) {
+        g_printerr("virtio_i2c: failed to get functionality %s: %d\n", path,
+                   errno);
+        goto close_fd;
+    }
+
+    if (funcs & I2C_FUNC_I2C) {
+        adapter->smbus = false;
+    } else if (funcs & (I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BYTE |
+                        I2C_FUNC_SMBUS_BYTE_DATA)) {
+        adapter->smbus = true;
+    } else {
+        g_printerr("virtio_i2c: invalid functionality %lx\n", funcs);
+        goto close_fd;
+    }
+
+    for (i = 0; i < n_client; i++) {
+        if (client_addr[i]) {
+            if (!vi2c_set_client_addr(adapter, client_addr[i])) {
+                goto close_fd;
+            }
+
+            if (adapter->clients[client_addr[i]]) {
+                g_printerr("client addr 0x%x repeat, not allowed.\n",
+                           client_addr[i]);
+                goto close_fd;
+            }
+
+            adapter->clients[client_addr[i]] = true;
+            if (verbose) {
+                g_print("Added client 0x%x to bus %u\n", client_addr[i], bus);
+            }
+        }
+    }
+
+    if (verbose) {
+        g_print("Added adapter: bus: %d, func %s\n", bus,
+                adapter->smbus ? "smbus" : "i2c");
+    }
+    return g_steal_pointer(&adapter);
+
+close_fd:
+    close(fd);
+    return NULL;
+}
+
+/*
+ * Virtio I2C device list format.
+ *
+ * <bus>:<client_addr>[:<client_addr>],
+ * [<bus>:<client_addr>[:<client_addr>]]
+ *
+ * bus (dec): adatper bus number.
+ *     e.g. 2 for /dev/i2c-2
+ * client_addr (hex): address for client device
+ *     e.g. 0x1C or 1C
+ *
+ * Example: --device-list="2:0x1c:0x20,3:0x10:0x2c"
+ *
+ * Note: client address can not repeat.
+ */
+static int32_t vi2c_parse(VuI2c *i2c)
+{
+    uint16_t client_addr[MAX_I2C_VDEV];
+    int32_t n_adapter = 0, n_client, i, j;
+    int64_t addr, bus;
+    gchar **cp, **dev;
+
+    cp = g_strsplit(device_list, ",", 0);
+
+    /* Read <bus>:<client_addr>[:<client_addr>] entries one by one */
+    for (i = 0; cp[i] && *cp[i] != '\0'; i++) {
+        if (n_adapter == MAX_I2C_ADAPTER) {
+            g_printerr("too many adapter (%d), only support %d\n", n_adapter,
+                       MAX_I2C_ADAPTER);
+            goto out;
+        }
+
+        dev = g_strsplit(cp[i], ":", 0);
+
+        if (qemu_strtol(dev[0], NULL, 10, &bus) || bus < 0) {
+            g_printerr("Invalid bus number %s\n", dev[0]);
+            goto out;
+        }
+
+        /* Parse clients <client_addr>[:<client_addr>] entries one by one */
+        for (n_client = 0, j = 1; dev[j] && *dev[j] != '\0'; j++) {
+            if (n_client == MAX_I2C_VDEV) {
+                g_printerr("too many devices (%d), only support %d\n",
+                           n_client, MAX_I2C_VDEV);
+                g_strfreev(dev);
+                goto out;
+            }
+
+            if (qemu_strtol(dev[j], NULL, 16, &addr) ||
+                addr < 0 || addr > MAX_I2C_VDEV) {
+                g_printerr("Invalid address %s : %lx\n", dev[j], addr);
+                g_strfreev(dev);
+                goto out;
+            }
+
+            client_addr[n_client++] = addr;
+            if (verbose) {
+                g_print("i2c adapter %ld:0x%lx\n", bus, addr);
+            }
+        }
+        g_strfreev(dev);
+
+        i2c->adapter[n_adapter] = vi2c_create_adapter(bus, client_addr,
+                                                      n_client);
+        if (!i2c->adapter[n_adapter]) {
+            goto out;
+        }
+
+        n_adapter++;
+    }
+    g_strfreev(cp);
+
+    if (!n_adapter) {
+        g_printerr("Failed to add any adapters\n");
+        return -1;
+    }
+
+    i2c->adapter_num = n_adapter;
+
+    if (!vi2c_map_adapters(i2c)) {
+        return 0;
+    }
+
+out:
+    g_strfreev(cp);
+    vi2c_remove_adapters(i2c);
+    return -1;
+}
+
+static int32_t i2c_xfer(VI2cAdapter *adapter, struct i2c_msg *msgs,
+                        size_t count)
+{
+    struct i2c_rdwr_ioctl_data data;
+
+    data.nmsgs = count;
+    data.msgs = msgs;
+
+    return ioctl(adapter->fd, I2C_RDWR, &data);
+}
+
+/*
+ * Based on Linux's drivers/i2c/i2c-core-smbus.c:i2c_smbus_xfer_emulated(). This
+ * function tries to reverse what Linux does, only support basic modes (up to
+ * word transfer).
+ */
+static int32_t smbus_xfer(VI2cAdapter *adapter, struct i2c_msg *msgs,
+                          size_t count)
+{
+    union i2c_smbus_data data;
+    struct i2c_smbus_ioctl_data smbus_data = { .data = &data };
+    int32_t ret;
+
+    smbus_data.command = msgs[0].buf[0];
+
+    switch (count) {
+    case 1:
+        if (msgs[0].flags & I2C_M_RD) {
+            if (msgs[0].len > 1) {
+                g_printerr("Incorrect message length for read operation: %d\n",
+                           msgs[0].len);
+                return -1;
+            }
+            smbus_data.read_write = I2C_SMBUS_READ;
+        } else {
+            smbus_data.read_write = I2C_SMBUS_WRITE;
+        }
+
+        if (!msgs[0].len) {
+            smbus_data.size = I2C_SMBUS_QUICK;
+            smbus_data.data = NULL;
+        } else if (msgs[0].len == 1) {
+            smbus_data.size = I2C_SMBUS_BYTE;
+            if (smbus_data.read_write == I2C_SMBUS_WRITE) {
+                smbus_data.data = NULL;
+            }
+        } else if (msgs[0].len == 2) {
+            smbus_data.size = I2C_SMBUS_BYTE_DATA;
+            data.byte = msgs[0].buf[1];
+        } else if (msgs[0].len == 3) {
+            smbus_data.size = I2C_SMBUS_WORD_DATA;
+            data.word = msgs[0].buf[1] | (msgs[0].buf[2] << 8);
+        } else {
+            g_printerr("Message length not supported for write operation: %d\n",
+                       msgs[0].len);
+            return -1;
+        }
+
+        break;
+    case 2:
+        if ((msgs[0].flags & I2C_M_RD) || !(msgs[1].flags & I2C_M_RD) ||
+            (msgs[0].len != 1) || (msgs[1].len > 2)) {
+            g_printerr("Expecting a valid read smbus transfer: %ld: %d: %d\n",
+                       count, msgs[0].len, msgs[1].len);
+            return -1;
+        }
+
+        smbus_data.read_write = I2C_SMBUS_READ;
+        smbus_data.size = msgs[1].len == 1 ?
+                          I2C_SMBUS_BYTE_DATA : I2C_SMBUS_WORD_DATA;
+        break;
+    default:
+        g_printerr("Invalid number of messages for smbus xfer: %ld\n", count);
+        return -1;
+    }
+
+    if (verbose) {
+        g_print("SMBUS command: %x: %x: %x\n", smbus_data.read_write,
+                smbus_data.command, smbus_data.size);
+    }
+
+    ret = ioctl(adapter->fd, I2C_SMBUS, &smbus_data);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (smbus_data.read_write == I2C_SMBUS_WRITE) {
+        return 0;
+    }
+
+    switch (smbus_data.size) {
+    case I2C_SMBUS_BYTE:
+        msgs[0].buf[0] = data.byte;
+        break;
+    case I2C_SMBUS_BYTE_DATA:
+        msgs[1].buf[0] = data.byte;
+        break;
+    case I2C_SMBUS_WORD_DATA:
+        msgs[1].buf[0] = data.word & 0xff;
+        msgs[1].buf[1] = data.word >> 8;
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t vi2c_xfer(VuDev *dev, struct i2c_msg *msgs, size_t count)
+{
+    VuI2c *i2c = container_of(dev, VuI2c, dev.parent);
+    VI2cAdapter *adapter;
+    int8_t ret;
+
+    /* Assume that adapter should be same for all messages sent together */
+    adapter = vi2c_find_adapter(i2c, msgs[0].addr);
+    if (!adapter) {
+        g_printerr("Failed to find adapter for address: %x\n", msgs[0].addr);
+        return VIRTIO_I2C_MSG_ERR;
+    }
+
+    /* Set client's address */
+    if (!vi2c_set_client_addr(adapter, msgs[0].addr)) {
+        return VIRTIO_I2C_MSG_ERR;
+    }
+
+    if (adapter->smbus) {
+        ret = smbus_xfer(adapter, msgs, count);
+    } else {
+        ret = i2c_xfer(adapter, msgs, count);
+    }
+
+    if (ret < 0) {
+        g_printerr("Failed to transfer data to address %x : %d\n",
+                   msgs[0].addr, errno);
+        return VIRTIO_I2C_MSG_ERR;
+    }
+
+    if (verbose) {
+        vi2c_dump_msg(msgs, count);
+    }
+
+    return VIRTIO_I2C_MSG_OK;
+}
+
+/* Virtio helpers */
+static uint64_t vi2c_get_features(VuDev *dev)
+{
+    if (verbose) {
+        g_info("%s: replying", __func__);
+    }
+    return 0;
+}
+
+static void vi2c_set_features(VuDev *dev, uint64_t features)
+{
+    if (verbose && features) {
+        g_autoptr(GString) s = g_string_new("Requested un-handled feature");
+        g_string_append_printf(s, " 0x%" PRIx64 "", features);
+        g_info("%s: %s", __func__, s->str);
+    }
+}
+
+static void vi2c_handle_ctrl(VuDev *dev, int qidx)
+{
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+    struct virtio_i2c_out_hdr *out_hdr;
+    size_t i, count = 0, len, in_hdr_len;
+    struct i2c_msg *msgs;
+    VuVirtqElement *elem;
+    uint8_t status;
+    struct {
+        struct virtio_i2c_in_hdr *in_hdr;
+        VuVirtqElement *elem;
+        size_t size;
+    } *info;
+
+    /*
+     * Count number of messages.
+     *
+     * We don't necessarily need to do this for transfers with I2C masters, but
+     * for SMBUS transfers, where is single read operation can come in two
+     * different virtio messages.
+     *
+     * Otherwise too for the I2C transfers, it optimizes the transfers anyway as
+     * we don't need to call the ioctl again and again.
+     */
+    do {
+        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
+    } while (elem && ++count);
+
+    if (!count) {
+        if (verbose) {
+            g_printerr("Virtqueue can't have 0 elements\n");
+        }
+        return;
+    }
+
+    /* Rewind everything, now that we have counted the number of messages */
+    vu_queue_rewind(dev, vq, count);
+
+    if (verbose) {
+        g_print("Received %ld messages in virtqueue\n", count);
+    }
+
+    /* Allocate memory for msgs and info */
+    msgs = g_malloc0_n(count, sizeof(*msgs) + sizeof(*info));
+    info = (void *)(msgs + count);
+
+    for (i = 0; i < count; i++) {
+        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
+        assert(elem);
+
+        info[i].elem = elem;
+        info[i].size = sizeof(*info[i].in_hdr);
+
+        g_debug("%s: got queue (in %d, out %d)", __func__, elem->in_num,
+                elem->out_num);
+
+        /* Validate size of "out" header */
+        if (elem->out_sg[0].iov_len != sizeof(*out_hdr)) {
+            g_warning("%s: Invalid out hdr %zu : %zu\n", __func__,
+                      elem->out_sg[0].iov_len, sizeof(*out_hdr));
+            goto out;
+        }
+
+        out_hdr = elem->out_sg[0].iov_base;
+
+        /* Bit 0 is reserved in virtio spec */
+        msgs[i].addr = le16toh(out_hdr->addr) >> 1;
+
+        /* Read Operation */
+        if (elem->out_num == 1 && elem->in_num == 2) {
+            len = elem->in_sg[0].iov_len;
+            if (!len) {
+                g_warning("%s: Read buffer length can't be zero\n", __func__);
+                goto out;
+            }
+
+            msgs[i].buf = elem->in_sg[0].iov_base;
+            msgs[i].flags = I2C_M_RD;
+            msgs[i].len = len;
+
+            info[i].in_hdr = elem->in_sg[1].iov_base;
+            info[i].size += len;
+            in_hdr_len = elem->in_sg[1].iov_len;
+        } else if (elem->out_num == 2 && elem->in_num == 1) {
+            /* Write Operation */
+            len = elem->out_sg[1].iov_len;
+            if (!len) {
+                g_warning("%s: Write buffer length can't be zero\n", __func__);
+                goto out;
+            }
+
+            msgs[i].buf = elem->out_sg[1].iov_base;
+            msgs[i].flags = 0;
+            msgs[i].len = len;
+
+            info[i].in_hdr = elem->in_sg[0].iov_base;
+            in_hdr_len = elem->in_sg[0].iov_len;
+        } else {
+            g_warning("%s: Transfer type not supported (in %d, out %d)\n",
+                      __func__, elem->in_num, elem->out_num);
+            goto out;
+        }
+
+        /* Validate size of "in" header */
+        if (in_hdr_len != sizeof(*(info[i].in_hdr))) {
+            g_warning("%s: Invalid in hdr %zu : %zu\n", __func__, in_hdr_len,
+                      sizeof(*(info[i].in_hdr)));
+            goto out;
+        }
+    }
+
+    status = vi2c_xfer(dev, msgs, count);
+
+    for (i = 0; i < count; i++) {
+        info[i].in_hdr->status = status;
+        vu_queue_push(dev, vq, info[i].elem, info[i].size);
+    }
+
+    vu_queue_notify(dev, vq);
+
+out:
+    g_free(msgs);
+}
+
+static void
+vi2c_queue_set_started(VuDev *dev, int qidx, bool started)
+{
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+
+    g_debug("queue started %d:%d\n", qidx, started);
+
+    if (!qidx) {
+        vu_set_queue_handler(dev, vq, started ? vi2c_handle_ctrl : NULL);
+    }
+}
+
+/*
+ * vi2c_process_msg: process messages of vhost-user interface
+ *
+ * Any that are not handled here are processed by the libvhost library
+ * itself.
+ */
+static int vi2c_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
+{
+    VuI2c *i2c = container_of(dev, VuI2c, dev.parent);
+
+    if (msg->request == VHOST_USER_NONE) {
+        g_main_loop_quit(i2c->loop);
+        return 1;
+    }
+
+    return 0;
+}
+
+static const VuDevIface vuiface = {
+    .set_features = vi2c_set_features,
+    .get_features = vi2c_get_features,
+    .queue_set_started = vi2c_queue_set_started,
+    .process_msg = vi2c_process_msg,
+};
+
+static gboolean hangup(gpointer user_data)
+{
+    GMainLoop *loop = (GMainLoop *) user_data;
+    g_info("%s: caught hangup/quit signal, quitting main loop", __func__);
+    g_main_loop_quit(loop);
+    return true;
+}
+
+static void vi2c_panic(VuDev *dev, const char *msg)
+{
+    g_critical("%s\n", msg);
+    exit(EXIT_FAILURE);
+}
+
+/* Print vhost-user.json backend program capabilities */
+static void print_capabilities(void)
+{
+    printf("{\n");
+    printf("  \"type\": \"i2c\"\n");
+    printf("  \"device-list\"\n");
+    printf("}\n");
+}
+
+static void vi2c_destroy(VuI2c *i2c)
+{
+    vi2c_remove_adapters(i2c);
+    vug_deinit(&i2c->dev);
+    if (socket_path) {
+        unlink(socket_path);
+    }
+}
+
+int main(int argc, char *argv[])
+{
+    GError *error = NULL;
+    GOptionContext *context;
+    g_autoptr(GSocket) socket = NULL;
+    VuI2c i2c = {0};
+
+    context = g_option_context_new("vhost-user emulation of I2C device");
+    g_option_context_add_main_entries(context, options, "vhost-user-i2c");
+    if (!g_option_context_parse(context, &argc, &argv, &error)) {
+        g_printerr("option parsing failed: %s\n", error->message);
+        exit(1);
+    }
+
+    if (print_cap) {
+        print_capabilities();
+        exit(0);
+    }
+
+    if (!socket_path && socket_fd < 0) {
+        g_printerr("Please specify either --fd or --socket-path\n");
+        exit(EXIT_FAILURE);
+    }
+
+    if (verbose) {
+        g_log_set_handler(NULL, G_LOG_LEVEL_MASK, g_log_default_handler, NULL);
+        g_setenv("G_MESSAGES_DEBUG", "all", true);
+    } else {
+        g_log_set_handler(NULL, G_LOG_LEVEL_WARNING | G_LOG_LEVEL_CRITICAL |
+                          G_LOG_LEVEL_ERROR, g_log_default_handler, NULL);
+    }
+
+    /*
+     * Now create a vhost-user socket that we will receive messages
+     * on. Once we have our handler set up we can enter the glib main
+     * loop.
+     */
+    if (socket_path) {
+        g_autoptr(GSocketAddress) addr = g_unix_socket_address_new(socket_path);
+        g_autoptr(GSocket) bind_socket = g_socket_new(G_SOCKET_FAMILY_UNIX,
+                    G_SOCKET_TYPE_STREAM, G_SOCKET_PROTOCOL_DEFAULT, &error);
+
+        if (!g_socket_bind(bind_socket, addr, false, &error)) {
+            g_printerr("Failed to bind to socket at %s (%s).\n",
+                       socket_path, error->message);
+            exit(EXIT_FAILURE);
+        }
+        if (!g_socket_listen(bind_socket, &error)) {
+            g_printerr("Failed to listen on socket %s (%s).\n",
+                       socket_path, error->message);
+        }
+        g_message("awaiting connection to %s", socket_path);
+        socket = g_socket_accept(bind_socket, NULL, &error);
+        if (!socket) {
+            g_printerr("Failed to accept on socket %s (%s).\n",
+                       socket_path, error->message);
+        }
+    } else {
+        socket = g_socket_new_from_fd(socket_fd, &error);
+        if (!socket) {
+            g_printerr("Failed to connect to FD %d (%s).\n",
+                       socket_fd, error->message);
+            exit(EXIT_FAILURE);
+        }
+    }
+
+    if (vi2c_parse(&i2c)) {
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * Create the main loop first so all the various sources can be
+     * added. As well as catching signals we need to ensure vug_init
+     * can add it's GSource watches.
+     */
+
+    i2c.loop = g_main_loop_new(NULL, FALSE);
+    /* catch exit signals */
+    g_unix_signal_add(SIGHUP, hangup, i2c.loop);
+    g_unix_signal_add(SIGINT, hangup, i2c.loop);
+
+    if (!vug_init(&i2c.dev, VHOST_USER_I2C_MAX_QUEUES, g_socket_get_fd(socket),
+                  vi2c_panic, &vuiface)) {
+        g_printerr("Failed to initialize libvhost-user-glib.\n");
+        exit(EXIT_FAILURE);
+    }
+
+
+    g_message("entering main loop, awaiting messages");
+    g_main_loop_run(i2c.loop);
+    g_message("finished main loop, cleaning up");
+
+    g_main_loop_unref(i2c.loop);
+    vi2c_destroy(&i2c);
+}
diff --git a/tools/vhost-user-i2c/meson.build b/tools/vhost-user-i2c/meson.build
new file mode 100644
index 000000000000..4b0156053f5d
--- /dev/null
+++ b/tools/vhost-user-i2c/meson.build
@@ -0,0 +1,10 @@
+executable('vhost-user-i2c', files(
+  'main.c'),
+  dependencies: [qemuutil, glib, gio],
+  install: true,
+  install_dir: get_option('libexecdir'))
+
+configure_file(input: '50-qemu-i2c.json.in',
+               output: '50-qemu-i2c.json',
+               configuration: { 'libexecdir' : get_option('prefix') / get_option('libexecdir') },
+               install_dir: qemu_datadir / 'vhost-user')
-- 
2.25.0.rc1.19.g042ed3e048af


