Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30391422C0D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:12:41 +0200 (CEST)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXm7U-0004RX-1G
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXm-0003zO-OT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXg-0005JE-IS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX7rNbP1MyC8FFtaO9nErlvWtoIvqDmen8TdFpWCnzI=;
 b=I/i2PYPPc6mlG4mPRt1PMcXzu0hLG76YkEiVil4POoZKRULyAYcW8FkmEN33XJKzeRDMLk
 5d7dM+/GoNgcJZqL0itHSeZOxvGjQd+Wr6ZdQ4jiUz8X7kaDi4pUR+a+EJOykuUQHJSQzb
 JCB+3OaPJmCOvf/4phg82opHz6a0VlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-cBgngXWhPf-7hie4zLVRRg-1; Tue, 05 Oct 2021 10:35:36 -0400
X-MC-Unique: cBgngXWhPf-7hie4zLVRRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBE7184A5EC;
 Tue,  5 Oct 2021 14:35:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AF411045E94;
 Tue,  5 Oct 2021 14:35:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 15/25] include/block/snapshot: global state API +
 assertions
Date: Tue,  5 Oct 2021 10:32:05 -0400
Message-Id: <20211005143215.29500-16-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Snapshots run also under the BQL lock, so they all are
in the global state API. The aiocontext lock that they hold
is currently an overkill and in future could be removed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/snapshot.c         | 28 ++++++++++++++++++++++++++++
 include/block/snapshot.h | 21 +++++++++++++++++++++
 migration/savevm.c       |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/block/snapshot.c b/block/snapshot.c
index ccacda8bd5..e8756f7f90 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -57,6 +57,8 @@ int bdrv_snapshot_find(BlockDriverState *bs, QEMUSnapshotInfo *sn_info,
     QEMUSnapshotInfo *sn_tab, *sn;
     int nb_sns, i, ret;
 
+    g_assert(qemu_in_main_thread());
+
     ret = -ENOENT;
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
     if (nb_sns < 0) {
@@ -105,6 +107,7 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
     bool ret = false;
 
     assert(id || name);
+    g_assert(qemu_in_main_thread());
 
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
     if (nb_sns < 0) {
@@ -200,6 +203,7 @@ static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 int bdrv_can_snapshot(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
+    g_assert(qemu_in_main_thread());
     if (!drv || !bdrv_is_inserted(bs) || bdrv_is_read_only(bs)) {
         return 0;
     }
@@ -220,6 +224,9 @@ int bdrv_snapshot_create(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
+
+    g_assert(qemu_in_main_thread());
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -240,6 +247,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
     BdrvChild **fallback_ptr;
     int ret, open_ret;
 
+    g_assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, "Block driver is closed");
         return -ENOMEDIUM;
@@ -348,6 +357,8 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
     int ret;
 
+    g_assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
         return -ENOMEDIUM;
@@ -380,6 +391,8 @@ int bdrv_snapshot_list(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
+
+    g_assert(qemu_in_main_thread());
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -419,6 +432,8 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
 
+    g_assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
         return -ENOMEDIUM;
@@ -447,6 +462,8 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
     int ret;
     Error *local_err = NULL;
 
+    g_assert(qemu_in_main_thread());
+
     ret = bdrv_snapshot_load_tmp(bs, id_or_name, NULL, &local_err);
     if (ret == -ENOENT || ret == -EINVAL) {
         error_free(local_err);
@@ -515,6 +532,8 @@ bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    g_assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return false;
     }
@@ -549,6 +568,8 @@ int bdrv_all_delete_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    g_assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -588,6 +609,8 @@ int bdrv_all_goto_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    g_assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -622,6 +645,8 @@ int bdrv_all_has_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    g_assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -663,6 +688,7 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
 {
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
+    g_assert(qemu_in_main_thread());
 
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
@@ -703,6 +729,8 @@ BlockDriverState *bdrv_all_find_vmstate_bs(const char *vmstate_bs,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    g_assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return NULL;
     }
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index 940345692f..3a84849388 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -45,6 +45,27 @@ typedef struct QEMUSnapshotInfo {
     uint64_t icount; /* record/replay step */
 } QEMUSnapshotInfo;
 
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * If a function modifies the graph, it also uses drain and/or
+ * aio_context_acquire/release to be sure it has unique access.
+ * aio_context locking is needed together with BQL because of
+ * the thread-safe I/O API that concurrently runs and accesses
+ * the graph without the BQL.
+ *
+ * It is important to note that not all of these functions are
+ * necessarily limited to running under the BQL, but they would
+ * require additional auditing and may small thread-safety changes
+ * to move them into the I/O API. Often it's not worth doing that
+ * work since the APIs are only used with the BQL held at the
+ * moment, so they have been placed in the GS API (for now).
+ *
+ * All functions in this header must use this assertion:
+ * g_assert(qemu_in_main_thread());
+ * to catch when they are accidentally called without the BQL.
+ */
+
 int bdrv_snapshot_find(BlockDriverState *bs, QEMUSnapshotInfo *sn_info,
                        const char *name);
 bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
diff --git a/migration/savevm.c b/migration/savevm.c
index 7b7b64bd13..439f736ad5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2785,6 +2785,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     g_autoptr(GDateTime) now = g_date_time_new_now_local();
     AioContext *aio_context;
 
+    g_assert(qemu_in_main_thread());
+
     if (migration_is_blocked(errp)) {
         return false;
     }
-- 
2.27.0


