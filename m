Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5966B27B2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:48:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paHYW-0005Ug-Uw; Thu, 09 Mar 2023 09:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paHYU-0005UT-LP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paHYS-0000u7-4a
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678373258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJqMSTdQnVKykVSBEylE1Nx3VCSwhKEar98L6S4hoGA=;
 b=i/gGsx5w9hTJR0v6sjlcQXxw1ZGUvlrYMFBGu9Xt0YK77wnqSiJOhvL69cwKilAbiYWLTj
 pp8e4mlBusE1F1AAkwKmE69nPFZcHzxvaguKS5O1jrC9ZzWMkumQzN+mfLGHD/nSAjSGbK
 L4w962ShiOUK5m2df820qLjABXgvSpo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-sIaUvci2PdqWyfbw8z-4JQ-1; Thu, 09 Mar 2023 09:47:37 -0500
X-MC-Unique: sIaUvci2PdqWyfbw8z-4JQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so3268765eda.6
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678373255;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJqMSTdQnVKykVSBEylE1Nx3VCSwhKEar98L6S4hoGA=;
 b=eLONC5EZQ7lGp3fkbZE3RMcbrkkWVG+TSEXqN4x6dk98Dd6npyiIXoctDBQKHOAnCm
 0iKsY510ZTTwhFrC6oxRMunZOVcBB0yO+Qq1eqFLrp4e5XJbhLcuEmuMjK8fFPJZvhmm
 gl1hvNBlEDCxiQB2zfx8cqsTm98NrgdduGCY0IifrNtBkhSNwvAjL6NP+uLHNRQvlqMv
 x/+r9xJzHsWIig0don1/LmrVMK84Bo0584um9vCgNBcDEXkcIiv+vNqRnVkzQ3EgMPo9
 SO03nocwLvvkKUWu3bTELKYt/kZqfCK9Wg9wzCa7Bi7IjlzEXI4Kg9LqmA87Wj4g4tbP
 vPBQ==
X-Gm-Message-State: AO0yUKVmbRtIMglB/emh7PLNE7WzfZ8yg7wNlIccRUlublBI4BSclzGh
 Ajz6+3kPz3/bD+NVC+IxVAiE6iVWtoFLZXvP+9P1p677uELtbvxJIljVDkdCMj+j5ilIG4r7GvY
 36/32kQkQEg6CJGTOGuVpr6fTu3zAxAH24iVIO8g+da04YG3Wh3knP76UR914xae0dK3t
X-Received: by 2002:aa7:d985:0:b0:4af:62ad:160b with SMTP id
 u5-20020aa7d985000000b004af62ad160bmr21396054eds.5.1678373255244; 
 Thu, 09 Mar 2023 06:47:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8melm5EJBrwUewgw8s5U0AaaztgmOv9mtTzpOCF7avVhxWFJve8OKjGMSwmpI+bnNMoFjr5Q==
X-Received: by 2002:aa7:d985:0:b0:4af:62ad:160b with SMTP id
 u5-20020aa7d985000000b004af62ad160bmr21396034eds.5.1678373254874; 
 Thu, 09 Mar 2023 06:47:34 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 w21-20020a50d795000000b004d8287c775fsm7707117edi.8.2023.03.09.06.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:47:34 -0800 (PST)
Date: Thu, 9 Mar 2023 09:47:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/73] virtio,pc,pci: features, fixes
Message-ID: <20230309094647-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 07, 2023 at 08:10:51PM -0500, Michael S. Tsirkin wrote:
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
> 
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> 
> for you to fetch changes up to 52062b213c13bd7fff966d36b554c04609c925d6:
> 
>   virtio: refresh vring region cache after updating a virtqueue size (2023-03-07 19:51:07 -0500)


I moved it one commit back, now at (96cb085897)
Cornelia posted some concerns about the last commit.

