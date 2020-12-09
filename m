Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C382D48AC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:14:22 +0100 (CET)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3yn-00063w-VN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rM-0000v7-S8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rG-0007YV-4X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hxYvRXPZ9rfs8WB3F+xYwx6uhCcco23WoudpajOc5/8=;
 b=CXjrXvbm3OoMFJdjgcu8yLUWoNpj4zAP/QB6i18Xpvvh5RuyRZ+eSwlkmrRCTsEGfjvNEb
 /RR+TIwTq5UchJAPnBVgdmr/TupC7mYb8upguU+2ixmuPEXEIkNrXADt1f/3pPV2z/owRy
 Pqb4fE4FH4E/cjrv//fBi1qvksx90Wc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-BiuUK45XMAW2xF4X2BQpOg-1; Wed, 09 Dec 2020 13:06:28 -0500
X-MC-Unique: BiuUK45XMAW2xF4X2BQpOg-1
Received: by mail-wr1-f72.google.com with SMTP id d2so957629wrr.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=hxYvRXPZ9rfs8WB3F+xYwx6uhCcco23WoudpajOc5/8=;
 b=ButyDmBDsxUxuQcpKU13uTNaQupM2lBI/XxU3u7idrzYneUKFqj0oQDVXOquuRQ13E
 k272MGy6fRpzlKw2Prn409b0WMgiGs02AQb75/v758xz/ObjTC/06Y2O/WM+hmPM1tu4
 i3gLMBcXpQtYGA5etGKxck0DSUdw2uF2yWJvMsTatfTsso3Lfo9y/MaUSQGExQ8f03du
 xN1oy98xx3R/a5yr22tJLo/JsVZGDjLasT5k8Nx3bN6rwuzgau5kPmemgvxf2lGizWTv
 NrBUs+x0X3atwcM57/5u1XNGRZulXRSkhoSV0Gf9wTVm2LtODcbxp78YdnOFUK9ijazr
 l96g==
X-Gm-Message-State: AOAM5303cC6JX5PbwV03em8G04mN4KMExXpkAg1He+x6efVuvlMdYXty
 5SydKQFDhuNj2cIs+VJW+FSVpAniF1qHMuS5DHAvSTnu4zSRQetOJxieMmId+oJZGjI4a/ASC+x
 9NIDSvT4BiW4c5BiQ2IzgZVVSP23Q6tqMYxVw4JaVYgfQHx5MW3X8NGljERIk
X-Received: by 2002:adf:fdcb:: with SMTP id i11mr3906473wrs.349.1607537186328; 
 Wed, 09 Dec 2020 10:06:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY+Ja+uo1d0tYCB3TyTtkMOt7mpwxNUa3djSzGlwpllpS9sOmfPSNHXZEwyRAR2f4Vo3RoTA==
X-Received: by 2002:adf:fdcb:: with SMTP id i11mr3906443wrs.349.1607537186073; 
 Wed, 09 Dec 2020 10:06:26 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c4sm4912080wrw.72.2020.12.09.10.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:06:25 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/65] pc,pci,virtio: fixes, cleanups
Message-ID: <20201209180546.721296-1-mst@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:

  Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to fdfa3b1d6f9edd97c807df496a0d8e9ea49240da:

  hw/virtio-pci Added AER capability. (2020-12-09 13:04:17 -0500)

----------------------------------------------------------------
pc,pci,virtio: fixes, cleanups

Lots of fixes, cleanups.
CPU hot-unplug improvements.
A new AER property for virtio devices, adding a dummy AER capability.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Chen (1):
      vhost-user-scsi: Fix memleaks in vus_proc_req()

Andrew Melnychenko (2):
      hw/virtio-pci Added counter for pcie capabilities offsets.
      hw/virtio-pci Added AER capability.

Cornelia Huck (1):
      hw: add compat machines for 6.0

Erich-McMillan (1):
      hw/i386/pc: add max combined fw size as machine configuration option

Eugenio Pérez (5):
      memory: Rename memory_region_notify_one to memory_region_notify_iommu_one
      memory: Add IOMMUTLBEvent
      memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType
      intel_iommu: Skip page walking on device iotlb invalidations
      memory: Skip bad range assertion if notifier is DEVIOTLB_UNMAP type

Igor Mammedov (7):
      acpi: cpuhp: introduce 'firmware performs eject' status/control bits
      x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug
      tests/acpi: allow expected files change
      x86: acpi: let the firmware handle pending "CPU remove" events in SMM
      tests/acpi: update expected files
      x86: ich9: factor out "guest_cpu_hotplug_features"
      x86: ich9: let firmware negotiate 'CPU hot-unplug with SMI' feature

