Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5F30E12F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:37:38 +0100 (CET)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7M5x-0001MZ-70
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lt9-00012z-33
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lt2-0004PT-Bh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RrdQc1jkYOg/mu7Ru0B32fES8ZHQHHxFoKSHSsYhLFs=;
 b=A0d1GL5b/cAJu/87pulUdRD/JO4xFq8Iu5RCh/FmjQDousccxZUMiZmTidOyyy++GgHVLR
 cLRBeX2OI+BbkuPNjhi/gZK4LBdRKmtm8Dju5aPtC4nDQVCF1O2I0CUuFhh3rpcuhmdA+t
 X4tJ7vHZsURgRahtXEja4lYRjrQbYZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-UI9Qb1cQNQeKIqBuPnVcvg-1; Wed, 03 Feb 2021 12:24:10 -0500
X-MC-Unique: UI9Qb1cQNQeKIqBuPnVcvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2E251936B7C;
 Wed,  3 Feb 2021 17:24:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FAF91971C;
 Wed,  3 Feb 2021 17:23:59 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] Acceptance Test: introduce base class for Linux based
 tests
Date: Wed,  3 Feb 2021 12:23:35 -0500
Message-Id: <20210203172357.1422425-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces a base class for tests that need to interact with a=0D
Linux guest.  It generalizes the "boot_linux.py" code, already been=0D
used by the "virtiofs_submounts.py" and also SSH related code being=0D
used by that and "linux_ssh_mips_malta.py".=0D
=0D
While at it, a number of fixes on hopeful improvements to those tests=0D
were added.=0D
=0D
Cleber Rosa (22):=0D
  tests/acceptance/boot_linux.py: fix typo on cloudinit error message=0D
  tests/acceptance/boot_linux.py: rename misleading cloudinit method=0D
  Acceptance Tests: remove unnecessary tag from documentation example=0D
  tests/acceptance/virtiofs_submounts.py: use workdir property=0D
  tests/acceptance/virtiofs_submounts.py: do not ask for ssh key=0D
    password=0D
  tests/acceptance/virtiofs_submounts.py: use a virtio-net device=0D
    instead=0D
  tests/acceptance/virtiofs_submounts.py: evaluate string not length=0D
  tests/acceptance/virtiofs_submounts.py: standardize port as integer=0D
  tests/acceptance/virtiofs_submounts.py: required space between IP and=0D
    port=0D
  Python: add utility function for retrieving port redirection=0D
  tests/acceptance/linux_ssh_mips_malta.py: standardize port as integer=0D
  Acceptance tests: clarify ssh connection failure reason=0D
  tests/acceptance/virtiofs_submounts.py: add missing accel tag=0D
  Acceptance Tests: introduce LinuxTest base class=0D
  Acceptance Tests: move useful ssh methods to base class=0D
  Acceptance Tests: introduce method for requiring an accelerator=0D
  Acceptance Tests: fix population of public key in cloudinit image=0D
  Acceptance Tests: set up existing ssh keys by default=0D
  Acceptance Tests: add port redirection for ssh by default=0D
  Acceptance Tests: add basic documentation on LinuxTest base class=0D
  Acceptance Tests: introduce CPU hotplug test=0D
  [NOTFORMERGE] Bump Avocado version to latest master=0D
=0D
 docs/devel/testing.rst                    |  29 +++-=0D
 python/qemu/utils.py                      |  35 +++++=0D
 tests/acceptance/avocado_qemu/__init__.py | 176 ++++++++++++++++++++++=0D
 tests/acceptance/boot_linux.py            | 128 ++--------------=0D
 tests/acceptance/hotplug_cpu.py           |  38 +++++=0D
 tests/acceptance/info_usernet.py          |  29 ++++=0D
 tests/acceptance/linux_ssh_mips_malta.py  |  44 +-----=0D
 tests/acceptance/virtiofs_submounts.py    |  73 +--------=0D
 tests/requirements.txt                    |   2 +-=0D
 tests/vm/basevm.py                        |   7 +-=0D
 10 files changed, 334 insertions(+), 227 deletions(-)=0D
 create mode 100644 python/qemu/utils.py=0D
 create mode 100644 tests/acceptance/hotplug_cpu.py=0D
 create mode 100644 tests/acceptance/info_usernet.py=0D
=0D
--=20=0D
2.25.4=0D
=0D


