Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DCC1CAC17
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:50:16 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2SF-0003Vu-62
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2Kf-0000JZ-Co
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33778
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KV-0008Kw-12
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9ysrqQRPWuNv86D53h3K/zau/kpyni1+ocLdUD95ls=;
 b=B7gXN2JfPMzstU9u1qVk7HS7IrKCAeuz9m3xYU6gad8KnFcZjfYr5iMcDBUyVkpiD+wVTw
 BhV5XrFXPj/+28zgPNfVcAfMJgjnKoxHzUxrAAXGFe8lufJhu+/4RC217o99BAkRQh9rQu
 1GJaSWH1A9NH/a3YEmnh5j+Vyt7WwWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-PKqOT_w5PgSJQ2f8XSORow-1; Fri, 08 May 2020 08:42:12 -0400
X-MC-Unique: PKqOT_w5PgSJQ2f8XSORow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BBFF19057B2;
 Fri,  8 May 2020 12:42:11 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF6319167;
 Fri,  8 May 2020 12:42:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/30] gluster: Drop useless has_zero_init callback
Date: Fri,  8 May 2020 14:41:27 +0200
Message-Id: <20200508124135.252565-23-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

block.c already defaults to 0 if we don't provide a callback; there's
no need to write a callback that always fails.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20200428202905.770727-2-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/gluster.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index d06df900f6..31233cac69 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1359,12 +1359,6 @@ static int64_t qemu_gluster_allocated_file_size(Bloc=
kDriverState *bs)
     }
 }
=20
-static int qemu_gluster_has_zero_init(BlockDriverState *bs)
-{
-    /* GlusterFS volume could be backed by a block device */
-    return 0;
-}
-
 /*
  * Find allocation range in @bs around offset @start.
  * May change underlying file descriptor's file offset.
@@ -1569,8 +1563,6 @@ static BlockDriver bdrv_gluster =3D {
     .bdrv_co_readv                =3D qemu_gluster_co_readv,
     .bdrv_co_writev               =3D qemu_gluster_co_writev,
     .bdrv_co_flush_to_disk        =3D qemu_gluster_co_flush_to_disk,
-    .bdrv_has_zero_init           =3D qemu_gluster_has_zero_init,
-    .bdrv_has_zero_init_truncate  =3D qemu_gluster_has_zero_init,
 #ifdef CONFIG_GLUSTERFS_DISCARD
     .bdrv_co_pdiscard             =3D qemu_gluster_co_pdiscard,
 #endif
@@ -1601,8 +1593,6 @@ static BlockDriver bdrv_gluster_tcp =3D {
     .bdrv_co_readv                =3D qemu_gluster_co_readv,
     .bdrv_co_writev               =3D qemu_gluster_co_writev,
     .bdrv_co_flush_to_disk        =3D qemu_gluster_co_flush_to_disk,
-    .bdrv_has_zero_init           =3D qemu_gluster_has_zero_init,
-    .bdrv_has_zero_init_truncate  =3D qemu_gluster_has_zero_init,
 #ifdef CONFIG_GLUSTERFS_DISCARD
     .bdrv_co_pdiscard             =3D qemu_gluster_co_pdiscard,
 #endif
@@ -1633,8 +1623,6 @@ static BlockDriver bdrv_gluster_unix =3D {
     .bdrv_co_readv                =3D qemu_gluster_co_readv,
     .bdrv_co_writev               =3D qemu_gluster_co_writev,
     .bdrv_co_flush_to_disk        =3D qemu_gluster_co_flush_to_disk,
-    .bdrv_has_zero_init           =3D qemu_gluster_has_zero_init,
-    .bdrv_has_zero_init_truncate  =3D qemu_gluster_has_zero_init,
 #ifdef CONFIG_GLUSTERFS_DISCARD
     .bdrv_co_pdiscard             =3D qemu_gluster_co_pdiscard,
 #endif
@@ -1671,8 +1659,6 @@ static BlockDriver bdrv_gluster_rdma =3D {
     .bdrv_co_readv                =3D qemu_gluster_co_readv,
     .bdrv_co_writev               =3D qemu_gluster_co_writev,
     .bdrv_co_flush_to_disk        =3D qemu_gluster_co_flush_to_disk,
-    .bdrv_has_zero_init           =3D qemu_gluster_has_zero_init,
-    .bdrv_has_zero_init_truncate  =3D qemu_gluster_has_zero_init,
 #ifdef CONFIG_GLUSTERFS_DISCARD
     .bdrv_co_pdiscard             =3D qemu_gluster_co_pdiscard,
 #endif
--=20
2.25.3


