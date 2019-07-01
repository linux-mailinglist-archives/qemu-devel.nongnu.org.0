Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6935044
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYF8u-0004Cr-1T
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:30:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hYF7H-0003QV-HW
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hYF7F-0000PB-Hu
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:29:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hYF7D-0000FN-HD
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:29:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19B35307D963
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 19:28:56 +0000 (UTC)
Received: from gimli.home (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D40E65D9CC;
	Tue,  4 Jun 2019 19:28:53 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 04 Jun 2019 13:28:53 -0600
Message-ID: <155967651268.13907.5906121092622267460.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 04 Jun 2019 19:28:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] vfio/pci: Allow MSI-X relocation to fixup
 bogus PBA
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
Cc: alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MSI-X relocation code can sometimes be used to work around bogus
MSI-X capabilities, but this test for whether the PBA is outside of
the specified BAR causes the device to error before we can apply a
relocation.  Let it proceed if we intend to relocate MSI-X anyway.

Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 948e7aac5b0b..8a10bd310065 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1532,7 +1532,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
             (vdev->device_id & 0xff00) == 0x5800) {
             msix->pba_offset = 0x1000;
-        } else {
+        } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
             g_free(msix);


