Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003325F976
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:31:16 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFMh-0003bS-0v
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2n-0003Lw-Np
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47938
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2h-00086r-VX
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXlVuOuwLJ4wSDILuH3/dlPY4IYCUkVNCsh0+woEqrc=;
 b=KBvgshNWgm2/TdtbVzJx8IEfhsHEBGjw5/RkaoJfc5gD+4Yiyxj1ShssrRk2Uf0uBRbSuN
 JhxtI9pAAaSDTlbP5qXw+GBEsVpcCn8Wsuy/tBYw/pUJybx7AN8sq/k9kYS2p2kqOoLo9s
 +9eOkRoD8wgcen1lTgdwAPUIPBV/wow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-tKWJzOZ6OdqroRObsDH4Cg-1; Mon, 07 Sep 2020 07:10:31 -0400
X-MC-Unique: tKWJzOZ6OdqroRObsDH4Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E56D1007465;
 Mon,  7 Sep 2020 11:10:30 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B67F9CBA;
 Mon,  7 Sep 2020 11:10:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 35/64] block: Use CAFs in bdrv_refresh_filename()
Date: Mon,  7 Sep 2020 13:09:07 +0200
Message-Id: <20200907110936.261684-36-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 02:54:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

bdrv_refresh_filename() and the kind of related bdrv_dirname() should
look to the primary child when they wish to copy the underlying file's
filename.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 660386795a..ed29d1edb4 100644
--- a/block.c
+++ b/block.c
@@ -6822,6 +6822,7 @@ void bdrv_refresh_filename(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
     BdrvChild *child;
+    BlockDriverState *primary_child_bs;
     QDict *opts;
     bool backing_overridden;
     bool generate_json_filename; /* Whether our default implementation should
@@ -6891,20 +6892,30 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     qobject_unref(bs->full_open_options);
     bs->full_open_options = opts;
 
+    primary_child_bs = bdrv_primary_bs(bs);
+
     if (drv->bdrv_refresh_filename) {
         /* Obsolete information is of no use here, so drop the old file name
          * information before refreshing it */
         bs->exact_filename[0] = '\0';
 
         drv->bdrv_refresh_filename(bs);
-    } else if (bs->file) {
-        /* Try to reconstruct valid information from the underlying file */
+    } else if (primary_child_bs) {
+        /*
+         * Try to reconstruct valid information from the underlying
+         * file -- this only works for format nodes (filter nodes
+         * cannot be probed and as such must be selected by the user
+         * either through an options dict, or through a special
+         * filename which the filter driver must construct in its
+         * .bdrv_refresh_filename() implementation).
+         */
 
         bs->exact_filename[0] = '\0';
 
         /*
          * We can use the underlying file's filename if:
          * - it has a filename,
+         * - the current BDS is not a filter,
          * - the file is a protocol BDS, and
          * - opening that file (as this BDS's format) will automatically create
          *   the BDS tree we have right now, that is:
@@ -6913,11 +6924,11 @@ void bdrv_refresh_filename(BlockDriverState *bs)
          *   - no non-file child of this BDS has been overridden by the user
          *   Both of these conditions are represented by generate_json_filename.
          */
-        if (bs->file->bs->exact_filename[0] &&
-            bs->file->bs->drv->bdrv_file_open &&
-            !generate_json_filename)
+        if (primary_child_bs->exact_filename[0] &&
+            primary_child_bs->drv->bdrv_file_open &&
+            !drv->is_filter && !generate_json_filename)
         {
-            strcpy(bs->exact_filename, bs->file->bs->exact_filename);
+            strcpy(bs->exact_filename, primary_child_bs->exact_filename);
         }
     }
 
@@ -6937,6 +6948,7 @@ void bdrv_refresh_filename(BlockDriverState *bs)
 char *bdrv_dirname(BlockDriverState *bs, Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    BlockDriverState *child_bs;
 
     if (!drv) {
         error_setg(errp, "Node '%s' is ejected", bs->node_name);
@@ -6947,8 +6959,9 @@ char *bdrv_dirname(BlockDriverState *bs, Error **errp)
         return drv->bdrv_dirname(bs, errp);
     }
 
-    if (bs->file) {
-        return bdrv_dirname(bs->file->bs, errp);
+    child_bs = bdrv_primary_bs(bs);
+    if (child_bs) {
+        return bdrv_dirname(child_bs, errp);
     }
 
     bdrv_refresh_filename(bs);
-- 
2.25.4


