Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F9D4C5759
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:13:28 +0100 (CET)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1ZP-0006R3-UC
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:13:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1To-0005mt-HX
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:40 -0500
Received: from [2a00:1450:4864:20::42e] (port=39863
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tk-0004Pt-1n
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s13so9176831wrb.6
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cq469k9gdaGl4SwlZjfROg2we3ed1MXX1ij/2Dyjogc=;
 b=Ji5yA/ybLN3pZNd11t8UTCC2sbUAB3KzA04SXNPhasSo2llFCZoA8/iSqEe6kBqEHm
 FrIsVEYpH6mYzGuDsODRnR9U9e4uAT/RdEceyvCGHYqDdgpFgtn3PcjLNU73ZJFUMGzv
 2zYoMUB4lWUCETciYX41XQ8tpexxS+LWwnnCu41+BOZfdto9GglIjvDLm2yGJAdRE44u
 wpPH8WZReM+aRGd0E26xLnE1NUbcq/mlpEowHQz1eTsyhALaEPn6Dm3PXg3dSBRaxl6f
 HP3919ODfDsKDZc6VeR9/xtalIyFiiR8USwQZad6ZKK8Fy5c1HwBmDrL8DBA/CAadLxW
 mh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq469k9gdaGl4SwlZjfROg2we3ed1MXX1ij/2Dyjogc=;
 b=ZRvQm+jn2jPPUGtuYnbwx1HFC0WG5U3QXH1H9pWqRPxyJXDLSt6693BMcX7x17Zx3r
 hLZ7FdCZ9JvKE1S4ZTxY8YlfozR2plhW4jprws6ye0Wb84a+XZrrzOUxkALt99LtbKEH
 u7XMjx7Jz8EKVLnaZDie5sNIhuadc/OboYiSl6a6F3COMrmEASjmjvsdU4CKQDXywnxd
 r8HmBcud7EaFR2ZmrHhKitGUxeXQxaJkvF6qAS6tgAmu0TUKKMyhdGvCJDeuQQqpDwtH
 svhFV0NQiqu9sKhzoZEHirQxTq5i11qBahEtlto3xtoUDAO9Qw4JJ8gAFiP1Un0dQSbE
 0Gsg==
X-Gm-Message-State: AOAM530uIDqqRQL5H1K6QH4WxLgWARSY0AfMuRgyW6jaZx2Hs0bE2cyn
 1JS93sh3uodT7HKDT2hybpsWY4JgGQa98g==
X-Google-Smtp-Source: ABdhPJxOKk/vLV3pvjmpW+K56sYf3avVZlq01Cri4pgNrQADde6PUYtbva144mNvz2Xz6NWGo1f9LQ==
X-Received: by 2002:a5d:5245:0:b0:1ed:9eca:cf3d with SMTP id
 k5-20020a5d5245000000b001ed9ecacf3dmr9970122wrc.666.1645898854597; 
 Sat, 26 Feb 2022 10:07:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] osdep: Move memalign-related functions to their own header
Date: Sat, 26 Feb 2022 18:07:23 +0000
Message-Id: <20220226180723.1706285-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the various memalign-related functions out of osdep.h and into
their own header, which we include only where they are used.
While we're doing this, add some brief documentation comments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/memalign.h        | 61 ++++++++++++++++++++++++++++++++++
 include/qemu/osdep.h           | 18 ----------
 block/blkverify.c              |  1 +
 block/block-copy.c             |  1 +
 block/commit.c                 |  1 +
 block/crypto.c                 |  1 +
 block/dmg.c                    |  1 +
 block/export/fuse.c            |  1 +
 block/file-posix.c             |  1 +
 block/io.c                     |  1 +
 block/mirror.c                 |  1 +
 block/nvme.c                   |  1 +
 block/parallels-ext.c          |  1 +
 block/parallels.c              |  1 +
 block/qcow.c                   |  1 +
 block/qcow2-cache.c            |  1 +
 block/qcow2-cluster.c          |  1 +
 block/qcow2-refcount.c         |  1 +
 block/qcow2-snapshot.c         |  1 +
 block/qcow2.c                  |  1 +
 block/qed-l2-cache.c           |  1 +
 block/qed-table.c              |  1 +
 block/qed.c                    |  1 +
 block/quorum.c                 |  1 +
 block/raw-format.c             |  1 +
 block/vdi.c                    |  1 +
 block/vhdx-log.c               |  1 +
 block/vhdx.c                   |  1 +
 block/vmdk.c                   |  1 +
 block/vpc.c                    |  1 +
 block/win32-aio.c              |  1 +
 hw/block/dataplane/xen-block.c |  1 +
 hw/block/fdc.c                 |  1 +
 hw/ide/core.c                  |  1 +
 hw/ppc/spapr.c                 |  1 +
 hw/ppc/spapr_softmmu.c         |  1 +
 hw/scsi/scsi-disk.c            |  1 +
 hw/tpm/tpm_ppi.c               |  2 +-
 nbd/server.c                   |  1 +
 net/l2tpv3.c                   |  2 +-
 plugins/loader.c               |  1 +
 qemu-img.c                     |  1 +
 qemu-io-cmds.c                 |  1 +
 qom/object.c                   |  1 +
 softmmu/physmem.c              |  1 +
 target/i386/hvf/hvf.c          |  1 +
 target/i386/kvm/kvm.c          |  1 +
 tcg/region.c                   |  1 +
 tests/bench/atomic_add-bench.c |  1 +
 tests/bench/qht-bench.c        |  1 +
 util/atomic64.c                |  1 +
 util/memalign.c                |  1 +
 util/qht.c                     |  1 +
 53 files changed, 112 insertions(+), 20 deletions(-)
 create mode 100644 include/qemu/memalign.h

