Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B932B7E3D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:23:34 +0100 (CET)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNQr-0001D4-1D
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNOQ-0007zF-Q4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:21:04 -0500
Received: from relay.sw.ru ([185.231.240.75]:48196 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNOG-00023u-Mg
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:21:02 -0500
Received: from [192.168.15.37] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNO2-009Ap3-1E; Wed, 18 Nov 2020 16:20:38 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v2 2/7] Introduced UFFD-WP low-level interface helpers.
 Implemented support for the whole RAM block memory protection/un-protection.
 Higher level ram_write_tracking_start() and ram_write_tracking_stop() to
 start/stop tracking memory writes on the whole VM memory.
Date: Wed, 18 Nov 2020 16:20:43 +0300
Message-Id: <20201118132048.429092-3-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
References: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/exec/memory.h |   7 ++
 migration/ram.c       | 267 ++++++++++++++++++++++++++++++++++++++++++
 migration/ram.h       |   4 +
 3 files changed, 278 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f3e6bcd5e..3d798fce16 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -139,6 +139,13 @@ typedef struct IOMMUNotifier IOMMUNotifier;
 /* RAM is a persistent kind memory */
 #define RAM_PMEM (1 << 5)
 
+/*
+ * UFFDIO_WRITEPROTECT is used on this RAMBlock to
+ * support 'write-tracking' migration type.
+ * Implies ram_state->ram_wt_enabled.
+ */
+#define RAM_UF_WRITEPROTECT (1 << 6)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..7f273c9996 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -56,6 +56,12 @@
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
+#include <inttypes.h>
+#include <poll.h>
+#include <sys/syscall.h>
+#include <sys/ioctl.h>
+#include <linux/userfaultfd.h>
+#include "sysemu/runstate.h"
 
 /***********************************************************/
 /* ram save/restore */
