Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2014CF96A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:04:43 +0100 (CET)
Received: from localhost ([::1]:52494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAEL-0002Tq-TU
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:04:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABI-0008BK-V4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABH-0002YC-1j
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wv2HnjeYTwYcimQHP6ud3085wSXurorrWyk2Pf3Ibzc=;
 b=fxjYzdfpHjE74+xcFAzy8/ys0mzkGUlfqqJTIQmIP/K6KTWWOFtXcFVK2ouZIAyw0PXGW1
 rjXIgipu8P4qfsMxGYD+JcdFz5HEsZhR4tYKgSs0d2xoU5pl8FuvPsHKfr+xCnJjACa0V4
 ehdAtDIpACr5ffZafFfRxiEUMTFqxqk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-9yR6A1ALN1awbIBQfFYiAQ-1; Mon, 07 Mar 2022 05:01:27 -0500
X-MC-Unique: 9yR6A1ALN1awbIBQfFYiAQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso6738040ejk.17
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=wv2HnjeYTwYcimQHP6ud3085wSXurorrWyk2Pf3Ibzc=;
 b=b413ZQDhAjItaDpwFFl+/8ELB528vCP+H2RtjQ1MbjooygmtL6rzGttqz/rtBnRhjl
 /1XEaIx6oVJbLr4C1DK21CZPE5ehcQ6J8JhqTqazYZBU8V0W1tlH7TIWoQlBWTwxB9OE
 O97+Dnz16AKggaqpb0A53Md5X1yhNjE4vTHKi3P62S0cFYam8G1mo6LZCntRU472lWl5
 WktZCrHMjF6zf/w73dr3R4w+vqq7EvvSnux6FSv3QVYFZwwmGxlTNZYc35ZhBEeT+iJ8
 261w2BoykZ7/8zuvROnVghvd4ZE1e59foe/IRX0UpZYF/dKR+3SVtfXQtk0ZjG6YkK2D
 13Ig==
X-Gm-Message-State: AOAM530Dr0PbbDTpb8X9HaItoyvzfitID9dH6irz5Y3xmQAHEI3Fz06a
 AWDmV16JrrRfSUrEJ8jwd76n8SPjxPwTN++KJomHoafZSADCtk0CeviB3u9YrsyVf47SXeBLSBi
 tEGqpzkGSkO2sg36rF8ERMDzMe2k9SfAD53L+wWdubUaBC9BJUdiOUm7ZQyoA
X-Received: by 2002:a17:906:7706:b0:6d6:e521:5471 with SMTP id
 q6-20020a170906770600b006d6e5215471mr8435344ejm.387.1646647286011; 
 Mon, 07 Mar 2022 02:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1xRzeGuy14sIlvQiptiAru6klcOu2CSpiQD+39rkl62dlZyrm7oLsIodSZTKcRZVrgHX7EA==
X-Received: by 2002:a17:906:7706:b0:6d6:e521:5471 with SMTP id
 q6-20020a170906770600b006d6e5215471mr8435321ejm.387.1646647285718; 
 Mon, 07 Mar 2022 02:01:25 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 qp3-20020a170907206300b006da96b87e9csm4283974ejb.181.2022.03.07.02.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:25 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20220307100058.449628-1-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 41d137fc631bd9315ff84727d780757d25054c58:

  hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present (2022-03-06 16:06:16 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, cleanups, fixes

vhost-user enabled on non-linux systems
beginning of nvme sriov support
bigger tx queue for vdpa
virtio iommu bypass
An FADT flag to detect legacy keyboards.

Fixes, cleanups all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Ani Sinha (7):
      MAINTAINERS: no need to add my name explicitly as a reviewer for VIOT tables
      docs/acpi/erst: add device id for ACPI ERST device in pci-ids.txt
      hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
      hw/smbios: code cleanup - use macro definitions for table header handles
      hw/smbios: fix overlapping table handle numbers with large memory vms
      hw/smbios: add assertion to ensure handles of tables 19 and 32 do not collide
      hw/acpi/microvm: turn on 8042 bit in FADT boot architecture flags if present

Dov Murik (2):
      hw/i386: Improve bounds checking in OVMF table parsing
      hw/i386: Replace magic number with field length calculation

Eric DeVolder (1):
      ACPI ERST: specification for ERST support

Eugenio Pérez (1):
      virtio-net: Unlimit tx queue size if peer is vdpa

Halil Pasic (1):
      virtio: fix the condition for iommu_platform not supported

Igor Mammedov (4):
      pci: expose TYPE_XIO3130_DOWNSTREAM name
      acpi: pcihp: pcie: set power on cap on parent slot
      x86: cleanup unused compat_apic_id_mode
      pci: drop COMPAT_PROP_PCP for 2.0 machine types

Jason Wang (1):
      intel_iommu: support snoop control

Jean-Philippe Brucker (3):
      virtio-iommu: Default to bypass during boot
      virtio-iommu: Support bypass domain
      tests/qtest/virtio-iommu-test: Check bypass config

Joelle van Dyne (1):
      pc: add option to disable PS/2 mouse/keyboard

Jonathan Cameron (3):
      hw/pci-bridge/pxb: Fix missing swizzle
      pci-bridge/xio3130_upstream: Fix error handling
      pci-bridge/xio3130_downstream: Fix error handling

Knut Omang (2):
      pcie: Add support for Single Root I/O Virtualization (SR/IOV)
      pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt

Laurent Vivier (2):
      hw/virtio: vdpa: Fix leak of host-notifier memory-region
      vhost-vdpa: make notifiers _init()/_uninit() symmetric

Liav Albani (3):
      tests/acpi: i386: allow FACP acpi table changes
      hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT table
      tests/acpi: i386: update FACP table differences

Michael S. Tsirkin (1):
      qom: assert integer does not overflow

Patrick Venture (1):
      hw/smbios: Add table 4 parameter, "processor-id"

Sergio Lopez (4):
      event_notifier: add event_notifier_get_wfd()
      vhost: use wfd on functions setting vring call fd
      configure, meson: allow enabling vhost-user on all POSIX systems
      docs: vhost-user: add subsection for non-Linux platforms

Stefano Garzarella (1):
      vhost-vsock: detach the virqueue element in case of error

Thomas Huth (1):
      hw/i386/pc_piix: Mark the machine types from version 1.4 to 1.7 as deprecated

Viresh Kumar (1):
      hw/vhost-user-i2c: Add support for VIRTIO_I2C_F_ZERO_LENGTH_REQUEST

Xueming Li (2):
      vhost-user: remove VirtQ notifier restore
      vhost-user: fix VirtQ notifier cleanup

Zhenwei Pi (2):
      headers: Add pvpanic.h
      hw/misc/pvpanic: Use standard headers instead

Zhenzhong Duan (1):
      pci: show id info when pci BDF conflict

Łukasz Gieryk (2):
      pcie: Add a helper to the SR/IOV API
      pcie: Add 1.2 version token for the Power Management Capability

 docs/pcie_sriov.txt                        | 115 +++++++++++
 docs/specs/pci-ids.txt                     |   1 +
 configure                                  |   4 +-
 hw/i386/intel_iommu_internal.h             |   1 +
 include/hw/acpi/acpi-defs.h                |   1 +
 include/hw/i386/intel_iommu.h              |   1 +
 include/hw/i386/pc.h                       |   2 +
 include/hw/i386/x86.h                      |   2 -
 include/hw/input/i8042.h                   |  15 ++
 include/hw/misc/pvpanic.h                  |   8 -
 include/hw/pci-bridge/xio3130_downstream.h |  15 ++
 include/hw/pci/pci.h                       |  12 +-
 include/hw/pci/pci_regs.h                  |   1 +
 include/hw/pci/pcie.h                      |   7 +
 include/hw/pci/pcie_sriov.h                |  77 ++++++++
 include/hw/virtio/vhost-user-i2c.h         |   3 +
 include/hw/virtio/vhost-user.h             |   3 +-
 include/hw/virtio/virtio-iommu.h           |   1 +
 include/qemu/event_notifier.h              |   1 +
 include/qemu/typedefs.h                    |   2 +
 include/standard-headers/linux/pvpanic.h   |   9 +
 hw/acpi/aml-build.c                        |   8 +-
 hw/acpi/erst.c                             |   5 -
 hw/acpi/pcihp.c                            |  12 +-
 hw/i386/acpi-build.c                       |   8 +
 hw/i386/acpi-microvm.c                     |   6 +
 hw/i386/intel_iommu.c                      |  14 +-
 hw/i386/pc.c                               |  30 ++-
 hw/i386/pc_piix.c                          |   1 +
 hw/i386/pc_sysfw_ovmf.c                    |  18 +-
 hw/i386/x86.c                              |  16 +-
 hw/misc/pvpanic-isa.c                      |   4 +-
 hw/misc/pvpanic-pci.c                      |   4 +-
 hw/misc/pvpanic.c                          |   5 +-
 hw/net/virtio-net.c                        |  13 +-
 hw/pci-bridge/pci_expander_bridge.c        |   6 +
 hw/pci-bridge/xio3130_downstream.c         |   5 +-
 hw/pci-bridge/xio3130_upstream.c           |   2 +-
 hw/pci/pci.c                               | 104 +++++++---
 hw/pci/pcie.c                              |  16 ++
 hw/pci/pcie_sriov.c                        | 302 +++++++++++++++++++++++++++++
 hw/smbios/smbios.c                         |  80 ++++++--
 hw/virtio/vhost-user-i2c.c                 |  11 +-
 hw/virtio/vhost-user.c                     |  61 +++---
 hw/virtio/vhost-vdpa.c                     |  21 +-
 hw/virtio/vhost-vsock-common.c             |  10 +-
 hw/virtio/vhost.c                          |   6 +-
 hw/virtio/virtio-bus.c                     |  12 +-
 hw/virtio/virtio-iommu.c                   |  99 ++++++++--
 qom/object.c                               |   6 +-
 tests/qtest/virtio-iommu-test.c            |   2 +
 util/event_notifier-posix.c                |   5 +
 MAINTAINERS                                |   1 -
 docs/about/deprecated.rst                  |   8 +
 docs/interop/vhost-user.rst                |  20 ++
 docs/specs/acpi_erst.rst                   | 200 +++++++++++++++++++
 docs/specs/index.rst                       |   1 +
 hw/pci/meson.build                         |   1 +
 hw/pci/trace-events                        |   5 +
 hw/virtio/trace-events                     |   4 +-
 meson.build                                |   2 +-
 qemu-options.hx                            |   3 +-
 scripts/update-linux-headers.sh            |   3 +-
 tests/data/acpi/q35/FACP                   | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.nosmm             | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.slic              | Bin 244 -> 244 bytes
 tests/data/acpi/q35/FACP.xapic             | Bin 244 -> 244 bytes
 67 files changed, 1243 insertions(+), 178 deletions(-)
 create mode 100644 docs/pcie_sriov.txt
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h
 create mode 100644 include/hw/pci/pcie_sriov.h
 create mode 100644 include/standard-headers/linux/pvpanic.h
 create mode 100644 hw/pci/pcie_sriov.c
 create mode 100644 docs/specs/acpi_erst.rst


