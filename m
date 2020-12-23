Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFA2E2261
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:19:25 +0100 (CET)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCTc-0002PJ-RH
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCMA-0004ea-1d
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCM2-0001vq-0O
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIYRaC32aPQJe/sc3VLKtqW/lpECJsWL4UVJkjof1YA=;
 b=EOdqjyGZ+QtHSPnFgiAWfs0ApqqpVtAoU++wH2NC+J+9VXCRLoisgYaJG9SAxafq/iNGz0
 pribTgrYY4/yr7rYUDC2Gw0S5QTwDEh/84jftLOBbCni7NNdFu+vStULxvPxQrGpqik5ZB
 JolqiJhhaCsBPQEj+DnsfFUdDotnq5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-PRgSrZ3VOF-HhdpEkYjUpw-1; Wed, 23 Dec 2020 17:11:30 -0500
X-MC-Unique: PRgSrZ3VOF-HhdpEkYjUpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E214803623;
 Wed, 23 Dec 2020 22:11:28 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA9FF5D739;
 Wed, 23 Dec 2020 22:11:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] qapi: Use QAPI_LIST_APPEND in trivial cases
Date: Wed, 23 Dec 2020 16:11:01 -0600
Message-Id: <20201223221102.390740-7-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The easiest spots to use QAPI_LIST_APPEND are where we already have an
obvious pointer to the tail of a list.  While at it, consistently use
the variable name 'tail' for that purpose.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 backends/hostmem.c                  | 10 ++--
 block/dirty-bitmap.c                |  8 ++-
 block/export/export.c               |  7 +--
 block/qapi.c                        | 23 ++------
 block/qcow2-bitmap.c                | 15 ++----
 block/vmdk.c                        |  9 ++--
 blockdev.c                          | 13 ++---
 crypto/block-luks.c                 |  9 ++--
 hw/acpi/cpu.c                       |  8 +--
 hw/acpi/memory_hotplug.c            |  9 ++--
 iothread.c                          | 12 ++---
 job-qmp.c                           | 13 ++---
 monitor/hmp-cmds.c                  | 10 ++--
 monitor/qmp-cmds-control.c          |  9 ++--
 qemu-img.c                          |  8 +--
 qga/commands-posix.c                | 31 ++++-------
 qga/commands-win32.c                | 11 ++--
 scsi/pr-manager.c                   | 10 +---
 target/i386/cpu.c                   | 23 +++-----
 tests/test-qobject-output-visitor.c | 84 +++++++++--------------------
 tests/test-string-output-visitor.c  |  6 +--
 21 files changed, 99 insertions(+), 229 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e74d..b4c83c1cfa29 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -80,7 +80,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
     uint16List *host_nodes = NULL;
-    uint16List **node = &host_nodes;
+    uint16List **tail = &host_nodes;
     unsigned long value;

     value = find_first_bit(backend->host_nodes, MAX_NODES);
@@ -88,9 +88,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
         goto ret;
     }

-    *node = g_malloc0(sizeof(**node));
-    (*node)->value = value;
-    node = &(*node)->next;
+    QAPI_LIST_APPEND(tail, value);

     do {
         value = find_next_bit(backend->host_nodes, MAX_NODES, value + 1);
@@ -98,9 +96,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
             break;
         }

