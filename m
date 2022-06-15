Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18BE54CDA7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:57:14 +0200 (CEST)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VOL-0006qI-OS
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLe-0003nV-GT
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLY-0007GM-A0
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oLUR2hl/OtB2we09SgXcEKluwSyiyE5fQuyTkPGSeWU=;
 b=YYH9A5Z+B4EsqumambV/YZWdI5lzC006KQpEQVG/XwU+EKciLUSWrl83Y87IkKnBm1HUnw
 N0g4WkyP4xbBOERaPer0IGq1h26Q0TSnP/NS93pnkoSpfsmrpXx+ZocXsJe8sPJcwWoIQk
 keTydX+7WII5iFDaYkzZelsocjf6PzI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-AVeI4XklMHGPn6dGosOpag-1; Wed, 15 Jun 2022 11:54:15 -0400
X-MC-Unique: AVeI4XklMHGPn6dGosOpag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11C9A38005C8;
 Wed, 15 Jun 2022 15:54:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A92F1415106;
 Wed, 15 Jun 2022 15:54:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PULL 00/18] Block patches
Date: Wed, 15 Jun 2022 16:51:11 +0100
Message-Id: <20220615155129.1025811-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 8e6c70b9d4a1b1f3011805947925cfdb31642f7f:

  Merge tag 'kraxel-20220614-pull-request' of git://git.kraxel.org/qemu into staging (2022-06-14 06:21:46 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 99b969fbe105117f5af6060d3afef40ca39cc9c1:

  linux-aio: explain why max batch is checked in laio_io_unplug() (2022-06-15 16:43:42 +0100)

----------------------------------------------------------------
Pull request

This pull request includes an important aio=native I/O stall fix, the
experimental vifo-user server, the io_uring_register_ring_fd() optimization for
aio=io_uring, and an update to Vladimir Sementsov-Ogievskiy's maintainership
details.

----------------------------------------------------------------

Jagannathan Raman (14):
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device

Sam Li (1):
  Use io_uring_register_ring_fd() to skip fd operations

Stefan Hajnoczi (2):
  linux-aio: fix unbalanced plugged counter in laio_io_unplug()
  linux-aio: explain why max batch is checked in laio_io_unplug()

Vladimir Sementsov-Ogievskiy (1):
  MAINTAINERS: update Vladimir's address and repositories

 MAINTAINERS                             |  27 +-
 meson_options.txt                       |   2 +
 qapi/misc.json                          |  31 +
 qapi/qom.json                           |  20 +-
 configure                               |  17 +
 meson.build                             |  24 +-
 include/exec/memory.h                   |   3 +
 include/hw/pci/msi.h                    |   1 +
 include/hw/pci/msix.h                   |   1 +
 include/hw/pci/pci.h                    |  13 +
 include/hw/qdev-core.h                  |  29 +
 include/hw/remote/iommu.h               |  40 +
 include/hw/remote/machine.h             |   4 +
 include/hw/remote/vfio-user-obj.h       |   6 +
 block/io_uring.c                        |  12 +-
 block/linux-aio.c                       |  10 +-
 hw/core/qdev.c                          |  24 +
 hw/pci/msi.c                            |  49 +-
 hw/pci/msix.c                           |  35 +-
 hw/pci/pci.c                            |  13 +
 hw/remote/iommu.c                       | 131 ++++
 hw/remote/machine.c                     |  88 ++-
 hw/remote/vfio-user-obj.c               | 958 ++++++++++++++++++++++++
 softmmu/physmem.c                       |   4 +-
 softmmu/qdev-monitor.c                  |   4 +
 stubs/vfio-user-obj.c                   |   6 +
 tests/qtest/fuzz/generic_fuzz.c         |   9 +-
 .gitlab-ci.d/buildtest.yml              |   1 +
 .gitmodules                             |   3 +
 Kconfig.host                            |   4 +
 hw/remote/Kconfig                       |   4 +
 hw/remote/meson.build                   |   4 +
 hw/remote/trace-events                  |  11 +
 scripts/meson-buildoptions.sh           |   4 +
 stubs/meson.build                       |   1 +
 subprojects/libvfio-user                |   1 +
 tests/docker/dockerfiles/centos8.docker |   2 +
 37 files changed, 1565 insertions(+), 31 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user

-- 
2.36.1


