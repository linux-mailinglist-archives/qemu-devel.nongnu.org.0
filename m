Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D94CAC85
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:52:34 +0100 (CET)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPT9O-00007w-02
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT70-0005r1-Ia
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT6y-0008B1-Rd
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oh5uKooIwZDpg/vStznMUnlZRgtm/pLwZuqMCZbKJ9c=;
 b=TvW2+NFxmBurGSX9RibZVGgIyEBtlwiFpH02l/HwEfFq5tV1HEmJ9v+dzNNV2qCIry4FXO
 qiW4mJH3c3hqPJeEWslzJyfpZt3cVsOE4nwj50iY3mk1b0J43AyfwMME/Sr0T2Y/HCHKKj
 GQyT26lMTGnFy0bCgozWpDMkUTamoeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-zzuZDcFWNZyGcIkDrqyxQA-1; Wed, 02 Mar 2022 12:49:58 -0500
X-MC-Unique: zzuZDcFWNZyGcIkDrqyxQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80271801AFE
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:49:57 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 282188001D;
 Wed,  2 Mar 2022 17:49:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] tests: introduce testing coverage for TLS with migration
Date: Wed,  2 Mar 2022 17:49:14 +0000
Message-Id: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Daniel P. Berrang=C3=A9 (18):=0D
  tests: fix encoding of IP addresses in x509 certs=0D
  tests: improve error message when saving TLS PSK file fails=0D
  tests: support QTEST_TRACE env variable=0D
  tests: print newline after QMP response in qtest logs=0D
  tests: add more helper macros for creating TLS x509 certs=0D
  crypto: mandate a hostname when checking x509 creds on a client=0D
  migration: fix use of TLS PSK credentials with a UNIX socket=0D
  tests: merge code for UNIX and TCP migration pre-copy tests=0D
  tests: introduce ability to provide hooks for migration precopy test=0D
  tests: switch migration FD passing test to use common precopy helper=0D
  tests: expand the migration precopy helper to support failures=0D
  tests: add migration tests of TLS with PSK credentials=0D
  tests: add migration tests of TLS with x509 credentials=0D
  tests: convert XBZRLE migration test to use common helper=0D
  tests: convert multifd migration tests to use common helper=0D
  tests: add multifd migration tests of TLS with PSK credentials=0D
  tests: add multifd migration tests of TLS with x509 credentials=0D
  tests: ensure migration status isn't reported as failed=0D
=0D
 crypto/tlssession.c                  |    6 +=0D
 meson.build                          |    1 +=0D
 migration/tls.c                      |    4 -=0D
 tests/qtest/libqtest.c               |   11 +-=0D
 tests/qtest/meson.build              |   12 +-=0D
 tests/qtest/migration-helpers.c      |   13 +=0D
 tests/qtest/migration-helpers.h      |    1 +=0D
 tests/qtest/migration-test.c         | 1041 +++++++++++++++++++++-----=0D
 tests/unit/crypto-tls-psk-helpers.c  |   20 +-=0D
 tests/unit/crypto-tls-psk-helpers.h  |    1 +=0D
 tests/unit/crypto-tls-x509-helpers.c |   16 +-=0D
 tests/unit/crypto-tls-x509-helpers.h |   53 ++=0D
 tests/unit/test-crypto-tlssession.c  |   11 +-=0D
 13 files changed, 1004 insertions(+), 186 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


