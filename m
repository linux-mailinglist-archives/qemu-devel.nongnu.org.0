Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6C4D5032
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:25:48 +0100 (CET)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMXr-00071w-OL
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRP-0002kI-Nj
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRO-0003d9-3o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RKa/qGsImAuty9E4jdVgSZlJj516hyHOKd60djCm2pM=;
 b=GaaSKu/JpH9Xc7dv4EISw0lb017mu8+g12grmNOvTD999xIODrCen5Q33IOJ7+W8BbRNkI
 6X6SC1yT6DfCVVI1vEolv+8DXqJQ/jBTjF0M4I+PUEeBYGYY6Ity7ZBXq134SVhXa5C71y
 1x/sAVSNNCPvMgEn5KCkofXx/yD/EV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-82smAAD5PAS-932faom15Q-1; Thu, 10 Mar 2022 12:18:38 -0500
X-MC-Unique: 82smAAD5PAS-932faom15Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 602A2801AFE
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:18:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24EB4101E692;
 Thu, 10 Mar 2022 17:18:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/18] tests: introduce testing coverage for TLS with
 migration
Date: Thu, 10 Mar 2022 17:18:03 +0000
Message-Id: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
There is one functional bugfix in patch 6, I would like to see=0D
in 7.0. The rest is all test suite additions, and I don't mind=0D
if they are in 7.0 or 7.1=0D
=0D
Changed in v2:=0D
=0D
  - Use structs to pass around most parameters=0D
  - Hide expected errors from stderr=0D
=0D
Daniel P. Berrang=C3=A9 (18):=0D
  tests: fix encoding of IP addresses in x509 certs=0D
  tests: improve error message when saving TLS PSK file fails=0D
  tests: support QTEST_TRACE env variable=0D
  tests: print newline after QMP response in qtest logs=0D
  tests: add more helper macros for creating TLS x509 certs=0D
  migration: fix use of TLS PSK credentials with a UNIX socket=0D
  tests: switch MigrateStart struct to be stack allocated=0D
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
 meson.build                          |    1 +=0D
 migration/tls.c                      |    4 -=0D
 tests/qtest/libqtest.c               |   13 +-=0D
 tests/qtest/meson.build              |   12 +-=0D
 tests/qtest/migration-helpers.c      |   13 +=0D
 tests/qtest/migration-helpers.h      |    1 +=0D
 tests/qtest/migration-test.c         | 1208 +++++++++++++++++++++-----=0D
 tests/unit/crypto-tls-psk-helpers.c  |   20 +-=0D
 tests/unit/crypto-tls-psk-helpers.h  |    1 +=0D
 tests/unit/crypto-tls-x509-helpers.c |   16 +-=0D
 tests/unit/crypto-tls-x509-helpers.h |   53 ++=0D
 tests/unit/test-crypto-tlssession.c  |   11 +-=0D
 12 files changed, 1096 insertions(+), 257 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


