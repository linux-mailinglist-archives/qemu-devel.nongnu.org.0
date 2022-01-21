Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA004964AE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:59:14 +0100 (CET)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyBu-00016h-3e
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN7-0007kt-FM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN1-0000Ig-7D
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31hBCcZPgNA39gY10vLpN1ICY28MH8dzezeeN3owJ2E=;
 b=T3pwMh8w8P+0bm9msCYTw9nyZDKQoRmBgoMXCSSSgjvzJJMk6YdMzIHvKHGWuun1rP1Kfe
 2/fEXQs90bRzRuigr76VPdXpVDK9RQs6uH6rR81sIvuDPLVPsDQipLPa5+DIgzE9AUIgqr
 tssUl7EDtTcYAIOAfvNut5+Sjv0WBro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-Zq9PlztMO-SYEhUNNcnlfA-1; Fri, 21 Jan 2022 12:06:32 -0500
X-MC-Unique: Zq9PlztMO-SYEhUNNcnlfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2629190B2A6;
 Fri, 21 Jan 2022 17:06:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C45E7EBCA;
 Fri, 21 Jan 2022 17:06:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 17/33] include/block/snapshot: global state API + assertions
Date: Fri, 21 Jan 2022 12:05:28 -0500
Message-Id: <20220121170544.2049944-18-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Snapshots run also under the BQL lock, so they all are
in the global state API. The aiocontext lock that they hold
is currently an overkill and in future could be removed.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/snapshot.c         | 28 ++++++++++++++++++++++++++++
 include/block/snapshot.h | 13 +++++++++++--
 migration/savevm.c       |  2 ++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index ccacda8bd5..3dd3c9d3bd 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -57,6 +57,8 @@ int bdrv_snapshot_find(BlockDriverState *bs, QEMUSnapshotInfo *sn_info,
     QEMUSnapshotInfo *sn_tab, *sn;
     int nb_sns, i, ret;
 
+    assert(qemu_in_main_thread());
+
     ret = -ENOENT;
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
     if (nb_sns < 0) {
@@ -105,6 +107,7 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
     bool ret = false;
 
     assert(id || name);
+    assert(qemu_in_main_thread());
 
     nb_sns = bdrv_snapshot_list(bs, &sn_tab);
     if (nb_sns < 0) {
@@ -200,6 +203,7 @@ static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 int bdrv_can_snapshot(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
+    assert(qemu_in_main_thread());
     if (!drv || !bdrv_is_inserted(bs) || bdrv_is_read_only(bs)) {
         return 0;
     }
@@ -220,6 +224,9 @@ int bdrv_snapshot_create(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
+
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -240,6 +247,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
     BdrvChild **fallback_ptr;
     int ret, open_ret;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, "Block driver is closed");
         return -ENOMEDIUM;
@@ -348,6 +357,8 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
     int ret;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
         return -ENOMEDIUM;
@@ -380,6 +391,8 @@ int bdrv_snapshot_list(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *fallback_bs = bdrv_snapshot_fallback(bs);
+
+    assert(qemu_in_main_thread());
     if (!drv) {
         return -ENOMEDIUM;
     }
@@ -419,6 +432,8 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
 {
     BlockDriver *drv = bs->drv;
 
+    assert(qemu_in_main_thread());
+
     if (!drv) {
         error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
         return -ENOMEDIUM;
@@ -447,6 +462,8 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
     int ret;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     ret = bdrv_snapshot_load_tmp(bs, id_or_name, NULL, &local_err);
     if (ret == -ENOENT || ret == -EINVAL) {
         error_free(local_err);
@@ -515,6 +532,8 @@ bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return false;
     }
@@ -549,6 +568,8 @@ int bdrv_all_delete_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -588,6 +609,8 @@ int bdrv_all_goto_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -622,6 +645,8 @@ int bdrv_all_has_snapshot(const char *name,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
     }
@@ -663,6 +688,7 @@ int bdrv_all_create_snapshot(QEMUSnapshotInfo *sn,
 {
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
+    assert(qemu_in_main_thread());
 
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return -1;
@@ -703,6 +729,8 @@ BlockDriverState *bdrv_all_find_vmstate_bs(const char *vmstate_bs,
     g_autoptr(GList) bdrvs = NULL;
     GList *iterbdrvs;
 
+    assert(qemu_in_main_thread());
+
     if (bdrv_all_get_snapshot_devices(has_devices, devices, &bdrvs, errp) < 0) {
         return NULL;
     }
diff --git a/include/block/snapshot.h b/include/block/snapshot.h
index 940345692f..cda82c1ba1 100644
--- a/include/block/snapshot.h
+++ b/include/block/snapshot.h
@@ -45,6 +45,13 @@ typedef struct QEMUSnapshotInfo {
     uint64_t icount; /* record/replay step */
 } QEMUSnapshotInfo;
 
+/*
+ * Global state (GS) API. These functions run under the BQL lock.
+ *
+ * See include/block/block-global-state.h for more information about
+ * the GS API.
+ */
+
 int bdrv_snapshot_find(BlockDriverState *bs, QEMUSnapshotInfo *sn_info,
                        const char *name);
 bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
@@ -73,9 +80,11 @@ int bdrv_snapshot_load_tmp_by_id_or_name(BlockDriverState *bs,
                                          Error **errp);
 
 
-/* Group operations. All block drivers are involved.
+/*
+ * Group operations. All block drivers are involved.
  * These functions will properly handle dataplane (take aio_context_acquire
- * when appropriate for appropriate block drivers */
+ * when appropriate for appropriate block drivers
+ */
 
 bool bdrv_all_can_snapshot(bool has_devices, strList *devices,
                            Error **errp);
diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..adb5fae9f1 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2787,6 +2787,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     g_autoptr(GDateTime) now = g_date_time_new_now_local();
     AioContext *aio_context;
 
+    assert(qemu_in_main_thread());
+
     if (migration_is_blocked(errp)) {
         return false;
     }
-- 
2.31.1


