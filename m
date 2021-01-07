Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29342ED33E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:09:29 +0100 (CET)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWun-0000KU-2e
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWsJ-0006m7-PX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWsG-0003j7-Ao
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+N4xa4491VRr921skCVuC8JUk2UBa4R/H9Hjzvypa0k=;
 b=goVlvT1t6ywV0KAfSrYaJ/Cr31vT+a5rIIGabOOii7EAwMD2FXEErROkS+ofLW2FwCCidt
 XHa64EeBDCUWJUm2EVu8rvtaySMRpHYZFD0Qh2KfWGAvoUudhR8jQOLKyxPR+mAkGwMrKQ
 e9MAmG6OSnc2d+nz7CQz35OVw9VxGQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-3uSdBrRBOgq0mGZ4hhiH3w-1; Thu, 07 Jan 2021 10:06:48 -0500
X-MC-Unique: 3uSdBrRBOgq0mGZ4hhiH3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1C1801B18
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:06:47 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DCE660861;
 Thu,  7 Jan 2021 15:06:41 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/19] i386: KVM: expand Hyper-V features early and provide
 simple 'hv-default=on' option
Date: Thu,  7 Jan 2021 16:06:21 +0100
Message-Id: <20210107150640.539239-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a successor of "[PATCH RFC v3 00/23] i386: KVM: expand
Hyper-V features early" and "[PATCH v2 2/2] i386: provide simple 'hyperv=on'"
option to x86 machine types".

Changes:
- Make 'hv-default' a CPU option and not a machine type option [Igor].
- Introduce a simple qtest [Eduardo].
- Update linux headers from 5.11-rc2.

Description:

Upper layer tools like libvirt want to figure out which Hyper-V features are
supported by the underlying stack (QEMU/KVM) but currently they are unable to
do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU but it has
no effect on e.g. QMP's 

query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}

command as we parse Hyper-V features after creating KVM vCPUs and not at
feature expansion time. To support the use-case we first need to make 
KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existing
vCPU version can't be used that early. This is what KVM part does. With
that done, we can make early Hyper-V feature expansion (this series).

In addition, provide a simple 'hv-default' option which enables (and
requires from KVM) all currently supported Hyper-V enlightenments.
Unlike 'hv_passthrough' mode, this is going to be migratable.

Vitaly Kuznetsov (19):
  linux-headers: update against 5.11-rc2
  i386: introduce kvm_hv_evmcs_available()
  i386: keep hyperv_vendor string up-to-date
  i386: invert hyperv_spinlock_attempts setting logic with
    hv_passthrough
  i386: always fill Hyper-V CPUID feature leaves from X86CPU data
  i386: stop using env->features[] for filling Hyper-V CPUIDs
  i386: introduce hyperv_feature_supported()
  i386: introduce hv_cpuid_get_host()
  i386: drop FEAT_HYPERV feature leaves
  i386: introduce hv_cpuid_cache
  i386: split hyperv_handle_properties() into
    hyperv_expand_features()/hyperv_fill_cpuids()
  i386: move eVMCS enablement to hyperv_init_vcpu()
  i386: switch hyperv_expand_features() to using error_setg()
  i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size
  i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one
  i386: use global kvm_state in hyperv_enabled() check
  i386: expand Hyper-V features during CPU feature expansion time
  i386: provide simple 'hv-default=on' option
  qtest/hyperv: Introduce a simple hyper-v test

 MAINTAINERS                                   |   1 +
 docs/hyperv.txt                               |  16 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
 include/standard-headers/drm/drm_fourcc.h     | 175 +++++-
 include/standard-headers/linux/const.h        |  36 ++
 include/standard-headers/linux/ethtool.h      |   2 +-
 include/standard-headers/linux/fuse.h         |  30 +-
 include/standard-headers/linux/kernel.h       |   9 +-
 include/standard-headers/linux/pci_regs.h     |  16 +
 include/standard-headers/linux/vhost_types.h  |   9 +
 include/standard-headers/linux/virtio_gpu.h   |  82 +++
 include/standard-headers/linux/virtio_ids.h   |  44 +-
 linux-headers/asm-arm64/kvm.h                 |   3 -
 linux-headers/asm-generic/unistd.h            |   6 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  56 +-
 linux-headers/linux/userfaultfd.h             |   9 +
 linux-headers/linux/vfio.h                    |   1 +
 linux-headers/linux/vhost.h                   |   4 +
 scripts/update-linux-headers.sh               |   5 +-
 target/i386/cpu.c                             | 151 ++---
 target/i386/cpu.h                             |  11 +-
 target/i386/kvm/kvm-stub.c                    |  10 +
 target/i386/kvm/kvm.c                         | 524 ++++++++++--------
 target/i386/kvm/kvm_i386.h                    |   2 +
 tests/qtest/hyperv-test.c                     | 238 ++++++++
 tests/qtest/meson.build                       |   3 +-
 37 files changed, 1074 insertions(+), 382 deletions(-)
 create mode 100644 include/standard-headers/linux/const.h
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.29.2


