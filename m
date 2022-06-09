Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F979544139
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 04:02:37 +0200 (CEST)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz7VL-0001QO-KP
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 22:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1nz7Tz-0000jd-MM
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:01:11 -0400
Received: from vulcan.kevinlocke.name
 ([2001:19f0:5:727:1e84:17da:7c52:5ab4]:56455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1nz7Tx-0002pT-RI
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:01:11 -0400
Received: from kevinolos.kevinlocke.name (unknown [69.145.56.143])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id D30A92EF3B81;
 Thu,  9 Jun 2022 02:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kevinlocke.name;
 s=vulcan; t=1654740066;
 bh=jy8wGLuR/dHYgPk9x5B9CzPveGNHsC+1TTQ6x186FNE=;
 h=From:To:Cc:Subject:Date:From;
 b=ZNsk+MuaoJOn6KaW9QHQbbuiihaQuq3q3O8vjVE+0Q1ukkAOFHKQpnWV4rWooVWiK
 C7GaFAuBNt4dHhoKtdog1ng76f+EA+r2lHO5xCC+lS2hGmqRrYqj1NzUeG4IyKZw/+
 o7BuK6IGqOenz8FSzdG++1HujeW3iiU8ldAwwu9I=
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id 27C4D1300437; Wed,  8 Jun 2022 20:00:52 -0600 (MDT)
From: Kevin Locke <kevin@kevinlocke.name>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Laine Stump <laine@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: [RFC][PATCH] docs: note exception for PCIe IO port access
Date: Wed,  8 Jun 2022 20:00:47 -0600
Message-Id: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
X-Mailer: git-send-email 2.35.1
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

ioport access is required for VESA BIOS Extensions (VBE).  Since ioport
access is not forwarded over PCI(e) bridges, graphics adapters must be
attached directly to the Root Complex in order for the BIOS to provide
VBE modes.  I'm very grateful to Gerd Hoffmann for explaining this on
the SeaBIOS mailing list.[1]

Update the PCI Express Guidelines to document this as an exception to
the recommendation to "Place only legacy PCI devices on the Root
Complex."

[1]: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/XG2RN3HKVRDEDTLA2PRELLIENIIH7II7/#XVP3I2KQVZHSTDA4SNVKOITWGRGSDU3F

Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
---

This suggested documentation change is the result of my struggles to
understand why I was seeing a very limited set of display modes in one
of my virtual machines, as explained in the seabios ML post linked above
and an earlier post to qemu-discuss.[2]  I hope it may help avoid some
of these hassles for future users.

I'm far from being an expert in PCI(e), BIOS/VBE, or virtualization in
general, and would appreciate any suggestions on these docs changes.
I'm also curious about whether graphics devices are the only exception
and whether "Guest OSes are suspected to behave strangely when PCI
Express devices are integrated with the Root Complex" is still the case.
David Gibson had previously noted that graphics cards appear on the Root
Complex on real hardware.[3]

I notice that the HD Audio Controller on my T430 is an "Express Root
Complex Integrated Endpoint".  Is this a non-graphics example, or am I
misinterpreting the lspci output?

00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller (rev 04)
	Subsystem: Lenovo 7 Series/C216 Chipset Family High Definition Audio Controller
	Flags: bus master, fast devsel, latency 0, IRQ 29, IOMMU group 6
	Memory at f1530000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
	Capabilities: [100] Virtual Channel
	Capabilities: [130] Root Complex Link
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

Thanks,
Kevin

 docs/pcie.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..a23d93849b 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -48,6 +48,11 @@ Place only the following kinds of devices directly on the Root Complex:
         strangely when PCI Express devices are integrated
         with the Root Complex.
 
+        An exception to this rule is PCI Express devices which will be
+        accessed using IO ports.  For example, guests using BIOS firmware
+        require IO port access for graphics devices to provide VESA BIOS
+        Extensions (VBE).
+
     (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
         hierarchies.
 
-- 
2.35.1


