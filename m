Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F0D417B75
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:06:34 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqWn-0004Mq-8o
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqO9-0003K8-TO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqO8-0005Cm-3F
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nL7iz+RrEoo9yAMNBG9KYSlsAKM1sZClVcQmCtA5nGE=;
 b=AOUNsuGHsatgKWw7W/TT5NtmqJgtj/XX9diAE4R4twh/fDV3NCIh6fV96LJS8tCJNQaQJt
 kVq1odIrskeMdRhehoxA3oZFgGTqYPs1VeOxeVb0reTrAs0K+04d2qpEE7TuLafOmbQ1kO
 Tp7+X547ZCtLfnc92PnXHDnuzkuoIRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-vVsrc7b1MniNXiqodQvqxw-1; Fri, 24 Sep 2021 14:56:26 -0400
X-MC-Unique: vVsrc7b1MniNXiqodQvqxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F649100C664;
 Fri, 24 Sep 2021 18:56:24 +0000 (UTC)
Received: from p50.net (unknown [10.22.33.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 711815FC13;
 Fri, 24 Sep 2021 18:55:12 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] Acceptance Tests: use Avocado 91.0 features and other
 improvements
Date: Fri, 24 Sep 2021 14:54:50 -0400
Message-Id: <20210924185506.2542588-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a collection of patches for the Acceptance Tests to leverage=0D
some of the features of Avocado 91.0.  With the Avocado version bump=0D
by itself, there would be a change in the default "test runner"=0D
implementation that Avocado uses, from the one simply known as=0D
"runner" to the new one called "nrunner".=0D
=0D
Among the changes from one implementation to the other, is the fact=0D
that "nrunner" will run tests in parallel by default.  This is *not=0D
yet* enabled by default on "make check-acceptance", but users can=0D
choose to use simply by setting the "AVOCADO_RUNNER" variable, that=0D
is:=0D
=0D
  make AVOCADO_RUNNER=3Dnrunner check-acceptance=0D
=0D
If you are curious about the architectural differences of the nrunner,=0D
please refer to:=0D
=0D
  https://avocado-framework.readthedocs.io/en/91.0/guides/contributor/chapt=
ers/runners.html=0D
=0D
One other noteworthy proposal is a convention to tag tests that either=0D
have known issues, or that touch on QEMU features that have known=0D
issues.  By tagging those tests accordingly, they will be=0D
automatically excluded from the regular execution with "make=0D
check-acceptance".=0D
=0D
Finally, some updates to assets locations and some tests refactors and=0D
cleanups.=0D
=0D
Cleber Rosa (16):=0D
  Acceptance Tests: bump Avocado requirement to 91.0=0D
  Acceptance Tests: improve check-acceptance description=0D
  Acceptance Tests: add mechanism for listing tests=0D
  Acceptance Tests: keep track and disable tests with known issues=0D
  Acceptance Tests: add standard clean up at test tearDown()=0D
  Acceptance Tests: use extract from package from avocado.utils=0D
  Acceptance Tests: workaround expired mipsdistros.mips.com HTTPS cert=0D
  acceptance/tests/vnc.py: use explicit syntax for enabling passwords=0D
  tests/acceptance/boot_xen.py: merge base classes=0D
  tests/acceptance/boot_xen.py: unify tags=0D
  tests/acceptance/boot_xen.py: fetch kernel during test setUp()=0D
  tests/acceptance/boot_xen.py: removed unused import=0D
  tests/acceptance/boot_xen.py: use class attribute=0D
  tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location update=0D
  tests/acceptance/ppc_prep_40p.py: clean up unused import=0D
  tests/acceptance/ppc_prep_40p.py: unify tags=0D
=0D
 docs/devel/testing.rst                    | 40 ++++++++++=0D
 tests/Makefile.include                    | 15 +++-=0D
 tests/acceptance/avocado_qemu/__init__.py |  1 +=0D
 tests/acceptance/boot_linux_console.py    | 93 +++++++++--------------=0D
 tests/acceptance/boot_xen.py              | 54 ++++---------=0D
 tests/acceptance/machine_rx_gdbsim.py     |  3 +=0D
 tests/acceptance/ppc_prep_40p.py          | 17 ++---=0D
 tests/acceptance/replay_kernel.py         | 18 ++---=0D
 tests/acceptance/tcg_plugins.py           |  2 +-=0D
 tests/acceptance/vnc.py                   |  2 +-=0D
 tests/requirements.txt                    |  2 +-=0D
 11 files changed, 128 insertions(+), 119 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


