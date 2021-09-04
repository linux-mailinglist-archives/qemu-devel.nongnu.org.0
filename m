Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5181400D1D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:39:49 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdO8-0003az-RM
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKY-0003T3-3t
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKT-0000g6-5H
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LO8Ga3Sfx0r4U+KfgPM1AA8M6ExiQVU+ErBit+Ge59Y=;
 b=didDpbE/7KTW6Rv1btc8+9VxPewVwmSuWbuiNvMMwHStcP6YOXG4XTqzykdw/wuANLJOa0
 hSDeRK/ZM7+LyIqrsEP1jJ2pC4gwgm9KKvM8GdWV4ASrn7qBsquT9JohJDwG2/AiirWo2V
 Jwc3jNbqtQBqMxpdTVGA3uhiEnm5CNw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-AoM2p_gmORGYoESEmj1ZLg-1; Sat, 04 Sep 2021 17:35:58 -0400
X-MC-Unique: AoM2p_gmORGYoESEmj1ZLg-1
Received: by mail-ed1-f71.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so1351902edb.18
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=LO8Ga3Sfx0r4U+KfgPM1AA8M6ExiQVU+ErBit+Ge59Y=;
 b=YXjn+z3nD0mvBIgQkZK8PtX8ZEIDDx/EsrH3id5ph+S92twOy8WMynY52l+6+dZULN
 09ej+/TMrwY5jOgxnEPrUBptt/8NmTCf4YKN4RRz08kTbH6zAkL/Muu7RItF1Sqq1DJT
 A3sPhxM6WX5oBm4wJ880zbwcCp9PZ263P57pjjA2TKUhkbfC27dTXShsIJXf2CAtQSJX
 DEfR+Ob0/DUEDDRdUc9JANSCNMacB8fWl1pO5QRLqSpqwXp8+qO72rULBhDFRkWC2mB1
 Or1fBm2KUm3rUlCdK/d3MDf0PNFClzwX8SfnL52A81HmLVyiDS/W0ZB7CkFR1vQHmEem
 dFKw==
X-Gm-Message-State: AOAM533OoTrxkgjZx9WwNnmpgG36AJ7ibAxKPG+3WrdAT4PdlJGUkTiQ
 rr0wO7/Io7fRrkGrzgndS7qvPcT7ouJAZQgpXMyznVYi+zEWQhyJa9zAUBDxCXswqxuTcw1fU6b
 w/6E1HSQ7UQFlVZ3UTGWZASVsOa+K72nR0fhz6F8G+T2FPKadJhCQWOClKisT
X-Received: by 2002:a05:6402:40ce:: with SMTP id
 z14mr5897996edb.28.1630791356603; 
 Sat, 04 Sep 2021 14:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfv86O9jPIAVWHLNnBv65ijN9YpauTqscb9YaSYHn/ZHuDaEMPmmE7dPBa/+p+o3kWTFTM/Q==
X-Received: by 2002:a05:6402:40ce:: with SMTP id
 z14mr5897977edb.28.1630791356310; 
 Sat, 04 Sep 2021 14:35:56 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id r6sm1522287ejb.119.2021.09.04.14.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:35:55 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:35:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] pc,pci,virtio: fixes, cleanups
Message-ID: <20210904213506.486886-1-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 499c8b4de96eecc554a03e452226f79f169a233b:

  vhost-vdpa: remove the unncessary queue_index assignment (2021-09-04 17:34:05 -0400)

----------------------------------------------------------------
pc,pci,virtio: fixes, cleanups

Fixes, cleanups all over the place.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Alyssa Ross (1):
      vhost-user: add missing space in error message

Ani Sinha (5):
      hw/acpi: define PIIX4 acpi pci hotplug property strings at a single place
      hw/acpi: refactor acpi hp modules so that targets can just use what they need
      hw/pci: remove all references to find_i440fx function
      hw/acpi: use existing references to pci device struct within functions
      MAINTAINERS: Added myself as a reviewer for acpi/smbios subsystem

David Hildenbrand (2):
      virtio-balloon: don't start free page hinting if postcopy is possible
      virtio-balloon: free page hinting cleanups

Denis Plotnikov (1):
      vhost: make SET_VRING_ADDR, SET_FEATURES send replies

Eduardo Habkost (2):
      acpi: Delete broken ACPI_GED_X86 macro
      Use PCI_HOST_BRIDGE macro

