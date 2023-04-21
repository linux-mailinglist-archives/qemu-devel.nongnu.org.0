Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B56EB05F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:16:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuLc-0004Bg-Rw; Fri, 21 Apr 2023 13:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLW-000496-VH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:14:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLL-0008F5-T2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682097277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+NiFH0+mfBubvQ0cDBRcC1ezUPiTwttdCTy/N80ny3g=;
 b=VdL7sPQTuY/LyWtjo8UPVVLdLeYAEix8IPeprbZK6GZXRpKaUlhnT+A7U9OxB7oFSBzRGp
 LtCdfvSfeIMpGhSPK/H+SJBA/+9i5cXEJ1QGEgYYXwZgR3Dofc0dQSQiIxkJe0EYqzVA54
 CbiCmJoiXcgMmdQGFOU0R8naPzIlfBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-mMVdd-TEM7qZs6bzqik8ag-1; Fri, 21 Apr 2023 13:14:33 -0400
X-MC-Unique: mMVdd-TEM7qZs6bzqik8ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45AA485A5B1;
 Fri, 21 Apr 2023 17:14:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8524E492C13;
 Fri, 21 Apr 2023 17:14:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/6] tests/qtest: make migration-test massively faster
Date: Fri, 21 Apr 2023 18:14:05 +0100
Message-Id: <20230421171411.566300-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This makes migration-test faster by observing that most of the pre-copy
tests don't need to be doing a live migration. They get sufficient code
coverage with the guest CPUs paused.

On my machine this cuts the overall execution time of migration-test
by 50% from 15 minutes, down to 8 minutes, without sacrificing any
noticeable code coverage.

This is still quite slow though.

The tests which do still run in live mode all want to guarantee there
are at least 2 iterations of migration, to exercise the dirty page
handling code. This is achieved by running the 1 iteration with an
incredibly small bandwidth and max downtime to prevent convergance,
and watching query-migrate for the reported iteration to increment.
This guarantees that all the tests take at least 30 seconds to run.

Watching for the iteration counter to flip is inefficient and not
actually needed. Instead we merely need to prove that some amount
of already transferred data has been made dirty again. This in turn
will guarantee that a further iteration is required beyond the current
one. This proof is easy to achieve by monitoring the values at two
distinct addresses in guest RAM, and can cut the 30 second duration
down to 1 second.

After this optimization, and Juan's patch to disable autoconverge
testnig, the migration test runs in merely 1 minute which I think
it pretty impressive given the number of scenarios we're testing.

Daniel P. Berrangé (5):
  tests/qtest: replace qmp_discard_response with
    qtest_qmp_assert_success
  tests/qtests: remove migration test iterations config
  tests/qtest: capture RESUME events during migration
  tests/qtest: make more migration pre-copy scenarios run non-live
  tests/qtest: massively speed up migration-tet

Juan Quintela (1):
  tests/migration: Only run auto_converge in slow mode

 tests/qtest/ahci-test.c              |  31 ++--
 tests/qtest/boot-order-test.c        |   5 +-
 tests/qtest/fdc-test.c               |  15 +-
 tests/qtest/ide-test.c               |   5 +-
 tests/qtest/migration-helpers.c      |  12 +-
 tests/qtest/migration-helpers.h      |   1 +
 tests/qtest/migration-test.c         | 252 +++++++++++++++++++--------
 tests/qtest/test-filter-mirror.c     |   5 +-
 tests/qtest/test-filter-redirector.c |   7 +-
 tests/qtest/virtio-blk-test.c        |  24 +--
 10 files changed, 227 insertions(+), 130 deletions(-)

-- 
2.40.0


