Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E773CB987
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:17:29 +0200 (CEST)
Received: from localhost ([::1]:51404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pai-0003ZD-C9
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYS-0000im-L5
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYQ-0003nW-Sw
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Te7wH0gcQoXcarNKQF8h76QjEHGXDZHSuThaMMDXcd8=;
 b=QyLeYKEdSg3drcow0BlyhbBXNABvKRFTVuOGoNOsFtAlM4qMU2QQfHUgGZycIFpr4yFQkm
 BOMzn72zpombolxcWJYbPdhdgJeSQPRhrLO2AJkGLNmrtRAQmAZZrUhvGOMWy7rdnCTxAf
 hJoQTnXK8r0XLus7CkHtfskh90QTTlo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-qBeERXRTPduPdeoCV0Y2mg-1; Fri, 16 Jul 2021 11:15:04 -0400
X-MC-Unique: qBeERXRTPduPdeoCV0Y2mg-1
Received: by mail-wr1-f72.google.com with SMTP id
 g9-20020adff3c90000b0290140a25efc6dso4983683wrp.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Te7wH0gcQoXcarNKQF8h76QjEHGXDZHSuThaMMDXcd8=;
 b=M6cv7+b+1ntqzNFNhR+2zgmgkoDt2qWfDTB4XspQ2VsP85eVmgFgrzmuzSFZ8YjfZG
 QLkPS/+H3B3fh6kPVq2Gqm3ExH8NeIe8V/sltW2tMT4exLgAasbcjbON4x9CVFpv9ecJ
 dvTzyX2yIKwVwg0spMgEQ9m+3e4XSBGB/pB5vKRLyLu+3UuCIstUWcplu6W07XtQvbEQ
 XMsyLjiXgYy1MqVhLGLMCB6PoGMVo5STakBXvA/wypeNenS5No/4r/TU00mCrXoLpdtA
 8hybcEAYq64+Njnenvoqe33uaOFU4KJ7rchJGfcjgob6wUsMYt5KxMW1kkyUhDDZHrxA
 RsDQ==
X-Gm-Message-State: AOAM530uaH38i/23DPPuX2md/ENJas0IOb2WSirx26R7kB3ufU1+i+ir
 lPYhr6rT+8ZhyOL/dXgtAu3U3/iKHAEauq8H1ZY8werkeAdUBH/ZgK7AfzEEc0ZY0ElRxdln5Tl
 4Yuww+g4o7suqyuvexZwmkj4v3qVs7pP6V6LxorzEqrbGDIOXnbinVfyGGUHw
X-Received: by 2002:adf:f710:: with SMTP id r16mr13099850wrp.124.1626448503214; 
 Fri, 16 Jul 2021 08:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqKB2TgtiKN8cUZXdHP/QLoKQYdMgHdeTC3tD/n3YS7wDs1815d1wLDReuB8bm9amAPQhf1Q==
X-Received: by 2002:adf:f710:: with SMTP id r16mr13099822wrp.124.1626448502924; 
 Fri, 16 Jul 2021 08:15:02 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id v14sm10567474wru.77.2021.07.16.08.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:02 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/19] pc,pci,virtio: lots of new features
Message-ID: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

The following changes since commit bd306cfeeececee73ff2cdb3de1229ece72f3b28:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20210714.0' into staging (2021-07-15 21:39:04 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream3

for you to fetch changes up to 1e08fd0a465d70ad30d2928c66537c816f0af7f8:

  vhost-vsock: SOCK_SEQPACKET feature bit support (2021-07-16 11:10:45 -0400)

----------------------------------------------------------------
pc,pci,virtio: lots of new features

Lots of last minute stuff.

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

 docs/bypass-iommu.txt               |  89 +++++++++++
 hw/i386/acpi-build.h                |   5 +
 include/hw/acpi/ich9.h              |   5 +
 include/hw/acpi/pcihp.h             |   3 +-
 include/hw/arm/virt.h               |   1 +
 include/hw/i386/pc.h                |   1 +
 include/hw/pci/pci.h                |   2 +
 include/hw/pci/pci_host.h           |   1 +
 include/hw/pci/pcie_port.h          |   5 +-
 include/hw/virtio/vhost-user-i2c.h  |  28 ++++
 hw/acpi/acpi-x86-stub.c             |   6 +
 hw/acpi/ich9.c                      |  70 +++++++++
 hw/acpi/pcihp.c                     |  26 +++-
 hw/acpi/piix4.c                     |   4 +-
 hw/arm/virt-acpi-build.c            | 114 ++++++++++++--
 hw/arm/virt.c                       |  26 ++++
 hw/core/machine.c                   |   1 -
 hw/i386/acpi-build.c                | 114 +++++++++++---
 hw/i386/pc.c                        |  21 +++
 hw/i386/pc_q35.c                    |  11 ++
 hw/pci-bridge/pci_expander_bridge.c |   3 +
 hw/pci-host/q35.c                   |   2 +
 hw/pci/pci.c                        |  34 ++++-
 hw/pci/pci_host.c                   |   1 +
 hw/pci/pcie.c                       |   8 +-
 hw/pci/pcie_port.c                  |   1 +
 hw/virtio/vhost-user-i2c-pci.c      |  69 +++++++++
 hw/virtio/vhost-user-i2c.c          | 288 ++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-vsock.c             |  12 +-
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   2 +
 qemu-options.hx                     |  33 +++++
 tests/data/acpi/q35/DSDT            | Bin 7859 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat   | Bin 9184 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge     | Bin 7877 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp       | Bin 8323 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm    | Bin 9513 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt     | Bin 7934 -> 8364 bytes
 tests/data/acpi/q35/DSDT.memhp      | Bin 9218 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64     | Bin 8990 -> 9419 bytes
 tests/data/acpi/q35/DSDT.nohpet     | Bin 7717 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem    | Bin 7865 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis        | Bin 8465 -> 8894 bytes
 43 files changed, 949 insertions(+), 42 deletions(-)
 create mode 100644 docs/bypass-iommu.txt
 create mode 100644 include/hw/virtio/vhost-user-i2c.h
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c
 create mode 100644 hw/virtio/vhost-user-i2c.c


