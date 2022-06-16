Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAFD54DFC8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:10:57 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nOq-0008An-Rw
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjs-0001xt-TX
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:36 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjq-0001vx-LF
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:36 -0400
Received: by mail-lf1-x12e.google.com with SMTP id s6so1499864lfo.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtfwv5FW5SYi1oLqpOCVVCwtMJInI2gPXO7aN4ubWYU=;
 b=F2UnB8vV9dB7wm7Dq/e0nHMu+v46318MtA4KOhtsYli0JN1gamvdKGWM+VecjsIQBJ
 YJvwS1n5hb83OxQuBlyU23J7OputXDziWzhusmWOQyF3Gh5z8jt4/vjtpPnJsx7DcOcj
 CxWfGS8Rk42vpwbgIHcUIfqftAsPuBFqbKjiQd0v1AWi2Ve81t7BA7b9uuCHephNB7la
 totjsQYatylfR41aj7pmoav+tNQx5cNJSeNncvESeiyueCuSBGnmKRRFMc0IYrB2GIX7
 z82gHRqIc1Y4Q2++1DLGQaLYliPyuCoNvQDg1e2CRSuh8f4/sj3MzUp//ZGxqUG24bN6
 ZKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtfwv5FW5SYi1oLqpOCVVCwtMJInI2gPXO7aN4ubWYU=;
 b=0C39dWljJMgNlxVTzvYnFeLIRMS/GrhB3jAqxUKaVxiLpMfuATDiz9qeDUVZc3kwC3
 s4exrl1JpR2vxQ2qdos6kEYtjQTs/lB67WsrXE+2LB0GMVZDzxBq+Ncy3YGCblT9eKGg
 jDH0KWKnwiuv3J+2iqn+qV2sHg7isEavR9T9oT3dHfy31uq9XybBMf5gFm+X3Fz3/fyj
 YOVj2hpmnvVyjtruDGeBlOaOfuP5P4mGxzhfhh+Jcd1L+Jia+AnM6o/w2rxZJcXCFdkr
 kz9hjQMA1kiKv4Ii7CnpNtVspMAShHRz9GGRxVBDyEtlKHTn+yGt8C+sZ6xMt8qwuDtC
 vADw==
X-Gm-Message-State: AJIora+lQWihFaMrbTYXKGCX+PsBINisroMXhYfRp+aX7XzAsJGXDSas
 TsA4BriqBdGu9eNeFH65AnWh8yiJOKq5JjYC
X-Google-Smtp-Source: AGRyM1vzVPDxcH0L+M68xzQwml/Kg5K0wPvaJl23zZOnh9E1ffY4Be7OHWdiXCcjFAxWZuydnltq/Q==
X-Received: by 2002:a05:6512:2304:b0:47c:5268:5021 with SMTP id
 o4-20020a056512230400b0047c52685021mr2363741lfu.369.1655375312888; 
 Thu, 16 Jun 2022 03:28:32 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:32 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 16/17] migration/snapshot: Precopy load implemented
Date: Thu, 16 Jun 2022 13:28:10 +0300
Message-Id: <20220616102811.219007-17-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12e.google.com
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

Load snapshot from qcow2 file. This part also work only with ram part
and send vmstate part as it was saved previously without parsing.

Here also migration code was reused but now it is savevm part. Tool replace
ram handlers as it did before in tool save part but now it is also needed to
avoid using another handlers. That is where stream-content-list is used
it helps to "disable" all handlers except ram.

Also here slices were used to increase efficiency of reading from disk.
So when tool will need to read a page from block it will read a number
of pages and send them all.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 include/qemu-snapshot.h   |   4 +-
 migration/qemu-snapshot.c | 333 +++++++++++++++++++++++++++++++++++++-
 qemu-snapshot.c           |  25 ++-
 3 files changed, 356 insertions(+), 6 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index a97abd9f25..74885c03bb 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -62,8 +62,10 @@ typedef struct StateSaveCtx {
 
 typedef struct StateLoadCtx {
     BlockBackend *blk;          /* Block backend */
+    QEMUFile *f_fd;
+    QEMUFile *f_vmstate;
 
-    StateInfo state_parameters; /* Migration state info*/
+    StateInfo state_parameters;
 } StateLoadCtx;
 
 void ram_init_state(void);
diff --git a/migration/qemu-snapshot.c b/migration/qemu-snapshot.c
index 2c9909fc8e..280f5be25c 100644
--- a/migration/qemu-snapshot.c
+++ b/migration/qemu-snapshot.c
@@ -21,9 +21,11 @@
 #include "migration/qemu-file.h"
 #include "migration/savevm.h"
 #include "migration/ram.h"
+#include "migration/migration.h"
 #include "qemu-snapshot.h"
 #include "migration/savevm.h"
 #include "migration/register.h"
+#include "qapi/qapi-types-migration.h"
 
 /* RAM block */
 /* TODO RAMBlock should be replace with existing struct RAMBlock in ram.c */
@@ -53,7 +55,8 @@ typedef struct RAMCtx {
 
     /* RAM block list head */
     QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
-
+    RAMPage last_page;
+    RAMBlock *last_sent_block;
 } RAMCtx;
 
 static RAMCtx ram_ctx;
@@ -523,12 +526,336 @@ void save_vmstate(StateSaveCtx *s)
     qemu_put_be64(s->f_vmstate, res);
 }
 
