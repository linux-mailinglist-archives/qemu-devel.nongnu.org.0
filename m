Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA93138E8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:09:22 +0100 (CET)
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l996H-0007KX-Ca
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94k6-0001d4-0i
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94jr-0002FQ-Jz
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKN/6mhZxJuaALzAGSZX4YBfiVSNJSmIaYCbzbvtIT8=;
 b=ZgnYCJz6PMOSRd7MSBPZRmdKDxq4ACfAG0WyLgXeNcdy2HwuyczZMcFo64fxEdLznoF4w+
 KFzR1xFVehKD30tGdSD9buSkrjSeyY8r0mlsV0qrGO9znR5/a9vCkedKYVDV21zuahlM5p
 JdqOcm0ebkO78PewCt322Etjzr7Lc7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-XOd0PZeDMeKI1gY7RzDDLQ-1; Mon, 08 Feb 2021 06:29:51 -0500
X-MC-Unique: XOd0PZeDMeKI1gY7RzDDLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CEE61005501;
 Mon,  8 Feb 2021 11:29:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D811002388;
 Mon,  8 Feb 2021 11:29:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 05/27] migration: introduce UFFD-WP low-level interface helpers
Date: Mon,  8 Feb 2021 11:28:56 +0000
Message-Id: <20210208112918.185058-6-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Glue code to the userfaultfd kernel implementation.
Querying feature support, createing file descriptor, feature control,
memory region registration, IOCTLs on registered registered regions.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210129101407.103458-3-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Fixed up range.start casting for 32bit
---
 include/exec/memory.h      |   1 +
 include/qemu/userfaultfd.h |  35 ++++
 util/meson.build           |   1 +
 util/trace-events          |   9 +
 util/userfaultfd.c         | 345 +++++++++++++++++++++++++++++++++++++
 5 files changed, 391 insertions(+)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100644 util/userfaultfd.c

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6ce74fb79..37096217e7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -149,6 +149,7 @@ typedef struct IOMMUTLBEvent {
 /* RAM is a persistent kind memory */
 #define RAM_PMEM (1 << 5)
 
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
new file mode 100644
index 0000000000..6b74f92792
--- /dev/null
+++ b/include/qemu/userfaultfd.h
@@ -0,0 +1,35 @@
+/*
+ * Linux UFFD-WP support
+ *
+ * Copyright Virtuozzo GmbH, 2020
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef USERFAULTFD_H
+#define USERFAULTFD_H
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include <linux/userfaultfd.h>
+
+int uffd_query_features(uint64_t *features);
+int uffd_create_fd(uint64_t features, bool non_blocking);
+void uffd_close_fd(int uffd_fd);
+int uffd_register_memory(int uffd_fd, void *addr, uint64_t length,
+        uint64_t mode, uint64_t *ioctls);
+int uffd_unregister_memory(int uffd_fd, void *addr, uint64_t length);
+int uffd_change_protection(int uffd_fd, void *addr, uint64_t length,
+        bool wp, bool dont_wake);
+int uffd_copy_page(int uffd_fd, void *dst_addr, void *src_addr,
+        uint64_t length, bool dont_wake);
+int uffd_zero_page(int uffd_fd, void *addr, uint64_t length, bool dont_wake);
+int uffd_wakeup(int uffd_fd, void *addr, uint64_t length);
+int uffd_read_events(int uffd_fd, struct uffd_msg *msgs, int count);
+bool uffd_poll_events(int uffd_fd, int tmo);
+
+#endif /* USERFAULTFD_H */
diff --git a/util/meson.build b/util/meson.build
index 3eccdbe596..984fba965f 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -52,6 +52,7 @@ if have_system
   util_ss.add(files('crc-ccitt.c'))
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
   util_ss.add(files('yank.c'))
+  util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
 if have_block
diff --git a/util/trace-events b/util/trace-events
index 61e0d4bcdf..bac0924899 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -91,3 +91,12 @@ qemu_vfio_pci_read_config(void *buf, int ofs, int size, uint64_t region_ofs, uin
 qemu_vfio_pci_write_config(void *buf, int ofs, int size, uint64_t region_ofs, uint64_t region_size) "write cfg ptr %p ofs 0x%x size 0x%x (region addr 0x%"PRIx64" size 0x%"PRIx64")"
 qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_size, uint32_t cap_offset) "region '%s' addr 0x%"PRIx64" size 0x%"PRIx64" cap_ofs 0x%"PRIx32
 qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
+
+#userfaultfd.c
+uffd_query_features_nosys(int err) "errno: %i"
+uffd_query_features_api_failed(int err) "errno: %i"
+uffd_create_fd_nosys(int err) "errno: %i"
+uffd_create_fd_api_failed(int err) "errno: %i"
+uffd_create_fd_api_noioctl(uint64_t ioctl_req, uint64_t ioctl_supp) "ioctl_req: 0x%" PRIx64 "ioctl_supp: 0x%" PRIx64
+uffd_register_memory_failed(void *addr, uint64_t length, uint64_t mode, int err) "addr: %p length: %" PRIu64 " mode: 0x%" PRIx64 " errno: %i"
+uffd_unregister_memory_failed(void *addr, uint64_t length, int err) "addr: %p length: %" PRIu64 " errno: %i"
diff --git a/util/userfaultfd.c b/util/userfaultfd.c
new file mode 100644
index 0000000000..f1cd6af2b1
--- /dev/null
+++ b/util/userfaultfd.c
@@ -0,0 +1,345 @@
+/*
+ * Linux UFFD-WP support
+ *
+ * Copyright Virtuozzo GmbH, 2020
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/userfaultfd.h"
+#include "trace.h"
+#include <poll.h>
+#include <sys/syscall.h>
+#include <sys/ioctl.h>
+
+/**
+ * uffd_query_features: query UFFD features
+ *
+ * Returns: 0 on success, negative value in case of an error
+ *
+ * @features: parameter to receive 'uffdio_api.features'
+ */
+int uffd_query_features(uint64_t *features)
+{
+    int uffd_fd;
+    struct uffdio_api api_struct = { 0 };
+    int ret = -1;
+
+    uffd_fd = syscall(__NR_userfaultfd, O_CLOEXEC);
+    if (uffd_fd < 0) {
+        trace_uffd_query_features_nosys(errno);
+        return -1;
+    }
+
+    api_struct.api = UFFD_API;
+    api_struct.features = 0;
+
+    if (ioctl(uffd_fd, UFFDIO_API, &api_struct)) {
+        trace_uffd_query_features_api_failed(errno);
+        goto out;
+    }
+    *features = api_struct.features;
+    ret = 0;
+
+out:
+    close(uffd_fd);
+    return ret;
+}
+
+/**
+ * uffd_create_fd: create UFFD file descriptor
+ *
+ * Returns non-negative file descriptor or negative value in case of an error
+ *
+ * @features: UFFD features to request
+ * @non_blocking: create UFFD file descriptor for non-blocking operation
+ */
+int uffd_create_fd(uint64_t features, bool non_blocking)
+{
+    int uffd_fd;
+    int flags;
+    struct uffdio_api api_struct = { 0 };
+    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
+
+    flags = O_CLOEXEC | (non_blocking ? O_NONBLOCK : 0);
+    uffd_fd = syscall(__NR_userfaultfd, flags);
+    if (uffd_fd < 0) {
+        trace_uffd_create_fd_nosys(errno);
+        return -1;
+    }
+
+    api_struct.api = UFFD_API;
+    api_struct.features = features;
+    if (ioctl(uffd_fd, UFFDIO_API, &api_struct)) {
+        trace_uffd_create_fd_api_failed(errno);
+        goto fail;
+    }
+    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
+        trace_uffd_create_fd_api_noioctl(ioctl_mask, api_struct.ioctls);
+        goto fail;
+    }
+
+    return uffd_fd;
+
+fail:
+    close(uffd_fd);
+    return -1;
+}
+
+/**
+ * uffd_close_fd: close UFFD file descriptor
+ *
+ * @uffd_fd: UFFD file descriptor
+ */
+void uffd_close_fd(int uffd_fd)
+{
+    assert(uffd_fd >= 0);
+    close(uffd_fd);
+}
+
+/**
+ * uffd_register_memory: register memory range via UFFD-IO
+ *
+ * Returns 0 in case of success, negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @addr: base address of memory range
+ * @length: length of memory range
+ * @mode: UFFD register mode (UFFDIO_REGISTER_MODE_MISSING, ...)
+ * @ioctls: optional pointer to receive supported IOCTL mask
+ */
+int uffd_register_memory(int uffd_fd, void *addr, uint64_t length,
+        uint64_t mode, uint64_t *ioctls)
+{
+    struct uffdio_register uffd_register;
+
+    uffd_register.range.start = (uintptr_t) addr;
+    uffd_register.range.len = length;
+    uffd_register.mode = mode;
+
+    if (ioctl(uffd_fd, UFFDIO_REGISTER, &uffd_register)) {
+        trace_uffd_register_memory_failed(addr, length, mode, errno);
+        return -1;
+    }
+    if (ioctls) {
+        *ioctls = uffd_register.ioctls;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_unregister_memory: un-register memory range with UFFD-IO
+ *
+ * Returns 0 in case of success, negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @addr: base address of memory range
+ * @length: length of memory range
+ */
+int uffd_unregister_memory(int uffd_fd, void *addr, uint64_t length)
+{
+    struct uffdio_range uffd_range;
+
+    uffd_range.start = (uintptr_t) addr;
+    uffd_range.len = length;
+
+    if (ioctl(uffd_fd, UFFDIO_UNREGISTER, &uffd_range)) {
+        trace_uffd_unregister_memory_failed(addr, length, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_change_protection: protect/un-protect memory range for writes via UFFD-IO
+ *
+ * Returns 0 on success, negative value in case of error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @addr: base address of memory range
+ * @length: length of memory range
+ * @wp: write-protect/unprotect
+ * @dont_wake: do not wake threads waiting on wr-protected page
+ */
+int uffd_change_protection(int uffd_fd, void *addr, uint64_t length,
+        bool wp, bool dont_wake)
+{
+    struct uffdio_writeprotect uffd_writeprotect;
+
+    uffd_writeprotect.range.start = (uintptr_t) addr;
+    uffd_writeprotect.range.len = length;
+    if (!wp && dont_wake) {
+        /* DONTWAKE is meaningful only on protection release */
+        uffd_writeprotect.mode = UFFDIO_WRITEPROTECT_MODE_DONTWAKE;
+    } else {
+        uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
+    }
+
+    if (ioctl(uffd_fd, UFFDIO_WRITEPROTECT, &uffd_writeprotect)) {
+        error_report("uffd_change_protection() failed: addr=%p len=%" PRIu64
+                " mode=%" PRIx64 " errno=%i", addr, length,
+                (uint64_t) uffd_writeprotect.mode, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_copy_page: copy range of pages to destination via UFFD-IO
+ *
+ * Copy range of source pages to the destination to resolve
+ * missing page fault somewhere in the destination range.
+ *
+ * Returns 0 on success, negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @dst_addr: destination base address
+ * @src_addr: source base address
+ * @length: length of the range to copy
+ * @dont_wake: do not wake threads waiting on missing page
+ */
+int uffd_copy_page(int uffd_fd, void *dst_addr, void *src_addr,
+        uint64_t length, bool dont_wake)
+{
+    struct uffdio_copy uffd_copy;
+
+    uffd_copy.dst = (uintptr_t) dst_addr;
+    uffd_copy.src = (uintptr_t) src_addr;
+    uffd_copy.len = length;
+    uffd_copy.mode = dont_wake ? UFFDIO_COPY_MODE_DONTWAKE : 0;
+
+    if (ioctl(uffd_fd, UFFDIO_COPY, &uffd_copy)) {
+        error_report("uffd_copy_page() failed: dst_addr=%p src_addr=%p length=%" PRIu64
+                " mode=%" PRIx64 " errno=%i", dst_addr, src_addr,
+                length, (uint64_t) uffd_copy.mode, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_zero_page: fill range of pages with zeroes via UFFD-IO
+ *
+ * Fill range pages with zeroes to resolve missing page fault within the range.
+ *
+ * Returns 0 on success, negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @addr: base address
+ * @length: length of the range to fill with zeroes
+ * @dont_wake: do not wake threads waiting on missing page
+ */
+int uffd_zero_page(int uffd_fd, void *addr, uint64_t length, bool dont_wake)
+{
+    struct uffdio_zeropage uffd_zeropage;
+
+    uffd_zeropage.range.start = (uintptr_t) addr;
+    uffd_zeropage.range.len = length;
+    uffd_zeropage.mode = dont_wake ? UFFDIO_ZEROPAGE_MODE_DONTWAKE : 0;
+
+    if (ioctl(uffd_fd, UFFDIO_ZEROPAGE, &uffd_zeropage)) {
+        error_report("uffd_zero_page() failed: addr=%p length=%" PRIu64
+                " mode=%" PRIx64 " errno=%i", addr, length,
+                (uint64_t) uffd_zeropage.mode, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_wakeup: wake up threads waiting on page UFFD-managed page fault resolution
+ *
+ * Wake up threads waiting on any page/pages from the designated range.
+ * The main use case is when during some period, page faults are resolved
+ * via UFFD-IO IOCTLs with MODE_DONTWAKE flag set, then after that all waits
+ * for the whole memory range are satisfied in a single call to uffd_wakeup().
+ *
+ * Returns 0 on success, negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @addr: base address
+ * @length: length of the range
+ */
+int uffd_wakeup(int uffd_fd, void *addr, uint64_t length)
+{
+    struct uffdio_range uffd_range;
+
+    uffd_range.start = (uintptr_t) addr;
+    uffd_range.len = length;
+
+    if (ioctl(uffd_fd, UFFDIO_WAKE, &uffd_range)) {
+        error_report("uffd_wakeup() failed: addr=%p length=%" PRIu64 " errno=%i",
+                addr, length, errno);
+        return -1;
+    }
+
+    return 0;
+}
+
+/**
+ * uffd_read_events: read pending UFFD events
+ *
+ * Returns number of fetched messages, 0 if non is available or
+ * negative value in case of an error
+ *
+ * @uffd_fd: UFFD file descriptor
+ * @msgs: pointer to message buffer
+ * @count: number of messages that can fit in the buffer
+ */
+int uffd_read_events(int uffd_fd, struct uffd_msg *msgs, int count)
+{
+    ssize_t res;
+    do {
+        res = read(uffd_fd, msgs, count * sizeof(struct uffd_msg));
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
+ * @uffd_fd: UFFD file descriptor
+ * @tmo: timeout value
+ */
+bool uffd_poll_events(int uffd_fd, int tmo)
+{
+    int res;
+    struct pollfd poll_fd = { .fd = uffd_fd, .events = POLLIN, .revents = 0 };
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
-- 
2.29.2


