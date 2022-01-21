Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCDB496491
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:55:12 +0100 (CET)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAy7y-000587-Pu
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:55:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN7-0007ko-EW
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN1-0000HU-7e
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TazjNKCApMTs+N0x4LZLyGDiLOqKpWz9SdP8zVHwD0=;
 b=B+YkPboS1QEQAIlWWTzAkp7tmJk7/UuVQzitW2J9kRLc3uyrlrgcEUZnvqQz3EY15Exr7N
 CdCByHE2JFSINzE7ZEUaMOyx7nI4KP1vwB1EC/eFWMZZvMlo/ROFJZHUePtv7XOmB5SA69
 tq8GFqB5v1NC3IuYwLMIBhQ5xWITcEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-GUoJrBOeO-eDXSnS97E33A-1; Fri, 21 Jan 2022 12:06:31 -0500
X-MC-Unique: GUoJrBOeO-eDXSnS97E33A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 122C1654;
 Fri, 21 Jan 2022 17:06:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D8E77EFE1;
 Fri, 21 Jan 2022 17:06:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 16/33] assertions for blockdev.h global state API
Date: Fri, 21 Jan 2022 12:05:27 -0500
Message-Id: <20220121170544.2049944-17-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c |  3 +++
 blockdev.c            | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index fe56cc1cf4..048ba83f37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -797,6 +797,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
  */
 DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 {
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo;
 }
 
@@ -808,6 +809,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 {
     assert(!blk->legacy_dinfo);
+    assert(qemu_in_main_thread());
     return blk->legacy_dinfo = dinfo;
 }
 
@@ -818,6 +820,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
 {
     BlockBackend *blk = NULL;
+    assert(qemu_in_main_thread());
 
     while ((blk = blk_next(blk)) != NULL) {
         if (blk->legacy_dinfo == dinfo) {
diff --git a/blockdev.c b/blockdev.c
index 1bd4bfb3fb..800e95ba54 100644
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
@@ -187,6 +192,8 @@ QemuOpts *drive_add(BlockInterfaceType type, int index, const char *file,
 {
     QemuOpts *opts;
 
+    assert(qemu_in_main_thread());
+
     opts = qemu_opts_parse_noisily(qemu_find_opts("drive"), optstr, false);
     if (!opts) {
         return NULL;
@@ -207,6 +214,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         if (dinfo && dinfo->type == type
@@ -229,6 +238,8 @@ void drive_check_orphaned(void)
     Location loc;
     bool orphans = false;
 
+    assert(qemu_in_main_thread());
+
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
         /*
@@ -262,6 +273,7 @@ void drive_check_orphaned(void)
 
 DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
 {
+    assert(qemu_in_main_thread());
     return drive_get(type,
                      drive_index_to_bus_id(type, index),
                      drive_index_to_unit_id(type, index));
@@ -273,6 +285,8 @@ int drive_get_max_bus(BlockInterfaceType type)
     BlockBackend *blk;
     DriveInfo *dinfo;
 
+    assert(qemu_in_main_thread());
+
     max_bus = -1;
     for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
         dinfo = blk_legacy_dinfo(blk);
@@ -759,6 +773,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     const char *filename;
     int i;
 
+    assert(qemu_in_main_thread());
+
     /* Change legacy command line options into QMP ones */
     static const struct {
         const char *from;
-- 
2.31.1


