Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40120510295
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:08:33 +0200 (CEST)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNjr-0002wS-Kp
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcW-00040D-Da
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njNcT-0007Pa-I1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650988852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uz0tWQt5fp4NQF5VyzJFYnW/pWkbY2gG5K3r+fKQunM=;
 b=QRVe2WdMhICJOejy6PaIzeiYLa2D8nV3k7lueI46mP7gK2GDfQiHWF9Bty7OXIrnoWTiMC
 57YmrNe3Ep96yy3bTHzs/Rk4BiAo0agHcgdQs6qr+305mWCZkaM+CujfO/a21ns81YkLcJ
 srhYpsN1nIZaHFtbmBVqJch+ngr87uI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-RCslbjwrMdKYKGW8trbaAA-1; Tue, 26 Apr 2022 12:00:50 -0400
X-MC-Unique: RCslbjwrMdKYKGW8trbaAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F90F3C0CD3F
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:00:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0755AC202C8;
 Tue, 26 Apr 2022 16:00:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] tests: introduce testing coverage for TLS with
 migration
Date: Tue, 26 Apr 2022 17:00:39 +0100
Message-Id: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This significantly expands the migration test suite to cover testing=0D
with TLS over TCP and UNIX sockets, with both PSK (pre shared keys)=0D
and x509 credentials, and for both single and multifd scenarios.=0D
=0D
It identified one bug in handling PSK credentials with UNIX sockets,=0D
but other than that everything was operating as expected.=0D
=0D
To minimize the impact on code duplication alopt of refactoring is=0D
done of the migration tests to introduce a common helper for running=0D
the migration process. The various tests mostly just have to provide=0D
a callback to set a few parameters/capabilities before migration=0D
starts, and sometimes a callback to cleanup or validate after=0D
completion/failure.=0D
=0D
Changed in v3:=0D
=0D
  - Trivial rebase dropping already merged patches=0D
=0D
Changed in v2:=0D
=0D
  - Use structs to pass around most parameters=0D
  - Hide expected errors from stderr=0D
=0D
Daniel P. Berrang=C3=A9 (9):=0D
  tests: fix encoding of IP addresses in x509 certs=0D
  tests: add more helper macros for creating TLS x509 certs=0D
  tests: add migration tests of TLS with PSK credentials=0D
  tests: add migration tests of TLS with x509 credentials=0D
  tests: convert XBZRLE migration test to use common helper=0D
  tests: convert multifd migration tests to use common helper=0D
  tests: add multifd migration tests of TLS with PSK credentials=0D
  tests: add multifd migration tests of TLS with x509 credentials=0D
  tests: ensure migration status isn't reported as failed=0D
=0D
 meson.build                          |   1 +=0D
 tests/qtest/meson.build              |  12 +-=0D
 tests/qtest/migration-helpers.c      |  13 +=0D
 tests/qtest/migration-helpers.h      |   1 +=0D
 tests/qtest/migration-test.c         | 866 ++++++++++++++++++++++++---=0D
 tests/unit/crypto-tls-psk-helpers.c  |  18 +-=0D
 tests/unit/crypto-tls-psk-helpers.h  |   1 +=0D
 tests/unit/crypto-tls-x509-helpers.c |  16 +-=0D
 tests/unit/crypto-tls-x509-helpers.h |  53 ++=0D
 tests/unit/test-crypto-tlssession.c  |  11 +-=0D
 10 files changed, 897 insertions(+), 95 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


