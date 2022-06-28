Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CA55C076
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:57:34 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68uT-000348-6e
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rj-00009N-8Y
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rf-0006So-Ft
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A8v3O8/SD+OSigI0RBpNe4GQHEn7ab5QbCDgts5zZsE=;
 b=CdIoeOeAWnMcMziQRbV843dutu6OgzqwwNtn3K6nlg4EIF7xwRVhe2qoWa5K2i6REampfW
 zB81IQoCAF/Ghm9eTD1VaR2mm/hdvb/bPbvtqUgI76g90M79m3JHtqkTWiXAUmCq0eLFkT
 Hiz2KltAOMFlHYciMGXYaVY1r75dwVM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-GA94yVz_PjCPHF59MTpSLA-1; Tue, 28 Jun 2022 06:54:37 -0400
X-MC-Unique: GA94yVz_PjCPHF59MTpSLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2376B3C0F374;
 Tue, 28 Jun 2022 10:54:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4F39112131B;
 Tue, 28 Jun 2022 10:54:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/5] tests: improve reliability of migration test
Date: Tue, 28 Jun 2022 11:54:29 +0100
Message-Id: <20220628105434.295905-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Since the TLS tests were added a few people have reported seeing
hangs in some of the TLS test cases for migration. Debugging
has revealed that in all cases the test was waiting for a STOP
event that never arrived.

The problem is that TLS performance is highly dependant on the
crypto impl. Some people have been running tests on machines
which are highly efficient at running the guest dirtying workload
but relatively slow at TLS. This has prevented convergance from
being reliably achieved in the configured max downtime.

Since this test design has been long standing I suspect the
lack of convergance is a likely cause of previous hangs we've
seen in various scenarios that resulted in us disabling the test
on s390 TCG, ppc TCG and ppc KVM-PR.

Thus I have suggested we drop this skip conditions, though I would
note that I've not had the ability to actually test the effect that
this has. 

Daniel P. Berrangé (5):
  tests: wait max 120 seconds for migration test status changes
  tests: wait for migration completion before looking for STOP event
  tests: increase migration test converge downtime to 30 seconds
  tests: use consistent bandwidth/downtime limits in migration tests
  tests: stop skipping migration test on s390x/ppc64

 tests/qtest/migration-helpers.c | 14 ++++++
 tests/qtest/migration-test.c    | 80 ++++++++++-----------------------
 2 files changed, 38 insertions(+), 56 deletions(-)

-- 
2.36.1


