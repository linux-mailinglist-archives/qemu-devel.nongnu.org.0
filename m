Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54B54DFDC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:17:17 +0200 (CEST)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nUy-0006PY-Tc
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjv-00024q-3D
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:39 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjr-0001wF-OS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:38 -0400
Received: by mail-lj1-x22f.google.com with SMTP id s10so976995ljh.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GzYRRbvWfvhUQ0rCQp3mdxovXYJ7cK6kJcdswbCzh2g=;
 b=dUOR/Zi6m8EeUW2MGBY1iabkXLKJAyuczuRIydjeb8uGPH1yJO4dcrotqxSE6SpNYV
 ElcgDooMORtpwzBqrrunJP7Kc2YVCSEeXKVuhF8Dx2gHa2qhizBTrbbpJZDFu1Whl9pp
 oH06FXgUFIPocKBr66GANGOAf+A5itVQeCGsINsDKEDuGhSuxL7ilFm15ARxal2nYFXq
 +qVyllVuK+ZuVMmKQshIsOn2wvHrAV1hU87fI1kS3HinmZxYSvHCaQ8HvTTpvc5X/T5G
 JFD1p12ipY5CeeBTlJRDGFlSL4hj8FPs1OM1hH2fgBJqZ7EGKsj1X3XXDJZ9wfblNFu3
 MUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzYRRbvWfvhUQ0rCQp3mdxovXYJ7cK6kJcdswbCzh2g=;
 b=H/KAO9r5Ea8dYTaVjfJmMojSU55IB5oE/BDNxnEOaDZ3vr4tcYT2sabjzOF6NYYN5M
 Ie0XbRue/kd5qSUPnUNqsSJbtTqxJ+gMo98nVd54VJMs+ScTJiAHNcAaVddezV/bMGZN
 4ha/1emgCQKt9BNbN50+uyQkEP6HqUghC0t60/jMfceWp5nQeY/bE6K8b7cBRmFogSUj
 2Tcsl8zupwmswqT1MeLJetMIfR22I9SET9kIJ6l9zE4Dx8obsGW0vttTQe9hTbWfDPw+
 AnHk58+qqWKHs/q6Bq2GjZAhxEmYrf/kz1yfL+ku0+oRofEL9mqWEpaTcJfoz2Gopta+
 VxTw==
X-Gm-Message-State: AJIora/RmesnfT+3b83KfUm9RRTSbeE7xM18hEMvI+rw8wpsiKSrrmyX
 VtfNtBKyscm7jKw96bpXxT4abTxAN1U9cYUh
X-Google-Smtp-Source: AGRyM1sMwy552W/s3mC+jTsBe8oLCB3QVU14c77Sjt2XfoBZs7YFEevkm2aCPpSed6Y2mpywHj5sfQ==
X-Received: by 2002:a2e:9047:0:b0:255:70eb:9634 with SMTP id
 n7-20020a2e9047000000b0025570eb9634mr2120565ljg.521.1655375313732; 
 Thu, 16 Jun 2022 03:28:33 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:33 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 17/17] migration/snapshot: Postcopy load implemented
Date: Thu, 16 Jun 2022 13:28:11 +0300
Message-Id: <20220616102811.219007-18-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

It is a modified load part from previous patch.

Implemented new rp listen thread for snapshot-tool. Also implemented
functions for starting postcopy.

This mode can be turned on by specifying --postcopy flag.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 include/qemu-snapshot.h   |  12 ++
 migration/migration.c     | 123 +++++++++++++++++++
 migration/migration.h     |   1 +
 migration/qemu-snapshot.c | 249 +++++++++++++++++++++++++++++++++++++-
 migration/savevm.c        |  25 ++++
 migration/savevm.h        |   4 +
 qemu-snapshot.c           |  10 ++
 7 files changed, 422 insertions(+), 2 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index 74885c03bb..b0f235747f 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -65,6 +65,15 @@ typedef struct StateLoadCtx {
     QEMUFile *f_fd;
     QEMUFile *f_vmstate;
 
+    /* Postcopy part */
+    bool postcopy;
+    bool in_postcopy;
+
+    /* Return path part */
+    QemuThread rp_listen_thread;
+    QEMUFile *f_rp_fd;
+    bool has_rp_listen_thread;
+
     StateInfo state_parameters;
 } StateLoadCtx;
 
