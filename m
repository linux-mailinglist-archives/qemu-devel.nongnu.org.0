Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD050F4E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 16:56:04 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfQO3-0000JV-7b
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 10:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hfQGK-0002ob-Sh
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hfQGJ-0006Gj-NU
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:48:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27719)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hfQGG-0005ff-Ca; Mon, 24 Jun 2019 10:48:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 579153082211;
 Mon, 24 Jun 2019 14:47:46 +0000 (UTC)
Received: from localhost (ovpn-204-152.brq.redhat.com [10.40.204.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6ACF5D9C5;
 Mon, 24 Jun 2019 14:47:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 24 Jun 2019 16:47:33 +0200
Message-Id: <20190624144740.5338-2-mreitz@redhat.com>
In-Reply-To: <20190624144740.5338-1-mreitz@redhat.com>
References: <20190624144740.5338-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 24 Jun 2019 14:47:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 1/8] nvme: do not advertise support for
 unsupported arbitration mechanism
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

From: Klaus Birkelund Jensen <klaus@birkelund.eu>

The device mistakenly reports that the Weighted Round Robin with Urgent
Priority Class arbitration mechanism is supported.

It is not.

Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
Message-id: 20190606092530.14206-1-klaus@birkelund.eu
Acked-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 hw/block/nvme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 107a719b95..36d6a8bb3a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1384,7 +1384,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error =
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


