Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E154DF80
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:51:33 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n64-0007zP-5x
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjq-0001rg-QI
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:34 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjo-0001ve-IT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:34 -0400
Received: by mail-lj1-x232.google.com with SMTP id y29so1002409ljd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJ7+MX4Kqnm+nK5yrjeUKJvlApxuSFy4g1bDKgqMtkM=;
 b=7Qf9jQEMlBgMKVaWrCX5RNsqPY9Dt8n1CgZ0nSfSPVkIwnRCxqWg+StKjtHCUHe50n
 aowB2iwXdUUTv99QuyeeecdvsxU6wWssFrWVc7SGXYjxdrr+J4nw2ze9mzK0aH4VZGiQ
 tt/1SfHr9yoKa8YSXy083etzTJC0lmQ0Wr7MydH2L/z4oDazc7oGHVTyS5rN0WIDDlh8
 DOkEUGq5ubR5UvfUhE5sKZanIQNNKo3uXpBpmnFsl3VKsOOZNqtMvjcLTYZPiYkg+Na4
 i1PDFeNQvS2JGwKpGLpF4w7IIQOgRu0UDkuz/izfPy6/kmPc9Y3p5YeQ1b35fGOMVOvB
 sZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJ7+MX4Kqnm+nK5yrjeUKJvlApxuSFy4g1bDKgqMtkM=;
 b=oaSzW55UFYvr7dY41wx/OxrlDmk/ge5zp4tpJejMCuygX0mlhmCZ/MujSmLiHDlv3e
 XgmQV6vwmElwVZ2l/RdRecv7LnP2nKRxxK2ZcPC1vToogb5FnxhgpMNY/O4OWlxKeP+I
 qPEgbV0KXqof1e+IB1A19zZdpbUOORmVtPhYGkwf0SfP/Egi3aPEZ+1CF8E4GtN9jpsv
 3N9UUzxDVZkZFEjW7iKTvy24A7/O6QNXZbQ6htEzV8J/F9JwiMYKCIukIWSWbCQ+f7c2
 y/7xVlAwuTH5U7qjRzGdgBNnHRzsp5xNRYkVSfFTkCfay+h8ALWwFY8dhV93n5C3FSoA
 5vxw==
X-Gm-Message-State: AJIora8pd4jQpZQvChOwss+PgfA8ELS8u0qYhFUws8geKjRzHiHkhHA2
 SMbwCA5rehZ+fFfzXMAE7VRpuGWU9M7Z48m0
X-Google-Smtp-Source: AGRyM1vu1Ab4oFkM5jMh/0T5xIhCWDlRW8p0IdWxtACQ4+A0HriJOdxQWzqT1efAXPprQOKhm6b1ag==
X-Received: by 2002:a2e:819a:0:b0:255:615c:6570 with SMTP id
 e26-20020a2e819a000000b00255615c6570mr2062917ljg.17.1655375310852; 
 Thu, 16 Jun 2022 03:28:30 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:30 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 14/17] migration/snpashot: Implement API for RAMBlock
Date: Thu, 16 Jun 2022 13:28:08 +0300
Message-Id: <20220616102811.219007-15-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x232.google.com
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

Implemented RAMBlock is used for managing ram block from VM.
This structure is close to existing RAMBlock in migration but
has few differences.

May be it should be replaced with existing RAMBlock it can lead to
lots of reuses.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 migration/qemu-snapshot.c | 180 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/migration/qemu-snapshot.c b/migration/qemu-snapshot.c
index f7695e75c7..394c6acb77 100644
--- a/migration/qemu-snapshot.c
+++ b/migration/qemu-snapshot.c
@@ -23,13 +23,193 @@
 #include "migration/ram.h"
 #include "qemu-snapshot.h"
 
+/* RAM block */
+/* TODO RAMBlock should be replace with existing struct RAMBlock in ram.c */
+typedef struct RAMBlock {
+    int64_t bdrv_offset;        /* Offset on backing storage */
+    int64_t length;             /* Length */
+    int64_t nr_pages;           /* Page count */
+    int64_t nr_slices;          /* Number of slices (for bitmap bookkeeping) */
+    int64_t discard_offset;     /* Used for postcopy dicarding of ram blocks */
+
+    unsigned long *bitmap;      /* Bitmap of RAM slices */
+
+    /* Link into ram_list */
+    QSIMPLEQ_ENTRY(RAMBlock) next;
+
+    char idstr[256];            /* RAM block id string */
+} RAMBlock;
+
 /* RAM transfer context */
 typedef struct RAMCtx {
     int64_t normal_pages;       /* Total number of normal pages */
+
+    /* RAM block list head */
+    QSIMPLEQ_HEAD(, RAMBlock) ram_block_list;
+
 } RAMCtx;
 
 static RAMCtx ram_ctx;
 
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
+/*
+ * Assume QEMUFile is migration stream and try to get ram block from it.
+ * Also check if this ram block exists.
+ */
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
+/*
+ * Assume that QEMUFile is migration stream and try to get
+ * from f_src ram blocks list. mem_size is a total amount of bytes of whole
+ * ram blocks.
+ */
+static int ram_block_list_from_stream(QEMUFile *f_src, int64_t mem_size)
+{
+    int64_t total_ram_bytes;
+
+    total_ram_bytes = mem_size;
+    while (total_ram_bytes > 0) {
+        char idstr[256];
+        int64_t size;
+
+        if (!qemu_get_counted_string(f_src, idstr)) {
+            error_report("Failed to get RAM block list");
+            return -EINVAL;
+        }
+
+        size = qemu_get_be64(f_src);
+
+        ram_block_add(idstr, size);
+        total_ram_bytes -= size;
+    }
+
+    if (total_ram_bytes != 0) {
+        error_report("Corrupted RAM block list");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+/* Send ram block list using migration rule */
+static int ram_block_list_to_stream(QEMUFile *f_dest)
+{
+    RAMBlock *block;
+    uint64_t total = 0;
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        total += block->length;
+    }
+    qemu_put_be64(f_dest, total | RAM_SAVE_FLAG_MEM_SIZE);
+
+    QSIMPLEQ_FOREACH(block, &ram_ctx.ram_block_list, next) {
+        qemu_put_counted_string(f_dest, block->idstr);
+        qemu_put_be64(f_dest, block->length);
+    }
+
+    return qemu_file_get_error(f_dest);
+}
+
 int coroutine_fn save_state_main(StateSaveCtx *s)
 {
     /* TODO: implement */
-- 
2.31.1


