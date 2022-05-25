Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155BD533C53
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:12:24 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpru-00064P-QO
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgC-0004sC-D6
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpg9-0000jK-M7
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kdJwNu80Yun4pZzoPWq/lMDFmMdbsQIu3H5jWoK0WwE=;
 b=EAF6/kpjT1u+qsq2VfCG2ZidaDJPrMftPDx8DVUT4MLJ7j5J0ZOZMvFgcA4Q0F7hcjzajV
 sXTUvWaSFtmuY6RXn0NwOQklSCi7Z0IsqyMrVkmpiVCAcO+5o/s6Riu1kshZO9kEum780e
 TzYJA6AJ6eWAKC5KuvtDCSRrsuWGXwk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-tA_J4VxOP1aiUGNIui_-8g-1; Wed, 25 May 2022 07:59:51 -0400
X-MC-Unique: tA_J4VxOP1aiUGNIui_-8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C442185A79C
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B29140CFD0A;
 Wed, 25 May 2022 11:59:50 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 0/6] i386: Enable newly introduced KVM Hyper-V
 enlightenments
Date: Wed, 25 May 2022 13:59:43 +0200
Message-Id: <20220525115949.1294004-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes since v3:
- Rebase, resolve merge conflict with 73d24074078a ("hyperv: Add support to
  process syndbg commands")
- Include "i386: docs:  Convert hyperv.txt to rST" patch which was previously
  posted separately.

Original description:

This series enables four new KVM Hyper-V enlightenmtes:

'XMM fast hypercall input feature' is supported by KVM since v5.14,
it allows for faster Hyper-V hypercall processing.

'Enlightened MSR-Bitmap' is a new nested specific enlightenment speeds up
L2 vmexits by avoiding unnecessary updates to L2 MSR-Bitmap. KVM support
for the feature on Intel CPUs is in v5.17 and in  5.18 for AMD CPUs.

'Extended GVA ranges for TLB flush hypercalls' indicates that extended GVA
ranges are allowed to be passed to Hyper-V TLB flush hypercalls.

'Direct TLB flush hypercall' features allows L0 (KVM) to directly handle 
L2's TLB flush hypercalls without the need to exit to L1 (Hyper-V).

The last two features are not merged in KVM yet:
https://lore.kernel.org/kvm/20220525090133.1264239-1-vkuznets@redhat.com/
however, there's no direct dependency on the kernel part as thanks to
KVM_GET_SUPPORTED_HV_CPUID no new capabilities are introduced.

Vitaly Kuznetsov (6):
  i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
  i386: Hyper-V Enlightened MSR bitmap feature
  i386: Hyper-V XMM fast hypercall input feature
  i386: Hyper-V Support extended GVA ranges for TLB flush hypercalls
  i386: Hyper-V Direct TLB flush hypercall
  i386: docs:  Convert hyperv.txt to rST

 docs/hyperv.txt                | 270 -------------------------------
 docs/system/i386/hyperv.rst    | 288 +++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst    |   1 +
 target/i386/cpu.c              |   8 +
 target/i386/cpu.h              |   5 +-
 target/i386/kvm/hyperv-proto.h |   9 +-
 target/i386/kvm/kvm.c          |  55 +++++--
 7 files changed, 354 insertions(+), 282 deletions(-)
 delete mode 100644 docs/hyperv.txt
 create mode 100644 docs/system/i386/hyperv.rst

-- 
2.35.3