@@ -298,6 +304,8 @@ struct RAMSrcPageRequest {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /* UFFD file descriptor, used in 'write-tracking' migration */
+    int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
     /* Last block from where we have sent data */
@@ -453,6 +461,181 @@ static QemuThread *decompress_threads;
 static QemuMutex decomp_done_lock;
 static QemuCond decomp_done_cond;
 
+/**
+ * uffd_create_fd: create UFFD file descriptor
+ *
+ * Returns non-negative file descriptor or negative value in case of an error
+ */
+static int uffd_create_fd(void)
+{
+    int uffd;
+    struct uffdio_api api_struct;
+    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
+
+    uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
+    if (uffd < 0) {
+        error_report("uffd_create_fd() failed: UFFD not supported");
+        return -1;
+    }
+
+    api_struct.api = UFFD_API;
+    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
+    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
+        error_report("uffd_create_fd() failed: "
+                "API version not supported version=%llx errno=%i",
+                api_struct.api, errno);
+        goto fail;
+    }
+
+    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
+        error_report("uffd_create_fd() failed: "
+                "PAGEFAULT_FLAG_WP feature missing");
+        goto fail;
+    }
+
+    return uffd;
+
+fail:
+    close(uffd);
+    return -1;
+}
+
+/**
+ * uffd_close_fd: close UFFD file descriptor
+ *
+ * @uffd: UFFD file descriptor
+ */
+static void uffd_close_fd(int uffd)
+{
+    assert(uffd >= 0);
+    close(uffd);
+}
+
+/**
+ * uffd_register_memory: register memory range with UFFD
+ *
+ * Returns 0 in case of success, negative value on error
+ *
+ * @uffd: UFFD file descriptor
+ * @start: starting virtual address of memory range
+ * @length: length of memory range
+ * @track_missing: generate events on missing-page faults
+ * @track_wp: generate events on write-protected-page faults
+ */
+static int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
+        bool track_missing, bool track_wp)
+{
+    struct uffdio_register uffd_register;
+
+    uffd_register.range.start = start;
+    uffd_register.range.len = length;
+    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
+                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
+
+    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
+        error_report("uffd_register_memory() failed: "
+                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
+                start, length, uffd_register.mode, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_protect_memory: protect/unprotect memory range for writes with UFFD
+ *
+ * Returns 0 on success or negative value in case of error
+ *
+ * @uffd: UFFD file descriptor
+ * @start: starting virtual address of memory range
+ * @length: length of memory range
+ * @wp: write-protect/unprotect
+ */
+static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
+{
+    struct uffdio_writeprotect uffd_writeprotect;
+    int res;
+
+    uffd_writeprotect.range.start = start;
+    uffd_writeprotect.range.len = length;
+    uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
+
+    do {
+        res = ioctl(uffd, UFFDIO_WRITEPROTECT, &uffd_writeprotect);
+    } while (res < 0 && errno == EINTR);
+    if (res < 0) {
+        error_report("uffd_protect_memory() failed: "
+                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
+                start, length, uffd_writeprotect.mode, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+__attribute__ ((unused))
+static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
+__attribute__ ((unused))
+static bool uffd_poll_events(int uffd, int tmo);
+
+/**
+ * uffd_read_events: read pending UFFD events
+ *
+ * Returns number of fetched messages, 0 if non is available or
+ * negative value in case of an error
+ *
+ * @uffd: UFFD file descriptor
+ * @msgs: pointer to message buffer
+ * @count: number of messages that can fit in the buffer
+ */
+static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count)
+{
+    ssize_t res;
+    do {
+        res = read(uffd, msgs, count * sizeof(struct uffd_msg));
+    } while (res < 0 && errno == EINTR);
+
+    if ((res < 0 && errno == EAGAIN)) {
+        return 0;
+    }
+    if (res < 0) {
+        error_report("uffd_read_events() failed: errno=%i", errno);
+        return -1;
+    }
+
+    return (int) (res / sizeof(struct uffd_msg));
+}
+
+/**
+ * uffd_poll_events: poll UFFD file descriptor for read
+ *
+ * Returns true if events are available for read, false otherwise
+ *
+ * @uffd: UFFD file descriptor
+ * @tmo: timeout in milliseconds, 0 for non-blocking operation,
+ *       negative value for infinite wait
+ */
+static bool uffd_poll_events(int uffd, int tmo)
+{
+    int res;
+    struct pollfd poll_fd = { .fd = uffd, .events = POLLIN, .revents = 0 };
+
+    do {
+        res = poll(&poll_fd, 1, tmo);
+    } while (res < 0 && errno == EINTR);
+
+    if (res == 0) {
+        return false;
+    }
+    if (res < 0) {
+        error_report("uffd_poll_events() failed: errno=%i", errno);
+        return false;
+    }
+
+    return (poll_fd.revents & POLLIN) != 0;
+}
+
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
 
@@ -3788,6 +3971,90 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
     return 0;
 }
 
+/**
+ * ram_write_tracking_start: start UFFD-WP memory tracking
+ *
+ * Returns 0 for success or negative value in case of error
+ *
+ */
+int ram_write_tracking_start(void)
+{
+    int uffd;
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+
+    /* Open UFFD file descriptor */
+    uffd = uffd_create_fd();
+    if (uffd < 0) {
+        return uffd;
+    }
+    rs->uffdio_fd = uffd;
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs->mr->readonly || bs->mr->rom_device) {
+            continue;
+        }
+
+        /* Register block memory with UFFD to track writes */
+        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
+                bs->max_length, false, true)) {
+            goto fail;
+        }
+        /* Apply UFFD write protection to the block memory range */
+        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
+                bs->max_length, true)) {
+            goto fail;
+        }
+        bs->flags |= RAM_UF_WRITEPROTECT;
+
+        info_report("UFFD-WP write-tracking enabled: "
+                "block_id=%s page_size=%zu start=%p length=%lu "
+                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
+                bs->idstr, bs->page_size, bs->host, bs->max_length,
+                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
+                bs->mr->nonvolatile, bs->mr->rom_device);
+    }
+
+    return 0;
+
+fail:
+    uffd_close_fd(uffd);
+    rs->uffdio_fd = -1;
+    return -1;
+}
+
+/**
+ * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
+ */
+void ram_write_tracking_stop(void)
+{
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+    assert(rs->uffdio_fd >= 0);
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
+            continue;
+        }
+        info_report("UFFD-WP write-tracking disabled: "
+                "block_id=%s page_size=%zu start=%p length=%lu "
+                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
+                bs->idstr, bs->page_size, bs->host, bs->max_length,
+                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
+                bs->mr->nonvolatile, bs->mr->rom_device);
+        /* Cleanup flags */
+        bs->flags &= ~RAM_UF_WRITEPROTECT;
+    }
+
+    /*
+     * Close UFFD file descriptor to remove protection,
+     * release registered memory regions and flush wait queues
+     */
+    uffd_close_fd(rs->uffdio_fd);
+    rs->uffdio_fd = -1;
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
diff --git a/migration/ram.h b/migration/ram.h
index 011e85414e..3611cb51de 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
 void colo_release_ram_cache(void);
 void colo_incoming_start_dirty_log(void);
 
+/* Live snapshots */
+int ram_write_tracking_start(void);
+void ram_write_tracking_stop(void);
+
 #endif
-- 
2.25.1


