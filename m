Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F253423F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 19:35:41 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntuv6-0007bf-Bs
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 13:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusJ-0005Il-AE
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntusH-0002Ed-LD
 for qemu-devel@nongnu.org; Wed, 25 May 2022 13:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2XMhFiaI7CNYOFS79YArOtwE4K/gnazqu2ejxKO0uA=; b=I/nrZ/xUiI1ett02p8hKAaf/Qp
 oQ+bbZNH4sjqYrN1sIjq8jeQo7BIOIEMDbuu7cYfPqSj5tx4T655Ax7GrblATpfYdH3fCepZWYNZI
 /JzqQY71C86mAdDmc1l849oqulG7j2oIL8AZobXXBL/NzVafKTLOgpx+J7KkZ8wmJjIDG4V3JUlVr
 0LleMsOA0uYUFXw/NOtyHutDyXo/gcj+H2eq96P9VaYW0tO8jS8JvU7kkZxo2kFNrfgeuiJoroP4/
 p1ngj76TatDU/mt8A4kym+deUW+7pmIXQn7aELK63xFqzGAvH93+3KuE/ww1Y6bjb5yopMwh1NbjH
 eEEjNjXpMaveRYBPySL5ig0ajeA1hrnjM6gGWFT0NaMIn+2m4nZGgqRcApF9VBiENflsAZpLsCeSn
 le1w/qXMqu1FeNZfNcNhX0m2aybFkkyDQ1m/Kcm6neOvJ8/68ps2RMPcOBW6zem/Ri23SHcQRZ6/0
 Xy6pJheLOoE7Oy4qYcC03yLWar73a8vglGyB3zuXTzwi8WLMWRyvcrh1stsyUS0C1v1V9mDQDe5Xc
 YK7PlTGUDZ0fU2vr5N1aEbhd1ACb/rsYyTJi2sOEkG5cV6bLNz6cCN3A6aqS1qnNA2wLXs9KIJAz6
 cAS6lJaQKw9bSQ8Ohhj+8w7zpsQAa8sGfWxPdR+6w=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ntur9-0006Pu-LL; Wed, 25 May 2022 18:31:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 jean-philippe@linaro.org, qemu-devel@nongnu.org
Date: Wed, 25 May 2022 18:32:26 +0100
Message-Id: <20220525173232.31429-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 0/6] hw/acpi/viot: generate stable VIOT ACPI tables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

v3:
- Rebase onto master
- Add Reviewed-by tag from Ani in patch 1
- Declare struct viot_pci_host_range as const in enumerate_pci_host_bridges() in patch 3
- Add Reviewed-by tags for the series from Phil

v2:
- Rebase onto master
- Rename pci_host_bridges() to enumerate_pci_host_bridges() in patch 1
- Change return type of pci_host_range_compare() from int to gint in patch 5
- Tweak subject line in patch 5: s/PCI host bus/PCI host bridge/
- Add Acked-by and Reviewed-by tags from Ani


Mark Cave-Ayland (6):
  hw/acpi/viot: rename build_pci_range_node() to
    enumerate_pci_host_bridges()
  hw/acpi/viot: move the individual PCI host bridge entry generation to
    a new function
  hw/acpi/viot: build array of PCI host bridges before generating VIOT
    ACPI table
  tests/acpi: virt: allow VIOT acpi table changes
  hw/acpi/viot: sort VIOT ACPI table entries by PCI host bridge min_bus
  tests/acpi: virt: update golden masters for VIOT

 hw/acpi/viot.c                | 107 +++++++++++++++++++++-------------
 tests/data/acpi/q35/VIOT.viot | Bin 112 -> 112 bytes
 2 files changed, 68 insertions(+), 39 deletions(-)

-- 
2.20.1


