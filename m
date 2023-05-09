Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E26FBD16
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 04:23:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwCz9-0004Dk-Sa; Mon, 08 May 2023 22:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCz4-0004D0-8z
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:21:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCz2-0001vw-Hk
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683598903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ccArD908ueE4+IB6hGq+rjHTUflH0eVcyq/2oRF52zQ=;
 b=VZbxPdT8s9ADS7OySg2HcSBg5xEoLhrDO62uhKieK5altrW23TWhZIQfZcUL6h0gXITBOO
 e+h1OIebShmGtfHbmKWatwvvih2kH+++4Xy2+XG5JcSYq4dPuaeDKDGznkSpc+nEe/eIAG
 UVU20YFGhm7fkIo3cEDK2oH8U2a+9+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-PQhFvYdfMUKb6pbiesNMJw-1; Mon, 08 May 2023 22:21:40 -0400
X-MC-Unique: PQhFvYdfMUKb6pbiesNMJw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2E67185A79C;
 Tue,  9 May 2023 02:21:39 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5A3492B00;
 Tue,  9 May 2023 02:21:34 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 0/4] hw/arm/virt: Support dirty ring
Date: Tue,  9 May 2023 12:21:18 +1000
Message-Id: <20230509022122.20888-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This series intends to support dirty ring for live migration for arm64. The
dirty ring use discrete buffer to track dirty pages. For arm64, the speciality
is to use backup bitmap to track dirty pages when there is no-running-vcpu
context. It's known that the backup bitmap needs to be synchronized when
KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
bitmap is collected in the last stage of migration. The policy here is to
always enable the backup bitmap extension. The overhead to synchronize the
backup bitmap in the last stage of migration, when those two devices aren't
used, is introduced. However, the overhead should be very small and acceptable.
The benefit is to support future cases where those two devices are used without
modifying the code.

PATCH[1] add migration last stage indicator
PATCH[2] synchronize the backup bitmap in the last stage of migration
PATCH[3] add helper kvm_dirty_ring_init() to enable dirty ring
PATCH[4] enable dirty ring for arm64

   v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg01342.html
   v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00434.html
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
v3:
  * Rebase for QEMU v8.1.0                                                     (Gavin)
v2:
  * Drop PATCH[v1 1/6] to synchronize linux-headers                            (Gavin)
  * More restrictive comments about struct MemoryListener::log_sync_global     (PeterX)
  * Always enable the backup bitmap extension                                  (PeterM)
v1:
  * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (PeterX)
  * Drop the secondary bitmap and use the original one directly                (Juan)
  * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)

Gavin Shan (4):
  migration: Add last stage indicator to global dirty log
  kvm: Synchronize the backup bitmap in the last stage
  kvm: Add helper kvm_dirty_ring_init()
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c      | 108 ++++++++++++++++++++++++++++-----------
 include/exec/memory.h    |   7 ++-
 include/sysemu/kvm_int.h |   1 +
 migration/dirtyrate.c    |   4 +-
 migration/ram.c          |  20 ++++----
 softmmu/memory.c         |  10 ++--
 6 files changed, 101 insertions(+), 49 deletions(-)

-- 
2.23.0


