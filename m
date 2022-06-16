Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045154DF9C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:01:09 +0200 (CEST)
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nFN-0001Us-2Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjm-0001md-Jo
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:30 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjk-0001uL-9i
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:30 -0400
Received: by mail-lj1-x22a.google.com with SMTP id v8so996111ljj.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ggHIetbBfH5Ls8v05ui9WNYhBnpUF8zUCpogjlFp/yI=;
 b=HHVGGbSDiqaaLtWv4MkRWxF2j3LE8WKm+eK5l4dAXAirDV/yQxGhH940dIEdN5DaTr
 VguN+EO6h+BjJ1QT9ql+XCrL8WyLmydvcLnCPMSZgsKtut8k1bP40QaMXWQ8ZQIe/KcO
 AkFXKPx7Hj9pms6Wv3N0nuQV1asmBLWzbZRkxqSeFOrATXJ83yEIcX+1Kdpvofh5YAGL
 +Xq28e0JeMdwc4T0wfjlpB0II6g2XBSA7/vf00WgPfZtAH/HeLJdq9JpW9oPjJuy3shM
 qNrPbrZ4r7Vvg2FRzQYP+kVlaVIB9vncNh/PoLQ3dA0zlQXhjb+oaVWTbD+gn6yatgKY
 hY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ggHIetbBfH5Ls8v05ui9WNYhBnpUF8zUCpogjlFp/yI=;
 b=mS3e5X6AmmAJgiPF30bLOf8XmawyvsaTg6gFKaYM8TcILfEdfwJrpY94/UjPjysBv3
 8uqMaLjjISVTP/Q1e9jfdnExXb1ct4RMZ+NBcw4XW25xF3HMrQBWL9X+tEdPNM4mCbe5
 PUdH/xZ/Kf8IIwy6VuhjrShrpwt2Gv8CSrYCQgwtnEKf1+lOnTnYn/QcMEU8TJ/w1xRd
 xm55iHU1GPQt0OSM7X5/1yyM11HNZSapMiN6BOcPkYMe393hO5jjBI5hFT9J2UPCuoag
 G5NYrnojhjF1U/Go81Wmjp8eZWMDJTZhibMtJvLNSXX4avjn2RxIq1+bn8sYCCDvaaFA
 aknQ==
X-Gm-Message-State: AJIora+t9hdbRMpSkVdmkTr+1vJueoLOHqtwj3fFxrW1IBkriPB56yyN
 +5NMGfnkAU99ptyGNq2awfqFJmc5xSiLAhwC
X-Google-Smtp-Source: AGRyM1sPNwk7s9f/92Cc/1DowOQqvFWxMlvDVxgSQ5/RAWcRhTDzMDvl9jeFyt9A1tBSf6kI0Q5DOA==
X-Received: by 2002:a05:651c:1143:b0:25a:3e5:7b6a with SMTP id
 h3-20020a05651c114300b0025a03e57b6amr2154160ljo.163.1655375305658; 
 Thu, 16 Jun 2022 03:28:25 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:25 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 09/17] migration/snapshot: Introduce qemu-snapshot tool
Date: Thu, 16 Jun 2022 13:28:03 +0300
Message-Id: <20220616102811.219007-10-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

