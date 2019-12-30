Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88A12CBE4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 03:24:53 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilkjk-0007xN-7v
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 21:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyan122@huawei.com>) id 1ilkiz-0007Qg-98
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 21:24:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wangyan122@huawei.com>) id 1ilkiy-0004aq-2k
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 21:24:05 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:56602 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wangyan122@huawei.com>)
 id 1ilkix-0004W5-OT
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 21:24:04 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E36EF160F3E1806C38A6;
 Mon, 30 Dec 2019 10:23:54 +0800 (CST)
Received: from HGHY4W004241041.china.huawei.com (10.133.208.128) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 30 Dec 2019 10:23:48 +0800
From: Yan Wang <wangyan122@huawei.com>
To: <groug@kaod.org>
Subject: [PATCH] 9p: local: fix memory leak
Date: Mon, 30 Dec 2019 10:23:47 +0800
Message-ID: <20191230022347.36932-1-wangyan122@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.208.128]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yan Wang <wangyan122@huawei.com>
---
 hw/9pfs/9p-local.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index ca641390fb..d0592c3b45 100644
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
2.19.1



