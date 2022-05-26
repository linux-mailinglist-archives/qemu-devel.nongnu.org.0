Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639D53475B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:13:00 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu17a-0006bi-VK
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14P-0003o3-61
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14K-0002iY-I8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NnDheIgdUHGXi9MYIaYSJHMLtIlFTeXBGxnHQc7O3xc=;
 b=hXq1FIW1dsD0ra8jXaFu7t4/lM67Pq3p9iF/Fpdp78l4DVG3IJD3nupDCCXHyOdbnVGqd/
 BBP2LKlgdzZ4pkk+IExtM5G6P/KlHbdHD7JzKAMV62KF+Mblld0LGzAdu0AyLePQabnMy9
 oxiKiv79Ws0uyi6Tp0pzxlojGmZ2jqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-BXXiWP8SNV-3aCkvcCmPSw-1; Wed, 25 May 2022 20:09:28 -0400
X-MC-Unique: BXXiWP8SNV-3aCkvcCmPSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C69A101A54E;
 Thu, 26 May 2022 00:09:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB13E2166B26;
 Thu, 26 May 2022 00:09:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 0/9] tests, python: prepare to expand usage of test venv
Date: Wed, 25 May 2022 20:09:12 -0400
Message-Id: <20220526000921.1581503-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/548326343=0D
=0D
This series collects some of the uncontroversial elements that serve as=0D
pre-requisites for a later series that seeks to generate a testing venv=0D
by default.=0D
=0D
This series makes the following material changes:=0D
=0D
- Install the 'qemu' package into the avocado testing venv=0D
- Use the avocado testing venv to run vm-tests=0D
- Use the avocado testing venv to run device-crash-test=0D
=0D
None of these changes impact 'make check'; these are all specialty=0D
tests that are not run by default. This series also doesn't change how=0D
iotests are run, doesn't add any new dependencies for SRPM builds, etc.=0D
=0D
NOTE: patch 8 isn't strictly required for this series, but including it=0D
here "early" helps the subsequent series. Since the debian docker files=0D
are layered, testing downstream pipelines can fail because the base=0D
image is pulled from the main QEMU repo instead of the downstream.=0D
=0D
In other words: I need this patch in origin/main in order to have the=0D
venv module available for later patches that will actually need it in=0D
our debian10 derivative images.=0D
=0D
(in other-other-words: the 'clang-user' test *will* need it later.)=0D
=0D
John Snow (9):=0D
  python: update for mypy 0.950=0D
  tests: add "TESTS_PYTHON" variable to Makefile=0D
  tests: use python3 as the python executable name=0D
  tests: silence pip upgrade warnings during venv creation=0D
  tests: add quiet-venv-pip macro=0D
  tests: install "qemu" namespace package into venv=0D
  tests: use tests/venv to run basevm.py-based scripts=0D
  tests: add python3-venv to debian10.docker=0D
  tests: run 'device-crash-test' from tests/venv=0D
=0D
 .gitlab-ci.d/buildtest.yml               |  8 +++++---=0D
 python/qemu/qmp/util.py                  |  4 +++-=0D
 python/setup.cfg                         |  1 +=0D
 scripts/device-crash-test                | 14 +++++++++++---=0D
 tests/Makefile.include                   | 18 ++++++++++--------=0D
 tests/avocado/avocado_qemu/__init__.py   | 11 +++++------=0D
 tests/avocado/virtio_check_params.py     |  1 -=0D
 tests/avocado/virtio_version.py          |  1 -=0D
 tests/docker/dockerfiles/debian10.docker |  1 +=0D
 tests/requirements.txt                   |  1 +=0D
 tests/vm/Makefile.include                | 13 +++++++------=0D
 tests/vm/basevm.py                       |  6 +++---=0D
 12 files changed, 47 insertions(+), 32 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D


