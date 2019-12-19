Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7088126911
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 19:28:34 +0100 (CET)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii0XJ-0004F2-W7
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 13:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ii0Vd-0001mh-5h
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ii0Vb-0004j6-CU
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:26:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36480
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ii0Vb-0004gI-63
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 13:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576780005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rHq23gHd9yh/abFMqeLs1LBOHvt7+MdU7phdRBDBCVU=;
 b=EEW4FG/Tht2o1w8RAtYXzlg2DQEKMQm8qJQviJfxaKX1yp3PADaYmW1snJ4TBZbnsu8tPB
 VzEM0Ytog+OQnFgXxZ8vGxx58aynrpHCLqP6EOLIRF+4OOGhV3FzUKtXlyNcgc/EITHNXr
 BCGXKVrkjIml8E21eNe45mAi/HB/qdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-4oOZOP34Pielir1ycW--_A-1; Thu, 19 Dec 2019 13:26:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 090F218D4C0;
 Thu, 19 Dec 2019 18:26:41 +0000 (UTC)
Received: from localhost (ovpn-205-138.brq.redhat.com [10.40.205.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A95A100032E;
 Thu, 19 Dec 2019 18:26:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] backup-top: Begin drain earlier
Date: Thu, 19 Dec 2019 19:26:38 +0100
Message-Id: <20191219182638.104621-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 4oOZOP34Pielir1ycW--_A-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dropping backup-top, we need to drain the node before freeing the
BlockCopyState.  Otherwise, requests may still be in flight and then the
assertion in shres_destroy() will fail.

(This becomes visible in intermittent failure of 056.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup-top.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 7cdb1f8eba..818d3f26b4 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -257,12 +257,12 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
     BDRVBackupTopState *s =3D bs->opaque;
     AioContext *aio_context =3D bdrv_get_aio_context(bs);
=20
-    block_copy_state_free(s->bcs);
-
     aio_context_acquire(aio_context);
=20
     bdrv_drained_begin(bs);
=20
+    block_copy_state_free(s->bcs);
+
     s->active =3D false;
     bdrv_child_refresh_perms(bs, bs->backing, &error_abort);
     bdrv_replace_node(bs, backing_bs(bs), &error_abort);
--=20
2.23.0