Jiahui Cen (2):
      fw_cfg: Refactor extra pci roots addition
      hw/arm/virt: Write extra pci roots into fw_cfg

John Levon (1):
      virtio: reset device on bad guest index in virtio_load()

Juan Quintela (26):
      failover: fix indentantion
      failover: Use always atomics for primary_should_be_hidden
      failover: primary bus is only used once, and where it is set
      failover: Remove unused parameter
      failover: Remove external partially_hotplugged property
      failover: qdev_device_add() returns err or dev set
      failover: Rename bool to failover_primary_hidden
      failover: g_strcmp0() knows how to handle NULL
      failover: Remove primary_device_opts
      failover: remove standby_id variable
      failover: Remove primary_device_dict
      failover: Remove memory leak
      failover: simplify virtio_net_find_primary()
      failover: should_be_hidden() should take a bool
      failover: Rename function to hide_device()
      failover: virtio_net_connect_failover_devices() does nothing
      failover: Rename to failover_find_primary_device()
      failover: simplify qdev_device_add() failover case
      failover: simplify qdev_device_add()
      failover: make sure that id always exist
      failover: remove failover_find_primary_device() error parameter
      failover: split failover_find_primary_device_id()
      failover: We don't need to cache primary_device_id anymore
      failover: Caller of this two functions already have primary_dev
      failover: simplify failover_unplug_primary
      failover: Remove primary_dev member

Marc-André Lureau (7):
      libvhost-user: replace qemu/bswap.h with glibc endian.h
      libvhost-user: replace qemu/memfd.h usage
      libvhost-user: remove qemu/compiler.h usage
      libvhost-user: drop qemu/osdep.h dependency
      libvhost-user: make it a meson subproject
      libvhost-user: add a simple link test without glib
      .gitlab-ci: add build-libvhost-user

Stefan Hajnoczi (4):
      contrib/vhost-user-blk: avoid g_return_val_if() input validation
      contrib/vhost-user-gpu: avoid g_return_val_if() input validation
      contrib/vhost-user-input: avoid g_return_val_if() input validation
      block/export: avoid g_return_val_if() input validation

Yubo Miao (7):
      acpi/gpex: Extract two APIs from acpi_dsdt_add_pci
      acpi: Extract crs build form acpi_build.c
      acpi/gpex: Build tables for pxb
      acpi: Align the size to 128k
      unit-test: The files changed.
      unit-test: Add testcase for pxb
      unit-test: Add the binary file and clear diff.h