-int coroutine_fn load_state_main(StateLoadCtx *s)
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
+static int send_conf(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_vmstate;
+    uint32_t id_len;
+    uint8_t buf[256];
+
+    qemu_put_byte(s->f_fd, QEMU_VM_CONFIGURATION);
+    id_len = qemu_get_be32(f);
+    qemu_put_be32(s->f_fd, id_len);
+
+    if (id_len > 255) {
+        error_report("Corrupted configuration section");
+        return -EINVAL;
+    }
+
+    qemu_get_buffer(f, buf, id_len);
+    qemu_put_buffer(s->f_fd, buf, id_len);
+    buf[id_len] = '\0';
+
+    return 0;
+}
+
+static int send_header(StateLoadCtx *s)
+{
+    QEMUFile *f = s->f_vmstate;
+    uint32_t v;
+
+    /* Validate magic */
+    v = qemu_get_be32(f);
+    if (v != QEMU_VM_FILE_MAGIC) {
+        error_report("Not a valid snapshot");
+         return -EINVAL;
+    }
+    qemu_put_be32(s->f_fd, v);
+
+    v = qemu_get_be32(f);
+    if (v == QEMU_VM_FILE_VERSION_COMPAT) {
+        error_report("SaveVM v2 format is obsolete");
+        return -EINVAL;
+    }
+    qemu_put_be32(s->f_fd, v);
+
+    return 0;
+}
+
+static int load_state_ramlist(StateLoadCtx *s)
 {
-    /* TODO: implement */
+    uint64_t size = qemu_get_be64(s->f_vmstate);
+    size = size & (~RAM_SAVE_FLAG_MEM_SIZE);
+    return ram_block_list_from_stream(s->f_vmstate, size);
+}
+
+static int send_setup(StateLoadCtx *s)
+{
+    /* We need to enable only ram using parameter stream-content-list */
+    qemu_savevm_state_setup(s->f_fd);
+
+    ram_block_list_init_bitmaps();
+
     return 0;
 }
 
