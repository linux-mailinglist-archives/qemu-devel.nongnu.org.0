Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15DD546FA1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:28:23 +0200 (CEST)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzn78-0002xT-6C
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn55-0000hu-SU
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzn51-0005Ty-HH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654899970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OvZABgfDUtEsp8SMpeNoLQ5bj/7jZoc/wuue4S0OVKs=;
 b=Me3CGjO8Uswwz7kL0Q8j6z5AWG37MJ7fPSmZojQ5MJl/WIRy38aM5gK3YCnQgCC/ECndUb
 Q5Ja/ixROxgZTj1il2IA/9IVSMyILjTzMvmavO0J4w2mia3XXQWDzU/PsOBGLepTgoYqUA
 RJz7e0mBUhia1MtkTo7Igc+tO/c4hzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-UVcR7w_cOAG-A3ytiT9Z3g-1; Fri, 10 Jun 2022 18:26:07 -0400
X-MC-Unique: UVcR7w_cOAG-A3ytiT9Z3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02C2285A581;
 Fri, 10 Jun 2022 22:26:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A6A04010E32;
 Fri, 10 Jun 2022 22:26:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v2 0/7] tests: run python tests under a venv
Date: Fri, 10 Jun 2022 18:25:58 -0400
Message-Id: <20220610222605.2259132-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi, here's another RFC for bringing external Python dependencies to the=0D
QEMU test suite.=0D
=0D
This patchset is not without some problems that need to be solved, but=0D
I've been sitting on these long enough and they need to see the light of=0D
day.=0D
=0D
Problems I am aware of, and there's a few:=0D
=0D
- Ubuntu 18.04 ships with a version of pip that is too old to support=0D
  setup.cfg-based installations. We are allowed to drop support for=0D
  18.04 by now, but we need a suitable 32bit debian VM configuration to=0D
  replace it.=0D
=0D
- Multiple VM tests are still failing for me; but they fail with or=0D
  without my patches as far as I can tell. I'm having problems with=0D
  Haiku and CentOS, primarily -- which I think fail even without my=0D
  patches. I'll have more info after the weekend, these tests are SLOW.=0D
=0D
- This version of the patch series does not itself enforce any=0D
  offline-only behavior for venv creation, but downstreams can modify=0D
  any call to 'mkvenv' to pass '--offline'. A more flexible approach=0D
  might be to allow an environment variable to be passed that toggles=0D
  the switch on.=0D
=0D
- iotests will now actually never run mypy or pylint tests by default=0D
  anymore, because the bootstrapper won't select those packages by=0D
  default, and the virtual environment won't utilize the system packages=0D
  -- so iotest 297 will just "skip" all of the time now.=0D
=0D
  The reason we don't want to install these packages by default is=0D
  because we don't want to add dependencies on mypy and pylint for=0D
  downstream builds.=0D
=0D
  With these patches, 297 would still work if you manually opened up the=0D
  testing venv and installed suitable mypy/pylint packages there. I=0D
  could also add a new optional dependency group, and one could=0D
  theoretically invoke a once-per-build-dir command of 'make=0D
  check-venv-pylint' to help make the process only semi-manual, but it's=0D
  still annoying.=0D
=0D
  Ideally, the python checks in qemu.git/python/ can handle the same=0D
  tests as 297 does -- but we need to give a shorthand invocation like=0D
  "make check-python" that is excluded from the default "make check" to=0D
  allow block developers to quickly opt-in to the same tests.=0D
=0D
  I've covered some of the problems here on-list before:=0D
  https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg03661.html=0D
=0D
  ...But I haven't quite solved them yet.=0D
=0D
That's all for now.=0D
=0D
Paolo, can we chat about build system integration next? I want to know=0D
how you envision the integration at this point -- adding different=0D
test-invocation styles (online, offline, etc) may help solve the iotest=0D
297 problem and the iotest self-bootstrap problem.=0D
=0D
--js=0D
=0D
John Snow (7):=0D
  tests: create optional tests/venv dependency groups=0D
  tests: pythonize test venv creation=0D
  tests: Remove spurious pip warnings on Ubuntu20.04=0D
  tests/vm: add venv pre-requisites to VM building recipes=0D
  tests: add 'check-venv' as a dependency of 'make check'=0D
  iotests: use tests/venv for running tests=0D
  iotests: self-bootstrap testing venv=0D
=0D
 tests/Makefile.include        |  32 +++---=0D
 tests/mkvenv.py               | 187 ++++++++++++++++++++++++++++++++++=0D
 tests/qemu-iotests/testenv.py |  25 +++--=0D
 tests/requirements.txt        |   6 --=0D
 tests/setup.cfg               |  20 ++++=0D
 tests/setup.py                |  16 +++=0D
 tests/vm/netbsd               |   1 +=0D
 tests/vm/ubuntu.i386          |   9 +-=0D
 8 files changed, 268 insertions(+), 28 deletions(-)=0D
 create mode 100644 tests/mkvenv.py=0D
 delete mode 100644 tests/requirements.txt=0D
 create mode 100644 tests/setup.cfg=0D
 create mode 100644 tests/setup.py=0D
=0D
-- =0D
2.34.3=0D
=0D


