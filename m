Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC569A3B8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 03:01:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSq3k-0005Pd-Bt; Thu, 16 Feb 2023 21:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1pSq3h-0005Mp-U1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 21:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1pSq3f-0007QT-Ig
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 21:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676599266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJLH0Sa0dLvZjU2eTngV1BCXgPNvNq1lBuxFYdcI6XU=;
 b=L4n/J5P33/fTa7UTwx0J/pbQJohfjRq0ohXxB8iNU0nMi2udh7GLGTHGey+QYKaFPkwSAk
 AQ/0O329xg+8K/svyEwEVmA3NpU/vW4jkWfUpsCV/wHYgy6bp/eK1kEn0mkZ1WmnHfDIpE
 JVccO5TzjqWo6x7ra+ewUnkO+pPYi9M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-0gq1InlNNW6p-StFaWx37g-1; Thu, 16 Feb 2023 21:00:00 -0500
X-MC-Unique: 0gq1InlNNW6p-StFaWx37g-1
Received: by mail-ed1-f72.google.com with SMTP id
 v8-20020a056402348800b004ad062fee5eso3781195edc.17
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 18:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJLH0Sa0dLvZjU2eTngV1BCXgPNvNq1lBuxFYdcI6XU=;
 b=41mgkv3GA5SP2r6mLGT6v6scIcFOXpCsEC/E8c+/h54ZxyvjDaTqcZ/tsf5tJvnzxV
 aPxhQRFmiVcED12xKfRDApKGm38chx8QlZGYbbhSj9PNrxv9hawk7tK+IWsCoURszlY8
 mRRCq2pgPiz7fO9YQehIA2nPR8ZOdF/pTzho1icuwIfmyq8W2pGmZ5+YcLH5ywWVXJ1U
 id7uNxsg3Pd0zsvMBngwlGqDEg7NJhjR1LaL2dfqD1SIVZj0myVeLhZx/25iCRHFJAhS
 rGYCq2PbtPosHNcaY6FDQ3W4A2xp07qOZBJk/gesv3yH2szfa5gpIxnMrvsmgDqqoHLo
 Q/Ew==
X-Gm-Message-State: AO0yUKWD/5wwZM/MNc4V8ZFc7qVHaMyRnfSxniuHzwmYp6c7GFUxnoCN
 zhkaFmOGbJiGEsQuloQf8tTbyLygIVjHLsKM7DT0yFYrvN1ztre5PDPcoQhgBZm3xu5Ism8jabm
 Z1D006KpRz8fzoFHKsBfus+wy/Pdt8CI=
X-Received: by 2002:a17:906:4885:b0:8b2:23fb:dfd1 with SMTP id
 v5-20020a170906488500b008b223fbdfd1mr339941ejq.2.1676599199549; 
 Thu, 16 Feb 2023 17:59:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/yoe6XaCKLUOg3AZzKUoBJrt10D1ML2KM/N//yj7Kq3QZ3vdR5kZimQFAGrxxRwFfpcDm9KjEUZgSRBX5K6W0=
X-Received: by 2002:a17:906:4885:b0:8b2:23fb:dfd1 with SMTP id
 v5-20020a170906488500b008b223fbdfd1mr339923ejq.2.1676599199184; Thu, 16 Feb
 2023 17:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
From: Zhenyu Zhang <zhenyzha@redhat.com>
Date: Fri, 17 Feb 2023 09:59:23 +0800
Message-ID: <CAJFLiBKGVVJ9idPd9mmGpiVUhnNK1GyNKfB63QK=BU+3XkURSw@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] hw/arm/virt: Support dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com, 
 philmd@linaro.org, mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, 
 dgilbert@redhat.com, maz@kernel.org, shan.gavin@gmail.com, 
 Li Jin <lijin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=zhenyzha@redhat.com;
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

[PATCH v1 0/6] hw/arm/virt: Support dirty ring

The patches work well on my arm Ampere host.
The test results are as expected.

Testing
=======
(1) kvm-unit-tests/its-pending-migration,
kvm-unit-tests/its-migrate-unmapped-collection
    and kvm-unit-tests/its-migration with dirty ring or normal dirty
page tracking
    mechanism. All test cases passed.

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64 ACCEL=kvm \
    PROCESSOR=host ./its-migration

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64 ACCEL=kvm \
    PROCESSOR=host ./its-migrate-unmapped-collection

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64 ACCEL=kvm \
    PROCESSOR=host ./its-pending-migration

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64
ACCEL=kvm,dirty-ring-size=65536 \
    PROCESSOR=host ./its-migration

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64
ACCEL=kvm,dirty-ring-size=65536 \
    PROCESSOR=host ./its-migrate-unmapped-collection

    QEMU=/home/zhenyzha/sandbox/qemu/build/qemu-system-aarch64
