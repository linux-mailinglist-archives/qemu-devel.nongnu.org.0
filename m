Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F4830C373
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:19:52 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xT5-0007Si-LH
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM4-0007vp-OF
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xM0-0006iK-Tc
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612278751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M4GaBFS7jVnOFAR7CuFO5xOXMoOMXc9Wjo+s3dt/Y6g=;
 b=XkT3hBYkOln4mqRLsaXqmkOAsCVzofEjthDctnjXzLhUk0IP9ONSOJvBQrsqV65hvRycmb
 QCxcb1afIoHIcGgbpv5JpK85RFGUxkt0SrGz1eYrilrFGkkqiwR3SIUpcsL9JeWDPobbxp
 I1aYgYXh4Jv82rUijkd3wLIFRA0npHY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-74vLhwTaPuaumm_gAfA1_Q-1; Tue, 02 Feb 2021 10:12:29 -0500
X-MC-Unique: 74vLhwTaPuaumm_gAfA1_Q-1
Received: by mail-wr1-f69.google.com with SMTP id l7so12768584wrp.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=M4GaBFS7jVnOFAR7CuFO5xOXMoOMXc9Wjo+s3dt/Y6g=;
 b=ZeXdWiIdjPu9ugOJtgyLeVT3FKCHhIQJ2GCX1PdSMYTMlg2uznde6vRynYjJB4zMwV
 JXSjMqYBLXR7VeIJE2pGQ6bDS4TPZJJWqchQAzyJiiMTfr0BBw8luusm23LjJwfET96/
 d8nkoqUEBr0RlqZu1yOEHbAsf2NSaOTtEYk5FmOteiYeqh2hn0yF8P66ycD3Z+9bNOR2
 Dzkkyvb/NaagxsD0BP8X36wu83xTtE1AfafBd9kquQ7H6uXPz9wERB3FVzWX6UbbCQIJ
 VdrGzuYe4+3axYO5UShRM0Tvq3PBJvBkeBjW7qWixTE+1JHnEMbNQfJe17Ed0nEgXAL5
 aWQw==
X-Gm-Message-State: AOAM5302TDA9xmuXgQ2J/JyvKTonHV8awshC421hLRPu1SKhqkg8QPQm
 zGqP+je55wD6APtiZOAOZvI5PnO4b2lnn9ziBwINn6xYFLgFf9UE4U8BFUeOoIqzkBgPxJ68puX
 fOTiwiF3Dl+vigFCMQo3dFhP9kgY1JBKBxNzk79pMosOB34Lshfb18wQpZawv
X-Received: by 2002:adf:e511:: with SMTP id j17mr24259063wrm.17.1612278747485; 
 Tue, 02 Feb 2021 07:12:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySwPYP/GyTzFOijchiHYrd4ZBEI15MKAT5p6eg797wmRJKGSRKHzQbkicvMPoi4/4SM86vow==
X-Received: by 2002:adf:e511:: with SMTP id j17mr24259040wrm.17.1612278747208; 
 Tue, 02 Feb 2021 07:12:27 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id b3sm4051845wme.32.2021.02.02.07.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:26 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] pc,virtio: fixes, features
Message-ID: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 737242ed5be0a7119aad55894148b3f5dec41200:

  virtio-pmem: add trace events (2021-01-27 08:02:39 -0500)

----------------------------------------------------------------
pc,virtio: fixes, features

Fixes all over the place.
Ability to control ACPI OEM ID's.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Eugenio Pérez (1):
      virtio: Add corresponding memory_listener_unregister to unrealize

Laurent Vivier (1):
      virtio-mmio: fix guest kernel crash with SHM regions

Marian Postevca (5):
      tests/acpi: allow updates for expected data files
      acpi: Permit OEM ID and OEM table ID fields to be changed
      tests/acpi: add OEM ID and OEM TABLE ID test
      tests/acpi: update expected data files
      tests/acpi: disallow updates for expected data files

Pankaj Gupta (1):
      virtio-pmem: add trace events

