Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698CC6A7C82
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:25:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeEv-00025V-Sq; Thu, 02 Mar 2023 03:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEt-000254-6J
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEr-0001ux-8D
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CFmNraIcZL21rjW03vBgeiUimW+DG42CMPWxMHTJm8g=;
 b=VXy++YKBBXk5LitSZyBa6pureApoqvFF6Ni9pn1MTQdBGNfWnL+QCbVim/klXnB4/kZMvW
 T4R4GhcGC3tddZyTvCubpiaLQs5tvelEODuJVCH/+6DfPrVi9ldOpOFNPbqpTSW1kfJMwp
 7AMdEmWiS8Yo0GgTWYcQjVUg/a6cRO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-8UH4AoD3PnalVfC7nXY67Q-1; Thu, 02 Mar 2023 03:24:30 -0500
X-MC-Unique: 8UH4AoD3PnalVfC7nXY67Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so3037920wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745469;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFmNraIcZL21rjW03vBgeiUimW+DG42CMPWxMHTJm8g=;
 b=UU+0l/BepZUm+uPbffrE3lRTwOqtn0DBl11CuuFRxkFuXYJDtqRe3PEhmfoYh6Qs4X
 ewG3JrsIEDzNWbEkQXEgud7a7GmfQlb+lxJrtARkv1ZjnN5+/aowa49DXjTdIa1E4W9o
 7aeTQvwvtv1/e0odUjHF9KCTWVOPZwdjOc9A09d9S08oXM805mPCRzBOB0Fu9gpwkRtP
 GWq1gzXUw6pnL10vI8xmIKaKMXyoxZHp1+Jdo9NYOW28DJUKVjvIlkW8AR9KzK0sDSr3
 25DQ/ggtQV9DwoldrrglAUK4J9xkYXloQToXgFIxBraoShI4wWBaNvbbYhNX8acLZzJO
 ff9Q==
X-Gm-Message-State: AO0yUKXOUDMIgVRky6nbA/JNFmHBLJ29e1a/dyhTixh2+/nGZvVP/liT
 ud9UJlQ6edXb/WJSD335awC6zOpLuApnY62snXXSP2xyjJr3PvFmIuWAnwrnUNUtxLRPAwkAMLs
 1HVljMPbC+Bv4mPMDPVaj6PbqKWu3b18V3ZKPS3mhV1OZbBqNwJhGXI1Lv1h+0/tdUA==
X-Received: by 2002:adf:ee85:0:b0:2c7:d6a:d7fa with SMTP id
 b5-20020adfee85000000b002c70d6ad7famr7206899wro.25.1677745468769; 
 Thu, 02 Mar 2023 00:24:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+C22Gm+BaHEe64lhQB+U6ACcR1MlDx+sLeWqwTA8g28dlsh+MxUX/O3nXu87GDsxC9wTplBg==
