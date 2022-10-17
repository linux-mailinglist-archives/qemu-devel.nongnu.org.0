Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FA600C7E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:33:10 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQi-0006Sk-4j
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG0-0005Vd-3X
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNFu-0002jD-AH
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ieVBC+b1qbCY+n+ROdp3hhHF1FD2iIsd9fjM2tuSNdE=;
 b=UMegbpdbalCcKGRkM3bm66ASoD8tJd9oPRnG0ceZ+tw9hUNFgV5wH6tNPDjeZIoXRKElUV
 aoL23ZJNWMb9vG8v3zKyQt+JV1H+TMHlgveas4dzDLdozf7RbkBZRsDYhje+5Mp5vd2SKC
 OwNy/ljZkayAcA/pqiY8Gn/WFopUs6I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-Mi7mCirsN9C_wkrua3ZcGQ-1; Mon, 17 Oct 2022 06:21:50 -0400
X-MC-Unique: Mi7mCirsN9C_wkrua3ZcGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9EA85A5A6;
 Mon, 17 Oct 2022 10:21:49 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B55F5492B04;
 Mon, 17 Oct 2022 10:21:48 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 00/11] x86: clean up ACPI PCI code part 2
Date: Mon, 17 Oct 2022 12:21:35 +0200
Message-Id: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Series continues refactoring started at recently merged [1].
It replaces special cases/quirks for ISA/SMB bridges and PCI
attached VGA devices with generic AcpiDevAmlIf interface,
which allows device to provide its own AML description
without need for adhoc plumbing in generic DSDT or PCI
enumeration code.

PS:
at the end, \_GPE clean up patches which are not part of
AcpiDevAmlIf refactoring but iti's still related to PCI,
so I've included them there as well.

 1)
  https://patchwork.ozlabs.org/project/qemu-devel/list/?series=303856

Igor Mammedov (11):
  acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device
    descriptors
  tests: acpi: whitelist DSDT before generating PCI-ISA bridge AML
    automatically
  acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines and let bus
    ennumeration generate AML
  tests: acpi: update expected DSDT after ISA bridge is moved directly
    under PCI host bridge
  tests: acpi: whitelist DSDT before generating ICH9_SMB AML
    automatically
  acpi: add get_dev_aml_func() helper
  acpi: enumerate SMB bridge automatically along with other PCI devices
  tests: acpi: update expected blobs
  tests: acpi: pc/q35 whitelist DSDT before \_GPE cleanup
  acpi: pc/35: sanitize _GPE declaration order
  tests: acpi: update expected blobs

 hw/display/vga_int.h                  |   2 +
 include/hw/acpi/acpi_aml_interface.h  |  13 +-
 hw/display/acpi-vga-stub.c            |   7 ++
 hw/display/acpi-vga.c                 |  26 ++++
 hw/display/meson.build                |  17 +++
 hw/display/vga-pci.c                  |   4 +
 hw/i386/acpi-build.c                  | 175 +++++---------------------
 hw/isa/lpc_ich9.c                     |  23 ++++
 hw/isa/piix3.c                        |  17 ++-
 tests/data/acpi/pc/DSDT               | Bin 6422 -> 6501 bytes
 tests/data/acpi/pc/DSDT.acpierst      | Bin 6382 -> 6461 bytes
 tests/data/acpi/pc/DSDT.acpihmat      | Bin 7747 -> 7826 bytes
 tests/data/acpi/pc/DSDT.bridge        | Bin 9496 -> 9575 bytes
 tests/data/acpi/pc/DSDT.cphp          | Bin 6886 -> 6965 bytes
 tests/data/acpi/pc/DSDT.dimmpxm       | Bin 8076 -> 8155 bytes
 tests/data/acpi/pc/DSDT.hpbridge      | Bin 6382 -> 6461 bytes
 tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3107 bytes
 tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6494 -> 6573 bytes
 tests/data/acpi/pc/DSDT.memhp         | Bin 7781 -> 7860 bytes
 tests/data/acpi/pc/DSDT.nohpet        | Bin 6280 -> 6359 bytes
 tests/data/acpi/pc/DSDT.numamem       | Bin 6428 -> 6507 bytes
 tests/data/acpi/pc/DSDT.roothp        | Bin 6656 -> 6699 bytes
 tests/data/acpi/q35/DSDT              | Bin 8320 -> 8412 bytes
 tests/data/acpi/q35/DSDT.acpierst     | Bin 8337 -> 8429 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9645 -> 9737 bytes
 tests/data/acpi/q35/DSDT.applesmc     | Bin 8366 -> 8458 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 11449 -> 11541 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8784 -> 8876 bytes
 tests/data/acpi/q35/DSDT.cxl          | Bin 9646 -> 9738 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9974 -> 10066 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8395 -> 8487 bytes
 tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8409 -> 8500 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8337 -> 8429 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9679 -> 9771 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9450 -> 9542 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8640 -> 8732 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8178 -> 8270 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8326 -> 8418 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8421 -> 8513 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8926 -> 9018 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8952 -> 9044 bytes
 tests/data/acpi/q35/DSDT.viot         | Bin 9429 -> 9521 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35683 -> 35775 bytes
 43 files changed, 135 insertions(+), 149 deletions(-)
 create mode 100644 hw/display/acpi-vga-stub.c
 create mode 100644 hw/display/acpi-vga.c

-- 
2.31.1


