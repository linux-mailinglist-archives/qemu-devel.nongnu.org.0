Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E4D5253A6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:29:50 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCdJ-0007uR-7t
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYu-0004tz-OB
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYr-00054R-BI
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CfIGGRlCN7k2m61Z+U071JgyQJTV7HQPUROVnwdMX3I=;
 b=YvCci1kqkO/fRse1xOVAnK15Hrb4UmcXeR/tsd2r0EEdLMp2+YqJpx/hr2MIfP6cVsGGeq
 9fOkeJ6zQRvnlHtUQs4eo0oPxdrXeA2jE0BfIGRsihvXpDVWPTS9SkHDp3rJud6zcjCn58
 BeK654GO/+goekJU76UmrXefqGiS5Ow=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-ziRgxEPAPCCwnjR4v9LNSg-1; Thu, 12 May 2022 13:25:09 -0400
X-MC-Unique: ziRgxEPAPCCwnjR4v9LNSg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gs8-20020a1709072d0800b006f42d47382fso3160601ejc.17
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfIGGRlCN7k2m61Z+U071JgyQJTV7HQPUROVnwdMX3I=;
 b=n4L7DhMFLdwCzRVYtEvucccJqnYK+kG9dgJGPFGtdir3K49h45ryd5/jxM9GqrxBEE
 oN71O1OTR/tlOwZA3Ows874OvVOS9OpGV5YlNhLQMEPObGj5c4TDsH0n+OlnM0PIhN1j
 EmyWQU7OLfJi6aUT0dd9SqBMYzAormE7CVhJDwq8qS9xybzn+Ieyjmy/FwcfcsV5XszJ
 AE1pWXNWpr4MWIEPvD/FkyZPAAhO5oAHt3gRLo9VyQb+0nWbPH1k8Zk6StT1rcZiMIYV
 HdpDuFZzQHgCJ+J5Vd9RcenMZHEzn/fWG5Arm9QavfFFB6k4+k3UQBOPjAIBD/02jTNu
 6fgA==
X-Gm-Message-State: AOAM5319CqwWMhc7Cm5BNXhjeseEsazUGgXyL4bh3Id1dRzKIyPjIPK5
 mMKoYoy5/2EUR+cUZRLyI5aWj3yhze1Y2uYBZXPbPeiVy+MjQeif94bDJc2nTFrDWm69NWV8+ND
 onxcfM4MowVHI+GWSxMyeBvL7+Z/SxpPPOwy9m60YiLP636K9ZkdzZoTKUp+KwAsrOGw=
X-Received: by 2002:a17:907:a0c9:b0:6f4:bbdf:8081 with SMTP id
 hw9-20020a170907a0c900b006f4bbdf8081mr822662ejc.257.1652376307920; 
 Thu, 12 May 2022 10:25:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE/IMyoF2WumqGITFeb8e3uoNta45CWibeSzM3BFChqlDxg0lPEpM42woVRQMwxsgKwbPzZQ==
X-Received: by 2002:a17:907:a0c9:b0:6f4:bbdf:8081 with SMTP id
 hw9-20020a170907a0c900b006f4bbdf8081mr822606ejc.257.1652376307383; 
 Thu, 12 May 2022 10:25:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 ot17-20020a170906ccd100b006f3ef214e3bsm2198556ejb.161.2022.05.12.10.25.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] Misc patches for 2022-05-12
Date: Thu, 12 May 2022 19:24:38 +0200
Message-Id: <20220512172505.1065394-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:

  Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 333dbac358acc6cc174029263d633a22f66584b4:

  vmxcap: add tertiary execution controls (2022-05-12 14:23:19 +0200)

----------------------------------------------------------------
* small cleanups for pc-bios/optionrom Makefiles
* checkpatch: fix g_malloc check
* fix mremap() and RDMA detection
* confine igd-passthrough-isa-bridge to Xen-enabled builds
* cover PCI in arm-virt machine qtests
* add -M boot and -M mem compound properties
* bump SLIRP submodule
* support CFI with system libslirp (>= 4.7)
* clean up CoQueue wakeup functions
* fix vhost-vsock regression
* fix --disable-vnc compilation
* other minor bugfixes

----------------------------------------------------------------
Bernhard Beschow (2):
      hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
      hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection

