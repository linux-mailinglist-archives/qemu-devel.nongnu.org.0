Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9237D41B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:11:27 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvCY-0005h5-Ij
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguV6-0002A6-0a
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUz-0000ok-Ah
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=V4Bs5zwojnUESj9T0xGfn8nbKeLSbNirWo1Or+zmo0g=; b=D4V1UDh59nUJ
 enmDL2uhLhWNOLT2mQYK6ESC9uKHeL1rmVmbIqhFa7fDSETvsrQcMVgcCvefdgv+Ro3vF4issM1Fd
 WIObJcbfjwCTOS7cD5LrY9HBy1CSxPqjSG61TqMZn83EeoF1veGUE7fJrVGvEceBuYMNYMkdvPBxT
 VATwA=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUt-002BHm-N1; Wed, 12 May 2021 22:26:19 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH v1 1/7] migration/snapshot: Introduce qemu-snapshot tool
Date: Wed, 12 May 2021 22:26:13 +0300
Message-Id: <20210512192619.537268-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
References: <20210512192619.537268-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Execution environment, command-line argument parsing, usage/version info etc.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snapshot.h |  59 ++++++
 meson.build             |   2 +
 qemu-snapshot-vm.c      |  57 ++++++
 qemu-snapshot.c         | 439 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 557 insertions(+)
 create mode 100644 include/qemu-snapshot.h
 create mode 100644 qemu-snapshot-vm.c
 create mode 100644 qemu-snapshot.c

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
new file mode 100644
index 0000000000..154e11e9a5
--- /dev/null
+++ b/include/qemu-snapshot.h
@@ -0,0 +1,59 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_SNAPSHOT_H
+#define QEMU_SNAPSHOT_H
+
+/* Invalid offset */
+#define INVALID_OFFSET              -1
+/* Maximum byte count for qemu_get_buffer_in_place() */
+#define INPLACE_READ_MAX            (32768 - 4096)
+
+/* Backing cluster size */
+#define BDRV_CLUSTER_SIZE           (1024 * 1024)
+
+/* Minimum supported target page size */
+#define PAGE_SIZE_MIN               4096
+/*
+ * Maximum supported target page size. The limit is caused by using
+ * QEMUFile and qemu_get_buffer_in_place() on migration channel.
+ * IO_BUF_SIZE is currently 32KB.
+ */
+#define PAGE_SIZE_MAX               16384
+/* RAM slice size for snapshot saving */
+#define SLICE_SIZE                  PAGE_SIZE_MAX
+/* RAM slice size for snapshot revert */
+#define SLICE_SIZE_REVERT           (16 * PAGE_SIZE_MAX)
+
+typedef struct StateSaveCtx {
+    BlockBackend *blk;          /* Block backend */
+} StateSaveCtx;
+
+typedef struct StateLoadCtx {
+    BlockBackend *blk;          /* Block backend */
+} StateLoadCtx;
+
+extern int64_t page_size;       /* Page size */
+extern int64_t page_mask;       /* Page mask */
+extern int page_bits;           /* Page size bits */
+extern int64_t slice_size;      /* RAM slice size */
+extern int64_t slice_mask;      /* RAM slice mask */
+extern int slice_bits;          /* RAM slice size bits */
+
+void ram_init_state(void);
+void ram_destroy_state(void);
+StateSaveCtx *get_save_context(void);
+StateLoadCtx *get_load_context(void);
+int coroutine_fn save_state_main(StateSaveCtx *s);
+int coroutine_fn load_state_main(StateLoadCtx *s);
+
+#endif /* QEMU_SNAPSHOT_H */
diff --git a/meson.build b/meson.build
index 0b41ff4118..b851671914 100644
--- a/meson.build
+++ b/meson.build
@@ -2361,6 +2361,8 @@ if have_tools
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls], install: true)
+  qemu_snapshot = executable('qemu-snapshot', files('qemu-snapshot.c', 'qemu-snapshot-vm.c'),
+               dependencies: [blockdev, qemuutil, migration], install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
diff --git a/qemu-snapshot-vm.c b/qemu-snapshot-vm.c
new file mode 100644
index 0000000000..f7695e75c7
--- /dev/null
+++ b/qemu-snapshot-vm.c
@@ -0,0 +1,57 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
+#include "qemu/coroutine.h"
+#include "qemu/cutils.h"
+#include "qemu/bitmap.h"
+#include "qemu/error-report.h"
+#include "io/channel-buffer.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/ram.h"
+#include "qemu-snapshot.h"
+
+/* RAM transfer context */
+typedef struct RAMCtx {
+    int64_t normal_pages;       /* Total number of normal pages */
+} RAMCtx;
+
+static RAMCtx ram_ctx;
+
+int coroutine_fn save_state_main(StateSaveCtx *s)
+{
+    /* TODO: implement */
+    return 0;
+}
+
+int coroutine_fn load_state_main(StateLoadCtx *s)
+{
+    /* TODO: implement */
+    return 0;
+}
+
+/* Initialize snapshot RAM state */
+void ram_init_state(void)
+{
+    RAMCtx *ram = &ram_ctx;
+
+    memset(ram, 0, sizeof(ram_ctx));
+}
+
+/* Destroy snapshot RAM state */
+void ram_destroy_state(void)
+{
+    /* TODO: implement */
+}
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
new file mode 100644
index 0000000000..7ac4ef66c4
--- /dev/null
+++ b/qemu-snapshot.c
@@ -0,0 +1,439 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <getopt.h>
+
+#include "qemu-common.h"
+#include "qemu-version.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/runstate.h" /* for qemu_system_killed() prototype */
+#include "qemu/cutils.h"
+#include "qemu/coroutine.h"
+#include "qemu/error-report.h"
+#include "qemu/config-file.h"
+#include "qemu/log.h"
+#include "qemu/option_int.h"
+#include "trace/control.h"
+#include "io/channel-util.h"
+#include "io/channel-buffer.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+#include "qemu-snapshot.h"
+
+int64_t page_size;
+int64_t page_mask;
+int page_bits;
+int64_t slice_size;
+int64_t slice_mask;
+int slice_bits;
+
+static QemuOptsList snap_blk_optslist = {
+    .name = "blockdev",
+    .implied_opt_name = "file.filename",
+    .head = QTAILQ_HEAD_INITIALIZER(snap_blk_optslist.head),
+    .desc = {
+        { /*End of the list */ }
+    },
+};
+
+static struct {
+    bool revert;                /* Operation is snapshot revert */
+
+    int fd;                     /* Migration channel fd */
+    int rp_fd;                  /* Return path fd (for postcopy) */
+
+    const char *blk_optstr;     /* Command-line options for vmstate blockdev */
+    QDict *blk_options;         /* Blockdev options */
+    int blk_flags;              /* Blockdev flags */
+
+    bool postcopy;              /* Use postcopy */
+    int postcopy_percent;       /* Start postcopy after % of normal pages loaded */
+} params;
+
+static StateSaveCtx state_save_ctx;
+static StateLoadCtx state_load_ctx;
+
+static enum {
+    RUNNING = 0,
+    TERMINATED
+} state;
+
+#ifdef CONFIG_POSIX
+void qemu_system_killed(int signum, pid_t pid)
+{
+}
+#endif /* CONFIG_POSIX */
+
+StateSaveCtx *get_save_context(void)
+{
+    return &state_save_ctx;
+}
+
+StateLoadCtx *get_load_context(void)
+{
+    return &state_load_ctx;
+}
+
+static void init_save_context(void)
+{
+    memset(&state_save_ctx, 0, sizeof(state_save_ctx));
+}
+
+static void destroy_save_context(void)
+{
+    /* TODO: implement */
+}
+
+static void init_load_context(void)
+{
+    memset(&state_load_ctx, 0, sizeof(state_load_ctx));
+}
+
+static void destroy_load_context(void)
+{
+    /* TODO: implement */
+}
+
+static BlockBackend *image_open_opts(const char *optstr, QDict *options, int flags)
+{
+    BlockBackend *blk;
+    Error *local_err = NULL;
+
+    /* Open image and create block backend */
+    blk = blk_new_open(NULL, NULL, options, flags, &local_err);
+    if (!blk) {
+        error_reportf_err(local_err, "Failed to open image '%s': ", optstr);
+        return NULL;
+    }
+
+    blk_set_enable_write_cache(blk, true);
+
+    return blk;
+}
+
+/* Use BH to enter coroutine from the main loop */
+static void enter_co_bh(void *opaque)
+{
+    Coroutine *co = (Coroutine *) opaque;
+    qemu_coroutine_enter(co);
+}
+
+static void coroutine_fn snapshot_save_co(void *opaque)
+{
+    StateSaveCtx *s = get_save_context();
+    int res = -1;
+
+    init_save_context();
+
+    /* Block backend */
+    s->blk = image_open_opts(params.blk_optstr, params.blk_options,
+                             params.blk_flags);
+    if (!s->blk) {
+        goto fail;
+    }
+
+    res = save_state_main(s);
+    if (res) {
+        error_report("Failed to save snapshot: %s", strerror(-res));
+    }
+
+fail:
+    destroy_save_context();
+    state = TERMINATED;
+}
+
+static void coroutine_fn snapshot_load_co(void *opaque)
+{
+    StateLoadCtx *s = get_load_context();
+    int res = -1;
+
+    init_load_context();
+
+    /* Block backend */
+    s->blk = image_open_opts(params.blk_optstr, params.blk_options,
+                             params.blk_flags);
+    if (!s->blk) {
+        goto fail;
+    }
+
+    res = load_state_main(s);
+    if (res) {
+        error_report("Failed to load snapshot: %s", strerror(-res));
+    }
+
+fail:
+    destroy_load_context();
+    state = TERMINATED;
+}
+
+static void usage(const char *name)
+{
+    printf(
+        "Usage: %s [options] <image-blockspec>\n"
+        "QEMU External Snapshot Utility\n"
+        "\n"
+        "'image-blockspec' is a block device specification for vmstate image\n"
+        "\n"
+        "  -h, --help                display this help and exit\n"
+        "  -V, --version             output version information and exit\n"
+        "\n"
+        "Options:\n"
+        "  -T, --trace [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
+        "                            specify tracing options\n"
+        "  -r, --revert              revert to snapshot\n"
+        "      --uri=fd:<fd>         specify migration fd\n"
+        "      --page-size=<size>    specify target page size\n"
+        "      --postcopy=<%%ram>     switch to postcopy after %%ram loaded\n"
+        "\n"
+        QEMU_HELP_BOTTOM "\n", name);
+}
+
+static void version(const char *name)
+{
+    printf(
+        "%s " QEMU_FULL_VERSION "\n"
+        "Written by Andrey Gruzdev.\n"
+        "\n"
+        QEMU_COPYRIGHT "\n"
+        "This is free software; see the source for copying conditions.  There is NO\n"
+        "warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n",
+        name);
+}
+
+enum {
+    OPTION_PAGE_SIZE = 256,
+    OPTION_POSTCOPY,
+    OPTION_URI,
+};
+
+static void process_options(int argc, char *argv[])
+{
+    static const char *s_opt = "rhVT:";
+    static const struct option l_opt[] = {
+        { "page-size", required_argument, NULL, OPTION_PAGE_SIZE },
+        { "postcopy", required_argument, NULL, OPTION_POSTCOPY },
+        { "uri", required_argument, NULL,  OPTION_URI },
+        { "revert", no_argument, NULL, 'r' },
+        { "help", no_argument, NULL, 'h' },
+        { "version", no_argument, NULL, 'V' },
+        { "trace", required_argument, NULL, 'T' },
+        { NULL, 0, NULL, 0 }
+    };
+
+    bool has_page_size = false;
+    bool has_uri = false;
+
+    int64_t target_page_size = qemu_real_host_page_size;
+    int uri_fd = -1;
+    bool revert = false;
+    bool postcopy = false;
+    int postcopy_percent = 0;
+    const char *blk_optstr;
+    QemuOpts *blk_opts;
+    QDict *blk_options;
+    int c;
+
+    while ((c = getopt_long(argc, argv, s_opt, l_opt, NULL)) != -1) {
+        switch (c) {
+            case '?':
+                exit(EXIT_FAILURE);
+
+            case 'h':
+                usage(argv[0]);
+                exit(EXIT_SUCCESS);
+
+            case 'V':
+                version(argv[0]);
+                exit(EXIT_SUCCESS);
+
+            case 'T':
+                trace_opt_parse(optarg);
+                break;
+
+            case 'r':
+                if (revert) {
+                    error_report("-r and --revert can only be specified once");
+                    exit(EXIT_FAILURE);
+                }
+                revert = true;
+                
+                break;
+
+            case OPTION_POSTCOPY:
+            {
+                char *r;
+
+                if (postcopy) {
+                    error_report("--postcopy can only be specified once");
+                    exit(EXIT_FAILURE);
+                }
+                postcopy = true;
+
+                postcopy_percent = strtol(optarg, &r, 10);
+                if (*r != '\0' || postcopy_percent < 0 || postcopy_percent > 100) {
+                    error_report("Invalid argument to --postcopy");
+                    exit(EXIT_FAILURE);
+                }
+
+                break;
+            }
+
+            case OPTION_PAGE_SIZE:
+            {
+                char *r;
+
+                if (has_page_size) {
+                    error_report("--page-size can only be specified once");
+                    exit(EXIT_FAILURE);
+                }
+                has_page_size = true;
+
+                target_page_size = strtol(optarg, &r, 0);
+                if (*r != '\0' || (target_page_size & (target_page_size - 1)) != 0 ||
+                        target_page_size < PAGE_SIZE_MIN ||
+                        target_page_size > PAGE_SIZE_MAX) {
+                    error_report("Invalid argument to --page-size");
+                    exit(EXIT_FAILURE);
+                }
+
+                break;
+            }
+
+            case OPTION_URI:
+            {
+                const char *p;
+
+                if (has_uri) {
+                    error_report("--uri can only be specified once");
+                    exit(EXIT_FAILURE);
+                }
+                has_uri = true;
+
+                /* Only "--uri=fd:<fd>" is currently supported */
+                if (strstart(optarg, "fd:", &p)) {
+                    char *r;
+                    int fd;
+
+                    fd = strtol(p, &r,10);
+                    if (*r != '\0' || fd <= STDERR_FILENO) {
+                        error_report("Invalid FD value");
+                        exit(EXIT_FAILURE);
+                    }
+
+                    uri_fd = qemu_dup_flags(fd, O_CLOEXEC);
+                    if (uri_fd < 0) {
+                        error_report("Could not dup FD %d", fd);
+                        exit(EXIT_FAILURE);
+                    }
+
+                    /* Close original fd */
+                    close(fd);
+                } else {
+                    error_report("Invalid argument to --uri");
+                    exit(EXIT_FAILURE);
+                }
+
+                break;
+            }
+
+            default:
+                g_assert_not_reached();
+        }
+    }
+
+    if ((argc - optind) != 1) {
+        error_report("Invalid number of arguments");
+        exit(EXIT_FAILURE);
+    }
+
+    blk_optstr = argv[optind];
+
+    blk_opts = qemu_opts_parse_noisily(&snap_blk_optslist, blk_optstr, true);
+    if (!blk_opts) {
+        exit(EXIT_FAILURE);
+    }
+    blk_options = qemu_opts_to_qdict(blk_opts, NULL);
+    qemu_opts_reset(&snap_blk_optslist);
+
+    /* Enforced block layer options */
+    qdict_put_str(blk_options, "driver", "qcow2");
+    qdict_put_null(blk_options, "backing");
+    qdict_put_str(blk_options, "overlap-check", "none");
+    qdict_put_str(blk_options, "auto-read-only", "off");
+    qdict_put_str(blk_options, "detect-zeroes", "off");
+    qdict_put_str(blk_options, "lazy-refcounts", "on");
+    qdict_put_str(blk_options, "file.auto-read-only", "off");
+    qdict_put_str(blk_options, "file.detect-zeroes", "off");
+
+    params.revert = revert;
+
+    if (uri_fd != -1) {
+        params.fd = params.rp_fd = uri_fd;
+    } else {
+        params.fd = revert ? STDOUT_FILENO : STDIN_FILENO;
+        params.rp_fd = revert ? STDIN_FILENO : -1;
+    }
+    params.blk_optstr = blk_optstr;
+    params.blk_options = blk_options;
+    params.blk_flags = revert ? 0 : BDRV_O_RDWR;
+    params.postcopy = postcopy;
+    params.postcopy_percent = postcopy_percent;
+
+    page_size = target_page_size;
+    page_mask = ~(page_size - 1);
+    page_bits = ctz64(page_size);
+    slice_size = revert ? SLICE_SIZE_REVERT : SLICE_SIZE;
+    slice_mask = ~(slice_size - 1);
+    slice_bits = ctz64(slice_size);
+}
+
+int main(int argc, char **argv)
+{
+    Coroutine *co;
+
+    os_setup_early_signal_handling();
+    os_setup_signal_handling();
+    error_init(argv[0]);
+    qemu_init_exec_dir(argv[0]);
+    module_call_init(MODULE_INIT_TRACE);
+    module_call_init(MODULE_INIT_QOM);
+    qemu_init_main_loop(&error_fatal);
+    bdrv_init();
+
+    qemu_add_opts(&qemu_trace_opts);
+    process_options(argc, argv);
+
+    if (!trace_init_backends()) {
+        exit(EXIT_FAILURE);
+    }
+    trace_init_file();
+    qemu_set_log(LOG_TRACE);
+
+    ram_init_state();
+
+    if (params.revert) {
+        co = qemu_coroutine_create(snapshot_load_co, NULL);
+    } else {
+        co = qemu_coroutine_create(snapshot_save_co, NULL);
+    }
+    aio_bh_schedule_oneshot(qemu_get_aio_context(), enter_co_bh, co);
+
+    do {
+        main_loop_wait(false);
+    } while (state != TERMINATED);
+
+    exit(EXIT_SUCCESS);
+}
-- 
2.27.0


