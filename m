Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FD4CC1DF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:44:28 +0100 (CET)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPncx-0000c0-MF
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:44:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEO-0007Iy-BK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnEK-0006UK-QD
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWz90LqjnlRotMCqxb2c1/38J7wp3IRBq29vBp6mS+s=;
 b=IYX/T282hORSji2r6AinTt0g4bMLyCNS/C1pHa984wTuqhNAW8wM4rK6MwLhGrMw6xZCji
 HeFPX7pmhzd93HuQeS1Yvj10lkoG5S1pZRcGkVdd6cC06c4BXR0M+wFqs69ww7CAepsLdR
 T9HF45tOZw2RvLkRESOajnpuKzRsLro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-fkIkb7ilPwWLLc3EwoAaPw-1; Thu, 03 Mar 2022 10:18:57 -0500
X-MC-Unique: fkIkb7ilPwWLLc3EwoAaPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AE808066F3;
 Thu,  3 Mar 2022 15:18:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 605F77BCD7;
 Thu,  3 Mar 2022 15:18:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 21/31] assertions for blockdev.h global state API
Date: Thu,  3 Mar 2022 10:16:06 -0500
Message-Id: <20220303151616.325444-22-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c |  3 +++
 blockdev.c            | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 2ab1274dfe..bf77c4a8fa 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -810,6 +810,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
  */
 DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 {
+    GLOBAL_STATE_CODE();
     return blk->legacy_dinfo;
 }
 
@@ -821,6 +822,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 {
     assert(!blk->legacy_dinfo);
+    GLOBAL_STATE_CODE();
     return blk->legacy_dinfo = dinfo;
 }
 
@@ -831,6 +833,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
 {
     BlockBackend *blk = NULL;
+    GLOBAL_STATE_CODE();
 
     while ((blk = blk_next(blk)) != NULL) {
         if (blk->legacy_dinfo == dinfo) {
diff --git a/blockdev.c b/blockdev.c
index 12a317f149..e46e831212 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -113,6 +113,8 @@ void override_max_devs(BlockInterfaceType type, int max_devs)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    GLOBAL_STATE_CODE();
+
     if (max_devs <= 0) {
         return;
     }
@@ -142,6 +144,8 @@ void blockdev_mark_auto_del(BlockBackend *blk)
     DriveInfo *dinfo = blk_legacy_dinfo(blk);
     BlockJob *job;
 
+    GLOBAL_STATE_CODE();
+
     if (!dinfo) {
         return;
     }
@@ -163,6 +167,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
 void blockdev_auto_del(BlockBackend *blk)
 {
     DriveInfo *dinfo = blk_legacy_dinfo(blk);
+    GLOBAL_STATE_CODE();
 
     if (dinfo && dinfo->auto_del) {
         monitor_remove_blk(blk);
@@ -187,6 +192,8 @@ QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
 {
     QemuOpts *opts;
 
+    GLOBAL_STATE_CODE();
+
     opts = qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
     if (!opts) {
         return NULL;
@@ -207,6 +214,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    GLOBAL_STATE_CODE();
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         if (dinfo && dinfo->type == type
@@ -229,6 +238,8 @@ void drive_check_orphaned(void)
     Location loc;
     bool orphans = false;
 
+    GLOBAL_STATE_CODE();
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         /*
@@ -262,6 +273,7 @@ void drive_check_orphaned(void)
 
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
 {
+    GLOBAL_STATE_CODE();
     return drive_get(type,
                      drive_index_to_bus_id(type, index),
                      drive_index_to_unit_id(type, index));
@@ -273,6 +285,8 @@ int drive_get_max_bus(BlockInterfaceType type)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    GLOBAL_STATE_CODE();
+
     max_bus = -1;
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
@@ -759,6 +773,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     const char *filename;
     int i;
 
+    GLOBAL_STATE_CODE();
+
     /* Change legacy command line options into QMP ones */
     static const struct {
         const char *from;
-- 
2.31.1


