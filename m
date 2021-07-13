Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBD3C798A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:20:06 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ql3-0001lp-Pv
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QbY-0006Tg-TG
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QbT-0007Vm-Du
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lyp89ZPtX0m2AdteMnhWIX5MkjMSEjvK2F/qngcfcBM=;
 b=amgsidvh9pVW+wH2JWcNmwFA1b2FuL/27yHG8JtFfaVY4cOJgnYf2YZl2HE2C3dD2epSxg
 Qoo/5hW6Tdv1VC1XRAOayF34YK7QvV+4FITizmMEXCG9vV7Biigih3eF3Wle6mllrdGuQO
 8HIfg3IsYJlaV1jK8md+8Bw6hTraTzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-kKS4tevQM8qszJWQIM2eoA-1; Tue, 13 Jul 2021 18:10:06 -0400
X-MC-Unique: kKS4tevQM8qszJWQIM2eoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso150124wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=lyp89ZPtX0m2AdteMnhWIX5MkjMSEjvK2F/qngcfcBM=;
 b=YVgIXyiAhMPK8HKwCbB/W5pQ5euEolmj1u9NbPRs19GbviSHjniuGJjPsS9zeTA0mH
 sahV8NDzpKPCzWsgjDYs6KW81kjzstlk+ooS7mPwBVRQRlBo4StYRgIfq76vtVWUV7M5
 /o51CLW9XJKnWQlNJ/Q07n2wdE+uEbi4XG/L+FaVXEC3Vj5ShWwty7ot0X49g0aHC2zp
 rrXlF/WPdjELyWG6eH376HA0P7dJodDOAwg5qMtNTpJlFlh/5Oj7fKHWkLcNafts52oL
 6X9FKON6x4DEQ1NrT5SVwuvMDIvugkXrQONFLLvbz8WXK9FbPvg4FnjY5BJAdUDV8NqD
 Kong==
X-Gm-Message-State: AOAM532KFh1JtxU6PHI42/k5fUjbtkssP9rRRfFfZ/1bEh+4qu+RfIwM
 HaO73VX9XJkIHxxscNF5T0dGUEfP2gSNxrQaUdokA7Avr3/hEX91Ca5poeDgQqhu+NEP8ZZdsAV
 o5Sl6aE6ygiFb9hgMJvUtJSW9LAlxv3r1HpcMz6LBKygf8K5eqA6jAb1X2KJM
X-Received: by 2002:adf:ba07:: with SMTP id o7mr8416342wrg.160.1626214205224; 
 Tue, 13 Jul 2021 15:10:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7uzgOr5hzjh2wAT8lW/GVNF2jwXJUSMTwcTnRc/OfdTlgxvFYQrcSaEcNjzzsf9pVCUqhSw==
X-Received: by 2002:adf:ba07:: with SMTP id o7mr8416307wrg.160.1626214204858; 
 Tue, 13 Jul 2021 15:10:04 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id l2sm242439wms.21.2021.07.13.15.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:04 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] pc,pci,virtio: lots of new features
Message-ID: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' into staging (2021-07-13 14:32:20 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to cf171f90d5e41730ad3e0ce23f1990f34b7e63ef:

  vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-13 16:59:12 -0400)

----------------------------------------------------------------
pc,pci,virtio: lots of new features

Lots of last minute stuff.

vhost-user-rng.
vhost-user-i2c.
vhost-vsock SOCK_SEQPACKET support.
IOMMU bypass.
ACPI based pci hotplug.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Arseny Krasnov (1):
      vhost-vsock: SOCK_SEQPACKET feature bit support

Julia Suvorova (6):
      hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
      hw/acpi/ich9: Enable ACPI PCI hot-plug
      hw/pci/pcie: Do not set HPC flag if acpihp is used
      bios-tables-test: Allow changes in DSDT ACPI tables
      hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
      bios-tables-test: Update golden binaries

Mathieu Poirier (4):
      vhost-user-rng: Add vhost-user-rng implementation
      vhost-user-rng-pci: Add vhost-user-rng-pci implementation
      vhost-user-rng: backend: Add RNG vhost-user daemon implementation
      docs: Add documentation for vhost based RNG implementation

