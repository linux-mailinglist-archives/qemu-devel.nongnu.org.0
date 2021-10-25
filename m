Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFD4393E9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:42:50 +0200 (CEST)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexRJ-0005or-9c
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4G-0005TM-IN
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4C-00070N-Ju
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAjWG49OSEzSubfvUKYRjQuvQliUJ/3vMUuwSRI8LSg=;
 b=ETMn/8A1AJwfA3ehAzLwvO0xAXAF9LwpmvVfXvu1zYdPAohvYdVB/wp2rUpWPwPKNscUHq
 At3u4ezykfEmjZe/Sb+4pWVyYgnJiwU1NRxJ2oFL7LElZQf3dVD9dhW/E3vQSCY0qnR0Cb
 YLtZOkJpFnJKp1B9N1ZOStPur+hyS40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-FUVCoqZdOL2mkNk_N-aE_g-1; Mon, 25 Oct 2021 06:18:53 -0400
X-MC-Unique: FUVCoqZdOL2mkNk_N-aE_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E71362FA;
 Mon, 25 Oct 2021 10:18:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2955E26A;
 Mon, 25 Oct 2021 10:18:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 15/25] assertions for blockdev.h global state API
Date: Mon, 25 Oct 2021 06:17:25 -0400
Message-Id: <20211025101735.2060852-16-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c |  3 +++
 blockdev.c            | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index fa30bb88ea..e5e4f4e9b9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -795,6 +795,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
  */
 DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo;
 }
 
@@ -806,6 +807,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 {
     assert(!blk->legacy_dinfo);
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo = dinfo;
 }
 
@@ -816,6 +818,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
 {
     BlockBackend *blk = NULL;
+    assert(qemu_in_main_thread());
 
     while ((blk = blk_next(blk)) != NULL) {
         if (blk->legacy_dinfo == dinfo) {
diff --git a/blockdev.c b/blockdev.c
index 1bf49ef610..d9bf842a81 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -113,6 +113,8 @@ void override_max_devs(BlockInterfaceType type, int max_devs)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     if (max_devs <= 0) {
         return;
     }
@@ -142,6 +144,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
     DriveInfo *dinfo = blk_legacy_dinfo(blk);
     BlockJob *job;
 
+    assert(qemu_in_main_thread());
+
     if (!dinfo) {
         return;
     }
@@ -163,6 +167,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 void blockdev_auto_del(BlockBackend *blk)
 {
     DriveInfo *dinfo = blk_legacy_dinfo(blk);
+    assert(qemu_in_main_thread());
 
     if (dinfo && dinfo->auto_del) {
         monitor_remove_blk(blk);
@@ -204,6 +209,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         if (dinfo && dinfo->type == type
@@ -226,6 +233,8 @@ void drive_check_orphaned(void)
     Location loc;
     bool orphans = false;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         /*
@@ -259,6 +268,7 @@ void drive_check_orphaned(void)
 
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
 {
+    assert(qemu_in_main_thread());
     return drive_get(type,
                      drive_index_to_bus_id(type, index),
                      drive_index_to_unit_id(type, index));
@@ -270,6 +280,8 @@ int drive_get_max_bus(BlockInterfaceType type)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     max_bus = -1;
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
@@ -286,6 +298,7 @@ int drive_get_max_bus(BlockInterfaceType type)
 DriveInfo *drive_get_next(BlockInterfaceType type)
 {
     static int next_block_unit[IF_COUNT];
+    assert(qemu_in_main_thread());
 
     return drive_get(type, 0, next_block_unit[type]++);
 }
@@ -766,6 +779,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     const char *filename;
     int i;
 
+    assert(qemu_in_main_thread());
+
     /* Change legacy command line options into QMP ones */
     static const struct {
         const char *from;
-- 
2.27.0