@@ -76,6 +85,9 @@ int coroutine_fn save_state_main(StateSaveCtx *s);
 void save_vmstate(StateSaveCtx *s);
 int coroutine_fn load_state_main(StateLoadCtx *s);
 
+int queue_page_request(const char *idstr, uint64_t offset,
+                       uint32_t size);
+
 QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
 void qemu_fsplice(QEMUFile *f_dst, QEMUFile *f_src, size_t size);
 size_t qemu_fsplice_tail(QEMUFile *f_dst, QEMUFile *f_src);
diff --git a/migration/migration.c b/migration/migration.c
index 6528b3ad41..6f82e8ea48 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "qemu-snapshot.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -3517,6 +3518,128 @@ static MigThrError postcopy_pause(MigrationState *s)
     }
 }
 
+/*
+ * Return-path message processing thread for qemu-snapshot tool
+ */
+void *qemu_snapshot_rp_listen_thread(void *opaque)
+{
+    QEMUFile *f = (QEMUFile *) opaque;
+    int res = 0;
+    uint64_t pages = 0;
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
+        if (rp_cmd_args[h_type].len != -1 && h_len != rp_cmd_args[h_type].len) {
+            error_report("RP: received %s message len %d expected %ld",
+                         rp_cmd_args[h_type].name,
+                         h_len, rp_cmd_args[h_type].len);
+            res = -EINVAL;
+            break;
+        } else if (h_len > h_max_len) {
+            error_report("RP: received %s message len %d max_len %d",
+                         rp_cmd_args[h_type].name, h_len, h_max_len);
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
+            pages++;
+            uint64_t offset;
+            uint32_t size;
+            char *id_str = NULL;
+
+            offset = be64_to_cpu(*(uint64_t *) (h_buf + 0));
+            size = be32_to_cpu(*(uint32_t *) (h_buf + 8));
+
+            if (h_type == MIG_RP_MSG_REQ_PAGES_ID) {
+                int h_parsed_len = rp_cmd_args[MIG_RP_MSG_REQ_PAGES].len;
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
+                                 rp_cmd_args[MIG_RP_MSG_REQ_PAGES_ID].name,
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
 static MigThrError migration_detect_error(MigrationState *s)
 {
     int ret;
diff --git a/migration/migration.h b/migration/migration.h
index 5c43788a2b..fd6f8d3083 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -433,4 +433,5 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
+void *qemu_snapshot_rp_listen_thread(void *opaque);
 #endif
diff --git a/migration/qemu-snapshot.c b/migration/qemu-snapshot.c
index 280f5be25c..8090c7032d 100644
--- a/migration/qemu-snapshot.c
+++ b/migration/qemu-snapshot.c
@@ -44,6 +44,16 @@ typedef struct RAMBlock {
     char idstr[256];            /* RAM block id string */
 } RAMBlock;
 
+/* Page request from destination in postcopy */
+typedef struct RAMPageRequest {
+    RAMBlock *block;
+    int64_t offset;
+    unsigned size;
+
+    /* Link into ram_ctx.page_req */
+    QSIMPLEQ_ENTRY(RAMPageRequest) next;
+} RAMPageRequest;
+
 typedef struct RAMPage {
     RAMBlock *block;            /* RAM block containing the page */
     int64_t offset;             /* Page offset in RAM block */
@@ -57,6 +67,11 @@ typedef struct RAMCtx {
     QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
     RAMPage last_page;
     RAMBlock *last_sent_block;
+
+    /* Page request queue for postcopy */
+    QemuMutex page_req_mutex;
+    QSIMPLEQ_HEAD(, RAMPageRequest) page_req;
+    RAMBlock *last_req_block;
 } RAMCtx;
 
 static RAMCtx ram_ctx;
@@ -627,6 +642,143 @@ static int ram_send_setup(QEMUFile *f, void *opaque)
     return res;
 }
 
+static int send_each_ram_block_discard(QEMUFile *f)
+{
+    RAMBlock *block;
+    int res = 0;
+    uint64_t start;
+    uint64_t len;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        start = block->discard_offset;
+        len = block->length - block->discard_offset;
+        qemu_savevm_send_postcopy_ram_discard(f, block->idstr, 1, &start, &len);
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
+    int res = 0;
+
+    res = qemu_snapshot_postcopy_prepare(s->f_fd, page_size, page_size);
+
+    if (!res) {
+        qemu_thread_create(&s->rp_listen_thread, "rp_thread",
+                           qemu_snapshot_rp_listen_thread, s->f_rp_fd,
+                           QEMU_THREAD_JOINABLE);
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
+        error_report("here");
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
+    qemu_savevm_send_postcopy_listen(fb);
+
+    /* The rest of non-iterable device state with an optional vmdesc section */
+    send_vmstate(s->f_vmstate, fb);
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
+    qemu_savevm_send_postcopy_run(fb);
+
+    /* Now send that blob */
+    qemu_savevm_send_packaged(s->f_fd, bioc->data, bioc->usage);
+    qemu_fflush(s->f_fd);
+
+    s->in_postcopy = true;
+fail:
+    qemu_fclose(fb);
+    load_state_check_errors(s, &res);
+
+    return res;
+}
+
 static bool find_next_page(RAMPage *page)
 {
     RAMCtx *ram = &ram_ctx;
@@ -709,6 +861,74 @@ void clear_page_range(RAMPage *page, int64_t length)
                  ((length - 1) >> slice_bits) + 1);
 }
 
+int queue_page_request(const char *idstr, uint64_t offset,
+                       uint32_t size)
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
+static bool get_queued_page(RAMPage *page) {
+    RAMCtx *ram = &ram_ctx;
+
+    if (QSIMPLEQ_EMPTY_ATOMIC(&ram->page_req)) {
+        return false;
+    }
+
+    QEMU_LOCK_GUARD(&ram->page_req_mutex);
+    if (!QSIMPLEQ_EMPTY(&ram->page_req)) {
+        RAMPageRequest *entry = QSIMPLEQ_FIRST(&ram->page_req);
+        RAMBlock *block = entry->block;
+        int64_t slice = entry->offset >> slice_bits;
+
+        QSIMPLEQ_REMOVE_HEAD(&ram->page_req, next);
+        g_free(entry);
+
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
 static int coroutine_fn ram_load_pages(StateLoadCtx *s)
 {
     RAMCtx *ram = &ram_ctx;
@@ -718,8 +938,9 @@ static int coroutine_fn ram_load_pages(StateLoadCtx *s)
     int64_t blk_offset, slice_offset, bdrv_offset;
     ssize_t res;
     int64_t flags = RAM_SAVE_FLAG_CONTINUE;
+    bool urgent = get_queued_page(&page);
 
-    if (!find_next_page(&page)) {
+    if (!urgent && !find_next_page(&page)) {
         return 0;
     }
 
@@ -835,6 +1056,20 @@ int coroutine_fn load_state_main(StateLoadCtx *s)
         goto fail;
     }
 
+    if (s->postcopy) {
+        res = prepare_postcopy(s);
+        if (res) {
+            error_report("Prepare postcopy failed");
+            goto fail;
+        }
+        /* TODO: Add condition to start postcopy during the cycle below */
+        res = start_postcopy(s);
+        if (res) {
+            error_report("Postcopy start failed");
+            goto fail;
+        }
+    }
+
     do {
         res = qemu_savevm_state_iterate(s->f_fd, false);
         /* Check for file errors */
@@ -845,8 +1080,11 @@ int coroutine_fn load_state_main(StateLoadCtx *s)
         goto fail;
     }
 
+    /* If tool is in posctopy mode then vmstate have been already sent */
+    if (!s->in_postcopy) {
+        send_vmstate(s->f_vmstate, s->f_fd);
+    }
 
-    send_vmstate(s->f_vmstate, s->f_fd);
     qemu_put_byte(s->f_fd, QEMU_VM_EOF);
     qemu_fflush(s->f_fd);
 fail:
@@ -865,6 +1103,10 @@ void ram_init_state(void)
 
     /* Initialize RAM block list head */
     QSIMPLEQ_INIT(&ram->ram_block_list);
+
+    /* Initialize postcopy page request queue */
+    qemu_mutex_init(&ram->page_req_mutex);
+    QSIMPLEQ_INIT(&ram->page_req);
 }
 
 /* Destroy snapshot RAM state */
@@ -878,4 +1120,7 @@ void ram_destroy_state(void)
         g_free(block->bitmap);
         g_free(block);
     }
+
+    /* Destroy page request mutex */
+    qemu_mutex_destroy(&ram_ctx.page_req_mutex);
 }
diff --git a/migration/savevm.c b/migration/savevm.c
index b722e51163..b1320bd813 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3356,3 +3356,28 @@ void qmp_snapshot_delete(const char *job_id,
 
     job_start(&s->common);
 }
+
+/* Do preparation before qemu-snapshot tool start postcopy */
+int qemu_snapshot_postcopy_prepare(QEMUFile *f_dest,
+                                   uint64_t sps,
+                                   uint64_t tps)
+{
+    uint64_t tmp[2];
+    int res;
+
+    /* Send POSTCOPY_ADVISE */
+    tmp[0] = cpu_to_be64(sps);
+    tmp[1] = cpu_to_be64(tps);
+    qemu_savevm_command_send(f_dest, MIG_CMD_POSTCOPY_ADVISE, 16, (uint8_t *) tmp);
+
+    /* Open return path on destination */
+    qemu_savevm_command_send(f_dest, MIG_CMD_OPEN_RETURN_PATH, 0, NULL);
+
+    /*
+     * Check for file errors after sending POSTCOPY_ADVISE command
+     * since destination may already have closed input pipe in case
+     * postcopy had not been enabled in advance.
+     */
+    res = qemu_file_get_error(f_dest);
+    return res;
+}
diff --git a/migration/savevm.h b/migration/savevm.h
index 9abfcd88e5..94b6f60496 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -72,4 +72,8 @@ int qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis);
 
 int qemu_replace_ram_handler(void *ram_ops, void *opaque);
 
+int qemu_snapshot_postcopy_prepare(QEMUFile *f_dest,
+                                   uint64_t sps,
+                                   uint64_t tps);
+
 #endif
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index 04bda74fb4..893086eb8a 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -239,6 +239,7 @@ static void coroutine_fn snapshot_load_co(void *opaque)
     StateLoadCtx *s = get_load_context();
     int res;
     QIOChannel *ioc_fd;
+    QIOChannel *ioc_rp_fd;
 
     init_load_context();
 
@@ -260,8 +261,17 @@ static void coroutine_fn snapshot_load_co(void *opaque)
     object_unref(OBJECT(ioc_fd));
     qemu_file_set_blocking(s->f_fd, false);
 
+    /* qemufile on return path fd if we are going to use postcopy */
+    if (params.postcopy) {
+        ioc_rp_fd = qio_channel_new_fd(params.rp_fd, NULL);
+        qio_channel_set_name(QIO_CHANNEL(ioc_fd), "migration-channel-rp");
+        s->f_rp_fd = qemu_fopen_channel_input(ioc_rp_fd);
+        object_unref(OBJECT(ioc_rp_fd));
+    }
+
     s->state_parameters = *((StateInfo *) opaque);
 
+    s->postcopy = params.postcopy;
     res = load_state_main(s);
     if (res) {
         error_report("Failed to load snapshot: %s", strerror(-res));
-- 
2.31.1