Stefano Garzarella (1):
      virtio: move 'use-disabled-flag' property to hw_compat_4_2

 hw/acpi/hmat.h                       |   3 +-
 hw/i386/acpi-common.h                |   3 +-
 include/hw/acpi/acpi-defs.h          |   2 +-
 include/hw/acpi/aml-build.h          |   8 +-
 include/hw/acpi/ghes.h               |   3 +-
 include/hw/acpi/pci.h                |   3 +-
 include/hw/acpi/vmgenid.h            |   2 +-
 include/hw/arm/virt.h                |   2 +
 include/hw/i386/microvm.h            |   4 +
 include/hw/i386/pc.h                 |   5 +-
 include/hw/mem/nvdimm.h              |   3 +-
 hw/acpi/aml-build.c                  |  29 +++---
 hw/acpi/ghes.c                       |   5 +-
 hw/acpi/hmat.c                       |   5 +-
 hw/acpi/nvdimm.c                     |  18 ++--
 hw/acpi/pci.c                        |   5 +-
 hw/acpi/vmgenid.c                    |   4 +-
 hw/arm/virt-acpi-build.c             |  40 ++++++---
 hw/arm/virt.c                        |  63 +++++++++++++
 hw/core/machine.c                    |   2 +-
 hw/i386/acpi-build.c                 |  86 ++++++++++++------
 hw/i386/acpi-common.c                |   5 +-
 hw/i386/acpi-microvm.c               |  13 +--
 hw/i386/microvm.c                    |  66 ++++++++++++++
 hw/i386/pc.c                         |  64 +++++++++++++
 hw/virtio/virtio-mmio.c              |   8 ++
 hw/virtio/virtio-pmem.c              |   4 +
 hw/virtio/virtio.c                   |   2 +-
 tests/qtest/bios-tables-test.c       | 170 ++++++++++++++++++++++++++++++-----
 hw/virtio/trace-events               |   5 ++
 tests/data/acpi/microvm/APIC         | Bin 70 -> 70 bytes
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 82 -> 82 bytes
 tests/data/acpi/microvm/APIC.pcie    | Bin 110 -> 110 bytes
 tests/data/acpi/microvm/DSDT         | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 365 -> 365 bytes
 tests/data/acpi/microvm/DSDT.pcie    | Bin 3031 -> 3031 bytes
 tests/data/acpi/microvm/DSDT.rtc     | Bin 404 -> 404 bytes
 tests/data/acpi/microvm/DSDT.usb     | Bin 414 -> 414 bytes
 tests/data/acpi/microvm/FACP         | Bin 268 -> 268 bytes
 tests/data/acpi/pc/APIC              | Bin 120 -> 120 bytes
 tests/data/acpi/pc/APIC.acpihmat     | Bin 128 -> 128 bytes
 tests/data/acpi/pc/APIC.cphp         | Bin 160 -> 160 bytes
 tests/data/acpi/pc/APIC.dimmpxm      | Bin 144 -> 144 bytes
 tests/data/acpi/pc/DSDT              | Bin 5065 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat     | Bin 6390 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge       | Bin 6924 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp         | Bin 5529 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm      | Bin 6719 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge     | Bin 5026 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot     | Bin 3084 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs      | Bin 5137 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp        | Bin 6424 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem      | Bin 5071 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp       | Bin 5261 -> 5261 bytes
 tests/data/acpi/pc/FACP              | Bin 116 -> 116 bytes
 tests/data/acpi/pc/HMAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/HPET              | Bin 56 -> 56 bytes
 tests/data/acpi/pc/NFIT.dimmpxm      | Bin 240 -> 240 bytes
 tests/data/acpi/pc/SLIT.cphp         | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SLIT.memhp        | Bin 48 -> 48 bytes
 tests/data/acpi/pc/SRAT.acpihmat     | Bin 280 -> 280 bytes
 tests/data/acpi/pc/SRAT.cphp         | Bin 304 -> 304 bytes
 tests/data/acpi/pc/SRAT.dimmpxm      | Bin 392 -> 392 bytes
 tests/data/acpi/pc/SRAT.memhp        | Bin 264 -> 264 bytes
 tests/data/acpi/pc/SRAT.numamem      | Bin 224 -> 224 bytes
 tests/data/acpi/pc/SSDT.dimmpxm      | Bin 734 -> 734 bytes
 tests/data/acpi/pc/WAET              | Bin 40 -> 40 bytes
 tests/data/acpi/q35/APIC             | Bin 120 -> 120 bytes
 tests/data/acpi/q35/APIC.acpihmat    | Bin 128 -> 128 bytes
 tests/data/acpi/q35/APIC.cphp        | Bin 160 -> 160 bytes
 tests/data/acpi/q35/APIC.dimmpxm     | Bin 144 -> 144 bytes
 tests/data/acpi/q35/DSDT             | Bin 7801 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat    | Bin 9126 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge      | Bin 7819 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp        | Bin 8265 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm     | Bin 9455 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt      | Bin 7876 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp       | Bin 9160 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64      | Bin 8932 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem     | Bin 7807 -> 7807 bytes
 tests/data/acpi/q35/DSDT.tis         | Bin 8407 -> 8407 bytes
 tests/data/acpi/q35/FACP             | Bin 244 -> 244 bytes
 tests/data/acpi/q35/HMAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/HPET             | Bin 56 -> 56 bytes
 tests/data/acpi/q35/MCFG             | Bin 60 -> 60 bytes
 tests/data/acpi/q35/NFIT.dimmpxm     | Bin 240 -> 240 bytes
 tests/data/acpi/q35/SLIT.cphp        | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SLIT.memhp       | Bin 48 -> 48 bytes
 tests/data/acpi/q35/SRAT.acpihmat    | Bin 280 -> 280 bytes
 tests/data/acpi/q35/SRAT.cphp        | Bin 304 -> 304 bytes
 tests/data/acpi/q35/SRAT.dimmpxm     | Bin 392 -> 392 bytes
 tests/data/acpi/q35/SRAT.memhp       | Bin 264 -> 264 bytes
 tests/data/acpi/q35/SRAT.mmio64      | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SRAT.numamem     | Bin 224 -> 224 bytes
 tests/data/acpi/q35/SSDT.dimmpxm     | Bin 734 -> 734 bytes
 tests/data/acpi/q35/TPM2.tis         | Bin 76 -> 76 bytes
 tests/data/acpi/q35/WAET             | Bin 40 -> 40 bytes
 tests/data/acpi/virt/APIC            | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.memhp      | Bin 168 -> 168 bytes
 tests/data/acpi/virt/APIC.numamem    | Bin 168 -> 168 bytes
 tests/data/acpi/virt/DSDT            | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp      | Bin 6565 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem    | Bin 5204 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb        | Bin 7689 -> 7689 bytes
 tests/data/acpi/virt/FACP            | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.memhp      | Bin 268 -> 268 bytes
 tests/data/acpi/virt/FACP.numamem    | Bin 268 -> 268 bytes
 tests/data/acpi/virt/GTDT            | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp      | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem    | Bin 96 -> 96 bytes
 tests/data/acpi/virt/MCFG            | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.memhp      | Bin 60 -> 60 bytes
 tests/data/acpi/virt/MCFG.numamem    | Bin 60 -> 60 bytes
 tests/data/acpi/virt/NFIT.memhp      | Bin 224 -> 224 bytes
 tests/data/acpi/virt/SLIT.memhp      | Bin 48 -> 48 bytes
 tests/data/acpi/virt/SPCR            | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.memhp      | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SPCR.numamem    | Bin 80 -> 80 bytes
 tests/data/acpi/virt/SRAT.memhp      | Bin 226 -> 226 bytes
 tests/data/acpi/virt/SRAT.numamem    | Bin 106 -> 106 bytes
 tests/data/acpi/virt/SSDT.memhp      | Bin 736 -> 736 bytes
 121 files changed, 514 insertions(+), 118 deletions(-)


