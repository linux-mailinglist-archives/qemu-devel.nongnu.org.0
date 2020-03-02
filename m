Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391D175B49
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 14:10:14 +0100 (CET)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8kpp-0001Sx-Bi
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 08:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8ko7-0006pf-4E
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 08:08:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8ko4-0003SH-Ph
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 08:08:25 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51764 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j8ko4-0003Ms-Dc; Mon, 02 Mar 2020 08:08:24 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 404A2974DEB5C69ADDAE;
 Mon,  2 Mar 2020 21:07:58 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Mar 2020
 21:07:47 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 05/12] scsi/scsi-disk: Remove redundant statement in
 scsi_disk_emulate_command()
Date: Mon, 2 Mar 2020 21:07:08 +0800
Message-ID: <20200302130715.29440-7-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 zhang.zhanghailiang@huawei.com, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang static code analyzer show warning:
scsi/scsi-disk.c:1918:5: warning: Value stored to 'buflen' is never read
    buflen =3D req->cmd.xfer;
    ^        ~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
---
 hw/scsi/scsi-disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 10d0794d60..1c0cb63a6f 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1915,7 +1915,6 @@ static int32_t scsi_disk_emulate_command(SCSIReques=
t *req, uint8_t *buf)
         r->iov.iov_base =3D blk_blockalign(s->qdev.conf.blk, r->buflen);
     }
=20
-    buflen =3D req->cmd.xfer;
     outbuf =3D r->iov.iov_base;
     memset(outbuf, 0, r->buflen);
     switch (req->cmd.buf[0]) {
--=20
2.23.0



