Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAEF54DF9E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:02:15 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nGQ-0002SQ-KZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjs-0001xA-Nl
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:36 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjq-0001vt-4B
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:36 -0400
Received: by mail-lj1-x236.google.com with SMTP id y29so1002468ljd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVimrfo1WRRp/eG3/ytGXha95uSKgbpn29KOe/rszUE=;
 b=m4+1Fh9OQjF/7sTQ5ma1DrKT887sfNIIxvzyPVcHaFmM4sb2otAHbX+RJtOpJHDn90
 t54Kyzvba0eNaO9V2tFfDyW52MngkT/CdBfRdZy3dpKwXQs/g3g83FK3H7lHd1lOrMbS
 sMEW7IC3OJ5jPbSJDZ2Sbox0pnHF+Ca7cRfq+i+Zk74TnAQMkmCO4of+uJrKynQQlI82
 ulet5wuOLn8xDNeKUrFq9mQslnNCm34X/k4Zc+10/0SeKcIPT40LJnTZTe+p7PiDmRbD
 cq41fQ//aboJEOcIZ4ftYd1ULfkuLxoI+TYhJIFjX5sRWtsWo2eQg1U5YSQZAzEu8veI
 q6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVimrfo1WRRp/eG3/ytGXha95uSKgbpn29KOe/rszUE=;
 b=5+WAER2nAvkDhcjUCaRdagqn8A+F2YLxLgBhLrT6iEMdgbW+ck9VfXjqRVvBXByCmr
 z19f42MkE15mOfik2UwuSCIIkKwY2NJvTwYNiDa4Ah1d7iz71GHUCBL7QpzMicYqzUD5
 huectgAu/vbw7iLB6Te+rkh/E3+/j3EyQZ8ydyo736e7TnvpPT8KXO5Dh2FraKk2nU9T
 PTo4QD2vjR5FxfCS8QoNh4R/VO4Poqf2VjT0s+6d8ISygAzWLj1fn01DqbfCyI1Apku0
 3vmiYA7tStj2yorRuY+OkHRNpDNqxaqAriwOP8j3k6zGt7E5jpmi+23m18CW9Q2q5D8B
 7tYQ==
X-Gm-Message-State: AJIora/ydH/v1J2236e0Yr4Rk3ljOCqevPEf2IuBAY1+gI+a2L9Ym1VQ
 gsxtL4JOYCrpa92N4J0/K6qwTsxllGlsPKRt
X-Google-Smtp-Source: AGRyM1vE88JZ6Iz8FesJQIC7xWwtmggOd/pWdwcH6EwLkQLOhDOkE2ZO1UuBTioLUpxM8pfQHY21Bw==
X-Received: by 2002:a2e:8404:0:b0:250:cde7:e9e3 with SMTP id
 z4-20020a2e8404000000b00250cde7e9e3mr2159195ljg.289.1655375311967; 
 Thu, 16 Jun 2022 03:28:31 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:31 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 15/17] migration/snapshot: Save part implement
Date: Thu, 16 Jun 2022 13:28:09 +0300
Message-Id: <20220616102811.219007-16-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x236.google.com
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

Snapshot save are done in two stages. First tool save vmstate part. It must
be guaranteed that tool will get vmstate part only. This is because tool
won't parse this stream and will just save it non-modified.

Second stage is ram sending. Also it must be guarantee that ram part only will
be passed. Ram will be saved in qcow2 file.

The goal was to avoid duplicate same part of already existed migration code
so in this patch savevm handlers were used. Tool replace existed ram handler
with its own and after that call existed functions. It is work correctly
because algorithm of tool saving is similar to loadvm algorithm. I think
this isn't obvious part so it should be described here.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 include/qemu-snapshot.h   |  16 +-
 migration/qemu-snapshot.c | 323 +++++++++++++++++++++++++++++++++++++-
 migration/savevm.c        |  22 ++-
 migration/savevm.h        |   4 +
 qemu-snapshot.c           |  82 +++++++++-
 5 files changed, 435 insertions(+), 12 deletions(-)

diff --git a/include/qemu-snapshot.h b/include/qemu-snapshot.h
index be2557f6a0..a97abd9f25 100644
--- a/include/qemu-snapshot.h
+++ b/include/qemu-snapshot.h
@@ -21,6 +21,7 @@
 /* Backing cluster size */
 #define BDRV_CLUSTER_SIZE           (1024 * 1024)
 
