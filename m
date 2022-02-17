Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6064BA454
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:27:30 +0100 (CET)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKigq-0005GT-Ir
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:27:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nKhnC-0001PO-Tr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nKhn9-0000g3-T6
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645108194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JJAVPbAp2khIBPADSPe7iioP73WX6j2j6RgPpLWhidI=;
 b=PQc01Vz4D+hf/Ge6DuM+0yJsuqgLR0uP/47QKo8L/jFqAFU41XjnnV/OMzGE0LRjlwFUkP
 0UfbUQnjNzmBB2VDoLYYKgAFgF5RnYeKBvelFGC/hulP2IgxzruaeQKw9j+705ebkgQeOo
 qm8HLpaL1TpOwlFJemhxKA1we4adsLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-x42xkP0IO7yjREJUQ9qCnw-1; Thu, 17 Feb 2022 09:29:53 -0500
X-MC-Unique: x42xkP0IO7yjREJUQ9qCnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAEEB1006AA0
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:29:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.193.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFC8F7D71B;
 Thu, 17 Feb 2022 14:29:50 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] i386: Add support for Hyper-V Enlightened MSR-Bitmap
 and XMM fast hypercall input features
Date: Thu, 17 Feb 2022 15:29:46 +0100
Message-Id: <20220217142949.297454-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'XMM fast hypercall input feature' is supported by KVM since v5.14,
it allows for faster Hyper-V hypercall processing.

'Enlightened MSR-Bitmap' is a new nested specific enlightenment speeds up
L2 vmexits by avoiding unnecessary updates to L2 MSR-Bitmap. KVM support
for the feature on Intel CPUs is coming in v5.17 and is queued for 5.18 for
AMD CPUs.

Vitaly Kuznetsov (3):
  i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
  i386: Hyper-V Enlightened MSR bitmap feature
  i386: Hyper-V XMM fast hypercall input feature

 docs/hyperv.txt                | 16 +++++++++++++++
 target/i386/cpu.c              |  4 ++++
 target/i386/cpu.h              |  3 ++-
 target/i386/kvm/hyperv-proto.h |  7 ++++++-
 target/i386/kvm/kvm.c          | 37 ++++++++++++++++++++++++++--------
 5 files changed, 57 insertions(+), 10 deletions(-)

-- 
2.35.1


