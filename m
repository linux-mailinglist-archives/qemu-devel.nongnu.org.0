Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF744AA572
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:51:29 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAEa-0006ze-9K
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6C-0003e2-PZ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA67-0003HO-ME
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JCYgq3z3a+JDgwSUOCX1g5fxqsQW3rZrBXxYmDyiBZw=;
 b=G8f/I7UiYXFWD3Qe4KfdHalb10ms/YdTbnly0eFTV5QEDxLpkTimGukmpjD3xexOpMPIdG
 SlLjXZhXeTOhHHVI8VmP4g9A7Wn21pmS6/j1yzs17FC4YF0DJ6r+oNTeuG+sCdhdCxOoTV
 lt9lpQAPQgDluC7O0E3i0OZB14FsbLM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-x7AQiZYBMKyhaa_BAW-v0Q-1; Fri, 04 Feb 2022 20:42:41 -0500
X-MC-Unique: x7AQiZYBMKyhaa_BAW-v0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so8373859wmb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=JCYgq3z3a+JDgwSUOCX1g5fxqsQW3rZrBXxYmDyiBZw=;
 b=VgN+ZIFrb3qV5TVMwumUZm2b3VjuSKVDWfoVpxVq+Clc+mvPSI8duMZw9xfSSCnSb2
 Cni7B0Zr7gOq69SHEMXpfdLsLTXCpsIOwAywHzYZpnA/1NSRKwy1UGpoKo4riBUq0+dq
 aw1XtEGbwrbm0SnYDZfK/Wqq9GGdhMGk8Pf41ExNE8L+O+1QcMjldNkbO4G8AkJt1i3O
 iDYMdMjBzw9qW4A9kKI/IYFnpeSPivDWkATWwetX65YFsDWr3fV8/sU0Fiv17dfJ2ZHM
 klx6Qa2Jska7tl9zoBfd2kq1oauMQ5NgKWrPfbi+g34MmyvF4MaVUNnORhNK3n0+kQR6
 NfjQ==
X-Gm-Message-State: AOAM531XTP3QcjRU46HI9W/1MCTmo386+G2dtpgm1eaOsxhvyw8qVYQW
 TGk0qdAd9wBkAxg+wLq88L99lYJCnPZSffsQK42vST+7+U4GZhkzaivgsQgg7XrTndlq86PWmBJ
 Eqf+6Hglw2OkuK0Hk4Q2jUVd2IKjnsogj4ugLHPhG3pXM3CDfb60X39dNIKR/
X-Received: by 2002:a5d:59af:: with SMTP id p15mr1274552wrr.488.1644025359912; 
 Fri, 04 Feb 2022 17:42:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfqge7X7519Eeyzlf+dlf2ao6LMiJmhFJUDKHyLYfiSLMNVZbVTguJkLKCFV6ZTh1aPC8d4Q==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr1274530wrr.488.1644025359583; 
 Fri, 04 Feb 2022 17:42:39 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id u14sm3295439wmq.41.2022.02.04.17.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:39 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/32] virtio,pc: features, cleanups, fixes
Message-ID: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:

  Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 593a84174b09f0c8ae4d35ad014f93d1fb7cac00:

  util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc() (2022-02-04 20:16:59 -0500)

----------------------------------------------------------------
virtio,pc: features, cleanups, fixes

virtio introspection commands
Part of ACPI ERST support
fixes, cleanups

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
David Hildenbrand (4):
      libvhost-user: Simplify VHOST_USER_REM_MEM_REG
      libvhost-user: fix VHOST_USER_REM_MEM_REG not closing the fd
      libvhost-user: Map shared RAM with MAP_NORESERVE to support virtio-mem with hugetlb
      util/oslib-posix: Fix missing unlock in the error path of os_mem_prealloc()

Eric DeVolder (9):
      ACPI ERST: bios-tables-test.c steps 1 and 2
      ACPI ERST: PCI device_id for ERST
      ACPI ERST: header file for ERST
      ACPI ERST: support for ACPI ERST feature
      ACPI ERST: build the ACPI ERST table
      ACPI ERST: create ACPI ERST table for pc/x86 machines
      ACPI ERST: qtest for ERST
      ACPI ERST: bios-tables-test testcase
      ACPI ERST: step 6 of bios-tables-test.c

Igor Mammedov (5):
      tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for test_oem_fields() test
      tests: acpi: whitelist nvdimm's SSDT and FACP.slic expected blobs
      acpi: fix OEM ID/OEM Table ID padding
      tests: acpi: update expected blobs
      tests: acpi: test short OEM_ID/OEM_TABLE_ID values in test_oem_fields()

Jonah Palmer (2):
      virtio: drop name parameter for virtio_init()
      virtio: add vhost support for virtio devices

