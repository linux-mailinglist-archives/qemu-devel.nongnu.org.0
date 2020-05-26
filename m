Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E871D0D61
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 11:52:38 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYo45-0007e8-8U
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 05:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2h-0005xO-0L; Wed, 13 May 2020 05:51:11 -0400
Received: from relay.sw.ru ([185.231.240.75]:54034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2f-0003ZJ-2J; Wed, 13 May 2020 05:51:10 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2W-0001e4-3j; Wed, 13 May 2020 12:51:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 10/15] copy-on-read: Support change filename functions
Date: Wed, 13 May 2020 12:50:51 +0300
Message-Id: <1589363456-1035571-11-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 05:51:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The COR-filter driver should support a redirecting function to refresh
filenames. Otherwise, a file name of the filter will be copied
instead of the one of a data node. It is also true for the function
bdrv_change_backing_file().

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index c4fa468..74e01ee 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 
@@ -128,6 +129,21 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 }
 
 
+static void cor_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+
+static int cor_change_backing_file(BlockDriverState *bs,
+                                   const char *backing_file,
+                                   const char *backing_fmt)
+{
+    return bdrv_change_backing_file(bs->file->bs, backing_file, backing_fmt);
+}
+
+
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
 
@@ -146,6 +162,8 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_lock_medium                   = cor_lock_medium,
 
     .bdrv_co_block_status               = bdrv_co_block_status_from_file,
+    .bdrv_refresh_filename              = cor_refresh_filename,
+    .bdrv_change_backing_file           = cor_change_backing_file,
 
     .has_variable_length                = true,
     .is_filter                          = true,
-- 
1.8.3.1


