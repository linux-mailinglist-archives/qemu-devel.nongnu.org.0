Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA3D693B69
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 01:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMsy-0008Vm-4n; Sun, 12 Feb 2023 19:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMsq-0008VP-FJ
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMso-00032N-Mw
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Df4jp6gamqU46w877R8ozW9UXRgdHLovmNlD+4tUQ/0=;
 b=GvG93bSdgSxgejS93rKH0HlIIVCDKsF2aU/R4bVronRQmdrQFM//sZ/kyjEEpb1l8zG2rB
 3Th7G9zuJiJXK25mg8FFejUM1zRr505yrhyQ4r+2b9WNf7kKy4a7Zw5vs+3/Dq8UIozdZG
 Op//ARJNdzda/z6JC14BPyV8t9Ybq7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-7v-1nZw6OHOeOPqvsANqEA-1; Sun, 12 Feb 2023 19:39:46 -0500
X-MC-Unique: 7v-1nZw6OHOeOPqvsANqEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 242D5101A521;
 Mon, 13 Feb 2023 00:39:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C5C401014C;
 Mon, 13 Feb 2023 00:39:40 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 0/6] hw/arm/virt: Support dirty ring
Date: Mon, 13 Feb 2023 08:39:19 +0800
Message-Id: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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

This series intends to support dirty ring for live migration. The dirty
ring use discrete buffer to track dirty pages. For ARM64, the speciality
is to use backup bitmap to track dirty pages when there is no-running-vcpu
context. It's known that the backup bitmap needs to be synchronized when
KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
bitmap is collected in the last stage of migration.

PATCH[1]    Synchronize linux-headers for dirty ring
PATCH[2]    Introduce indicator of the last stage migration and pass it
            all the way down
PATCH[3]    Synchronize the backup bitmap in the last stage of live migration
PATCH[4]    Introduce helper kvm_dirty_ring_init() to enable the dirty ring
PATCH[5-6]  Enable dirty ring for hw/arm/virt

RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html

Testing
=======
(1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
    dirty ring or normal dirty page tracking mechanism. All test cases passed.

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
    ./its-pending-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
    ./its-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
    ./its-pending-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
    ./its-migration

(2) Combinations of migration, post-copy migration, e1000e and virtio-net
    devices. All test cases passed.

    -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
    -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0

    -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
    -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0

Changelog
=========
v1:
  * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (Peter)
  * Drop the secondary bitmap and use the original one directly                (Juan)
  * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)


Gavin Shan (6):
  linux-headers: Update for dirty ring
  migration: Add last stage indicator to global dirty log
    synchronization
  kvm: Synchronize the backup bitmap in the last stage
  kvm: Add helper kvm_dirty_ring_init()
  hw/arm/virt: Enable backup bitmap for dirty ring
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c           | 95 ++++++++++++++++++++++++-----------
 hw/arm/virt.c                 | 26 ++++++++++
 include/exec/memory.h         |  5 +-
 include/sysemu/kvm_int.h      |  1 +
 linux-headers/asm-arm64/kvm.h |  1 +
 linux-headers/linux/kvm.h     |  2 +
 migration/dirtyrate.c         |  4 +-
 migration/ram.c               | 20 ++++----
 softmmu/memory.c              | 10 ++--
 target/arm/kvm64.c            | 25 +++++++++
 target/arm/kvm_arm.h          | 12 +++++
 11 files changed, 152 insertions(+), 49 deletions(-)

-- 
2.23.0


