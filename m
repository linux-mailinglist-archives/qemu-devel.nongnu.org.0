Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27720D291C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:18:12 +0200 (CEST)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXOU-0001sM-PP
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIWqs-0006UQ-I7
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIWqr-00089g-G5
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:43:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIWqp-00087f-5k; Thu, 10 Oct 2019 07:43:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6C2793066FA7;
 Thu, 10 Oct 2019 11:43:22 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1325D600C4;
 Thu, 10 Oct 2019 11:43:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/36] block/backup: improve comment about image fleecing
Date: Thu, 10 Oct 2019 13:42:33 +0200
Message-Id: <20191010114300.7746-10-mreitz@redhat.com>
In-Reply-To: <20191010114300.7746-1-mreitz@redhat.com>
References: <20191010114300.7746-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 10 Oct 2019 11:43:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190920142056.12778-5-vsementsov@virtuozzo.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 98d7f7a905..ae28849660 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -747,9 +747,18 @@ BlockJob *backup_job_create(const char *job_id, Bloc=
kDriverState *bs,
     job->bitmap_mode =3D bitmap_mode;
=20
     /*
-     * Set write flags:
-     * 1. Detect image-fleecing (and similar) schemes
-     * 2. Handle compression
+     * If source is in backing chain of target assume that target is goi=
ng to be
+     * used for "image fleecing", i.e. it should represent a kind of sna=
pshot of
+     * source at backup-start point in time. And target is going to be r=
ead by
+     * somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to a=
void
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already up=
dated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
      */
     job->write_flags =3D
         (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
--=20
2.21.0


