Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5F653143
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yld-0003oL-55; Wed, 21 Dec 2022 08:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylb-0003nU-4o
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylY-0003tH-T2
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=urymiA2STJS2SXSntUtihzR7NcQe2r5dCkGS6hep0+Q=;
 b=P82kQEEIxtMrynZJbZEE45R/I9v08kvzwS7f3E7fCJwkVrFlqMfXNZYOD4wZ2849X1P2Mx
 7VEgGdNDv7Mplz0m6cxFfxXtN/lm0BSpeXj5XTKAZhOIr1RkjwuPd65+rp3EvMl3v7gqfg
 atqc6JTo2YfsFBvDyxoUgYUpWJUyndA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-BIn4oZ8CNOa3QWU4SCjN9g-1; Wed, 21 Dec 2022 08:04:10 -0500
X-MC-Unique: BIn4oZ8CNOa3QWU4SCjN9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso667506wmk.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urymiA2STJS2SXSntUtihzR7NcQe2r5dCkGS6hep0+Q=;
 b=QMyjb20QuVspK/yh2xUdyOqxpsFHnZ9pjNcVajSgn3nmdD7J1BTUjst6AshTPUbo5s
 mn6PyFmdjEE2g3hP5GeTb9TU2sZks0RTmqdvTyb8feP1mULM14u4OfvEY0j3W7v/+T9V
 agjURhVc2OiRN+nEW/tOqEY5jhtaIyr/HjC2+/ngq2Xo2VYSQg6MdKjw0yLHBATbJXOl
 sBghCVy8PUEJHxVYW/Y6+gY0ADOB8S99leFbAlmq79p6bvPDyc6dIFjRPEvcyOG9fqhR
 bDUuGsK6Ks2+ATp35MRSW0imUsMqxZiIPCw9X1Il0sJf20iXEf0wg1pLqO/Nq2Wk5T1W
 BdNQ==
X-Gm-Message-State: AFqh2kq8Mem3AqleKemsLyW64IwRWqmrhqKLdmqOs6FRQStnMENP4+E0
 H64VNKsTStQ78XoHMPKm/ig4JT1y7Y41hWnjD4vKD9QFKlFUCvRSEeH9tWnw0inYaMHj4Vvv/po
 xgfYsM92GD9mBA2VnKnHJC6EY3JiTJTe1uUMWDTzqR6gfu6jM/9IVUe1iM8WI
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id
 cc7-20020a5d5c07000000b00242335326f5mr1175927wrb.9.1671627846665; 
 Wed, 21 Dec 2022 05:04:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtATjTw86GLMDzIjvxZFeTDt5Go+pUNFLtlqQRoGQpsH3RVscBX4eJE8oD3NB7vH0dmc6/J4w==
X-Received: by 2002:a5d:5c07:0:b0:242:3353:26f5 with SMTP id
 cc7-20020a5d5c07000000b00242335326f5mr1175900wrb.9.1671627846263; 
 Wed, 21 Dec 2022 05:04:06 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 p9-20020a5d4e09000000b00236c1f2cecesm17774990wrt.81.2022.12.21.05.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:03 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/41] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20221221130339.1234592-1-mst@redhat.com>
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

The following changes since commit c15dc499cc22f4a71639e42e36051e118761c25f:

  Merge tag 'pull-misc-20221218' of https://gitlab.com/rth7680/qemu into staging (2022-12-19 10:28:57 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 87d67ffe4f7e4faad9fa5bc7129ca91d314677ed:

  contrib/vhost-user-blk: Replace lseek64 with lseek (2022-12-21 07:32:24 -0500)

----------------------------------------------------------------
virtio,pc,pci: features, cleanups, fixes

make TCO watchdog work by default
part of generic vdpa support
asid interrupt for vhost-vdpa
added flex bus port DVSEC for cxl

misc fixes, cleanups, documentation

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alex Bennée (1):
      include/hw: attempt to document VirtIO feature variables

