Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97366919B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:30:50 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn209-0001Dc-S8
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34317)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hn1ym-0004la-Nl
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hn1yl-0005xO-OA
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:29:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57622)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hn1yj-0005vd-IG; Mon, 15 Jul 2019 10:29:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5E6D30821E0;
 Mon, 15 Jul 2019 14:29:20 +0000 (UTC)
Received: from localhost (unknown [10.40.205.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AB1E57A1;
 Mon, 15 Jul 2019 14:29:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 15 Jul 2019 16:28:58 +0200
Message-Id: <20190715142905.9078-5-mreitz@redhat.com>
In-Reply-To: <20190715142905.9078-1-mreitz@redhat.com>
References: <20190715142905.9078-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 15 Jul 2019 14:29:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/11] block/stream: Swap backing file change
 order
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

bdrv_change_backing_file() can result in yields.  Therefore, @base may
no longer be the the backing_bs() of s->bottom afterwards.

Just swap the order of the two calls to fix this.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190703172813.6868-4-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/stream.c b/block/stream.c
index b27e61625d..6ac1e7bec4 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -78,8 +78,8 @@ static int stream_prepare(Job *job)
                 base_fmt =3D base->drv->format_name;
             }
         }
-        ret =3D bdrv_change_backing_file(bs, base_id, base_fmt);
         bdrv_set_backing_hd(bs, base, &local_err);
+        ret =3D bdrv_change_backing_file(bs, base_id, base_fmt);
         if (local_err) {
             error_report_err(local_err);
             return -EPERM;
--=20
2.21.0


