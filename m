Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F024825F94A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:24:41 +0200 (CEST)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFGK-0005v1-SL
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF31-0003oX-5K
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44008
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF2z-0008Fc-7T
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTzuySk2eSw84+5AZh7ehQ/mWemPr8x8XHH7IKnIbJs=;
 b=T9ceKg2vxohZNJGyjbavmPCEX8afUD35AGF6lGbFfi5JiyFV+cnRhxyoxMttzhp4XcpH0z
 Hk9uYo5XNkcaSlgIfXzdK/VwKbSC8jheA9zmsjlKYOu4ukDta+WT02v3qCdqgKQRc83PKL
 MI1Iz0NqmLOwQg8btESaGUjZWcXhIdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-XlVcTSDhP7etbkbKGjPjHg-1; Mon, 07 Sep 2020 07:10:40 -0400
X-MC-Unique: XlVcTSDhP7etbkbKGjPjHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A0B88015B0;
 Mon,  7 Sep 2020 11:10:39 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26B829CBA;
 Mon,  7 Sep 2020 11:10:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 42/64] block: Report data child for query-blockstats
Date: Mon,  7 Sep 2020 13:09:14 +0200
Message-Id: <20200907110936.261684-43-kwolf@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

It makes no sense to report the block stats of a purely metadata-storing
child in query-blockstats.  So if the primary child does not have any
data, try to find a unique data-storing child.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qapi.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 4807a2b344..c57b42d86d 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -526,6 +526,7 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
 static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
                                         bool blk_level)
 {
+    BdrvChild *parent_child;
     BlockStats *s = NULL;
 
     s = g_malloc0(sizeof(*s));
@@ -555,9 +556,35 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
         s->has_driver_specific = true;
     }
 
-    if (bs->file) {
+    parent_child = bdrv_primary_child(bs);
+    if (!parent_child ||
+        !(parent_child->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED)))
+    {
+        BdrvChild *c;
+
+        /*
+         * Look for a unique data-storing child.  We do not need to look for
+         * filtered children, as there would be only one and it would have been
+         * the primary child.
+         */
+        parent_child = NULL;
+        QLIST_FOREACH(c, &bs->children, next) {
+            if (c->role & BDRV_CHILD_DATA) {
+                if (parent_child) {
+                    /*
+                     * There are multiple data-storing children and we cannot
+                     * choose between them.
+                     */
+                    parent_child = NULL;
+                    break;
+                }
+                parent_child = c;
+            }
+        }
+    }
+    if (parent_child) {
         s->has_parent = true;
-        s->parent = bdrv_query_bds_stats(bs->file->bs, blk_level);
+        s->parent = bdrv_query_bds_stats(parent_child->bs, blk_level);
     }
 
     if (blk_level && bs->backing) {
-- 
2.25.4


