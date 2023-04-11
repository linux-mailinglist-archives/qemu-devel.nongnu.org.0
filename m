Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631296DDED0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:04:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWY-0003Ws-Ke; Tue, 11 Apr 2023 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWG-0003Dg-QF
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-00028m-Kn
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gc9Ra+EjEBIXe4Z7SYmOVy6Gc9r+tt7tyada4fhZ4i0=;
 b=dn0N2uw0QPKP0PzVP23C+aCiXLbSEw6fI2rlmfhoV3JVTqXRvhoft3rIlXlteHMvW4Cc5F
 MS2vRJO9F7aaCVShWELARb9zQ5ytGKTt3egaYnGlH7DRAEgApL76b7rzPEawrBnUpgOVFK
 RXOpX3DJ2dJMtCMm6f4KGvV116/cnLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-PhEyoARNNCGVvVghRVf7WA-1; Tue, 11 Apr 2023 11:02:11 -0400
X-MC-Unique: PhEyoARNNCGVvVghRVf7WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F5E185A7A8;
 Tue, 11 Apr 2023 15:02:09 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD0A140BC797;
 Tue, 11 Apr 2023 15:02:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/10] block: remove has_variable_length from BlockDriver
Date: Tue, 11 Apr 2023 17:01:43 +0200
Message-Id: <20230411150147.318637-7-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Fill in the field in BlockLimits directly for host devices, and
copy it from there for the raw format.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-5-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  2 --
 block/file-posix.c               | 12 ++++++++----
 block/file-win32.c               |  2 +-
 block/io.c                       |  2 --
 block/raw-format.c               |  3 ++-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index a6d271f25d..f01bb8b617 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -158,8 +158,6 @@ struct BlockDriver {
      */
     bool supports_backing;
 
-    bool has_variable_length;
-
     /*
      * Drivers setting this field must be able to work with just a plain
      * filename with '<protocol_name>:' as a prefix, and no other options.
diff --git a/block/file-posix.c b/block/file-posix.c
index 5760cf22d1..c2dee3f056 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3743,6 +3743,12 @@ static void cdrom_parse_filename(const char *filename, QDict *options,
 {
     bdrv_parse_filename_strip_prefix(filename, "host_cdrom:", options);
 }
+
+static void cdrom_refresh_limits(BlockDriverState *bs, Error **errp)
+{
+    bs->bl.has_variable_length = true;
+    raw_refresh_limits(bs, errp);
+}
 #endif
 
 #ifdef __linux__
@@ -3838,14 +3844,13 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits    = cdrom_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
@@ -3967,14 +3972,13 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_co_preadv         = raw_co_preadv,
     .bdrv_co_pwritev        = raw_co_pwritev,
     .bdrv_co_flush_to_disk  = raw_co_flush_to_disk,
-    .bdrv_refresh_limits = raw_refresh_limits,
+    .bdrv_refresh_limits    = cdrom_refresh_limits,
     .bdrv_co_io_plug        = raw_co_io_plug,
     .bdrv_co_io_unplug      = raw_co_io_unplug,
     .bdrv_attach_aio_context = raw_aio_attach_aio_context,
 
     .bdrv_co_truncate                   = raw_co_truncate,
     .bdrv_co_getlength                  = raw_co_getlength,
-    .has_variable_length                = true,
     .bdrv_co_get_allocated_file_size    = raw_co_get_allocated_file_size,
 
     /* removable device support */
diff --git a/block/file-win32.c b/block/file-win32.c
index c7d0b85306..1763b8662e 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -838,6 +838,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     /* XXX Does Windows support AIO on less than 512-byte alignment? */
     bs->bl.request_alignment = 512;
+    bs->bl.has_variable_length = true;
 }
 
 static int hdev_open(BlockDriverState *bs, QDict *options, int flags,
@@ -933,7 +934,6 @@ static BlockDriver bdrv_host_device = {
     .bdrv_attach_aio_context = raw_attach_aio_context,
 
     .bdrv_co_getlength                = raw_co_getlength,
-    .has_variable_length              = true,
     .bdrv_co_get_allocated_file_size  = raw_co_get_allocated_file_size,
 };
 
diff --git a/block/io.c b/block/io.c
index 932aeb5844..2e267a85ab 100644
--- a/block/io.c
+++ b/block/io.c
@@ -182,8 +182,6 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
                                 drv->bdrv_aio_preadv ||
                                 drv->bdrv_co_preadv_part) ? 1 : 512;
 
-    bs->bl.has_variable_length = drv->has_variable_length;
-
     /* Take some limits from the children as a default */
     have_limits = false;
     QLIST_FOREACH(c, &bs->children, next) {
diff --git a/block/raw-format.c b/block/raw-format.c
index 66783ed8e7..06b8030d9d 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -377,6 +377,8 @@ raw_co_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 
 static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 {
+    bs->bl.has_variable_length = bs->file->bs->bl.has_variable_length;
+
     if (bs->probed) {
         /* To make it easier to protect the first sector, any probed
          * image is restricted to read-modify-write on sub-sector
@@ -623,7 +625,6 @@ BlockDriver bdrv_raw = {
     .bdrv_co_truncate     = &raw_co_truncate,
     .bdrv_co_getlength    = &raw_co_getlength,
     .is_format            = true,
-    .has_variable_length  = true,
     .bdrv_measure         = &raw_measure,
     .bdrv_co_get_info     = &raw_co_get_info,
     .bdrv_refresh_limits  = &raw_refresh_limits,
-- 
2.39.2