X-Received: by 2002:adf:ee85:0:b0:2c7:d6a:d7fa with SMTP id
 b5-20020adfee85000000b002c70d6ad7famr7206879wro.25.1677745468360; 
 Thu, 02 Mar 2023 00:24:28 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b003dfe5190376sm2337117wms.35.2023.03.02.00.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:27 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/53] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 65888be0d4da746e2f99930e21018d801bf8995e:

  tests/data/acpi/virt: drop (most) duplicate files. (2023-03-02 03:16:26 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, cleanups, fixes

vhost-user support without ioeventfd
word replacements in vhost user spec
shpc improvements

cleanups, fixes all over the place

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Akihiko Odaki (4):
      vhost-user-gpio: Configure vhost_dev when connecting
      vhost-user-i2c: Back up vqs before cleaning up vhost_dev
      vhost-user-rng: Back up vqs before cleaning up vhost_dev
      hw/timer/hpet: Fix expiration time overflow

Alex Bennée (1):
      backends/vhost-user: remove the ioeventfd check

Carlos López (2):
      vhost: avoid a potential use of an uninitialized variable in vhost_svq_poll()
      libvhost-user: check for NULL when allocating a virtqueue element

Dr. David Alan Gilbert (1):
      virtio-rng-pci: fix transitional migration compat for vectors

Eugenio Pérez (2):
      virtio-net: clear guest_announce feature if no cvq backend
      vdpa: stop all svq on device deletion

Gregory Price (2):
      hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
      hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition

Ira Weiny (3):
      qemu/bswap: Add const_le64()
      qemu/uuid: Add UUID static initializer
      hw/cxl/mailbox: Use new UUID network order define for cel_uuid

Jason Wang (4):
      intel-iommu: fail MAP notifier without caching mode
      intel-iommu: fail DEVIOTLB_UNMAP without dt mode
      memory: introduce memory_region_unmap_iommu_notifier_range()
      smmu: switch to use memory_region_unmap_iommu_notifier_range()

Jonathan Cameron (6):
      MAINTAINERS: Add Fan Ni as Compute eXpress Link QEMU reviewer
      hw/mem/cxl_type3: Improve error handling in realize()
      hw/pci-bridge/cxl_downstream: Fix type naming mismatch
      tests/acpi: Allow update of q35/DSDT.cxl
      hw/i386/acpi: Drop duplicate _UID entry for CXL root bridge
      tests: acpi: Update q35/DSDT.cxl for removed duplicate UID

Julia Suvorova (1):
      hw/smbios: fix field corruption in type 4 table

Maxime Coquelin (3):
      docs: vhost-user: replace _SLAVE_ with _BACKEND_
      libvhost-user: Adopt new backend naming
      vhost-user: Adopt new backend naming

Michael S. Tsirkin (8):
      Revert "x86: don't let decompressed kernel image clobber setup_data"
      Revert "x86: do not re-randomize RNG seed on snapshot load"
      Revert "x86: re-initialize RNG seed when selecting kernel"
      Revert "x86: reinitialize RNG seed on system reboot"
      Revert "x86: use typedef for SetupData struct"
      Revert "x86: return modified setup_data only if read as memory, not as file"
      Revert "hw/i386: pass RNG seed via setup_data entry"
      tests/data/acpi/virt: drop (most) duplicate files.

Peter Xu (1):
      intel-iommu: send UNMAP notifications for domain or global inv desc

Philippe Mathieu-Daudé (1):
      hw/pci: Trace IRQ routing on PCI topology

Vladimir Sementsov-Ogievskiy (12):
      pci/shpc: set attention led to OFF on reset
      pci/shpc: change shpc_get_status() return type to uint8_t
      pci/shpc: shpc_slot_command(): handle PWRONLY -> ENABLED transition
      pci/shpc: more generic handle hot-unplug in shpc_slot_command()
      pci/shpc: pass PCIDevice pointer to shpc_slot_command()
      pci/shpc: refactor shpc_device_plug_common()
      pcie: pcie_cap_slot_write_config(): use correct macro
      pcie_regs: drop duplicated indicator value macros
      pcie: drop unused PCIExpressIndicator
      pcie: pcie_cap_slot_enable_power() use correct helper
      pcie: introduce pcie_sltctl_powered_off() helper
      pcie: set power indicator to off on reset by default

Yajun Wu (1):
      chardev/char-socket: set s->listener = NULL in char_socket_finalize

Zhenzhong Duan (1):
      memory: Optimize replay of guest mapping

 include/exec/memory.h                     |  10 +++
 include/hw/cxl/cxl_device.h               |   2 +-
 include/hw/i386/microvm.h                 |   5 +-
 include/hw/i386/pc.h                      |   3 -
 include/hw/i386/x86.h                     |   3 +-
 include/hw/nvram/fw_cfg.h                 |  31 --------
 include/hw/pci/pcie.h                     |   8 --
 include/hw/pci/pcie_regs.h                |  14 ----
 include/hw/virtio/vhost-user-gpio.h       |   2 +-
 include/qemu/bswap.h                      |  12 ++-
 include/qemu/uuid.h                       |  12 +++
 subprojects/libvhost-user/libvhost-user.h |  20 ++---
 backends/vhost-user.c                     |  11 ---
 chardev/char-socket.c                     |   1 +
 hw/arm/smmu-common.c                      |  16 +---
 hw/core/machine.c                         |   2 +
 hw/cxl/cxl-device-utils.c                 |   2 +-
 hw/cxl/cxl-mailbox-utils.c                |  28 +++----
 hw/i386/acpi-build.c                      |   1 -
 hw/i386/intel_iommu.c                     |  31 ++++++--
 hw/i386/microvm.c                         |  17 ++---
 hw/i386/pc.c                              |   4 +-
 hw/i386/pc_piix.c                         |   2 -
 hw/i386/pc_q35.c                          |   2 -
 hw/i386/x86.c                             | 122 ++++++++----------------------
 hw/mem/cxl_type3.c                        |  15 +++-
 hw/net/virtio-net.c                       |  15 ++++
 hw/nvram/fw_cfg.c                         |  21 ++---
 hw/pci-bridge/cxl_downstream.c            |   2 +-
 hw/pci/pci.c                              |   8 ++
 hw/pci/pcie.c                             |  30 +++++---
 hw/pci/shpc.c                             | 107 ++++++++++++++------------
 hw/smbios/smbios.c                        |   8 +-
 hw/timer/hpet.c                           |  19 +++--
 hw/virtio/vhost-shadow-virtqueue.c        |   2 +-
 hw/virtio/vhost-user-gpio.c               |  10 ++-
 hw/virtio/vhost-user-i2c.c                |   5 +-
 hw/virtio/vhost-user-rng.c                |   5 +-
 hw/virtio/vhost-user.c                    |  30 ++++----
 hw/virtio/vhost-vdpa.c                    |  17 +----
 hw/virtio/virtio-qmp.c                    |  12 +--
 softmmu/memory.c                          |  17 ++++-
 subprojects/libvhost-user/libvhost-user.c |  27 ++++---
 MAINTAINERS                               |   1 +
 docs/interop/vhost-user.rst               |  40 +++++-----
 hw/pci/trace-events                       |   1 +
 tests/data/acpi/q35/DSDT.cxl              | Bin 9578 -> 9564 bytes
 tests/data/acpi/virt/APIC.memhp           | Bin 172 -> 0 bytes
 tests/data/acpi/virt/APIC.numamem         | Bin 172 -> 0 bytes
 tests/data/acpi/virt/DSDT.numamem         | Bin 5196 -> 0 bytes
 tests/data/acpi/virt/FACP.memhp           | Bin 276 -> 0 bytes
 tests/data/acpi/virt/FACP.numamem         | Bin 276 -> 0 bytes
 tests/data/acpi/virt/GTDT.memhp           | Bin 96 -> 0 bytes
 tests/data/acpi/virt/GTDT.numamem         | Bin 96 -> 0 bytes
 tests/data/acpi/virt/IORT.memhp           | Bin 128 -> 0 bytes
 tests/data/acpi/virt/IORT.numamem         | Bin 128 -> 0 bytes
 tests/data/acpi/virt/IORT.pxb             | Bin 128 -> 0 bytes
 tests/data/acpi/virt/MCFG.memhp           | Bin 60 -> 0 bytes
 tests/data/acpi/virt/MCFG.numamem         | Bin 60 -> 0 bytes
 tests/data/acpi/virt/SPCR.memhp           | Bin 80 -> 0 bytes
 tests/data/acpi/virt/SPCR.numamem         | Bin 80 -> 0 bytes
 61 files changed, 357 insertions(+), 396 deletions(-)
 delete mode 100644 tests/data/acpi/virt/APIC.memhp
 delete mode 100644 tests/data/acpi/virt/APIC.numamem
 delete mode 100644 tests/data/acpi/virt/DSDT.numamem
 delete mode 100644 tests/data/acpi/virt/FACP.memhp
 delete mode 100644 tests/data/acpi/virt/FACP.numamem
 delete mode 100644 tests/data/acpi/virt/GTDT.memhp
 delete mode 100644 tests/data/acpi/virt/GTDT.numamem
 delete mode 100644 tests/data/acpi/virt/IORT.memhp
 delete mode 100644 tests/data/acpi/virt/IORT.numamem
 delete mode 100644 tests/data/acpi/virt/IORT.pxb
 delete mode 100644 tests/data/acpi/virt/MCFG.memhp
 delete mode 100644 tests/data/acpi/virt/MCFG.numamem
 delete mode 100644 tests/data/acpi/virt/SPCR.memhp
 delete mode 100644 tests/data/acpi/virt/SPCR.numamem


