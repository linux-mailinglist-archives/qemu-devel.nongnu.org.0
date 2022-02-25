Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A814C50B4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:25:08 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNi5K-0000EZ-N1
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:25:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhk7-0006i4-Ri
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhk4-0005O3-PP
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+2Dt1lT9Scd1l2FLzZxR50BVG4rXXdKWj0GOBfUSf6Y=;
 b=CGUVhXuDnWFHYf0RSvBtl0CWAMBLM1RQHrqkRBee5rJSaHRFngPVzc7eQOhVSXi5nydMo/
 UeuqzoRv+f0GgX/Xq3mQ+4DRzVm1RtOgRcPRAb+YO/r1cUmk/hHHzlryVTFM6VXTrkQuJS
 0MV1NXCBWXiqzqH00pWJ7xYTG7QhCSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-ov4IEeldP0yszeT4MjFVsA-1; Fri, 25 Feb 2022 16:03:00 -0500
X-MC-Unique: ov4IEeldP0yszeT4MjFVsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740D11006AA5;
 Fri, 25 Feb 2022 21:02:55 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB4B32ED79;
 Fri, 25 Feb 2022 21:02:01 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/9] Avocado tests: filter out tests using TCG booting full
 blown distros
Date: Fri, 25 Feb 2022 16:01:47 -0500
Message-Id: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was previously reported[1] and discussed that tests booting full=0D
blown distros and relying on TCG would take too much time to run,=0D
especially in the environments given by GitLab CI's shared runners.=0D
=0D
This is an implementation of a proposal to exclude those tests from=0D
being run by default on `make check-avocado` invocations.  To make it=0D
extra clear, all tests are still available, but those that are tagged=0D
with "accel:tcg" and "boots:distro", are filtered out by default on=0D
`make check-avocado`.=0D
=0D
This is the situation of the Avocado GitLab CI jobs with and without=0D
the changes in this PS:=0D
=0D
                         +------------------+--- ----------------+=0D
                         |        Now[2]    |       Before[3]    |=0D
+------------------------+------------------+--------------------+=0D
|          Job           |  Length |  Tests |  Length  |  Tests  |=0D
|         Name           | (mm:ss) |   Run  |  (mm:ss) |   Run   |=0D
+------------------------+------------------+-------------------+=0D
|avocado-system-alpine   |  06:33      16   |   20:30       18   |=0D
|avocado-system-debian   |  12:06      24   |   13:05       24   |=0D
|avocado-system-centos   |  09:58      41   |   24:15       44   |=0D
|avocado-system-fedora   |  08:50      35   |   08:59       35   |=0D
|avocado-system-opensuse |  08:09      38   |   27:21       42   |=0D
|avocado-system-ubuntu   |  06:52      16   |   18:52       18   |=0D
|avocado-cfi-x86_64      |  05:43      27   |   15:07       29   |=0D
+------------------------+------------------+--------------------+=0D
|TOTALS                  |  58:11     197   | 2:08:09      210   |=0D
+------------------------+------------------+--------------------+=0D
=0D
Assuming the jobs run in parallel, the overall wait time for all the=0D
Avocado jobs to complete is now ~12 minutes.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg07271.html=0D
[2] https://gitlab.com/cleber.gnu/qemu/-/pipelines/479720240=0D
[3] https://gitlab.com/qemu-project/qemu/-/pipelines/478580581=0D
=0D
Cleber Rosa (9):=0D
  Avocado GitLab CI jobs: don't reset TARGETS and simplify commands=0D
  Avocado tests: use logging namespace that is preserved in test logs=0D
  Avocado migration test: adapt to "utils.network" API namespace change=0D
  Avocado: bump to version 95.0=0D
  tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag=0D
  tests/avocado/virtiofs_submounts.py: shared_dir may not exist=0D
  Avocado tests: improve documentation on tag filtering=0D
  Avocado tests: classify tests based on what it's booted=0D
  Avocado tests: don't run tests with TCG that boot full blown distros=0D
=0D
 .gitlab-ci.d/buildtest-template.yml       |  3 ++=0D
 .gitlab-ci.d/buildtest.yml                |  9 ----=0D
 docs/devel/testing.rst                    | 22 +++++++++=0D
 tests/Makefile.include                    |  6 ++-=0D
 tests/avocado/avocado_qemu/__init__.py    | 10 ++---=0D
 tests/avocado/boot_linux.py               |  4 ++=0D
 tests/avocado/boot_linux_console.py       | 54 +++++++++++++++++++++++=0D
 tests/avocado/boot_xen.py                 |  3 ++=0D
 tests/avocado/hotplug_cpu.py              |  1 +=0D
 tests/avocado/intel_iommu.py              |  1 +=0D
 tests/avocado/linux_initrd.py             |  5 ++-=0D
 tests/avocado/linux_ssh_mips_malta.py     |  5 +++=0D
 tests/avocado/machine_arm_canona1100.py   |  1 +=0D
 tests/avocado/machine_arm_integratorcp.py |  7 ++-=0D
 tests/avocado/machine_arm_n8x0.py         |  2 +=0D
 tests/avocado/machine_avr6.py             |  1 +=0D
 tests/avocado/machine_m68k_nextcube.py    |  1 +=0D
 tests/avocado/machine_microblaze.py       |  1 +=0D
 tests/avocado/machine_mips_fuloong2e.py   |  1 +=0D
 tests/avocado/machine_mips_loongson3v.py  |  1 +=0D
 tests/avocado/machine_mips_malta.py       |  6 ++-=0D
 tests/avocado/machine_rx_gdbsim.py        |  2 +=0D
 tests/avocado/machine_s390_ccw_virtio.py  |  4 ++=0D
 tests/avocado/machine_sparc64_sun4u.py    |  1 +=0D
 tests/avocado/machine_sparc_leon3.py      |  1 +=0D
 tests/avocado/migration.py                |  4 +-=0D
 tests/avocado/multiprocess.py             |  4 ++=0D
 tests/avocado/ppc_405.py                  |  2 +=0D
 tests/avocado/ppc_bamboo.py               |  2 +=0D
 tests/avocado/ppc_mpc8544ds.py            |  1 +=0D
 tests/avocado/ppc_prep_40p.py             |  1 +=0D
 tests/avocado/ppc_pseries.py              |  1 +=0D
 tests/avocado/ppc_virtex_ml507.py         |  1 +=0D
 tests/avocado/replay_kernel.py            | 33 ++++++++++++--=0D
 tests/avocado/replay_linux.py             |  6 +--=0D
 tests/avocado/reverse_debugging.py        |  6 +--=0D
 tests/avocado/smmu.py                     |  1 +=0D
 tests/avocado/tcg_plugins.py              |  3 ++=0D
 tests/avocado/tesseract_utils.py          |  6 +--=0D
 tests/avocado/virtio-gpu.py               |  2 +=0D
 tests/avocado/virtio_check_params.py      |  3 +-=0D
 tests/avocado/virtiofs_submounts.py       |  8 ++--=0D
 tests/requirements.txt                    |  2 +-=0D
 43 files changed, 197 insertions(+), 41 deletions(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


