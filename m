Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1A316B88
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:43:50 +0100 (CET)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9sai-0000OP-6U
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXr-00071W-5W
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sXn-0008Ih-9s
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7P3jr2Y1+ZuwQrtLR9Ghi9jHzK4zNyuZLxYcB8Xtszs=;
 b=P/lWafPi21OdI/TLossbPZXX3SPUs2sP17rOlWLcAJhGF0N+HtfRnsLaW9OZBpgX912m13
 Xgqy7AELF/FFfrTTveshdutbEQCUKiOiiophGdgbNOi0VmQFbiveNb/UsrnG7qVEaHuKkK
 U10mrpyfVIKYJIw+KhGWSkslGEFqknc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-7fnhBbMpMpCxe8BYp9hgmw-1; Wed, 10 Feb 2021 11:40:39 -0500
X-MC-Unique: 7fnhBbMpMpCxe8BYp9hgmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A7829126D
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:40:38 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3315D9E3;
 Wed, 10 Feb 2021 16:40:36 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 00/19] i386: KVM: expand Hyper-V features early and provide
 simple 'hv-default=on' option
Date: Wed, 10 Feb 2021 17:40:12 +0100
Message-Id: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v3:
- Make 'hv-default' override 'hv-*' options which were already set 
  (e.g. 'hv-feature=on,hv-default' case) [Igor]. Make 'hv-passthrough'
  behave the same way.
- Add "i386: be more picky about implicit 'hv-evmcs' enablement" patch to avoid
  enabling 'hv-evmcs' with hv-default/hv-passthrough when guest CPU lacks VMX.
- Add "i386: support 'hv-passthrough,hv-feature=off' on the command line" patch
  to make 'hv-passthrough' semantics match the newly introduced 'hv-default'.
- Add "i386: track explicit 'hv-*' features enablement/disablement" patch to
  support the above mentioned changes.
- Expand qtest to check the above mentioned improvements.

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
requires from KVM) all currently supported Hyper-V enlightenments.
Unlike 'hv-passthrough' mode, this is going to be migratable.

Vitaly Kuznetsov (21):
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
  i386: track explicit 'hv-*' features enablement/disablement
  i386: support 'hv-passthrough,hv-feature=off' on the command line
  i386: be more picky about implicit 'hv-evmcs' enablement
  i386: introduce kvm_hv_evmcs_available()
  i386: provide simple 'hv-default=on' option
  qtest/hyperv: Introduce a simple hyper-v test

 MAINTAINERS                |   1 +
 docs/hyperv.txt            |  16 +-
 target/i386/cpu.c          | 430 ++++++++++++++++++++---------
 target/i386/cpu.h          |  11 +-
 target/i386/kvm/kvm-stub.c |  10 +
 target/i386/kvm/kvm.c      | 535 +++++++++++++++++++++----------------
 target/i386/kvm/kvm_i386.h |   2 +
 tests/qtest/hyperv-test.c  | 312 +++++++++++++++++++++
 tests/qtest/meson.build    |   3 +-
 9 files changed, 950 insertions(+), 370 deletions(-)
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.29.2


