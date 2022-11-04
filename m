Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB3619CB3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzEl-0000PH-Uu; Fri, 04 Nov 2022 12:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEG-0008B6-Nf
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzE4-0007eR-9i
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4t8jY1wjKzzbbd84P/Q3HKuQ2LWGEfxE4+t1s3j2z4=;
 b=Zree0JzggR6ivshX4ognBqsXSfdpG+i0rpK4LXR17C3NoKKO7Y/zSfxO0onqLK14PeSDXu
 6xttAoQ30S80Vy4UxgpluekJQkHlKoOvgIaJ90jCkG8qzK6MHefViVik4ARCJnSyVWzqH7
 ulVypbgZCpoyqxnLj2GbmUtHJjFWlcc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-MM8u4uS1MmOX_MWPpforBw-1; Fri, 04 Nov 2022 12:07:15 -0400
X-MC-Unique: MM8u4uS1MmOX_MWPpforBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AACBE1C09075;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85093C15BA4;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47B1F21E66C6; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v3 08/30] blockdev: Clean up abuse of DriveBackup member format
Date: Fri,  4 Nov 2022 17:06:50 +0100
Message-Id: <20221104160712.3005652-9-armbru@redhat.com>
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

drive-backup argument @format defaults to the format of the source
unless @mode is "existing".

drive_backup_prepare() implements this by copying the source's
@format_name to DriveBackup member @format.  It leaves @has_format
false, violating the "has_format == !!format" invariant.  Unclean.
Falls apart when we elide @has_format (commit after next): then QAPI
passes @format, which is a string constant, to g_free().  iotest 056
duly explodes.

Clean it up.  Since the value stored in member @format is not actually
used outside this function, use a local variable instead of modifying
the QAPI object.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 blockdev.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 3f1dec6242..d6550e0dc8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1686,6 +1686,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     BlockDriverState *source = NULL;
     AioContext *aio_context;
     AioContext *old_context;
+    const char *format;
     QDict *options;
     Error *local_err = NULL;
     int flags;
@@ -1717,9 +1718,9 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
 
-    if (!backup->has_format) {
-        backup->format = backup->mode == NEW_IMAGE_MODE_EXISTING ?
-                         NULL : (char *) bs->drv->format_name;
+    format = backup->format;
+    if (!format && backup->mode != NEW_IMAGE_MODE_EXISTING) {
+        format = bs->drv->format_name;
     }
 
     /* Early check to avoid creating target */
@@ -1758,19 +1759,19 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     }
 
     if (backup->mode != NEW_IMAGE_MODE_EXISTING) {
-        assert(backup->format);
+        assert(format);
         if (source) {
             /* Implicit filters should not appear in the filename */
             BlockDriverState *explicit_backing =
                 bdrv_skip_implicit_filters(source);
 
             bdrv_refresh_filename(explicit_backing);
-            bdrv_img_create(backup->target, backup->format,
+            bdrv_img_create(backup->target, format,
                             explicit_backing->filename,
                             explicit_backing->drv->format_name, NULL,
                             size, flags, false, &local_err);
         } else {
-            bdrv_img_create(backup->target, backup->format, NULL, NULL, NULL,
+            bdrv_img_create(backup->target, format, NULL, NULL, NULL,
                             size, flags, false, &local_err);
         }
     }
@@ -1783,8 +1784,8 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     options = qdict_new();
     qdict_put_str(options, "discard", "unmap");
     qdict_put_str(options, "detect-zeroes", "unmap");
-    if (backup->format) {
-        qdict_put_str(options, "driver", backup->format);
+    if (format) {
+        qdict_put_str(options, "driver", format);
     }
 
     target_bs = bdrv_open(backup->target, NULL, options, flags, errp);
-- 
2.37.3


