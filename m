Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E46F14BD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKpQ-0006Zx-Pl; Fri, 28 Apr 2023 05:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1psKpP-0006Zn-Mk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1psKpN-0001bw-E0
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682675744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beGSlsM1YO7VmD2gFWs75nRL02r/305Ahmeskyo8oHQ=;
 b=JARlis7gQgHgw2Xs3MflNpugynl5/34hjuv546z3B3UacaIG4MoAsSxbCbvhO7Ghd+vIfm
 BIUsHNPcSiR8gSgvCyBceLKAz9ONRXmhM4unN07O+F8SuuLA31K1Bi6UoItwArDtQo7a5B
 1vGwVPhZRPudCDikkDl8tMCUCJjIGNI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ZZNYkKpRNiuMLttegxqNmw-1; Fri, 28 Apr 2023 05:55:39 -0400
X-MC-Unique: ZZNYkKpRNiuMLttegxqNmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054CA1C0754D;
 Fri, 28 Apr 2023 09:55:39 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 178FB1121314;
 Fri, 28 Apr 2023 09:55:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 0/1] arm: enable MTE for QEMU + kvm
Date: Fri, 28 Apr 2023 11:55:32 +0200
Message-Id: <20230428095533.21747-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v7 takes a different approach to wiring up MTE, so I still include a cover
letter where I can explain things better, even though it is now only a
single patch :)

Previous versions used a cpu property to control MTE enablement, while
keeping the same semantics for the virt machine "mte" property as used with
tcg. This version now uses the machine property for kvm as well; while it
continues to control allocation of tag memory for tcg, it now also controls
enablement of the kvm capability. Since the cpu prop is now gone, so is the
testing via the arm cpu props test; I don't have a good idea for testing
mte on kvm automatically, since it has a hard dependency on host support.
(Should I tack some futher documentation somewhere? I'm not seeing an
obvious place.)

A kvm guest with mte enabled still cannot be migrated (we need some uffd
interface enhancements before we can support postcopy), so it is still off
per default.

Another open problem is mte vs mte3: tcg emulates mte3, kvm gives the guest
whatever the host supports. Without migration support, this is not too much
of a problem yet, but for compatibility handling, we'll need a way to keep
QEMU from handing out mte3 for guests that might be migrated to a mte3-less
host. We could tack this unto the mte property (specifying the version or
max supported), or we could handle this via cpu properties if we go with
handling compatibility via cpu models (sorting this out for kvm is probably
going to be interesting in general.) In any case, I think we'll need a way
to inform kvm of it.

Tested with kvm selftests on FVP (as I still don't have any hardware with
MTE...) and some make check(-tcg) incantations. Hopefully, I haven't (re)-
introduced too many issues.

Cornelia Huck (1):
  arm/kvm: add support for MTE

 hw/arm/virt.c        | 69 +++++++++++++++++++++++++-------------------
 target/arm/cpu.c     |  9 +++---
 target/arm/cpu.h     |  4 +++
 target/arm/kvm.c     | 35 ++++++++++++++++++++++
 target/arm/kvm64.c   |  5 ++++
 target/arm/kvm_arm.h | 19 ++++++++++++
 6 files changed, 107 insertions(+), 34 deletions(-)

-- 
2.40.0