diff --git a/include/qemu/memalign.h b/include/qemu/memalign.h
new file mode 100644
index 00000000000..fa299f3bf67
--- /dev/null
+++ b/include/qemu/memalign.h
@@ -0,0 +1,61 @@
+/*
+ * Allocation and free functions for aligned memory
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_MEMALIGN_H
+#define QEMU_MEMALIGN_H
+
+/**
+ * qemu_try_memalign: Allocate aligned memory
+ * @alignment: required alignment, in bytes
+ * @size: size of allocation, in bytes
+ *
+ * Allocate memory on an aligned boundary (i.e. the returned
+ * address will be an exact multiple of @alignment).
+ * @alignment must be a power of 2, or the function will assert().
+ * On success, returns allocated memory; on failure, returns NULL.
+ *
+ * The memory allocated through this function must be freed via
+ * qemu_vfree() (and not via free()).
+ */
+void *qemu_try_memalign(size_t alignment, size_t size);
+/**
+ * qemu_memalign: Allocate aligned memory, without failing
+ * @alignment: required alignment, in bytes
+ * @size: size of allocation, in bytes
+ *
+ * Allocate memory in the same way as qemu_try_memalign(), but
+ * abort() with an error message if the memory allocation fails.
+ *
+ * The memory allocated through this function must be freed via
+ * qemu_vfree() (and not via free()).
+ */
+void *qemu_memalign(size_t alignment, size_t size);
+/**
+ * qemu_vfree: Free memory allocated through qemu_memalign
+ * @ptr: memory to free
+ *
+ * This function must be used to free memory allocated via qemu_memalign()
+ * or qemu_try_memalign(). (Using the wrong free function will cause
+ * subtle bugs on Windows hosts.)
+ */
+void qemu_vfree(void *ptr);
+/*
+ * It's an analog of GLIB's g_autoptr_cleanup_generic_gfree(), used to define
+ * g_autofree macro.
+ */
+static inline void qemu_cleanup_generic_vfree(void *p)
+{
+  void **pp = (void **)p;
+  qemu_vfree(*pp);
+}
+
+/*
+ * Analog of g_autofree, but qemu_vfree is called on cleanup instead of g_free.
+ */
+#define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_cleanup_generic_vfree)))
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7bcce3bceb0..bc3df26da36 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -379,28 +379,10 @@ extern "C" {
 #endif
 
 int qemu_daemon(int nochdir, int noclose);
-void *qemu_try_memalign(size_t alignment, size_t size);
-void *qemu_memalign(size_t alignment, size_t size);
 void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
                           bool noreserve);
-void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
-/*
- * It's an analog of GLIB's g_autoptr_cleanup_generic_gfree(), used to define
- * g_autofree macro.
- */
-static inline void qemu_cleanup_generic_vfree(void *p)
-{
-  void **pp = (void **)p;
-  qemu_vfree(*pp);
-}
-
-/*
- * Analog of g_autofree, but qemu_vfree is called on cleanup instead of g_free.
- */
-#define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_cleanup_generic_vfree)))
-
 #ifdef _WIN32
 #define HAVE_CHARDEV_SERIAL 1
 #elif defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)    \
