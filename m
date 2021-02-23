Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD2322E4E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:05:38 +0100 (CET)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaBt-0005V2-Kg
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaAC-00041f-De
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaA8-0003cu-7D
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=xuiQwaAwFYsNmYvN6Ez4sQmGgVbIzp48MmmZOiZLwZ8=;
 b=SsEbbgWNmzje4TLDRTnk64AQdDPeyFNQCSuC87MBbWYi0Usgp7mVD3n9ANiLrknpUy8Vw6
 sZi5do9W5ueLw15LCFQ76zRjWpSACuo42UrgGdHn7S6koOKg5iOYZXXMs41d7/vxnWmlkn
 pht8BY/ud7Qye7lifF1+2xu/GPXssw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-lAqCXAEBPXmx3AeM5iJB8g-1; Tue, 23 Feb 2021 11:03:45 -0500
X-MC-Unique: lAqCXAEBPXmx3AeM5iJB8g-1
Received: by mail-wm1-f69.google.com with SMTP id z67so1380378wme.3
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=xuiQwaAwFYsNmYvN6Ez4sQmGgVbIzp48MmmZOiZLwZ8=;
 b=q5FEmACruaR+ZL2Hio1xRAnkLF5v5UDiTDYvm8JfANdnvN/zg/sLauDdHtj5QtnXyW
 X/IIbzPlKPguTTumfSuzELSTJyfxI4LW2Ciio06lpp8kTBziKPF1bXoR7BKM0xGglIMK
 CDUcQIa3YJwp3q+rF892XJKTgfzEEoa5x29hLifaVbmN4IdzFXcRnZ0S+f8o8W9uRB5p
 /2h1VKZUvY7VJnyF/QFL6ppTqBPtY51n6G2mgCmG+O0pYAOREaXPvvCY1mvH7nGtUdxn
 PhDIVksqEdYysK2BOGCpEMlpMHKnhnIt5YNLTLK9y5FnEHAwGbpJUbviPHqaYAZuyu6v
 42Dw==
X-Gm-Message-State: AOAM533ckpXz8pOIDF6Y961vEVYy6pHG4vixA748wxowBgfCyWOlwQqS
 dhqnPFtbehNcYB592uihkHll+iNRXPpL1pnNqoNfwXQnFI8t71KcwdEWcIIKzpth78tfmqHQy9N
 XvBWtkFcR03FUQ3G+92WTwUqUL4XlwANQ5ideP+N1BFFM7B8VYHYKjU+bYpEi
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr26209089wmc.187.1614096222356; 
 Tue, 23 Feb 2021 08:03:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/CVDw287XI8fXGBrkcJEdwW4IZIyzpVkDmmPkXj/0ScolrziV55gMLT3qUYa7rgVdhReGyw==
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr26209055wmc.187.1614096222087; 
 Tue, 23 Feb 2021 08:03:42 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id e1sm33255391wrd.44.2021.02.23.08.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:41 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] pc,virtio,pci: fixes, tests
Message-ID: <20210223160144.1507082-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 7ef8134565dccf9186d5eabd7dbb4ecae6dead87:

  Merge remote-tracking branch 'remotes/edgar/tags/edgar/cris-next-2021-02-22.for-upstream' into staging (2021-02-22 14:20:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 7b630d937a6c73fb145746fb31e0fb4b08f0cf0e:

  qtest/acpi/bios-tables-test: update acpi tables (2021-02-23 10:58:42 -0500)

----------------------------------------------------------------
pc,virtio,pci: fixes, tests

Fixes all over the place, a new test.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Isaku Yamahata (9):
      checkpatch: don't emit warning on newly created acpi data files
      qtest: update tests/qtest/bios-tables-test-allowed-diff.h
      ich9, piix4: add property, smm-compat, to keep compatibility of SMM
      acpi/core: always set SCI_EN when SMM isn't supported
      acpi: set fadt.smi_cmd to zero when SMM is not supported
      acpi: add test case for smm unsupported -machine smm=off
      hw/i386: declare ACPI mother board resource for MMCONFIG region
      acpi: add test case for -no-hpet
      qtest/acpi/bios-tables-test: update acpi tables

Laurent Vivier (4):
      pci: cleanup failover sanity check
      virtio-net: add missing object_unref()
      failover: really display a warning when the primary device is not found
      pcie: don't set link state active if the slot is empty

Sean Christopherson (1):
      i386: acpi: Don't build HPET ACPI entry if HPET is disabled

Xingang Wang (3):
      acpi: Allow pxb DSDT acpi table changes
      acpi/gpex: Fix cca attribute check for pxb device
      tests/data/acpi/virt/DSDT.pxb: update with _CCA

 include/hw/acpi/acpi.h            |   4 +-
 include/hw/acpi/ich9.h            |   1 +
 hw/acpi/core.c                    |  11 ++++-
 hw/acpi/ich9.c                    |   2 +-
 hw/acpi/piix4.c                   |   5 +-
 hw/core/machine.c                 |   5 +-
 hw/i386/acpi-build.c              |  72 ++++++++++++++++++++++++---
 hw/isa/lpc_ich9.c                 |   1 +
 hw/isa/vt82c686.c                 |   2 +-
 hw/net/virtio-net.c               |  20 ++++----
 hw/pci-host/gpex-acpi.c           |   1 +
 hw/pci/pci.c                      |   6 +--
 hw/pci/pcie.c                     |  19 ++++----
 tests/qtest/bios-tables-test.c    | 100 ++++++++++++++++++++++++++++++++++++++
 scripts/checkpatch.pl             |   4 +-
 tests/data/acpi/pc/DSDT.nohpet    | Bin 0 -> 4923 bytes
 tests/data/acpi/pc/FACP.nosmm     | Bin 0 -> 116 bytes
 tests/data/acpi/q35/DSDT          | Bin 7801 -> 7859 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9126 -> 9184 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7819 -> 7877 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8265 -> 8323 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9455 -> 9513 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7876 -> 7934 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9160 -> 9218 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8932 -> 8990 bytes
 tests/data/acpi/q35/DSDT.nohpet   | Bin 0 -> 7717 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7807 -> 7865 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8407 -> 8465 bytes
 tests/data/acpi/q35/FACP.nosmm    | Bin 0 -> 244 bytes
 tests/data/acpi/virt/DSDT.pxb     | Bin 7689 -> 7695 bytes
 30 files changed, 216 insertions(+), 37 deletions(-)
 create mode 100644 tests/data/acpi/pc/DSDT.nohpet
 create mode 100644 tests/data/acpi/pc/FACP.nosmm
 create mode 100644 tests/data/acpi/q35/DSDT.nohpet
 create mode 100644 tests/data/acpi/q35/FACP.nosmm


