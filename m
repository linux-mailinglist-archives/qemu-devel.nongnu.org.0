Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A6397B00
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:10:11 +0200 (CEST)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAiJ-0003fg-04
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbm-0002bY-L0
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:26 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbb-0002um-6E
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:26 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d16so332238pfn.12
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8R0Atg7saQ4X6SR6zrNuGrXq38wBBSyfe438VmYV3M=;
 b=bX5OMOKEzR9p/hbp6imDHjjQpmwQsffUO73nB98auPvjFJODrVyYJLMt8y5p5E//C2
 9B4cfgkyknHWjWCildXUsXQaUv14of6kgUVdfgC1E38GBuiOG/cJsYMm+5tKLMVsEx4y
 9bY0iGpSB2EOq+ZWR7g1GOGBixmx8JA7Pq+sKwQcTfeG3TZR4kUjf6dnmTXYFaQ2vaU1
 his2EDiEqooefGsaisSlqoud6TWHyq+Z4gZWQPpfCuglpmMxrzIopVJgdRvpkHA/ova9
 Ntzov2GgBfxvurWrv/WQiy0pdMsulC7oSyVePDqgs79W/sZSo7EDwyqyAztsEYx01vBB
 EgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8R0Atg7saQ4X6SR6zrNuGrXq38wBBSyfe438VmYV3M=;
 b=QbByFgBv8yAT5qOEqt/2QiQ73g4r6XA42AHiQJos9P9bzZXb4Oe1WvXK5hCL6spYKW
 tj431OMfDSp6xjNSRtMnF+eDKnQ9j+6UTBL5GPc+xArMrkT/tesVX5bpgS73GHIhNS8p
 4gCHzlTK+hBEPb7H+qKb2RthjrFrgE6jsdByKXi2QERgp0YYPahZGjVzO9EM6M88/qkM
 sYw+Foh4FpZfQZg/FzZcULASJkb6H/xSt39T8N5y4s2WEPAt7MzcdVhlZpHOjqcQcC39
 8m5D8x9x27RNCrTZOlpVRVHsEa6NyQOS0TlrctN/k9Yu+W/pPoAGxXYgcdZBPox5z28A
 r4ZA==
X-Gm-Message-State: AOAM533+LVlv+3dakR4JTRQm7Fy+xniasMirtJTNCaEeINAFOa7pBdoS
 LXpM2KfFJcvgyUOOivztKSeQYw==
X-Google-Smtp-Source: ABdhPJxcxnp3S9EJl3BpTW+Xvn8Ls90KZWsk3XaXtmfsnKY2PQpwzn7lgB2u0sIdDrPoEtXSUc80+A==
X-Received: by 2002:a65:52c8:: with SMTP id z8mr29974848pgp.50.1622577793416; 
 Tue, 01 Jun 2021 13:03:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm15486229pgv.90.2021.06.01.13.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:03:12 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH 3/5] vhost-user-rng: backend: Add RNG vhost-user daemon
 implementation
Date: Tue,  1 Jun 2021 14:03:03 -0600
Message-Id: <20210601200305.1772391-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
References: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: viresh.kumar@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides the vhost-user backend implementation to work
in tandem with the vhost-user-rng implementation of the QEMU VMM.

It uses the vhost-user API so that other VMM can re-use the interface
without having to write the driver again.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 tools/meson.build                        |   8 +
 tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
 tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
 tools/vhost-user-rng/meson.build         |  10 +
 4 files changed, 426 insertions(+)
 create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
 create mode 100644 tools/vhost-user-rng/main.c
 create mode 100644 tools/vhost-user-rng/meson.build

diff --git a/tools/meson.build b/tools/meson.build
index 3e5a0abfa29f..66b0a11fbb45 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -24,3 +24,11 @@ endif
 if have_virtiofsd
   subdir('virtiofsd')
 endif
