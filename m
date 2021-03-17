Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837D33F66B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:18:20 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZoJ-00049C-Ex
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ92-0002rc-LJ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:35:40 -0400
Received: from relay.sw.ru ([185.231.240.75]:50398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8z-0005UD-21
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=/1FvT4/rC1wGR/G2lPPw0+A45U6B1UCcaO9+4u019UY=; b=YrBZjiU1U4My
 vqJtraF7ioIpaKGoL7clYCaK8j91eu17wUI8THfnd4YwB1tx9RDXl9fRdywO2ETNIwjo9dW904gFy
 fqCHgS3VpZ+0y34PYCOnGKSw0MusOVrTJAjIZqTkBoarRfS6P6kgjVU7I0wZlGkL3sRIVAsLy2P5n
 8ihUM=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8N-0034yI-OL; Wed, 17 Mar 2021 19:34:59 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 7/9] migration/snap-tool: Complete implementation of
 snapshot saving
Date: Wed, 17 Mar 2021 19:32:20 +0300
Message-Id: <20210317163222.182609-8-andrey.gruzdev@virtuozzo.com>
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

Includes code to parse incoming migration stream, dispatch data to
section handlers and deal with complications of open-coded migration
format without introducing strong dependencies on QEMU migration code.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h  |  42 +++
 qemu-snap-handlers.c | 717 ++++++++++++++++++++++++++++++++++++++++++-
 qemu-snap.c          |  54 +++-
 3 files changed, 810 insertions(+), 3 deletions(-)

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
index f4b38d6442..570f200c9d 100644
--- a/include/qemu-snap.h
+++ b/include/qemu-snap.h
@@ -51,8 +51,47 @@ typedef struct AioBufferTask {
 
 typedef AioBufferStatus coroutine_fn (*AioBufferFunc)(AioBufferTask *task);
 
+typedef struct QIOChannelBuffer QIOChannelBuffer;
+
 typedef struct SnapSaveState {
+    const char *filename;       /* Image file name */
     BlockBackend *blk;          /* Block backend */
+
+    QEMUFile *f_fd;             /* Incoming migration stream QEMUFile */
+    QEMUFile *f_vmstate;        /* Block backend vmstate area QEMUFile */
+    /*
+     * Buffer to stash first few KBs of incoming stream, part of it later will
+     * go the the VMSTATE area of the image file. Specifically, these are VM
+     * state header, configuration section and the section which contains
+     * RAM block list.
+     */
+    QIOChannelBuffer *ioc_lbuf;
+    /* Page coalescing buffer channel */
+    QIOChannelBuffer *ioc_pbuf;
+
+    /* BDRV offset matching start of ioc_pbuf */
+    int64_t bdrv_offset;
+    /* Last BDRV offset saved to ioc_pbuf */
+    int64_t last_bdrv_offset;
+
+    /* Stream read position, updated at the beginning of each new section */
+    int64_t stream_pos;
+
+    /* Stream read position at the beginning of RAM block list section */
+    int64_t ram_list_pos;
+    /* Stream read position at the beginning of the first RAM data section */
+    int64_t ram_pos;
+    /* Stream read position at the beginning of the first device state section */
+    int64_t device_pos;
+
+    /* Final status */
+    int status;
+
+    /*
+     * Keep first few bytes from the beginning of each section for the case
+     * when we meet device state section and go into 'default_handler'.
+     */
+    uint8_t section_header[512];
 } SnapSaveState;
 
 typedef struct SnapLoadState {
@@ -65,6 +104,9 @@ SnapLoadState *snap_load_get_state(void);
 int coroutine_fn snap_save_state_main(SnapSaveState *sn);
 int coroutine_fn snap_load_state_main(SnapLoadState *sn);
 
+void snap_ram_init_state(int page_bits);
+void snap_ram_destroy_state(void);
+
 QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
 
 AioBufferPool *coroutine_fn aio_pool_new(int buf_align, int buf_size, int buf_count);
diff --git a/qemu-snap-handlers.c b/qemu-snap-handlers.c
index bdc1911909..4b63d42a29 100644
--- a/qemu-snap-handlers.c
+++ b/qemu-snap-handlers.c
@@ -23,11 +23,704 @@
 #include "migration/ram.h"
 #include "qemu-snap.h"
 
+/* BDRV vmstate area MAGIC for state header */
+#define VMSTATE_MAGIC               0x5354564d
+/* BDRV vmstate area header size */
+#define VMSTATE_HEADER_SIZE         28
+/* BDRV vmstate area header eof_pos field offset */
+#define VMSTATE_HEADER_EOF_OFFSET   24
+
+/* Alignment of QEMU RAM block on backing storage */
+#define BLK_RAM_BLOCK_ALIGN         (1024 * 1024)
+/* Max. byte count for page coalescing buffer */
+#define PAGE_COALESC_MAX            (512 * 1024)
+
+/* RAM block descriptor */
+typedef struct RAMBlockDesc {
+    int64_t bdrv_offset;        /* Offset on backing storage */
+    int64_t length;             /* RAM block used_length */
+    int64_t nr_pages;           /* RAM block page count (length >> page_bits) */
+
+    char idstr[256];            /* RAM block id string */
+
+    /* Link into ram_list */
+    QSIMPLEQ_ENTRY(RAMBlockDesc) next;
+} RAMBlockDesc;
+
+/* State reflecting RAM part of snapshot */
+typedef struct RAMState {
+    int64_t page_size;          /* Page size */
+    int64_t page_mask;          /* Page mask */
+    int page_bits;              /* Page size bits */
+
+    int64_t normal_pages;       /* Total number of normal (non-zero) pages */
+
+    /* List of RAM blocks */
+    QSIMPLEQ_HEAD(, RAMBlockDesc) ram_block_list;
+} RAMState;
+
+/* Section handler ops */
+typedef struct SectionHandlerOps {
+    int (*save_section)(QEMUFile *f, void *opaque, int version_id);
+    int (*load_section)(QEMUFile *f, void *opaque, int version_id);
+} SectionHandlerOps;
+
+/* Section handler */
+typedef struct SectionHandlersEntry {
+    const char *idstr;          /* Section id string */
+    const int instance_id;      /* Section instance id */
+    const int version_id;       /* Max. supported section version id */
+
+    int state_section_id;       /* Section id from migration stream */
+    int state_version_id;       /* Version id from migration stream */
+
+    SectionHandlerOps *ops;     /* Section handler callbacks */
+} SectionHandlersEntry;
+
+/* Available section handlers */
+typedef struct SectionHandlers {
+    /* Handler for sections not identified by 'handlers' array */
+    SectionHandlersEntry default_entry;
+    /* Array of section save/load handlers */
+    SectionHandlersEntry entries[];
+} SectionHandlers;
+
+#define SECTION_HANDLERS_ENTRY(_idstr, _instance_id, _version_id, _ops) {   \
+    .idstr          = _idstr,           \
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
+static int save_state_complete(SnapSaveState *sn);
+
+static RAMState ram_state;
+
+static SectionHandlerOps default_handler_ops = {
+    .save_section = default_save,
+    .load_section = NULL,
+};
+
+static SectionHandlerOps ram_handler_ops = {
+    .save_section = ram_save,
+    .load_section = NULL,
+};
+
+static SectionHandlers section_handlers = {
+    .default_entry =
+        SECTION_HANDLERS_ENTRY("default", 0, 0, &default_handler_ops),
+    .entries = {
+        SECTION_HANDLERS_ENTRY("ram", 0, 4, &ram_handler_ops),
+        SECTION_HANDLERS_END(),
+    },
+};
+
+static SectionHandlersEntry *find_se(const char *idstr, int instance_id)
+{
+    SectionHandlersEntry *se;
+
+    for (se = section_handlers.entries; se->idstr; se++) {
+        if (!strcmp(se->idstr, idstr) && (instance_id == se->instance_id)) {
+            return se;
+        }
+    }
+    return NULL;
+}
+
+static SectionHandlersEntry *find_se_by_section_id(int section_id)
+{
+    SectionHandlersEntry *se;
+
+    for (se = section_handlers.entries; se->idstr; se++) {
+        if (section_id == se->state_section_id) {
+            return se;
+        }
+    }
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
+        error_report("Missing footer for section '%s'", se->idstr);
+        return false;
+    }
+
+    section_id = qemu_get_be32(f);
+    if (section_id != se->state_section_id) {
+        error_report("Mismatched section_id in footer for section '%s':"
+                     " read_id=%d expected_id=%d",
+                se->idstr, section_id, se->state_section_id);
+        return false;
+    }
+    return true;
+}
+
+static inline
+bool ram_offset_in_block(RAMBlockDesc *block, int64_t offset)
+{
+    return (block && (offset < block->length));
+}
+
+static inline
+bool ram_bdrv_offset_in_block(RAMBlockDesc *block, int64_t bdrv_offset)
+{
+    return (block && (bdrv_offset >= block->bdrv_offset) &&
+            (bdrv_offset < block->bdrv_offset + block->length));
+}
+
+static inline
+int64_t ram_bdrv_from_block_offset(RAMBlockDesc *block, int64_t offset)
+{
+    if (!ram_offset_in_block(block, offset)) {
+        return INVALID_OFFSET;
+    }
+
+    return block->bdrv_offset + offset;
+}
+
+static inline
+int64_t ram_block_offset_from_bdrv(RAMBlockDesc *block, int64_t bdrv_offset)
+{
+    int64_t offset;
+
+    if (!block) {
+        return INVALID_OFFSET;
+    }
+    offset = bdrv_offset - block->bdrv_offset;
+    return offset >= 0 ? offset : INVALID_OFFSET;
+}
+
+static RAMBlockDesc *ram_block_by_idstr(const char *idstr)
+{
+    RAMBlockDesc *block;
+
+    QSIMPLEQ_FOREACH(block, &ram_state.ram_block_list, next) {
+        if (!strcmp(idstr, block->idstr)) {
+            return block;
+        }
+    }
+    return NULL;
+}
+
+static RAMBlockDesc *ram_block_from_stream(QEMUFile *f, int flags)
+{
+    static RAMBlockDesc *block;
+    char idstr[256];
+
+    if (flags & RAM_SAVE_FLAG_CONTINUE) {
+        if (!block) {
+            error_report("Corrupted 'ram' section: offset=0x%" PRIx64,
+                    qemu_ftell2(f));
+            return NULL;
+        }
+        return block;
+    }
+
+    if (!qemu_get_counted_string(f, idstr)) {
+        return NULL;
+    }
+    block = ram_block_by_idstr(idstr);
+    if (!block) {
+        error_report("Can't find RAM block '%s'", idstr);
+        return NULL;
+    }
+    return block;
+}
+
+static int64_t ram_block_next_bdrv_offset(void)
+{
+    RAMBlockDesc *last_block;
+    int64_t offset;
+
+    last_block = QSIMPLEQ_LAST(&ram_state.ram_block_list, RAMBlockDesc, next);
+    if (!last_block) {
+        return 0;
+    }
+    offset = last_block->bdrv_offset + last_block->length;
+    return ROUND_UP(offset, BLK_RAM_BLOCK_ALIGN);
+}
+
+static void ram_block_add(const char *idstr, int64_t size)
+{
+    RAMBlockDesc *block;
+
+    block = g_new0(RAMBlockDesc, 1);
+    block->length = size;
+    block->bdrv_offset = ram_block_next_bdrv_offset();
+    strcpy(block->idstr, idstr);
+
+    QSIMPLEQ_INSERT_TAIL(&ram_state.ram_block_list, block, next);
+}
+
+static void ram_block_list_from_stream(QEMUFile *f, int64_t mem_size)
+{
+    int64_t total_ram_bytes;
+
+    total_ram_bytes = mem_size;
+    while (total_ram_bytes > 0) {
+        char idstr[256];
+        int64_t size;
+
+        if (!qemu_get_counted_string(f, idstr)) {
+            error_report("Can't get RAM block id string in 'ram' "
+                         "MEM_SIZE: offset=0x%" PRIx64 " error=%d",
+                    qemu_ftell2(f), qemu_file_get_error(f));
+            return;
+        }
+        size = (int64_t) qemu_get_be64(f);
+
+        ram_block_add(idstr, size);
+        total_ram_bytes -= size;
+    }
+    if (total_ram_bytes != 0) {
+        error_report("Mismatched MEM_SIZE vs sum of RAM block lengths:"
+                     " mem_size=%" PRId64 " block_sum=%" PRId64,
+                mem_size, (mem_size - total_ram_bytes));
+    }
+}
+
+static void save_check_file_errors(SnapSaveState *sn, int *res)
+{
+    /* Check for -EIO that indicates plane EOF */
+    if (*res == -EIO) {
+        *res = 0;
+    }
+    /* Check file errors for success and -EINVAL retcodes */
+    if (*res >= 0 || *res == -EINVAL) {
+        int f_res;
+
+        f_res = qemu_file_get_error(sn->f_fd);
+        f_res = (f_res == -EIO) ? 0 : f_res;
+        if (!f_res) {
+            f_res = qemu_file_get_error(sn->f_vmstate);
+        }
+        *res = f_res ? f_res : *res;
+    }
+}
+
+static int ram_save_page(SnapSaveState *sn, uint8_t *page_ptr, int64_t bdrv_offset)
+{
+    size_t pbuf_usage = sn->ioc_pbuf->usage;
+    int page_size = ram_state.page_size;
+    int res = 0;
+
+    if (bdrv_offset != sn->last_bdrv_offset ||
+        (pbuf_usage + page_size) >= PAGE_COALESC_MAX) {
+        if (pbuf_usage) {
+            /* Flush coalesced pages to block device */
+            res = blk_pwrite(sn->blk, sn->bdrv_offset,
+                    sn->ioc_pbuf->data, pbuf_usage, 0);
+            res = res < 0 ? res : 0;
+        }
+
+        /* Reset coalescing buffer state */
+        sn->ioc_pbuf->usage = 0;
+        sn->ioc_pbuf->offset = 0;
+        /* Switch to new starting bdrv_offset */
+        sn->bdrv_offset = bdrv_offset;
+    }
+
+    qio_channel_write(QIO_CHANNEL(sn->ioc_pbuf),
+            (char *) page_ptr, page_size, NULL);
+    sn->last_bdrv_offset = bdrv_offset + page_size;
+    return res;
+}
+
+static int ram_save_page_flush(SnapSaveState *sn)
+{
+    size_t pbuf_usage = sn->ioc_pbuf->usage;
+    int res = 0;
+
+    if (pbuf_usage) {
+        /* Flush coalesced pages to block device */
+        res = blk_pwrite(sn->blk, sn->bdrv_offset,
+                sn->ioc_pbuf->data, pbuf_usage, 0);
+        res = res < 0 ? res : 0;
+    }
+
+    /* Reset coalescing buffer state */
+    sn->ioc_pbuf->usage = 0;
+    sn->ioc_pbuf->offset = 0;
+
+    sn->last_bdrv_offset = INVALID_OFFSET;
+    return res;
+}
+
+static int ram_save(QEMUFile *f, void *opaque, int version_id)
+{
+    SnapSaveState *sn = (SnapSaveState *) opaque;
+    RAMState *rs = &ram_state;
+    int incompat_flags = (RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE);
+    int page_size = rs->page_size;
+    int flags = 0;
+    int res = 0;
+
+    if (version_id != 4) {
+        error_report("Unsupported version %d for 'ram' handler v4", version_id);
+        return -EINVAL;
+    }
+
+    while (!res && !(flags & RAM_SAVE_FLAG_EOS)) {
+        RAMBlockDesc *block;
+        int64_t bdrv_offset = INVALID_OFFSET;
+        uint8_t *page_ptr;
+        ssize_t count;
+        int64_t addr;
+
+        addr = qemu_get_be64(f);
+        flags = addr & ~rs->page_mask;
+        addr &= rs->page_mask;
+
+        if (flags & incompat_flags) {
+            error_report("RAM page with incompatible flags: offset=0x%" PRIx64
+                         " flags=0x%x", qemu_ftell2(f), flags);
+            res = -EINVAL;
+            break;
+        }
+
+        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
+            block = ram_block_from_stream(f, flags);
+            bdrv_offset = ram_bdrv_from_block_offset(block, addr);
+            if (bdrv_offset == INVALID_OFFSET) {
+                error_report("Corrupted RAM page: offset=0x%" PRIx64
+                             " page_addr=0x%" PRIx64, qemu_ftell2(f), addr);
+                res = -EINVAL;
+                break;
+            }
+        }
+
+        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
+        case RAM_SAVE_FLAG_MEM_SIZE:
+            /* Save position of the section containing list of RAM blocks */
+            if (sn->ram_list_pos) {
+                error_report("Unexpected RAM page with FLAG_MEM_SIZE:"
+                             " offset=0x%" PRIx64 " page_addr=0x%" PRIx64
+                             " flags=0x%x", qemu_ftell2(f), addr, flags);
+                res = -EINVAL;
+                break;
+            }
+            sn->ram_list_pos = sn->stream_pos;
+
+            /* Fill RAM block list */
+            ram_block_list_from_stream(f, addr);
+            break;
+
+        case RAM_SAVE_FLAG_ZERO:
+            /* Nothing to do with zero page */
+            qemu_get_byte(f);
+            break;
+
+        case RAM_SAVE_FLAG_PAGE:
+            count = qemu_peek_buffer(f, &page_ptr, page_size, 0);
+            qemu_file_skip(f, count);
+            if (count != page_size) {
+                /* I/O error */
+                break;
+            }
+
+            res = ram_save_page(sn, page_ptr, bdrv_offset);
+            /* Update normal page count */
+            ram_state.normal_pages++;
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
+        /* Make additional check for file errors */
+        if (!res) {
+            res = qemu_file_get_error(f);
+        }
+    }
+
+    /* Flush page coalescing buffer at RAM_SAVE_FLAG_EOS */
+    if (!res) {
+        res = ram_save_page_flush(sn);
+    }
+    return res;
+}
+
+static int default_save(QEMUFile *f, void *opaque, int version_id)
+{
+    SnapSaveState *sn = (SnapSaveState *) opaque;
+
+    if (!sn->ram_pos) {
+        error_report("Section with unknown ID before first 'ram' section:"
+                     " offset=0x%" PRIx64, sn->stream_pos);
+        return -EINVAL;
+    }
+    if (!sn->device_pos) {
+        sn->device_pos = sn->stream_pos;
+        /*
+         * Save the rest of migration data needed to restore VM state.
+         * It is the header, configuration section, first 'ram' section
+         * with the list of RAM blocks and device state data.
+         */
+        return save_state_complete(sn);
+    }
+
+    /* Should never get here */
+    assert(false);
+    return -EINVAL;
+}
+
+static int save_state_complete(SnapSaveState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    int64_t pos;
+    int64_t eof_pos;
+
+    /* Current read position */
+    pos = qemu_ftell2(f);
+
+    /* Put specific MAGIC at the beginning of saved BDRV vmstate stream */
+    qemu_put_be32(sn->f_vmstate, VMSTATE_MAGIC);
+    /* Target page size */
+    qemu_put_be32(sn->f_vmstate, ram_state.page_size);
+    /* Number of normal (non-zero) pages in snapshot */
+    qemu_put_be64(sn->f_vmstate, ram_state.normal_pages);
+    /* Offset of RAM block list section relative to QEMU_VM_FILE_MAGIC */
+    qemu_put_be32(sn->f_vmstate, sn->ram_list_pos);
+    /* Offset of first device state section relative to QEMU_VM_FILE_MAGIC */
+    qemu_put_be32(sn->f_vmstate, sn->ram_pos);
+    /*
+     * Put a slot here since we don't really know how
+     * long is the rest of migration stream.
+     */
+    qemu_put_be32(sn->f_vmstate, 0);
+
+    /*
+     * At the completion stage we save the leading part of migration stream
+     * which contains header, configuration section and the 'ram' section
+     * with QEMU_VM_SECTION_FULL type containing the list of RAM blocks.
+     *
+     * All of this comes before the first QEMU_VM_SECTION_PART token for 'ram'.
+     * That QEMU_VM_SECTION_PART token is pointed by sn->ram_pos.
+     */
+    qemu_put_buffer(sn->f_vmstate, sn->ioc_lbuf->data, sn->ram_pos);
+    /*
+     * And then we save the trailing part with device state.
+     *
+     * First we take section header which has already been skipped
+     * by QEMUFile but we can get it from sn->section_header.
+     */
+    qemu_put_buffer(sn->f_vmstate, sn->section_header, (pos - sn->device_pos));
+
+    /* Forward the rest of stream data to the BDRV vmstate file */
+    file_transfer_to_eof(sn->f_vmstate, f);
+    /* It does qemu_fflush() internally */
+    eof_pos = qemu_ftell(sn->f_vmstate);
+
+    /* Hack: simulate negative seek() */
+    qemu_update_position(sn->f_vmstate,
+            (size_t)(ssize_t) (VMSTATE_HEADER_EOF_OFFSET - eof_pos));
+    qemu_put_be32(sn->f_vmstate, eof_pos - VMSTATE_HEADER_SIZE);
+    /* Final flush to deliver eof_offset header field */
+    qemu_fflush(sn->f_vmstate);
+
+    return 1;
+}
+
+static int save_section_config(SnapSaveState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    uint32_t id_len;
+
+    id_len = qemu_get_be32(f);
+    if (id_len > 255) {
+        error_report("Corrupted QEMU_VM_CONFIGURATION section");
+        return -EINVAL;
+    }
+    qemu_file_skip(f, id_len);
+    return 0;
+}
+
+static int save_section_start_full(SnapSaveState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    SectionHandlersEntry *se;
+    int section_id;
+    int instance_id;
+    int version_id;
+    char id_str[256];
+    int res;
+
+    /* Read section start */
+    section_id = qemu_get_be32(f);
+    if (!qemu_get_counted_string(f, id_str)) {
+        return qemu_file_get_error(f);
+    }
+    instance_id = qemu_get_be32(f);
+    version_id = qemu_get_be32(f);
+
+    se = find_se(id_str, instance_id);
+    if (!se) {
+        se = &section_handlers.default_entry;
+    } else if (version_id > se->version_id) {
+        /* Validate version */
+        error_report("Unsupported version %d for '%s' v%d",
+                version_id, id_str, se->version_id);
+        return -EINVAL;
+    }
+
+    se->state_section_id = section_id;
+    se->state_version_id = version_id;
+
+    res = se->ops->save_section(f, sn, se->state_version_id);
+    /*
+     * Positive return value indicates save completion,
+     * no need to check section footer.
+     */
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
+static int save_section_part_end(SnapSaveState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    SectionHandlersEntry *se;
+    int section_id;
+    int res;
+
+    /* First section with QEMU_VM_SECTION_PART type must be the 'ram' section */
+    if (!sn->ram_pos) {
+        sn->ram_pos = sn->stream_pos;
+    }
+
+    section_id = qemu_get_be32(f);
+    se = find_se_by_section_id(section_id);
+    if (!se) {
+        error_report("Unknown section ID: %d", section_id);
+        return -EINVAL;
+    }
+
+    res = se->ops->save_section(f, sn, se->state_version_id);
+    if (res) {
+        error_report("Error while saving section: id_str='%s' section_id=%d",
+                se->idstr, section_id);
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
+static int save_state_header(SnapSaveState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    uint32_t v;
+
+    /* Validate QEMU MAGIC */
+    v = qemu_get_be32(f);
+    if (v != QEMU_VM_FILE_MAGIC) {
+        error_report("Not a migration stream");
+        return -EINVAL;
+    }
+    v = qemu_get_be32(f);
+    if (v == QEMU_VM_FILE_VERSION_COMPAT) {
+        error_report("SaveVM v2 format is obsolete");
+        return -EINVAL;
+    }
+    if (v != QEMU_VM_FILE_VERSION) {
+        error_report("Unsupported migration stream version");
+        return -EINVAL;
+    }
+    return 0;
+}
+
 /* Save snapshot data from incoming migration stream */
 int coroutine_fn snap_save_state_main(SnapSaveState *sn)
 {
-    /* TODO: implement */
-    return 0;
+    QEMUFile *f = sn->f_fd;
+    uint8_t *buf;
+    uint8_t section_type;
+    int res = 0;
+
+    res = save_state_header(sn);
+    if (res) {
+        save_check_file_errors(sn, &res);
+        return res;
+    }
+
+    while (!res) {
+        /* Update current stream position so it points to the section type token */
+        sn->stream_pos = qemu_ftell2(f);
+
+        /*
+         * Keep some data from the beginning of the section to use it if it appears
+         * that we have reached device state section and go into 'default_handler'.
+         */
+        qemu_peek_buffer(f, &buf, sizeof(sn->section_header), 0);
+        memcpy(sn->section_header, buf, sizeof(sn->section_header));
+
+        /* Read section type token */
+        section_type = qemu_get_byte(f);
+
+        switch (section_type) {
+        case QEMU_VM_CONFIGURATION:
+            res = save_section_config(sn);
+            break;
+
+        case QEMU_VM_SECTION_FULL:
+        case QEMU_VM_SECTION_START:
+            res = save_section_start_full(sn);
+            break;
+
+        case QEMU_VM_SECTION_PART:
+        case QEMU_VM_SECTION_END:
+            res = save_section_part_end(sn);
+            break;
+
+        case QEMU_VM_EOF:
+            /*
+             * End of migration stream, but normally we will never really get here
+             * since final part of migration stream is a series of QEMU_VM_SECTION_FULL
+             * sections holding non-iterable device state. In our case all this
+             * state is saved with single call to snap_save_section_start_full()
+             * when we first meet unknown section id string.
+             */
+            res = -EINVAL;
+            break;
+
+        default:
+            error_report("Unknown section type %d", section_type);
+            res = -EINVAL;
+        }
+
+        /* Additional check for file errors on success and -EINVAL */
+        save_check_file_errors(sn, &res);
+    }
+
+    /* Replace positive exit code with 0 */
+    sn->status = res < 0 ? res : 0;
+    return sn->status;
 }
 
 /* Load snapshot data and send it with outgoing migration stream */
@@ -36,3 +729,23 @@ int coroutine_fn snap_load_state_main(SnapLoadState *sn)
     /* TODO: implement */
     return 0;
 }
+
+/* Initialize snapshot RAM state */
+void snap_ram_init_state(int page_bits)
+{
+    RAMState *rs = &ram_state;
+
+    memset(rs, 0, sizeof(ram_state));
+
+    rs->page_bits = page_bits;
+    rs->page_size = (int64_t) 1 << page_bits;
+    rs->page_mask = ~(rs->page_size - 1);
+
+    /* Initialize RAM block list head */
+    QSIMPLEQ_INIT(&rs->ram_block_list);
+}
+
+/* Destroy snapshot RAM state */
+void snap_ram_destroy_state(void)
+{
+}
diff --git a/qemu-snap.c b/qemu-snap.c
index ec56aa55d2..a337a7667b 100644
--- a/qemu-snap.c
+++ b/qemu-snap.c
@@ -105,11 +105,31 @@ SnapLoadState *snap_load_get_state(void)
 static void snap_save_init_state(void)
 {
     memset(&save_state, 0, sizeof(save_state));
+    save_state.status = -1;
 }
 
 static void snap_save_destroy_state(void)
 {
-    /* TODO: implement */
+    SnapSaveState *sn = snap_save_get_state();
+
+    if (sn->ioc_lbuf) {
+        object_unref(OBJECT(sn->ioc_lbuf));
+    }
+    if (sn->ioc_pbuf) {
+        object_unref(OBJECT(sn->ioc_pbuf));
+    }
+    if (sn->f_vmstate) {
+        qemu_fclose(sn->f_vmstate);
+    }
+    if (sn->blk) {
+        blk_flush(sn->blk);
+        blk_unref(sn->blk);
+
+        /* Delete image file in case of failure */
+        if (sn->status) {
+            qemu_unlink(sn->filename);
+        }
+    }
 }
 
 static void snap_load_init_state(void)
@@ -190,6 +210,8 @@ static void coroutine_fn do_snap_save_co(void *opaque)
     SnapTaskState *task_state = opaque;
     SnapSaveState *sn = snap_save_get_state();
 
+    /* Switch to non-blocking mode in coroutine context */
+    qemu_file_set_blocking(sn->f_fd, false);
     /* Enter main routine */
     task_state->ret = snap_save_state_main(sn);
 }
@@ -233,17 +255,46 @@ static int run_snap_task(CoroutineEntry *entry)
 static int snap_save(const SnapSaveParams *params)
 {
     SnapSaveState *sn;
+    QIOChannel *ioc_fd;
+    uint8_t *buf;
+    size_t count;
     int res = -1;
 
+    snap_ram_init_state(ctz64(params->page_size));
     snap_save_init_state();
     sn = snap_save_get_state();
 
+    sn->filename = params->filename;
+
+    ioc_fd = qio_channel_new_fd(params->fd, NULL);
+    qio_channel_set_name(QIO_CHANNEL(ioc_fd), "snap-channel-incoming");
+    sn->f_fd = qemu_fopen_channel_input(ioc_fd);
+    object_unref(OBJECT(ioc_fd));
+
+    /* Create buffer channel to store leading part of incoming stream */
+    sn->ioc_lbuf = qio_channel_buffer_new(INPLACE_READ_MAX);
+    qio_channel_set_name(QIO_CHANNEL(sn->ioc_lbuf), "snap-leader-buffer");
+
+    count = qemu_peek_buffer(sn->f_fd, &buf, INPLACE_READ_MAX, 0);
+    res = qemu_file_get_error(sn->f_fd);
+    if (res < 0) {
+        goto fail;
+    }
+    qio_channel_write(QIO_CHANNEL(sn->ioc_lbuf), (char *) buf, count, NULL);
+
+    /* Used for incoming page coalescing */
+    sn->ioc_pbuf = qio_channel_buffer_new(128 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(sn->ioc_pbuf), "snap-page-buffer");
+
     sn->blk = snap_create(params->filename, params->image_size,
             params->bdrv_flags, params->writethrough);
     if (!sn->blk) {
         goto fail;
     }
 
+    /* Open QEMUFile so we can write to BDRV vmstate area */
+    sn->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(sn->blk), 1);
+
     res = run_snap_task(do_snap_save_co);
     if (res) {
         error_report("Failed to save snapshot: error=%d", res);
@@ -251,6 +302,7 @@ static int snap_save(const SnapSaveParams *params)
 
 fail:
     snap_save_destroy_state();
+    snap_ram_destroy_state();
 
     return res;
 }
-- 
2.25.1


