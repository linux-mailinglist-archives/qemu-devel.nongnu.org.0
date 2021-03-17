Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5233F68E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:21:10 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZr3-00072n-Qz
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ9Y-0003CD-00
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:36:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:50744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ9O-0005im-GT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=KQSnYrifT5MGz3UBYuDBKnvuFBfN3TpZOQ1Wwyz4PIM=; b=Z0YzBg2acvde
 YY1moErPWy9f6pXPswRxKfDqWZt07vSgIeXKv/HNG8PQ1t+veMBESQcJ2v5KEaTKppKb0iaMeLf3f
 AcCcSvb6n6OSZ8kgDeE5w7msJAa1+JbKx+WUAMamIPtXZeDIIJDU3Z3ZBoS4h+ajh2H4ezzMNMERE
 OiX3s=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8l-0034yI-PH; Wed, 17 Mar 2021 19:35:23 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 8/9] migration/snap-tool: Implementation of snapshot
 loading in precopy
Date: Wed, 17 Mar 2021 19:32:21 +0300
Message-Id: <20210317163222.182609-9-andrey.gruzdev@virtuozzo.com>
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

This part implements snapshot loading in precopy mode.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h  |  24 ++
 qemu-snap-handlers.c | 586 ++++++++++++++++++++++++++++++++++++++++++-
 qemu-snap.c          |  44 +++-
 3 files changed, 649 insertions(+), 5 deletions(-)

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
index 570f200c9d..f9f6db529f 100644
--- a/include/qemu-snap.h
+++ b/include/qemu-snap.h
@@ -26,6 +26,11 @@
  */
 #define PAGE_SIZE_MAX           16384
 
