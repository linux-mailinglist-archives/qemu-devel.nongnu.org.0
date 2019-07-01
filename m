Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4C4E93C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 15:34:46 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heJgj-0007Jk-Nh
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 09:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1heJW9-0006IK-75
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1heJW4-0004TV-LQ
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 09:23:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1heJVy-0004Oz-AD; Fri, 21 Jun 2019 09:23:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A46630F1BC0;
 Fri, 21 Jun 2019 13:23:37 +0000 (UTC)
Received: from localhost (ovpn-204-30.brq.redhat.com [10.40.204.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3037D604A3;
 Fri, 21 Jun 2019 13:23:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 21 Jun 2019 15:23:20 +0200
Message-Id: <20190621132324.2165-5-mreitz@redhat.com>
In-Reply-To: <20190621132324.2165-1-mreitz@redhat.com>
References: <20190621132324.2165-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 21 Jun 2019 13:23:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/8] vmdk: Fix comment regarding max l1_size
 coverage
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

From: Sam Eiderman <shmuel.eiderman@oracle.com>

Commit b0651b8c246d ("vmdk: Move l1_size check into vmdk_add_extent")
extended the l1_size check from VMDK4 to VMDK3 but did not update the
default coverage in the moved comment.

The previous vmdk4 calculation:

    (512 * 1024 * 1024) * 512(l2 entries) * 65536(grain) =3D 16PB

The added vmdk3 calculation:

    (512 * 1024 * 1024) * 4096(l2 entries) * 512(grain) =3D 1PB

Adding the calculation of vmdk3 to the comment.

In any case, VMware does not offer virtual disks more than 2TB for
vmdk4/vmdk3 or 64TB for the new undocumented seSparse format which is
not implemented yet in qemu.

Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Reviewed-by: Eyal Moscovici <eyal.moscovici@oracle.com>
Reviewed-by: Liran Alon <liran.alon@oracle.com>
Reviewed-by: Arbel Moshe <arbel.moshe@oracle.com>
Signed-off-by: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-id: 20190620091057.47441-2-shmuel.eiderman@oracle.com
Reviewed-by: yuchenlin <yuchenlin@synology.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vmdk.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 51067c774f..0f2e453bf5 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -426,10 +426,15 @@ static int vmdk_add_extent(BlockDriverState *bs,
         return -EFBIG;
     }
     if (l1_size > 512 * 1024 * 1024) {
-        /* Although with big capacity and small l1_entry_sectors, we can=
 get a
+        /*
+         * Although with big capacity and small l1_entry_sectors, we can=
 get a
          * big l1_size, we don't want unbounded value to allocate the ta=
ble.
-         * Limit it to 512M, which is 16PB for default cluster and L2 ta=
ble
-         * size */
+         * Limit it to 512M, which is:
+         *     16PB - for default "Hosted Sparse Extent" (VMDK4)
+         *            cluster size: 64KB, L2 table size: 512 entries
+         *     1PB  - for default "ESXi Host Sparse Extent" (VMDK3/vmfsS=
parse)
+         *            cluster size: 512B, L2 table size: 4096 entries
+         */
         error_setg(errp, "L1 size too big");
         return -EFBIG;
     }
--=20
2.21.0


