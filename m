Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1352B8A3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 13:21:34 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrHkD-0000cQ-JT
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 07:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHXy-0004Nm-25
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:08:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHXw-0007DM-69
 for qemu-devel@nongnu.org; Wed, 18 May 2022 07:08:53 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrHWq-000AVy-F4; Wed, 18 May 2022 12:07:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 18 May 2022 12:08:33 +0100
Message-Id: <20220518110839.8681-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 0/6] hw/acpi/viot: generate stable VIOT ACPI tables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I was working away at some improvements for PS2 devices when I noticed that one
small change to the instantiation of a PS2 mouse device caused a regression in
tests/qtest/bios-tables-test, specifically the /x86_64/acpi/q35/viot subtest.

Closer examination of the failed test output showed the problem was that the
order of the PCI host bridge entries had changed within the table causing the
generated binary to fail to match the version in tests/data/acpi/q35/VIOT.viot.

The error occurs because there is no guarantee in the order of PCI host bridges
being returned from object_child_foreach_recursive() used within
hw/acpi/viot.c's build_viot() function, so any change to the QOM tree can
potentially change the generated ACPI VIOT table ordering and cause the
regression tests to fail.

Fortunately the solution is fairly easy: change build_viot() to build an array
of PCI host bridges and then sort them first before generating the final ACPI
VIOT table. I've chosen to sort the PCI host bridges based upon the min_bus
number which seems to work okay here.

The changes in this patchset were heavily inspired by the build_iort() function
in hw/arm/virt-acpi-build.c which already does the right thing here. Patches 1-5
make the required changes before patch 6 updates the VIOT binary to match the
updated ACPI VIOT table ordering.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


Mark Cave-Ayland (6):
  hw/acpi/viot: rename build_pci_range_node() to pci_host_bridges()
  hw/acpi/viot: move the individual PCI host bridge entry generation to
    a new function
  hw/acpi/viot: build array of PCI host bridges before generating VIOT
    ACPI table
  tests/acpi: virt: allow VIOT acpi table changes
  hw/acpi/viot: sort VIOT ACPI table entries by PCI host bus min_bus
  tests/acpi: virt: update golden masters for VIOT

 hw/acpi/viot.c                | 107 +++++++++++++++++++++-------------
 tests/data/acpi/q35/VIOT.viot | Bin 112 -> 112 bytes
 2 files changed, 68 insertions(+), 39 deletions(-)

-- 
2.20.1


