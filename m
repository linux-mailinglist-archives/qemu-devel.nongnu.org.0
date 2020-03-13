Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1D1846F3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 13:34:25 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCjWC-0006g8-5G
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 08:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jCjV7-0006G7-UL
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 08:33:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jCjV6-0007zg-PS
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 08:33:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39488 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jCjV6-0007ru-Ct; Fri, 13 Mar 2020 08:33:16 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 43E7045E502A98DD8788;
 Fri, 13 Mar 2020 20:33:08 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Mar 2020
 20:32:58 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v4] hw/net/imx_fec: write TGSR and TCSR3 in imx_enet_write()
Date: Fri, 13 Mar 2020 20:32:42 +0800
Message-ID: <20200313123242.13236-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current code causes clang static code analyzer generate warning:
hw/net/imx_fec.c:858:9: warning: Value stored to 'value' is never read
        value =3D value & 0x0000000f;
        ^       ~~~~~~~~~~~~~~~~~~
hw/net/imx_fec.c:864:9: warning: Value stored to 'value' is never read
        value =3D value & 0x000000fd;
        ^       ~~~~~~~~~~~~~~~~~~

According to the definition of the function, the two =E2=80=9Cvalue=E2=80=
=9D assignments
 should be written to registers.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>

v1->v2:
  The register 'ENET_TGSR' write-1-to-clear timer flag.
  The register 'ENET_TCSRn' 7bit(TF) write-1-to-clear timer flag.

v2->v3:
  Optimize code style, based on discussions with Peter.

v3->v4:
  Delete reserved bits write zero(Base on Peter's comments).
---
 hw/net/imx_fec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6a124a154a..5c145a8197 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -855,13 +855,15 @@ static void imx_enet_write(IMXFECState *s, uint32_t=
 index, uint32_t value)
         break;
     case ENET_TGSR:
         /* implement clear timer flag */
-        value =3D value & 0x0000000f;
+        s->regs[index] &=3D ~(value & 0x0000000f); /* all bits W1C */
         break;
     case ENET_TCSR0:
     case ENET_TCSR1:
     case ENET_TCSR2:
     case ENET_TCSR3:
-        value =3D value & 0x000000fd;
+        s->regs[index] &=3D ~(value & 0x00000080); /* W1C bits */
+        s->regs[index] &=3D ~0x0000007d; /* writable fields */
+        s->regs[index] |=3D (value & 0x0000007d);
         break;
     case ENET_TCCR0:
     case ENET_TCCR1:
--=20
2.23.0



