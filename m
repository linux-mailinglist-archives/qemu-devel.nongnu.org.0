Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F137AA80
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:19:54 +0200 (CEST)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUAr-0006qy-7q
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU16-0007Xy-PN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU13-0004Y8-Fk
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dU3jkqeip6xOevZQ0PYqzg8wx+sgu69PrI8VJ9q64ik=;
 b=hvlB2F9IPwdXfdgWKdZZQYtm4MLs8RMIvdjhjlQp5ensiVDoWCoGOJkwLdmzjyMgfHC6o8
 DQDQ1vgjp+KT4tvzgNjxA1xlsFEodg6p90z10smIPi0bVFnNwQPnF7e4kMzF4HET31BXr8
 de+RpddscKILEvvtLdAxDzBR9UIzP20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-OQFJttMRMKyfSnlG_l7uUg-1; Tue, 11 May 2021 11:09:40 -0400
X-MC-Unique: OQFJttMRMKyfSnlG_l7uUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85CF7107ACF2;
 Tue, 11 May 2021 15:09:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135436A033;
 Tue, 11 May 2021 15:09:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 08/17] migration/ram: Handle RAM block resizes during precopy
Date: Tue, 11 May 2021 16:08:33 +0100
Message-Id: <20210511150842.207155-9-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Resizing while migrating is dangerous and does not work as expected.
The whole migration code works on the usable_length of ram blocks and does
not expect this to change at random points in time.

In the case of precopy, the ram block size must not change on the source,
after syncing the RAM block list in ram_save_setup(), so as long as the
guest is still running on the source.

Resizing can be trigger *after* (but not during) a reset in
ACPI code by the guest
- hw/arm/virt-acpi-build.c:acpi_ram_update()
- hw/i386/acpi-build.c:acpi_ram_update()

Use the ram block notifier to get notified about resizes. Let's simply
cancel migration and indicate the reason. We'll continue running on the
source. No harm done.

Update the documentation. Postcopy will be handled separately.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-5-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Manual merge
---
 include/exec/memory.h | 10 ++++++----
 migration/migration.c |  9 +++++++--
 migration/migration.h |  1 +
 migration/ram.c       | 30 ++++++++++++++++++++++++++++++
 softmmu/physmem.c     |  5 +++--
 5 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b2..c8b9088924 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -131,7 +131,7 @@ typedef struct IOMMUTLBEvent {
 #define RAM_SHARED     (1 << 1)
 
 /* Only a portion of RAM (used_length) is actually used, and migrated.
- * This used_length size can change across reboots.
+ * Resizing RAM while migrating can result in the migration being canceled.
  */
 #define RAM_RESIZEABLE (1 << 2)
 
@@ -955,7 +955,9 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
  *                                     RAM.  Accesses into the region will
  *                                     modify memory directly.  Only an initial
  *                                     portion of this RAM is actually used.
- *                                     The used size can change across reboots.
+ *                                     Changing the size while migrating
+ *                                     can result in the migration being
+ *                                     canceled.
  *
  * @mr: the #MemoryRegion to be initialized.
  * @owner: the object that tracks the region's reference count
@@ -1586,8 +1588,8 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
 
 /* memory_region_ram_resize: Resize a RAM region.
  *
- * Only legal before guest might have detected the memory size: e.g. on
- * incoming migration, or right after reset.
+ * Resizing RAM while migrating can result in the migration being canceled.
+ * Care has to be taken if the guest might have already detected the memory.
  *
  * @mr: a memory region created with @memory_region_init_resizeable_ram.
  * @newsize: the new size the region
diff --git a/migration/migration.c b/migration/migration.c
index fdadee290e..4698b47442 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -223,13 +223,18 @@ void migration_object_init(void)
     dirty_bitmap_mig_init();
 }
 
+void migration_cancel(void)
+{
+    migrate_fd_cancel(current_migration);
+}
+
 void migration_shutdown(void)
 {
     /*
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
      */
-    migrate_fd_cancel(current_migration);
+    migration_cancel();
     object_unref(OBJECT(current_migration));
 
     /*
@@ -2307,7 +2312,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
 
 void qmp_migrate_cancel(Error **errp)
 {
-    migrate_fd_cancel(migrate_get_current());
+    migration_cancel();
 }
 
 void qmp_migrate_continue(MigrationStatus state, Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index db6708326b..f7b388d718 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -375,5 +375,6 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, void *opaque);
 void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
 bool migration_rate_limit(void);
+void migration_cancel(void);
 
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index bb52bd97db..77922c445e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4096,8 +4096,38 @@ static SaveVMHandlers savevm_ram_handlers = {
     .resume_prepare = ram_resume_prepare,
 };
 
+static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
+                                      size_t old_size, size_t new_size)
+{
+    ram_addr_t offset;
+    RAMBlock *rb = qemu_ram_block_from_host(host, false, &offset);
+    Error *err = NULL;
+
+    if (ramblock_is_ignored(rb)) {
+        return;
+    }
+
+    if (!migration_is_idle()) {
+        /*
+         * Precopy code on the source cannot deal with the size of RAM blocks
+         * changing at random points in time - especially after sending the
+         * RAM block sizes in the migration stream, they must no longer change.
+         * Abort and indicate a proper reason.
+         */
+        error_setg(&err, "RAM block '%s' resized during precopy.", rb->idstr);
+        migrate_set_error(migrate_get_current(), err);
+        error_free(err);
+        migration_cancel();
+    }
+}
+
+static RAMBlockNotifier ram_mig_ram_notifier = {
+    .ram_block_resized = ram_mig_ram_block_resized,
+};
+
 void ram_mig_init(void)
 {
     qemu_mutex_init(&XBZRLE.lock);
     register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state);
+    ram_block_notifier_add(&ram_mig_ram_notifier);
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 81ec3b85b9..813a3efe8e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1798,8 +1798,9 @@ static int memory_try_enable_merging(void *addr, size_t len)
     return qemu_madvise(addr, len, QEMU_MADV_MERGEABLE);
 }
 
-/* Only legal before guest might have detected the memory size: e.g. on
- * incoming migration, or right after reset.
+/*
+ * Resizing RAM while migrating can result in the migration being canceled.
+ * Care has to be taken if the guest might have already detected the memory.
  *
  * As memory core doesn't know how is memory accessed, it is up to
  * resize callback to update device state and/or add assertions to detect
-- 
2.31.1


