Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F183684A3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:17:12 +0200 (CEST)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZc0t-0006rf-DP
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvd-0003LP-Py
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvb-0002yT-1W
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QA8vlb4xb/xdDpWT2muKiZ2VzjYujwjSivpwvDBbXek=;
 b=Osx6lXwn2VxpyQGx6CUggDSHmz4hwSTZWrBxyQGnsJj13HS6MCCl2xC5w4z1Wpsq81ml5k
 azgSpveErIdGtoHKPuFoaSUYkzBCEP9pvmEifNS3IrPlH9892h3Z2CbJxnEHKFFeLdSZBE
 2e3b3ThikvaA28HMob8aJSQnYJ4Id+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-TUpySTYjOpieW04Zv1chHA-1; Thu, 22 Apr 2021 12:11:37 -0400
X-MC-Unique: TUpySTYjOpieW04Zv1chHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92AA6814336
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:11:36 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC8D02BFE7;
 Thu, 22 Apr 2021 16:11:31 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/19] i386: KVM: expand Hyper-V features early
Date: Thu, 22 Apr 2021 18:11:11 +0200
Message-Id: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Changes since v5:
- Temporary drop 'hv-default' feature as it is causing some controversy.
 The rest of the patchset is valuable on its own.
- Add 3 additiona fixes:
 i386: kill off hv_cpuid_check_and_set() [Igor's suggestion]
 i386: HV_HYPERCALL_AVAILABLE privilege bit is always needed
 i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS priviliges

The last two patches are inspired by 'Fine-grained access check to Hyper-V
hypercalls and MSRs' work for KVM:
https://lore.kernel.org/kvm/20210419160127.192712-1-vkuznets@redhat.com/

Original description:

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

Vitaly Kuznetsov (19):
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
  i386: kill off hv_cpuid_check_and_set()
  i386: HV_HYPERCALL_AVAILABLE privilege bit is always needed
  i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS priviliges
  qtest/hyperv: Introduce a simple hyper-v test

 MAINTAINERS                    |   1 +
 target/i386/cpu.c              | 113 +-------
 target/i386/cpu.h              |   6 +-
 target/i386/kvm/hyperv-proto.h |   6 +
 target/i386/kvm/kvm-stub.c     |   5 +
 target/i386/kvm/kvm.c          | 514 +++++++++++++++++----------------
 target/i386/kvm/kvm_i386.h     |   1 +
 tests/qtest/hyperv-test.c      | 225 +++++++++++++++
 tests/qtest/meson.build        |   3 +-
 9 files changed, 526 insertions(+), 348 deletions(-)
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.30.2


