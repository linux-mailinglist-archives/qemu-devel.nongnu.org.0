Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AF39A016
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:50:12 +0200 (CEST)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lolrX-0007F6-L3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolqB-0004p4-IY
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lolq7-0001z5-9D
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622720921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2AGdJvGEqcx4YJKnKtUBp5Lgh4Y5g/1PX/ivAtDtjEk=;
 b=M3YH5e6czYQDz1LTO44+Vjh/cU/KTy8kuAB1SS6pEUw8V+sm4ce2LJo2FRpfmaE081pcor
 hiEPFXJrHEjvJ7aK6+qiMkGHesDbjDZGw9P6GMzmNVJG1WqdQCwWIlSQjyPvphH90TfbYk
 BmPIJ5//YKJCtNmThMxtJZKW5vdh2dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-1OF0BM96PtO3PwZ66dZTGg-1; Thu, 03 Jun 2021 07:48:39 -0400
X-MC-Unique: 1OF0BM96PtO3PwZ66dZTGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E209A101371C
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 11:48:38 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD0419704;
 Thu,  3 Jun 2021 11:48:36 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v7 0/9] i386: KVM: expand Hyper-V features early
Date: Thu,  3 Jun 2021 13:48:26 +0200
Message-Id: <20210603114835.847451-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v6 [Eduardo]:
- First 14 patches of v6 made it upstream!
- New patches addressing feedback on the already merged patches added:
  i386: make hyperv_expand_features() return bool
  i386: hardcode supported eVMCS version to '1'
  i386: clarify 'hv-passthrough' behavior
  i386: avoid hardcoding '12' as 'hyperv_vendor_id' length
- Some comments expanded.
- HV_HYPERCALL_AVAILABLE setting moved to hyperv_fill_cpuids()

Note: Windows guest on QEMU are currently completely broken, see Claudio's
https://lore.kernel.org/kvm/20210529091313.16708-1-cfontana@suse.de/

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
  i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS priviliges
  qtest/hyperv: Introduce a simple hyper-v test

 MAINTAINERS                    |   1 +
 docs/hyperv.txt                |   9 +-
 target/i386/cpu.c              |  13 +-
 target/i386/kvm/hyperv-proto.h |   6 +
 target/i386/kvm/kvm-stub.c     |   5 +
 target/i386/kvm/kvm.c          | 166 ++++++++++++------------
 target/i386/kvm/kvm_i386.h     |   1 +
 tests/qtest/hyperv-test.c      | 225 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |   3 +-
 9 files changed, 337 insertions(+), 92 deletions(-)
 create mode 100644 tests/qtest/hyperv-test.c

-- 
2.31.1


