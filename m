Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D139F627
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:14:05 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqacO-0004qP-6M
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaX3-0008Bf-PI
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqaWz-0001gI-Pt
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hb8QAjkh5o1RzMcGP6j5yB05IFwfE+1/S3tA2ZylhPw=;
 b=UDZaO8ApalkKauA+UYc/MWU1wa+exL5o2XInt19gby2iyxBiCuDHOHrZK8MEc9aBRPUQy9
 j/hpHz8nqqEyq2BzMzgMzX/NBLN9rxojcYMxVo5DbJxXiuMWn2lzM7w14TuG7YaxY0FNiH
 wFDuYkBx6nXxA3YmI98ZTNDm/Pj0It0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-0H7iZIzaPG2sbjljU6o_BA-1; Tue, 08 Jun 2021 08:08:24 -0400
X-MC-Unique: 0H7iZIzaPG2sbjljU6o_BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3D00180FD70;
 Tue,  8 Jun 2021 12:08:23 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFEC018B4B;
 Tue,  8 Jun 2021 12:08:18 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v8 0/9] i386: KVM: expand Hyper-V features early
Date: Tue,  8 Jun 2021 14:08:08 +0200
Message-Id: <20210608120817.1325125-1-vkuznets@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v7:
- Make eVMCS version check future proof [Eduardo]
- Collect R-b tags [Eduardo]
- Drop 'if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64"))' check from qtest
 [Eduardo]
- s/priviliges/privileges/ [Eric]

The last two functional patches are inspired by 'Fine-grained access check
to Hyper-V hypercalls and MSRs' work for KVM:
https://lore.kernel.org/kvm/20210521095204.2161214-1-vkuznets@redhat.com/

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

Vitaly Kuznetsov (9):
  i386: avoid hardcoding '12' as 'hyperv_vendor_id' length
  i386: clarify 'hv-passthrough' behavior
  i386: hardcode supported eVMCS version to '1'
  i386: make hyperv_expand_features() return bool
  i386: expand Hyper-V features during CPU feature expansion time
  i386: kill off hv_cpuid_check_and_set()
  i386: HV_HYPERCALL_AVAILABLE privilege bit is always needed
  i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS privileges
  qtest/hyperv: Introduce a simple hyper-v test

 MAINTAINERS                    |   1 +
 docs/hyperv.txt                |   9 +-
 target/i386/cpu.c              |  13 +-
 target/i386/kvm/hyperv-proto.h |   6 +
 target/i386/kvm/kvm-stub.c     |   5 +
 target/i386/kvm/kvm.c          | 189 +++++++++++++++-------------
 target/i386/kvm/kvm_i386.h     |   1 +
 tests/qtest/hyperv-test.c      | 221 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |   3 +-
 9 files changed, 357 insertions(+), 91 deletions(-)
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.31.1


