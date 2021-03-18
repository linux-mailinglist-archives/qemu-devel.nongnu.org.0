Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCD3409EC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:19:34 +0100 (CET)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvMz-0007DO-3P
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv72-00010D-VF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lMv6y-0001pz-HX
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616083378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SvJqYV1Xl2HOeByYf3vjUsbnlZAlysX7GX5MxlPbtxM=;
 b=aHbw3e+xCzdl/txOozRvB9OEVMsN6me/f6G/RIaGA6RE8hkxk1ZGWH31nC6SF5WeuYvZJ4
 tBK4+r8xI/+ZjbDxOAJpKoNaHaLnMPZwPfcp6B+MeWyt+4XTV9K9Fw+Bets7o7vq8bNe1z
 BsKuiydByNTDMtuHkOoTin2Zx1H4XQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-SYUnnT39M5S6s2eKaaAH5g-1; Thu, 18 Mar 2021 12:02:56 -0400
X-MC-Unique: SYUnnT39M5S6s2eKaaAH5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38D0101371D;
 Thu, 18 Mar 2021 16:02:54 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E721D10023B0;
 Thu, 18 Mar 2021 16:02:50 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] i386: Make sure TSC frequency is preserved across
 migration when Hyper-V reenlightenment is in use
Date: Thu, 18 Mar 2021 17:02:46 +0100
Message-Id: <20210318160249.1084178-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM doesn't fully support Hyper-V reenlightenment notifications on
migration. In particular, it doesn't support emulating TSC frequency
of the source host by trapping all TSC accesses so unless TSC scaling
is supported on the destination host and KVM_SET_TSC_KHZ succeeded, it
is unsafe to proceed with migration.

Vitaly Kuznetsov (3):
  i386: Make Hyper-V related sections KVM only
  i386: Fix 'hypercall_hypercall' typo
  i386: Make sure kvm_arch_set_tsc_khz() succeeds on migration when
    'hv-reenlightenment' was exposed

 target/i386/kvm/hyperv.h |  1 +
 target/i386/kvm/kvm.c    | 11 ++++++++++
 target/i386/machine.c    | 45 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 2 deletions(-)

-- 
2.30.2