Eugenio Pérez (1):
      vhost-vdpa: Do not send empty IOTLB update batches

Gerd Hoffmann (1):
      q35: catch invalid cpu hotplug configuration

Jason Wang (14):
      virtio-bus: introduce iommu_enabled()
      virtio-pci: implement iommu_enabled()
      vhost: correctly detect the enabling IOMMU
      vhost-vdpa: remove unused variable "acked_features"
      vhost-vdpa: correctly return err in vhost_vdpa_set_backend_cap()
      vhost_net: remove the meaningless assignment in vhost_net_start_one()
      vhost: use unsigned int for nvqs
      vhost_net: do not assume nvqs is always 2
      vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
      vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
      vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
      vhost-vdpa: tweak the error label in vhost_vdpa_add()
      vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
      vhost-vdpa: remove the unncessary queue_index assignment

Jingqi Liu (1):
      hw/i386/acpi-build: Get NUMA information from struct NumaState

Peter Maydell (2):
      tests/vhost-user-bridge.c: Sanity check socket path length
      tests/vhost-user-bridge.c: Fix typo in help message

Philippe Mathieu-Daudé (2):
      hw/virtio: Document virtio_queue_packed_empty_rcu is called within RCU
      hw/virtio: Remove NULL check in virtio_free_region_cache()

Tiberiu Georgescu (1):
      hw/virtio: move vhost_set_backend_type() to vhost.c

Yajun Wu (1):
      hw/virtio: Fix leak of host-notifier memory-region

Yuwei Zhang (1):
      hw/virtio: Add flatview update in vhost_user_cleanup()

 configs/devices/mips-softmmu/common.mak |   5 +-
 include/hw/acpi/acpi.h                  |   2 +
 include/hw/acpi/generic_event_device.h  |   2 -
 include/hw/i386/pc.h                    |   4 -
 include/hw/pci-host/i440fx.h            |   1 -
 include/hw/virtio/vhost-backend.h       |   6 --
 include/hw/virtio/vhost-vdpa.h          |   1 +
 include/hw/virtio/vhost.h               |   6 +-
 include/hw/virtio/virtio-bus.h          |   4 +-
 include/net/vhost_net.h                 |   1 +
 hw/acpi/acpi-cpu-hotplug-stub.c         |  50 +++++++++++
 hw/acpi/acpi-mem-hotplug-stub.c         |  35 ++++++++
 hw/acpi/acpi-nvdimm-stub.c              |   8 ++
 hw/acpi/acpi-pci-hotplug-stub.c         |  47 ++++++++++
 hw/acpi/ich9.c                          |   2 +-
 hw/acpi/pcihp.c                         |   6 +-
 hw/acpi/piix4.c                         |   4 +-
 hw/i386/acpi-build.c                    |  24 +++--
 hw/i386/pc.c                            |  13 +--
 hw/i386/pc_q35.c                        |   2 +-
 hw/isa/lpc_ich9.c                       |  13 +++
 hw/net/vhost_net.c                      |   5 +-
 hw/pci-host/i440fx.c                    |   8 --
 hw/virtio/vhost-backend.c               |  30 +------
 hw/virtio/vhost-user.c                  | 151 ++++++++++++++++++++++----------
 hw/virtio/vhost-vdpa.c                  |  39 ++++++---
 hw/virtio/vhost.c                       |  31 ++++++-
 hw/virtio/virtio-balloon.c              |  41 ++++-----
 hw/virtio/virtio-bus.c                  |  14 +++
 hw/virtio/virtio-pci.c                  |  14 +++
 hw/virtio/virtio.c                      |   7 +-
 net/tap.c                               |   1 +
 net/vhost-user.c                        |   1 +
 net/vhost-vdpa.c                        |  35 +++-----
 stubs/pci-host-piix.c                   |   7 --
 tests/vhost-user-bridge.c               |   7 +-
 MAINTAINERS                             |   1 +
 hw/acpi/Kconfig                         |  10 +++
 hw/acpi/meson.build                     |  14 ++-
 stubs/meson.build                       |   1 -
 40 files changed, 440 insertions(+), 213 deletions(-)
 create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
 create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
 create mode 100644 hw/acpi/acpi-nvdimm-stub.c
 create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c
 delete mode 100644 stubs/pci-host-piix.c


