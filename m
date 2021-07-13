Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C663C6793
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:44:39 +0200 (CEST)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m36XO-0005Df-KQ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36VH-0003lK-4T
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36VD-0001kc-Dc
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626136942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k4ixUJaCte22YJFqYEZXGbb153LfQh6mvp+haFAsx5k=;
 b=gQfXHkrJsfS4dz2REvTAnnJjTkrMfOcf1VHQO2KEeSmzZGA6HjkbVD1fwBujlrrQwQE8yo
 8U7o8jiQpN/MTvywzJNfqr+vWPMKHkInMqKknmDoax/asPhWkbT8Hmp4BghtPl1TruEsy/
 6HNejH37rd15eeZGFRenjW9+6EBQBpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-CdOgTiynON6yPmx0lKAyFQ-1; Mon, 12 Jul 2021 20:42:18 -0400
X-MC-Unique: CdOgTiynON6yPmx0lKAyFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C70362F9;
 Tue, 13 Jul 2021 00:42:17 +0000 (UTC)
Received: from pc-58.home (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 505AF5C1D1;
 Tue, 13 Jul 2021 00:42:09 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/6] Use ACPI PCI hot-plug for Q35
Date: Tue, 13 Jul 2021 02:41:59 +0200
Message-Id: <20210713004205.775386-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch set consists of two parts:
patches 1-3: introduce new feature
             'acpi-pci-hotplug-with-bridge-support' on Q35
patches 4-6: make the feature default along with changes in ACPI tables

With the feature disabled Q35 falls back to the native hot-plug.

Pros
    * no racy behavior during boot (see 110c477c2ed)
    * eject is possible - according to PCIe spec, attention button
      press should lead to power off, and then the adapter should be
      removed manually. As there is no power down state exists in QEMU,
      we cannot distinguish between an eject and a power down
      request.
    * no delay during deleting - after the actual power off software
      must wait at least 1 second before indicating about it. This case
      is quite important for users, it even has its own bug:
          https://bugzilla.redhat.com/show_bug.cgi?id=1594168
    * no timer-based behavior - in addition to the previous example,
      the attention button has a 5-second waiting period, during which
      the operation can be canceled with a second press. While this
      looks fine for manual button control, automation will result in
      the need to queue or drop events, and the software receiving
      events in all sort of unspecified combinations of attention/power
      indicator states, which is racy and uppredictable.
    * fixes or reduces the likelihood of the bugs:
        * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
        * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
        * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
        * https://bugzilla.redhat.com/show_bug.cgi?id=1678290

Cons:
    * no access to possible features presented in slot capabilities
      (this is only surprise removal AFAIK)

v6:
    * move acpi_pcihp_disable_root_bus() changes into "Enable ACPI
      PCI hot-plug" patch
    * fix mips compilation [Michael, Marcel]
    * additional check in pm_reset() [David]
    * rename property to "native-hotplug" [Igor]

v5:
    * make sugar property on TYPE_PCIE_SLOT
      instead of old TYPE_MACHINE property [Igor]
    * minor style changes
v4:
    * regain per-port control over hot-plug
    * rebased over acpi-index changes
    * set property on machine type to
      make pci code more generic [Igor, Michael]

v3:
    * drop change of _OSC to allow SHPC on hotplugged bridges
    * use 'acpi-root-pci-hotplug'
    * add migration states [Igor]
    * minor style changes

v2:
    * new ioport range for acpiphp [Gerd]
    * drop find_pci_host() [Igor]
    * explain magic numbers in _OSC [Igor]
    * drop build_q35_pci_hotplug() wrapper [Igor]

Julia Suvorova (6):
  hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
  hw/acpi/ich9: Enable ACPI PCI hot-plug
  hw/pci/pcie: Do not set HPC flag if acpihp is used
  bios-tables-test: Allow changes in DSDT ACPI tables
  hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
  bios-tables-test: Update golden binaries

 hw/i386/acpi-build.h              |   5 +++
 include/hw/acpi/ich9.h            |   5 +++
 include/hw/acpi/pcihp.h           |   3 +-
 include/hw/pci/pcie_port.h        |   5 ++-
 hw/acpi/acpi-x86-stub.c           |   6 +++
 hw/acpi/ich9.c                    |  70 ++++++++++++++++++++++++++++++
 hw/acpi/pcihp.c                   |  26 ++++++++---
 hw/acpi/piix4.c                   |   4 +-
 hw/core/machine.c                 |   1 -
 hw/i386/acpi-build.c              |  44 ++++++++++++-------
 hw/i386/pc.c                      |   1 +
 hw/i386/pc_q35.c                  |  11 +++++
 hw/pci/pcie.c                     |   8 +++-
 hw/pci/pcie_port.c                |   1 +
 tests/data/acpi/q35/DSDT          | Bin 7859 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9184 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7877 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8323 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9513 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7934 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9218 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8990 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet   | Bin 7717 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7865 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8465 -> 8894 bytes
 25 files changed, 165 insertions(+), 25 deletions(-)

-- 
2.30.2