> ----------------------------------------------------------------
> virtio,pc,pci: features, fixes
> 
> Several features that landed at the last possible moment:
> 
> Passthrough HDM decoder emulation
> Refactor cryptodev
> RAS error emulation and injection
> acpi-index support on non-hotpluggable slots
> Dynamically switch to vhost shadow virtqueues at vdpa net migration
> 
> Plus a couple of bugfixes that look important to have in the release.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ----------------------------------------------------------------
> Albert Esteve (1):
>       hw/virtio/vhost-user: avoid using unitialized errp
> 
> Carlos López (2):
>       virtio: fix reachable assertion due to stale value of cached region size
>       virtio: refresh vring region cache after updating a virtqueue size
> 
> Eugenio Pérez (14):
>       vdpa net: move iova tree creation from init to start
>       vdpa: Remember last call fd set
>       vdpa: Negotiate _F_SUSPEND feature
>       vdpa: rewind at get_base, not set_base
>       vdpa: add vhost_vdpa->suspended parameter
>       vdpa: add vhost_vdpa_suspend
>       vdpa: move vhost reset after get vring base
>       vdpa: add vdpa net migration state notifier
>       vdpa: disable RAM block discard only for the first device
>       vdpa net: block migration if the device has CVQ
>       vdpa: block migration if device has unsupported features
>       vdpa: block migration if SVQ does not admit a feature
>       vdpa net: allow VHOST_F_LOG_ALL
>       vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
> 
> Igor Mammedov (34):
>       Revert "tests/qtest: Check for devices in bios-tables-test"
>       tests: acpi: whitelist new q35.noacpihp test and pc.hpbrroot
>       tests: acpi: add test_acpi_q35_tcg_no_acpi_hotplug test and extend test_acpi_piix4_no_acpi_pci_hotplug
>       tests: acpi: update expected blobs
>       tests: acpi: whitelist q35/DSDT.multi-bridge before extending testcase
>       tests: acpi: extend multi-bridge case with case 'root-port,id=HOHP,hotplug=off root-port,bus=NOHP'
>       x86: pcihp: fix missing PCNT callchain when intermediate root-port has 'hotplug=off' set
>       tests: acpi: whitelist pc/DSDT.hpbrroot and pc/DSDT.hpbridge tests
>       x86: pcihp: fix missing bridge AML when intermediate root-port has 'hotplug=off' set
>       tests: acpi: update expected blobs
>       pcihp: piix4: do not redirect hotplug controller to piix4 when ACPI hotplug is disabled
>       pci: fix 'hotplugglable' property behavior
>       tests: acpi: whitelist DSDT blobs before isolating PCI _DSM func 0 prolog
>       pcihp: move PCI _DSM function 0 prolog into separate function
>       tests: acpi: update expected blobs
>       tests: acpi: whitelist DSDT before adding EDSM method
>       acpi: pci: add EDSM method to DSDT
>       tests: acpi: update expected blobs
>       tests: acpi: whitelist DSDT before adding device with acpi-index to testcases
>       tests: acpi: add device with acpi-index on non-hotpluggble bus
>       acpi: pci: support acpi-index for non-hotpluggable devices
>       tests: acpi: update expected blobs
>       tests: acpi: whitelist DSDT before exposing non zero functions
>       acpi: pci: describe all functions on populated slots
>       tests: acpi: update expected blobs
>       tests: acpi: whitelist DSDT before adding non-0 function device with acpi-index to testcases
>       tests: acpi: add non zero function device with acpi-index on non-hotpluggble bus
>       tests: acpi: update expected blobs
>       pci: move acpi-index uniqueness check to generic PCI device code
>       acpi: pci: drop BSEL usage when deciding that device isn't hotpluggable
>       acpi: pci: move BSEL into build_append_pcihp_slots()
>       acpi: pci: move out ACPI PCI hotplug generator from generic slot generator build_append_pci_bus_devices()
>       pcihp: move fields enabling hotplug into AcpiPciHpState
>       pcihp: add ACPI PCI hotplug specific is_hotpluggable_bus() callback
> 
> Jonathan Cameron (10):
>       hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
>       hw/pci/aer: Add missing routing for AER errors
>       hw/pci-bridge/cxl_root_port: Wire up AER
>       hw/pci-bridge/cxl_root_port: Wire up MSI
>       hw/mem/cxl-type3: Add AER extended capability
>       hw/cxl: Fix endian issues in CXL RAS capability defaults / masks
>       hw/pci/aer: Make PCIE AER error injection facility available for other emulation to use.
>       hw/mem/cxl_type3: Add CXL RAS Error Injection Support.
>       hw/pci: Add pcie_count_ds_port() and pcie_find_port_first() helpers
>       hw/pxb-cxl: Support passthrough HDM Decoders unless overridden
> 
> Zhenwei Pi (12):
>       cryptodev: Introduce cryptodev.json
>       cryptodev: Remove 'name' & 'model' fields
>       cryptodev: Introduce cryptodev alg type in QAPI
>       cryptodev: Introduce server type in QAPI
>       cryptodev: Introduce 'query-cryptodev' QMP command
>       cryptodev-builtin: Detect akcipher capability
>       hmp: add cryptodev info command
>       cryptodev: Use CryptoDevBackendOpInfo for operation
>       cryptodev: Account statistics
>       cryptodev: support QoS
>       cryptodev: Support query-stats QMP command
>       MAINTAINERS: add myself as the maintainer for cryptodev
> 
>  qapi/cryptodev.json                           |  89 ++++++
>  qapi/cxl.json                                 | 128 ++++++++
>  qapi/qapi-schema.json                         |   2 +
>  qapi/qom.json                                 |   8 +-
>  qapi/stats.json                               |  10 +-
>  hw/pci/pci-internal.h                         |   1 -
>  include/hw/acpi/ich9.h                        |   1 +
>  include/hw/acpi/pcihp.h                       |  11 +-
>  include/hw/acpi/piix4.h                       |   2 -
>  include/hw/cxl/cxl.h                          |   1 +
>  include/hw/cxl/cxl_component.h                |  27 ++
>  include/hw/cxl/cxl_device.h                   |  11 +
>  include/hw/hotplug.h                          |   2 +
>  include/hw/pci/pci_bridge.h                   |   1 +
>  include/hw/pci/pcie_aer.h                     |   1 +
>  include/hw/pci/pcie_port.h                    |   2 +
>  include/hw/pci/pcie_regs.h                    |   3 +
>  include/hw/qdev-core.h                        |  13 +-
>  include/hw/virtio/vhost-backend.h             |   4 +
>  include/hw/virtio/vhost-vdpa.h                |   3 +
>  include/monitor/hmp.h                         |   1 +
>  include/sysemu/cryptodev.h                    | 113 ++++---
>  backends/cryptodev-builtin.c                  |  42 ++-
>  backends/cryptodev-hmp-cmds.c                 |  54 ++++
>  backends/cryptodev-lkcf.c                     |  19 +-
>  backends/cryptodev-vhost-user.c               |  13 +-
>  backends/cryptodev-vhost.c                    |   4 +-
>  backends/cryptodev.c                          | 433 ++++++++++++++++++++++++--
>  hw/acpi/acpi-pci-hotplug-stub.c               |   9 +-
>  hw/acpi/ich9.c                                |  21 +-
>  hw/acpi/pci-bridge.c                          |  14 +-
>  hw/acpi/pcihp.c                               | 112 ++-----
>  hw/acpi/piix4.c                               |  33 +-
>  hw/cxl/cxl-component-utils.c                  |  20 +-
>  hw/cxl/cxl-host.c                             |  31 +-
>  hw/i386/acpi-build.c                          | 179 ++++++++---
>  hw/isa/lpc_ich9.c                             |   1 +
>  hw/mem/cxl_type3.c                            | 294 +++++++++++++++++
>  hw/mem/cxl_type3_stubs.c                      |  17 +
>  hw/pci-bridge/cxl_root_port.c                 |  64 ++++
>  hw/pci-bridge/pci_expander_bridge.c           |  44 ++-
>  hw/pci/pci.c                                  |  57 ++++
>  hw/pci/pcie_aer.c                             |  14 +-
>  hw/pci/pcie_port.c                            |  46 +++
>  hw/s390x/virtio-ccw.c                         |   1 +
>  hw/virtio/vhost-shadow-virtqueue.c            |   8 +-
>  hw/virtio/vhost-user.c                        |   4 +-
>  hw/virtio/vhost-vdpa.c                        | 130 +++++---
>  hw/virtio/vhost.c                             |   3 +
>  hw/virtio/virtio-crypto.c                     |  48 ++-
>  hw/virtio/virtio-mmio.c                       |   5 +-
>  hw/virtio/virtio-pci.c                        |   1 +
>  hw/virtio/virtio.c                            |  11 +-
>  net/vhost-vdpa.c                              | 198 ++++++++++--
>  stats/stats-hmp-cmds.c                        |   5 +
>  stats/stats-qmp-cmds.c                        |   2 +
>  tests/qtest/bios-tables-test.c                | 125 +++-----
>  MAINTAINERS                                   |   2 +
>  backends/meson.build                          |   1 +
>  hmp-commands-info.hx                          |  14 +
>  hw/mem/meson.build                            |   2 +
>  hw/virtio/trace-events                        |   1 +
>  qapi/meson.build                              |   2 +
>  tests/data/acpi/pc/DSDT                       | Bin 6360 -> 6488 bytes
>  tests/data/acpi/pc/DSDT.acpierst              | Bin 6283 -> 6411 bytes
>  tests/data/acpi/pc/DSDT.acpihmat              | Bin 7685 -> 7813 bytes
>  tests/data/acpi/pc/DSDT.bridge                | Bin 12487 -> 12615 bytes
>  tests/data/acpi/pc/DSDT.cphp                  | Bin 6824 -> 6952 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8014 -> 8142 bytes
>  tests/data/acpi/pc/DSDT.hpbridge              | Bin 6289 -> 6451 bytes
>  tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3081 -> 3343 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6432 -> 6560 bytes
>  tests/data/acpi/pc/DSDT.memhp                 | Bin 7719 -> 7847 bytes
>  tests/data/acpi/pc/DSDT.nohpet                | Bin 6218 -> 6346 bytes
>  tests/data/acpi/pc/DSDT.numamem               | Bin 6366 -> 6494 bytes
>  tests/data/acpi/pc/DSDT.roothp                | Bin 9745 -> 9873 bytes
>  tests/data/acpi/q35/DSDT                      | Bin 8252 -> 8361 bytes
>  tests/data/acpi/q35/DSDT.acpierst             | Bin 8269 -> 8378 bytes
>  tests/data/acpi/q35/DSDT.acpihmat             | Bin 9577 -> 9686 bytes
>  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8531 -> 8640 bytes
>  tests/data/acpi/q35/DSDT.applesmc             | Bin 8298 -> 8407 bytes
>  tests/data/acpi/q35/DSDT.bridge               | Bin 11481 -> 11590 bytes
>  tests/data/acpi/q35/DSDT.core-count2          | Bin 32392 -> 32501 bytes
>  tests/data/acpi/q35/DSDT.cphp                 | Bin 8716 -> 8825 bytes
>  tests/data/acpi/q35/DSDT.cxl                  | Bin 9564 -> 9673 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9906 -> 10015 bytes
>  tests/data/acpi/q35/DSDT.ipmibt               | Bin 8327 -> 8436 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8340 -> 8449 bytes
>  tests/data/acpi/q35/DSDT.ivrs                 | Bin 8269 -> 8378 bytes
>  tests/data/acpi/q35/DSDT.memhp                | Bin 9611 -> 9720 bytes
>  tests/data/acpi/q35/DSDT.mmio64               | Bin 9382 -> 9491 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12337 -> 12770 bytes
>  tests/data/acpi/q35/DSDT.noacpihp             | Bin 0 -> 8248 bytes
>  tests/data/acpi/q35/DSDT.nohpet               | Bin 8110 -> 8219 bytes
>  tests/data/acpi/q35/DSDT.numamem              | Bin 8258 -> 8367 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8353 -> 8462 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8858 -> 8967 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8884 -> 8993 bytes
>  tests/data/acpi/q35/DSDT.viot                 | Bin 9361 -> 9470 bytes
>  tests/data/acpi/q35/DSDT.xapic                | Bin 35615 -> 35724 bytes
>  100 files changed, 2043 insertions(+), 475 deletions(-)
>  create mode 100644 qapi/cryptodev.json
>  create mode 100644 qapi/cxl.json
>  create mode 100644 backends/cryptodev-hmp-cmds.c
>  create mode 100644 hw/mem/cxl_type3_stubs.c
>  create mode 100644 tests/data/acpi/q35/DSDT.noacpihp
> 