+/* No need to parse vmstate part, we just send it using known offset */
+static int send_vmstate(QEMUFile *f_vmstate, QEMUFile *f_dest)
+{
+    /* Send vmstate without last byte because it is QEMU_VM_EOF */
+    size_t len;
+    len = qemu_get_be64(f_vmstate);
+    qemu_fsplice(f_dest, f_vmstate, len);
+
+    return 0;
+}
+
+static int ram_send_setup(QEMUFile *f, void *opaque)
+{
+    int res = ram_block_list_to_stream(f);
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return res;
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
+static void get_page_range(RAMPage *page, int64_t *length)
+{
+    int64_t start_slice;
+    int64_t end_slice;
+    int64_t tmp;
+
+    assert(QEMU_IS_ALIGNED(page->offset, slice_size));
+
+    start_slice = page->offset >> slice_bits;
+    end_slice = find_next_zero_bit(page->block->bitmap, page->block->nr_slices,
+                                   page->offset >> slice_bits);
+
+    tmp = (end_slice - start_slice) << slice_bits;
+    *length = page->block->length - page->offset;
+    *length = MIN(*length, tmp);
+
+    /*
+     * Length is always aligned to slice_size with the exception of case
+     * when it is the last slice in RAM block.
+     */
+    *length = MIN(slice_size, *length);
+}
+
+static inline
+void clear_page_range(RAMPage *page, int64_t length)
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
+static int coroutine_fn ram_load_pages(StateLoadCtx *s)
+{
+    RAMCtx *ram = &ram_ctx;
+    RAMPage page;
+    int64_t length;
+    uint8_t *data;
+    int64_t blk_offset, slice_offset, bdrv_offset;
+    ssize_t res;
+    int64_t flags = RAM_SAVE_FLAG_CONTINUE;
+
+    if (!find_next_page(&page)) {
+        return 0;
+    }
+
+    /* Get range of contiguous pages that were not transferred yet */
+    get_page_range(&page, &length);
+    /* Clear range of pages to be queued for I/O */
+    clear_page_range(&page, length);
+
+    /* Used by find_next_page() */
+    ram->last_page.block = page.block;
+    ram->last_page.offset = page.offset + length;
+
+    /* Read found slice from block */
+    bdrv_offset = ram_bdrv_from_block_offset(page.block, page.offset);
+    data = (uint8_t *) qemu_blockalign(blk_bs(s->blk), length);
+    res = blk_pread(s->blk, bdrv_offset, data, length);
+
+    if (res < 0) {
+        error_report("Read from file failed");
+        return res;
+    }
+
+    /* Send slice to destination */
+    slice_offset = 0;
+    while (length > slice_offset) {
+        if (!ram_bdrv_offset_in_block(ram->last_sent_block, bdrv_offset)) {
+            ram->last_sent_block = page.block;
+            flags = 0;
+        }
+
+        blk_offset = ram_block_offset_from_bdrv(ram->last_sent_block,
+                                                slice_offset + bdrv_offset);
+        qemu_put_be64(s->f_fd, blk_offset | RAM_SAVE_FLAG_PAGE | flags);
+        if (!flags) {
+            qemu_put_counted_string(s->f_fd, page.block->idstr);
+        }
+        qemu_put_buffer(s->f_fd, data + slice_offset, page_size);
+        slice_offset += page_size;
+        qemu_fflush(s->f_fd);
+    }
+    qemu_fflush(s->f_fd);
+    return 1;
+}
+
+static int ram_load_iterate(QEMUFile *f, void *opaque)
+{
+    StateLoadCtx *s = (StateLoadCtx *) opaque;
+    int res;
+
+    res = ram_load_pages(s);
+
+    /* Zero retcode means that there're no more pages to load */
+    if (res >= 0) {
+        res = res ? 0 : 1;
+    }
+
+    /* Send EOS flag before section footer */
+    qemu_put_be64(s->f_fd, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(s->f_fd);
+
+    return res;
+}
+
+static bool is_active_ram(void *opaque)
+{
+    return true;
+}
+
+int coroutine_fn load_state_main(StateLoadCtx *s)
+{
+    int res;
+    MigrationState *ms = migrate_get_current();
+    SaveVMHandlers ram_ops;
+
+    init_global_var(&s->state_parameters);
+
+    strList *list = g_malloc(sizeof(strList));
+    list->value = g_malloc(sizeof("ram"));
+    list->next = NULL;
+    memcpy(list->value, "ram", sizeof("ram"));
+
+    ms->parameters.has_stream_content_list = true;
+    ms->parameters.stream_content_list = list;
+    ms->send_section_footer = true;
+
+    ram_ops.save_setup = ram_send_setup;
+    ram_ops.save_live_iterate = ram_load_iterate;
+    ram_ops.is_active = is_active_ram;
+    ram_ops.is_active_iterate = NULL;
+
+    res = qemu_replace_ram_handler((void *) &ram_ops, (void *) s);
+
+    res = send_header(s);
+    if (res) {
+        goto fail;
+    }
+    if (qemu_peek_byte(s->f_vmstate, 0) == QEMU_VM_CONFIGURATION) {
+        qemu_get_byte(s->f_vmstate);
+        res = send_conf(s);
+        if (res) {
+            goto fail;
+        }
+    }
+
+    res = load_state_ramlist(s);
+    if (res) {
+        goto fail;
+    }
+
+    res = send_setup(s);
+    if (res) {
+        error_report("Send setup failed");
+        goto fail;
+    }
+
+    do {
+        res = qemu_savevm_state_iterate(s->f_fd, false);
+        /* Check for file errors */
+        load_state_check_errors(s, &res);
+    } while (!res);
+
+    if (res < 0) {
+        goto fail;
+    }
+
+
+    send_vmstate(s->f_vmstate, s->f_fd);
+    qemu_put_byte(s->f_fd, QEMU_VM_EOF);
+    qemu_fflush(s->f_fd);
+fail:
+    load_state_check_errors(s, &res);
+
+    /* Replace positive retcode with 0 */
+    return MIN(res, 0);
+}
+
 /* Initialize snapshot RAM state */
 void ram_init_state(void)
 {
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index 172a9596df..04bda74fb4 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -117,7 +117,14 @@ static void init_load_context(void)
 
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
 }
 
 static BlockBackend *image_open_opts(const char *optstr, QDict *options,
@@ -230,7 +237,8 @@ fail:
 static void coroutine_fn snapshot_load_co(void *opaque)
 {
     StateLoadCtx *s = get_load_context();
-    int res = -1;
+    int res;
+    QIOChannel *ioc_fd;
 
     init_load_context();
 
@@ -241,6 +249,19 @@ static void coroutine_fn snapshot_load_co(void *opaque)
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
+    s->state_parameters = *((StateInfo *) opaque);
+
     res = load_state_main(s);
     if (res) {
         error_report("Failed to load snapshot: %s", strerror(-res));
-- 
2.31.1


