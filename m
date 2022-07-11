Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7C7570DD5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:05:55 +0200 (CEST)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB2TS-0005H3-88
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Pk-0000gX-T6
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB2Ph-00022U-Nz
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657580520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QJuOkhEXAiXjH4eYGnIaD9sRWCWZFi+PQLkERePzj1U=;
 b=Z9BsMVqgTiQ5XLtuQPI3rRI0v3/k9qmZPOlyC8M362T4GeuEx2f0eVRCUhEomJpG4etxXn
 CWAbsKNu22/H/nNYEvmZpg2p/eIajkj6p9VABX2MCmUzECOIwv2IKKwmIfhQdKXntcgEWh
 J+pNIz0iIBPhZWQfy1jZQyJUuUfGx9k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-4i_7WstmN4-lyZQtNrWdNQ-1; Mon, 11 Jul 2022 19:01:57 -0400
X-MC-Unique: 4i_7WstmN4-lyZQtNrWdNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E8F1C06ECA;
 Mon, 11 Jul 2022 23:01:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B9F32166B26;
 Mon, 11 Jul 2022 23:01:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v3 0/7] tests: run python tests under a venv
Date: Mon, 11 Jul 2022 19:01:48 -0400
Message-Id: <20220711230155.953788-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Hi, here's another RFC for bringing external Python dependencies to the=0D
QEMU test suite.=0D
=0D
This is mostly a refresh of a version I sent out before, but mixes in my=0D
VM improvement test as an optional pre-requisite to improve VM test=0D
stability to ensure that the BSDs all pass with the new=0D
infrastructure. (And our oldest supported Debian and Ubuntu targets,=0D
too.)=0D
=0D
(Note: this requires dropping support for Ubuntu 18.04, which ships with=0D
a version of setuptools that is simply too old.)=0D
=0D
This patchset is still not without some problems that I am working on,=0D
but progress has been slow.=0D
=0D
Problems I am aware of:=0D
=0D
- This version of the patch series does not itself enforce any=0D
  offline-only behavior for venv creation, but downstreams can modify=0D
  any call to 'mkvenv' to pass '--offline'. I am working on a configure=0D
  file toggle to swap the default behavior when running tests.=0D
=0D
- iotests will now actually never run mypy or pylint tests by default=0D
  anymore, because the bootstrapper won't select those packages by=0D
  default, and the virtual environment won't utilize the system=0D
  packages, so iotest 297 will just "skip" all of the time now.=0D
=0D
  The reason we don't want to install these packages by default is=0D
  because we don't want to add dependencies on mypy and pylint for=0D
  downstream builds.=0D
=0D
  With these patches, 297 would still work if you manually opened up the=0D
  testing venv and installed suitable mypy/pylint packages there. I=0D
  could also add a new optional dependency group, and one could=0D
  theoretically invoke a once-per-build-dir command of 'make=0D
  check-venv-iotests' to help make the process only semi-manual, but=0D
  it's still annoying.=0D
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
- iotests can now self-bootstrap the venv when it isn't present, but=0D
  this self-bootstrapping has some issues in that because it skips the=0D
  Makefile magic, it cannot update the venv when changes are made to the=0D
  venv configuration piece.=0D
=0D
That's all for now. Work on the configure file integration is ongoing. I=0D
don't know if I'll beat soft freeze (It's looking unlikely given the=0D
amount of IRL issues I am juggling right now), but I'm hoping to push as=0D
much of this forward as I can to try and get some testing in for RC=0D
phase to determine what problems might exist that I haven't noticed yet.=0D
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
 7 files changed, 262 insertions(+), 25 deletions(-)=0D
 create mode 100644 tests/mkvenv.py=0D
 delete mode 100644 tests/requirements.txt=0D
 create mode 100644 tests/setup.cfg=0D
 create mode 100644 tests/setup.py=0D
=0D
-- =0D
2.34.3=0D
=0D


