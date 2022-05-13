Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411745258DC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:09:14 +0200 (CEST)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIro-0001aR-Pc
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp0-0007FS-CK
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIoy-0007lH-0O
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bzaFeFhgNvdaN47XhMYIVZtyL4s+AzhpHn9PEgat/Bs=;
 b=CkacSpNOqTtejbXAq0CbF+MaUNCAJF8/HJs2eo4VrusFOv1RX/fMTQOMtpQRiLUOaiIGG6
 C9KrE+A6OV8BG9hjK3Pq92liwMO0AuySJ3vIPBWpBssDVSHi7weCpcoxh3bVloEcMDNITU
 1XwN1uIQ0FuwfEBfOhAMT+BhMqPx+xI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-UDpAa1JJPoG5Lk9xzrZp2A-1; Thu, 12 May 2022 20:06:13 -0400
X-MC-Unique: UDpAa1JJPoG5Lk9xzrZp2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3CD9811E75;
 Fri, 13 May 2022 00:06:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5673515230CE;
 Fri, 13 May 2022 00:06:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 0/9] tests: run python tests under the build/tests/venv
 environment
Date: Thu, 12 May 2022 20:06:00 -0400
Message-Id: <20220513000609.197906-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RFC: This is a very early, crude attempt at switching over to an=0D
external Python package dependency for QMP. This series does not=0D
actually make the switch in and of itself, but instead just switches to=0D
the paradigm of using a venv in general to install the QEMU python=0D
packages instead of using PYTHONPATH to load them from the source tree.=0D
=0D
(By installing the package, we can process dependencies.)=0D
=0D
I'm sending it to the list so I can show you some of what's ugly so far=0D
and my notes on how I might make it less ugly.=0D
=0D
(1) This doesn't trigger venv creation *from* iotests, it merely prints=0D
a friendly error message if "make check-venv" has not been run=0D
first. Not the greatest.=0D
=0D
(2) This isn't acceptable for SRPM builds, because it uses PyPI to fetch=0D
packages just-in-time. My thought is to use an environment variable like=0D
QEMU_CHECK_NO_INTERNET that changes the behavior of the venv setup=0D
process. We can use "--system-site-packages" as an argument to venv=0D
creation and "--no-index" as an argument to pip installation to achieve=0D
good behavior in SRPM building scenarios. It'd be up to the spec-writer=0D
to opt into that behavior.=0D
=0D
(3) Using one venv for *all* tests means that avocado comes as a pre-req=0D
for iotests -- which adds avocado as a BuildRequires for the Fedora=0D
SRPM. That's probably not ideal. It may be better to model the test venv=0D
as something that can be created in stages: the "core" venv first, and=0D
the avocado packages only when needed.=0D
=0D
You can see in these patches that I wasn't really sure how to tie the=0D
check-venv step as a dependency of 'check' or 'check-block', and it=0D
winds up feeling kind of hacky and fragile as a result.=0D
=0D
(Patches 6 and 7 feel particularly fishy.)=0D
=0D
What I think I would like to do is replace the makefile logic with a=0D
Python bootstrapping script. This will allow me to add in environment=0D
variable logic to accommodate #2 pretty easily. It will also allow=0D
iotests to call into the bootstrap script whenever it detects the venv=0D
isn't set up, which it needed to do anyway in order to print a=0D
user-friendly error message. Lastly, it will make it easier to create a=0D
"tiered" venv that layers in the avocado dependencies only as-needed,=0D
which avoids us having to bloat the SRPM build dependencies.=0D
=0D
In the end, I think that approach will:=0D
=0D
- Allow us to run iotests without having to run a manual prep step=0D
- Keep additional SRPM deps to a minimum=0D
- Keep makefile hacks to a minimum=0D
=0D
The only downside I am really frowning at is that I will have to=0D
replicate some "update the venv if it's outdated" logic that is usually=0D
handled by the Make system in the venv bootstrapper. Still, I think it's=0D
probably the only way to hit all of the requirements here without trying=0D
to concoct a fairly complex Makefile.=0D
=0D
any thoughts? If not, I'll just move on to trying to hack up that=0D
version next instead.=0D
=0D
--js=0D
=0D
John Snow (9):=0D
  python: update for mypy 0.950=0D
  tests: add "TESTS_PYTHON" variable to Makefile=0D
  tests: install "qemu" namespace package into venv=0D
  tests: silence pip upgrade warnings during venv creation=0D
  tests: use tests/venv to run basevm.py-based scripts=0D
  tests: add check-venv as a dependency of check and check-block=0D
  tests: add check-venv to build-tcg-disabled CI recipe=0D
  iotests: fix source directory location=0D
  iotests: use tests/venv for running tests=0D
=0D
 .gitlab-ci.d/buildtest.yml             |  1 +=0D
 python/qemu/qmp/util.py                |  4 +++-=0D
 python/setup.cfg                       |  1 +=0D
 tests/Makefile.include                 | 23 +++++++++++++++------=0D
 tests/avocado/avocado_qemu/__init__.py | 11 +++++-----=0D
 tests/avocado/virtio_check_params.py   |  1 -=0D
 tests/avocado/virtio_version.py        |  1 -=0D
 tests/qemu-iotests/testenv.py          | 28 +++++++++++++++++---------=0D
 tests/requirements.txt                 |  1 +=0D
 tests/vm/Makefile.include              | 13 ++++++------=0D
 tests/vm/basevm.py                     |  6 +++---=0D
 11 files changed, 57 insertions(+), 33 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D


