Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB868BB53
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:23:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzZf-0004Dk-C4; Mon, 06 Feb 2023 06:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZT-0004Cg-Q2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZR-0003Lq-N9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X4/ItBPPJAnDvyXgl70Ve2C6m7UmhgLBo5CGA8m1l08=;
 b=PaYIFJt5PGR4AyOMqBYP4O1wuqxJnKhY+pBQaQLKf0/KSbiECFEqpsAV4K6VzJyAaltRlu
 LFtrr17DwbcUXdRHgxovlsbRLWPBuQN1UBncX/c+lOtZO1D7mvCSTgJMuMe1b7LkEiqS9S
 yGk0JqHNlK42abq1zzYFihuD4lmFxfs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-qvNki5FAPr2dpYFyKrwwDQ-1; Mon, 06 Feb 2023 06:20:54 -0500
X-MC-Unique: qvNki5FAPr2dpYFyKrwwDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33E7529ABA01;
 Mon,  6 Feb 2023 11:20:54 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4453E492B21;
 Mon,  6 Feb 2023 11:20:48 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 0/8] hw/arm/virt: Support dirty ring
Date: Mon,  6 Feb 2023 19:20:02 +0800
Message-Id: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
PATCH[2-3]  Introduce indicator of the last stage migration and pass it
            all the way down
PATCH[4-5]  Introduce secondary bitmap, corresponding to the backup bitmap
PATCH[6-8]  Enable dirty ring for hw/arm/virt

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

Gavin Shan (8):
  linux-headers: Update for dirty ring
  memory: Add last stage indicator to global dirty log synchronization
  migration: Add last stage indicator to global dirty log
    synchronization
  kvm: Introduce secondary dirty bitmap
  kvm: Synchronize secondary bitmap in last stage
  kvm: Add helper kvm_dirty_ring_init()
  hw/arm/virt: Enable backup bitmap for dirty ring
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c           | 138 ++++++++++++++++++++++++----------
 hw/arm/virt.c                 |  26 +++++++
 include/exec/memory.h         |   5 +-
 include/sysemu/kvm_int.h      |   1 +
 linux-headers/asm-arm64/kvm.h |   1 +
 linux-headers/linux/kvm.h     |   2 +
 migration/dirtyrate.c         |   4 +-
 migration/ram.c               |  20 ++---
 softmmu/memory.c              |  10 +--
 target/arm/kvm64.c            |  25 ++++++
 target/arm/kvm_arm.h          |  12 +++
 11 files changed, 185 insertions(+), 59 deletions(-)

-- 
2.23.0


