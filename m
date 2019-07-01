Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D23431B5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:40:38 +0200 (CEST)
Received: from localhost ([::1]:35601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBv3-0000sD-L5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBSc-000872-U1
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBSa-00080h-SZ
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:11:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBSV-0007vY-PY; Wed, 12 Jun 2019 18:11:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 37C9930C0DE0;
 Wed, 12 Jun 2019 22:11:06 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCCBD614C8;
 Wed, 12 Jun 2019 22:11:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:45 +0200
Message-Id: <20190612221004.2317-24-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 12 Jun 2019 22:11:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 23/42] blockdev: Use CAF in
 external_snapshot_prepare()
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

This allows us to differentiate between filters and nodes with COW
backing files: Filters cannot be used as overlays at all (for this
function).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 blockdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index b5c0fd3c49..0f0cf0d9ae 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1665,7 +1665,12 @@ static void external_snapshot_prepare(BlkActionSta=
te *common,
         goto out;
     }
=20
-    if (state->new_bs->backing !=3D NULL) {
+    if (state->new_bs->drv->is_filter) {
+        error_setg(errp, "Filters cannot be used as overlays");
+        goto out;
+    }
+
+    if (bdrv_filtered_cow_child(state->new_bs)) {
         error_setg(errp, "The overlay already has a backing image");
         goto out;
     }
--=20
2.21.0


