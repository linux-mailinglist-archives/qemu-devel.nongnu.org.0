Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530725DC8D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:58:21 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDAS-0004kg-H5
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED7x-0000Lj-VF
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47366
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED7v-0007Ck-Lt
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-lr_HHQjuNdin4uU3t31ekg-1; Fri, 04 Sep 2020 10:54:34 -0400
X-MC-Unique: lr_HHQjuNdin4uU3t31ekg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F03018BA28C
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:54:34 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC6D47E416;
 Fri,  4 Sep 2020 14:54:32 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 00/22] i386: KVM: expand Hyper-V features early
Date: Fri,  4 Sep 2020 16:54:09 +0200
Message-Id: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pairs with https://lore.kernel.org/kvm/20200807083946.377654-1-vkuznets@redhat.com/
and as KVM part is not yet accepted, sending this as RFC.

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

Vitaly Kuznetsov (22):
  WIP: update linux/headers
  i386: drop x86_cpu_get_supported_feature_word() forward declaration
  i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()
  i386: move hyperv_interface_id initialization to x86_cpu_realizefn()
  i386: move hyperv_version_id initialization to x86_cpu_realizefn()
  i386: move hyperv_limits initialization to x86_cpu_realizefn()
  i386: fill in FEAT_HYPERV_EDX from edx instead of eax
  i386: invert hyperv_spinlock_attempts setting logic with
    hv_passthrough
  i386: add reserved FEAT_HYPERV_ECX CPUID leaf
  i386: add reserved FEAT_HV_RECOMM_ECX/FEAT_HV_RECOMM_EDX CPUID leaves
  i386: add reserved FEAT_HV_NESTED_EBX/ECX/EDX CPUID leaves
  i386: always fill Hyper-V CPUID feature leaves from X86CPU data
  i386: split hyperv_handle_properties() into
    hyperv_expand_features()/hyperv_fill_cpuids()
  i386: move eVMCS enablement to hyperv_init_vcpu()
  i386: switch hyperv_expand_features() to using error_setg()
  i386: make hyperv_expand_features() return void
  i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size
  i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one
  i386: prepare hyperv_expand_features() to be called at CPU feature
    expansion time
  i386: use global kvm_state in hyperv_enabled() check
  i386: record if Hyper-V features were already expanded
  i386: expand Hyper-V features early

 include/standard-headers/drm/drm_fourcc.h     | 140 +++++++
 include/standard-headers/linux/ethtool.h      |  87 +++++
 .../linux/input-event-codes.h                 |   3 +-
 linux-headers/asm-generic/unistd.h            |   6 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/kvm.h               |   5 +
 linux-headers/asm-powerpc/mman.h              |   2 +-
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/kvm.h                  |   7 +-
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |   7 +-
 linux-headers/linux/vfio.h                    |   2 +-
 target/i386/cpu.c                             |  78 +++-
 target/i386/cpu.h                             |  13 +-
 target/i386/kvm.c                             | 347 ++++++++++++------
 target/i386/kvm_i386.h                        |   7 +
 23 files changed, 579 insertions(+), 135 deletions(-)

-- 
2.25.4


