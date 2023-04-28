Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33966F146C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:45:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKdx-0003Q7-HU; Fri, 28 Apr 2023 05:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKdv-0003Pv-P2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psKdu-0007YN-5f
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bk2T1fvr5pGuffGlwaBciK9+kvKF98JW57BiMBFLZc0=;
 b=XXe5YxiI5CZcGb0keJxlK52zwOwLKs5z3fETVBq5YirAI8xI9uxtVb7hIR6sND1FomPdhq
 PiVenfiPcHrtsZ64PQ9uyr7/+iCK3p652R3MckzLjDDaawl5ynGcuBW+8bHrqa/zvDS/l/
 VKR8mvu6Ita4mamWKPhALBf0WGQOP2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-kLlAzyuyMF-2fdReqJv3RQ-1; Fri, 28 Apr 2023 05:43:49 -0400
X-MC-Unique: kLlAzyuyMF-2fdReqJv3RQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 754521C06EDB;
 Fri, 28 Apr 2023 09:43:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A05491410F1E;
 Fri, 28 Apr 2023 09:43:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 00/13] DMA reentrancy fixes and other misc patches
Date: Fri, 28 Apr 2023 11:43:33 +0200
Message-Id: <20230428094346.1292054-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

 Hi Richard!

The following changes since commit cc5ee50fff9dbac0aac32cd892a7163c7babcca1:

  Merge tag 'pull-testing-docs-270423-1' of https://gitlab.com/stsquad/qemu into staging (2023-04-27 16:46:17 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-04-28

for you to fetch changes up to 50795ee051a342c681a9b45671c552fbd6274db8:

  apic: disable reentrancy detection for apic-msi (2023-04-28 11:31:54 +0200)

----------------------------------------------------------------
* Prevent reentrant DMA accesses by default
* Only compile hw/rdma code when necessary
* Fix a potential locking issue in the vhost-user-test
* Offer more registers in GDB for s390x TCG

----------------------------------------------------------------
Alexander Bulekov (8):
      memory: prevent dma-reentracy issues
      async: Add an optional reentrancy guard to the BH API
      checkpatch: add qemu_bh_new/aio_bh_new checks
      hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
      lsi53c895a: disable reentrancy detection for script RAM
      bcm2835_property: disable reentrancy detection for iomem
      raven: disable reentrancy detection for iomem
      apic: disable reentrancy detection for apic-msi

Ilya Leoshkevich (1):
      s390x/gdb: Split s390-virt.xml

Paolo Bonzini (1):
      tests: vhost-user-test: release mutex on protocol violation

Thomas Huth (3):
      hw/rdma: Remove unused macros PG_DIR_SZ and PG_TBL_SZ
      hw/rdma: Compile target-independent parts of the rdma code only once
      hw/rdma: VMW_PVRDMA should depend on VMXNET3_PCI

 docs/devel/multiple-iothreads.txt    |  7 ++++
 configs/targets/s390x-linux-user.mak |  2 +-
 configs/targets/s390x-softmmu.mak    |  2 +-
 hw/ide/ahci_internal.h               |  1 +
 include/block/aio.h                  | 18 ++++++++--
 include/exec/memory.h                |  5 +++
 include/hw/qdev-core.h               |  7 ++++
 include/qemu/main-loop.h             |  7 ++--
 hw/9pfs/xen-9p-backend.c             |  5 ++-
 hw/block/dataplane/virtio-blk.c      |  3 +-
 hw/block/dataplane/xen-block.c       |  5 +--
 hw/char/virtio-serial-bus.c          |  3 +-
 hw/display/qxl.c                     |  9 +++--
 hw/display/virtio-gpu.c              |  6 ++--
 hw/ide/ahci.c                        |  3 +-
 hw/ide/core.c                        |  4 ++-
 hw/intc/apic.c                       |  7 ++++
 hw/misc/bcm2835_property.c           |  7 ++++
 hw/misc/imx_rngc.c                   |  6 ++--
 hw/misc/macio/mac_dbdma.c            |  2 +-
 hw/net/virtio-net.c                  |  3 +-
 hw/nvme/ctrl.c                       |  6 ++--
 hw/pci-host/raven.c                  |  7 ++++
 hw/rdma/rdma_rm.c                    |  4 ---
 hw/scsi/lsi53c895a.c                 |  6 ++++
 hw/scsi/mptsas.c                     |  3 +-
 hw/scsi/scsi-bus.c                   |  3 +-
 hw/scsi/vmw_pvscsi.c                 |  3 +-
 hw/usb/dev-uas.c                     |  3 +-
 hw/usb/hcd-dwc2.c                    |  3 +-
 hw/usb/hcd-ehci.c                    |  3 +-
 hw/usb/hcd-uhci.c                    |  2 +-
 hw/usb/host-libusb.c                 |  6 ++--
 hw/usb/redirect.c                    |  6 ++--
 hw/usb/xen-usb.c                     |  3 +-
 hw/virtio/virtio-balloon.c           |  5 +--
 hw/virtio/virtio-crypto.c            |  3 +-
 softmmu/memory.c                     | 16 +++++++++
 target/s390x/gdbstub.c               | 65 +++++++++++++++++++++++++-----------
 tests/qtest/vhost-user-test.c        |  3 +-
 tests/unit/ptimer-test-stubs.c       |  3 +-
 util/async.c                         | 18 +++++++++-
 util/main-loop.c                     |  6 ++--
 gdb-xml/s390-virt-kvm.xml            | 14 ++++++++
 gdb-xml/s390-virt.xml                |  4 ---
 hw/rdma/Kconfig                      |  2 +-
 hw/rdma/meson.build                  |  8 +++--
 scripts/checkpatch.pl                |  8 +++++
 util/trace-events                    |  1 +
 49 files changed, 250 insertions(+), 76 deletions(-)
 create mode 100644 gdb-xml/s390-virt-kvm.xml


