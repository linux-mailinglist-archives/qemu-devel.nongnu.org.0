Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2814E529
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 22:55:30 +0100 (CET)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixHmb-0003mI-8Q
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 16:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ixHcY-00050a-NA
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ixHcW-0004M9-RV
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ixHcW-0004Kv-NY
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580420704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yobEeL2sj2S6wzNbHotodRKWB0mxzy2pX9PMQ2Zv6Eg=;
 b=Hnp5ymFvCHWchAvmByJXst2r2RRj52Rv6jdGIo/F1yPeLF9K9Lcl1W2jYA0XhOw09PcgJJ
 WjCs8g2vBBL0wqEcGAv2ajf+Lfp5PtsTzDaabbyS+KZ75uZGrc24bjLO1oPra9d1hLWM0y
 SrdaSrnqyRahdDckPZuTtplBHVP25co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-QrscCLsxMH-2hOBwcPLXLg-1; Thu, 30 Jan 2020 16:45:00 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90AFB800D55;
 Thu, 30 Jan 2020 21:44:59 +0000 (UTC)
Received: from localhost (ovpn-204-145.brq.redhat.com [10.40.204.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A17677939;
 Thu, 30 Jan 2020 21:44:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 11/21] block: Use bdrv_recurse_can_replace()
Date: Thu, 30 Jan 2020 22:44:21 +0100
Message-Id: <20200130214431.333510-12-mreitz@redhat.com>
In-Reply-To: <20200130214431.333510-1-mreitz@redhat.com>
References: <20200130214431.333510-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: QrscCLsxMH-2hOBwcPLXLg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let check_to_replace_node() use the more specialized
bdrv_recurse_can_replace() instead of
bdrv_recurse_is_first_non_filter(), which is too restrictive (or, in the
case of quorum, sometimes not restrictive enough).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 6623248443..67844ad5ac 100644
--- a/block.c
+++ b/block.c
@@ -6250,6 +6250,17 @@ bool bdrv_recurse_can_replace(BlockDriverState *bs,
     return false;
 }
=20
+/*
+ * Check whether the given @node_name can be replaced by a node that
+ * has the same data as @parent_bs.  If so, return @node_name's BDS;
+ * NULL otherwise.
+ *
+ * @node_name must be a (recursive) *child of @parent_bs (or this
+ * function will return NULL).
+ *
+ * The result (whether the node can be replaced or not) is only valid
+ * for as long as no graph or permission changes occur.
+ */
 BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
                                         const char *node_name, Error **err=
p)
 {
@@ -6274,8 +6285,11 @@ BlockDriverState *check_to_replace_node(BlockDriverS=
tate *parent_bs,
      * Another benefit is that this tests exclude backing files which are
      * blocked by the backing blockers.
      */
-    if (!bdrv_recurse_is_first_non_filter(parent_bs, to_replace_bs)) {
-        error_setg(errp, "Only top most non filter can be replaced");
+    if (!bdrv_recurse_can_replace(parent_bs, to_replace_bs)) {
+        error_setg(errp, "Cannot replace '%s' by a node mirrored from '%s'=
, "
+                   "because it cannot be guaranteed that doing so would no=
t "
+                   "lead to an abrupt change of visible data",
+                   node_name, parent_bs->node_name);
         to_replace_bs =3D NULL;
         goto out;
     }
--=20
2.24.1


