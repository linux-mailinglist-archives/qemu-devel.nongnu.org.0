Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415EEDCFF8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 22:24:46 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLYnk-0001qK-W6
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 16:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iLYkU-00066r-Ds
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iLYkT-0005jY-BG
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iLYkT-0005jK-61
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 16:21:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A005302C076;
 Fri, 18 Oct 2019 20:21:20 +0000 (UTC)
Received: from localhost (ovpn-116-92.ams2.redhat.com [10.36.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C2887E25;
 Fri, 18 Oct 2019 20:21:13 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] pci: mark devices partially unplugged
Date: Fri, 18 Oct 2019 22:20:32 +0200
Message-Id: <20191018202040.30349-4-jfreimann@redhat.com>
In-Reply-To: <20191018202040.30349-1-jfreimann@redhat.com>
References: <20191018202040.30349-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 18 Oct 2019 20:21:20 +0000 (UTC)
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

Only the guest unplug request was triggered. This is needed for
the failover feature. In case of a failed migration we need to
plug the device back to the guest.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/pci/pcie.c        | 3 +++
 include/hw/pci/pci.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index a6beb567bd..19363ff8ce 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -456,6 +456,9 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice=
 *dev, void *opaque)
 {
     HotplugHandler *hotplug_ctrl =3D qdev_get_hotplug_handler(DEVICE(dev=
));
=20
+    if (dev->partially_hotplugged) {
+        return;
+    }
     hotplug_handler_unplug(hotplug_ctrl, DEVICE(dev), &error_abort);
     object_unparent(OBJECT(dev));
 }
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index def5435685..7b7eac845c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -265,6 +265,7 @@ typedef struct PCIReqIDCache PCIReqIDCache;
=20
 struct PCIDevice {
     DeviceState qdev;
+    bool partially_hotplugged;
=20
     /* PCI config space */
     uint8_t *config;
--=20
2.21.0