Eric Auger (3):
      tests/qtest/libqos/pci: Introduce pio_limit
      tests/qtest/libqos: Skip hotplug tests if pci root bus is not hotpluggable
      tests/qtest/libqos: Add generic pci host bridge in arm-virt machine

Juan Quintela (1):
      meson: Make mremap() detecting works correctly

Kshitij Suri (1):
      meson: link libpng independent of vnc

Paolo Bonzini (20):
      pc-bios/optionrom: detect -fno-pie
      pc-bios/optionrom: compile with -Wno-array-bounds
      target/i386: do not consult nonexistent host leaves
      checkpatch: fix g_malloc check
      machine: use QAPI struct for boot configuration
      machine: add boot compound property
      machine: add mem compound property
      machine: make memory-backend a link property
      machine: move more memory validation to Machine object
      slirp: bump submodule past 4.7 release
      net: slirp: introduce a wrapper struct for QemuTimer
      net: slirp: switch to slirp_new
      net: slirp: add support for CFI-friendly timer API
      net: slirp: allow CFI with libslirp >= 4.7
      coroutine-lock: qemu_co_queue_next is a coroutine-only qemu_co_enter_next
      coroutine-lock: introduce qemu_co_queue_enter_all
      coroutine-lock: qemu_co_queue_restart_all is a coroutine-only qemu_co_enter_all
      vhost-backend: do not depend on CONFIG_VHOST_VSOCK
      vl: make machine type deprecation a warning
      vmxcap: add tertiary execution controls

 block/io.c                            |   2 +-
 configure                             |   1 -
 hw/arm/nseries.c                      |   2 +-
 hw/core/machine.c                     | 241 ++++++++++++++++++++++++++++++----
 hw/core/numa.c                        |   2 +-
 hw/hppa/machine.c                     |   6 +-
 hw/i386/pc.c                          |   2 +-
 hw/i386/pc_piix.c                     | 118 -----------------
 hw/nvram/fw_cfg.c                     |  27 +---
 hw/ppc/mac_newworld.c                 |   2 +-
 hw/ppc/mac_oldworld.c                 |   2 +-
 hw/ppc/prep.c                         |   2 +-
 hw/ppc/spapr.c                        |   4 +-
 hw/s390x/ipl.c                        |  20 +--
 hw/sparc/sun4m.c                      |   9 +-
 hw/sparc64/sun4u.c                    |   4 +-
 hw/virtio/vhost-backend.c             |   4 -
 hw/xen/xen_pt.c                       |  12 --
 hw/xen/xen_pt.h                       |   2 +
 hw/xen/xen_pt_graphics.c              | 122 +++++++++++++++++
 include/hw/boards.h                   |   7 +-
 include/hw/i386/pc.h                  |   1 -
 include/qemu/coroutine.h              |  27 +++-
 include/sysemu/sysemu.h               |   2 -
 meson.build                           |  38 +++---
 net/slirp.c                           |  85 ++++++++++--
 pc-bios/optionrom/Makefile            |   4 +-
 qapi/machine.json                     |  48 +++++++
 scripts/checkpatch.pl                 |   4 +-
 scripts/kvm/vmxcap                    |  17 +++
 slirp                                 |   2 +-
 softmmu/bootdevice.c                  |   3 +-
 softmmu/globals.c                     |   2 -
 softmmu/vl.c                          | 231 +++++++++-----------------------
 target/i386/cpu.c                     |  41 +++++-
 tests/qtest/e1000e-test.c             |   6 +
 tests/qtest/libqos/arm-virt-machine.c |  19 ++-
 tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++++++++
 tests/qtest/libqos/generic-pcihost.h  |  54 ++++++++
 tests/qtest/libqos/meson.build        |   1 +
 tests/qtest/libqos/pci-pc.c           |   1 +
 tests/qtest/libqos/pci-spapr.c        |   1 +
 tests/qtest/libqos/pci.c              |  78 +++++++----
 tests/qtest/libqos/pci.h              |   6 +-
 tests/qtest/vhost-user-blk-test.c     |  10 ++
 tests/qtest/virtio-blk-test.c         |   5 +
 tests/qtest/virtio-net-test.c         |   5 +
 tests/qtest/virtio-rng-test.c         |   5 +
 ui/console.c                          |   2 +-
 ui/meson.build                        |   3 +-
 util/qemu-coroutine-lock.c            |  47 +++----
 51 files changed, 1072 insertions(+), 498 deletions(-)
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.h
-- 
2.36.0


