Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D28169EB7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 07:44:58 +0100 (CET)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j67U9-0001Ld-Hp
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 01:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <longpeng2@huawei.com>) id 1j67SF-0007IH-SZ
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:43:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1j67SE-00009j-Rn
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2727 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1j67SE-00008N-GR
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:42:58 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E3474CB5AF64255614A3;
 Mon, 24 Feb 2020 14:42:54 +0800 (CST)
Received: from DESKTOP-27KDQMV.china.huawei.com (10.173.228.124) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 14:42:46 +0800
From: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <mst@redhat.com>, <alex.williamson@redhat.com>
Subject: [PATCH RESEND 3/3] util/pty: fix a null pointer reference in
 qemu_openpty_raw
Date: Mon, 24 Feb 2020 14:42:19 +0800
Message-ID: <20200224064219.1434-4-longpeng2@huawei.com>
X-Mailer: git-send-email 2.25.0.windows.1
In-Reply-To: <20200224064219.1434-1-longpeng2@huawei.com>
References: <20200224064219.1434-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.228.124]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: longpeng2@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 qemu-devel@nongnu.org, weifuqiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Longpeng <longpeng2@huawei.com>

q_ptsname may failed ane return null, so use the returned pointer
as the param of strcpy will cause null pointer deference. Use the
return string of openpty instead of call ptsname.

Signed-off-by: Longpeng <longpeng2@huawei.com>
---
 util/qemu-openpty.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index 2e8b43b..2bea4ba 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -112,13 +112,7 @@ int qemu_openpty_raw(int *aslave, char *pty_name)
 {
     int amaster;
     struct termios tty;
-#if defined(__OpenBSD__) || defined(__DragonFly__)
-    char pty_buf[PATH_MAX];
-#define q_ptsname(x) pty_buf
-#else
-    char *pty_buf =3D NULL;
-#define q_ptsname(x) ptsname(x)
-#endif
+    char pty_buf[PATH_MAX] =3D { 0 };
=20
     if (openpty(&amaster, aslave, pty_buf, NULL, NULL) < 0) {
         return -1;
@@ -130,7 +124,7 @@ int qemu_openpty_raw(int *aslave, char *pty_name)
     tcsetattr(*aslave, TCSAFLUSH, &tty);
=20
     if (pty_name) {
-        strcpy(pty_name, q_ptsname(amaster));
+        strcpy(pty_name, pty_buf);
     }
=20
     return amaster;
--=20
1.8.3.1