Execution environment, command-line argument parsing, usage/version info etc.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 include/qemu-snapshot.h   |  65 ++++++
 migration/qemu-snapshot.c |  57 +++++
 qemu-snapshot.c           | 433 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 555 insertions(+)
 create mode 100644 include/qemu-snapshot.h
 create mode 100644 migration/qemu-snapshot.c
 create mode 100644 qemu-snapshot.c

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
new file mode 100644
index 0000000000..8e548e7630
--- /dev/null
+++ b/include/qemu-snapshot.h
@@ -0,0 +1,65 @@
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
+typedef struct StateInfo {
+    int64_t page_size;
+    int64_t page_mask;
+    int page_bits;
+    int64_t slice_size;
+    int64_t slice_mask;
+    int slice_bits;
+} StateInfo;
+
+typedef struct StateSaveCtx {
+    BlockBackend *blk;          /* Block backend */
+
+    StateInfo state_parameters; /* Migration state info*/
+} StateSaveCtx;
+
+typedef struct StateLoadCtx {
+    BlockBackend *blk;          /* Block backend */
+
+    StateInfo state_parameters; /* Migration state info*/
+} StateLoadCtx;
+
+void ram_init_state(void);
+void ram_destroy_state(void);
+StateSaveCtx *get_save_context(void);
+StateLoadCtx *get_load_context(void);
+int coroutine_fn save_state_main(StateSaveCtx *s);
+int coroutine_fn load_state_main(StateLoadCtx *s);
+
+#endif /* QEMU_SNAPSHOT_H */
diff --git a/migration/qemu-snapshot.c b/migration/qemu-snapshot.c
new file mode 100644
index 0000000000..f7695e75c7
--- /dev/null
+++ b/migration/qemu-snapshot.c
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
index 0000000000..683f1b265a
--- /dev/null
+++ b/qemu-snapshot.c
@@ -0,0 +1,433 @@
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
+#include "qemu/memalign.h"
+#include "qemu-common.h"
+#include "qemu-version.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "qemu/coroutine.h"
+#include "qemu/error-report.h"
+#include "qemu/config-file.h"
+#include "qemu/log.h"
+#include "qemu/option_int.h"
+#include "qemu/main-loop.h"
+#include "trace/control.h"
+#include "io/channel-util.h"
+#include "io/channel-buffer.h"
+#include "migration/qemu-file-channel.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/misc.h"
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
+    bool save_vmstate;          /* If true tool will get onle vmstate part */
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
+static BlockBackend *image_open_opts(const char *optstr, QDict *options,
+                                     int flags)
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
+        "      --postcopy            load ram in postcopy mode\n"
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
+static void process_options(int argc, char *argv[], StateInfo *si)
+{
+    static const char *s_opt = "rhVT:";
+    static const struct option l_opt[] = {
+        { "page-size", required_argument, NULL, OPTION_PAGE_SIZE },
+        { "postcopy", no_argument, NULL, OPTION_POSTCOPY },
+        { "uri", required_argument, NULL,  OPTION_URI },
+        { "revert", no_argument, NULL, 'r' },
+        { "help", no_argument, NULL, 'h' },
+        { "version", no_argument, NULL, 'V' },
+        { "trace", required_argument, NULL, 'T' },
+        { "save-vmstate", no_argument, NULL, 'S' },
+        { NULL, 0, NULL, 0 }
+    };
+
+    bool has_page_size = false;
+    bool has_uri = false;
+
+    long target_page_size = qemu_real_host_page_size;
+    int uri_fd = -1;
+    bool revert = false;
+    bool postcopy = false;
+    const char *blk_optstr;
+    QemuOpts *blk_opts;
+    QDict *blk_options;
+    int c;
+
+    while ((c = getopt_long(argc, argv, s_opt, l_opt, NULL)) != -1) {
+        switch (c) {
+        case '?':
+            exit(EXIT_FAILURE);
+
+        case 'h':
+            usage(argv[0]);
+            exit(EXIT_SUCCESS);
+
+        case 'V':
+            version(argv[0]);
+            exit(EXIT_SUCCESS);
+
+        case 'T':
+            trace_opt_parse(optarg);
+            break;
+
+        case 'r':
+            if (revert) {
+                error_report("-r and --revert can only be specified once");
+                exit(EXIT_FAILURE);
+            }
+            revert = true;
+
+            break;
+
+        case 'S':
+            params.save_vmstate = true;
+
+            break;
+
+        case OPTION_POSTCOPY:
+        {
+            if (postcopy) {
+                error_report("--postcopy can only be specified once");
+                exit(EXIT_FAILURE);
+            }
+            postcopy = true;
+
+            break;
+        }
+
+        case OPTION_PAGE_SIZE:
+        {
+            const char *r;
+
+            if (has_page_size) {
+                error_report("--page-size can only be specified once");
+                exit(EXIT_FAILURE);
+            }
+            has_page_size = true;
+
+            qemu_strtol(optarg, &r, 0, &target_page_size);
+            if (*r != '\0' ||
+                    (target_page_size & (target_page_size - 1)) != 0 ||
+                    target_page_size < PAGE_SIZE_MIN ||
+                    target_page_size > PAGE_SIZE_MAX) {
+                error_report("Invalid argument to --page-size");
+                exit(EXIT_FAILURE);
+            }
+
+            break;
+        }
+
+        case OPTION_URI:
+        {
+            const char *p;
+
+            if (has_uri) {
+                error_report("--uri can only be specified once");
+                exit(EXIT_FAILURE);
+            }
+            has_uri = true;
+
+            /* Only "--uri=fd:<fd>" is currently supported */
+            if (strstart(optarg, "fd:", &p)) {
+                const char *r;
+                long fd;
+
+                qemu_strtol(p, &r, 10, &fd);
+                if (*r != '\0' || fd <= STDERR_FILENO) {
+                    error_report("Invalid FD value");
+                    exit(EXIT_FAILURE);
+                }
+
+                uri_fd = qemu_dup_flags(fd, O_CLOEXEC);
+                if (uri_fd < 0) {
+                    error_report("Could not dup FD %ld", fd);
+                    exit(EXIT_FAILURE);
+                }
+
+                /* Close original fd */
+                close(fd);
+            } else {
+                error_report("Invalid argument to --uri");
+                exit(EXIT_FAILURE);
+            }
+
+            break;
+        }
+
+        default:
+            g_assert_not_reached();
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
+
+    si->page_size = target_page_size;
+    si->page_mask = ~(target_page_size - 1);
+    si->page_bits = ctz64(target_page_size);
+    si->slice_size = SLICE_SIZE;
+    si->slice_mask = ~(si->slice_size - 1);
+    si->slice_bits = ctz64(si->slice_size);
+}
+
+int main(int argc, char **argv)
+{
+    Coroutine *co;
+    StateInfo state_info;
+
+    os_setup_early_signal_handling();
+    os_setup_signal_handling();
+    error_init(argv[0]);
+    qemu_init_exec_dir(argv[0]);
+    module_call_init(MODULE_INIT_QOM);
+    qemu_init_main_loop(&error_fatal);
+    qemu_init_subsystems();
+
+    migration_object_init();
+    qemu_add_opts(&qemu_trace_opts);
+    process_options(argc, argv, &state_info);
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
+        co = qemu_coroutine_create(snapshot_load_co, &state_info);
+    } else {
+        co = qemu_coroutine_create(snapshot_save_co, &state_info);
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
2.31.1


