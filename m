Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495B42A0D7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:16:53 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDu0-00087M-DB
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUd-0006HH-7Q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1maDUX-0002yd-2x
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634028631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/lR+H1Oldu4a2r0hhAwTW5BCUeczQ1vjKBTFyquVVY=;
 b=DC+kTQhnsOpsOiRfZcuB7vu+1sCLzJOxA8P80A/+QULTipkCqgrvCwLB+PP9E/Veb3J/ha
 uNDGWdRS+PxbpSfyUT9QGJzg1Wf4ZupJNjVTd2PLFgNWrSqdIJvT4h1NkI84NLOXtTaYTG
 osIYqJDjSfs3Mw5wqrg8OVqHh4Q2lqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-QuKSgGgUPGeG1H2rCJ4tzw-1; Tue, 12 Oct 2021 04:50:30 -0400
X-MC-Unique: QuKSgGgUPGeG1H2rCJ4tzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D22BF100F942;
 Tue, 12 Oct 2021 08:50:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E7C5C1B4;
 Tue, 12 Oct 2021 08:50:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 15/25] assertions for blockdev.h global state API
Date: Tue, 12 Oct 2021 04:48:56 -0400
Message-Id: <20211012084906.2060507-16-eesposit@redhat.com>
In-Reply-To: <20211012084906.2060507-1-eesposit@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/block-backend.c |  2 ++
 blockdev.c            | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6f36a54e82..f2c724b487 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -805,6 +805,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 {
     assert(!blk->legacy_dinfo);
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo = dinfo;
 }
 
@@ -815,6 +816,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
 {
     BlockBackend *blk = NULL;
+    assert(qemu_in_main_thread());
 
     while ((blk = blk_next(blk)) != NULL) {
         if (blk->legacy_dinfo == dinfo) {
diff --git a/blockdev.c b/blockdev.c
index 1bf49ef610..f4bde8a8d2 100644
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
@@ -204,6 +206,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         if (dinfo && dinfo->type == type
@@ -226,6 +230,8 @@ void drive_check_orphaned(void)
     Location loc;
     bool orphans = false;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         /*
@@ -259,6 +265,7 @@ void drive_check_orphaned(void)
 
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
 {
+    assert(qemu_in_main_thread());
     return drive_get(type,
                      drive_index_to_bus_id(type, index),
                      drive_index_to_unit_id(type, index));
@@ -270,6 +277,8 @@ int drive_get_max_bus(BlockInterfaceType type)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     max_bus = -1;
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
@@ -286,6 +295,7 @@ int drive_get_max_bus(BlockInterfaceType type)
 DriveInfo *drive_get_next(BlockInterfaceType type)
 {
     static int next_block_unit[IF_COUNT];
+    assert(qemu_in_main_thread());
 
     return drive_get(type, 0, next_block_unit[type]++);
 }
@@ -766,6 +776,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     const char *filename;
     int i;
 
+    assert(qemu_in_main_thread());
+
     /* Change legacy command line options into QMP ones */
     static const struct {
         const char *from;
-- 
2.27.0


