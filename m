Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24733F5A0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:36:52 +0100 (CET)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZAB-00023x-IG
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6p-0000LM-AB
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:27 -0400
Received: from relay.sw.ru ([185.231.240.75]:49366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ6f-0004db-HX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=4JbJkudXb/wdFoO1R1oG/sXIBBkFqAWDWXTx/mwLFrk=; b=Jr9+PwSd4zaJ
 2n0ajPIU4aRkurm0YObVgQT1HJ2nS9ma6q7IuDnqRXx+OpdIs90F0vU2KcD5yffdicDTX7xZ9Ebc0
 5I0hay7ofX35Z8vmwawWvK5cxAOdFZRYrUnr6LlOoXyZiIVepvTOfut4OJe36QqTictJe1XPLHteg
 C+Gm4=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ63-0034yI-R0; Wed, 17 Mar 2021 19:32:35 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 1/9] migration/snap-tool: Introduce qemu-snap tool
Date: Wed, 17 Mar 2021 19:32:14 +0300
Message-Id: <20210317163222.182609-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
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

Initial commit with code to set up execution environment, parse
command-line arguments, show usage/version info and so on.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h |  35 ++++
 meson.build         |   2 +
 qemu-snap.c         | 414 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 451 insertions(+)
 create mode 100644 include/qemu-snap.h
 create mode 100644 qemu-snap.c

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
new file mode 100644
index 0000000000..b8e48bfcbb
--- /dev/null
+++ b/include/qemu-snap.h
@@ -0,0 +1,35 @@
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
+#ifndef QEMU_SNAP_H
+#define QEMU_SNAP_H
+
+/* Target page size, if not specified explicitly in command-line */
+#define DEFAULT_PAGE_SIZE       4096
+/*
+ * Maximum supported target page size, cause we use QEMUFile and
+ * qemu_get_buffer_in_place(). IO_BUF_SIZE is currently 32KB.
+ */
+#define PAGE_SIZE_MAX           16384
+
+typedef struct SnapSaveState {
+    BlockBackend *blk;          /* Block backend */
+} SnapSaveState;
+
+typedef struct SnapLoadState {
+    BlockBackend *blk;          /* Block backend */
+} SnapLoadState;
+
+SnapSaveState *snap_save_get_state(void);
+SnapLoadState *snap_load_get_state(void);
+
+#endif /* QEMU_SNAP_H */
diff --git a/meson.build b/meson.build
index a7d2dd429d..11564165ba 100644
--- a/meson.build
+++ b/meson.build
@@ -2324,6 +2324,8 @@ if have_tools
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls], install: true)
+  qemu_snap = executable('qemu-snap', files('qemu-snap.c'),
+               dependencies: [blockdev, qemuutil, migration], install: true)
 
   subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