+
+have_virtiorng = (have_system and
+    have_tools and
+    'CONFIG_LINUX' in config_host)
+
+if have_virtiorng
+  subdir('vhost-user-rng')
+endif
diff --git a/tools/vhost-user-rng/50-qemu-rng.json.in b/tools/vhost-user-rng/50-qemu-rng.json.in
new file mode 100644
index 000000000000..9186c3c6fe1d
--- /dev/null
+++ b/tools/vhost-user-rng/50-qemu-rng.json.in
@@ -0,0 +1,5 @@
+{
+  "description": "QEMU vhost-user-rng",
+  "type": "bridge",
+  "binary": "@libexecdir@/vhost-user-rng"
+}
diff --git a/tools/vhost-user-rng/main.c b/tools/vhost-user-rng/main.c
new file mode 100644
index 000000000000..ba7380b12659
--- /dev/null
+++ b/tools/vhost-user-rng/main.c
@@ -0,0 +1,403 @@
+/*
+ * VIRTIO RNG Emulation via vhost-user
+ *
+ * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define G_LOG_DOMAIN "vhost-user-rng"
+#define G_LOG_USE_STRUCTURED 1
+
+#include <glib.h>
+#include <gio/gio.h>
+#include <gio/gunixsocketaddress.h>
+#include <glib-unix.h>
+#include <glib/gstdio.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdbool.h>
+#include <string.h>
+#include <inttypes.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <time.h>
+#include <unistd.h>
+#include <endian.h>
+#include <assert.h>
+
+#include "qemu/cutils.h"
+#include "subprojects/libvhost-user/libvhost-user-glib.h"
+#include "subprojects/libvhost-user/libvhost-user.h"
+
+#ifndef container_of
+#define container_of(ptr, type, member) ({                      \
+        const typeof(((type *) 0)->member) * __mptr = (ptr);     \
+        (type *) ((char *) __mptr - offsetof(type, member)); })
+#endif
+
+typedef struct {
+    VugDev dev;
+    struct itimerspec ts;
+    timer_t rate_limit_timer;
+    pthread_mutex_t rng_mutex;
+    pthread_cond_t rng_cond;
+    int64_t quota_remaining;
+    bool activate_timer;
+    GMainLoop *loop;
+} VuRNG;
+
+static gboolean print_cap, verbose;
+static gchar *source_path, *socket_path;
+static gint source_fd, socket_fd = -1;
+
+/* Defaults tailored on virtio-rng.c */
+static uint32_t period_ms = 1 << 16;
+static uint64_t max_bytes = INT64_MAX;
+
+static void check_rate_limit(union sigval sv)
+{
+    VuRNG *rng = sv.sival_ptr;
+    bool wakeup = false;
+
+    pthread_mutex_lock(&rng->rng_mutex);
+    /*
+     * The timer has expired and the guest has used all available
+     * antropy, which means function vu_rng_handle_request() is waiting
+     * on us.  As such wake it up once we're done here.
+     */
+    if (rng->quota_remaining == 0) {
+        wakeup = true;
+    }
+
+    /*
+     * Reset the antropy available to the guest and tell function
+     * vu_rng_handle_requests() to start the timer before using it.
+     */
+    rng->quota_remaining = max_bytes;
+    rng->activate_timer = true;
+    pthread_mutex_unlock(&rng->rng_mutex);
+
+    if (wakeup) {
+        pthread_cond_signal(&rng->rng_cond);
+    }
+}
+
+static void setup_timer(VuRNG *rng)
+{
+    struct sigevent sev;
+    int ret;
+
+    memset(&rng->ts, 0, sizeof(struct itimerspec));
+    rng->ts.it_value.tv_sec = period_ms / 1000;
+    rng->ts.it_value.tv_nsec = (period_ms % 1000) * 1000000;
+
+    /*
+     * Call function check_rate_limit() as if it was the start of
+     * a new thread when the timer expires.
+     */
+    sev.sigev_notify = SIGEV_THREAD;
+    sev.sigev_notify_function = check_rate_limit;
+    sev.sigev_value.sival_ptr = rng;
+    /* Needs to be NULL if defaults attributes are to be used. */
+    sev.sigev_notify_attributes = NULL;
+    ret = timer_create(CLOCK_MONOTONIC, &sev, &rng->rate_limit_timer);
+    if (ret < 0) {
+        fprintf(stderr, "timer_create() failed\n");
+    }
+
+}
+
+
+/* Virtio helpers */
+static uint64_t rng_get_features(VuDev *dev)
+{
+    if (verbose) {
+        g_info("%s: replying", __func__);
+    }
+    return 0;
+}
+
+static void rng_set_features(VuDev *dev, uint64_t features)
+{
+    if (verbose && features) {
+        g_autoptr(GString) s = g_string_new("Requested un-handled feature");
+        g_string_append_printf(s, " 0x%" PRIx64 "", features);
+        g_info("%s: %s", __func__, s->str);
+    }
+}
+
+static void vu_rng_handle_requests(VuDev *dev, int qidx)
+{
+    VuRNG *rng = container_of(dev, VuRNG, dev.parent);
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+    VuVirtqElement *elem;
+    size_t to_read;
+    int len, ret;
+
+    for (;;) {
+        /* Get element in the vhost virtqueue */
+        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
+        if (!elem) {
+            break;
+        }
+
+        /* Get the amount of antropy to read from the vhost server */
+        to_read = elem->in_sg[0].iov_len;
+
+        pthread_mutex_lock(&rng->rng_mutex);
+
+        /*
+         * We have consumed all entropy available for this time slice.
+         * Wait for the timer (check_rate_limit()) to tell us about the
+         * start of a new time slice.
+         */
+        if (rng->quota_remaining == 0) {
+            pthread_cond_wait(&rng->rng_cond, &rng->rng_mutex);
+        }
+
+        /* Start the timer if the last time slice has expired */
+        if (rng->activate_timer == true) {
+            rng->activate_timer = false;
+            ret = timer_settime(rng->rate_limit_timer, 0, &rng->ts, NULL);
+            if (ret < 0) {
+                fprintf(stderr, "timer_settime() failed\n");
+            }
+        }
+
+        /* Make sure we don't read more than it's available */
+        if (rng->quota_remaining < to_read) {
+            to_read = rng->quota_remaining;
+        }
+
+        len = read(source_fd, elem->in_sg[0].iov_base, to_read);
+
+        /* Simply return 0 if an error occurs */
+        if (len < 0) {
+            len = 0;
+        }
+
+        rng->quota_remaining -= len;
+
+        pthread_mutex_unlock(&rng->rng_mutex);
+
+        vu_queue_push(dev, vq, elem, len);
+        free(elem);
+    }
+
+    vu_queue_notify(dev, vq);
+}
+
+static void
+vu_rng_queue_set_started(VuDev *dev, int qidx, bool started)
+{
+    VuVirtq *vq = vu_get_queue(dev, qidx);
+
+    g_debug("queue started %d:%d\n", qidx, started);
+
+    if (!qidx) {
+        vu_set_queue_handler(dev, vq, started ? vu_rng_handle_requests : NULL);
+    }
+}
+
+/*
+ * Any messages not handled here are processed by the libvhost library
+ * itself.
+ */
+static int rng_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
+{
+    VuRNG *rng = container_of(dev, VuRNG, dev.parent);
+
+    if (msg->request == VHOST_USER_NONE) {
+        g_main_loop_quit(rng->loop);
+        return 1;
+    }
+
+    return 0;
+}
+
+static const VuDevIface vuiface = {
+    .set_features = rng_set_features,
+    .get_features = rng_get_features,
+    .queue_set_started = vu_rng_queue_set_started,
+    .process_msg = rng_process_msg,
+};
+
+static gboolean hangup(gpointer user_data)
+{
+    GMainLoop *loop = (GMainLoop *) user_data;
+
+    g_printerr("%s: caught hangup/quit signal, quitting", __func__);
+    g_main_loop_quit(loop);
+    return true;
+}
+
+static void panic(VuDev *dev, const char *msg)
+{
+    g_critical("%s\n", msg);
+    exit(EXIT_FAILURE);
+}
+
+/* Print vhost-user.json backend program capabilities */
+static void print_capabilities(void)
+{
+    printf("{\n");
+    printf("  \"type\": \"RNG\"\n");
+    printf("  \"filename\": [ RNG source ]\n");
+    printf("}\n");
+}
+
+static GOptionEntry options[] = {
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &socket_path,
+      "Location of vhost-user Unix domain socket, incompatible with --fd",
+      "PATH" },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &socket_fd,
+      "Specify the backend file-descriptor, incompatible with --socket-path",
+      "FD" },
+    { "period", 'p', 0, G_OPTION_ARG_INT, &period_ms,
+      "Time needed (in ms) to transfer a maximum amount of byte", NULL },
+    { "max-bytes", 'm', 0, G_OPTION_ARG_INT64, &max_bytes,
+      "Maximum amount of byte that can be transferred in a period", NULL },
+    { "filename", 'n', 0, G_OPTION_ARG_FILENAME, &source_path,
+      "RNG source, defaults to /dev/urandom", "PATH" },
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &print_cap,
+      "Output to stdout the backend capabilities in JSON format and exit",
+      NULL},
+    { "verbose", 'v', 0, G_OPTION_ARG_NONE, &verbose,
+      "Be more verbose in output", NULL},
+    { NULL }
+};
+
+int main(int argc, char *argv[])
+{
+    GError *error = NULL;
+    GOptionContext *context;
+    g_autoptr(GSocket) socket = NULL;
+    char default_source[] = "/dev/urandom";
+    char *source = default_source;
+    VuRNG rng;
+
+    context = g_option_context_new("vhost-user emulation of RNG device");
+    g_option_context_add_main_entries(context, options, "vhost-user-rng");
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
+    if (socket_path && socket_fd > 0) {
+        g_printerr("Either --fd or --socket-path, not both\n");
+        exit(EXIT_FAILURE);
+    }
+
+    if (max_bytes > INT64_MAX) {
+        g_printerr("'max-bytes' parameter must be non-negative, "
+                   "and less than 2^63\n");
+        exit(EXIT_FAILURE);
+    }
+
+    if (period_ms <= 0) {
+        g_printerr("'period' parameter expects a positive integer\n");
+        exit(EXIT_FAILURE);
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
+                                                      G_SOCKET_TYPE_STREAM,
+                                                      G_SOCKET_PROTOCOL_DEFAULT,
+                                                      &error);
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
+    /* Overwrite default RNG source with what user provided, if any */
+    if (source_path) {
+        source = source_path;
+    }
+
+    source_fd = open(source, O_RDWR);
+    if (source_fd < 0) {
+        g_printerr("Failed to open RNG source %s\n", source);
+        g_socket_close(socket, &error);
+        unlink(socket_path);
+        exit(EXIT_FAILURE);
+    }
+
+    /* catch exit signals */
+    g_unix_signal_add(SIGHUP, hangup, rng.loop);
+    g_unix_signal_add(SIGINT, hangup, rng.loop);
+
+    /*
+     * Create the main loop first so all the various sources can be
+     * added. As well as catching signals we need to ensure vug_init
+     * can add it's GSource watches.
+     */
+    rng.loop = g_main_loop_new(NULL, FALSE);
+
+    if (!vug_init(&rng.dev, 1, g_socket_get_fd(socket),
+                  panic, &vuiface)) {
+        g_printerr("Failed to initialize libvhost-user-glib.\n");
+        exit(EXIT_FAILURE);
+    }
+
+    rng.quota_remaining = max_bytes;
+    rng.activate_timer = true;
+    pthread_mutex_init(&rng.rng_mutex, NULL);
+    pthread_cond_init(&rng.rng_cond, NULL);
+    setup_timer(&rng);
+
+    if (verbose) {
+        g_info("period_ms: %d tv_sec: %ld tv_nsec: %lu\n",
+               period_ms, rng.ts.it_value.tv_sec, rng.ts.it_value.tv_nsec);
+    }
+
+    g_message("entering main loop, awaiting messages");
+    g_main_loop_run(rng.loop);
+    g_message("finished main loop, cleaning up");
+
+    g_main_loop_unref(rng.loop);
+    vug_deinit(&rng.dev);
+    timer_delete(rng.rate_limit_timer);
+    close(source_fd);
+    unlink(socket_path);
+}
diff --git a/tools/vhost-user-rng/meson.build b/tools/vhost-user-rng/meson.build
new file mode 100644
index 000000000000..4dc386daf335
--- /dev/null
+++ b/tools/vhost-user-rng/meson.build
@@ -0,0 +1,10 @@
+executable('vhost-user-rng', files(
+  'main.c'),
+  dependencies: [qemuutil, glib, gio, rt],
+  install: true,
+  install_dir: get_option('libexecdir'))
+
+configure_file(input: '50-qemu-rng.json.in',
+               output: '50-qemu-rng.json',
+               configuration: config_host,
+               install_dir: qemu_datadir / 'vhost-user')
-- 
2.25.1