+#define VMSTATE_SIZE                (1024 * 1024)
 /* Minimum supported target page size */
 #define PAGE_SIZE_MIN               4096
 /*
@@ -34,6 +35,8 @@
 /* RAM slice size for snapshot revert */
 #define SLICE_SIZE_REVERT           (16 * PAGE_SIZE_MAX)
 
+typedef struct QIOChannelBuffer QIOChannelBuffer;
+
 typedef struct StateInfo {
     int64_t page_size;
     int64_t page_mask;
@@ -44,9 +47,17 @@ typedef struct StateInfo {
 } StateInfo;
 
 typedef struct StateSaveCtx {
-    BlockBackend *blk;          /* Block backend */
+    BlockBackend *blk;              /* Block backend */
 
-    StateInfo state_parameters; /* Migration state info*/
+    QEMUFile *f_fd;                 /* QEMUFile for incoming stream */
+    QEMUFile *f_vmstate;            /* QEMUFile for vmstate backing */
+
+    QIOChannelBuffer *ioc_vmstate;  /* Buffer for vmstate */
+    QIOChannelBuffer *ioc_pages;    /* Page coalescing buffer */
+
+    StateInfo state_parameters;     /* Migration state info*/
+
+    size_t vmstate_len;             /* vmstate len */
 } StateSaveCtx;
 
 typedef struct StateLoadCtx {
@@ -60,6 +71,7 @@ void ram_destroy_state(void);
 StateSaveCtx *get_save_context(void);
 StateLoadCtx *get_load_context(void);
 int coroutine_fn save_state_main(StateSaveCtx *s);
+void save_vmstate(StateSaveCtx *s);
 int coroutine_fn load_state_main(StateLoadCtx *s);
 
 QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
diff --git a/migration/qemu-snapshot.c b/migration/qemu-snapshot.c
index 394c6acb77..2c9909fc8e 100644
--- a/migration/qemu-snapshot.c
+++ b/migration/qemu-snapshot.c
@@ -22,6 +22,8 @@
 #include "migration/savevm.h"
 #include "migration/ram.h"
 #include "qemu-snapshot.h"
+#include "migration/savevm.h"
+#include "migration/register.h"
 
 /* RAM block */
 /* TODO RAMBlock should be replace with existing struct RAMBlock in ram.c */
@@ -40,6 +42,11 @@ typedef struct RAMBlock {
     char idstr[256];            /* RAM block id string */
 } RAMBlock;
 
+typedef struct RAMPage {
+    RAMBlock *block;            /* RAM block containing the page */
+    int64_t offset;             /* Page offset in RAM block */
+} RAMPage;
+
 /* RAM transfer context */
 typedef struct RAMCtx {
     int64_t normal_pages;       /* Total number of normal pages */
@@ -51,6 +58,26 @@ typedef struct RAMCtx {
 
 static RAMCtx ram_ctx;
 
+static int64_t page_size;
+static int page_bits;
+static int64_t page_mask;
+static int64_t slice_size;
+static int slice_bits;
+static int64_t slice_mask;
+/*
+ * Init sufficient global variables
+ * TODO: These variables should be removed or add to existing global structures
+ */
+static void init_global_var(StateInfo *si)
+{
+    page_size = si->page_size;
+    page_bits = si->page_bits;
+    page_mask = si->page_mask;
+    slice_size = si->slice_size;
+    slice_bits = si->slice_bits;
+    slice_mask = si->slice_mask;
+}
+
 static inline
 bool ram_offset_in_block(RAMBlock *block, int64_t offset)
 {
@@ -158,6 +185,19 @@ static void ram_block_add(const char *idstr, int64_t size)
     QSIMPLEQ_INSERT_TAIL(&ram_ctx.ram_block_list, block, next);
 }
 
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
 /*
  * Assume that QEMUFile is migration stream and try to get
  * from f_src ram blocks list. mem_size is a total amount of bytes of whole
@@ -188,6 +228,9 @@ static int ram_block_list_from_stream(QEMUFile *f_src, int64_t mem_size)
         return -EINVAL;
     }
 
+    /* Initialize per-block bitmaps */
+    ram_block_list_init_bitmaps();
+
     return 0;
 }
 
@@ -210,12 +253,276 @@ static int ram_block_list_to_stream(QEMUFile *f_dest)
     return qemu_file_get_error(f_dest);
 }
 
-int coroutine_fn save_state_main(StateSaveCtx *s)
+static void save_state_check_errors(StateSaveCtx *s, int *res)
 {
-    /* TODO: implement */
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
+static int ram_save_page(StateSaveCtx *s, RAMPage *page, uint8_t *data)
+{
+    int64_t bdrv_offset;
+    int res = 0;
+
+    bdrv_offset = ram_bdrv_from_block_offset(page->block, page->offset);
+    if (bdrv_offset == INVALID_OFFSET) {
+        error_report("Corrupted RAM page");
+        return -EINVAL;
+    }
+
+    res = blk_pwrite(s->blk, bdrv_offset, data, page_size, 0);
+
+    res = MIN(res, 0);
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
+                error_report("Failed to get ram block form stream");
+                res = -EINVAL;
+                break;
+            }
+        }
+
+        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
+        case RAM_SAVE_FLAG_MEM_SIZE:
+            /* Get RAM block list */
+            if (ram_block_list_from_stream(f, offset) ||
+                ram_block_list_to_stream(s->f_vmstate)) {
+                error_report("Failed to get ram block list");
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
+                res = -EINVAL;
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
+            error_report("RAM page with unknown combination of flags 0x%x",
+                         flags);
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
+    return res;
+}
+
+static int save_section_config(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    uint32_t id_len;
+    uint8_t buf[256];
+
+    qemu_put_byte(s->f_vmstate, QEMU_VM_CONFIGURATION);
+
+    id_len = qemu_get_be32(f);
+    qemu_put_be32(s->f_vmstate, id_len);
+
+    if (id_len > 255) {
+        error_report("Corrupted configuration section");
+        return -EINVAL;
+    }
+
+    qemu_get_buffer(f, buf, id_len);
+    qemu_put_buffer(s->f_vmstate, buf, id_len);
+
+    buf[id_len] = '\0';
+    return 0;
+}
+
+static int save_state_header(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    QEMUFile *f_vmstate = s->f_vmstate;
+    uint32_t v;
+
+    /* Validate qemu magic */
+    v = qemu_get_be32(f);
+    if (v != QEMU_VM_FILE_MAGIC) {
+        error_report("Not a migration stream");
+        return -EINVAL;
+    }
+    qemu_put_be32(f_vmstate, v);
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
+    qemu_put_be32(f_vmstate, v);
     return 0;
 }
 
+static int save_completion(StateSaveCtx *s)
+{
+    uint8_t *ptr;
+    ptr = s->ioc_vmstate->data;
+    qemu_put_be64(s->f_vmstate, s->vmstate_len);
+    qemu_put_buffer(s->f_vmstate, ptr, s->vmstate_len);
+    return 0;
+}
+
+int coroutine_fn save_state_main(StateSaveCtx *s)
+{
+    QEMUFile *f = s->f_fd;
+    uint8_t section_type;
+    int res = 0;
+    SaveVMHandlers ram_ops;
+
+    init_global_var(&s->state_parameters);
+
+    ram_ops.load_state = ram_save;
+
+    res = qemu_replace_ram_handler((void *) &ram_ops, (void *) s);
+    if (res) {
+        error_report("Error replacing ram handler");
+        return res;
+    }
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
+        /* Read section type token */
+        section_type = qemu_get_byte(f);
+
+        switch (section_type) {
+        case QEMU_VM_CONFIGURATION:
+            res = save_section_config(s);
+            break;
+
+        /* We use already existed function which will call our handler */
+        case QEMU_VM_SECTION_FULL:
+        case QEMU_VM_SECTION_START:
+            res = qemu_loadvm_section_start_full(f, NULL);
+            break;
+
+        case QEMU_VM_SECTION_PART:
+        case QEMU_VM_SECTION_END:
+            res = qemu_loadvm_section_part_end(f, NULL);
+            break;
+
+        case QEMU_VM_EOF:
+            /* End of migration stream */
+            save_completion(s);
+            return res;
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
+}
+
+void save_vmstate(StateSaveCtx *s)
+{
+    size_t res;
+
+    qemu_put_be64(s->f_vmstate, 0);
+    res = qemu_fsplice_tail(s->f_vmstate, s->f_fd);
+
+    qemu_fclose(s->f_vmstate);
+    s->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(s->blk), 1);
+    qemu_put_be64(s->f_vmstate, res);
+}
+
 int coroutine_fn load_state_main(StateLoadCtx *s)
 {
     /* TODO: implement */
@@ -228,10 +535,20 @@ void ram_init_state(void)
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
diff --git a/migration/savevm.c b/migration/savevm.c
index 48603517ba..b722e51163 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2409,8 +2409,7 @@ static bool check_section_footer(QEMUFile *f, SaveStateEntry *se)
     return true;
 }
 
-static int
-qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
+int qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
 {
     uint32_t instance_id, version_id, section_id;
     SaveStateEntry *se;
@@ -2474,8 +2473,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
-static int
-qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
+int qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
     uint32_t section_id;
     SaveStateEntry *se;
@@ -2645,6 +2643,22 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
     return true;
 }
 
+int qemu_replace_ram_handler(void *ram_ops, void *opaque)
+{
+    /* Find savevm section and change it to tools handler */
+    SaveStateEntry *se = find_se("ram", 0);
+    if (se) {
+        unregister_savevm(NULL, se->idstr, se->opaque);
+    }
+
+    if (register_savevm_live("ram", 0, 4, (SaveVMHandlers *) ram_ops, opaque)) {
+        error_report("Error register snapshot tool ram handlers");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis)
 {
     uint8_t section_type;
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..9abfcd88e5 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,9 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis);
+int qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis);
+
+int qemu_replace_ram_handler(void *ram_ops, void *opaque);
 
 #endif
diff --git a/qemu-snapshot.c b/qemu-snapshot.c
index 683f1b265a..172a9596df 100644
--- a/qemu-snapshot.c
+++ b/qemu-snapshot.c
@@ -20,6 +20,7 @@
 #include "qapi/qmp/qdict.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/runstate.h"
 #include "qemu/cutils.h"
 #include "qemu/coroutine.h"
 #include "qemu/error-report.h"
@@ -91,7 +92,22 @@ static void init_save_context(void)
 
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
+    if (s->ioc_pages) {
+        object_unref(OBJECT(s->ioc_pages));
+    }
+    if (s->ioc_vmstate) {
+        object_unref(OBJECT(s->ioc_vmstate));
+    }
+
 }
 
 static void init_load_context(void)
@@ -132,7 +148,11 @@ static void enter_co_bh(void *opaque)
 static void coroutine_fn snapshot_save_co(void *opaque)
 {
     StateSaveCtx *s = get_save_context();
-    int res = -1;
+    QIOChannel *ioc_fd;
+    int res = 0;
+    size_t conf_size = 0;
+    size_t size;
+
     init_save_context();
 
     /* Block backend */
@@ -142,9 +162,65 @@ static void coroutine_fn snapshot_save_co(void *opaque)
         goto fail;
     }
 
-    res = save_state_main(s);
+    /*
+     * Check if we are saving vmstate or ram. We need ram to be separate
+     * from anything else.
+     */
+    if (!params.save_vmstate) {
+        /*
+         * We assume that we have saved vmstate stream.
+         * So now we need to remove some useless parts like header, magic
+         * number and conf section if it was saved.
+         */
+        s->ioc_vmstate = qio_channel_buffer_new(VMSTATE_SIZE);
+        qio_channel_set_name(QIO_CHANNEL(s->ioc_vmstate),
+                             "migration-vmstate-buffer");
+
+        s->f_vmstate = qemu_fopen_bdrv_vmstate(blk_bs(s->blk), 0);
+
+        qemu_file_set_blocking(s->f_vmstate, false);
+        size = qemu_get_be64(s->f_vmstate);
+
+        /* Here we will skip magic and version and check these numbers later */
+        qemu_get_be64(s->f_vmstate);
+
+        if (qemu_peek_byte(s->f_vmstate, 0) == QEMU_VM_CONFIGURATION) {
+            qemu_get_byte(s->f_vmstate);
+            /*
+             * 4 bytes are string length and last is string itself.
+             * That's why we need to add 5 to conf_size.
+             */
+            conf_size = qemu_get_be32(s->f_vmstate);
+            qemu_file_skip(s->f_vmstate, conf_size);
+            conf_size += 5;
+        }
+
+        /* 8 is 4+4 bytes - migration magic number and migration header. */
+        s->vmstate_len = size - 8 - conf_size;
+        qemu_get_buffer(s->f_vmstate, s->ioc_vmstate->data, s->vmstate_len);
+        qemu_fclose(s->f_vmstate);
+    }
+
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
+    s->state_parameters = *((StateInfo *) opaque);
+    if (params.save_vmstate) {
+        save_vmstate(s);
+    } else {
+        res = save_state_main(s);
+    }
     if (res) {
         error_report("Failed to save snapshot: %s", strerror(-res));
+    }
 
 fail:
     destroy_save_context();
-- 
2.31.1


