Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FED36FCB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 11:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYofq-0007lY-14
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 05:27:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hYoeb-0006qa-F4
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:25:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hYoea-0003fs-Kw
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 05:25:49 -0400
Received: from charlie.dont.surf ([128.199.63.193]:42578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hYoeY-0003YA-HH; Thu, 06 Jun 2019 05:25:46 -0400
Received: from apples.localdomain (soho-cph.cust-cnex.dsd101.net
	[194.62.216.132])
	by charlie.dont.surf (Postfix) with ESMTPSA id F1191BF724;
	Thu,  6 Jun 2019 09:25:43 +0000 (UTC)
From: Klaus Birkelund Jensen <klaus@birkelund.eu>
To: qemu-block@nongnu.org
Date: Thu,  6 Jun 2019 11:25:30 +0200
Message-Id: <20190606092530.14206-1-klaus@birkelund.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: [Qemu-devel] [PATCH] nvme: do not advertise support for unsupported
 arbitration mechanism
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <keith.busch@intel.com>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device mistakenly reports that the Weighted Round Robin with Urgent
Priority Class arbitration mechanism is supported.

It is not.

Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 30e50f7a3853..415b4641d6b4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1383,7 +1383,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
**errp)
     n->bar.cap =3D 0;
     NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
     NVME_CAP_SET_CQR(n->bar.cap, 1);
-    NVME_CAP_SET_AMS(n->bar.cap, 1);
     NVME_CAP_SET_TO(n->bar.cap, 0xf);
     NVME_CAP_SET_CSS(n->bar.cap, 1);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
--=20
2.21.0


