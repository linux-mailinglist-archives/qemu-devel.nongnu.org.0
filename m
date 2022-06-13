Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC95485AA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:13:51 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kp6-0003Ko-6K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o0kXm-0001NT-O3
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:55:53 -0400
Received: from vulcan.kevinlocke.name
 ([2001:19f0:5:727:1e84:17da:7c52:5ab4]:52527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o0kXh-0001Ey-Pb
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:55:50 -0400
Received: from kevinolos.kevinlocke.name (unknown [69.145.56.143])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 8E6FE2F21439;
 Mon, 13 Jun 2022 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kevinlocke.name;
 s=vulcan; t=1655128541;
 bh=qv8iSE6/6dRzgNuS5k1/dGAMOgbk7pQ5Ya46oPzgewo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oM1F1uhvDriXRnq7/NkVV7ezp51QEwX1QvRSortd2/M8kGyQ82SR229MjK/wse1+y
 ZtzezkMAaDftmMGlO8GTD3+OOgs8MfDWz7mIMTJaBW7YQGClMNfd90QImKnTNIAkKm
 D3s59b9r7TPe+8WE3Mb3wPYg0asettjaW7omJRl0=
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id 5A63313002B4; Mon, 13 Jun 2022 07:55:28 -0600 (MDT)
From: Kevin Locke <kevin@kevinlocke.name>
To: qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3] docs: add PCIe root bus for VGA compat guideline
Date: Mon, 13 Jun 2022 07:55:21 -0600
Message-Id: <c4e18127b1760380a48f785b6c55a82539687c4d.1655128492.git.kevin@kevinlocke.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
References: <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:19f0:5:727:1e84:17da:7c52:5ab4;
 envelope-from=kevin@kevinlocke.name; helo=vulcan.kevinlocke.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

PCI Express devices which use legacy VGA compatibility should be placed
on the Root Complex.  This simplifies ioport access to VGA registers,
which requires use of a special exception bit to work across PCI(e)
bridges.  It is also necessary for ioport access to VESA BIOS Extension
(VBE) registers, which is not forwarded over PCI(e) bridges, even with
the special exception bit for VGA register access.[1]

Update the PCI Express Guidelines to add these to the list of devices
which can be placed directly on the Root Complex.

Note that the only PCI Express display devices currently supported
(bochs-display and virtio-gpu-pci) do not offer VGA compatibility.
Legacy PCI devices (e.g. vga, qxl-vga, virtio-vga) are already
documented as allowed on the Root Complex by the first item in the list.
However, this item documents an additional consideration for placing
devices which was not previously mentioned, and may be relevant for PCIe
devices offering VGA compatibility in the future.

[1]: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/XG2RN3HKVRDEDTLA2PRELLIENIIH7II7/#XVP3I2KQVZHSTDA4SNVKOITWGRGSDU3F

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
---
Changes since v2:
 * Change Signed-off-by to Suggested-by for Laszlo Ersek, as suggested
   by Laszlo Ersek.

Changes since v1:
 * Replace my overly-broad exception for devices requiring ioport access
   with a list item specifically for PCI Express devices offering VGA
   Compatibility provided by Laszlo Ersek.
 * Rewrite the commit message based on my improved understanding of the
   issue and the improved scope of the change.

 docs/pcie.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..59b26817f9 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -48,13 +48,17 @@ Place only the following kinds of devices directly on the Root Complex:
         strangely when PCI Express devices are integrated
         with the Root Complex.
 
-    (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
+    (2) Assigned PCI Express GPUs that offer legacy VGA compatibility, and
+        that such compatibility is expected of (due to booting with SeaBIOS,
+        or due to UEFI driver bugs or native OS driver bugs).
+
+    (3) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
         hierarchies.
 
-    (3) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
+    (4) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
         hierarchies.
 
-    (4) Extra Root Complexes (pxb-pcie), if multiple PCI Express Root Buses
+    (5) Extra Root Complexes (pxb-pcie), if multiple PCI Express Root Buses
         are needed.
 
    pcie.0 bus
-- 
2.35.1