ACCEL=kvm,dirty-ring-size=65536 \
    PROCESSOR=host ./its-pending-migration

(2) Combinations of migration, post-copy migration, e1000e and virtio-net
    devices. All test cases passed.

    -device '{"driver": "virtio-net-pci", "mac": "9a:97:8f:c7:cc:a6",
"rombar": 0, "netdev": "idDGdh30", "bus": "pcie-root-port-4", "addr":
"0x0"}'  \
    -netdev tap,id=idDGdh30,vhost=on

    -device '{"driver": "e1000e", "mac": "9a:fd:93:f1:97:b1",
"netdev": "idXDOtMA", "bus": "pcie-root-port-4", "addr": "0x0"}'  \
    -netdev tap,id=idXDOtMA,vhost=on  \

(3) Simulate heavy memory pressure scenarios and compare the migration
    performance difference between dirty ring and dirty logging.

    I gave with a 200G memory guest, 40 vcpus, using 10g NIC as migration
    channel.  When idle or dirty workload small, I don't observe major
    difference on total migration time.  When with higher random dirty
    workload (Anonymous mapping 180G memory, 256MB/s dirty rate upon).
    Total migration time is (in seconds):


    |-------------------------+|-------------------------|
    | dirty ring (4k entries) | dirty logging       |
    |-------------------------+|-------------------------|
    |                           67 |                         74 |
    |                           67 |                         74 |
    |                           66 |                         76 |
    |                           66 |                         73 |
    |                           67 |                         76 |
    |                           67 |                         76 |
    |                           66 |                         73 |
    |                           67 |                         74 |
    |-------------------------+|-------------------------|

    Summary:

    dirty ring average:    67s
    dirty logging average: 75s

Tested-by: Zhenyu Zhang <zhenzha@redhat.com>


On Mon, Feb 13, 2023 at 8:39 AM Gavin Shan <gshan@redhat.com> wrote:
>
> This series intends to support dirty ring for live migration. The dirty
> ring use discrete buffer to track dirty pages. For ARM64, the speciality
> is to use backup bitmap to track dirty pages when there is no-running-vcpu
> context. It's known that the backup bitmap needs to be synchronized when
> KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
> bitmap is collected in the last stage of migration.
>
> PATCH[1]    Synchronize linux-headers for dirty ring
> PATCH[2]    Introduce indicator of the last stage migration and pass it
>             all the way down
> PATCH[3]    Synchronize the backup bitmap in the last stage of live migration
> PATCH[4]    Introduce helper kvm_dirty_ring_init() to enable the dirty ring
> PATCH[5-6]  Enable dirty ring for hw/arm/virt
>
> RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html
>
> Testing
> =======
> (1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
>     dirty ring or normal dirty page tracking mechanism. All test cases passed.
>
>     QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
>     ./its-pending-migration
>
>     QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
>     ./its-migration
>
>     QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
>     ./its-pending-migration
>
>     QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
>     ./its-migration
>
> (2) Combinations of migration, post-copy migration, e1000e and virtio-net
>     devices. All test cases passed.
>
>     -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
>     -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0
>
>     -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
>     -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0
>
> Changelog
> =========
> v1:
>   * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (Peter)
>   * Drop the secondary bitmap and use the original one directly                (Juan)
>   * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)
>
>
> Gavin Shan (6):
>   linux-headers: Update for dirty ring
>   migration: Add last stage indicator to global dirty log
>     synchronization
>   kvm: Synchronize the backup bitmap in the last stage
>   kvm: Add helper kvm_dirty_ring_init()
>   hw/arm/virt: Enable backup bitmap for dirty ring
>   kvm: Enable dirty ring for arm64
>
>  accel/kvm/kvm-all.c           | 95 ++++++++++++++++++++++++-----------
>  hw/arm/virt.c                 | 26 ++++++++++
>  include/exec/memory.h         |  5 +-
>  include/sysemu/kvm_int.h      |  1 +
>  linux-headers/asm-arm64/kvm.h |  1 +
>  linux-headers/linux/kvm.h     |  2 +
>  migration/dirtyrate.c         |  4 +-
>  migration/ram.c               | 20 ++++----
>  softmmu/memory.c              | 10 ++--
>  target/arm/kvm64.c            | 25 +++++++++
>  target/arm/kvm_arm.h          | 12 +++++
>  11 files changed, 152 insertions(+), 49 deletions(-)
>
> --
> 2.23.0
>


