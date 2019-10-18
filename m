Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A2DD01E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 22:27:34 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLYqT-00058i-EY
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 16:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iLYke-0006N1-7m
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iLYkd-0005mD-8s
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iLYkd-0005m0-3i
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A57989F30D;
 Fri, 18 Oct 2019 20:21:30 +0000 (UTC)
Received: from localhost (ovpn-116-92.ams2.redhat.com [10.36.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 296385D9CA;
 Fri, 18 Oct 2019 20:21:21 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] pci: mark device having guest unplug request pending
Date: Fri, 18 Oct 2019 22:20:33 +0200
Message-Id: <20191018202040.30349-5-jfreimann@redhat.com>
In-Reply-To: <20191018202040.30349-1-jfreimann@redhat.com>
References: <20191018202040.30349-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 18 Oct 2019 20:21:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set pending_deleted_event in DeviceState for failover
primary devices that were successfully unplugged by the Guest OS.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/pci/pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 19363ff8ce..08718188bb 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -457,6 +457,7 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice=
 *dev, void *opaque)
     HotplugHandler *hotplug_ctrl =3D qdev_get_hotplug_handler(DEVICE(dev=
));
=20
     if (dev->partially_hotplugged) {
+        dev->qdev.pending_deleted_event =3D false;
         return;
     }
     hotplug_handler_unplug(hotplug_ctrl, DEVICE(dev), &error_abort);
@@ -476,6 +477,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *=
hotplug_dev,
         return;
     }
=20
+    dev->pending_deleted_event =3D true;
+
     /* In case user cancel the operation of multi-function hot-add,
      * remove the function that is unexposed to guest individually,
      * without interaction with guest.
--=20
2.21.0


