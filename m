Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D748137ECA3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 00:35:39 +0200 (CEST)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgxS6-0004Ir-TK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 18:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxOC-0004va-KH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:36 -0400
Received: from relay.sw.ru ([185.231.240.75]:55502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO8-0003sa-6A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=WtXOkENywKaxOsRfhrrxKboU0y4KYYUdqjANOSgKPQY=; b=Cr3Y7yv/iXkJ
 P3l/e7Ae59V79epKiw/l3dbiMdyOpskJz4SYn/M0V2CVwU63O2yjp8FDjZtJdc68pHA7F/bXZwThQ
 gb9O4zAxEUFkIonZz1DF5Iys2UyzLAWgDgwlSuEEtgCtzADhb0GWuZ0cvxuGIfKGp53+O4kX8BbkG
 MApTg=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO5-002Bd3-QQ; Thu, 13 May 2021 01:31:29 +0300
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
Subject: [RFC PATCH v2 5/7] migration/snapshot: Implementation of
 qemu-snapshot save path
Date: Thu, 13 May 2021 01:31:25 +0300
Message-Id: <20210512223127.586885-6-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512223127.586885-1-andrey.gruzdev@virtuozzo.com>
References: <20210512223127.586885-1-andrey.gruzdev@virtuozzo.com>
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

Includes code to parse incoming migration stream, dispatch data to
section handlers and deal with complications of open-coded migration
format without introducing strong dependencies on QEMU migration code.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snapshot.h |  34 +-
 qemu-snapshot-vm.c      | 771 +++++++++++++++++++++++++++++++++++++++-
 qemu-snapshot.c         |  56 ++-
 3 files changed, 857 insertions(+), 4 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index 7b3406fd56..52519f76c4 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -51,8 +51,40 @@ typedef struct AioRingEvent {
 
 typedef ssize_t coroutine_fn (*AioRingFunc)(AioRingRequest *req);
 
+typedef struct QIOChannelBuffer QIOChannelBuffer;
+
 typedef struct StateSaveCtx {
-    BlockBackend *blk;          /* Block backend */
+    BlockBackend *blk;              /* Block backend */
+    QEMUFile *f_fd;                 /* QEMUFile for incoming stream */
+    QEMUFile *f_vmstate;            /* QEMUFile for vmstate backing */
+
+    QIOChannelBuffer *ioc_leader;   /* Migration stream leader */
+    QIOChannelBuffer *ioc_pages;    /* Page coalescing buffer */
+
+    /* Block offset of first page in ioc_pages */
+    int64_t bdrv_offset;
+    /* Block offset of the last page in ioc_pages */
+    int64_t last_bdrv_offset;
+
+    /* Current section offset */
+    int64_t section_offset;
+    /* Offset of the section containing list of RAM blocks */
+    int64_t ram_list_offset;
+    /* Offset of the first RAM section */
+    int64_t ram_offset;
+    /* Offset of the first non-iterable device section */
+    int64_t device_offset;
+
+    /* Zero buffer to fill unwritten slices on backing */
+    void *zero_buf;
+
+    /*
+     * Since we can't rewind the state of migration stream QEMUFile, we just
+     * keep first few hundreds of bytes from the beginning of each section for
+     * the case if particular section appears to be the first non-iterable
+     * device section and we are going to call default_handler().
+     */
+    uint8_t section_header[512];
 } StateSaveCtx;
 
 typedef struct StateLoadCtx {
diff --git a/qemu-snapshot-vm.c b/qemu-snapshot-vm.c
index f7695e75c7..2d8f2d3d79 100644
--- a/qemu-snapshot-vm.c
+++ b/qemu-snapshot-vm.c
@@ -23,17 +23,784 @@
 #include "migration/ram.h"
 #include "qemu-snapshot.h"
 
+/* vmstate header magic */
+#define VMSTATE_HEADER_MAGIC        0x5354564d
+/* vmstate header eof_offset position */
+#define VMSTATE_HEADER_EOF_OFFSET   24
+/* vmstate header size */
+#define VMSTATE_HEADER_SIZE         28
+
+/* Maximum size of page coalescing buffer */
+#define PAGE_COALESC_MAX            (512 * 1024)
+
+/* RAM block */
+typedef struct RAMBlock {
+    int64_t bdrv_offset;        /* Offset on backing storage */
+    int64_t length;             /* Length */
+    int64_t nr_pages;           /* Page count */
+    int64_t nr_slices;          /* Number of slices (for bitmap bookkeeping) */
+
+    unsigned long *bitmap;      /* Bitmap of RAM slices */
+
+    /* Link into ram_list */
+    QSIMPLEQ_ENTRY(RAMBlock) next;
+
+    char idstr[256];            /* RAM block id string */
+} RAMBlock;
+
+/* RAM block page */
+typedef struct RAMPage {
+    RAMBlock *block;            /* RAM block containing the page */
+    int64_t offset;             /* Page offset in RAM block */
+} RAMPage;
+
 /* RAM transfer context */
 typedef struct RAMCtx {
     int64_t normal_pages;       /* Total number of normal pages */
+
+    /* RAM block list head */
+    QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
 } RAMCtx;
 
+/* Section handler ops */
+typedef struct SectionHandlerOps {
+    int (*save_state)(QEMUFile *f, void *opaque, int version_id);
+    int (*load_state)(QEMUFile *f, void *opaque, int version_id);
+    int (*load_state_iterate)(QEMUFile *f, void *opaque, int version_id);
+} SectionHandlerOps;
+
+/* Section handlers entry */
+typedef struct SectionHandlersEntry {
+    const char *idstr;          /* Section id string */
+    const int instance_id;      /* Section instance id */
+    const int version_id;       /* Max. supported section version id */
+
+    int real_section_id;        /* Section id from migration stream */
+    int real_version_id;        /* Version id from migration stream */
+
+    SectionHandlerOps *ops;     /* Section handler callbacks */
+} SectionHandlersEntry;
+
+/* Section handlers */
+typedef struct SectionHandlers {
+    /* Default handler */
+    SectionHandlersEntry default_;
+    /* Handlers */
+    SectionHandlersEntry handlers[];
+} SectionHandlers;
+
+#define SECTION_HANDLERS_ENTRY(_idstr, _instance_id, _version_id, _ops) {   \
+    .idstr          = _idstr,   \
+    .instance_id    = (_instance_id),   \
+    .version_id     = (_version_id),    \
+    .ops            = (_ops),           \
+}
+
+#define SECTION_HANDLERS_END()  { NULL, }
+
+/* Forward declarations */
+static int default_save(QEMUFile *f, void *opaque, int version_id);
+static int ram_save(QEMUFile *f, void *opaque, int version_id);
+static int save_state_complete(StateSaveCtx *s);
+
 static RAMCtx ram_ctx;
 
+static SectionHandlerOps default_handler_ops = {
+    .save_state = default_save,
+};
+
+static SectionHandlerOps ram_handler_ops = {
+    .save_state = ram_save,
+};
+
+static SectionHandlers section_handlers = {
+    .default_ = SECTION_HANDLERS_ENTRY("default", 0, 0, &default_handler_ops),
+    .handlers = {
+        SECTION_HANDLERS_ENTRY("ram", 0, 4, &ram_handler_ops),
+        SECTION_HANDLERS_END(),
+    },
+};
+
+static SectionHandlersEntry *find_se(const char *idstr, int instance_id)
+{
+    SectionHandlersEntry *se;
+
+    for (se = section_handlers.handlers; se->idstr; se++) {
+        if (!strcmp(se->idstr, idstr) && (instance_id == se->instance_id)) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+static SectionHandlersEntry *find_se_by_section_id(int section_id)
+{
+    SectionHandlersEntry *se;
+
+    for (se = section_handlers.handlers; se->idstr; se++) {
+        if (section_id == se->real_section_id) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+static bool check_section_footer(QEMUFile *f, SectionHandlersEntry *se)
+{
+    uint8_t token;
+    int section_id;
+
+    token = qemu_get_byte(f);
+    if (token != QEMU_VM_SECTION_FOOTER) {
+        error_report("Missing footer for section %s(%d)",
+                     se->idstr, se->real_section_id);
+        return false;
+    }
+
+    section_id = qemu_get_be32(f);
+    if (section_id != se->real_section_id) {
+        error_report("Unmatched footer for for section %s(%d): %d",
+                     se->idstr, se->real_section_id, section_id);
+        return false;
+    }
+
+    return true;
+}
+
+static inline
+bool ram_offset_in_block(RAMBlock *block, int64_t offset)
+{
+    return block && offset < block->length;
+}
+
+static inline
+bool ram_bdrv_offset_in_block(RAMBlock *block, int64_t bdrv_offset)
+{
+    return block && bdrv_offset >= block->bdrv_offset &&
+            bdrv_offset < block->bdrv_offset + block->length;
+}
+
+static inline
+int64_t ram_bdrv_from_block_offset(RAMBlock *block, int64_t offset)
+{
+    if (!ram_offset_in_block(block, offset)) {
+        return INVALID_OFFSET;
+    }
+
+    return block->bdrv_offset + offset;
+}
+
+static inline
+int64_t ram_block_offset_from_bdrv(RAMBlock *block, int64_t bdrv_offset)
+{
+    int64_t offset;
+
+    if (!block) {
+        return INVALID_OFFSET;
+    }
+
+    offset = bdrv_offset - block->bdrv_offset;
+    return offset >= 0 ? offset : INVALID_OFFSET;
+}
+
+static RAMBlock *ram_block_by_idstr(const char *idstr)
+{
+    RAMBlock *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        if (!strcmp(idstr, block->idstr)) {
+            return block;
+        }
+    }
+
+    return NULL;
+}
+
+static RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
+{
+    static RAMBlock *block;
+    char idstr[256];
+
+    if (flags & RAM_SAVE_FLAG_CONTINUE) {
+        if (!block) {
+            error_report("RAM_SAVE_FLAG_CONTINUE outside RAM block");
+            return NULL;
+        }
+
+        return block;
+    }
+
+    if (!qemu_get_counted_string(f, idstr)) {
+        error_report("Failed to get RAM block name");
+        return NULL;
+    }
+
+    block = ram_block_by_idstr(idstr);
+    if (!block) {
+        error_report("Can't find RAM block %s", idstr);
+        return NULL;
+    }
+
+    return block;
+}
+
+static int64_t ram_block_next_bdrv_offset(void)
+{
+    RAMBlock *last_block;
+    int64_t offset;
+
+    last_block = QSIMPLEQ_LAST(&ram_ctx.ram_block_list, RAMBlock, next);
+    if (!last_block) {
+        return 0;
+    }
+
+    offset = last_block->bdrv_offset + last_block->length;
+    return ROUND_UP(offset, BDRV_CLUSTER_SIZE);
+}
+
+static void ram_block_add(const char *idstr, int64_t size)
+{
+    RAMBlock *block;
+
+    block = g_new0(RAMBlock, 1);
+    block->length = size;
+    block->bdrv_offset = ram_block_next_bdrv_offset();
+    strcpy(block->idstr, idstr);
+
+    QSIMPLEQ_INSERT_TAIL(&ram_ctx.ram_block_list, block, next);
+}
+
+static void ram_block_list_init_bitmaps(void)
+{
+    RAMBlock *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        block->nr_pages = block->length >> page_bits;
+        block->nr_slices = ROUND_UP(block->length, slice_size) >> slice_bits;
+
+        block->bitmap = bitmap_new(block->nr_slices);
+        bitmap_set(block->bitmap, 0, block->nr_slices);
+    }
+}
+
+static bool ram_block_list_from_stream(QEMUFile *f, int64_t mem_size)
+{
+    int64_t total_ram_bytes;
+
+    total_ram_bytes = mem_size;
+    while (total_ram_bytes > 0) {
+        char idstr[256];
+        int64_t size;
+
+        if (!qemu_get_counted_string(f, idstr)) {
+            error_report("Failed to get RAM block list");
+            return false;
+        }
+        size = qemu_get_be64(f);
+
+        ram_block_add(idstr, size);
+        total_ram_bytes -= size;
+    }
+
+    if (total_ram_bytes != 0) {
+        error_report("Corrupted RAM block list");
+        return false;
+    }
+
+    /* Initialize per-block bitmaps */
+    ram_block_list_init_bitmaps();
+
+    return true;
+}
+
+static void save_state_check_errors(StateSaveCtx *s, int *res)
+{
+    /* Check for -EIO which indicates input stream EOF */
+    if (*res == -EIO) {
+        *res = 0;
+    }
+
+    /*
+     * Check for file errors on success. Replace generic -EINVAL
+     * retcode with file error if possible.
+     */
+    if (*res >= 0 || *res == -EINVAL) {
+        int f_res = qemu_file_get_error(s->f_fd);
+
+        f_res = (f_res == -EIO) ? 0 : f_res;
+        if (!f_res) {
+            f_res = qemu_file_get_error(s->f_vmstate);
+        }
+        if (f_res) {
+            *res = f_res;
+        }
+    }
+}
+
+static int ram_alloc_page_backing(StateSaveCtx *s, RAMPage *page,
+                                  int64_t bdrv_offset)
+{
+    int res = 0;
+
+    /*
+     * Reduce the number of unwritten extents in image backing file.
+     *
+     * We can achieve that by using a bitmap of RAM block 'slices' to
+     * enforce zero blockdev write once we are going to store a memory
+     * page within that slice.
+     */
+    if (test_and_clear_bit(page->offset >> slice_bits, page->block->bitmap)) {
+        res = blk_pwrite(s->blk, bdrv_offset & slice_mask,
+                         s->zero_buf, slice_size, 0);
+    }
+
+    return MIN(res, 0);
+}
+
+static int ram_save_page(StateSaveCtx *s, RAMPage *page, uint8_t *data)
+{
+    size_t usage = s->ioc_pages->usage;
+    int64_t bdrv_offset;
+    int res = 0;
+
+    bdrv_offset = ram_bdrv_from_block_offset(page->block, page->offset);
+    if (bdrv_offset == INVALID_OFFSET) {
+        error_report("Corrupted RAM page");
+        return -EINVAL;
+    }
+
+    /* Deal with fragmentation of the image backing file */
+    res = ram_alloc_page_backing(s, page, bdrv_offset);
+    if (res) {
+        return res;
+    }
+
+    /* Are we saving a contiguous page? */
+    if (bdrv_offset != s->last_bdrv_offset ||
+            (usage + page_size) >= PAGE_COALESC_MAX) {
+        if (usage) {
+            /* Flush coalesced pages to block device */
+            res = blk_pwrite(s->blk, s->bdrv_offset, s->ioc_pages->data,
+                             usage, 0);
+            res = MIN(res, 0);
+        }
+
+        /* Reset coalescing buffer state */
+        s->ioc_pages->usage = 0;
+        s->ioc_pages->offset = 0;
+        /* Switch to the new bdrv_offset */
+        s->bdrv_offset = bdrv_offset;
+    }
+
+    qio_channel_write(QIO_CHANNEL(s->ioc_pages), (char *) data,
+                      page_size, NULL);
+    s->last_bdrv_offset = bdrv_offset + page_size;
+
+    return res;
+}
+
+static int ram_save_page_flush(StateSaveCtx *s)
+{
+    size_t usage = s->ioc_pages->usage;
+    int res = 0;
+
+    if (usage) {
+        /* Flush coalesced pages to block device */
+        res = blk_pwrite(s->blk, s->bdrv_offset,
+                         s->ioc_pages->data, usage, 0);
+        res = MIN(res, 0);
+    }
+
+    /* Reset coalescing buffer state */
+    s->ioc_pages->usage = 0;
+    s->ioc_pages->offset = 0;
+
+    s->last_bdrv_offset = INVALID_OFFSET;
+
+    return res;
+}
+
+static int ram_save(QEMUFile *f, void *opaque, int version_id)
+{
+    StateSaveCtx *s = (StateSaveCtx *) opaque;
+    int incompat_flags = RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE;
+    int flags = 0;
+    int res = 0;
+
+    if (version_id != 4) {
+        error_report("Unsupported version %d for 'ram' handler v4", version_id);
+        return -EINVAL;
+    }
+
+    while (!res && !(flags & RAM_SAVE_FLAG_EOS)) {
+        RAMBlock *block = NULL;
+        int64_t offset;
+
+        offset = qemu_get_be64(f);
+        flags = offset & ~page_mask;
+        offset &= page_mask;
+
+        if (flags & incompat_flags) {
+            error_report("Incompatible RAM page flags 0x%x", flags);
+            res = -EINVAL;
+            break;
+        }
+
+        /* Lookup RAM block for the page */
+        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
+            block = ram_block_from_stream(f, flags);
+            if (!block) {
+                res = -EINVAL;
+                break;
+            }
+        }
+
+        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
+        case RAM_SAVE_FLAG_MEM_SIZE:
+            if (s->ram_list_offset) {
+                error_report("Repeated RAM page with RAM_SAVE_FLAG_MEM_SIZE");
+                res = -EINVAL;
+                break;
+            }
+
+            /* Save position of section with the list of RAM blocks */
+            s->ram_list_offset = s->section_offset;
+
+            /* Get RAM block list */
+            if (!ram_block_list_from_stream(f, offset)) {
+                res = -EINVAL;
+            }
+            break;
+
+        case RAM_SAVE_FLAG_ZERO:
+            /* Nothing to do with zero page */
+            qemu_get_byte(f);
+            break;
+
+        case RAM_SAVE_FLAG_PAGE:
+        {
+            RAMPage page = { .block = block, .offset = offset };
+            uint8_t *data;
+            ssize_t count;
+
+            count = qemu_peek_buffer(f, &data, page_size, 0);
+            qemu_file_skip(f, count);
+            if (count != page_size) {
+                /* I/O error */
+                break;
+            }
+
+            res = ram_save_page(s, &page, data);
+
+            /* Update normal page count */
+            ram_ctx.normal_pages++;
+            break;
+        }
+
+        case RAM_SAVE_FLAG_EOS:
+            /* Normal exit */
+            break;
+
+        default:
+            error_report("RAM page with unknown combination of flags 0x%x", flags);
+            res = -EINVAL;
+
+        }
+
+        /* Make additional check for file errors */
+        if (!res) {
+            res = qemu_file_get_error(f);
+        }
+    }
+
+    /* Flush page coalescing buffer */
+    if (!res) {
+        res = ram_save_page_flush(s);
+    }
+
+    return res;
+}
+
+static int default_save(QEMUFile *f, void *opaque, int version_id)
+{
+    StateSaveCtx *s = (StateSaveCtx *) opaque;
+
+    if (!s->ram_offset) {
+        error_report("Unexpected (non-iterable device state) section");
+        return -EINVAL;
+    }
+
+    if (!s->device_offset) {
+        s->device_offset = s->section_offset;
+        /* Save the rest of vmstate, including non-iterable device state */
+        return save_state_complete(s);
+    }
+
+    /* Should never get here */
+    assert(false);
+    return -EINVAL;
+}
+
+static int save_state_complete(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    int64_t eof_pos;
+    int64_t pos;
+
+    /* Current read offset */
+    pos = qemu_ftell2(f);
+
+    /* vmstate magic */
+    qemu_put_be32(s->f_vmstate, VMSTATE_HEADER_MAGIC);
+    /* Target page size */
+    qemu_put_be32(s->f_vmstate, page_size);
+    /* Number of non-zero pages */
+    qemu_put_be64(s->f_vmstate, ram_ctx.normal_pages);
+
+    /* Offsets relative to QEMU_VM_FILE_MAGIC: */
+
+    /* RAM block list section */
+    qemu_put_be32(s->f_vmstate, s->ram_list_offset);
+    /*
+     * First non-iterable device section.
+     *
+     * Partial RAM sections are skipped in the vmstate stream so
+     * ram_offset shall become the device_offset.
+     */
+    qemu_put_be32(s->f_vmstate, s->ram_offset);
+    /* Slot for eof_offset */
+    qemu_put_be32(s->f_vmstate, 0);
+
+    /*
+     * At the completion stage we save the leading part of migration stream
+     * which contains header, configuration section and the 'ram' section
+     * with QEMU_VM_SECTION_FULL type containing list of RAM blocks.
+     *
+     * Migration leader ends at the first partial RAM section.
+     * QEMU_VM_SECTION_PART token for that section is pointed by s->ram_offset.
+     */
+    qemu_put_buffer(s->f_vmstate, s->ioc_leader->data, s->ram_offset);
+    /*
+     * Trailing part with non-iterable device state.
+     *
+     * First goes the section header which was skipped with QEMUFile
+     * so we need to take it from s->section_header.
+     */
+    qemu_put_buffer(s->f_vmstate, s->section_header, pos - s->device_offset);
+
+    /* Finally we forward the tail of migration stream to vmstate on backing */
+    qemu_fsplice_tail(s->f_vmstate, f);
+    eof_pos = qemu_ftell(s->f_vmstate);
+
+    /* Put eof_offset to the slot in vmstate stream: */
+
+    /* Simulate negative seek() */
+    qemu_update_position(s->f_vmstate,
+                         (size_t)(ssize_t) (VMSTATE_HEADER_EOF_OFFSET - eof_pos));
+    /* Write to the eof_offset header field */
+    qemu_put_be32(s->f_vmstate, eof_pos - VMSTATE_HEADER_SIZE);
+    qemu_fflush(s->f_vmstate);
+
+    return 1;
+}
+
+static int save_section_config(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    uint32_t id_len;
+
+    id_len = qemu_get_be32(f);
+    if (id_len > 255) {
+        error_report("Corrupted configuration section");
+        return -EINVAL;
+    }
+    qemu_file_skip(f, id_len);
+
+    return 0;
+}
+
+static int save_section_start_full(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    SectionHandlersEntry *se;
+    int section_id;
+    int instance_id;
+    int version_id;
+    char idstr[256];
+    int res;
+
+    section_id = qemu_get_be32(f);
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
+                version_id, idstr, se->version_id);
+        return -EINVAL;
+    }
+
+    se->real_section_id = section_id;
+    se->real_version_id = version_id;
+
+    res = se->ops->save_state(f, s, se->real_version_id);
+    /* Positive value indicates completion, no need to check footer */
+    if (res) {
+        return res;
+    }
+
+    /* Check section footer */
+    if (!check_section_footer(f, se)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int save_section_part_end(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    SectionHandlersEntry *se;
+    int section_id;
+    int res;
+
+    /* First section with QEMU_VM_SECTION_PART type must be a 'ram' section */
+    if (!s->ram_offset) {
+        s->ram_offset = s->section_offset;
+    }
+
+    section_id = qemu_get_be32(f);
+
+    /* Lookup section handler by numeric section id */
+    se = find_se_by_section_id(section_id);
+    if (!se) {
+        error_report("Unknown section id %d", section_id);
+        return -EINVAL;
+    }
+
+    res = se->ops->save_state(f, s, se->real_version_id);
+    /* With partial sections we won't have positive success retcodes */
+    if (res) {
+        return res;
+    }
+
+    /* Check section footer */
+    if (!check_section_footer(f, se)) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int save_state_header(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    uint32_t v;
+
+    /* Validate qemu magic */
+    v = qemu_get_be32(f);
+    if (v != QEMU_VM_FILE_MAGIC) {
+        error_report("Not a migration stream");
+        return -EINVAL;
+    }
+
+    v = qemu_get_be32(f);
+    if (v == QEMU_VM_FILE_VERSION_COMPAT) {
+        error_report("SaveVM v2 format is obsolete");
+        return -EINVAL;
+    }
+
+    if (v != QEMU_VM_FILE_VERSION) {
+        error_report("Unsupported migration stream version");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 int coroutine_fn save_state_main(StateSaveCtx *s)
 {
-    /* TODO: implement */
-    return 0;
+    QEMUFile *f = s->f_fd;
+    uint8_t *buf;
+    uint8_t section_type;
+    int res = 0;
+
+    /* Deal with migration stream header */
+    res = save_state_header(s);
+    if (res) {
+        /* Check for file errors in case we have -EINVAL */
+        save_state_check_errors(s, &res);
+        return res;
+    }
+
+    while (!res) {
+        /* Update current section offset */
+        s->section_offset = qemu_ftell2(f);
+
+        /*
+         * We need to keep some data from the beginning of each section.
+         *
+         * When first non-iterable device section is reached and we are going
+         * to write to the vmstate stream in 'default_handler', it is used to
+         * restore the already skipped part of migration stream.
+         */
+        qemu_peek_buffer(f, &buf, sizeof(s->section_header), 0);
+        memcpy(s->section_header, buf, sizeof(s->section_header));
+
+        /* Read section type token */
+        section_type = qemu_get_byte(f);
+
+        switch (section_type) {
+        case QEMU_VM_CONFIGURATION:
+            res = save_section_config(s);
+            break;
+
+        case QEMU_VM_SECTION_FULL:
+        case QEMU_VM_SECTION_START:
+            res = save_section_start_full(s);
+            break;
+
+        case QEMU_VM_SECTION_PART:
+        case QEMU_VM_SECTION_END:
+            res = save_section_part_end(s);
+            break;
+
+        case QEMU_VM_EOF:
+            /*
+             * End of migration stream.
+             *
+             * Normally we will never get here since the ending part of migration
+             * stream is a series of QEMU_VM_SECTION_FULL sections holding
+             * state for non-iterable devices. In our case all those sections
+             * are saved with a single call to save_section_start_full() once
+             * we get an unknown section id and invoke default handler.
+             */
+            res = -EINVAL;
+            break;
+
+        default:
+            error_report("Unknown section type %d", section_type);
+            res = -EINVAL;
+
+        }
+
+        /* Additional check for file errors */
+        save_state_check_errors(s, &res);
+    }
+
+    /* Replace positive retcode with 0 */
+    return MIN(res, 0);
 }
 
 int coroutine_fn load_state_main(StateLoadCtx *s)
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index 21a945fd5e..f559d5e54d 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -94,7 +94,24 @@ static void init_save_context(void)
 
 static void destroy_save_context(void)
 {
-    /* TODO: implement */
+    StateSaveCtx *s = get_save_context();
+
+    if (s->f_vmstate) {
+        qemu_fclose(s->f_vmstate);
+    }
+    if (s->blk) {
+        blk_flush(s->blk);
+        blk_unref(s->blk);
+    }
+    if (s->zero_buf) {
+        qemu_vfree(s->zero_buf);
+    }
+    if (s->ioc_leader) {
+        object_unref(OBJECT(s->ioc_leader));
+    }
+    if (s->ioc_pages) {
+        object_unref(OBJECT(s->ioc_pages));
+    }
 }
 
 static void init_load_context(void)
@@ -134,6 +151,9 @@ static void enter_co_bh(void *opaque)
 static void coroutine_fn snapshot_save_co(void *opaque)
 {
     StateSaveCtx *s = get_save_context();
+    QIOChannel *ioc_fd;
+    uint8_t *buf;
+    size_t count;
     int res = -1;
 
     init_save_context();
@@ -145,6 +165,40 @@ static void coroutine_fn snapshot_save_co(void *opaque)
         goto fail;
     }
 
+    /* QEMUFile on vmstate */
+    s->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(s->blk), 1);
+    qemu_file_set_blocking(s->f_vmstate, false);
+
+    /* QEMUFile on migration fd */
+    ioc_fd = qio_channel_new_fd(params.fd, &error_fatal);
+    qio_channel_set_name(QIO_CHANNEL(ioc_fd), "migration-channel-incoming");
+    s->f_fd = qemu_fopen_channel_input(ioc_fd);
+    object_unref(OBJECT(ioc_fd));
+    /* Use non-blocking mode in coroutine */
+    qemu_file_set_blocking(s->f_fd, false);
+
+    /* Buffer channel to store leading part of migration stream */
+    s->ioc_leader = qio_channel_buffer_new(INPLACE_READ_MAX);
+    qio_channel_set_name(QIO_CHANNEL(s->ioc_leader), "migration-leader-buffer");
+
+    /* Page coalescing buffer */
+    s->ioc_pages = qio_channel_buffer_new(128 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(s->ioc_pages), "migration-page-buffer");
+
+    /* Bounce buffer to fill unwritten extents in image backing */
+    s->zero_buf = qemu_blockalign0(blk_bs(s->blk), slice_size);
+
+    /*
+     * Here we stash the leading part of migration stream without promoting read
+     * position. Later we'll make use of it when writing the vmstate stream.
+     */
+    count = qemu_peek_buffer(s->f_fd, &buf, INPLACE_READ_MAX, 0);
+    res = qemu_file_get_error(s->f_fd);
+    if (res < 0) {
+        goto fail;
+    }
+    qio_channel_write(QIO_CHANNEL(s->ioc_leader), (char *) buf, count, NULL);
+
     res = save_state_main(s);
     if (res) {
         error_report("Failed to save snapshot: %s", strerror(-res));
-- 
2.27.0


