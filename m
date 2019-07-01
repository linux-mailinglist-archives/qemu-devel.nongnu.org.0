Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7F44EB4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:48:39 +0200 (CEST)
Received: from localhost ([::1]:45916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXaI-00037q-Si
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hbXMK-0000Gx-Pd
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hbXMH-00031y-O1
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hbXMG-0002tF-Ul
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:34:09 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25B1A67F
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 21:33:48 +0000 (UTC)
Received: from gimli.home (ovpn-116-190.phx2.redhat.com [10.3.116.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9EA31001B06;
 Thu, 13 Jun 2019 21:33:45 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 15:33:45 -0600
Message-ID: <156046162538.26543.2016700244609366109.stgit@gimli.home>
In-Reply-To: <156046151566.26543.17274661862206856605.stgit@gimli.home>
References: <156046151566.26543.17274661862206856605.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 13 Jun 2019 21:33:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/3] vfio/pci: Hide Resizable BAR capability
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

The resizable BAR capability is currently exposed read-only from the
kernel and we don't yet implement a protocol for virtualizing it to
the VM.  Exposing it to the guest read-only introduces poor behavior
as the guest has no reason to test that a control register write is
accepted by the hardware.  This can lead to cases where the guest OS
assumes the BAR has been resized, but it hasn't.  This has been
observed when assigning AMD Vega GPUs.

Note, this does not preclude future enablement of resizable BARs, but
it's currently incorrect to expose this capability as read-only, so
better to not expose it at all.

Reported-by: James Courtier-Dutton <james.dutton@gmail.com>
Tested-by: James Courtier-Dutton <james.dutton@gmail.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4a04f795162b..48f4e19a02cf 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2119,6 +2119,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
         case 0: /* kernel masked capability */
         case PCI_EXT_CAP_ID_SRIOV: /* Read-only VF BARs confuse OVMF */
         case PCI_EXT_CAP_ID_ARI: /* XXX Needs next function virtualization */
+        case PCI_EXT_CAP_ID_REBAR: /* Can't expose read-only */
             trace_vfio_add_ext_cap_dropped(vdev->vbasedev.name, cap_id, next);
             break;
         default:


