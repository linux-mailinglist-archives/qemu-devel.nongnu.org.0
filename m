Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29B153DCA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 05:08:59 +0100 (CET)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izYTK-0007Y9-Cr
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 23:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izYSb-000730-Vd
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 23:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1izYSa-0006Fr-Tw
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 23:08:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:49730 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1izYSa-0005cL-J0; Wed, 05 Feb 2020 23:08:12 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A8F8C5063DAE48B9B491;
 Thu,  6 Feb 2020 12:08:04 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Thu, 6 Feb 2020 12:07:56 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <clg@kaod.org>, <peter.maydell@linaro.org>
Subject: [PATCH] aspeed/i2c:fix uninitialized variable warning
Date: Thu, 6 Feb 2020 12:07:53 +0800
Message-ID: <20200206040753.42252-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: qemu-trivial@nongnu.org, andrew@aj.id.au, zhang.zhanghailiang@huawei.com,
 Chen Qun <kuhn.chenqun@huawei.com>, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

Fix warning:
hw/i2c/aspeed_i2c.c: In function =E2=80=98aspeed_i2c_bus_write=E2=80=99:
glib/glib-autocleanups.h:28:3: warning: =E2=80=98cmd_flags=E2=80=99 may b=
e
used uninitialized in this function [-Wmaybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
hw/i2c/aspeed_i2c.c:403:22: note: =E2=80=98cmd_flags=E2=80=99 was declare=
d here
     g_autofree char *cmd_flags;
                      ^~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 9cda968501..fb973a983d 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -400,7 +400,7 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
=20
 static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 {
-    g_autofree char *cmd_flags;
+    g_autofree char *cmd_flags =3D NULL;
     uint32_t count;
=20
     if (bus->cmd & (I2CD_RX_BUFF_ENABLE | I2CD_RX_BUFF_ENABLE)) {
--=20
2.23.0