-        *node = g_malloc0(sizeof(**node));
-        (*node)->value = value;
-        node = &(*node)->next;
+        QAPI_LIST_APPEND(tail, value);
     } while (true);

 ret:
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index c01319b188c3..9b9cd712386c 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -572,12 +572,12 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockDriverState *bs)
 {
     BdrvDirtyBitmap *bm;
     BlockDirtyInfoList *list = NULL;
-    BlockDirtyInfoList **plist = &list;
+    BlockDirtyInfoList **tail = &list;

     bdrv_dirty_bitmaps_lock(bs);
     QLIST_FOREACH(bm, &bs->dirty_bitmaps, list) {
         BlockDirtyInfo *info = g_new0(BlockDirtyInfo, 1);
-        BlockDirtyInfoList *entry = g_new0(BlockDirtyInfoList, 1);
+
         info->count = bdrv_get_dirty_count(bm);
         info->granularity = bdrv_dirty_bitmap_granularity(bm);
         info->has_name = !!bm->name;
@@ -588,9 +588,7 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockDriverState *bs)
         info->persistent = bm->persistent;
         info->has_inconsistent = bm->inconsistent;
         info->inconsistent = bm->inconsistent;
-        entry->value = info;
-        *plist = entry;
-        plist = &entry->next;
+        QAPI_LIST_APPEND(tail, info);
     }
     bdrv_dirty_bitmaps_unlock(bs);

