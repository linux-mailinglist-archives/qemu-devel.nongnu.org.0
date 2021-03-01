Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB432800B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:53:02 +0100 (CET)
Received: from localhost ([::1]:39044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiyr-0007hW-5e
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix6-0006Ju-LU
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGix4-00089Z-TT
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iP5lgEpyNdwYtc6WjmOFjCLil9lqVbdp418Dx+Qs8aI=;
 b=gLWKcz24Tm3LP7Z4Z9uEQ+U0IicJtKuGP03HEPfPmgTx7+kiEvdFxViIZyNgsEU3zOMAOV
 CBfzT2umHNIWWLB9RNlMzpU4OBn9oxz47GixmbBy/1LYWcf4FYrf1vax7JIz93lWG1lm+d
 ls8fiqXOUUMWtG7Jo7FuAK03uycBoQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-BumbC1B5O32T1Pf9hau4OA-1; Mon, 01 Mar 2021 08:51:07 -0500
X-MC-Unique: BumbC1B5O32T1Pf9hau4OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3789802B45
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:06 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1030D5D71F;
 Mon,  1 Mar 2021 13:51:04 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/17] i386: KVM: expand Hyper-V features early and provide
 simple 'hv-default=on' option
Date: Mon,  1 Mar 2021 14:50:46 +0100
Message-Id: <20210301135103.306003-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Changes since v4:
- Temporary drop 'hv-evmcs' from the 'hv-default' set as handling it
 properly requires custom options parsers (we need to e.g distinguish
 between 'hv-default,-vmx' and 'hv-default,hv-evmcs,-vmx') but custom
 parsers are called evil. I'm not giving up on the idea, I just want
 to get things moving here. I'll be sending patches to add 'hv-evmcs'
 back separately.
- Patch to support 'hv-passthrough,hv-feature=off' is also dropped
 for now, we'll get back to it later (with either custom option
 parsers or 'scratch CPUs' depending on 'hv-evmcs' discussion 
 outcome).
- Null-terminate hv-vendor string in 'hv-passthrough' mode (bug in
  PATCH1).

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

In addition, provide a simple 'hv-default' option which enables (and
requires from KVM) all currently supported Hyper-V enlightenments except
for 'hv-evmcs' (for now). Unlike 'hv-passthrough' mode, this is going to be
migratable.

Vitaly Kuznetsov (17):
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

 MAINTAINERS                |   1 +
 docs/hyperv.txt            |  18 +-
 target/i386/cpu.c          | 163 +++++-------
 target/i386/cpu.h          |   9 +-
 target/i386/kvm/kvm-stub.c |   5 +
 target/i386/kvm/kvm.c      | 517 ++++++++++++++++++++-----------------
 target/i386/kvm/kvm_i386.h |   1 +
 tests/qtest/hyperv-test.c  | 270 +++++++++++++++++++
 tests/qtest/meson.build    |   3 +-
 9 files changed, 645 insertions(+), 342 deletions(-)
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.29.2


