Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47546DF83E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:20:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbKX-0000i3-JI; Wed, 12 Apr 2023 10:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKT-0000gp-Jy
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKS-0006Ss-3V
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681309206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ep1rbYSEX7+TgzIA8xxo3M6V2tKFLc7Tg3+IFAZyZWk=;
 b=ePAVZcWAHeCRJuA1qaxdF4HODVw7O7T3D34eOxq67s8DR9H8An/trZbBPua89DUCG4p/AI
 dLf7vL0DMiUR26NZH7SOzIVCLIpowBZeL00ZUE8y2WjiaZurdB9rmO6cgT7X5uqLxWx/kk
 qDXbmn8HH0MW1xEil8j1FPOqig2C3bo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-Z5TzpQHFMoiX_AxUAD0fEQ-1; Wed, 12 Apr 2023 10:20:04 -0400
X-MC-Unique: Z5TzpQHFMoiX_AxUAD0fEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C866C855315
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:20:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F811121320;
 Wed, 12 Apr 2023 14:20:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/2] tests/migration: Fix migration-test slowdown
Date: Wed, 12 Apr 2023 16:19:59 +0200
Message-Id: <20230412142001.16501-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since commit:

commit 1bfc8dde505f1e6a92697c52aa9b09e81b54c78f
Author: Dr. David Alan Gilbert <dgilbert@redhat.com>
Date:   Mon Mar 6 15:26:12 2023 +0000

    tests/migration: Tweek auto converge limits check

    Thomas found an autoconverge test failure where the
    migration completed before the autoconverge had kicked in.
    [...]

migration-test has become very slow.
On my laptop, before that commit migration-test takes 2min10seconds
After that commit, it takes around 11minutes

We can't revert it because it fixes a real problem when the host
machine is overloaded.  See the comment on test_migrate_auto_converge().

So I did two things here:

- Once that we have setup up precopy, we can move to full speed, no
  need to continue at 3MB/s.  That slowed everything a lot.

- Only run auto_converge tests when we are asking for slow tests.

  Only that test on my hardware requires more than 1min to run.  We
  need to run it at 3MB/s, but we are asking it to do 15 iterations
  throgh 150MB of RAM.  We can have a test that is (reasonably) fast,
  or one that also works when machine is very loaded.

To test that things still works over load, I used my desktop (ancient
core i9900), and run migration-test in a loop in 20 terminals (load
was 40) and didn't see a single failure in more than 1 hour run.

Please, review.

PD.  Yes, I am still looking at the dreaded multifd_cancel test, but
even on this setup, I am unable to get a failure.  I have never seen a
failure on it when I am running it, but I am only running x86 kvm
linux.  Moving to arm or tcg and see how well that goes.

Juan Quintela (2):
  tests/migration: Make precopy fast
  tests/migration: Only run auto_converge in slow mode

 tests/qtest/migration-test.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

-- 
2.39.2


