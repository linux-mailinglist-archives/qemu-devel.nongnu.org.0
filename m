Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F11B14DA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 20:39:34 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQbKP-0003jN-Ik
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 14:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI4-000118-9G
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:09 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI0-0003yW-SE
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:08 -0400
Received: from relay.sw.ru ([185.231.240.75]:39812)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHs-0003NI-R3; Mon, 20 Apr 2020 14:36:56 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHj-0001xO-GL; Mon, 20 Apr 2020 21:36:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] copy-on-read: Support refreshing filename
Date: Mon, 20 Apr 2020 21:36:43 +0300
Message-Id: <1587407806-109784-5-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 14:36:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/copy-on-read.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index ad6577d..e45eab9 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
 
@@ -141,6 +142,11 @@ static bool cor_recurse_is_first_non_filter(BlockDriverState *bs,
     return bdrv_recurse_is_first_non_filter(bs->file->bs, candidate);
 }
 
+static void cor_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
 
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
@@ -161,6 +167,7 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_lock_medium                   = cor_lock_medium,
 
     .bdrv_recurse_is_first_non_filter   = cor_recurse_is_first_non_filter,
+    .bdrv_refresh_filename              = cor_refresh_filename,
 
     .has_variable_length                = true,
     .is_filter                          = true,
-- 
1.8.3.1