Zenghui Yu (1):
      pcie_aer: Fix help message of pcie_aer_inject_error command

 docs/specs/acpi_cpu_hotplug.txt                    |  19 +-
 contrib/vhost-user-gpu/vugpu.h                     |   2 +-
 hw/virtio/virtio-pci.h                             |   4 +
 include/exec/memory.h                              |  40 +--
 include/hw/acpi/aml-build.h                        |  22 ++
 include/hw/acpi/cpu.h                              |   2 +
 include/hw/arm/virt.h                              |   1 +
 include/hw/boards.h                                |   3 +
 include/hw/i386/pc.h                               |   5 +
 include/hw/nvram/fw_cfg.h                          |   9 +
 include/hw/pci-host/gpex.h                         |   1 +
 include/hw/qdev-core.h                             |  28 +-
 include/hw/virtio/virtio-net.h                     |   9 +-
 include/qemu/vhost-user-server.h                   |   2 +-
 .../libvhost-user/libvhost-user-glib.h             |   0
 .../libvhost-user/libvhost-user.h                  |   0
 block/export/vhost-user-blk-server.c               |   6 +-
 contrib/vhost-user-blk/vhost-user-blk.c            |   7 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c            |   4 +-
 contrib/vhost-user-input/main.c                    |   7 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c          |   5 +-
 hw/acpi/aml-build.c                                | 285 ++++++++++++++++++++
 hw/acpi/cpu.c                                      |  26 +-
 hw/arm/smmu-common.c                               |  13 +-
 hw/arm/smmuv3.c                                    |  13 +-
 hw/arm/virt-acpi-build.c                           |  31 ++-
 hw/arm/virt.c                                      |  18 +-
 hw/core/machine.c                                  |   3 +
 hw/core/qdev.c                                     |  19 +-
 hw/i386/acpi-build.c                               | 298 +--------------------
 hw/i386/intel_iommu.c                              |  92 ++++---
 hw/i386/pc.c                                       |  74 +++--
 hw/i386/pc_piix.c                                  |  14 +-
 hw/i386/pc_q35.c                                   |  13 +-
 hw/i386/pc_sysfw.c                                 |  15 +-
 hw/isa/lpc_ich9.c                                  |  16 +-
 hw/misc/tz-mpc.c                                   |  32 ++-
 hw/net/virtio-net.c                                | 298 ++++++++-------------
 hw/nvram/fw_cfg.c                                  |  23 ++
 hw/pci-host/gpex-acpi.c                            | 166 ++++++++----
 hw/ppc/spapr.c                                     |  17 +-
 hw/ppc/spapr_iommu.c                               |  15 +-
 hw/s390x/s390-pci-inst.c                           |  27 +-
 hw/s390x/s390-virtio-ccw.c                         |  14 +-
 hw/virtio/vhost.c                                  |   2 +-
 hw/virtio/virtio-iommu.c                           |  30 ++-
 hw/virtio/virtio-pci.c                             |  20 +-
 hw/virtio/virtio.c                                 |  15 +-
 softmmu/memory.c                                   |  29 +-
 softmmu/qdev-monitor.c                             |  41 +--
 .../libvhost-user/libvhost-user-glib.c             |  10 +-
 .../libvhost-user/libvhost-user.c                  | 132 +++++----
 subprojects/libvhost-user/link-test.c              |  45 ++++
 tests/qtest/bios-tables-test.c                     |  58 +++-
 tests/vhost-user-bridge.c                          |   2 +-
 tools/virtiofsd/fuse_virtio.c                      |   2 +-
 .gitlab-ci.yml                                     |  11 +
 contrib/libvhost-user/meson.build                  |   4 -
 contrib/vhost-user-blk/meson.build                 |   3 +-
 contrib/vhost-user-gpu/meson.build                 |   3 +-
 contrib/vhost-user-input/meson.build               |   3 +-
 contrib/vhost-user-scsi/meson.build                |   3 +-
 hmp-commands.hx                                    |   4 +-
 hw/acpi/trace-events                               |   2 +
 meson.build                                        |   7 +-
 subprojects/libvhost-user/meson.build              |  24 ++
 tests/data/acpi/pc/DSDT                            | Bin 5060 -> 5065 bytes
 tests/data/acpi/pc/DSDT.acpihmat                   | Bin 6385 -> 6390 bytes
 tests/data/acpi/pc/DSDT.bridge                     | Bin 6919 -> 6924 bytes
 tests/data/acpi/pc/DSDT.cphp                       | Bin 5524 -> 5529 bytes
 tests/data/acpi/pc/DSDT.dimmpxm                    | Bin 6714 -> 6719 bytes
 tests/data/acpi/pc/DSDT.hpbridge                   | Bin 5021 -> 5026 bytes
 tests/data/acpi/pc/DSDT.hpbrroot                   | Bin 3079 -> 3084 bytes
 tests/data/acpi/pc/DSDT.ipmikcs                    | Bin 5132 -> 5137 bytes
 tests/data/acpi/pc/DSDT.memhp                      | Bin 6419 -> 6424 bytes
 tests/data/acpi/pc/DSDT.numamem                    | Bin 5066 -> 5071 bytes
 tests/data/acpi/pc/DSDT.roothp                     | Bin 5256 -> 5261 bytes
 tests/data/acpi/q35/DSDT                           | Bin 7796 -> 7801 bytes
 tests/data/acpi/q35/DSDT.acpihmat                  | Bin 9121 -> 9126 bytes
 tests/data/acpi/q35/DSDT.bridge                    | Bin 7814 -> 7819 bytes
 tests/data/acpi/q35/DSDT.cphp                      | Bin 8260 -> 8265 bytes
 tests/data/acpi/q35/DSDT.dimmpxm                   | Bin 9450 -> 9455 bytes
 tests/data/acpi/q35/DSDT.ipmibt                    | Bin 7871 -> 7876 bytes
 tests/data/acpi/q35/DSDT.memhp                     | Bin 9155 -> 9160 bytes
 tests/data/acpi/q35/DSDT.mmio64                    | Bin 8927 -> 8932 bytes
 tests/data/acpi/q35/DSDT.numamem                   | Bin 7802 -> 7807 bytes
 tests/data/acpi/q35/DSDT.tis                       | Bin 8402 -> 8407 bytes
 tests/data/acpi/virt/DSDT.pxb                      | Bin 0 -> 7802 bytes
 tests/meson.build                                  |   3 +-
 tools/virtiofsd/meson.build                        |   3 +-
 90 files changed, 1296 insertions(+), 858 deletions(-)
 rename {contrib => subprojects}/libvhost-user/libvhost-user-glib.h (100%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user.h (100%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user-glib.c (93%)
 rename {contrib => subprojects}/libvhost-user/libvhost-user.c (96%)
 create mode 100644 subprojects/libvhost-user/link-test.c
 delete mode 100644 contrib/libvhost-user/meson.build
 create mode 100644 subprojects/libvhost-user/meson.build
 create mode 100644 tests/data/acpi/virt/DSDT.pxb