+/* Buffer size for RAM chunk loads via AIO buffer_pool */
+#define AIO_BUFFER_SIZE         (1024 * 1024)
+/* Max. concurrent AIO tasks */
+#define AIO_TASKS_MAX           8
+
 typedef struct AioBufferPool AioBufferPool;
 
 typedef struct AioBufferStatus {
@@ -96,6 +101,25 @@ typedef struct SnapSaveState {
 
 typedef struct SnapLoadState {
     BlockBackend *blk;          /* Block backend */
+
+    QEMUFile *f_fd;             /* Outgoing migration stream QEMUFile */
+    QEMUFile *f_vmstate;        /* Block backend vmstate area QEMUFile */
+    /*
+     * Buffer to keep first few KBs of BDRV vmstate that we stashed at the
+     * start. Within this buffer are VM state header, configuration section
+     * and the first 'ram' section with RAM block list.
+     */
+    QIOChannelBuffer *ioc_lbuf;
+
+    /* AIO buffer pool */
+    AioBufferPool *aio_pool;
+
+    /* BDRV vmstate offset of RAM block list section */
+    int64_t state_ram_list_offset;
+    /* BDRV vmstate offset of the first device section */
+    int64_t state_device_offset;
+    /* BDRV vmstate End-Of-File */
+    int64_t state_eof;
 } SnapLoadState;
 
 SnapSaveState *snap_save_get_state(void);
diff --git a/qemu-snap-handlers.c b/qemu-snap-handlers.c
index 4b63d42a29..7dfe950829 100644
--- a/qemu-snap-handlers.c
+++ b/qemu-snap-handlers.c
@@ -41,12 +41,22 @@ typedef struct RAMBlockDesc {
     int64_t length;             /* RAM block used_length */
     int64_t nr_pages;           /* RAM block page count (length >> page_bits) */
 
+    int64_t last_offset;        /* Last offset sent in precopy */
+
     char idstr[256];            /* RAM block id string */
 
+    unsigned long *bitmap;      /* Loaded pages bitmap */
+
     /* Link into ram_list */
     QSIMPLEQ_ENTRY(RAMBlockDesc) next;
 } RAMBlockDesc;
 
+/* Reference to the RAM page with block/page tuple */
+typedef struct RAMPageRef {
+    RAMBlockDesc *block;        /* RAM block containing page */
+    int64_t page;               /* Page index in RAM block */
+} RAMPageRef;
+
 /* State reflecting RAM part of snapshot */
 typedef struct RAMState {
     int64_t page_size;          /* Page size */
@@ -54,6 +64,15 @@ typedef struct RAMState {
     int page_bits;              /* Page size bits */
 
     int64_t normal_pages;       /* Total number of normal (non-zero) pages */
+    int64_t loaded_pages;       /* Current number of normal pages loaded */
+
+    /* Last RAM block touched by load_send_ram_iterate() */
+    RAMBlockDesc *last_block;
+    /* Last page touched by load_send_ram_iterate() */
+    int64_t last_page;
+
+    /* Last RAM block sent by load_send_ram_iterate() */
+    RAMBlockDesc *last_sent_block;
 
     /* List of RAM blocks */
     QSIMPLEQ_HEAD(, RAMBlockDesc) ram_block_list;
@@ -96,19 +115,22 @@ typedef struct SectionHandlers {
 
 /* Forward declarations */
 static int default_save(QEMUFile *f, void *opaque, int version_id);
+static int default_load(QEMUFile *f, void *opaque, int version_id);
 static int ram_save(QEMUFile *f, void *opaque, int version_id);
+static int ram_load(QEMUFile *f, void *opaque, int version_id);
 static int save_state_complete(SnapSaveState *sn);
+static int coroutine_fn load_send_pages_flush(SnapLoadState *sn);
 
 static RAMState ram_state;
 
 static SectionHandlerOps default_handler_ops = {
     .save_section = default_save,
-    .load_section = NULL,
+    .load_section = default_load,
 };
 
 static SectionHandlerOps ram_handler_ops = {
     .save_section = ram_save,
-    .load_section = NULL,
+    .load_section = ram_load,
 };
 
 static SectionHandlers section_handlers = {
@@ -212,6 +234,18 @@ static RAMBlockDesc *ram_block_by_idstr(const char *idstr)
     return NULL;
 }
 
+static RAMBlockDesc *ram_block_by_bdrv_offset(int64_t bdrv_offset)
+{
+    RAMBlockDesc *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_state.ram_block_list, next) {
+        if (ram_bdrv_offset_in_block(block, bdrv_offset)) {
+            return block;
+        }
+    }
+    return NULL;
+}
+
 static RAMBlockDesc *ram_block_from_stream(QEMUFile *f, int flags)
 {
     static RAMBlockDesc *block;
@@ -289,6 +323,36 @@ static void ram_block_list_from_stream(QEMUFile *f, int64_t mem_size)
     }
 }
 
+static void ram_block_list_init_bitmaps(void)
+{
+    RAMBlockDesc *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_state.ram_block_list, next) {
+        block->nr_pages = block->length >> ram_state.page_bits;
+
+        block->bitmap = bitmap_new(block->nr_pages);
+        bitmap_set(block->bitmap, 0, block->nr_pages);
+    }
+}
+
+static inline
+int64_t ram_block_bitmap_find_next(RAMBlockDesc *block, int64_t start)
+{
+    return find_next_bit(block->bitmap, block->nr_pages, start);
+}
+
+static inline
+int64_t ram_block_bitmap_find_next_clear(RAMBlockDesc *block, int64_t start)
+{
+    return find_next_zero_bit(block->bitmap, block->nr_pages, start);
+}
+
+static inline
+void ram_block_bitmap_clear(RAMBlockDesc *block, int64_t start, int64_t count)
+{
+    bitmap_clear(block->bitmap, start, count);
+}
+
 static void save_check_file_errors(SnapSaveState *sn, int *res)
 {
     /* Check for -EIO that indicates plane EOF */
@@ -723,11 +787,517 @@ int coroutine_fn snap_save_state_main(SnapSaveState *sn)
     return sn->status;
 }
 
+static void load_check_file_errors(SnapLoadState *sn, int *res)
+{
+    /* Check file errors even on success */
+    if (*res >= 0 || *res == -EINVAL) {
+        int f_res;
+
+        f_res = qemu_file_get_error(sn->f_fd);
+        if (!f_res) {
+            f_res = qemu_file_get_error(sn->f_vmstate);
+        }
+        *res = f_res ? f_res : *res;
+    }
+}
+
+static int ram_load(QEMUFile *f, void *opaque, int version_id)
+{
+    int compat_flags = (RAM_SAVE_FLAG_MEM_SIZE | RAM_SAVE_FLAG_EOS);
+    int64_t page_mask = ram_state.page_mask;
+    int flags = 0;
+    int res = 0;
+
+    if (version_id != 4) {
+        error_report("Unsupported version %d for 'ram' handler v4", version_id);
+        return -EINVAL;
+    }
+
+    while (!res && !(flags & RAM_SAVE_FLAG_EOS)) {
+        int64_t addr;
+
+        addr = qemu_get_be64(f);
+        flags = addr & ~page_mask;
+        addr &= page_mask;
+
+        if (flags & ~compat_flags) {
+            error_report("RAM page with incompatible flags: offset=0x%" PRIx64
+                         " flags=0x%x", qemu_ftell2(f), flags);
+            res = -EINVAL;
+            break;
+        }
+
+        switch (flags) {
+        case RAM_SAVE_FLAG_MEM_SIZE:
+            /* Fill RAM block list */
+            ram_block_list_from_stream(f, addr);
+            break;
+
+        case RAM_SAVE_FLAG_EOS:
+            /* Normal exit */
+            break;
+
+        default:
+            error_report("RAM page with unknown combination of flags:"
+                         " offset=0x%" PRIx64 " page_addr=0x%" PRIx64
+                         " flags=0x%x", qemu_ftell2(f), addr, flags);
+            res = -EINVAL;
+        }
+
+        /* Check for file errors even if all looks good */
+        if (!res) {
+            res = qemu_file_get_error(f);
+        }
+    }
+    return res;
+}
+
+static int default_load(QEMUFile *f, void *opaque, int version_id)
+{
+    error_report("Section with unknown ID: offset=0x%" PRIx64,
+            qemu_ftell2(f));
+    return -EINVAL;
+}
+
+static void send_page_header(QEMUFile *f, RAMBlockDesc *block, int64_t offset)
+{
+    uint8_t hdr_buf[512];
+    int hdr_len = 8;
+
+    stq_be_p(hdr_buf, offset);
+    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
+        int id_len;
+
+        id_len = strlen(block->idstr);
+        assert(id_len < 256);
+
+        hdr_buf[hdr_len] = id_len;
+        memcpy((hdr_buf + hdr_len + 1), block->idstr, id_len);
+
+        hdr_len += 1 + id_len;
+    }
+
+    qemu_put_buffer(f, hdr_buf, hdr_len);
+}
+
+static void send_zeropage(QEMUFile *f, RAMBlockDesc *block, int64_t offset)
+{
+    send_page_header(f, block, offset | RAM_SAVE_FLAG_ZERO);
+    qemu_put_byte(f, 0);
+}
+
+static int send_pages_from_buffer(QEMUFile *f, AioBuffer *buffer)
+{
+    RAMState *rs = &ram_state;
+    int page_size = rs->page_size;
+    RAMBlockDesc *block = rs->last_sent_block;
+    int64_t bdrv_offset = buffer->status.offset;
+    int64_t flags = RAM_SAVE_FLAG_CONTINUE;
+    int pages = 0;
+
+    /* Need to switch to the another RAM block? */
+    if (!ram_bdrv_offset_in_block(block, bdrv_offset)) {
+        /*
+         * Lookup RAM block by BDRV offset cause in postcopy we
+         * can issue AIO buffer loads from non-contiguous blocks.
+         */
+        block = ram_block_by_bdrv_offset(bdrv_offset);
+        rs->last_sent_block = block;
+        /* Reset RAM_SAVE_FLAG_CONTINUE */
+        flags = 0;
+    }
+
+    for (int offset = 0; offset < buffer->status.count;
+            offset += page_size, bdrv_offset += page_size) {
+        void *page_buf = buffer->data + offset;
+        int64_t addr;
+
+        addr = ram_block_offset_from_bdrv(block, bdrv_offset);
+
+        if (buffer_is_zero(page_buf, page_size)) {
+            send_zeropage(f, block, (addr | flags));
+        } else {
+            send_page_header(f, block,
+                    (addr | RAM_SAVE_FLAG_PAGE | flags));
+            qemu_put_buffer_async(f, page_buf, page_size, false);
+
+            /* Update non-zero page count */
+            rs->loaded_pages++;
+        }
+        /*
+         * AioBuffer is always within a single RAM block so we need
+         * to set RAM_SAVE_FLAG_CONTINUE here unconditionally.
+         */
+        flags = RAM_SAVE_FLAG_CONTINUE;
+        pages++;
+    }
+
+    /* Need to flush cause we use qemu_put_buffer_async() */
+    qemu_fflush(f);
+    return pages;
+}
+
+static bool find_next_unsent_page(RAMPageRef *p_ref)
+{
+    RAMState *rs = &ram_state;
+    RAMBlockDesc *block = rs->last_block;
+    int64_t page = rs->last_page;
+    bool found = false;
+    bool full_round = false;
+
+    if (!block) {
+restart:
+        block = QSIMPLEQ_FIRST(&rs->ram_block_list);
+        page = 0;
+        full_round = true;
+    }
+
+    while (!found && block) {
+        page = ram_block_bitmap_find_next(block, page);
+        if (page >= block->nr_pages) {
+            block = QSIMPLEQ_NEXT(block, next);
+            page = 0;
+            continue;
+        }
+        found = true;
+    }
+
+    if (!found && !full_round) {
+        goto restart;
+    }
+
+    if (found) {
+        p_ref->block = block;
+        p_ref->page = page;
+    }
+    return found;
+}
+
+static inline
+void get_unsent_page_range(RAMPageRef *p_ref, RAMBlockDesc **block,
+        int64_t *offset, int64_t *limit)
+{
+    int64_t page_limit;
+
+    *block = p_ref->block;
+    *offset = p_ref->page << ram_state.page_bits;
+    page_limit = ram_block_bitmap_find_next_clear(p_ref->block, (p_ref->page + 1));
+    *limit = page_limit << ram_state.page_bits;
+}
+
+static AioBufferStatus coroutine_fn load_buffers_task_co(AioBufferTask *task)
+{
+    SnapLoadState *sn = snap_load_get_state();
+    AioBufferStatus ret;
+    int count;
+
+    count = blk_pread(sn->blk, task->offset, task->buffer->data, task->size);
+
+    ret.offset = task->offset;
+    ret.count = count;
+
+    return ret;
+}
+
+static void coroutine_fn load_buffers_fill_queue(SnapLoadState *sn)
+{
+    RAMState *rs = &ram_state;
+    RAMPageRef p_ref;
+    RAMBlockDesc *block;
+    int64_t offset;
+    int64_t limit;
+    int64_t pages;
+
+    if (!find_next_unsent_page(&p_ref)) {
+        return;
+    }
+
+    get_unsent_page_range(&p_ref, &block, &offset, &limit);
+
+    do {
+        AioBuffer *buffer;
+        int64_t bdrv_offset;
+        int size;
+
+        /* Try to acquire next buffer from the pool */
+        buffer = aio_pool_try_acquire_next(sn->aio_pool);
+        if (!buffer) {
+            break;
+        }
+
+        bdrv_offset = ram_bdrv_from_block_offset(block, offset);
+        assert(bdrv_offset != INVALID_OFFSET);
+
+        /* Get maximum transfer size for current RAM block and offset */
+        size = MIN((limit - offset), buffer->size);
+        aio_buffer_start_task(buffer, load_buffers_task_co, bdrv_offset, size);
+
+        offset += size;
+    } while (offset < limit);
+
+    rs->last_block = block;
+    rs->last_page = offset >> rs->page_bits;
+
+    block->last_offset = offset;
+
+    pages = rs->last_page - p_ref.page;
+    ram_block_bitmap_clear(block, p_ref.page, pages);
+}
+
+static int coroutine_fn load_send_pages(SnapLoadState *sn)
+{
+    AioBuffer *compl_buffer;
+    int pages = 0;
+
+    load_buffers_fill_queue(sn);
+
+    compl_buffer = aio_pool_wait_compl_next(sn->aio_pool);
+    if (compl_buffer) {
+        /* Check AIO completion status */
+        pages = aio_pool_status(sn->aio_pool);
+        if (pages < 0) {
+            return pages;
+        }
+
+        pages = send_pages_from_buffer(sn->f_fd, compl_buffer);
+        aio_buffer_release(compl_buffer);
+    }
+
+    return pages;
+}
+
+static int coroutine_fn load_send_pages_flush(SnapLoadState *sn)
+{
+    AioBuffer *compl_buffer;
+
+    while ((compl_buffer = aio_pool_wait_compl_next(sn->aio_pool))) {
+        int res = aio_pool_status(sn->aio_pool);
+        /* Check AIO completion status */
+        if (res < 0) {
+            return res;
+        }
+
+        send_pages_from_buffer(sn->f_fd, compl_buffer);
+        aio_buffer_release(compl_buffer);
+    }
+
+    return 0;
+}
+
+static void send_section_header_part_end(QEMUFile *f, SectionHandlersEntry *se,
+        uint8_t section_type)
+{
+    assert(section_type == QEMU_VM_SECTION_PART ||
+           section_type == QEMU_VM_SECTION_END);
+
+    qemu_put_byte(f, section_type);
+    qemu_put_be32(f, se->state_section_id);
+}
+
+static void send_section_footer(QEMUFile *f, SectionHandlersEntry *se)
+{
+    qemu_put_byte(f, QEMU_VM_SECTION_FOOTER);
+    qemu_put_be32(f, se->state_section_id);
+}
+
+#define YIELD_AFTER_MS  500 /* ms */
+
+static int coroutine_fn load_send_ram_iterate(SnapLoadState *sn)
+{
+    SectionHandlersEntry *se;
+    int64_t t_start;
+    int tmp_res;
+    int res = 1;
+
+    /* Send 'ram' section header with QEMU_VM_SECTION_PART type */
+    se = find_se("ram", 0);
+    send_section_header_part_end(sn->f_fd, se, QEMU_VM_SECTION_PART);
+
+    t_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    for (int iter = 0; res > 0; iter++) {
+        res = load_send_pages(sn);
+
+        if (!(iter & 7)) {
+            int64_t t_cur = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+            if ((t_cur - t_start) > YIELD_AFTER_MS) {
+                break;
+            }
+        }
+    }
+
+    /* Zero return code means that there're no more pages to send */
+    if (res >= 0) {
+        res = res ? 0 : 1;
+    }
+
+    /* Flush AIO buffers cause some may still remain unsent */
+    tmp_res = load_send_pages_flush(sn);
+    res = tmp_res ? tmp_res : res;
+
+    /* Send EOS flag before section footer */
+    qemu_put_be64(sn->f_fd, RAM_SAVE_FLAG_EOS);
+    send_section_footer(sn->f_fd, se);
+
+    qemu_fflush(sn->f_fd);
+    return res;
+}
+
+static int load_send_leader(SnapLoadState *sn)
+{
+    qemu_put_buffer(sn->f_fd, (sn->ioc_lbuf->data + VMSTATE_HEADER_SIZE),
+            sn->state_device_offset);
+    return qemu_file_get_error(sn->f_fd);
+}
+
+static int load_send_complete(SnapLoadState *sn)
+{
+    /* Transfer device state to the output pipe */
+    file_transfer_bytes(sn->f_fd, sn->f_vmstate,
+            (sn->state_eof - sn->state_device_offset));
+    qemu_fflush(sn->f_fd);
+    return 1;
+}
+
+static int load_section_start_full(SnapLoadState *sn)
+{
+    QEMUFile *f = sn->f_vmstate;
+    int section_id;
+    int instance_id;
+    int version_id;
+    char idstr[256];
+    SectionHandlersEntry *se;
+    int res;
+
+    /* Read section start */
+    section_id = qemu_get_be32(f);
+    if (!qemu_get_counted_string(f, idstr)) {
+        return qemu_file_get_error(f);
+    }
+    instance_id = qemu_get_be32(f);
+    version_id = qemu_get_be32(f);
+
+    se = find_se(idstr, instance_id);
+    if (!se) {
+        se = &section_handlers.default_entry;
+    } else if (version_id > se->version_id) {
+        /* Validate version */
+        error_report("Unsupported version %d for '%s' v%d",
+                version_id, idstr, se->version_id);
+        return -EINVAL;
+    }
+
+    se->state_section_id = section_id;
+    se->state_version_id = version_id;
+
+    res = se->ops->load_section(f, sn, se->state_version_id);
+    if (res) {
+        return res;
+    }
+
+    /* Finally check section footer */
+    if (!check_section_footer(f, se)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+static int load_setup_ramlist(SnapLoadState *sn)
+{
+    QEMUFile *f = sn->f_vmstate;
+    uint8_t section_type;
+    int64_t section_pos;
+    int res;
+
+    section_pos = qemu_ftell2(f);
+
+    /* Read section type token */
+    section_type = qemu_get_byte(f);
+    if (section_type == QEMU_VM_EOF) {
+        error_report("Unexpected EOF token: offset=0x%" PRIx64, section_pos);
+        return -EINVAL;
+    } else if (section_type != QEMU_VM_SECTION_FULL &&
+               section_type != QEMU_VM_SECTION_START) {
+        error_report("Unexpected section type %d: offset=0x%" PRIx64,
+                section_type, section_pos);
+        return -EINVAL;
+    }
+
+    res = load_section_start_full(sn);
+    if (!res) {
+        ram_block_list_init_bitmaps();
+    }
+    return res;
+}
+
+static int load_state_header(SnapLoadState *sn)
+{
+    QEMUFile *f = sn->f_vmstate;
+    uint32_t v;
+
+    /* Validate specific MAGIC in vmstate area */
+    v = qemu_get_be32(f);
+    if (v != VMSTATE_MAGIC) {
+        error_report("Not a valid VMSTATE");
+        return -EINVAL;
+    }
+    v = qemu_get_be32(f);
+    if (v != ram_state.page_size) {
+        error_report("VMSTATE page size not matching target");
+        return -EINVAL;
+    }
+
+    /* Number of non-zero pages in all RAM blocks */
+    ram_state.normal_pages = qemu_get_be64(f);
+
+    /* VMSTATE area offsets, counted from QEMU_FILE_MAGIC */
+    sn->state_ram_list_offset = qemu_get_be32(f);
+    sn->state_device_offset = qemu_get_be32(f);
+    sn->state_eof = qemu_get_be32(f);
+
+    /* Check that offsets are within the limits */
+    if ((VMSTATE_HEADER_SIZE + sn->state_device_offset) > INPLACE_READ_MAX ||
+        sn->state_device_offset <= sn->state_ram_list_offset) {
+        error_report("Corrupted VMSTATE header");
+        return -EINVAL;
+    }
+
+    /* Skip up to RAM block list section */
+    qemu_file_skip(f, sn->state_ram_list_offset);
+    return 0;
+}
+
 /* Load snapshot data and send it with outgoing migration stream */
 int coroutine_fn snap_load_state_main(SnapLoadState *sn)
 {
-    /* TODO: implement */
-    return 0;
+    int res;
+
+    res = load_state_header(sn);
+    if (res) {
+        goto fail;
+    }
+    res = load_setup_ramlist(sn);
+    if (res) {
+        goto fail;
+    }
+    res = load_send_leader(sn);
+    if (res) {
+        goto fail;
+    }
+
+    do {
+        res = load_send_ram_iterate(sn);
+        /* Make additional check for file errors */
+        load_check_file_errors(sn, &res);
+    } while (!res);
+
+    if (res == 1) {
+        res = load_send_complete(sn);
+    }
+
+fail:
+    load_check_file_errors(sn, &res);
+    /* Replace positive exit code with 0 */
+    return res < 0 ? res : 0;
 }
 
 /* Initialize snapshot RAM state */
@@ -748,4 +1318,12 @@ void snap_ram_init_state(int page_bits)
 /* Destroy snapshot RAM state */
 void snap_ram_destroy_state(void)
 {
+    RAMBlockDesc *block;
+    RAMBlockDesc *next_block;
+
+    /* Free RAM blocks */
+    QSIMPLEQ_FOREACH_SAFE(block, &ram_state.ram_block_list, next, next_block) {
+        g_free(block->bitmap);
+        g_free(block);
+    }
 }
diff --git a/qemu-snap.c b/qemu-snap.c
index a337a7667b..c5efbd6803 100644
--- a/qemu-snap.c
+++ b/qemu-snap.c
@@ -139,7 +139,20 @@ static void snap_load_init_state(void)
 
 static void snap_load_destroy_state(void)
 {
-    /* TODO: implement */
+    SnapLoadState *sn = snap_load_get_state();
+
+    if (sn->aio_pool) {
+        aio_pool_free(sn->aio_pool);
+    }
+    if (sn->ioc_lbuf) {
+        object_unref(OBJECT(sn->ioc_lbuf));
+    }
+    if (sn->f_vmstate) {
+        qemu_fclose(sn->f_vmstate);
+    }
+    if (sn->blk) {
+        blk_unref(sn->blk);
+    }
 }
 
 static BlockBackend *snap_create(const char *filename, int64_t image_size,
@@ -221,6 +234,12 @@ static void coroutine_fn do_snap_load_co(void *opaque)
     SnapTaskState *task_state = opaque;
     SnapLoadState *sn = snap_load_get_state();
 
+    /* Switch to non-blocking mode in coroutine context */
+    qemu_file_set_blocking(sn->f_vmstate, false);
+    qemu_file_set_blocking(sn->f_fd, false);
+    /* Initialize AIO buffer pool in coroutine context */
+    sn->aio_pool = aio_pool_new(DEFAULT_PAGE_SIZE, AIO_BUFFER_SIZE,
+            AIO_TASKS_MAX);
     /* Enter main routine */
     task_state->ret = snap_load_state_main(sn);
 }
@@ -310,15 +329,37 @@ fail:
 static int snap_load(SnapLoadParams *params)
 {
     SnapLoadState *sn;
+    QIOChannel *ioc_fd;
+    uint8_t *buf;
+    size_t count;
     int res = -1;
 
+    snap_ram_init_state(ctz64(params->page_size));
     snap_load_init_state();
     sn = snap_load_get_state();
 
+    ioc_fd = qio_channel_new_fd(params->fd, NULL);
+    qio_channel_set_name(QIO_CHANNEL(ioc_fd), "snap-channel-outgoing");
+    sn->f_fd = qemu_fopen_channel_output(ioc_fd);
+    object_unref(OBJECT(ioc_fd));
+
     sn->blk = snap_open(params->filename, params->bdrv_flags);
     if (!sn->blk) {
         goto fail;
     }
+    /* Open QEMUFile for BDRV vmstate area */
+    sn->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(sn->blk), 0);
+
+    /* Create buffer channel to store leading part of VMSTATE stream */
+    sn->ioc_lbuf = qio_channel_buffer_new(INPLACE_READ_MAX);
+    qio_channel_set_name(QIO_CHANNEL(sn->ioc_lbuf), "snap-leader-buffer");
+
+    count = qemu_peek_buffer(sn->f_vmstate, &buf, INPLACE_READ_MAX, 0);
+    res = qemu_file_get_error(sn->f_vmstate);
+    if (res < 0) {
+        goto fail;
+    }
+    qio_channel_write(QIO_CHANNEL(sn->ioc_lbuf), (char *) buf, count, NULL);
 
     res = run_snap_task(do_snap_load_co);
     if (res) {
@@ -327,6 +368,7 @@ static int snap_load(SnapLoadParams *params)
 
 fail:
     snap_load_destroy_state();
+    snap_ram_destroy_state();
 
     return res;
 }
-- 
2.25.1


