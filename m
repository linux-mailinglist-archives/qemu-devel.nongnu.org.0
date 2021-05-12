Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D74437ECA4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 00:35:40 +0200 (CEST)
Received: from localhost ([::1]:50744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgxS7-0004MT-Dd
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 18:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxOF-00051I-KK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:39 -0400
Received: from relay.sw.ru ([185.231.240.75]:55510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO8-0003sy-5G
 for qemu-devel@nongnu.org; Wed, 12 May 2021 18:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=kDCzKE3Hm6nqcmH7LYNcwszPUwvF2sxFtWQ/dBvQihM=; b=QGIkAnxUTcLy
 4RfKRWl9aWyaVnLwex5ucbv5IeyApjMWUbcqtZukJd7SfYdTa9LbMXSzshXLZkUgXlsAQuux/dgp+
 ihuVoROrrGCFAic37GmXxDExH7U9p3WRhm/iG3inMIFvdFEORjX2um+ij5NOW0yUvyfNTaqXC9iZm
 VuABg=;
Received: from [192.168.15.22] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lgxO6-002Bd3-4u; Thu, 13 May 2021 01:31:30 +0300
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
Subject: [RFC PATCH v2 7/7] migration/snapshot: Implementation of
 qemu-snapshot load path in postcopy mode
Date: Thu, 13 May 2021 01:31:27 +0300
Message-Id: <20210512223127.586885-8-andrey.gruzdev@virtuozzo.com>
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

The commit enables asynchronous snapshot loading using standard postcopy
migration mechanism on destination VM.

The point of switchover to postcopy is trivially selected based on
percentage of non-zero pages loaded in precopy.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snapshot.h |  12 +
 qemu-snapshot-vm.c      | 485 +++++++++++++++++++++++++++++++++++++++-
 qemu-snapshot.c         |  16 ++
 3 files changed, 508 insertions(+), 5 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index aae730d70e..84a0c38e08 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -36,10 +36,14 @@
 
 /* AIO transfer size */
 #define AIO_TRANSFER_SIZE           BDRV_CLUSTER_SIZE
+/* AIO transfer size for postcopy */
+#define AIO_TRANSFER_SIZE_LOWLAT    (BDRV_CLUSTER_SIZE / 4)
 /* AIO ring size */
 #define AIO_RING_SIZE               64
 /* AIO ring in-flight limit */
 #define AIO_RING_INFLIGHT           16
+/* AIO ring in-flight limit for postcopy */
+#define AIO_RING_INFLIGHT_LOWLAT    4
 
 typedef struct AioRing AioRing;
 
@@ -97,12 +101,20 @@ typedef struct StateSaveCtx {
 typedef struct StateLoadCtx {
     BlockBackend *blk;              /* Block backend */
     QEMUFile *f_fd;                 /* QEMUFile for outgoing stream */
+    QEMUFile *f_rp_fd;              /* QEMUFile for return path stream */
     QEMUFile *f_vmstate;            /* QEMUFile for vmstate backing */
 
     QIOChannelBuffer *ioc_leader;   /* vmstate stream leader */
 
     AioRing *aio_ring;              /* AIO ring */
 
+    bool postcopy;                  /* From command-line --postcopy */
+    int postcopy_percent;           /* From command-line --postcopy */
+    bool in_postcopy;               /* In postcopy mode */
+
+    QemuThread rp_listen_thread;    /* Return path listening thread */
+    bool has_rp_listen_thread;      /* Have listening thread */
+
     /* vmstate offset of the section containing list of RAM blocks */
     int64_t ram_list_offset;
     /* vmstate offset of the first non-iterable device section */
diff --git a/qemu-snapshot-vm.c b/qemu-snapshot-vm.c
index b7ce85c5d9..eafb00cd9f 100644
--- a/qemu-snapshot-vm.c
+++ b/qemu-snapshot-vm.c
@@ -40,7 +40,9 @@ typedef struct RAMBlock {
     int64_t nr_pages;           /* Page count */
     int64_t nr_slices;          /* Number of slices (for bitmap bookkeeping) */
 
-    unsigned long *bitmap;      /* Bitmap of RAM slices */
+    int64_t discard_offset;     /* Last page offset sent in precopy */
+
+    unsigned long *bitmap;      /* Bitmap of transferred RAM slices */
 
     /* Link into ram_list */
     QSIMPLEQ_ENTRY(RAMBlock) next;
@@ -54,17 +56,33 @@ typedef struct RAMPage {
     int64_t offset;             /* Page offset in RAM block */
 } RAMPage;
 
+/* Page request from destination in postcopy */
+typedef struct RAMPageRequest {
+    RAMBlock *block;            /* RAM block */
+    int64_t offset;             /* Offset in RAM block */
+    unsigned size;              /* Size of request */
+
+    /* Link into ram_ctx.page_req */
+    QSIMPLEQ_ENTRY(RAMPageRequest) next;
+} RAMPageRequest;
+
 /* RAM transfer context */
 typedef struct RAMCtx {
     int64_t normal_pages;       /* Total number of normal pages */
+    int64_t precopy_pages;      /* Normal pages to load in precopy */
     int64_t loaded_pages;       /* Number of normal pages loaded */
 
     RAMPage last_page;          /* Last loaded page */
 
     RAMBlock *last_sent_block;  /* RAM block of last sent page */
+    RAMBlock *last_req_block;   /* RAM block of last page request */
 
     /* RAM block list head */
     QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
+
+    /* Page request queue for postcopy */
+    QemuMutex page_req_mutex;
+    QSIMPLEQ_HEAD(, RAMPageRequest) page_req;
 } RAMCtx;
 
 /* Section handler ops */
@@ -848,6 +866,433 @@ static void load_state_check_errors(StateLoadCtx *s, int *res)
     }
 }
 
+static bool get_queued_page(RAMPage *page)
+{
+    RAMCtx *ram = &ram_ctx;
+
+    if (QSIMPLEQ_EMPTY_ATOMIC(&ram->page_req)) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&ram->page_req_mutex);
+
+    while (!QSIMPLEQ_EMPTY(&ram->page_req)) {
+        RAMPageRequest *entry = QSIMPLEQ_FIRST(&ram->page_req);
+        RAMBlock *block = entry->block;
+        int64_t slice = entry->offset >> slice_bits;
+
+        QSIMPLEQ_REMOVE_HEAD(&ram->page_req, next);
+        g_free(entry);
+
+        /*
+         * Test respective bit in RAM block's slice bitmap to check if
+         * we still haven't read that slice from the image.
+         */
+        if (test_bit(slice, block->bitmap)) {
+            page->block = block;
+            page->offset = slice << slice_bits;
+
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static int queue_page_request(const char *idstr, int64_t offset, unsigned size)
+{
+    RAMCtx *ram = &ram_ctx;
+    RAMBlock *block;
+    RAMPageRequest *new_entry;
+
+    if (!idstr) {
+        block = ram->last_req_block;
+        if (!block) {
+            error_report("RP-REQ_PAGES: no previous block");
+            return -EINVAL;
+        }
+    } else {
+        block = ram_block_by_idstr(idstr);
+        if (!block) {
+            error_report("RP-REQ_PAGES: cannot find block %s", idstr);
+            return -EINVAL;
+        }
+
+        ram->last_req_block = block;
+    }
+
+    if (!ram_offset_in_block(block, offset)) {
+        error_report("RP-REQ_PAGES: offset 0x%" PRIx64 " out of RAM block %s",
+                     offset, idstr);
+        return -EINVAL;
+    }
+
+    new_entry = g_new0(RAMPageRequest, 1);
+    new_entry->block = block;
+    new_entry->offset = offset;
+    new_entry->size = size;
+
+    qemu_mutex_lock(&ram->page_req_mutex);
+    QSIMPLEQ_INSERT_TAIL(&ram->page_req, new_entry, next);
+    qemu_mutex_unlock(&ram->page_req_mutex);
+
+    return 0;
+}
+
+/* QEMU_VM_COMMAND sub-commands */
+typedef enum VmSubCmd {
+    MIG_CMD_OPEN_RETURN_PATH = 1,
+    MIG_CMD_POSTCOPY_ADVISE = 3,
+    MIG_CMD_POSTCOPY_LISTEN = 4,
+    MIG_CMD_POSTCOPY_RUN = 5,
+    MIG_CMD_POSTCOPY_RAM_DISCARD = 6,
+    MIG_CMD_PACKAGED = 7,
+} VmSubCmd;
+
+/* Return-path message types */
+typedef enum RpMsgType {
+    MIG_RP_MSG_INVALID = 0,
+    MIG_RP_MSG_SHUT = 1,
+    MIG_RP_MSG_REQ_PAGES_ID = 3,
+    MIG_RP_MSG_REQ_PAGES = 4,
+    MIG_RP_MSG_MAX = 7,
+} RpMsgType;
+
+typedef struct RpMsgArgs {
+    int len;
+    const char *name;
+} RpMsgArgs;
+
+/*
+ * Return-path message length/name indexed by message type.
+ * -1 value stands for variable message length.
+ */
+static RpMsgArgs rp_msg_args[] = {
+    [MIG_RP_MSG_INVALID]        = { .len = -1, .name = "INVALID" },
+    [MIG_RP_MSG_SHUT]           = { .len =  4, .name = "SHUT" },
+    [MIG_RP_MSG_REQ_PAGES_ID]   = { .len = -1, .name = "REQ_PAGES_ID" },
+    [MIG_RP_MSG_REQ_PAGES]      = { .len = 12, .name = "REQ_PAGES" },
+    [MIG_RP_MSG_MAX]            = { .len = -1, .name = "MAX" },
+};
+
+/* Return-path message processing thread */
+static void *rp_listen_thread(void *opaque)
+{
+    StateLoadCtx *s = (StateLoadCtx *) opaque;
+    QEMUFile *f = s->f_rp_fd;
+    int res = 0;
+
+    while (!res) {
+        uint8_t h_buf[512];
+        const int h_max_len = sizeof(h_buf);
+        int h_type;
+        int h_len;
+        size_t count;
+
+        h_type = qemu_get_be16(f);
+        h_len = qemu_get_be16(f);
+
+        /* Make early check for input errors */
+        res = qemu_file_get_error(f);
+        if (res) {
+            break;
+        }
+
+        /* Check message type */
+        if (h_type >= MIG_RP_MSG_MAX || h_type == MIG_RP_MSG_INVALID) {
+            error_report("RP: received invalid message type %d length %d",
+                         h_type, h_len);
+            res = -EINVAL;
+            break;
+        }
+
+        /* Check message length */
+        if (rp_msg_args[h_type].len != -1 && h_len != rp_msg_args[h_type].len) {
+            error_report("RP: received %s message len %d expected %d",
+                         rp_msg_args[h_type].name,
+                         h_len, rp_msg_args[h_type].len);
+            res = -EINVAL;
+            break;
+        } else if (h_len > h_max_len) {
+            error_report("RP: received %s message len %d max_len %d",
+                         rp_msg_args[h_type].name, h_len, h_max_len);
+            res = -EINVAL;
+            break;
+        }
+
+        count = qemu_get_buffer(f, h_buf, h_len);
+        if (count != h_len) {
+            break;
+        }
+
+        switch (h_type) {
+        case MIG_RP_MSG_SHUT:
+        {
+            int shut_error;
+
+            shut_error = be32_to_cpu(*(uint32_t *) h_buf);
+            if (shut_error) {
+                error_report("RP: sibling shutdown, error %d", shut_error);
+            }
+
+            /* Exit processing loop */
+            res = 1;
+            break;
+        }
+
+        case MIG_RP_MSG_REQ_PAGES:
+        case MIG_RP_MSG_REQ_PAGES_ID:
+        {
+            uint64_t offset;
+            uint32_t size;
+            char *id_str = NULL;
+
+            offset = be64_to_cpu(*(uint64_t *) (h_buf + 0));
+            size = be32_to_cpu(*(uint32_t *) (h_buf + 8));
+
+            if (h_type == MIG_RP_MSG_REQ_PAGES_ID) {
+                int h_parsed_len = rp_msg_args[MIG_RP_MSG_REQ_PAGES].len;
+
+                if (h_len > h_parsed_len) {
+                    int id_len;
+
+                    /* RAM block id string */
+                    id_len = h_buf[h_parsed_len];
+                    id_str = (char *) &h_buf[h_parsed_len + 1];
+                    id_str[id_len] = 0;
+
+                    h_parsed_len += id_len + 1;
+                }
+
+                if (h_parsed_len != h_len) {
+                    error_report("RP: received %s message len %d expected %d",
+                                 rp_msg_args[MIG_RP_MSG_REQ_PAGES_ID].name,
+                                 h_len, h_parsed_len);
+                    res = -EINVAL;
+                    break;
+                }
+            }
+
+            res = queue_page_request(id_str, offset, size);
+            break;
+        }
+
+        default:
+            error_report("RP: received unexpected message type %d len %d",
+                         h_type, h_len);
+            res = -EINVAL;
+        }
+    }
+
+    if (res >= 0) {
+        res = qemu_file_get_error(f);
+    }
+    if (res) {
+        error_report("RP: listen thread exit, error %d", res);
+    }
+
+    return NULL;
+}
+
+static void send_command(QEMUFile *f, int cmd, uint16_t len, uint8_t *data)
+{
+    qemu_put_byte(f, QEMU_VM_COMMAND);
+    qemu_put_be16(f, (uint16_t) cmd);
+    qemu_put_be16(f, len);
+
+    qemu_put_buffer_async(f, data, len, false);
+    qemu_fflush(f);
+}
+
+static void send_ram_block_discard(QEMUFile *f, RAMBlock *block)
+{
+    int id_len;
+    int msg_len;
+    uint8_t msg_buf[512];
+
+    id_len = strlen(block->idstr);
+    assert(id_len < 256);
+
+    /* Version, always 0 */
+    msg_buf[0] = 0;
+    /* RAM block ID string length, not including terminating 0 */
+    msg_buf[1] = id_len;
+    /* RAM block ID string with terminating zero */
+    memcpy(msg_buf + 2, block->idstr, (id_len + 1));
+    msg_len = 2 + id_len + 1;
+    /* Discard range offset */
+    stq_be_p(msg_buf + msg_len, block->discard_offset);
+    msg_len += 8;
+    /* Discard range length */
+    stq_be_p(msg_buf + msg_len, (block->length - block->discard_offset));
+    msg_len += 8;
+
+    send_command(f, MIG_CMD_POSTCOPY_RAM_DISCARD, msg_len, msg_buf);
+}
+
+static int send_each_ram_block_discard(QEMUFile *f)
+{
+    RAMBlock *block;
+    int res = 0;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        send_ram_block_discard(f, block);
+
+        res = qemu_file_get_error(f);
+        if (res) {
+            break;
+        }
+    }
+
+    return res;
+}
+
+static int prepare_postcopy(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    uint64_t tmp[2];
+    int res;
+
+    /* Number of pages to load in precopy before switching to postcopy */
+    ram_ctx.precopy_pages = ram_ctx.normal_pages * s->postcopy_percent / 100;
+
+    /* Send POSTCOPY_ADVISE */
+    tmp[0] = cpu_to_be64(page_size);
+    tmp[1] = cpu_to_be64(page_size);
+    send_command(f, MIG_CMD_POSTCOPY_ADVISE, 16, (uint8_t *) tmp);
+
+    /* Open return path on destination */
+    send_command(f, MIG_CMD_OPEN_RETURN_PATH, 0, NULL);
+
+    /*
+     * Check for file errors after sending POSTCOPY_ADVISE command
+     * since destination may already have closed input pipe in case
+     * postcopy had not been enabled in advance.
+     */
+    res = qemu_file_get_error(f);
+    if (!res) {
+        qemu_thread_create(&s->rp_listen_thread, "rp_thread",
+                           rp_listen_thread, s, QEMU_THREAD_JOINABLE);
+        s->has_rp_listen_thread = true;
+    }
+
+    return res;
+}
+
+static int start_postcopy(StateLoadCtx *s)
+{
+    QIOChannelBuffer *bioc;
+    QEMUFile *fb;
+    int eof_pos;
+    uint32_t length;
+    int res = 0;
+
+    /*
+     * Send RAM discards for each block's unsent part. Without discards,
+     * the userfault_fd code on destination will not trigger page requests
+     * as expected. Also, the UFFDIO_COPY ioctl that is used to place incoming
+     * page in postcopy would give an error if that page has not faulted
+     * with MISSING reason.
+     */
+    res = send_each_ram_block_discard(s->f_fd);
+    if (res) {
+        return res;
+    }
+
+    /*
+     * To perform a switch to postcopy on destination, we need to send
+     * commands and the device state data in the following order:
+     *   * MIG_CMD_POSTCOPY_LISTEN
+     *   * Non-iterable device state sections
+     *   * MIG_CMD_POSTCOPY_RUN
+     *
+     * All this has to be packaged into a single blob using MIG_CMD_PACKAGED
+     * command. While loading the device state we may trigger page transfer
+     * requests and the fd must be free to process those, thus the destination
+     * must read the whole device state off the fd before it starts
+     * processing it. To wrap it up in a package, QEMU buffer channel is used.
+     */
+    bioc = qio_channel_buffer_new(512 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(bioc), "migration-postcopy-buffer");
+    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
+    object_unref(OBJECT(bioc));
+
+    /* MIG_CMD_POSTCOPY_LISTEN command */
+    send_command(fb, MIG_CMD_POSTCOPY_LISTEN, 0, NULL);
+
+    /* The rest of non-iterable device state with an optional vmdesc section */
+    qemu_fsplice(fb, s->f_vmstate, s->eof_offset - s->device_offset);
+    qemu_fflush(fb);
+
+    /*
+     * vmdesc section may optionally be present at the end of the stream
+     * so we'll try to locate it and truncate the trailer.
+     */
+    eof_pos = bioc->usage - 1;
+
+    for (int offset = (bioc->usage - 11); offset >= 0; offset--) {
+        if (bioc->data[offset] == QEMU_VM_SECTION_FOOTER &&
+                bioc->data[offset + 5] == QEMU_VM_EOF &&
+                bioc->data[offset + 6] == QEMU_VM_VMDESCRIPTION) {
+            uint32_t expected_length = bioc->usage - (offset + 11);
+            uint32_t json_length;
+
+            json_length = be32_to_cpu(*(uint32_t  *) &bioc->data[offset + 7]);
+            if (json_length != expected_length) {
+                error_report("Corrupted vmdesc trailer: length %" PRIu32
+                             " expected %" PRIu32,
+                             json_length, expected_length);
+                res = -EINVAL;
+                goto fail;
+            }
+
+            eof_pos = offset + 5;
+            break;
+        }
+    }
+
+    /*
+     * When switching to postcopy we need to skip QEMU_VM_EOF token which
+     * normally is placed after the last non-iterable device state section
+     * (but before the vmdesc section).
+     *
+     * Skipping QEMU_VM_EOF is required to allow migration process to
+     * continue in postcopy. Vmdesc section also has to be skipped here.
+     */
+    if (eof_pos >= 0 && bioc->data[eof_pos] == QEMU_VM_EOF) {
+        bioc->usage = eof_pos;
+        bioc->offset = eof_pos;
+    }
+
+    /* Finally is the MIG_CMD_POSTCOPY_RUN command */
+    send_command(fb, MIG_CMD_POSTCOPY_RUN, 0, NULL);
+
+    /* Now send that blob */
+    length = cpu_to_be32(bioc->usage);
+    send_command(s->f_fd, MIG_CMD_PACKAGED, sizeof(length), (uint8_t *) &length);
+    qemu_put_buffer_async(s->f_fd, bioc->data, bioc->usage, false);
+    qemu_fflush(s->f_fd);
+
+    /*
+     * Switch to lower setting of in-flight requests limit
+     * to reduce page request latencies.
+     */
+    aio_ring_set_max_inflight(s->aio_ring, AIO_RING_INFLIGHT_LOWLAT);
+
+    s->in_postcopy = true;
+
+fail:
+    qemu_fclose(fb);
+    load_state_check_errors(s, &res);
+
+    return res;
+}
+
+static bool is_postcopy_switchover(StateLoadCtx *s)
+{
+    return ram_ctx.loaded_pages > ram_ctx.precopy_pages;
+}
+
 static void send_section_header_part_end(QEMUFile *f, SectionHandlersEntry *se,
         uint8_t section_type)
 {
@@ -987,10 +1432,13 @@ static void coroutine_fn ram_load_submit_aio(StateLoadCtx *s)
 
     while ((req = aio_ring_get_request(s->aio_ring))) {
         RAMPage page;
-        unsigned max_length = AIO_TRANSFER_SIZE;
+        unsigned max_length = s->in_postcopy ? AIO_TRANSFER_SIZE_LOWLAT :
+                AIO_TRANSFER_SIZE;
         unsigned length;
+        bool urgent;
 
-        if (!find_next_page(&page)) {
+        urgent = get_queued_page(&page);
+        if (!urgent && !find_next_page(&page)) {
             break;
         }
 
@@ -1003,6 +1451,9 @@ static void coroutine_fn ram_load_submit_aio(StateLoadCtx *s)
         ram->last_page.block = page.block;
         ram->last_page.offset = page.offset + length;
 
+        /* Used by send_ram_block_discard() */
+        page.block->discard_offset = ram->last_page.offset;
+
         /* Setup I/O request */
         req->opaque = s->blk;
         req->data = qemu_blockalign(blk_bs(s->blk), length);
@@ -1284,8 +1735,13 @@ static int load_state_ramlist(StateLoadCtx *s)
 
 static int load_state_complete(StateLoadCtx *s)
 {
-    /* Forward non-iterable device state */
-    qemu_fsplice(s->f_fd, s->f_vmstate, s->eof_offset - s->device_offset);
+    if (!s->in_postcopy) {
+        /* Forward non-iterable device state */
+        qemu_fsplice(s->f_fd, s->f_vmstate, s->eof_offset - s->device_offset);
+    } else {
+        /* Send terminating QEMU_VM_EOF if in postcopy */
+        qemu_put_byte(s->f_fd, QEMU_VM_EOF);
+    }
 
     qemu_fflush(s->f_fd);
 
@@ -1364,10 +1820,22 @@ int coroutine_fn load_state_main(StateLoadCtx *s)
         goto fail;
     }
 
+    if (s->postcopy) {
+        res = prepare_postcopy(s);
+        if (res) {
+            goto fail;
+        }
+    }
+
     do {
         res = ram_load_memory(s);
         /* Check for file errors */
         load_state_check_errors(s, &res);
+
+        /* Switch to postcopy? */
+        if (!res && s->postcopy && !s->in_postcopy && is_postcopy_switchover(s)) {
+            res = start_postcopy(s);
+        }
     } while (!res);
 
     if (res == 1) {
@@ -1390,6 +1858,10 @@ void ram_init_state(void)
 
     /* Initialize RAM block list head */
     QSIMPLEQ_INIT(&ram->ram_block_list);
+
+    /* Initialize postcopy page request queue */
+    qemu_mutex_init(&ram->page_req_mutex);
+    QSIMPLEQ_INIT(&ram->page_req);
 }
 
 /* Destroy snapshot RAM state */
@@ -1403,4 +1875,7 @@ void ram_destroy_state(void)
         g_free(block->bitmap);
         g_free(block);
     }
+
+    /* Destroy page request mutex */
+    qemu_mutex_destroy(&ram_ctx.page_req_mutex);
 }
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index f9692900db..4ea461f24c 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -123,6 +123,10 @@ static void destroy_load_context(void)
 {
     StateLoadCtx *s = get_load_context();
 
+    if (s->has_rp_listen_thread) {
+        qemu_thread_join(&s->rp_listen_thread);
+    }
+
     if (s->f_vmstate) {
         qemu_fclose(s->f_vmstate);
     }
@@ -226,12 +230,16 @@ static void coroutine_fn snapshot_load_co(void *opaque)
 {
     StateLoadCtx *s = get_load_context();
     QIOChannel *ioc_fd;
+    QIOChannel *ioc_rp_fd;
     uint8_t *buf;
     size_t count;
     int res = -1;
 
     init_load_context();
 
+    s->postcopy = params.postcopy;
+    s->postcopy_percent = params.postcopy_percent;
+
     /* Block backend */
     s->blk = image_open_opts(params.blk_optstr, params.blk_options,
                              params.blk_flags);
@@ -250,6 +258,14 @@ static void coroutine_fn snapshot_load_co(void *opaque)
     object_unref(OBJECT(ioc_fd));
     qemu_file_set_blocking(s->f_fd, false);
 
+    /* QEMUFile on return path fd if we are going to use postcopy */
+    if (params.postcopy) {
+        ioc_rp_fd = qio_channel_new_fd(params.rp_fd, NULL);
+        qio_channel_set_name(QIO_CHANNEL(ioc_fd), "migration-channel-rp");
+        s->f_rp_fd = qemu_fopen_channel_input(ioc_rp_fd);
+        object_unref(OBJECT(ioc_rp_fd));
+    }
+
     /* Buffer channel to store leading part of migration stream */
     s->ioc_leader = qio_channel_buffer_new(INPLACE_READ_MAX);
     qio_channel_set_name(QIO_CHANNEL(s->ioc_leader), "migration-leader-buffer");
-- 
2.27.0


