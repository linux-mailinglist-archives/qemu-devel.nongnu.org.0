Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A173FE7220
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:52:14 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4VJ-000281-3r
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3x9-00039k-Tl
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3x4-00024E-N5
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53885
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3x4-000223-Gv
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTj7X5bks0tq/xCmZbPfLh5BopxSxIN2X7uEbFLpJCw=;
 b=hT/R9ugSjBPwL1badnLkJCgGStM/4hZc9wyhyOEwNJQ0W0yanQmnzebdgnPGTWzB40gJMy
 aFwaStLU/2QRth403PdlNLJ1cw/4UXZgpOnNXUIQg0YjMSWqfDrnfEaRnnMt+kSLMU+15/
 TXkHkGnknvPQrNCC4QdK8BNInfX2TCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-pPtka8DyP9OTQdJSnhdTiA-1; Mon, 28 Oct 2019 08:16:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D075681A334;
 Mon, 28 Oct 2019 12:16:44 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 774825DA60;
 Mon, 28 Oct 2019 12:16:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 49/69] qcow2: Make qcow2_write_snapshots() public
Date: Mon, 28 Oct 2019 13:14:41 +0100
Message-Id: <20191028121501.15279-50-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: pPtka8DyP9OTQdJSnhdTiA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updating the snapshot list will be useful when upgrading a v2 image to
v3, so we will need to call this function in qcow2.c.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191011152814.14791-6-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h          | 1 +
 block/qcow2-snapshot.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 363681cfdc..6c7a23fdf6 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -716,6 +716,7 @@ int qcow2_snapshot_load_tmp(BlockDriverState *bs,
=20
 void qcow2_free_snapshots(BlockDriverState *bs);
 int qcow2_read_snapshots(BlockDriverState *bs, Error **errp);
+int qcow2_write_snapshots(BlockDriverState *bs);
=20
 /* qcow2-cache.c functions */
 Qcow2Cache *qcow2_cache_create(BlockDriverState *bs, int num_tables,
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 120cb7fa09..e3bf4c9776 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -164,7 +164,7 @@ fail:
 }
=20
 /* add at the end of the file a new list of snapshots */
-static int qcow2_write_snapshots(BlockDriverState *bs)
+int qcow2_write_snapshots(BlockDriverState *bs)
 {
     BDRVQcow2State *s =3D bs->opaque;
     QCowSnapshot *sn;
--=20
2.21.0


