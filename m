Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B176244BB41
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 06:33:00 +0100 (CET)
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgEF-0003Bf-Ah
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 00:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgCS-0001st-PH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1mkgCP-00053c-0V
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 00:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636522262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vbS6LaTqTN/wYJ9JK1se3A3YZfldkNzkQ5ZJdcEbyKw=;
 b=hD0FN8tsU+0rLwv+xBaVT4L4RbnVcA9hto6bT9jG5bnANqkrwml2GnKIre355jDxtqTtsU
 tF4JmWO0l8wQKLOEUBSBG+8p+C1ZTp+0vd9UYvTSw3k1AkltF4NCJEBAfMsEYJIZ+D1Hab
 lhsMxvyK5JG4ScGhAZk4NKMKcTqffa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-Xsc_oh7hPQaaBL3mekg7IQ-1; Wed, 10 Nov 2021 00:31:01 -0500
X-MC-Unique: Xsc_oh7hPQaaBL3mekg7IQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B1951808312;
 Wed, 10 Nov 2021 05:31:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 305815E274;
 Wed, 10 Nov 2021 05:30:18 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Fix Q35 ACPI PCI Hot-plug I/O issues
Date: Wed, 10 Nov 2021 06:30:09 +0100
Message-Id: <20211110053014.489591-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempt [1] to fix I/O allocation with the 'reserve-io' hint on each
pcie-root-port resulted in regression [2-3]. This patchset aims to fix
it by addressing the root cause of the problem - the disabled PCIe
Slot HPC bit.

[1] 'hw/pcie-root-port: Fix hotplug for PCI devices requiring IO'
[2] https://gitlab.com/qemu-project/qemu/-/issues/641
[3] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Julia Suvorova (5):
  hw/pci/pcie_port: Rename 'native-hotplug' to 'native-hpc-bit'
  hw/acpi/ich9: Add compatibility option for 'native-hpc-bit'
  bios-tables-test: Allow changes in DSDT ACPI tables
  hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
  bios-tables-test: Update golden binaries

 include/hw/acpi/ich9.h                    |   1 +
 include/hw/pci/pcie_port.h                |   2 +-
 hw/acpi/ich9.c                            |  18 ++++++++++++++++++
 hw/i386/acpi-build.c                      |  12 ++++++++----
 hw/i386/pc.c                              |   2 ++
 hw/i386/pc_q35.c                          |   9 +++++++--
 hw/pci-bridge/gen_pcie_root_port.c        |   6 +++++-
 hw/pci/pcie.c                             |   2 +-
 hw/pci/pcie_port.c                        |   2 +-
 tests/data/acpi/q35/DSDT                  | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat         | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge           | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp             | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm          | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.dmar             | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.ipmibt           | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.ivrs             | Bin 8306 -> 8306 bytes
 tests/data/acpi/q35/DSDT.memhp            | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64           | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge     | Bin 8583 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet           | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.nosmm            | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.numamem          | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.smm-compat       | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.smm-compat-nosmm | Bin 0 -> 8289 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12        | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2         | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.xapic            | Bin 35652 -> 35652 bytes
 28 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.dmar
 create mode 100644 tests/data/acpi/q35/DSDT.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.smm-compat
 create mode 100644 tests/data/acpi/q35/DSDT.smm-compat-nosmm

-- 
2.31.1


