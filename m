Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839337D41E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 22:12:34 +0200 (CEST)
Received: from localhost ([::1]:42036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgvDd-00082P-9g
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 16:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguV6-0002Bt-KS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:44748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUz-0000on-FE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=QgSWCJj7oHtYM0DHbaJrmWqklUsFtiljdOEgNPygUYk=; b=ZjMc837mMhEr
 /lZi7yIzmjKBax49IgLsPUUkklHiH/IKYJiHhuT3yTF7n/mQqmzVjUL1h8PHY+jR76krTl+mSG/We
 48/5uXgxX8FHlcZssvlhH0eBqv6Vhpb9x0Thaa5WWqezit4KPI24HUSPi2yBSpoywHZt2WI8vgP7x
 ITnY4=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lguUu-002BHm-Fd; Wed, 12 May 2021 22:26:20 +0300
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
Subject: [RFC PATCH v1 6/7] migration/snapshot: Implementation of
 qemu-snapshot load path
Date: Wed, 12 May 2021 22:26:18 +0300
Message-Id: <20210512192619.537268-7-andrey.gruzdev@virtuozzo.com>
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

This part implements snapshot loading in precopy mode.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snapshot.h |  24 +-
 qemu-snapshot-vm.c      | 588 +++++++++++++++++++++++++++++++++++++++-
 qemu-snapshot.c         |  47 +++-
 3 files changed, 654 insertions(+), 5 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index 52519f76c4..aae730d70e 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -34,6 +34,13 @@
 /* RAM slice size for snapshot revert */
 #define SLICE_SIZE_REVERT           (16 * PAGE_SIZE_MAX)
 
+/* AIO transfer size */
+#define AIO_TRANSFER_SIZE           BDRV_CLUSTER_SIZE
+/* AIO ring size */
+#define AIO_RING_SIZE               64
+/* AIO ring in-flight limit */
+#define AIO_RING_INFLIGHT           16
+
 typedef struct AioRing AioRing;
 
 typedef struct AioRingRequest {
@@ -88,7 +95,20 @@ typedef struct StateSaveCtx {
 } StateSaveCtx;
 
 typedef struct StateLoadCtx {
-    BlockBackend *blk;          /* Block backend */
+    BlockBackend *blk;              /* Block backend */
+    QEMUFile *f_fd;                 /* QEMUFile for outgoing stream */
+    QEMUFile *f_vmstate;            /* QEMUFile for vmstate backing */
+
+    QIOChannelBuffer *ioc_leader;   /* vmstate stream leader */
+
+    AioRing *aio_ring;              /* AIO ring */
+
+    /* vmstate offset of the section containing list of RAM blocks */
+    int64_t ram_list_offset;
+    /* vmstate offset of the first non-iterable device section */
+    int64_t device_offset;
+    /* vmstate EOF */
+    int64_t eof_offset;
 } StateLoadCtx;
 
 extern int64_t page_size;       /* Page size */
@@ -100,6 +120,8 @@ extern int slice_bits;          /* RAM slice size bits */
 
 void ram_init_state(void);
 void ram_destroy_state(void);
+ssize_t coroutine_fn ram_load_aio_co(AioRingRequest *req);
+
 StateSaveCtx *get_save_context(void);
 StateLoadCtx *get_load_context(void);
 int coroutine_fn save_state_main(StateSaveCtx *s);
diff --git a/qemu-snapshot-vm.c b/qemu-snapshot-vm.c
index 2d8f2d3d79..dae5f84b80 100644
--- a/qemu-snapshot-vm.c
+++ b/qemu-snapshot-vm.c
@@ -57,6 +57,11 @@ typedef struct RAMPage {
 /* RAM transfer context */
 typedef struct RAMCtx {
     int64_t normal_pages;       /* Total number of normal pages */
+    int64_t loaded_pages;       /* Number of normal pages loaded */
+
+    RAMPage last_page;          /* Last loaded page */
+
+    RAMBlock *last_sent_block;  /* RAM block of last sent page */
 
     /* RAM block list head */
     QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
@@ -100,17 +105,26 @@ typedef struct SectionHandlers {
 
 /* Forward declarations */
 static int default_save(QEMUFile *f, void *opaque, int version_id);
+static int default_load(QEMUFile *f, void *opaque, int version_id);
+
 static int ram_save(QEMUFile *f, void *opaque, int version_id);
+static int ram_load(QEMUFile *f, void *opaque, int version_id);
+static int ram_load_iterate(QEMUFile *f, void *opaque, int version_id);
+
 static int save_state_complete(StateSaveCtx *s);
+static int load_section_start_full(StateLoadCtx *s);
 
 static RAMCtx ram_ctx;
 
 static SectionHandlerOps default_handler_ops = {
     .save_state = default_save,
+    .load_state = default_load,
 };
 
 static SectionHandlerOps ram_handler_ops = {
     .save_state = ram_save,
+    .load_state = ram_load,
+    .load_state_iterate = ram_load_iterate,
 };
 
 static SectionHandlers section_handlers = {
@@ -218,6 +232,19 @@ static RAMBlock *ram_block_by_idstr(const char *idstr)
     return NULL;
 }
 
+static RAMBlock *ram_block_by_bdrv_offset(int64_t bdrv_offset)
+{
+    RAMBlock *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        if (ram_bdrv_offset_in_block(block, bdrv_offset)) {
+            return block;
+        }
+    }
+
+    return NULL;
+}
+
 static RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
 {
     static RAMBlock *block;
@@ -803,10 +830,555 @@ int coroutine_fn save_state_main(StateSaveCtx *s)
     return MIN(res, 0);
 }
 
+static void load_state_check_errors(StateLoadCtx *s, int *res)
+{
+    /*
+     * Check for file errors on success. Replace generic -EINVAL
+     * retcode with file error if possible.
+     */
+    if (*res >= 0 || *res == -EINVAL) {
+        int f_res = qemu_file_get_error(s->f_fd);
+
+        if (!f_res) {
+            f_res = qemu_file_get_error(s->f_vmstate);
+        }
+        if (f_res) {
+            *res = f_res;
+        }
+    }
+}
+
+static void send_section_header_part_end(QEMUFile *f, SectionHandlersEntry *se,
+        uint8_t section_type)
+{
+    assert(section_type == QEMU_VM_SECTION_PART ||
+           section_type == QEMU_VM_SECTION_END);
+
+    qemu_put_byte(f, section_type);
+    qemu_put_be32(f, se->real_section_id);
+}
+
+static void send_section_footer(QEMUFile *f, SectionHandlersEntry *se)
+{
+    qemu_put_byte(f, QEMU_VM_SECTION_FOOTER);
+    qemu_put_be32(f, se->real_section_id);
+}
+
+static void send_page_header(QEMUFile *f, RAMBlock *block, int64_t offset)
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
+static void send_zeropage(QEMUFile *f, RAMBlock *block, int64_t offset)
+{
+    send_page_header(f, block, offset | RAM_SAVE_FLAG_ZERO);
+    qemu_put_byte(f, 0);
+}
+
+static bool find_next_page(RAMPage *page)
+{
+    RAMCtx *ram = &ram_ctx;
+    RAMBlock *block = ram->last_page.block;
+    int64_t slice = ram->last_page.offset >> slice_bits;
+    bool full_round = false;
+    bool found = false;
+
+    if (!block) {
+restart:
+        block = QSIMPLEQ_FIRST(&ram->ram_block_list);
+        slice = 0;
+        full_round = true;
+    }
+
+    while (!found && block) {
+        slice = find_next_bit(block->bitmap, block->nr_slices, slice);
+        /* Can't find unsent slice in block? */
+        if (slice >= block->nr_slices) {
+            /* Try next block */
+            block = QSIMPLEQ_NEXT(block, next);
+            slice = 0;
+
+            continue;
+        }
+
+        found = true;
+    }
+
+    /*
+     * Re-start from the beginning if couldn't find unsent slice,
+     * but do it only once.
+     */
+    if (!found && !full_round) {
+        goto restart;
+    }
+
+    if (found) {
+        page->block = block;
+        page->offset = slice << slice_bits;
+    }
+
+    return found;
+}
+
+static inline
+void get_page_range(RAMPage *page, unsigned *length, unsigned max_length)
+{
+    int64_t start_slice;
+    int64_t end_slice;
+    int64_t tmp;
+
+    assert(QEMU_IS_ALIGNED(page->offset, slice_size));
+    assert(max_length >= slice_size);
+
+    start_slice = page->offset >> slice_bits;
+    end_slice = find_next_zero_bit(page->block->bitmap, page->block->nr_slices,
+                                   page->offset >> slice_bits);
+
+    tmp = (end_slice - start_slice) << slice_bits;
+    tmp = MIN(page->block->length - page->offset, tmp);
+
+    /*
+     * Length is always aligned to slice_size with the exception of case
+     * when it is the last slice in RAM block.
+     */
+    *length = MIN(max_length, tmp);
+}
+
+static inline
+void clear_page_range(RAMPage *page, unsigned length)
+{
+    assert(QEMU_IS_ALIGNED(page->offset, slice_size));
+    assert(length);
+
+    /*
+     * Page offsets are aligned to the slice boundary so we only need
+     * to round up length for the case when we load last slice in the block.
+     */
+    bitmap_clear(page->block->bitmap, page->offset >> slice_bits,
+                 ((length - 1) >> slice_bits) + 1);
+}
+
+ssize_t coroutine_fn ram_load_aio_co(AioRingRequest *req)
+{
+    return blk_pread((BlockBackend *) req->opaque, req->offset,
+            req->data, req->size);
+}
+
+static void coroutine_fn ram_load_submit_aio(StateLoadCtx *s)
+{
+    RAMCtx *ram = &ram_ctx;
+    AioRingRequest *req;
+
+    while ((req = aio_ring_get_request(s->aio_ring))) {
+        RAMPage page;
+        unsigned max_length = AIO_TRANSFER_SIZE;
+        unsigned length;
+
+        if (!find_next_page(&page)) {
+            break;
+        }
+        
+        /* Get range of contiguous pages that were not transferred yet */
+        get_page_range(&page, &length, max_length);
+        /* Clear range of pages to be queued for I/O */
+        clear_page_range(&page, length);
+
+        /* Used by find_next_page() */
+        ram->last_page.block = page.block;
+        ram->last_page.offset = page.offset + length;
+
+        /* Setup I/O request */
+        req->opaque = s->blk;
+        req->data = qemu_blockalign(blk_bs(s->blk), length);
+        req->offset = ram_bdrv_from_block_offset(page.block, page.offset);
+        req->size = length;
+
+        aio_ring_submit(s->aio_ring);
+    }
+}
+
+static int ram_load_complete_aio(StateLoadCtx *s, AioRingEvent *ev)
+{
+    QEMUFile *f = s->f_fd;
+    RAMCtx *ram = &ram_ctx;
+    RAMBlock *block = ram->last_sent_block;
+    void *bdrv_data = ev->origin->data;
+    int64_t bdrv_offset = ev->origin->offset;
+    ssize_t bdrv_count = ev->status;
+    int64_t offset;
+    int64_t flags = RAM_SAVE_FLAG_CONTINUE;
+    int pages = 0;
+
+    /* Need to switch to the another RAM block? */
+    if (!ram_bdrv_offset_in_block(block, bdrv_offset)) {
+        /*
+         * Lookup RAM block by BDRV offset cause in postcopy we
+         * can issue AIO loads from arbitrary blocks.
+         */
+        block = ram_block_by_bdrv_offset(bdrv_offset);
+        ram->last_sent_block = block;
+
+        /* Reset RAM_SAVE_FLAG_CONTINUE */
+        flags = 0;
+    }
+    offset = ram_block_offset_from_bdrv(block, bdrv_offset);
+
+    for (ssize_t count = 0; count < bdrv_count; count += page_size) {
+        if (buffer_is_zero(bdrv_data, page_size)) {
+            send_zeropage(f, block, (offset | flags));
+        } else {
+            send_page_header(f, block, (offset | RAM_SAVE_FLAG_PAGE | flags));
+            qemu_put_buffer_async(f, bdrv_data, page_size, false);
+
+            /* Update normal page count */
+            ram->loaded_pages++;
+        }
+
+        /*
+         * BDRV request shall never cross RAM block boundary so we can
+         * set RAM_SAVE_FLAG_CONTINUE here unconditionally.
+         */
+        flags = RAM_SAVE_FLAG_CONTINUE;
+
+        bdrv_data += page_size;
+        offset += page_size;
+        pages++;
+    }
+
+    /* Need to flush here cause we use qemu_put_buffer_async() */
+    qemu_fflush(f);
+
+    return pages;
+}
+
+static int coroutine_fn ram_load_pages(StateLoadCtx *s)
+{
+    AioRingEvent *event;
+    int res = 0;
+
+    /* Fill blockdev AIO queue */
+    ram_load_submit_aio(s);
+
+    /* Check for AIO completion event */
+    event = aio_ring_wait_event(s->aio_ring);
+    if (event) {
+        /* Check completion status */
+        res = event->status;
+        if (res > 0) {
+            res = ram_load_complete_aio(s, event);
+        }
+
+        qemu_vfree(event->origin->data);
+        aio_ring_complete(s->aio_ring);
+    }
+
+    return res;
+}
+
+static int coroutine_fn ram_load_pages_flush(StateLoadCtx *s)
+{
+    AioRingEvent *event;
+
+    while ((event = aio_ring_wait_event(s->aio_ring))) {
+        /* Check completion status */
+        if (event->status > 0) {
+            ram_load_complete_aio(s, event);
+        }
+
+        qemu_vfree(event->origin->data);
+        aio_ring_complete(s->aio_ring);
+    }
+
+    return 0;
+}
+
+static int ram_load(QEMUFile *f, void *opaque, int version_id)
+{
+    int compat_flags = RAM_SAVE_FLAG_MEM_SIZE | RAM_SAVE_FLAG_EOS;
+    int flags = 0;
+    int res = 0;
+
+    if (version_id != 4) {
+        error_report("Unsupported version %d for 'ram' handler v4", version_id);
+        return -EINVAL;
+    }
+
+    while (!res && !(flags & RAM_SAVE_FLAG_EOS)) {
+        int64_t offset;
+
+        offset = qemu_get_be64(f);
+        flags = offset & ~page_mask;
+        offset &= page_mask;
+
+        if (flags & ~compat_flags) {
+            error_report("Incompatible RAM page flags 0x%x", flags);
+            res = -EINVAL;
+            break;
+        }
+
+        switch (flags) {
+            case RAM_SAVE_FLAG_MEM_SIZE:
+                /* Fill RAM block list */
+                ram_block_list_from_stream(f, offset);
+                break;
+
+            case RAM_SAVE_FLAG_EOS:
+                /* Normal exit */
+                break;
+
+            default:
+                error_report("Unknown combination of RAM page flags 0x%x", flags);
+                res = -EINVAL;
+        }
+
+        /* Check for file errors even if everything looks good */
+        if (!res) {
+            res = qemu_file_get_error(f);
+        }
+    }
+
+    return res;
+}
+
+#define YIELD_AFTER_MS  500 /* ms */
+
+static int ram_load_iterate(QEMUFile *f, void *opaque, int version_id)
+{
+    StateLoadCtx *s = (StateLoadCtx *) opaque;
+    int64_t t_start;
+    int tmp_res;
+    int res = 1;
+
+    t_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+    for (int iter = 0; res > 0; iter++) {
+        res = ram_load_pages(s);
+
+        if (!(iter & 7)) {
+            int64_t t_cur = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+
+            if ((t_cur - t_start) > YIELD_AFTER_MS) {
+                break;
+            }
+        }
+    }
+
+    /* Zero retcode means that there're no more pages to load */
+    if (res >= 0) {
+        res = res ? 0 : 1;
+    }
+
+    /* Process pending AIO ring events */
+    tmp_res = ram_load_pages_flush(s);
+    res = tmp_res ? tmp_res : res;
+
+    /* Send EOS flag before section footer */
+    qemu_put_be64(s->f_fd, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(s->f_fd);
+
+    return res;
+}
+
+static int ram_load_memory(StateLoadCtx *s)
+{
+    SectionHandlersEntry *se;
+    int res;
+
+    se = find_se("ram", 0);
+    assert(se && se->ops->load_state_iterate);
+
+    /* Send section header with QEMU_VM_SECTION_PART type */
+    send_section_header_part_end(s->f_fd, se, QEMU_VM_SECTION_PART);
+    res = se->ops->load_state_iterate(s->f_fd, s, se->real_version_id);
+    send_section_footer(s->f_fd, se);
+
+    return res;
+}
+
+static int default_load(QEMUFile *f, void *opaque, int version_id)
+{
+    error_report("Unexpected (non-iterable device state) section");
+    return -EINVAL;
+}
+
+static int load_state_header(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_vmstate;
+    int v;
+
+    /* Validate magic */
+    v = qemu_get_be32(f);
+    if (v != VMSTATE_HEADER_MAGIC) {
+        error_report("Not a valid snapshot");
+        return -EINVAL;
+    }
+
+    v = qemu_get_be32(f);
+    if (v != page_size) {
+        error_report("Incompatible page size: got %d expected %d",
+                     v, (int) page_size);
+        return -EINVAL;
+    }
+
+    /* Number of non-zero pages in all RAM blocks */
+    ram_ctx.normal_pages = qemu_get_be64(f);
+
+    /* vmstate stream offsets, counted from QEMU_VM_FILE_MAGIC */
+    s->ram_list_offset = qemu_get_be32(f);
+    s->device_offset = qemu_get_be32(f);
+    s->eof_offset = qemu_get_be32(f);
+
+    /* Check that offsets are within the limits */
+    if ((VMSTATE_HEADER_SIZE + s->device_offset) > INPLACE_READ_MAX ||
+            s->device_offset <= s->ram_list_offset) {
+        error_report("Corrupted snapshot header");
+        return -EINVAL;
+    }
+
+    /* Skip up to RAM block list section */
+    qemu_file_skip(f, s->ram_list_offset);
+
+    return 0;
+}
+
+static int load_state_ramlist(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_vmstate;
+    uint8_t section_type;
+    int res;
+
+    section_type = qemu_get_byte(f);
+
+    if (section_type == QEMU_VM_EOF) {
+        error_report("Unexpected EOF token");
+        return -EINVAL;
+    } else if (section_type != QEMU_VM_SECTION_FULL &&
+               section_type != QEMU_VM_SECTION_START) {
+        error_report("Unexpected section type %d", section_type);
+        return -EINVAL;
+    }
+
+    res = load_section_start_full(s);
+    if (!res) {
+        ram_block_list_init_bitmaps();
+    }
+
+    return res;
+}
+
+static int load_state_complete(StateLoadCtx *s)
+{
+    /* Forward non-iterable device state */
+    qemu_fsplice(s->f_fd, s->f_vmstate, s->eof_offset - s->device_offset);
+
+    qemu_fflush(s->f_fd);
+
+    return 1;
+}
+
+static int load_section_start_full(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_vmstate;
+    int section_id;
+    int instance_id;
+    int version_id;
+    char idstr[256];
+    SectionHandlersEntry *se;
+    int res;
+
+    section_id = qemu_get_be32(f);
+
+    if (!qemu_get_counted_string(f, idstr)) {
+        error_report("Failed to get section name(%d)", section_id);
+        return -EINVAL;
+    }
+
+    instance_id = qemu_get_be32(f);
+    version_id = qemu_get_be32(f);
+
+    /* Find section handler */
+    se = find_se(idstr, instance_id);
+    if (!se) {
+        se = &section_handlers.default_;
+    } else if (version_id > se->version_id) {
+        /* Validate version */
+        error_report("Unsupported version %d for '%s' v%d",
+                     version_id, idstr, se->version_id);
+        return -EINVAL;
+    }
+
+    se->real_section_id = section_id;
+    se->real_version_id = version_id;
+
+    res = se->ops->load_state(f, s, se->real_version_id);
+    if (res) {
+        return res;
+    }
+
+    if (!check_section_footer(f, se)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int send_state_leader(StateLoadCtx *s)
+{
+    qemu_put_buffer(s->f_fd, s->ioc_leader->data + VMSTATE_HEADER_SIZE,
+                    s->device_offset);
+    return qemu_file_get_error(s->f_fd);
+}
+
 int coroutine_fn load_state_main(StateLoadCtx *s)
 {
-    /* TODO: implement */
-    return 0;
+    int res;
+
+    res = load_state_header(s);
+    if (res) {
+        goto fail;
+    }
+
+    res = load_state_ramlist(s);
+    if (res) {
+        goto fail;
+    }
+
+    res = send_state_leader(s);
+    if (res) {
+        goto fail;
+    }
+
+    do {
+        res = ram_load_memory(s);
+        /* Check for file errors */
+        load_state_check_errors(s, &res);
+    } while (!res);
+
+    if (res == 1) {
+        res = load_state_complete(s);
+    }
+
+fail:
+    load_state_check_errors(s, &res);
+
+    /* Replace positive retcode with 0 */
+    return MIN(res, 0);
 }
 
 /* Initialize snapshot RAM state */
@@ -815,10 +1387,20 @@ void ram_init_state(void)
     RAMCtx *ram = &ram_ctx;
 
     memset(ram, 0, sizeof(ram_ctx));
+
+    /* Initialize RAM block list head */
+    QSIMPLEQ_INIT(&ram->ram_block_list);
 }
 
 /* Destroy snapshot RAM state */
 void ram_destroy_state(void)
 {
-    /* TODO: implement */
+    RAMBlock *block;
+    RAMBlock *next_block;
+
+    /* Free RAM blocks */
+    QSIMPLEQ_FOREACH_SAFE(block, &ram_ctx.ram_block_list, next, next_block) {
+        g_free(block->bitmap);
+        g_free(block);
+    }
 }
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index d434b8f245..92956623f7 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -121,7 +121,20 @@ static void init_load_context(void)
 
 static void destroy_load_context(void)
 {
-    /* TODO: implement */
+    StateLoadCtx *s = get_load_context();
+
+    if (s->f_vmstate) {
+        qemu_fclose(s->f_vmstate);
+    }
+    if (s->blk) {
+        blk_unref(s->blk);
+    }
+    if (s->aio_ring) {
+        aio_ring_free(s->aio_ring);
+    }
+    if (s->ioc_leader) {
+        object_unref(OBJECT(s->ioc_leader));
+    }
 }
 
 static BlockBackend *image_open_opts(const char *optstr, QDict *options, int flags)
@@ -212,6 +225,9 @@ fail:
 static void coroutine_fn snapshot_load_co(void *opaque)
 {
     StateLoadCtx *s = get_load_context();
+    QIOChannel *ioc_fd;
+    uint8_t *buf;
+    size_t count;
     int res = -1;
 
     init_load_context();
@@ -223,6 +239,35 @@ static void coroutine_fn snapshot_load_co(void *opaque)
         goto fail;
     }
 
+    /* QEMUFile on vmstate */
+    s->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(s->blk), 0);
+    qemu_file_set_blocking(s->f_vmstate, false);
+
+    /* QEMUFile on migration fd */
+    ioc_fd = qio_channel_new_fd(params.fd, NULL);
+    qio_channel_set_name(QIO_CHANNEL(ioc_fd), "migration-channel-outgoing");
+    s->f_fd = qemu_fopen_channel_output(ioc_fd);
+    object_unref(OBJECT(ioc_fd));
+    qemu_file_set_blocking(s->f_fd, false);
+
+    /* Buffer channel to store leading part of migration stream */
+    s->ioc_leader = qio_channel_buffer_new(INPLACE_READ_MAX);
+    qio_channel_set_name(QIO_CHANNEL(s->ioc_leader), "migration-leader-buffer");
+
+    /* AIO ring */
+    s->aio_ring = aio_ring_new(ram_load_aio_co, AIO_RING_SIZE, AIO_RING_INFLIGHT);
+
+    /*
+     * Here we stash the leading part of vmstate stream without promoting read
+     * position.
+     */
+    count = qemu_peek_buffer(s->f_vmstate, &buf, INPLACE_READ_MAX, 0);
+    res = qemu_file_get_error(s->f_vmstate);
+    if (res < 0) {
+        goto fail;
+    }
+    qio_channel_write(QIO_CHANNEL(s->ioc_leader), (char *) buf, count, NULL);
+
     res = load_state_main(s);
     if (res) {
         error_report("Failed to load snapshot: %s", strerror(-res));
-- 
2.27.0