Laurent Vivier (6):
      qmp: add QMP command x-query-virtio
      qmp: add QMP command x-query-virtio-status
      qmp: decode feature & status bits in virtio-status
      qmp: add QMP commands for virtio/vhost queue-status
      qmp: add QMP command x-query-virtio-queue-element
      hmp: add virtio commands

Michael S. Tsirkin (1):
      cpuid: use unsigned for max cpuid

Raphael Norwitz (4):
      libvhost-user: Add vu_rem_mem_reg input validation
      libvhost-user: Add vu_add_mem_reg input validation
      libvhost-user: prevent over-running max RAM slots
      libvhost-user: handle removal of identical regions

Thomas Huth (1):
      hw/i386: Add the possibility to disable the 'isapc' machine

 configure                                 |    2 +-
 qapi/qapi-schema.json                     |    1 +
 qapi/virtio.json                          |  841 +++++++++++++++++++++++
 include/hw/acpi/erst.h                    |   24 +
 include/hw/pci/pci.h                      |    1 +
 include/hw/virtio/vhost-vsock-common.h    |    2 +-
 include/hw/virtio/vhost.h                 |    3 +
 include/hw/virtio/virtio-gpu.h            |    3 +-
 include/hw/virtio/virtio.h                |   26 +-
 include/monitor/hmp.h                     |    5 +
 subprojects/libvhost-user/libvhost-user.h |    2 +
 hw/9pfs/virtio-9p-device.c                |    2 +-
 hw/acpi/aml-build.c                       |    4 +-
 hw/acpi/erst.c                            | 1055 +++++++++++++++++++++++++++++
 hw/block/vhost-user-blk.c                 |    9 +-
 hw/block/virtio-blk.c                     |   31 +-
 hw/char/virtio-serial-bus.c               |   14 +-
 hw/display/vhost-user-gpu.c               |    7 +
 hw/display/virtio-gpu-base.c              |   20 +-
 hw/i386/acpi-build.c                      |   15 +
 hw/i386/acpi-microvm.c                    |   15 +
 hw/i386/pc_piix.c                         |    5 +-
 hw/input/vhost-user-input.c               |    7 +
 hw/input/virtio-input.c                   |   13 +-
 hw/net/virtio-net.c                       |   58 +-
 hw/scsi/vhost-scsi.c                      |    8 +
 hw/scsi/virtio-scsi.c                     |   20 +-
 hw/virtio/vhost-user-fs.c                 |   20 +-
 hw/virtio/vhost-user-i2c.c                |    7 +-
 hw/virtio/vhost-user-rng.c                |    9 +-
 hw/virtio/vhost-user-vsock.c              |    2 +-
 hw/virtio/vhost-vsock-common.c            |   22 +-
 hw/virtio/vhost-vsock.c                   |    2 +-
 hw/virtio/vhost.c                         |    4 +-
 hw/virtio/virtio-balloon.c                |   17 +-
 hw/virtio/virtio-crypto.c                 |   22 +-
 hw/virtio/virtio-iommu.c                  |   17 +-
 hw/virtio/virtio-mem.c                    |   14 +-
 hw/virtio/virtio-pmem.c                   |    3 +-
 hw/virtio/virtio-rng.c                    |    2 +-
 hw/virtio/virtio-stub.c                   |   42 ++
 hw/virtio/virtio.c                        |  742 +++++++++++++++++++-
 monitor/hmp-cmds.c                        |  311 +++++++++
 subprojects/libvhost-user/libvhost-user.c |   86 ++-
 tests/qtest/bios-tables-test.c            |   65 +-
 tests/qtest/cdrom-test.c                  |    2 +-
 tests/qtest/erst-test.c                   |  172 +++++
 tests/qtest/qmp-cmd-test.c                |    1 +
 util/bufferiszero.c                       |    2 +-
 util/oslib-posix.c                        |    1 +
 hmp-commands-info.hx                      |   70 ++
 hw/acpi/Kconfig                           |    6 +
 hw/acpi/meson.build                       |    1 +
 hw/acpi/trace-events                      |   15 +
 hw/virtio/meson.build                     |    2 +
 qapi/meson.build                          |    1 +
 tcg/i386/tcg-target.c.inc                 |    2 +-
 tests/data/acpi/microvm/ERST.pcie         |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst          |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst          |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/SSDT.dimmpxm           |  Bin 734 -> 734 bytes
 tests/data/acpi/q35/DSDT.acpierst         |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst         |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/FACP.slic             |  Bin 244 -> 244 bytes
 tests/data/acpi/q35/SSDT.dimmpxm          |  Bin 734 -> 734 bytes
 tests/data/acpi/virt/SSDT.memhp           |  Bin 736 -> 736 bytes
 tests/qtest/meson.build                   |    2 +
 67 files changed, 3776 insertions(+), 81 deletions(-)
 create mode 100644 qapi/virtio.json
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 hw/acpi/erst.c
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 tests/qtest/erst-test.c
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst


