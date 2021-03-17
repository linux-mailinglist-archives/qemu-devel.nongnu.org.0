Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504EC33F630
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:02:05 +0100 (CET)
Received: from localhost ([::1]:57306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZYa-0008CH-78
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ9p-0003Lm-LH
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:36:33 -0400
Received: from relay.sw.ru ([185.231.240.75]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ9k-0005xn-W4
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=GFETwEQ2pOKFwsfVAY3vkGj6h6qxlwMYoHVTykZaxKY=; b=FPNFXKcNdbYq
 xQe2UzRg/K9HuqKKkwSfoguCEkZI/CPyOL+xfG5PwFmlxoYWuhy2dt9JXQ5otiFFn+3V7p20JYEbx
 YhIeCtvO6UU8HYcrEijMrqlIKoRXfl+wiKO3OjERdLz9jnmF/45mvhjSQkbAJJAtvIyss4alEjNZN
 rheQU=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ99-0034yI-Og; Wed, 17 Mar 2021 19:35:48 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 9/9] migration/snap-tool: Implementation of snapshot
 loading in postcopy
Date: Wed, 17 Mar 2021 19:32:22 +0300
Message-Id: <20210317163222.182609-10-andrey.gruzdev@virtuozzo.com>
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

Implementation of asynchronous snapshot loading using standard
postcopy migration mechanism on destination VM.

The point of switchover to postcopy is trivially selected based on
percentage of non-zero pages loaded in precopy.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h  |  11 +
 qemu-snap-handlers.c | 482 ++++++++++++++++++++++++++++++++++++++++++-
 qemu-snap.c          |  16 ++
 3 files changed, 504 insertions(+), 5 deletions(-)

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
index f9f6db529f..4bf79e0964 100644
--- a/include/qemu-snap.h
+++ b/include/qemu-snap.h
@@ -30,6 +30,8 @@
 #define AIO_BUFFER_SIZE         (1024 * 1024)
 /* Max. concurrent AIO tasks */
 #define AIO_TASKS_MAX           8
+/* Max. concurrent AIO tasks in postcopy */
+#define AIO_TASKS_POSTCOPY_MAX  4
 
 typedef struct AioBufferPool AioBufferPool;
 
@@ -103,6 +105,7 @@ typedef struct SnapLoadState {
     BlockBackend *blk;          /* Block backend */
 
     QEMUFile *f_fd;             /* Outgoing migration stream QEMUFile */
+    QEMUFile *f_rp_fd;          /* Return path stream QEMUFile */
     QEMUFile *f_vmstate;        /* Block backend vmstate area QEMUFile */
     /*
      * Buffer to keep first few KBs of BDRV vmstate that we stashed at the
@@ -114,6 +117,14 @@ typedef struct SnapLoadState {
     /* AIO buffer pool */
     AioBufferPool *aio_pool;
 
+    bool postcopy;              /* From command-line --postcopy */
+    int postcopy_percent;       /* From command-line --postcopy */
+    bool in_postcopy;           /* Switched to postcopy mode */
+
+    /* Return path listening thread */
+    QemuThread rp_listen_thread;
+    bool has_rp_listen_thread;
+
     /* BDRV vmstate offset of RAM block list section */
     int64_t state_ram_list_offset;
     /* BDRV vmstate offset of the first device section */
diff --git a/qemu-snap-handlers.c b/qemu-snap-handlers.c
index 7dfe950829..ae581b3178 100644
--- a/qemu-snap-handlers.c
+++ b/qemu-snap-handlers.c
@@ -57,6 +57,16 @@ typedef struct RAMPageRef {
     int64_t page;               /* Page index in RAM block */
 } RAMPageRef;
 
+/* Page request from destination in postcopy */
+typedef struct RAMPageRequest {
+    RAMBlockDesc *block;        /* RAM block*/
+    int64_t offset;             /* Offset within RAM block */
+    unsigned size;              /* Size of request */
+
+    /* Link into ram_state.page_req */
+    QSIMPLEQ_ENTRY(RAMPageRequest) next;
+} RAMPageRequest;
+
 /* State reflecting RAM part of snapshot */
 typedef struct RAMState {
     int64_t page_size;          /* Page size */
@@ -64,6 +74,7 @@ typedef struct RAMState {
     int page_bits;              /* Page size bits */
 
     int64_t normal_pages;       /* Total number of normal (non-zero) pages */
+    int64_t precopy_pages;      /* Normal pages to load in precopy */
     int64_t loaded_pages;       /* Current number of normal pages loaded */
 
     /* Last RAM block touched by load_send_ram_iterate() */
@@ -73,9 +84,15 @@ typedef struct RAMState {
 
     /* Last RAM block sent by load_send_ram_iterate() */
     RAMBlockDesc *last_sent_block;
+    /* RAM block from last enqueued load-postcopy page request */
+    RAMBlockDesc *last_req_block;
 
     /* List of RAM blocks */
     QSIMPLEQ_HEAD(, RAMBlockDesc) ram_block_list;
+
+    /* Page request queue for load-postcopy */
+    QemuMutex page_req_mutex;
+    QSIMPLEQ_HEAD(, RAMPageRequest) page_req;
 } RAMState;
 
 /* Section handler ops */
@@ -801,6 +818,422 @@ static void load_check_file_errors(SnapLoadState *sn, int *res)
     }
 }
 
+static bool get_queued_page(RAMPageRef *p_ref)
+{
+    RAMState *rs = &ram_state;
+    RAMBlockDesc *block = NULL;
+    int64_t offset;
+
+    if (QSIMPLEQ_EMPTY_ATOMIC(&rs->page_req)) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&rs->page_req_mutex);
+
+    while (!QSIMPLEQ_EMPTY(&rs->page_req)) {
+        RAMPageRequest *entry = QSIMPLEQ_FIRST(&rs->page_req);
+
+        block = entry->block;
+        offset = entry->offset;
+
+        if (entry->size > rs->page_size) {
+            entry->size -= rs->page_size;
+            entry->offset += rs->page_size;
+        } else {
+            QSIMPLEQ_REMOVE_HEAD(&rs->page_req, next);
+            g_free(entry);
+        }
+
+        if (test_bit((offset >> rs->page_bits), block->bitmap)) {
+            p_ref->block = block;
+            p_ref->page = offset >> rs->page_bits;
+            return true;
+        }
+    }
+    return false;
+}
+
+static int queue_page_request(const char *id_str, int64_t offset, unsigned size)
+{
+    RAMState *rs = &ram_state;
+    RAMBlockDesc *block;
+    RAMPageRequest *new_entry;
+
+    if (!id_str) {
+        block = rs->last_req_block;
+        if (!block) {
+            error_report("RP-REQ_PAGES: no previous block");
+            return -EINVAL;
+        }
+    } else {
+        block = ram_block_by_idstr(id_str);
+        if (!block) {
+            error_report("RP-REQ_PAGES: cannot find block '%s'", id_str);
+            return -EINVAL;
+        }
+        rs->last_req_block = block;
+    }
+
+    if (offset + size > block->length) {
+        error_report("RP-REQ_PAGES: offset/size out RAM block end_offset=0x%" PRIx64
+                     " limit=0x%" PRIx64, (offset + size), block->length);
+        return -EINVAL;
+    }
+
+    new_entry = g_new0(RAMPageRequest, 1);
+    new_entry->block = block;
+    new_entry->offset = offset;
+    new_entry->size = size;
+
+    qemu_mutex_lock(&rs->page_req_mutex);
+    QSIMPLEQ_INSERT_TAIL(&rs->page_req, new_entry, next);
+    qemu_mutex_unlock(&rs->page_req_mutex);
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
+    SnapLoadState *sn = (SnapLoadState *) opaque;
+    QEMUFile *f = sn->f_rp_fd;
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
+        /* Make early check for input errors */
+        res = qemu_file_get_error(f);
+        if (res) {
+            break;
+        }
+
+        /* Check message type */
+        if (h_type >= MIG_RP_MSG_MAX || h_type == MIG_RP_MSG_INVALID) {
+            error_report("RP: received invalid message type=%d length=%d",
+                    h_type, h_len);
+            res = -EINVAL;
+            break;
+        }
+
+        /* Check message length */
+        if (rp_msg_args[h_type].len != -1 && h_len != rp_msg_args[h_type].len) {
+            error_report("RP: received '%s' message len=%d expected=%d",
+                    rp_msg_args[h_type].name, h_len, rp_msg_args[h_type].len);
+            res = -EINVAL;
+            break;
+        } else if (h_len > h_max_len) {
+            error_report("RP: received '%s' message len=%d max_len=%d",
+                    rp_msg_args[h_type].name, h_len, h_max_len);
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
+                error_report("RP: sibling shutdown error=%d", shut_error);
+            }
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
+                    /* RAM block ID string */
+                    id_len = h_buf[h_parsed_len];
+                    id_str = (char *) &h_buf[h_parsed_len + 1];
+                    id_str[id_len] = 0;
+
+                    h_parsed_len += id_len + 1;
+                }
+
+                if (h_parsed_len != h_len) {
+                    error_report("RP: received '%s' message len=%d expected=%d",
+                            rp_msg_args[MIG_RP_MSG_REQ_PAGES_ID].name,
+                            h_len, h_parsed_len);
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
+            error_report("RP: received unexpected message type=%d len=%d",
+                    h_type, h_len);
+            res = -EINVAL;
+        }
+    }
+
+    if (res >= 0) {
+        res = qemu_file_get_error(f);
+    }
+    if (res) {
+        error_report("RP: listen thread exit error=%d", res);
+    }
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
+static void send_ram_block_discard(QEMUFile *f, RAMBlockDesc *block)
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
+    /*
+     * We take discard range start offset for the RAM block
+     * from precopy-mode block->last_offset.
+     */
+    stq_be_p(msg_buf + msg_len, block->last_offset);
+    msg_len += 8;
+    /* Discard range length */
+    stq_be_p(msg_buf + msg_len, (block->length - block->last_offset));
+    msg_len += 8;
+
+    send_command(f, MIG_CMD_POSTCOPY_RAM_DISCARD, msg_len, msg_buf);
+}
+
+static int send_ram_each_block_discard(QEMUFile *f)
+{
+    RAMBlockDesc *block;
+    int res = 0;
+
+    QSIMPLEQ_FOREACH(block, &ram_state.ram_block_list, next) {
+        send_ram_block_discard(f, block);
+        res = qemu_file_get_error(f);
+        if (res) {
+            break;
+        }
+    }
+    return res;
+}
+
+static int load_prepare_postcopy(SnapLoadState *sn)
+{
+    QEMUFile *f = sn->f_fd;
+    uint64_t tmp[2];
+    int res;
+
+    /* Set number of pages to load in precopy before switching to postcopy */
+    ram_state.precopy_pages = ram_state.normal_pages *
+                              sn->postcopy_percent / 100;
+
+    /* Send POSTCOPY_ADVISE */
+    tmp[0] = cpu_to_be64(ram_state.page_size);
+    tmp[1] = cpu_to_be64(ram_state.page_size);
+    send_command(f, MIG_CMD_POSTCOPY_ADVISE, 16, (uint8_t *) tmp);
+    /* Open return path on destination */
+    send_command(f, MIG_CMD_OPEN_RETURN_PATH, 0, NULL);
+
+    /*
+     * Check file errors after POSTCOPY_ADVISE command since destination may already
+     * have closed input pipe in case postcopy had not been enabled in advance.
+     */
+    res = qemu_file_get_error(f);
+    if (!res) {
+        qemu_thread_create(&sn->rp_listen_thread, "return-path-thread",
+                rp_listen_thread, sn, QEMU_THREAD_JOINABLE);
+        sn->has_rp_listen_thread = true;
+    }
+    return res;
+}
+
+static int load_start_postcopy(SnapLoadState *sn)
+{
+    QIOChannelBuffer *bioc;
+    QEMUFile *fb;
+    int eof_pos;
+    uint32_t length;
+    int res = 0;
+
+    /*
+     * Send RAM discards for each block's unsent part. Without discards,
+     * userfault_fd code on destination will not trigger page requests
+     * as expected. Also, the UFFDIO_COPY/ZEROPAGE ioctl's that are used
+     * to place incoming page in postcopy would give an error if that page
+     * has not faulted with userfault_fd MISSING reason.
+     */
+    res = send_ram_each_block_discard(sn->f_fd);
+    if (res) {
+        return res;
+    }
+
+    /*
+     * To perform a switch to postcopy on destination, we need to send
+     * commands and the device state data in the following order:
+     *   * MIG_CMD_POSTCOPY_LISTEN
+     *   * device state sections
+     *   * MIG_CMD_POSTCOPY_RUN
+     * All of this has to be packaged into a single blob using
+     * MIG_CMD_PACKAGED command. While loading the device state we may
+     * trigger page transfer requests and the fd must be free to process
+     * those, thus the destination must read the whole device state off
+     * the fd before it starts processing it. To wrap it up in a package,
+     * we use QEMU buffer channel object.
+     */
+    bioc = qio_channel_buffer_new(512 * 1024);
+    qio_channel_set_name(QIO_CHANNEL(bioc), "snap-postcopy-buffer");
+    fb = qemu_fopen_channel_output(QIO_CHANNEL(bioc));
+    object_unref(OBJECT(bioc));
+
+    /* First goes MIG_CMD_POSTCOPY_LISTEN command */
+    send_command(fb, MIG_CMD_POSTCOPY_LISTEN, 0, NULL);
+
+    /* Then the rest of device state with optional VMDESC section.. */
+    file_transfer_bytes(fb, sn->f_vmstate,
+            (sn->state_eof - sn->state_device_offset));
+    qemu_fflush(fb);
+
+    /*
+     * VMDESC json section may be present at the end of the stream
+     * so we'll try to locate it and truncate trailer for postcopy.
+     */
+    eof_pos = bioc->usage - 1;
+    for (int offset = (bioc->usage - 11); offset >= 0; offset--) {
+        if (bioc->data[offset] == QEMU_VM_SECTION_FOOTER &&
+            bioc->data[offset + 5] == QEMU_VM_EOF &&
+            bioc->data[offset + 6] == QEMU_VM_VMDESCRIPTION) {
+            uint32_t json_length;
+            uint32_t expected_length = bioc->usage - (offset + 11);
+
+            json_length = be32_to_cpu(*(uint32_t  *) &bioc->data[offset + 7]);
+            if (json_length != expected_length) {
+                error_report("Corrupted VMDESC trailer: length=%" PRIu32
+                             " expected=%" PRIu32, json_length, expected_length);
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
+     * In postcopy we need to remove QEMU_VM_EOF token which normally goes
+     * after the last non-iterable device state section before the (optional)
+     * VMDESC json section. This is required to allow snapshot loading to
+     * continue in postcopy after we sent the rest of device state.
+     * VMDESC section also has to be removed from the stream if present.
+     */
+    if (eof_pos >= 0 && bioc->data[eof_pos] == QEMU_VM_EOF) {
+        bioc->usage = eof_pos;
+        bioc->offset = eof_pos;
+    }
+
+    /* And the final MIG_CMD_POSTCOPY_RUN */
+    send_command(fb, MIG_CMD_POSTCOPY_RUN, 0, NULL);
+
+    /* Now send that blob */
+    length = cpu_to_be32(bioc->usage);
+    send_command(sn->f_fd, MIG_CMD_PACKAGED, sizeof(length),
+            (uint8_t *) &length);
+    qemu_put_buffer_async(sn->f_fd, bioc->data, bioc->usage, false);
+    qemu_fflush(sn->f_fd);
+
+    /*
+     * We set lower limit on the number of AIO in-flight requests
+     * to reduce return path PAGE_REQ processing latencies.
+     */
+    aio_pool_set_max_in_flight(sn->aio_pool, AIO_TASKS_POSTCOPY_MAX);
+    /* Now in postcopy */
+    sn->in_postcopy = true;
+
+fail:
+    qemu_fclose(fb);
+    load_check_file_errors(sn, &res);
+    return res;
+}
+
 static int ram_load(QEMUFile *f, void *opaque, int version_id)
 {
     int compat_flags = (RAM_SAVE_FLAG_MEM_SIZE | RAM_SAVE_FLAG_EOS);
@@ -1007,11 +1440,23 @@ static void coroutine_fn load_buffers_fill_queue(SnapLoadState *sn)
     int64_t offset;
     int64_t limit;
     int64_t pages;
+    bool urgent;
 
-    if (!find_next_unsent_page(&p_ref)) {
+    /*
+     * First need to check if aio_pool_try_acquire_next() will
+     * succeed at least once since we can't revert get_queued_page().
+     */
+    if (!aio_pool_can_acquire_next(sn->aio_pool)) {
         return;
     }
 
+    urgent = get_queued_page(&p_ref);
+    if (!urgent) {
+        if (!find_next_unsent_page(&p_ref)) {
+            return;
+        }
+    }
+
     get_unsent_page_range(&p_ref, &block, &offset, &limit);
 
     do {
@@ -1033,7 +1478,7 @@ static void coroutine_fn load_buffers_fill_queue(SnapLoadState *sn)
         aio_buffer_start_task(buffer, load_buffers_task_co, bdrv_offset, size);
 
         offset += size;
-    } while (offset < limit);
+    } while (!urgent && (offset < limit));
 
     rs->last_block = block;
     rs->last_page = offset >> rs->page_bits;
@@ -1151,9 +1596,14 @@ static int load_send_leader(SnapLoadState *sn)
 
 static int load_send_complete(SnapLoadState *sn)
 {
-    /* Transfer device state to the output pipe */
-    file_transfer_bytes(sn->f_fd, sn->f_vmstate,
-            (sn->state_eof - sn->state_device_offset));
+    if (!sn->in_postcopy) {
+        /* Transfer device state to the output pipe */
+        file_transfer_bytes(sn->f_fd, sn->f_vmstate,
+                (sn->state_eof - sn->state_device_offset));
+    } else {
+        /* In postcopy send final QEMU_VM_EOF token */
+        qemu_put_byte(sn->f_fd, QEMU_VM_EOF);
+    }
     qemu_fflush(sn->f_fd);
     return 1;
 }
@@ -1266,6 +1716,11 @@ static int load_state_header(SnapLoadState *sn)
     return 0;
 }
 
+static bool load_switch_to_postcopy(SnapLoadState *sn)
+{
+    return ram_state.loaded_pages > ram_state.precopy_pages;
+}
+
 /* Load snapshot data and send it with outgoing migration stream */
 int coroutine_fn snap_load_state_main(SnapLoadState *sn)
 {
@@ -1283,11 +1738,22 @@ int coroutine_fn snap_load_state_main(SnapLoadState *sn)
     if (res) {
         goto fail;
     }
+    if (sn->postcopy) {
+        res = load_prepare_postcopy(sn);
+        if (res) {
+            goto fail;
+        }
+    }
 
     do {
         res = load_send_ram_iterate(sn);
         /* Make additional check for file errors */
         load_check_file_errors(sn, &res);
+
+        if (!res && sn->postcopy && !sn->in_postcopy &&
+                load_switch_to_postcopy(sn)) {
+            res = load_start_postcopy(sn);
+        }
     } while (!res);
 
     if (res == 1) {
@@ -1313,6 +1779,10 @@ void snap_ram_init_state(int page_bits)
 
     /* Initialize RAM block list head */
     QSIMPLEQ_INIT(&rs->ram_block_list);
+
+    /* Initialize load-postcopy page request queue */
+    qemu_mutex_init(&rs->page_req_mutex);
+    QSIMPLEQ_INIT(&rs->page_req);
 }
 
 /* Destroy snapshot RAM state */
@@ -1326,4 +1796,6 @@ void snap_ram_destroy_state(void)
         g_free(block->bitmap);
         g_free(block);
     }
+    /* Destroy page request mutex */
+    qemu_mutex_destroy(&ram_state.page_req_mutex);
 }
diff --git a/qemu-snap.c b/qemu-snap.c
index c5efbd6803..89fb918cfc 100644
--- a/qemu-snap.c
+++ b/qemu-snap.c
@@ -141,6 +141,10 @@ static void snap_load_destroy_state(void)
 {
     SnapLoadState *sn = snap_load_get_state();
 
+    if (sn->has_rp_listen_thread) {
+        qemu_thread_join(&sn->rp_listen_thread);
+    }
+
     if (sn->aio_pool) {
         aio_pool_free(sn->aio_pool);
     }
@@ -330,6 +334,7 @@ static int snap_load(SnapLoadParams *params)
 {
     SnapLoadState *sn;
     QIOChannel *ioc_fd;
+    QIOChannel *ioc_rp_fd;
     uint8_t *buf;
     size_t count;
     int res = -1;
@@ -338,11 +343,22 @@ static int snap_load(SnapLoadParams *params)
     snap_load_init_state();
     sn = snap_load_get_state();
 
+    sn->postcopy = params->postcopy;
+    sn->postcopy_percent = params->postcopy_percent;
+
     ioc_fd = qio_channel_new_fd(params->fd, NULL);
     qio_channel_set_name(QIO_CHANNEL(ioc_fd), "snap-channel-outgoing");
     sn->f_fd = qemu_fopen_channel_output(ioc_fd);
     object_unref(OBJECT(ioc_fd));
 
+    /* Open return path QEMUFile in case we shall use postcopy */
+    if (params->postcopy) {
+        ioc_rp_fd = qio_channel_new_fd(params->rp_fd, NULL);
+        qio_channel_set_name(QIO_CHANNEL(ioc_fd), "snap-channel-rp");
+        sn->f_rp_fd = qemu_fopen_channel_input(ioc_rp_fd);
+        object_unref(OBJECT(ioc_rp_fd));
+    }
+
     sn->blk = snap_open(params->filename, params->bdrv_flags);
     if (!sn->blk) {
         goto fail;
-- 
2.25.1


