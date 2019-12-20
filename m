Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3A127C54
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:13:51 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJ2L-0001BM-P3
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenjiajun8@huawei.com>) id 1iiEv3-00080w-MI
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chenjiajun8@huawei.com>) id 1iiEv2-0006lT-Bt
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:50:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2281 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chenjiajun8@huawei.com>)
 id 1iiEv1-0006ID-UY
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 04:50:00 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 655753285479021D78DB;
 Fri, 20 Dec 2019 17:49:52 +0800 (CST)
Received: from DESKTOP-RHHE7UD.china.huawei.com (10.173.221.217) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Fri, 20 Dec 2019 17:49:43 +0800
From: Jiajun Chen <chenjiajun8@huawei.com>
To: <groug@kaod.org>
Subject: [PATCH] 9pfs: local: Fix possible memory leak in local_link()
Date: Fri, 20 Dec 2019 17:49:34 +0800
Message-ID: <20191220094934.21232-1-chenjiajun8@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.217]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
X-Mailman-Approved-At: Fri, 20 Dec 2019 09:01:13 -0500
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
Cc: qemu-devel@nongnu.org, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a possible memory leak while local_link return -1 without free
odirpath and oname.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Jaijun Chen <chenjiajun8@huawei.com>
Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 hw/9pfs/9p-local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 4708c0bd89..491b08aee8 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -947,7 +947,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpa=
th,
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
         errno =3D EINVAL;
-        return -1;
+        goto out;
     }
=20
     odirfd =3D local_opendir_nofollow(ctx, odirpath);
--=20
2.21.0.windows.1



