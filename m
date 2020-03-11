Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1162181CDE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:51:15 +0100 (CET)
Received: from localhost ([::1]:54642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3da-0008Uh-PU
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VG-0002oX-It
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VF-0002lZ-Ar
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22927
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VF-0002jC-6y
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtRbuuoYu3vUpINTNeXrWqzHkgO+/Uo3yQUFHwEdpQc=;
 b=V6+6L50dtB7qvEZ1tEapUHosmiB7c3Tn2cxKOZlSLL3oP16A+++oSVq0ZIMyw6+kGZqrAZ
 uDgHXxERNpny9kAABBztfreMyonyZS1WRsr4dyMk2f0SQR0t80lVcD4E0xxvHLJSgAfgW1
 Zww7EX6oQl4uyLeNQwrvlJN+IK3IBoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-9C414H2dNAKouDANC3UapA-1; Wed, 11 Mar 2020 11:42:26 -0400
X-MC-Unique: 9C414H2dNAKouDANC3UapA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FE0E18A5508;
 Wed, 11 Mar 2020 15:42:25 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8346391D74;
 Wed, 11 Mar 2020 15:42:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/13] block: Make bdrv_get_cumulative_perm() public
Date: Wed, 11 Mar 2020 16:42:07 +0100
Message-Id: <20200311154218.15532-3-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200310113831.27293-2-kwolf@redhat.com>
Reviewed-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 3 +++
 block.c                   | 6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 3f70a98b2d..d8d13700a9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1224,6 +1224,9 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *c=
hild_bs,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
=20
+void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
+                              uint64_t *shared_perm);
+
 /**
  * Sets a BdrvChild's permissions.  Avoid if the parent is a BDS; use
  * bdrv_child_refresh_perms() instead and make the parent's
diff --git a/block.c b/block.c
index 957630b1c5..79a5a2770f 100644
--- a/block.c
+++ b/block.c
@@ -1872,8 +1872,6 @@ static int bdrv_child_check_perm(BdrvChild *c, BlockR=
eopenQueue *q,
                                  bool *tighten_restrictions, Error **errp)=
;
 static void bdrv_child_abort_perm_update(BdrvChild *c);
 static void bdrv_child_set_perm(BdrvChild *c, uint64_t perm, uint64_t shar=
ed);
-static void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
-                                     uint64_t *shared_perm);
=20
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2097,8 +2095,8 @@ static void bdrv_set_perm(BlockDriverState *bs, uint6=
4_t cumulative_perms,
     }
 }
=20
-static void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
-                                     uint64_t *shared_perm)
+void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
+                              uint64_t *shared_perm)
 {
     BdrvChild *c;
     uint64_t cumulative_perms =3D 0;
--=20
2.20.1


