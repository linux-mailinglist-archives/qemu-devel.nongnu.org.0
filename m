Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F390C45B4E5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:07:41 +0100 (CET)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmNY-0003mZ-V4
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3J-0005Nc-6a
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3H-0005B3-1V
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlR1fiKVhCpm+L9INFPKAkXkSqycDOtjH18DPczSt04=;
 b=BMacFN7NcEv8WwxVESLMoHr43RfXP3BHOeHjHuC1SSwuOKB7GEkNbxforCB48pQAIZOJ+v
 IAocUsC5kyELRSBSZazprX+n3albBEvDU98mDRVeUAkvGdKZgsG+uyTIhnBWx6km7UGVS0
 lkzuSGuvEEid+Qytyghvd1gb3J3Bjgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-ds3ddnPCOqaR_Dbu55fCVA-1; Wed, 24 Nov 2021 01:46:39 -0500
X-MC-Unique: ds3ddnPCOqaR_Dbu55fCVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E07AA1DDE3;
 Wed, 24 Nov 2021 06:46:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B911960843;
 Wed, 24 Nov 2021 06:46:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 17/31] assertions for blockdev.h global state API
Date: Wed, 24 Nov 2021 01:44:04 -0500
Message-Id: <20211124064418.3120601-18-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 56670a774f..aad6d9a4c3 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -794,6 +794,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
  */
 DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo;
 }
 
@@ -805,6 +806,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 {
     assert(!blk->legacy_dinfo);
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo = dinfo;
 }
 
@@ -815,6 +817,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
 {
     BlockBackend *blk = NULL;
+    assert(qemu_in_main_thread());
 
     while ((blk = blk_next(blk)) != NULL) {
         if (blk->legacy_dinfo == dinfo) {
diff --git a/blockdev.c b/blockdev.c
index 7706919410..eebd9317c2 100644
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
@@ -187,6 +192,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         if (dinfo && dinfo->type == type
@@ -209,6 +216,8 @@ void drive_check_orphaned(void)
     Location loc;
     bool orphans = false;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         /*
@@ -242,6 +251,7 @@ void drive_check_orphaned(void)
 
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
 {
+    assert(qemu_in_main_thread());
     return drive_get(type,
                      drive_index_to_bus_id(type, index),
                      drive_index_to_unit_id(type, index));
@@ -253,6 +263,8 @@ int drive_get_max_bus(BlockInterfaceType type)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     max_bus = -1;
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
@@ -269,6 +281,7 @@ int drive_get_max_bus(BlockInterfaceType type)
 DriveInfo *drive_get_next(BlockInterfaceType type)
 {
     static int next_block_unit[IF_COUNT];
+    assert(qemu_in_main_thread());
 
     return drive_get(type, 0, next_block_unit[type]++);
 }
@@ -749,6 +762,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     const char *filename;
     int i;
 
+    assert(qemu_in_main_thread());
+
     /* Change legacy command line options into QMP ones */
     static const struct {
         const char *from;
-- 
2.27.0


