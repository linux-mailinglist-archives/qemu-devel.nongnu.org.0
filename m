Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AE44EAD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:47:04 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXYb-00023O-L5
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51579)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hbXMa-0000Ix-Va
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hbXMO-00035N-Ns
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hbXMM-0002w6-1r
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9F133082A24
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 21:33:55 +0000 (UTC)
Received: from gimli.home (ovpn-116-190.phx2.redhat.com [10.3.116.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB0C24E6B8;
 Thu, 13 Jun 2019 21:33:53 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 15:33:53 -0600
Message-ID: <156046163320.26543.15970819423038130751.stgit@gimli.home>
In-Reply-To: <156046151566.26543.17274661862206856605.stgit@gimli.home>
References: <156046151566.26543.17274661862206856605.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 13 Jun 2019 21:33:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/3] vfio/pci: Allow MSI-X relocation to fixup
 bogus PBA
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
index 48f4e19a02cf..6520c05dee92 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1533,7 +1533,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
             (vdev->device_id & 0xff00) == 0x5800) {
             msix->pba_offset = 0x1000;
-        } else {
+        } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
             g_free(msix);


