Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024B56A80D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:28:21 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9UMW-0000KI-FY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o9UBo-0007yp-S2
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o9UBl-00079j-5e
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657210632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M6NGapFf616x3lfviLPQ8wkMqYW0tIq1LqqAGJqP98E=;
 b=IEID1ZJTKk3yffRlbnxerTwrKXTcwbgYqdx4vOWNlwkmuvs4hL/sxwoHC0rpgQULPtYC39
 WNPIO4C0xJyimigjVqQVCJdPUNQQ2VdqRorntzHjrmq9tP1ypjiGWnKiRwL33g+oddBC5B
 iTSqlcleznJkKIOdt1v+sEVZK6wJkmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-94AUJYg1PYS4INxmbSI57w-1; Thu, 07 Jul 2022 12:17:02 -0400
X-MC-Unique: 94AUJYg1PYS4INxmbSI57w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F36D31019C8E;
 Thu,  7 Jul 2022 16:17:01 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 661572166B26;
 Thu,  7 Jul 2022 16:17:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
Date: Thu,  7 Jul 2022 18:16:54 +0200
Message-Id: <20220707161656.41664-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes it possible to enable MTE for kvm guests, if the kernel
supports it. Again, tested on the simulator via patiently waiting for the
arm64/mte kselftests to finish successfully.

For tcg, turning on mte on the machine level (to get tag memory) stays a
requirement. If the new mte cpu feature is not explicitly specified, a tcg
vm will get mte depending on the presence of tag memory (just as today).

For kvm, mte stays off by default; this is because migration is not yet
supported (postcopy will need an extension of the kernel interface, possibly
an extension of the userfaultfd interface), and turning on mte will add a
migration blocker.

My biggest question going forward is actually concerning migration; I gather
that we should not bother adding something unless postcopy is working as well?
If I'm not misunderstanding things, we need a way to fault in a page together
with the tag; doing that in one go is probably the only way that we can be
sure that this is race-free on the QEMU side. Comments welcome :)

Changes v1->v2: [Thanks to Eric for the feedback!]
- add documentation
- switch the mte prop to OnOffAuto; this improves the interaction with the
  existing mte machine prop
- leave mte off for kvm by default
- improve tests; the poking in QDicts feels a bit ugly, but seems to work

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 +++++
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 132 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  77 ++++++++++++++++++
 9 files changed, 256 insertions(+), 12 deletions(-)

-- 
2.35.3


