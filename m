Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF201637D6B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 17:00:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEdK-0002hg-KC; Thu, 24 Nov 2022 10:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd5-0002No-Ib; Thu, 24 Nov 2022 10:59:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1oyEd1-0005Ij-PR; Thu, 24 Nov 2022 10:59:10 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 65B4C41207;
 Thu, 24 Nov 2022 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=
 mta-01; t=1669305542; x=1671119943; bh=g2VWrqkDJiHejX+GoKzn/q2HX
 BXxif6DTEvFXZGExpA=; b=e7qx4vvVK/20YU9E9kIQTa45w06AlQIifKLgnWuE2
 MuyZmSf/utLSPLSns9IAl9rEvvERZW3JYjBzkCjdJ6eAQcc/sLySnoPUWnpCHgZA
 pVh68QUFhoSOGUpu35328Tw1k3DFbJuCsPhGU2jQG/QPVqpVfe5DMsagM1b6B96S
 nM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoD-xndSWQ20; Thu, 24 Nov 2022 18:59:02 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (T-EXCH-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2BAC440311;
 Thu, 24 Nov 2022 18:59:02 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 24 Nov 2022 18:59:01 +0300
Received: from archlinux.yadro.com (10.178.113.54) by T-EXCH-09.corp.yadro.com
 (172.17.11.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 24 Nov
 2022 18:59:00 +0300
From: Dmitry Tihov <d.tihov@yadro.com>
To: <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, <kbusch@kernel.org>, <its@irrelevant.dk>,
 <linux@yadro.com>, <m.malygin@yadro.com>, <a.buev@yadro.com>,
 <ddtikhov@gmail.com>
Subject: [RFC 2/5] block: add transfer of protection information
Date: Thu, 24 Nov 2022 18:58:18 +0300
Message-ID: <20221124155821.1501969-3-d.tihov@yadro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124155821.1501969-1-d.tihov@yadro.com>
References: <20221124155821.1501969-1-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Under linux hosts, T10 protection information can be passed directly
from userspace to integrity capable block devices using io_uring API.
Discover integrity capable block devices and support submitting IO with
integrity payload to such block devices if it is present in request.

Signed-off-by: Dmitry Tihov <d.tihov@yadro.com>
---
 block/file-posix.c           | 130 +++++++++++++++++++++++++++++++++--
 block/io_uring.c             | 109 +++++++++++++++++++++++++++--
 include/block/block-common.h |   2 +
 include/block/raw-aio.h      |   3 +-
 include/qemu/iov.h           |   6 ++
 util/iov.c                   |  24 +++++++
 6 files changed, 262 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc..1eec7dd3cb 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -152,6 +152,10 @@ typedef struct BDRVRawState {
     int perm_change_flags;
     BDRVReopenState *reopen_state;
 
+    /* DIF T10 Protection Information */
+    uint8_t t10_type;
+    uint64_t protection_interval_bytes;
+
     bool has_discard:1;
     bool has_write_zeroes:1;
     bool use_linux_aio:1;
@@ -2094,8 +2098,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 #ifdef CONFIG_LINUX_IO_URING
     } else if (s->use_linux_io_uring) {
         LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
+        bool is_pi = (s->t10_type && qiov->dif.iov_len);
         assert(qiov->size == bytes);
-        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
+        return luring_co_submit(bs, aio, s->fd, offset, qiov, type, is_pi);
 #endif
 #ifdef CONFIG_LINUX_AIO
     } else if (s->use_linux_aio) {
@@ -2190,7 +2195,7 @@ static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
         LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
-        return luring_co_submit(bs, aio, s->fd, 0, NULL, QEMU_AIO_FLUSH);
+        return luring_co_submit(bs, aio, s->fd, 0, NULL, QEMU_AIO_FLUSH, false);
     }
 #endif
     return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
@@ -3516,6 +3521,110 @@ static bool hdev_is_sg(BlockDriverState *bs)
     return false;
 }
 
+#if defined(CONFIG_LINUX_IO_URING)
+
+static int fill_pi_info(BlockDriverState *bs, Error **errp)
+{
+    BDRVRawState *s = bs->opaque;
+    int ret = 0, bytes;
+    uint64_t is_integrity_capable;
+    g_autofree char *sysfs_int_cap = NULL;
+    g_autofree char *sysfs_fmt = NULL;
+    g_autofree char *sysfs_bytes = NULL;
+    const char *str_int_cap;
+    const char *str_bytes;
+    int fd_fmt = -1, fd_bytes = -1, fd_int_cap = -1;
+    char buf[24] = {0};
+    g_autofree char *dev_name = g_path_get_basename(bs->filename);
+
+    str_int_cap = "/sys/class/block/%s/integrity/device_is_integrity_capable";
+    sysfs_int_cap = g_strdup_printf(str_int_cap, dev_name);
+    sysfs_fmt = g_strdup_printf("/sys/class/block/%s/integrity/format",
+                                dev_name);
+    str_bytes = "/sys/class/block/%s/integrity/protection_interval_bytes";
+    sysfs_bytes = g_strdup_printf(str_bytes, dev_name);
+
+    if (!(bs->open_flags & BDRV_O_NOCACHE)) {
+        goto out;
+    }
+
+    fd_int_cap = open(sysfs_int_cap, O_RDONLY);
+    if (fd_int_cap == -1) {
+        error_setg_errno(errp, errno, "Can not open %s integrity capability"
+                         " sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    bytes = read(fd_int_cap, buf, sizeof(buf));
+    if (bytes < 0) {
+        error_setg_errno(errp, errno, "Can not read %s integrity capability"
+                         " sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    is_integrity_capable = g_ascii_strtoull(buf, NULL, 10);
+    if (!is_integrity_capable) {
+        goto out;
+    }
+    memset(buf, 0, sizeof(buf));
+
+    fd_fmt = open(sysfs_fmt, O_RDONLY);
+    if (fd_fmt == -1) {
+        error_setg_errno(errp, errno, "Can not open %s integrity format"
+                         " sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    bytes = read(fd_fmt, buf, sizeof(buf));
+    if (bytes < 0) {
+        error_setg_errno(errp, errno, "Can not read %s integrity format"
+                         " sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    if (bytes > 0 && buf[bytes - 1] == '\n') {
+        buf[bytes - 1] = 0;
+    }
+    if (strcmp(buf, "T10-DIF-TYPE1-CRC") == 0) {
+        s->t10_type = 1;
+    } else if (strcmp(buf, "T10-DIF-TYPE3-CRC") == 0) {
+        s->t10_type = 3;
+    } else {
+        s->t10_type = 0;
+    }
+    memset(buf, 0, sizeof(buf));
+
+    fd_bytes = open(sysfs_bytes, O_RDONLY);
+    if (fd_bytes == -1) {
+        error_setg_errno(errp, errno, "Can not open %s protection interval"
+                         " bytes sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    if (read(fd_bytes, buf, sizeof(buf)) < 0) {
+        error_setg_errno(errp, errno, "Can not read %s protection interval"
+                   " bytes sysfs entry", dev_name);
+        ret = -errno;
+        goto out;
+    }
+    s->protection_interval_bytes = g_ascii_strtoull(buf, NULL, 10);
+
+out:
+    if (fd_fmt != -1) {
+        close(fd_fmt);
+    }
+    if (fd_bytes != -1) {
+        close(fd_bytes);
+    }
+    if (fd_int_cap != -1) {
+        close(fd_int_cap);
+    }
+
+    return ret;
+}
+
+#endif
+
 static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
                      Error **errp)
 {
@@ -3601,6 +3710,11 @@ hdev_open_Mac_error:
     /* Since this does ioctl the device must be already opened */
     bs->sg = hdev_is_sg(bs);
 
+#if defined(CONFIG_LINUX_IO_URING)
+    if (s->use_linux_io_uring) {
+        ret = fill_pi_info(bs, errp);
+    }
+#endif
     return ret;
 }
 
@@ -3668,6 +3782,14 @@ static coroutine_fn int hdev_co_pwrite_zeroes(BlockDriverState *bs,
     return raw_do_pwrite_zeroes(bs, offset, bytes, flags, true);
 }
 
+static int hdev_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
+{
+    BDRVRawState *s = bs->opaque;
+    bdi->protection_interval = s->protection_interval_bytes;
+    bdi->protection_type = s->t10_type;
+    return 0;
+}
+
 static BlockDriver bdrv_host_device = {
     .format_name        = "host_device",
     .protocol_name        = "host_device",
@@ -3698,8 +3820,8 @@ static BlockDriver bdrv_host_device = {
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate       = raw_co_truncate,
-    .bdrv_getlength	= raw_getlength,
-    .bdrv_get_info = raw_get_info,
+    .bdrv_getlength         = raw_getlength,
+    .bdrv_get_info          = hdev_get_info,
     .bdrv_get_allocated_file_size
                         = raw_get_allocated_file_size,
     .bdrv_get_specific_stats = hdev_get_specific_stats,
diff --git a/block/io_uring.c b/block/io_uring.c
index 973e15d876..ba9fec1145 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -21,6 +21,84 @@
 /* io_uring ring size */
 #define MAX_ENTRIES 128
 
+#define IORING_OP_READV_PI  (48)
+#define IORING_OP_WRITEV_PI (49)
+
+#pragma pack(push, 1)
+
+struct __io_uring_sqe {
+    __u8    opcode;     /* type of operation for this sqe */
+    __u8    flags;      /* IOSQE_ flags */
+    __u16   ioprio;     /* ioprio for the request */
+    __s32   fd;     /* file descriptor to do IO on */
+    union {
+        __u64   off;    /* offset into file */
+        __u64   addr2;
+    };
+    union {
+        __u64   addr;   /* pointer to buffer or iovecs */
+        __u64   splice_off_in;
+    };
+    __u32   len;        /* buffer size or number of iovecs */
+    union {
+        __kernel_rwf_t  rw_flags;
+        __u32       fsync_flags;
+        __u16       poll_events;    /* compatibility */
+        __u32       poll32_events;  /* word-reversed for BE */
+        __u32       sync_range_flags;
+        __u32       msg_flags;
+        __u32       timeout_flags;
+        __u32       accept_flags;
+        __u32       cancel_flags;
+        __u32       open_flags;
+        __u32       statx_flags;
+        __u32       fadvise_advice;
+        __u32       splice_flags;
+        __u32       rename_flags;
+        __u32       unlink_flags;
+        __u32       hardlink_flags;
+    };
+    __u64   user_data;  /* data to be passed back at completion time */
+    /* pack this to avoid bogus arm OABI complaints */
+    union {
+        /* index into fixed buffers, if used */
+        __u16   buf_index;
+        /* for grouped buffer selection */
+        __u16   buf_group;
+    } __attribute__((packed));
+    /* personality to use, if used */
+    __u16   personality;
+    union {
+        __s32   splice_fd_in;
+        __u32   file_index;
+    };
+    __u64   pi_addr;
+    __u32 pi_len;
+    __u32   __pad2[1];
+};
+
+#pragma pack(pop)
+
+static inline void __io_uring_prep_writev_pi(uint8_t op,
+    struct io_uring_sqe *sqe, int fd, const struct iovec *iovecs,
+    unsigned nr_vecs, const struct iovec *pi_iovec, unsigned nr_pi_vecs,
+    off_t offset)
+{
+    io_uring_prep_rw(op, sqe, fd, iovecs, nr_vecs, offset);
+    ((struct __io_uring_sqe *)sqe)->pi_addr = (__u64)pi_iovec;
+    ((struct __io_uring_sqe *)sqe)->pi_len = nr_pi_vecs;
+}
+
+static inline void __io_uring_prep_readv_pi(uint8_t op,
+    struct io_uring_sqe *sqe, int fd, const struct iovec *iovecs,
+    unsigned nr_vecs, const struct iovec *pi_iovec, unsigned nr_pi_vecs,
+    off_t offset)
+{
+    io_uring_prep_rw(op, sqe, fd, iovecs, nr_vecs, offset);
+    ((struct __io_uring_sqe *)sqe)->pi_addr = (__u64)pi_iovec;
+    ((struct __io_uring_sqe *)sqe)->pi_len = nr_pi_vecs;
+}
+
 typedef struct LuringAIOCB {
     Coroutine *co;
     struct io_uring_sqe sqeq;
@@ -330,24 +408,39 @@ void luring_io_unplug(BlockDriverState *bs, LuringState *s)
  * @s: AIO state
  * @offset: offset for request
  * @type: type of request
+ * @is_pi: is protection information attached
  *
  * Fetches sqes from ring, adds to pending queue and preps them
  *
  */
 static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
-                            uint64_t offset, int type)
+                            uint64_t offset, int type, bool is_pi)
 {
     int ret;
     struct io_uring_sqe *sqes = &luringcb->sqeq;
 
     switch (type) {
     case QEMU_AIO_WRITE:
-        io_uring_prep_writev(sqes, fd, luringcb->qiov->iov,
-                             luringcb->qiov->niov, offset);
+        if (is_pi) {
+            __io_uring_prep_writev_pi(IORING_OP_WRITEV_PI, sqes, fd,
+                                      luringcb->qiov->iov,
+                                      luringcb->qiov->niov,
+                                      &luringcb->qiov->dif, 1, offset);
+        } else {
+            io_uring_prep_writev(sqes, fd, luringcb->qiov->iov,
+                                 luringcb->qiov->niov, offset);
+        }
         break;
     case QEMU_AIO_READ:
-        io_uring_prep_readv(sqes, fd, luringcb->qiov->iov,
-                            luringcb->qiov->niov, offset);
+        if (is_pi) {
+            __io_uring_prep_readv_pi(IORING_OP_READV_PI, sqes, fd,
+                                     luringcb->qiov->iov,
+                                     luringcb->qiov->niov,
+                                     &luringcb->qiov->dif, 1, offset);
+        } else {
+            io_uring_prep_readv(sqes, fd, luringcb->qiov->iov,
+                                luringcb->qiov->niov, offset);
+        }
         break;
     case QEMU_AIO_FLUSH:
         io_uring_prep_fsync(sqes, fd, IORING_FSYNC_DATASYNC);
@@ -374,7 +467,8 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
 }
 
 int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
-                                  uint64_t offset, QEMUIOVector *qiov, int type)
+                                  uint64_t offset, QEMUIOVector *qiov, int type,
+                                  bool is_pi)
 {
     int ret;
     LuringAIOCB luringcb = {
@@ -383,9 +477,10 @@ int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
         .qiov       = qiov,
         .is_read    = (type == QEMU_AIO_READ),
     };
+
     trace_luring_co_submit(bs, s, &luringcb, fd, offset, qiov ? qiov->size : 0,
                            type);
-    ret = luring_do_submit(fd, &luringcb, s, offset, type);
+    ret = luring_do_submit(fd, &luringcb, s, offset, type, is_pi);
 
     if (ret < 0) {
         return ret;
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 297704c1e9..1f283dbef8 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -59,6 +59,8 @@ typedef struct BlockDriverInfo {
      * True if this block driver only supports compressed writes
      */
     bool needs_compressed_writes;
+    uint8_t protection_type;
+    uint32_t protection_interval;
 } BlockDriverInfo;
 
 typedef struct BlockFragInfo {
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 21fc10c4c9..3f715b4bcc 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -65,7 +65,8 @@ typedef struct LuringState LuringState;
 LuringState *luring_init(Error **errp);
 void luring_cleanup(LuringState *s);
 int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type);
+                                uint64_t offset, QEMUIOVector *qiov, int type,
+                                bool is_pi);
 void luring_detach_aio_context(LuringState *s, AioContext *old_context);
 void luring_attach_aio_context(LuringState *s, AioContext *new_context);
 void luring_io_plug(BlockDriverState *bs, LuringState *s);
diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index 9330746680..58ae2d1f51 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -181,6 +181,9 @@ typedef struct QEMUIOVector {
             size_t size;
         };
     };
+
+    /* T10 data integrity field */
+    struct iovec dif;
 } QEMUIOVector;
 
 QEMU_BUILD_BUG_ON(offsetof(QEMUIOVector, size) !=
@@ -229,6 +232,9 @@ int qemu_iovec_init_extended(
         void *tail_buf, size_t tail_len);
 void qemu_iovec_init_slice(QEMUIOVector *qiov, QEMUIOVector *source,
                            size_t offset, size_t len);
+void qemu_iovec_init_pi(QEMUIOVector *qiov, int alloc_hint,
+                        unsigned int lba_cnt);
+void qemu_iovec_destroy_pi(QEMUIOVector *qiov);
 int qemu_iovec_subvec_niov(QEMUIOVector *qiov, size_t offset, size_t len);
 void qemu_iovec_add(QEMUIOVector *qiov, void *base, size_t len);
 void qemu_iovec_concat(QEMUIOVector *dst,
diff --git a/util/iov.c b/util/iov.c
index b4be580022..f0e51d5e66 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -20,6 +20,7 @@
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
+#include "qemu/memalign.h"
 
 size_t iov_from_buf_full(const struct iovec *iov, unsigned int iov_cnt,
                          size_t offset, const void *buf, size_t bytes)
@@ -278,6 +279,8 @@ void qemu_iovec_init(QEMUIOVector *qiov, int alloc_hint)
     qiov->niov = 0;
     qiov->nalloc = alloc_hint;
     qiov->size = 0;
+    qiov->dif.iov_base = NULL;
+    qiov->dif.iov_len = 0;
 }
 
 void qemu_iovec_init_external(QEMUIOVector *qiov, struct iovec *iov, int niov)
@@ -292,6 +295,19 @@ void qemu_iovec_init_external(QEMUIOVector *qiov, struct iovec *iov, int niov)
         qiov->size += iov[i].iov_len;
 }
 
+void qemu_iovec_init_pi(QEMUIOVector *qiov, int alloc_hint,
+                        unsigned int lba_cnt)
+{
+    void *alignd_mem = NULL;
+    qemu_iovec_init(qiov, alloc_hint);
+
+    /* dif size is always 8 bytes */
+    qiov->dif.iov_len = lba_cnt << 3;
+
+    alignd_mem = qemu_memalign(qemu_real_host_page_size(), qiov->dif.iov_len);
+    qiov->dif.iov_base = memset(alignd_mem, 0, qiov->dif.iov_len);
+}
+
 void qemu_iovec_add(QEMUIOVector *qiov, void *base, size_t len)
 {
     assert(qiov->nalloc != -1);
@@ -530,12 +546,20 @@ void qemu_iovec_destroy(QEMUIOVector *qiov)
     memset(qiov, 0, sizeof(*qiov));
 }
 
+void qemu_iovec_destroy_pi(QEMUIOVector *qiov)
+{
+    g_free(qiov->dif.iov_base);
+
+    qemu_iovec_destroy(qiov);
+}
+
 void qemu_iovec_reset(QEMUIOVector *qiov)
 {
     assert(qiov->nalloc != -1);
 
     qiov->niov = 0;
     qiov->size = 0;
+    qiov->dif.iov_len = 0;
 }
 
 size_t qemu_iovec_to_buf(QEMUIOVector *qiov, size_t offset,
-- 
2.38.1