Ani Sinha (3):
      acpi/tests/avocado/bits: add SPDX license identifiers for bios bits tests
      docs/acpi/bits: document BITS_DEBUG environment variable
      acpi/tests/avocado/bits: add mformat as one of the dependencies

Cornelia Huck (2):
      hw: Add compat machines for 8.0
      pc: clean up compat machines

Daniel P. Berrangé (5):
      hw/acpi: add trace events for TCO watchdog register access
      hw/isa: add trace events for ICH9 LPC chip config access
      hw/watchdog: add trace events for watchdog action handling
      hw/isa: enable TCO watchdog reboot pin strap by default
      ich9: honour 'enable_tco' property

Eugenio Pérez (12):
      vdpa: use v->shadow_vqs_enabled in vhost_vdpa_svqs_start & stop
      vhost: set SVQ device call handler at SVQ start
      vhost: allocate SVQ device file descriptors at device start
      vhost: move iova_tree set to vhost_svq_start
      vdpa: add vhost_vdpa_net_valid_svq_features
      vdpa: request iova_range only once
      vdpa: move SVQ vring features check to net/
      vdpa: allocate SVQ array unconditionally
      vdpa: add asid parameter to vhost_vdpa_dma_map/unmap
      vdpa: store x-svq parameter in VhostVDPAState
      vdpa: add shadow_data to vhost_vdpa
      vdpa: always start CVQ in SVQ mode if possible

Igor Mammedov (2):
      remove DEC 21154 PCI bridge
      pci: drop redundant PCIDeviceClass::is_bridge field

Ira Weiny (1):
      hw/cxl/device: Add Flex Bus Port DVSEC

Jason Wang (1):
      vhost: fix vq dirty bitmap syncing when vIOMMU is enabled

Khem Raj (1):
      contrib/vhost-user-blk: Replace lseek64 with lseek

Longpeng (Mike) (4):
      virtio: get class_id and pci device id by the virtio id
      vdpa: add vdpa-dev support
      vdpa: add vdpa-dev-pci support
      vdpa-dev: mark the device as unmigratable

Marcel Holtmann (1):
      libvhost-user: Switch to unsigned int for inuse field in struct VuVirtq

Philippe Mathieu-Daudé (7):
      hw/acpi: Rename tco.c -> ich9_tco.c
      hw/virtio: Add missing "hw/core/cpu.h" include
      hw/virtio: Rename virtio_ss[] -> specific_virtio_ss[]
      hw/virtio: Guard and restrict scope of qmp_virtio_feature_map_t[]
      hw/virtio: Constify qmp_virtio_feature_map_t[]
      hw/virtio: Extract config read/write accessors to virtio-config-io.c
      hw/virtio: Extract QMP related code virtio-qmp.c