diff --git a/block/blkverify.c b/block/blkverify.c
index d1facf5ba90..53ba1c91957 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -16,6 +16,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/memalign.h"
 
 typedef struct {
     BdrvChild *test_file;
diff --git a/block/block-copy.c b/block/block-copy.c
index ce116318b57..619e5580faf 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -22,6 +22,7 @@
 #include "qemu/coroutine.h"
 #include "block/aio_task.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 
 #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
 #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
diff --git a/block/commit.c b/block/commit.c
index b1fc7b908b2..a1292bb17ed 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
+#include "qemu/memalign.h"
 #include "sysemu/block-backend.h"
 
 enum {
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e20..a586dd040de 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -31,6 +31,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include "crypto.h"
 
 typedef struct BlockCrypto BlockCrypto;
diff --git a/block/dmg.c b/block/dmg.c
index 447901fbb87..c626587f9c5 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -27,6 +27,7 @@
 #include "qemu/bswap.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/memalign.h"
 #include "dmg.h"
 
 int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
diff --git a/block/export/fuse.c b/block/export/fuse.c
index fdda8e3c818..4a3bb5a1b8f 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -19,6 +19,7 @@
 #define FUSE_USE_VERSION 31
 
 #include "qemu/osdep.h"
+#include "qemu/memalign.h"
 #include "block/aio.h"
 #include "block/block.h"
 #include "block/export.h"
diff --git a/block/file-posix.c b/block/file-posix.c
index 1f1756e192a..c000a61db29 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -31,6 +31,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 #include "block/thread-pool.h"
 #include "qemu/iov.h"
diff --git a/block/io.c b/block/io.c
index 4e4cb556c58..ea031d39601 100644
--- a/block/io.c
+++ b/block/io.c
@@ -32,6 +32,7 @@
 #include "block/coroutines.h"
 #include "block/write-threshold.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/block/mirror.c b/block/mirror.c
index 69b2c1c697e..eda8aab0eb8 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -23,6 +23,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
 #include "qemu/bitmap.h"
+#include "qemu/memalign.h"
 
 #define MAX_IN_FLIGHT 16
 #define MAX_IO_BYTES (1 << 20) /* 1 Mb */
diff --git a/block/nvme.c b/block/nvme.c
index dd20de3865b..552029931d5 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -21,6 +21,7 @@
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
+#include "qemu/memalign.h"
 #include "qemu/vfio-helpers.h"
 #include "block/block_int.h"
 #include "sysemu/replay.h"
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
index e0dd0975c6f..cb22a427d72 100644
--- a/block/parallels-ext.c
+++ b/block/parallels-ext.c
@@ -29,6 +29,7 @@
 #include "parallels.h"
 #include "crypto/hash.h"
 #include "qemu/uuid.h"
+#include "qemu/memalign.h"
 
 #define PARALLELS_FORMAT_EXTENSION_MAGIC 0xAB234CEF23DCEA87ULL
 
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bbc..5a3487537b4 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -41,6 +41,7 @@
 #include "qapi/qapi-visit-block-core.h"
 #include "qemu/bswap.h"
 #include "qemu/bitmap.h"
+#include "qemu/memalign.h"
 #include "migration/blocker.h"
 #include "parallels.h"
 
diff --git a/block/qcow.c b/block/qcow.c
index c39940f33eb..4fba1b9e364 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -32,6 +32,7 @@
 #include "qemu/option.h"
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include <zlib.h>
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c
index 7444b9c4ab0..8a0105911f7 100644
--- a/block/qcow2-cache.c
+++ b/block/qcow2-cache.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/memalign.h"
 #include "qcow2.h"
 #include "trace.h"
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 21884a1ab9a..20a16ba6ee0 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qcow2.h"
 #include "qemu/bswap.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 
 int qcow2_shrink_l1_table(BlockDriverState *bs, uint64_t exact_size)
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 46145722527..94033972bed 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -28,6 +28,7 @@
 #include "qemu/range.h"
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 
 static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 71ddb08c212..075269a0237 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -29,6 +29,7 @@
 #include "qemu/bswap.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 
 static void qcow2_free_single_snapshot(BlockDriverState *bs, int i)
 {
diff --git a/block/qcow2.c b/block/qcow2.c
index c8115e1cba0..b5c47931ef4 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -38,6 +38,7 @@
 #include "qemu/option_int.h"
 #include "qemu/cutils.h"
 #include "qemu/bswap.h"
+#include "qemu/memalign.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-block-core.h"
 #include "crypto.h"
diff --git a/block/qed-l2-cache.c b/block/qed-l2-cache.c
index b5483623989..caf2c024c2d 100644
--- a/block/qed-l2-cache.c
+++ b/block/qed-l2-cache.c
@@ -51,6 +51,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 #include "qed.h"
 
diff --git a/block/qed-table.c b/block/qed-table.c
index 405d446cbe7..1cc844b1a5f 100644
--- a/block/qed-table.c
+++ b/block/qed-table.c
@@ -17,6 +17,7 @@
 #include "qemu/sockets.h" /* for EINPROGRESS on Windows */
 #include "qed.h"
 #include "qemu/bswap.h"
+#include "qemu/memalign.h"
 
 /* Called with table_lock held.  */
 static int coroutine_fn qed_read_table(BDRVQEDState *s, uint64_t offset,
diff --git a/block/qed.c b/block/qed.c
index 558d3646c4b..f34d9a3ac1a 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -20,6 +20,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 #include "qed.h"
 #include "sysemu/block-backend.h"
diff --git a/block/quorum.c b/block/quorum.c
index c28dda7baac..f33f30d36b8 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -17,6 +17,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/memalign.h"
 #include "block/block_int.h"
 #include "block/coroutines.h"
 #include "block/qdict.h"
diff --git a/block/raw-format.c b/block/raw-format.c
index bda757fd195..69fd650eaf7 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -31,6 +31,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/memalign.h"
 
 typedef struct BDRVRawState {
     uint64_t offset;
diff --git a/block/vdi.c b/block/vdi.c
index bdc58d726ee..cca3a3a3567 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -64,6 +64,7 @@
 #include "qemu/coroutine.h"
 #include "qemu/cutils.h"
 #include "qemu/uuid.h"
+#include "qemu/memalign.h"
 
 /* Code configuration options. */
 
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 7672161d955..ff0d4e0da05 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -23,6 +23,7 @@
 #include "block/block_int.h"
 #include "qemu/error-report.h"
 #include "qemu/bswap.h"
+#include "qemu/memalign.h"
 #include "vhdx.h"
 
 
diff --git a/block/vhdx.c b/block/vhdx.c
index 356ec4c455a..410c6f96101 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -25,6 +25,7 @@
 #include "qemu/crc32c.h"
 #include "qemu/bswap.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 #include "vhdx.h"
 #include "migration/blocker.h"
 #include "qemu/uuid.h"
diff --git a/block/vmdk.c b/block/vmdk.c
index 0dfab6e9413..37c0946066e 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -33,6 +33,7 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/bswap.h"
+#include "qemu/memalign.h"
 #include "migration/blocker.h"
 #include "qemu/cutils.h"
 #include <zlib.h>
diff --git a/block/vpc.c b/block/vpc.c
index 297a26262ab..4d8f16e1990 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -33,6 +33,7 @@
 #include "migration/blocker.h"
 #include "qemu/bswap.h"
 #include "qemu/uuid.h"
+#include "qemu/memalign.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-block-core.h"
diff --git a/block/win32-aio.c b/block/win32-aio.c
index c57e10c9979..aadc7b1bc3c 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -29,6 +29,7 @@
 #include "block/raw-aio.h"
 #include "qemu/event_notifier.h"
 #include "qemu/iov.h"
+#include "qemu/memalign.h"
 #include <windows.h>
 #include <winioctl.h>
 
diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 860787580a3..2785b9e8497 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu/memalign.h"
 #include "qapi/error.h"
 #include "hw/xen/xen_common.h"
 #include "hw/block/xen_blkif.h"
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 21d18ac2e36..347875a0cda 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -32,6 +32,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
+#include "qemu/memalign.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 33463d9b8f2..a7ac4de18ad 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -30,6 +30,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "qemu/hw-version.h"
+#include "qemu/memalign.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f0b75b22bb6..ae271743ed5 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/datadir.h"
+#include "qemu/memalign.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/qapi-events-qdev.h"
diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index 4ee03c83e48..5170a33369e 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 3666b8d9468..072686ed58f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -26,6 +26,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/hw-version.h"
+#include "qemu/memalign.h"
 #include "hw/scsi/scsi.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 6dbb9f41e40..c89ac53e65e 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -12,7 +12,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/memalign.h"
 #include "qapi/error.h"
 #include "sysemu/memory_mapping.h"
 #include "migration/vmstate.h"
diff --git a/nbd/server.c b/nbd/server.c
index 9fb2f264023..53e68cf027f 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -25,6 +25,7 @@
 #include "trace.h"
 #include "nbd-internal.h"
 #include "qemu/units.h"
+#include "qemu/memalign.h"
 
 #define NBD_META_ID_BASE_ALLOCATION 0
 #define NBD_META_ID_ALLOCATION_DEPTH 1
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index e4d4218db69..b8faa8796c8 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -34,7 +34,7 @@
 #include "qemu/sockets.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
-
+#include "qemu/memalign.h"
 
 /* The buffer size needs to be investigated for optimum numbers and
  * optimum means of paging in on different systems. This size is
diff --git a/plugins/loader.c b/plugins/loader.c
index 4883b0a1cbc..88c30bde2d6 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -27,6 +27,7 @@
 #include "qemu/cacheinfo.h"
 #include "qemu/xxhash.h"
 #include "qemu/plugin.h"
+#include "qemu/memalign.h"
 #include "hw/core/cpu.h"
 #include "exec/exec-all.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/qemu-img.c b/qemu-img.c
index 6fe2466032f..5dffb3e6160 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -42,6 +42,7 @@
 #include "qemu/module.h"
 #include "qemu/sockets.h"
 #include "qemu/units.h"
+#include "qemu/memalign.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/block-backend.h"
 #include "block/block_int.h"
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 46593d632d8..633b46cdb25 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -21,6 +21,7 @@
 #include "qemu/option.h"
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 
 #define CMD_NOFILE_OK   0x01
 
diff --git a/qom/object.c b/qom/object.c
index 9f7a33139d4..4048a2fef1e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -16,6 +16,7 @@
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 #include "qapi/visitor.h"
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index a13289a594a..59dcf13faf4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -42,6 +42,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
+#include "qemu/memalign.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab3..fc12c02fb21 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -49,6 +49,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2c8feb4a6f7..83d09883020 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -37,6 +37,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
diff --git a/tcg/region.c b/tcg/region.c
index 72afb357389..97ca5291d52 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
+#include "qemu/memalign.h"
 #include "qemu/cacheinfo.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
diff --git a/tests/bench/atomic_add-bench.c b/tests/bench/atomic_add-bench.c
index f05471ab45c..8a6faad6ece 100644
--- a/tests/bench/atomic_add-bench.c
+++ b/tests/bench/atomic_add-bench.c
@@ -2,6 +2,7 @@
 #include "qemu/thread.h"
 #include "qemu/host-utils.h"
 #include "qemu/processor.h"
+#include "qemu/memalign.h"
 
 struct thread_info {
     uint64_t r;
diff --git a/tests/bench/qht-bench.c b/tests/bench/qht-bench.c
index 2e5b70ccd04..8afe161d106 100644
--- a/tests/bench/qht-bench.c
+++ b/tests/bench/qht-bench.c
@@ -10,6 +10,7 @@
 #include "qemu/qht.h"
 #include "qemu/rcu.h"
 #include "qemu/xxhash.h"
+#include "qemu/memalign.h"
 
 struct thread_stats {
     size_t rd;
diff --git a/util/atomic64.c b/util/atomic64.c
index 22983a970f1..c20d071d8e5 100644
--- a/util/atomic64.c
+++ b/util/atomic64.c
@@ -8,6 +8,7 @@
 #include "qemu/atomic.h"
 #include "qemu/thread.h"
 #include "qemu/cacheinfo.h"
+#include "qemu/memalign.h"
 
 #ifdef CONFIG_ATOMIC64
 #error This file must only be compiled if !CONFIG_ATOMIC64
diff --git a/util/memalign.c b/util/memalign.c
index db6cdb095f9..6420f4dc037 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
+#include "qemu/memalign.h"
 #include "trace.h"
 
 void *qemu_try_memalign(size_t alignment, size_t size)
diff --git a/util/qht.c b/util/qht.c
index 079605121b1..065fc501f44 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -69,6 +69,7 @@
 #include "qemu/qht.h"
 #include "qemu/atomic.h"
 #include "qemu/rcu.h"
+#include "qemu/memalign.h"
 
 //#define QHT_DEBUG
 
-- 
2.25.1


