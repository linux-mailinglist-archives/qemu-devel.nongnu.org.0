Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EAD690D42
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ92f-0004fJ-0E; Thu, 09 Feb 2023 10:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ92S-0004bl-Kx
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:40:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQ92P-0003Qt-JP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675957241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pvl+mcpOV/Gl+4qDQAZolIcs/nhvzyHWGKxCHsJ5P2Y=;
 b=eoGlfPP9MsHr8DmNqUTMZDT7LlYS5LhlaNHshwtx+EBARvQk9ZIiKborjWXRs0tbY75/7J
 JzsIyg1v9c/LRdGvtXJ+UiNfvoV9VNNmfn5QnosciDndpR4//rICAHLfEkcJtO6ptePbFt
 t8FQIHv7HhlB7nXGJjn1xryTKqRZJCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-DEetEo09M4eUiqebMsKLIQ-1; Thu, 09 Feb 2023 10:40:37 -0500
X-MC-Unique: DEetEo09M4eUiqebMsKLIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9369D800050;
 Thu,  9 Feb 2023 15:40:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03540492C3E;
 Thu,  9 Feb 2023 15:40:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/7] Python: Drop support for Python 3.6
Date: Thu,  9 Feb 2023 10:40:27 -0500
Message-Id: <20230209154034.983044-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Howdy, this series increases our minimum python version to 3.7.=0D
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/771780626=0D
    (All green!)=0D
GL: https://gitlab.com/jsnow/qemu/-/commits/python-require-37=0D
=0D
Patches 1 and 2 are loose pre-requisites; I'd like to merge them into=0D
qemu.git within the week whether or not we take this series. I'd=0D
appreciate an "ACK" on those specifically. They're just riding along=0D
here because they make this series a bit nicer.=0D
=0D
Patches 3-6 are the hard pre-requisites, and 7 does the dirty work.=0D
=0D
The motivation for this series is that Python 3.6 was EOL at the end of=0D
2021; upstream tools are beginning to drop support for it, including=0D
setuptools, pylint, mypy, etc. As time goes by, it becomes more=0D
difficult to support and test against the full range of Python versions=0D
that QEMU supports. The closer we get to Python 3.12, the harder it will=0D
be to cover that full spread of versions.=0D
=0D
The qemu.qmp library and the avocado testing framework both have=0D
motivations for dropping 3.6 support, but are committed to not doing so=0D
until QEMU drops support.=0D
=0D
So, I'd like to talk about doing it.=0D
=0D
RFC:=0D
 - Patch 5 is just a proof-of-concept; it's not admissable as-is and I=0D
   am aware of that.=0D
 - Cleber, I need to update your ansible scripts. How do I test them?=0D
 - Are we testing on CentOS 9 Stream yet? If so, we can move doc=0D
   building from CentOS 8 to CentOS 9 to maintain that coverage.=0D
   (See patch 6 for details.)=0D
=0D
Thanks!=0D
--js=0D
=0D
John Snow (7):=0D
  python: support pylint 2.16=0D
  Python: drop pipenv=0D
  configure: Look for auxiliary Python installations=0D
  configure: Add nice hint to Python failure message=0D
  testing: Add Python >=3D 3.7 to Centos, OpenSuSE=0D
  CI: Stop building docs on centos8=0D
  Python: Drop support for Python 3.6=0D
=0D
 docs/conf.py                                  |   4 +-=0D
 python/README.rst                             |   3 -=0D
 configure                                     |  40 +-=0D
 .gitlab-ci.d/buildtest.yml                    |   2 +-=0D
 .gitlab-ci.d/static_checks.yml                |   4 +-=0D
 python/.gitignore                             |   4 +-=0D
 python/Makefile                               |  57 ++-=0D
 python/Pipfile                                |  13 -=0D
 python/Pipfile.lock                           | 347 ------------------=0D
 python/qemu/qmp/protocol.py                   |   2 +-=0D
 python/qemu/qmp/qmp_client.py                 |   2 +-=0D
 python/qemu/utils/qemu_ga_client.py           |   6 +-=0D
 python/setup.cfg                              |  11 +-=0D
 python/tests/minreqs.txt                      |  45 +++=0D
 scripts/qapi/mypy.ini                         |   2 +-=0D
 tests/docker/dockerfiles/centos8.docker       |   1 +=0D
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +=0D
 tests/docker/dockerfiles/python.docker        |   1 -=0D
 tests/qemu-iotests/iotests.py                 |   4 +-=0D
 .../tests/migrate-bitmaps-postcopy-test       |   2 +-=0D
 20 files changed, 135 insertions(+), 416 deletions(-)=0D
 delete mode 100644 python/Pipfile=0D
 delete mode 100644 python/Pipfile.lock=0D
 create mode 100644 python/tests/minreqs.txt=0D
=0D
-- =0D
2.39.0=0D
=0D


