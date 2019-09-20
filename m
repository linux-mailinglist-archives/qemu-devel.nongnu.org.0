Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8152B9420
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:37:46 +0200 (CEST)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBKyf-0006WR-3H
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iBKpa-0000dF-N5
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iBKpY-0004My-Fn
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:28:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48660)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iBKpS-0004Ft-1q; Fri, 20 Sep 2019 11:28:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 58CA918C890D;
 Fri, 20 Sep 2019 15:28:11 +0000 (UTC)
Received: from localhost (unknown [10.40.205.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E691D60606;
 Fri, 20 Sep 2019 15:28:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/22] blockdev: Allow resizing everywhere
Date: Fri, 20 Sep 2019 17:27:44 +0200
Message-Id: <20190920152804.12875-3-mreitz@redhat.com>
In-Reply-To: <20190920152804.12875-1-mreitz@redhat.com>
References: <20190920152804.12875-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 20 Sep 2019 15:28:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block nodes that do not allow resizing should not share BLK_PERM_RESIZE.
It does not matter whether they are the first non-filter in their chain
or not.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 blockdev.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b62b33dc03..0420bc29be 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3198,11 +3198,6 @@ void qmp_block_resize(bool has_device, const char =
*device,
     aio_context =3D bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
=20
-    if (!bdrv_is_first_non_filter(bs)) {
-        error_setg(errp, QERR_FEATURE_DISABLED, "resize");
-        goto out;
-    }
-
     if (size < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 siz=
e");
         goto out;
--=20
2.21.0