diff --git a/qemu-snap.c b/qemu-snap.c
new file mode 100644
index 0000000000..c7118927f7
--- /dev/null
+++ b/qemu-snap.c
@@ -0,0 +1,414 @@
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
+#include "sysemu/block-backend.h"
+#include "sysemu/runstate.h" /* for qemu_system_killed() prototype */
+#include "qemu/cutils.h"
+#include "qemu/coroutine.h"
+#include "qemu/error-report.h"
+#include "qemu/config-file.h"
+#include "qemu/log.h"
+#include "trace/control.h"
+#include "io/channel-util.h"
+#include "io/channel-buffer.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+#include "qemu-snap.h"
+
+#define OPT_CACHE   256
+#define OPT_AIO     257
+
+/* Parameters for snapshot saving */
+typedef struct SnapSaveParams {
+    const char *filename;       /* QCOW2 image file name */
+    int64_t image_size;         /* QCOW2 virtual image size */
+    int bdrv_flags;             /* BDRV flags (cache/AIO mode)*/
+    bool writethrough;          /* BDRV writes in FUA mode */
+
+    int64_t page_size;          /* Target page size to use */
+
+    int fd;                     /* Migration stream input FD */
+} SnapSaveParams;
+
+/* Parameters for snapshot saving */
+typedef struct SnapLoadParams {
+    const char *filename;       /* QCOW2 image file name */
+    int bdrv_flags;             /* BDRV flags (cache/AIO mode)*/
+
+    int64_t page_size;          /* Target page size to use */
+    bool postcopy;              /* Use postcopy */
+    /* Switch to postcopy after postcopy_percent% of RAM loaded */
+    int postcopy_percent;
+
+    int fd;                     /* Migration stream output FD */
+    int rp_fd;                  /* Return-path FD (for postcopy) */
+} SnapLoadParams;
+
+static SnapSaveState save_state;
+static SnapLoadState load_state;
+
+#ifdef CONFIG_POSIX
+void qemu_system_killed(int signum, pid_t pid)
+{
+}
+#endif /* CONFIG_POSIX */
+
+static void snap_shutdown(void)
+{
+    bdrv_close_all();
+}
+
+SnapSaveState *snap_save_get_state(void)
+{
+    return &save_state;
+}
+
+SnapLoadState *snap_load_get_state(void)
+{
+    return &load_state;
+}
+
+static void snap_save_init_state(void)
+{
+    memset(&save_state, 0, sizeof(save_state));
+}
+
+static void snap_save_destroy_state(void)
+{
+    /* TODO: implement */
+}
+
+static void snap_load_init_state(void)
+{
+    memset(&load_state, 0, sizeof(load_state));
+}
+
+static void snap_load_destroy_state(void)
+{
+    /* TODO: implement */
+}
+
+static int snap_save(const SnapSaveParams *params)
+{
+    SnapSaveState *sn;
+
+    snap_save_init_state();
+    sn = snap_save_get_state();
+    (void) sn;
+
+    snap_save_destroy_state();
+
+    return 0;
+}
+
+static int snap_load(SnapLoadParams *params)
+{
+    SnapLoadState *sn;
+
+    snap_load_init_state();
+    sn = snap_load_get_state();
+    (void) sn;
+
+    snap_load_destroy_state();
+
+    return 0;
+}
+
+static int64_t cvtnum_full(const char *name, const char *value,
+        int64_t min, int64_t max)
+{
+    uint64_t res;
+    int err;
+
+    err = qemu_strtosz(value, NULL, &res);
+    if (err < 0 && err != -ERANGE) {
+        error_report("Invalid %s specified. You may use "
+                     "k, M, G, T, P or E suffixes for", name);
+        error_report("kilobytes, megabytes, gigabytes, terabytes, "
+                     "petabytes and exabytes.");
+        return err;
+    }
+    if (err == -ERANGE || res > max || res < min) {
+        error_report("Invalid %s specified. Must be between %" PRId64
+                     " and %" PRId64 ".", name, min, max);
+        return -ERANGE;
+    }
+
+    return res;
+}
+
+static int64_t cvtnum(const char *name, const char *value)
+{
+    return cvtnum_full(name, value, 0, INT64_MAX);
+}
+
+static bool is_2power(int64_t val)
+{
+    return val && ((val & (val - 1)) == 0);
+}
+
+static void usage(const char *name)
+{
+    printf(
+        "Usage: %s [OPTIONS] save|load FILE\n"
+        "QEMU External Snapshot Utility\n"
+        "\n"
+        "  -h, --help                display this help and exit\n"
+        "  -V, --version             output version information and exit\n"
+        "\n"
+        "General purpose options:\n"
+        "  -t, --trace [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
+        "                            specify tracing options\n"
+        "\n"
+        "Image options:\n"
+        "  -s, --image-size=SIZE     size of image to create for 'save'\n"
+        "  -n, --nocache             disable host cache\n"
+        "      --cache=MODE          set cache mode (none, writeback, ...)\n"
+        "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
+        "\n"
+        "Snapshot options:\n"
+        "  -S, --page-size=SIZE      target page size\n"
+        "  -p, --postcopy=%%RAM       switch to postcopy after '%%RAM' loaded\n"
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
+int main(int argc, char **argv)
+{
+    static const struct option l_opt[] = {
+        { "help", no_argument, NULL, 'h' },
+        { "version", no_argument, NULL, 'V' },
+        { "image-size", required_argument, NULL, 's' },
+        { "page-size", required_argument, NULL, 'S' },
+        { "postcopy", required_argument, NULL, 'p' },
+        { "nocache", no_argument, NULL, 'n' },
+        { "cache", required_argument, NULL, OPT_CACHE },
+        { "aio", required_argument, NULL, OPT_AIO },
+        { "trace", required_argument, NULL, 't' },
+        { NULL, 0, NULL, 0 }
+    };
+    static const char *s_opt = "hVs:S:p:nt:";
+
+    int ch;
+    int l_ind = 0;
+
+    bool seen_image_size = false;
+    bool seen_page_size = false;
+    bool seen_postcopy = false;
+    bool seen_cache = false;
+    bool seen_aio = false;
+    int64_t image_size = 0;
+    int64_t page_size = DEFAULT_PAGE_SIZE;
+    int64_t postcopy_percent = 0;
+    int bdrv_flags = 0;
+    bool writethrough = false;
+    bool postcopy = false;
+    const char *cmd_name;
+    const char *file_name;
+    Error *local_err = NULL;
+
+#ifdef CONFIG_POSIX
+    signal(SIGPIPE, SIG_IGN);
+#endif
+    error_init(argv[0]);
+    module_call_init(MODULE_INIT_TRACE);
+    module_call_init(MODULE_INIT_QOM);
+
+    qemu_add_opts(&qemu_trace_opts);
+    qemu_init_exec_dir(argv[0]);
+
+    while ((ch = getopt_long(argc, argv, s_opt, l_opt, &l_ind)) != -1) {
+        switch (ch) {
+        case '?':
+            error_report("Try `%s --help' for more information", argv[0]);
+            return EXIT_FAILURE;
+
+        case 's':
+            if (seen_image_size) {
+                error_report("-s and --image-size can only be specified once");
+                return EXIT_FAILURE;
+            }
+            seen_image_size = true;
+
+            image_size = cvtnum(l_opt[l_ind].name, optarg);
+            if (image_size <= 0) {
+                error_report("Invalid image size parameter '%s'", optarg);
+                return EXIT_FAILURE;
+            }
+            break;
+
+        case 'S':
+            if (seen_page_size) {
+                error_report("-S and --page-size can only be specified once");
+                return EXIT_FAILURE;
+            }
+            seen_page_size = true;
+
+            page_size = cvtnum(l_opt[l_ind].name, optarg);
+            if (page_size <= 0 || !is_2power(page_size) ||
+                    page_size > PAGE_SIZE_MAX) {
+                error_report("Invalid target page size parameter '%s'", optarg);
+                return EXIT_FAILURE;
+            }
+            break;
+
+        case 'p':
+            if (seen_postcopy) {
+                error_report("-p and --postcopy can only be specified once");
+                return EXIT_FAILURE;
+            }
+            seen_postcopy = true;
+
+            postcopy_percent = cvtnum(l_opt[l_ind].name, optarg);
+            if (!(postcopy_percent > 0 && postcopy_percent < 100)) {
+                error_report("Invalid postcopy %%RAM parameter '%s'", optarg);
+                return EXIT_FAILURE;
+            }
+            postcopy = true;
+            break;
+
+        case 'n':
+            optarg = (char *) "none";
+            /* fallthrough */
+
+        case OPT_CACHE:
+            if (seen_cache) {
+                error_report("-n and --cache can only be specified once");
+                return EXIT_FAILURE;
+            }
+            seen_cache = true;
+
+            if (bdrv_parse_cache_mode(optarg, &bdrv_flags, &writethrough)) {
+                error_report("Invalid cache mode '%s'", optarg);
+                return EXIT_FAILURE;
+            }
+            break;
+
+        case OPT_AIO:
+            if (seen_aio) {
+                error_report("--aio can only be specified once");
+                return EXIT_FAILURE;
+            }
+            seen_aio = true;
+
+            if (bdrv_parse_aio(optarg, &bdrv_flags)) {
+                error_report("Invalid AIO mode '%s'", optarg);
+                return EXIT_FAILURE;
+            }
+            break;
+
+        case 'V':
+            version(argv[0]);
+            return EXIT_SUCCESS;
+
+        case 'h':
+            usage(argv[0]);
+            return EXIT_SUCCESS;
+
+        case 't':
+            trace_opt_parse(optarg);
+            break;
+
+        }
+    }
+
+    if ((argc - optind) != 2) {
+        error_report("Invalid number of arguments");
+        return EXIT_FAILURE;
+    }
+
+    if (!trace_init_backends()) {
+        return EXIT_FAILURE;
+    }
+    trace_init_file();
+    qemu_set_log(LOG_TRACE);
+
+    if (qemu_init_main_loop(&local_err)) {
+        error_report_err(local_err);
+        return EXIT_FAILURE;
+    }
+
+    bdrv_init();
+    atexit(snap_shutdown);
+
+    cmd_name = argv[optind];
+    file_name = argv[optind + 1];
+
+    if (!strcmp(cmd_name, "save")) {
+        SnapSaveParams params = {
+            .filename = file_name,
+            .image_size = image_size,
+            .page_size = page_size,
+            .bdrv_flags = (bdrv_flags | BDRV_O_RDWR),
+            .writethrough = writethrough,
+            .fd = STDIN_FILENO };
+        int res;
+
+        if (seen_postcopy) {
+            error_report("-p and --postcopy cannot be used for 'save'");
+            return EXIT_FAILURE;
+        }
+        if (!seen_image_size) {
+            error_report("-s or --size are required for 'save'");
+            return EXIT_FAILURE;
+        }
+
+        res = snap_save(&params);
+        if (res < 0) {
+            return EXIT_FAILURE;
+        }
+        return EXIT_SUCCESS;
+    } else if (!strcmp(cmd_name, "load")) {
+        SnapLoadParams params = {
+            .filename = file_name,
+            .bdrv_flags = bdrv_flags,
+            .postcopy = postcopy,
+            .postcopy_percent = postcopy_percent,
+            .page_size = page_size,
+            .fd = STDOUT_FILENO,
+            .rp_fd = STDIN_FILENO };
+        int res;
+
+        if (seen_image_size) {
+            error_report("-s and --size cannot be used for 'load'");
+            return EXIT_FAILURE;
+        }
+
+        res = snap_load(&params);
+        if (res < 0) {
+            return EXIT_FAILURE;
+        }
+        return EXIT_SUCCESS;
+    }
+
+    error_report("Invalid command");
+    return EXIT_FAILURE;
+}
-- 
2.25.1