diff --git a/block/export/export.c b/block/export/export.c
index b716c1522c5d..fec7d9f73820 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -342,11 +342,10 @@ void qmp_block_export_del(const char *id,

 BlockExportInfoList *qmp_query_block_exports(Error **errp)
 {
-    BlockExportInfoList *head = NULL, **p_next = &head;
+    BlockExportInfoList *head = NULL, **tail = &head;
     BlockExport *exp;

     QLIST_FOREACH(exp, &block_exports, next) {
-        BlockExportInfoList *entry = g_new0(BlockExportInfoList, 1);
         BlockExportInfo *info = g_new(BlockExportInfo, 1);
         *info = (BlockExportInfo) {
             .id             = g_strdup(exp->id),
@@ -355,9 +354,7 @@ BlockExportInfoList *qmp_query_block_exports(Error **errp)
             .shutting_down  = !exp->user_owned,
         };

-        entry->value = info;
-        *p_next = entry;
-        p_next = &entry->next;
+        QAPI_LIST_APPEND(tail, info);
     }

     return head;
diff --git a/block/qapi.c b/block/qapi.c
index 0ca206f559fe..3a1186fdccf5 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -418,17 +418,12 @@ static uint64List *uint64_list(uint64_t *list, int size)
 {
     int i;
     uint64List *out_list = NULL;
-    uint64List **pout_list = &out_list;
+    uint64List **tail = &out_list;

     for (i = 0; i < size; i++) {
-        uint64List *entry = g_new(uint64List, 1);
-        entry->value = list[i];
-        *pout_list = entry;
-        pout_list = &entry->next;
+        QAPI_LIST_APPEND(tail, list[i]);
     }

-    *pout_list = NULL;
-
     return out_list;
 }

@@ -636,26 +631,21 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
                                      bool query_nodes,
                                      Error **errp)
 {
-    BlockStatsList *head = NULL, **p_next = &head;
+    BlockStatsList *head = NULL, **tail = &head;
     BlockBackend *blk;
     BlockDriverState *bs;

     /* Just to be safe if query_nodes is not always initialized */
     if (has_query_nodes && query_nodes) {
         for (bs = bdrv_next_node(NULL); bs; bs = bdrv_next_node(bs)) {
-            BlockStatsList *info = g_malloc0(sizeof(*info));
             AioContext *ctx = bdrv_get_aio_context(bs);

             aio_context_acquire(ctx);
-            info->value = bdrv_query_bds_stats(bs, false);
+            QAPI_LIST_APPEND(tail, bdrv_query_bds_stats(bs, false));
             aio_context_release(ctx);
-
-            *p_next = info;
-            p_next = &info->next;
         }
     } else {
         for (blk = blk_all_next(NULL); blk; blk = blk_all_next(blk)) {
-            BlockStatsList *info;
             AioContext *ctx = blk_get_aio_context(blk);
             BlockStats *s;
             char *qdev;
@@ -680,10 +670,7 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
             bdrv_query_blk_stats(s->stats, blk);
             aio_context_release(ctx);

-            info = g_malloc0(sizeof(*info));
-            info->value = s;
-            *p_next = info;
-            p_next = &info->next;
+            QAPI_LIST_APPEND(tail, s);
         }
     }

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index d7a31a8ddcdb..5eef82fa55f1 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1061,7 +1061,7 @@ fail:
 static Qcow2BitmapInfoFlagsList *get_bitmap_info_flags(uint32_t flags)
 {
     Qcow2BitmapInfoFlagsList *list = NULL;
-    Qcow2BitmapInfoFlagsList **plist = &list;
+    Qcow2BitmapInfoFlagsList **tail = &list;
     int i;

     static const struct {
@@ -1076,11 +1076,7 @@ static Qcow2BitmapInfoFlagsList *get_bitmap_info_flags(uint32_t flags)

     for (i = 0; i < map_size; ++i) {
         if (flags & map[i].bme) {
-            Qcow2BitmapInfoFlagsList *entry =
-                g_new0(Qcow2BitmapInfoFlagsList, 1);
-            entry->value = map[i].info;
-            *plist = entry;
-            plist = &entry->next;
+            QAPI_LIST_APPEND(tail, map[i].info);
             flags &= ~map[i].bme;
         }
     }
@@ -1105,7 +1101,7 @@ Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
     Qcow2BitmapInfoList *list = NULL;
-    Qcow2BitmapInfoList **plist = &list;
+    Qcow2BitmapInfoList **tail = &list;

     if (s->nb_bitmaps == 0) {
         return NULL;
@@ -1119,13 +1115,10 @@ Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,

     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
         Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
-        Qcow2BitmapInfoList *obj = g_new0(Qcow2BitmapInfoList, 1);
         info->granularity = 1U << bm->granularity_bits;
         info->name = g_strdup(bm->name);
         info->flags = get_bitmap_info_flags(bm->flags & ~BME_RESERVED_FLAGS);
-        obj->value = info;
-        *plist = obj;
-        plist = &obj->next;
+        QAPI_LIST_APPEND(tail, info);
     }

     bitmap_list_free(bm_list);
diff --git a/block/vmdk.c b/block/vmdk.c
index a00dc00eb47a..4499f136bdff 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2928,7 +2928,7 @@ static ImageInfoSpecific *vmdk_get_specific_info(BlockDriverState *bs,
     int i;
     BDRVVmdkState *s = bs->opaque;
     ImageInfoSpecific *spec_info = g_new0(ImageInfoSpecific, 1);
-    ImageInfoList **next;
+    ImageInfoList **tail;

     *spec_info = (ImageInfoSpecific){
         .type = IMAGE_INFO_SPECIFIC_KIND_VMDK,
@@ -2943,12 +2943,9 @@ static ImageInfoSpecific *vmdk_get_specific_info(BlockDriverState *bs,
         .parent_cid = s->parent_cid,
     };

-    next = &spec_info->u.vmdk.data->extents;
+    tail = &spec_info->u.vmdk.data->extents;
     for (i = 0; i < s->num_extents; i++) {
-        *next = g_new0(ImageInfoList, 1);
-        (*next)->value = vmdk_get_extent_info(&s->extents[i]);
-        (*next)->next = NULL;
-        next = &(*next)->next;
+        QAPI_LIST_APPEND(tail, vmdk_get_extent_info(&s->extents[i]));
     }

     return spec_info;
diff --git a/blockdev.c b/blockdev.c
index 2431448c5d41..0be8efa64b82 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3676,28 +3676,25 @@ void qmp_x_blockdev_change(const char *parent, bool has_child,

 BlockJobInfoList *qmp_query_block_jobs(Error **errp)
 {
-    BlockJobInfoList *head = NULL, **p_next = &head;
+    BlockJobInfoList *head = NULL, **tail = &head;
     BlockJob *job;

     for (job = block_job_next(NULL); job; job = block_job_next(job)) {
-        BlockJobInfoList *elem;
+        BlockJobInfo *value;
         AioContext *aio_context;

         if (block_job_is_internal(job)) {
             continue;
         }
-        elem = g_new0(BlockJobInfoList, 1);
         aio_context = blk_get_aio_context(job->blk);
         aio_context_acquire(aio_context);
-        elem->value = block_job_query(job, errp);
+        value = block_job_query(job, errp);
         aio_context_release(aio_context);
-        if (!elem->value) {
-            g_free(elem);
+        if (!value) {
             qapi_free_BlockJobInfoList(head);
             return NULL;
         }
-        *p_next = elem;
-        p_next = &elem->next;
+        QAPI_LIST_APPEND(tail, value);
     }

     return head;
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 564caa10949b..fe8f04ffb294 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -1885,7 +1885,7 @@ static int qcrypto_block_luks_get_info(QCryptoBlock *block,
 {
     QCryptoBlockLUKS *luks = block->opaque;
     QCryptoBlockInfoLUKSSlot *slot;
-    QCryptoBlockInfoLUKSSlotList *slots = NULL, **prev = &info->u.luks.slots;
+    QCryptoBlockInfoLUKSSlotList **tail = &info->u.luks.slots;
     size_t i;

     info->u.luks.cipher_alg = luks->cipher_alg;
@@ -1902,10 +1902,7 @@ static int qcrypto_block_luks_get_info(QCryptoBlock *block,
                                   sizeof(luks->header.uuid));

     for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
-        slots = g_new0(QCryptoBlockInfoLUKSSlotList, 1);
-        *prev = slots;
-
-        slots->value = slot = g_new0(QCryptoBlockInfoLUKSSlot, 1);
+        slot = g_new0(QCryptoBlockInfoLUKSSlot, 1);
         slot->active = luks->header.key_slots[i].active ==
             QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED;
         slot->key_offset = luks->header.key_slots[i].key_offset_sector
@@ -1917,7 +1914,7 @@ static int qcrypto_block_luks_get_info(QCryptoBlock *block,
             slot->stripes = luks->header.key_slots[i].stripes;
         }

-        prev = &slots->next;
+        QAPI_LIST_APPEND(tail, slot);
     }

     return 0;
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 6350caa76530..3f3182007b07 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -42,16 +42,12 @@ static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
     return info;
 }

-void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
+void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***tail)
 {
     int i;

     for (i = 0; i < cpu_st->dev_count; i++) {
-        ACPIOSTInfoList *elem = g_new0(ACPIOSTInfoList, 1);
-        elem->value = acpi_cpu_device_status(i, &cpu_st->devs[i]);
-        elem->next = NULL;
-        **list = elem;
-        *list = &elem->next;
+        QAPI_LIST_APPEND(*tail, acpi_cpu_device_status(i, &cpu_st->devs[i]));
     }
 }

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index f2552b2a4624..e4b836bd5e46 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -51,16 +51,13 @@ static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
     return info;
 }

-void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list)
+void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***tail)
 {
     int i;

     for (i = 0; i < mem_st->dev_count; i++) {
-        ACPIOSTInfoList *elem = g_new0(ACPIOSTInfoList, 1);
-        elem->value = acpi_memory_device_status(i, &mem_st->devs[i]);
-        elem->next = NULL;
-        **list = elem;
-        *list = &elem->next;
+        QAPI_LIST_APPEND(*tail,
+                         acpi_memory_device_status(i, &mem_st->devs[i]));
     }
 }

diff --git a/iothread.c b/iothread.c
index 69eff9efbc70..b9f275138257 100644
--- a/iothread.c
+++ b/iothread.c
@@ -1,7 +1,7 @@
 /*
  * Event loop thread
  *
- * Copyright Red Hat Inc., 2013
+ * Copyright Red Hat Inc., 2013, 2020
  *
  * Authors:
  *  Stefan Hajnoczi   <stefanha@redhat.com>
@@ -310,8 +310,7 @@ AioContext *iothread_get_aio_context(IOThread *iothread)

 static int query_one_iothread(Object *object, void *opaque)
 {
-    IOThreadInfoList ***prev = opaque;
-    IOThreadInfoList *elem;
+    IOThreadInfoList ***tail = opaque;
     IOThreadInfo *info;
     IOThread *iothread;

@@ -327,12 +326,7 @@ static int query_one_iothread(Object *object, void *opaque)
     info->poll_grow = iothread->poll_grow;
     info->poll_shrink = iothread->poll_shrink;

-    elem = g_new0(IOThreadInfoList, 1);
-    elem->value = info;
-    elem->next = NULL;
-
-    **prev = elem;
-    *prev = &elem->next;
+    QAPI_LIST_APPEND(*tail, info);
     return 0;
 }

diff --git a/job-qmp.c b/job-qmp.c
index 645601b2ccc1..34c4da094f22 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -164,28 +164,25 @@ static JobInfo *job_query_single(Job *job, Error **errp)

 JobInfoList *qmp_query_jobs(Error **errp)
 {
-    JobInfoList *head = NULL, **p_next = &head;
+    JobInfoList *head = NULL, **tail = &head;
     Job *job;

     for (job = job_next(NULL); job; job = job_next(job)) {
-        JobInfoList *elem;
+        JobInfo *value;
         AioContext *aio_context;

         if (job_is_internal(job)) {
             continue;
         }
-        elem = g_new0(JobInfoList, 1);
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        elem->value = job_query_single(job, errp);
+        value = job_query_single(job, errp);
         aio_context_release(aio_context);
-        if (!elem->value) {
-            g_free(elem);
+        if (!value) {
             qapi_free_JobInfoList(head);
             return NULL;
         }
-        *p_next = elem;
-        p_next = &elem->next;
+        QAPI_LIST_APPEND(tail, value);
     }

     return head;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 73b79df7d875..ed4131efbca6 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -76,20 +76,20 @@ void hmp_handle_error(Monitor *mon, Error *err)
 static strList *strList_from_comma_list(const char *in)
 {
     strList *res = NULL;
-    strList **hook = &res;
+    strList **tail = &res;

     while (in && in[0]) {
         char *comma = strchr(in, ',');
-        *hook = g_new0(strList, 1);
+        char *value;

         if (comma) {
-            (*hook)->value = g_strndup(in, comma - in);
+            value = g_strndup(in, comma - in);
             in = comma + 1; /* skip the , */
         } else {
-            (*hook)->value = g_strdup(in);
+            value = g_strdup(in);
             in = NULL;
         }
-        hook = &(*hook)->next;
+        QAPI_LIST_APPEND(tail, value);
     }

     return res;
diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 17514f495965..87ffa70ca28d 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -104,17 +104,16 @@ VersionInfo *qmp_query_version(Error **errp)

 static void query_commands_cb(const QmpCommand *cmd, void *opaque)
 {
-    CommandInfoList *info, **list = opaque;
+    CommandInfo *info;
+    CommandInfoList **tail = opaque;

     if (!cmd->enabled) {
         return;
     }

     info = g_malloc0(sizeof(*info));
-    info->value = g_malloc0(sizeof(*info->value));
-    info->value->name = g_strdup(cmd->name);
-    info->next = *list;
-    *list = info;
+    info->name = g_strdup(cmd->name);
+    QAPI_LIST_APPEND(tail, info);
 }

 CommandInfoList *qmp_query_commands(Error **errp)
diff --git a/qemu-img.c b/qemu-img.c
index d599659c7f29..94310715ace9 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2857,7 +2857,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
                                               bool chain, bool force_share)
 {
     ImageInfoList *head = NULL;
-    ImageInfoList **last = &head;
+    ImageInfoList **tail = &head;
     GHashTable *filenames;
     Error *err = NULL;

@@ -2867,7 +2867,6 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
         BlockBackend *blk;
         BlockDriverState *bs;
         ImageInfo *info;
-        ImageInfoList *elem;

         if (g_hash_table_lookup_extended(filenames, filename, NULL, NULL)) {
             error_report("Backing file '%s' creates an infinite loop.",
@@ -2891,10 +2890,7 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
             goto err;
         }

-        elem = g_new0(ImageInfoList, 1);
-        elem->value = info;
-        *last = elem;
-        last = &elem->next;
+        QAPI_LIST_APPEND(tail, info);

         blk_unref(blk);

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 849923b260d7..a5058a3bd15e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2440,18 +2440,17 @@ static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
     int64_t current;
-    GuestLogicalProcessorList *head, **link;
+    GuestLogicalProcessorList *head, **tail;
     long sc_max;
     Error *local_err = NULL;

     current = 0;
     head = NULL;
-    link = &head;
+    tail = &head;
     sc_max = SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);

     while (local_err == NULL && current < sc_max) {
         GuestLogicalProcessor *vcpu;
-        GuestLogicalProcessorList *entry;
         int64_t id = current++;
         char *path = g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId64 "/",
                                      id);
@@ -2461,10 +2460,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
             vcpu->logical_id = id;
             vcpu->has_can_offline = true; /* lolspeak ftw */
             transfer_vcpu(vcpu, true, path, &local_err);
-            entry = g_malloc0(sizeof *entry);
-            entry->value = vcpu;
-            *link = entry;
-            link = &entry->next;
+            QAPI_LIST_APPEND(tail, vcpu);
         }
         g_free(path);
     }
@@ -2797,13 +2793,13 @@ out1:

 GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
 {
-    GuestMemoryBlockList *head, **link;
+    GuestMemoryBlockList *head, **tail;
     Error *local_err = NULL;
     struct dirent *de;
     DIR *dp;

     head = NULL;
-    link = &head;
+    tail = &head;

     dp = opendir("/sys/devices/system/memory/");
     if (!dp) {
@@ -2825,7 +2821,6 @@ GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
      */
     while ((de = readdir(dp)) != NULL) {
         GuestMemoryBlock *mem_blk;
-        GuestMemoryBlockList *entry;

         if ((strncmp(de->d_name, "memory", 6) != 0) ||
             !(de->d_type & DT_DIR)) {
@@ -2841,11 +2836,7 @@ GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
             break;
         }

-        entry = g_malloc0(sizeof *entry);
-        entry->value = mem_blk;
-
-        *link = entry;
-        link = &entry->next;
+        QAPI_LIST_APPEND(tail, mem_blk);
     }

     closedir(dp);
@@ -2865,15 +2856,14 @@ GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
 GuestMemoryBlockResponseList *
 qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
 {
-    GuestMemoryBlockResponseList *head, **link;
+    GuestMemoryBlockResponseList *head, **tail;
     Error *local_err = NULL;

     head = NULL;
-    link = &head;
+    tail = &head;

     while (mem_blks != NULL) {
         GuestMemoryBlockResponse *result;
-        GuestMemoryBlockResponseList *entry;
         GuestMemoryBlock *current_mem_blk = mem_blks->value;

         result = g_malloc0(sizeof(*result));
@@ -2882,11 +2872,8 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
         if (local_err) { /* should never happen */
             goto err;
         }
-        entry = g_malloc0(sizeof *entry);
-        entry->value = result;

-        *link = entry;
-        link = &entry->next;
+        QAPI_LIST_APPEND(tail, result);
         mem_blks = mem_blks->next;
     }

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 684639bd131e..a6cc481bc356 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1833,7 +1833,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
     PSYSTEM_LOGICAL_PROCESSOR_INFORMATION pslpi, ptr;
     DWORD length;
-    GuestLogicalProcessorList *head, **link;
+    GuestLogicalProcessorList *head, **tail;
     Error *local_err = NULL;
     int64_t current;

@@ -1841,7 +1841,7 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
     length = 0;
     current = 0;
     head = NULL;
-    link = &head;
+    tail = &head;

     if ((GetLogicalProcessorInformation(pslpi, &length) == FALSE) &&
         (GetLastError() == ERROR_INSUFFICIENT_BUFFER) &&
@@ -1864,18 +1864,13 @@ GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
             while (cpu_bits > 0) {
                 if (!!(cpu_bits & 1)) {
                     GuestLogicalProcessor *vcpu;
-                    GuestLogicalProcessorList *entry;

                     vcpu = g_malloc0(sizeof *vcpu);
                     vcpu->logical_id = current++;
                     vcpu->online = true;
                     vcpu->has_can_offline = true;

-                    entry = g_malloc0(sizeof *entry);
-                    entry->value = vcpu;
-
-                    *link = entry;
-                    link = &entry->next;
+                    QAPI_LIST_APPEND(tail, vcpu);
                 }
                 cpu_bits >>= 1;
             }
diff --git a/scsi/pr-manager.c b/scsi/pr-manager.c
index 32b9287e680d..2098d7e759cc 100644
--- a/scsi/pr-manager.c
+++ b/scsi/pr-manager.c
@@ -116,8 +116,7 @@ pr_manager_register_types(void)

 static int query_one_pr_manager(Object *object, void *opaque)
 {
-    PRManagerInfoList ***prev = opaque;
-    PRManagerInfoList *elem;
+    PRManagerInfoList ***tail = opaque;
     PRManagerInfo *info;
     PRManager *pr_mgr;

@@ -126,15 +125,10 @@ static int query_one_pr_manager(Object *object, void *opaque)
         return 0;
     }

-    elem = g_new0(PRManagerInfoList, 1);
     info = g_new0(PRManagerInfo, 1);
     info->id = g_strdup(object_get_canonical_path_component(object));
     info->connected = pr_manager_is_connected(pr_mgr);
-    elem->value = info;
-    elem->next = NULL;
-
-    **prev = elem;
-    *prev = &elem->next;
+    QAPI_LIST_APPEND(*tail, info);
     return 0;
 }

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb1c..95326285b76d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4817,20 +4817,17 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);

 /* Build a list with the name of all features on a feature word array */
 static void x86_cpu_list_feature_names(FeatureWordArray features,
-                                       strList **feat_names)
+                                       strList **tail)
 {
     FeatureWord w;
-    strList **next = feat_names;

     for (w = 0; w < FEATURE_WORDS; w++) {
         uint64_t filtered = features[w];
         int i;
         for (i = 0; i < 64; i++) {
             if (filtered & (1ULL << i)) {
-                strList *new = g_new0(strList, 1);
-                new->value = g_strdup(x86_cpu_feature_name(w, i));
-                *next = new;
-                next = &new->next;
+                QAPI_LIST_APPEND(tail,
+                                 g_strdup(x86_cpu_feature_name(w, i)));
             }
         }
     }
@@ -4851,16 +4848,13 @@ static void x86_cpu_get_unavailable_features(Object *obj, Visitor *v,
  * running using the current machine and accelerator.
  */
 static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
-                                                 strList **missing_feats)
+                                                 strList **tail)
 {
     X86CPU *xc;
     Error *err = NULL;
-    strList **next = missing_feats;

     if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
-        strList *new = g_new0(strList, 1);
-        new->value = g_strdup("kvm");
-        *missing_feats = new;
+        QAPI_LIST_APPEND(tail, g_strdup("kvm"));
         return;
     }

@@ -4872,16 +4866,13 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
          * but in case it does, just report the model as not
          * runnable at all using the "type" property.
          */
-        strList *new = g_new0(strList, 1);
-        new->value = g_strdup("type");
-        *next = new;
-        next = &new->next;
+        QAPI_LIST_APPEND(tail, g_strdup("type"));
         error_free(err);
     }

     x86_cpu_filter_features(xc, false);

-    x86_cpu_list_feature_names(xc->filtered_features, next);
+    x86_cpu_list_feature_names(xc->filtered_features, tail);

     object_unref(OBJECT(xc));
 }
diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-output-visitor.c
index b20ab8b29b85..9dc1e075e7d4 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -442,122 +442,86 @@ static void init_list_union(UserDefListUnion *cvalue)
     int i;
     switch (cvalue->type) {
     case USER_DEF_LIST_UNION_KIND_INTEGER: {
-        intList **list = &cvalue->u.integer.data;
+        intList **tail = &cvalue->u.integer.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(intList, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_S8: {
-        int8List **list = &cvalue->u.s8.data;
+        int8List **tail = &cvalue->u.s8.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(int8List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_S16: {
-        int16List **list = &cvalue->u.s16.data;
+        int16List **tail = &cvalue->u.s16.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(int16List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_S32: {
-        int32List **list = &cvalue->u.s32.data;
+        int32List **tail = &cvalue->u.s32.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(int32List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_S64: {
-        int64List **list = &cvalue->u.s64.data;
+        int64List **tail = &cvalue->u.s64.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(int64List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_U8: {
-        uint8List **list = &cvalue->u.u8.data;
+        uint8List **tail = &cvalue->u.u8.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(uint8List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_U16: {
-        uint16List **list = &cvalue->u.u16.data;
+        uint16List **tail = &cvalue->u.u16.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(uint16List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_U32: {
-        uint32List **list = &cvalue->u.u32.data;
+        uint32List **tail = &cvalue->u.u32.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(uint32List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_U64: {
-        uint64List **list = &cvalue->u.u64.data;
+        uint64List **tail = &cvalue->u.u64.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(uint64List, 1);
-            (*list)->value = i;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, i);
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_BOOLEAN: {
-        boolList **list = &cvalue->u.boolean.data;
+        boolList **tail = &cvalue->u.boolean.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(boolList, 1);
-            (*list)->value = QEMU_IS_ALIGNED(i, 3);
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, QEMU_IS_ALIGNED(i, 3));
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_STRING: {
-        strList **list = &cvalue->u.string.data;
+        strList **tail = &cvalue->u.string.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(strList, 1);
-            (*list)->value = g_strdup_printf("%d", i);
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, g_strdup_printf("%d", i));
         }
         break;
     }
     case USER_DEF_LIST_UNION_KIND_NUMBER: {
-        numberList **list = &cvalue->u.number.data;
+        numberList **tail = &cvalue->u.number.data;
         for (i = 0; i < 32; i++) {
-            *list = g_new0(numberList, 1);
-            (*list)->value = (double)i / 3;
-            (*list)->next = NULL;
-            list = &(*list)->next;
+            QAPI_LIST_APPEND(tail, (double)i / 3);
         }
         break;
     }
diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index 9f6581439ade..6771495ca8ab 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -88,15 +88,13 @@ static void test_visitor_out_intList(TestOutputVisitorData *data,
 {
     int64_t value[] = {0, 1, 9, 10, 16, 15, 14,
         3, 4, 5, 6, 11, 12, 13, 21, 22, INT64_MAX - 1, INT64_MAX};
-    intList *list = NULL, **tmp = &list;
+    intList *list = NULL, **tail = &list;
     int i;
     Error *err = NULL;
     char *str;

     for (i = 0; i < ARRAY_SIZE(value); i++) {
-        *tmp = g_malloc0(sizeof(**tmp));
-        (*tmp)->value = value[i];
-        tmp = &(*tmp)->next;
+        QAPI_LIST_APPEND(tail, value[i]);
     }

     visit_type_intList(data->ov, NULL, &list, &err);
-- 
2.29.2


