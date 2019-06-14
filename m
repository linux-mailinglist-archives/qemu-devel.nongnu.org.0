Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F286D45FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 15:54:56 +0200 (CEST)
Received: from localhost ([::1]:51742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbmfQ-0001kA-52
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 09:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbmRt-0001lH-1g
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:40:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbmRr-00061G-Vr
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:40:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbmRl-0005vu-TC; Fri, 14 Jun 2019 09:40:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7A7142F8BF3;
 Fri, 14 Jun 2019 13:40:48 +0000 (UTC)
Received: from localhost (unknown [10.40.205.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1663D1753B;
 Fri, 14 Jun 2019 13:40:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 14 Jun 2019 15:40:10 +0200
Message-Id: <20190614134021.32486-10-mreitz@redhat.com>
In-Reply-To: <20190614134021.32486-1-mreitz@redhat.com>
References: <20190614134021.32486-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 14 Jun 2019 13:40:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/20] hw/block/fdc: floppy command FIFO memory
 initialization
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

The uninitialized memory allocated for the command FIFO of the
floppy controller during the VM hardware initialization incurs
many unwanted reports by Valgrind when VM state is being saved.
That verbosity hardens a search for the real memory issues when
the iotests run. Particularly, the patch eliminates 20 unnecessary
reports of the Valgrind tool in the iotest #169.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-id: 1559154027-282547-1-git-send-email-andrey.shinkevich@virtuozz=
o.com
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 hw/block/fdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index a64378f84b..77af9979de 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2648,6 +2648,7 @@ static void fdctrl_realize_common(DeviceState *dev,=
 FDCtrl *fdctrl,
=20
     FLOPPY_DPRINTF("init controller\n");
     fdctrl->fifo =3D qemu_memalign(512, FD_SECTOR_LEN);
+    memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
     fdctrl->fifo_size =3D 512;
     fdctrl->result_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                              fdctrl_result_timer, fdctrl=
);
--=20
2.21.0


