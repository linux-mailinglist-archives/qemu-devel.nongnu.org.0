Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97469A208
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnGM-0001ph-R3; Thu, 16 Feb 2023 18:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGH-0001pN-2O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGE-0005Td-Be
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JYLSxQ9i701vsursKR0Cyht9+IWZfw9fH+InaHt19bU=;
 b=I2/1yDe0cpX6I9yM4kxjjxYZ/0lVfVFsymeEv51g3T21ZHMhgWnqiEuwyOXmJ0xi/EMx5i
 KL2Bs1LFbUraOxn2KzvjzVc4Huu6Lm0XiBZPaD41KGCo3wQMsH17lAOzGNEBFiayJ0Sw6m
 Nbqxz/oKfq+bEnMw849famZTHTN1vwQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-LE13vWuAO2GpjFqvHXKznQ-1; Thu, 16 Feb 2023 18:01:49 -0500
X-MC-Unique: LE13vWuAO2GpjFqvHXKznQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1506C380452A;
 Thu, 16 Feb 2023 23:01:49 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8802A40B40C9;
 Thu, 16 Feb 2023 23:01:47 +0000 (UTC)
Subject: [PULL 00/12] VFIO updates 2023-02-16
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:01:47 -0700
Message-ID: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the Git repository at:

  https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230216.0

for you to fetch changes up to 57edb7e44489ec4d85075acba47223127ecf1521:

  MAINTAINERS: Add myself as VFIO reviewer (2023-02-16 12:14:40 -0700)

----------------------------------------------------------------
VFIO updates 2023-02-16

 * Initial v2 migration support for vfio (Avihai Horon)

 * Add Cédric as vfio reviewer (Cédric Le Goater)

----------------------------------------------------------------
Avihai Horon (11):
      linux-headers: Update to v6.2-rc8
      vfio/migration: Fix NULL pointer dereference bug
      vfio/migration: Allow migration without VFIO IOMMU dirty tracking support
      vfio/common: Change vfio_devices_all_running_and_saving() logic to equivalent one
      vfio/migration: Block multiple devices migration
      vfio/migration: Move migration v1 logic to vfio_migration_init()
      vfio/migration: Rename functions/structs related to v1 protocol
      vfio/migration: Implement VFIO migration protocol v2
      vfio/migration: Remove VFIO migration protocol v1
      vfio: Alphabetize migration section of VFIO trace-events file
      docs/devel: Align VFIO migration docs to v2 protocol

Cédric Le Goater (1):
      MAINTAINERS: Add myself as VFIO reviewer

 MAINTAINERS                                        |   1 +
 docs/devel/vfio-migration.rst                      |  72 +-
 hw/vfio/common.c                                   |  92 ++-
 hw/vfio/migration.c                                | 736 +++++++--------------
 hw/vfio/trace-events                               |  28 +-
 include/hw/vfio/vfio-common.h                      |  10 +-
 include/standard-headers/drm/drm_fourcc.h          |  29 +
 include/standard-headers/linux/ethtool.h           |  18 +-
 include/standard-headers/linux/fuse.h              |  16 +-
 include/standard-headers/linux/input-event-codes.h |   3 +
 include/standard-headers/linux/pci_regs.h          |   2 +
 include/standard-headers/linux/virtio_bt.h         |   8 +
 include/standard-headers/linux/virtio_net.h        |   4 +
 linux-headers/asm-arm64/kvm.h                      |   1 +
 linux-headers/asm-riscv/kvm.h                      |   3 +
 linux-headers/asm-x86/kvm.h                        |  11 +-
 linux-headers/linux/kvm.h                          |  34 +-
 linux-headers/linux/psci.h                         |   4 +-
 linux-headers/linux/vfio.h                         | 136 +++-
 19 files changed, 612 insertions(+), 596 deletions(-)


