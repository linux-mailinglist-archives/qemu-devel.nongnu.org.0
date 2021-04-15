Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A517936145F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 23:53:36 +0200 (CEST)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX9vb-0001K2-9J
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 17:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9u5-0008TA-6Y
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9u2-0001j1-Hi
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618523517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HX2Y4Cchvu61ADnwg90FzOyHqsaOBqKLkToY0HXaA3A=;
 b=MGcCG6VjVLlx90RH0tvLyOyM30LAWm7b9Oozq9g3vxtlSfxU2K+9I1QxwTHgr0GC9W4+pU
 zDPYNpNz1RzME4AqRoJpQSzUWkYvAoFs3kPlIEmMIcsMwolZVx9dNxnh6u7KKfnBjCj997
 CDh7oQoAMcXTtRbtQlZb4gV7ZKmUQgI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-KwZ3W8B-Mpe8s8QJxcmChQ-1; Thu, 15 Apr 2021 17:51:55 -0400
X-MC-Unique: KwZ3W8B-Mpe8s8QJxcmChQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A9B107ACC7;
 Thu, 15 Apr 2021 21:51:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 915AC5D9DE;
 Thu, 15 Apr 2021 21:51:42 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Tests: introduce custom jobs
Date: Thu, 15 Apr 2021 17:51:33 -0400
Message-Id: <20210415215141.1865467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Different users (or even companies) have different interests, and=0D
may want to run a reduced set of tests during development, or a=0D
larger set of tests during QE.=0D
=0D
To cover these use cases, this introduces some example (but=0D
functional) jobs.=0D
=0D
It's expected that some common jobs will come up from common=0D
requirements for different users (and maybe be added to a common=0D
location such as tests/jobs), and that very specific jobs will be=0D
added to directories specific to certain groups, say=0D
"contrib/com.redhat/jobs" or the like.=0D
=0D
This series does *not* add new jobs to GitLab CI pipeline, but this is=0D
expected to be done later on custom runners.  That is, custom runners=0D
could be used for custom jobs.  Anyway, a GitLab CI pipeline can be=0D
seen here:=0D
=0D
 https://gitlab.com/cleber.gnu/qemu/-/pipelines/287210066=0D
=0D
This is based on the Avocado version bump patch:=0D
=0D
 https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02391.html=0D
=0D
Based-On: <20210414161144.1598980-1-crosa@redhat.com>=0D
=0D
Cleber Rosa (8):=0D
  Acceptance Jobs: preserve the cache for pip on GitLab CI=0D
  Acceptance tests: do not try to reuse packages from the system=0D
  tests/acceptance/linux_ssh_mips_malta.py: drop identical setUp=0D
  tests/acceptance/migration.py: cancel test if migration is not=0D
    supported=0D
  tests/acceptance/cpu_queries.py: use the proper logging channels=0D
  Acceptance tests: prevent shutdown on non-specific target tests=0D
  tests/acceptance/migration.py: cancel test on s390x=0D
  Tests: add custom test jobs=0D
=0D
 .gitlab-ci.yml                           |  1 +=0D
 configure                                |  2 +-=0D
 tests/Makefile.include                   | 10 +++-=0D
 tests/acceptance/cpu_queries.py          |  4 +-=0D
 tests/acceptance/linux_ssh_mips_malta.py |  7 +--=0D
 tests/acceptance/migration.py            | 16 ++++--=0D
 tests/acceptance/version.py              |  2 +-=0D
 tests/jobs/acceptance-all-targets.py     | 67 ++++++++++++++++++++++++=0D
 tests/jobs/acceptance-kvm-only.py        | 35 +++++++++++++=0D
 tests/jobs/qtest-unit-acceptance.py      | 31 +++++++++++=0D
 tests/jobs/qtest-unit.py                 | 24 +++++++++=0D
 tests/jobs/utils.py                      | 22 ++++++++=0D
 12 files changed, 207 insertions(+), 14 deletions(-)=0D
 create mode 100644 tests/jobs/acceptance-all-targets.py=0D
 create mode 100644 tests/jobs/acceptance-kvm-only.py=0D
 create mode 100644 tests/jobs/qtest-unit-acceptance.py=0D
 create mode 100644 tests/jobs/qtest-unit.py=0D
 create mode 100644 tests/jobs/utils.py=0D
=0D
--=20=0D
2.25.4=0D
=0D