Yajun Wu (1):
      vhost-user: send set log base message only once

 hw/pci-bridge/dec.h                              |   9 -
 hw/virtio/vhost-shadow-virtqueue.h               |   5 +-
 hw/virtio/virtio-qmp.h                           |  20 +
 include/hw/acpi/ich9.h                           |   2 +-
 include/hw/acpi/{tco.h => ich9_tco.h}            |   2 +-
 include/hw/boards.h                              |   3 +
 include/hw/i386/pc.h                             |   3 +
 include/hw/pci/pci.h                             |  10 +-
 include/hw/pci/pci_bridge.h                      |   1 +
 include/hw/pci/pci_ids.h                         |   1 -
 include/hw/virtio/vdpa-dev.h                     |  43 ++
 include/hw/virtio/vhost-vdpa.h                   |  16 +-
 include/hw/virtio/vhost.h                        |  25 +-
 include/hw/virtio/virtio-pci.h                   |   5 +
 include/hw/virtio/virtio.h                       |  19 +-
 subprojects/libvhost-user/libvhost-user.h        |   2 +-
 contrib/vhost-user-blk/vhost-user-blk.c          |   4 +-
 hw/acpi/ich9.c                                   |   8 +-
 hw/acpi/{tco.c => ich9_tco.c}                    |  43 +-
 hw/acpi/pcihp.c                                  |   3 +-
 hw/arm/virt.c                                    |  11 +-
 hw/core/machine.c                                |   3 +
 hw/i386/acpi-build.c                             |   5 +-
 hw/i386/pc.c                                     |   5 +
 hw/i386/pc_piix.c                                |  41 +-
 hw/i386/pc_q35.c                                 |  29 +-
 hw/isa/lpc_ich9.c                                |   5 +-
 hw/m68k/virt.c                                   |  11 +-
 hw/mem/cxl_type3.c                               |  11 +
 hw/pci-bridge/cxl_downstream.c                   |   1 -
 hw/pci-bridge/cxl_upstream.c                     |   1 -
 hw/pci-bridge/dec.c                              | 164 -----
 hw/pci-bridge/i82801b11.c                        |   1 -
 hw/pci-bridge/pci_bridge_dev.c                   |   1 -
 hw/pci-bridge/pcie_pci_bridge.c                  |   1 -
 hw/pci-bridge/pcie_root_port.c                   |   1 -
 hw/pci-bridge/simba.c                            |   1 -
 hw/pci-bridge/xio3130_downstream.c               |   1 -
 hw/pci-bridge/xio3130_upstream.c                 |   1 -
 hw/pci-host/designware.c                         |   1 -
 hw/pci-host/uninorth.c                           |   9 +-
 hw/pci-host/xilinx-pcie.c                        |   1 -
 hw/pci/pci.c                                     |  20 +-
 hw/ppc/spapr.c                                   |  17 +-
 hw/ppc/spapr_pci.c                               |  15 +-
 hw/s390x/s390-virtio-ccw.c                       |  14 +-
 hw/virtio/vdpa-dev-pci.c                         | 102 +++
 hw/virtio/vdpa-dev.c                             | 377 +++++++++++
 hw/virtio/vhost-shadow-virtqueue.c               |  44 +-
 hw/virtio/vhost-user.c                           |   5 +
 hw/virtio/vhost-vdpa.c                           | 140 ++--
 hw/virtio/vhost.c                                |  84 ++-
 hw/virtio/virtio-config-io.c                     | 204 ++++++
 hw/virtio/virtio-pci.c                           |  88 +++
 hw/virtio/virtio-qmp.c                           | 659 +++++++++++++++++++
 hw/virtio/virtio.c                               | 798 +----------------------
 hw/watchdog/watchdog.c                           |   4 +
 net/vhost-vdpa.c                                 | 174 ++++-
 tests/qtest/tco-test.c                           |   4 +-
 MAINTAINERS                                      |   4 +-
 docs/devel/acpi-bits.rst                         |   3 +
 hw/acpi/meson.build                              |   2 +-
 hw/acpi/trace-events                             |   2 +
 hw/isa/trace-events                              |   4 +
 hw/pci-bridge/meson.build                        |   2 -
 hw/virtio/Kconfig                                |   5 +
 hw/virtio/meson.build                            |  44 +-
 hw/virtio/trace-events                           |   4 +-
 hw/watchdog/trace-events                         |   4 +
 tests/avocado/acpi-bits.py                       |   2 +-
 tests/avocado/acpi-bits/bits-tests/smbios.py2    |   4 +
 tests/avocado/acpi-bits/bits-tests/testacpi.py2  |   4 +
 tests/avocado/acpi-bits/bits-tests/testcpuid.py2 |   4 +
 73 files changed, 2074 insertions(+), 1292 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 create mode 100644 hw/virtio/virtio-qmp.h
 rename include/hw/acpi/{tco.h => ich9_tco.h} (97%)
 create mode 100644 include/hw/virtio/vdpa-dev.h
 rename hw/acpi/{tco.c => ich9_tco.c} (91%)
 delete mode 100644 hw/pci-bridge/dec.c
 create mode 100644 hw/virtio/vdpa-dev-pci.c
 create mode 100644 hw/virtio/vdpa-dev.c
 create mode 100644 hw/virtio/virtio-config-io.c
 create mode 100644 hw/virtio/virtio-qmp.c


