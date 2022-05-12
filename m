Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B08524DFC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 15:14:15 +0200 (CEST)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8dy-0004UW-Is
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 09:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1np8bp-0001do-1s
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:12:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1np8bm-0004mH-D6
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652361116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6ZUtkKT1gSa7cSHlEzhqRgqVdUguIg1mvdLamXJLJ1g=;
 b=iwRCTy8DWetiw2FSeumovSJAYXqWqNtuqDfmcEAkhDTCX2ErrLbPOSIaV2Yda2ML1vXmIn
 0pEYJ/KOvngQ5+8B5jIR5z7jXPoW1m6kXcwX65OyTgw4wsPnubL959X3+U4D1uSfMhIw+h
 3u/aMgHPrFSjd4NfDPeFqfASOnUY1sc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-Ex3kEOImN-OAAexJZa3SSw-1; Thu, 12 May 2022 09:11:53 -0400
X-MC-Unique: Ex3kEOImN-OAAexJZa3SSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477521C08968;
 Thu, 12 May 2022 13:11:53 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1A37AF2;
 Thu, 12 May 2022 13:11:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
Date: Thu, 12 May 2022 15:11:44 +0200
Message-Id: <20220512131146.78457-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enables MTE for kvm guests, if the kernel supports it.
Lightly tested while running under the simulator (the arm64/mte/
kselftests pass... if you wait patiently :)

A new cpu property "mte" (defaulting to on if possible) is introduced;
for tcg, you still need to enable mte at the machine as well.

I've hacked up some very basic qtests; not entirely sure if I'm going
about it the right way.

Some things to look out for:
- Migration is not (yet) supported. I added a migration blocker if we
  enable mte in the kvm case. AFAIK, there isn't any hardware available
  yet that allows mte + kvm to be used (I think the latest Gravitons
  implement mte, but no bare metal instances seem to be available), so
  that should not have any impact on real world usage.
- I'm not at all sure about the interaction between the virt machine 'mte'
  prop and the cpu 'mte' prop. To keep things working with tcg as before,
  a not-specified mte for the cpu should simply give us a guest without
  mte if it wasn't specified for the machine. However, mte on the cpu
  without mte on the machine should probably generate an error, but I'm not
  sure how to detect that without breaking the silent downgrade to preserve
  existing behaviour.
- As I'm still new to arm, please don't assume that I know what I'm doing :)


Cornelia Huck (2):
  arm/kvm: enable MTE if available
  qtests/arm: add some mte tests

 target/arm/cpu.c               | 18 +++-----
 target/arm/cpu.h               |  4 ++
 target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c             |  5 +++
 target/arm/kvm_arm.h           | 12 ++++++
 target/arm/monitor.c           |  1 +
 tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
 7 files changed, 137 insertions(+), 12 deletions(-)

-- 
2.34.3