Peter Xu (1):
      docs: Add '-device intel-iommu' entry

Viresh Kumar (2):
      hw/virtio: add boilerplate for vhost-user-i2c device
      hw/virtio: add vhost-user-i2c-pci boilerplate

Xingang Wang (9):
      hw/pci/pci_host: Allow PCI host to bypass iommu
      hw/pxb: Add a bypass iommu property
      hw/arm/virt: Add default_bus_bypass_iommu machine option
      hw/i386: Add a default_bus_bypass_iommu pc machine option
      hw/pci: Add pci_bus_range() to get PCI bus number range
      hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3
      hw/i386/acpi-build: Add DMAR support to bypass iommu
      hw/i386/acpi-build: Add IVRS support to bypass iommu
      docs: Add documentation for iommu bypass

 docs/bypass-iommu.txt                    |  89 +++++++
 hw/i386/acpi-build.h                     |   5 +
 include/hw/acpi/ich9.h                   |   5 +
 include/hw/acpi/pcihp.h                  |   3 +-
 include/hw/arm/virt.h                    |   1 +
 include/hw/i386/pc.h                     |   1 +
 include/hw/pci/pci.h                     |   2 +
 include/hw/pci/pci_host.h                |   1 +
 include/hw/pci/pcie_port.h               |   5 +-
 include/hw/virtio/vhost-user-i2c.h       |  28 +++
 include/hw/virtio/vhost-user-rng.h       |  33 +++
 hw/acpi/acpi-x86-stub.c                  |   6 +
 hw/acpi/ich9.c                           |  70 ++++++
 hw/acpi/pcihp.c                          |  26 +-
 hw/acpi/piix4.c                          |   4 +-
 hw/arm/virt-acpi-build.c                 | 114 ++++++++-
 hw/arm/virt.c                            |  26 ++
 hw/core/machine.c                        |   1 -
 hw/i386/acpi-build.c                     | 114 +++++++--
 hw/i386/pc.c                             |  21 ++
 hw/i386/pc_q35.c                         |  11 +
 hw/pci-bridge/pci_expander_bridge.c      |   3 +
 hw/pci-host/q35.c                        |   2 +
 hw/pci/pci.c                             |  34 ++-
 hw/pci/pci_host.c                        |   1 +
 hw/pci/pcie.c                            |   8 +-
 hw/pci/pcie_port.c                       |   1 +
 hw/virtio/vhost-user-i2c-pci.c           |  69 ++++++
 hw/virtio/vhost-user-i2c.c               | 288 ++++++++++++++++++++++
 hw/virtio/vhost-user-rng-pci.c           |  79 ++++++
 hw/virtio/vhost-user-rng.c               | 294 ++++++++++++++++++++++
 hw/virtio/vhost-vsock.c                  |  12 +-
 tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++++++++++
 docs/tools/index.rst                     |   1 +
 docs/tools/vhost-user-rng.rst            |  74 ++++++
 hw/virtio/Kconfig                        |  10 +
 hw/virtio/meson.build                    |   4 +
 qemu-options.hx                          |  33 +++
 tests/data/acpi/q35/DSDT                 | Bin 7859 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat        | Bin 9184 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge          | Bin 7877 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp            | Bin 8323 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm         | Bin 9513 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt          | Bin 7934 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp           | Bin 9218 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64          | Bin 8990 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet          | Bin 7717 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem         | Bin 7865 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis             | Bin 8465 -> 8894 bytes
 tools/meson.build                        |   8 +
 tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
 tools/vhost-user-rng/meson.build         |  10 +
 52 files changed, 1863 insertions(+), 42 deletions(-)
 create mode 100644 docs/bypass-iommu.txt
 create mode 100644 include/hw/virtio/vhost-user-i2c.h
 create mode 100644 include/hw/virtio/vhost-user-rng.h
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c
 create mode 100644 hw/virtio/vhost-user-i2c.c
 create mode 100644 hw/virtio/vhost-user-rng-pci.c
 create mode 100644 hw/virtio/vhost-user-rng.c
 create mode 100644 tools/vhost-user-rng/main.c
 create mode 100644 docs/tools/vhost-user-rng.rst
 create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
 create mode 100644 tools/vhost-user-rng/meson.build


