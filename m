Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7E4509D7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:41:02 +0100 (CET)
Received: from localhost ([::1]:40022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf2T-0006D0-IF
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:41:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmeyw-00010R-AZ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmeyt-00057r-Uk
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v7jRFAvJCzt9q5CrEPPe96TK6LHgUouW+Ir6hVJun68=;
 b=By/QDoGsts5I40qOzpBErsFN9MzAFjUij+WPBuB4tTurZNFjkP5QdQclhPKqvpbsVA2vZt
 KTQoMEnYpV/Pn7wInUMWTrAzqOANEmeIqLb/+yeaXdA+dLQWH2Vnx+56Viawql8QyoD/QA
 XG29ZHhYT81YNUr09exePwBQ2xlE4Tc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-fNs3PfeyNCeyIPwJvP9pmg-1; Mon, 15 Nov 2021 11:37:17 -0500
X-MC-Unique: fNs3PfeyNCeyIPwJvP9pmg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso14631901edb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=v7jRFAvJCzt9q5CrEPPe96TK6LHgUouW+Ir6hVJun68=;
 b=Lxr7ccZNTccNZA6eFUBb6gaRaZAyX3hJm9cIjvuo9AZMIiVU4oeZ+q1s3XekcQh0z2
 aH7sw7RXKC4AGrat3xnjfXr7lycOLKMv4kc5Ovly+ixWZNXSS4R0F1JgaD3xTewLCaGk
 x1w9h5RndkaB2h0f4XthDnau4GHGVRqWJFvKry3lvbMnPui7s/81lOekuMK/mxQTtgc3
 CCfuWtKQWyJBjbJc/OYyz97UvECsb2MB/SWaPg/qOnenoILq6KDomEkQFXoOqlUttVmo
 5VkwRK/IgPeH0GkhkT8pVnr/zx3780NugfLQ7Hi2/6PhE6hDKXr6UzDqKiwsVnYnv5eW
 CCIw==
X-Gm-Message-State: AOAM530e4sSFAgbGnfKWtZ3/5nQwdxnYQupWT2S0Yz3D0XhngUEuaejU
 /ZEcNVaHep5tQWEWMdk0vx6VejgGETp8OuGnjukHNL3f24wFNJ+7uwgd11ovIyAGk69mJj1LooM
 SgfKSa5P6HD+g4NHS3ArAGLOSv6gIdmwwRHE9XdSgrpC6mlaoUwSdGov3SF/D
X-Received: by 2002:a17:906:b884:: with SMTP id
 hb4mr379688ejb.376.1636994235990; 
 Mon, 15 Nov 2021 08:37:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/C8W0nh1VTGEHpPgA9r1zjj3s2g9Z6L5uKK12C4UHPhisKKni4l5OBPO+nDFZRw4YabMdqA==
X-Received: by 2002:a17:906:b884:: with SMTP id
 hb4mr379644ejb.376.1636994235760; 
 Mon, 15 Nov 2021 08:37:15 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id y15sm3061241edr.35.2021.11.15.08.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:15 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] pci,pc,virtio: bugfixes
Message-ID: <20211115163607.177432-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:

  Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 18416c62e36a79823a9e28f6b2260aa13c25e1d9:

  pcie: expire pending delete (2021-11-15 11:10:11 -0500)

----------------------------------------------------------------
pci,pc,virtio: bugfixes

pci power management fixes
acpi hotplug fixes
misc other fixes

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Eugenio Pérez (4):
      vhost: Rename last_index to vq_index_end
      vhost: Fix last vq queue index of devices with no cvq
      vdpa: Replace qemu_open_old by qemu_open at
      vdpa: Check for existence of opts.vhostdev

Gerd Hoffmann (6):
      pci: implement power state
      pcie: implement slot power control for pcie root ports
      pcie: add power indicator blink check
      pcie: factor out pcie_cap_slot_unplug()
      pcie: fast unplug when slot power is off
      pcie: expire pending delete

Igor Mammedov (2):
      pcie: rename 'native-hotplug' to 'x-native-hotplug'
      tests: bios-tables-test update expected blobs

Jason Wang (2):
      virtio: use virtio accessor to access packed descriptor flags
      virtio: use virtio accessor to access packed event

Julia Suvorova (3):
      hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
      bios-tables-test: Allow changes in DSDT ACPI tables
      hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC

Philippe Mathieu-Daudé (1):
      hw/mem/pc-dimm: Restrict NUMA-specific code to NUMA machines

Stefan Hajnoczi (1):
      softmmu/qdev-monitor: fix use-after-free in qdev_set_id()

Stefano Garzarella (1):
      net/vhost-vdpa: fix memory leak in vhost_vdpa_get_max_queue_pairs()

 include/hw/acpi/ich9.h                |   1 +
 include/hw/pci/pci.h                  |   2 +
 include/hw/qdev-core.h                |   1 +
 include/hw/virtio/vhost.h             |   4 +-
 hw/acpi/ich9.c                        |  18 ++++++++
 hw/i386/acpi-build.c                  |  12 ++++--
 hw/i386/pc.c                          |   2 +
 hw/i386/pc_q35.c                      |   9 +++-
 hw/mem/pc-dimm.c                      |  23 ++++++----
 hw/net/vhost_net.c                    |  12 +++---
 hw/pci/pci.c                          |  25 ++++++++++-
 hw/pci/pci_host.c                     |   6 ++-
 hw/pci/pcie.c                         |  79 ++++++++++++++++++++++++++++------
 hw/pci/pcie_port.c                    |   2 +-
 hw/virtio/vhost-vdpa.c                |   2 +-
 hw/virtio/virtio.c                    |  24 ++++-------
 net/vhost-vdpa.c                      |   8 +++-
 softmmu/qdev-monitor.c                |   6 ++-
 tests/data/acpi/q35/DSDT              | Bin 8289 -> 8289 bytes
 tests/data/acpi/q35/DSDT.acpihmat     | Bin 9614 -> 9614 bytes
 tests/data/acpi/q35/DSDT.bridge       | Bin 11003 -> 11003 bytes
 tests/data/acpi/q35/DSDT.cphp         | Bin 8753 -> 8753 bytes
 tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9943 -> 9943 bytes
 tests/data/acpi/q35/DSDT.ipmibt       | Bin 8364 -> 8364 bytes
 tests/data/acpi/q35/DSDT.ivrs         | Bin 8306 -> 8306 bytes
 tests/data/acpi/q35/DSDT.memhp        | Bin 9648 -> 9648 bytes
 tests/data/acpi/q35/DSDT.mmio64       | Bin 9419 -> 9419 bytes
 tests/data/acpi/q35/DSDT.multi-bridge | Bin 8583 -> 8583 bytes
 tests/data/acpi/q35/DSDT.nohpet       | Bin 8147 -> 8147 bytes
 tests/data/acpi/q35/DSDT.numamem      | Bin 8295 -> 8295 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8894 -> 8894 bytes
 tests/data/acpi/q35/DSDT.xapic        | Bin 35652 -> 35652 bytes
 33 files changed, 176 insertions(+), 60 deletions(-)


