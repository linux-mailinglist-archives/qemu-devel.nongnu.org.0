Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2C37F52C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:00:59 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh89K-0006sP-LR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh84D-0006ku-6D
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh847-0006Xb-0N
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=30WklHOtk4lEIn38NjVixAjrAyjeUVXHZVnyhj9gggI=;
 b=RiU2JOMYZAwxLfCDCmKtgEv4x8bIaxF3GAJZmmSZZh2E0FgeOfuPjZOjoeusPjVC812vvY
 IQ2bPrQHoHGuOf/bpSFYCg+L5TfbwD+23/w8IaE9arMwglp53PYA0FG1aD45pmVVMKPy4x
 c7xpUaA78cW/IxSIhLE/TQL4stvor/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-TuwcVwICMAySAYtjhLaXyg-1; Thu, 13 May 2021 05:55:31 -0400
X-MC-Unique: TuwcVwICMAySAYtjhLaXyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12483107ACE3;
 Thu, 13 May 2021 09:55:30 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2E0210016F4;
 Thu, 13 May 2021 09:55:20 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/22] tests/docker: start using libvirt-ci's "lcitool" for
 dockerfiles
Date: Thu, 13 May 2021 10:54:57 +0100
Message-Id: <20210513095519.1213675-1-berrange@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the tests/docker/dockerfiles/*Dockerfile recipes are all hand=0D
written by contributors. There is a common design pattern, but the set=0D
of packages listed for installation leaves alot to be desired=0D
=0D
 - There is no consistency at all across distros=0D
 - Many potential build deps are not listed in the containers=0D
 - Some packages are not used by QEMU at all=0D
 - Adding new distros is an error prone task=0D
=0D
The same applies to package lists for VMs, Cirrus CI / Travis CI, and=0D
probably more.=0D
=0D
This problem is not unique to QEMU, libvirt faced the exact same issues=0D
and developed a program called "lcitool" which is part of the libvirt-ci=0D
git repository to reduce the burden in this area.=0D
=0D
Despite its name, this repository is not tied to libvirt, and so as well=0D
as the 40+ libvirt git repos, it is also used by the libosinfo and=0D
virt-viewer projects for their CI needs.=0D
=0D
lcitool is capable of automating the installation and updating of VM=0D
images, creation of dockerfiles and creation of standalone package=0D
lists.=0D
=0D
In this series I'm taking the easy step which is the generation of=0D
dockerfiles, since that is also where the most immediate value lies=0D
for QEMU.=0D
=0D
The key concept in lcitool that brings a huge win in maintainability=0D
is that there is a single file which defines a mapping between a=0D
build pre-requisite and the native package on each targetted distro.=0D
=0D
   https://gitlab.com/libvirt/libvirt-ci/-/blob/master/guests/lcitool/lcito=
ol/ansible/vars/mappings.yml=0D
=0D
A project merely has to have its list of pre-requisites enumerated=0D
=0D
   https://gitlab.com/libvirt/libvirt-ci/-/blob/master/guests/lcitool/lcito=
ol/ansible/vars/projects/qemu.yml=0D
=0D
The combination of these two files is enough to generate accurate=0D
package lists for any supported distro. Currently supported distros=0D
are Debian (10, sid), Ubuntu (18.04, 20.04), CentOS (8, 8 Stream),=0D
Fedora (32, 33, rawhide), OpenSUSE Leap (15.2) macOS (HomeBrew),=0D
FreeBSD w/ Ports (11, 12, current).=0D
=0D
At the end of this series, I have dockerfiles auto-generated for QEMU=0D
covering Ubuntu 18.04 & 20.04, CentOS 8, Fedora 32 and OpenSUSE 15.2.=0D
=0D
lcitool is also capable of generating dockerfiles for cross-compiled=0D
non-x86 architectures for Debian, and for mingw32/64 for Fedora. This=0D
is driven from the very same mapping.yml file listed above, which has=0D
attributes to indicate whether a given dependancy should be pulled from=0D
the native or cross build target. Again this means that we have strong=0D
guarantee of consistent deps being used between cross containers.=0D
=0D
I have not converted cross containers in this series though, because=0D
the way we generated cross dockerfiles is different from how QEMU does=0D
it. lcitool will always generate fully self-contained dockerfiles, but=0D
QEMU currently uses layered dockerfiles for cross-builds, so all cross=0D
builds share a common intermediate container.=0D
=0D
I could enhance lcitool to support layered containers for cross-builds,=0D
but before doing that I wondered how strongly people are attached to=0D
them ? If self-contained dockerfiles are acceptable I can do that more=0D
easily.=0D
=0D
There is also scope for auto-generating the package lists for tests/vm=0D
and .cirrus.yml files, but I've not attempted that here. The same=0D
general idea appies - we just call lcitool to spit out a list of native=0D
packages for each case.=0D
=0D
If converting tests/vm, we would need to add more distros to lcitool=0D
mappings.yml to convert openbsd, netbsd, haiku since libvirt does not=0D
target those distros itself.=0D
=0D
I have provided a tests/docker/dockerfiles/refresh script that needs=0D
to be invoked periodically to re-generate them. eg when adding a=0D
new distro, or when the package lists change. I have added libvirt-ci.git=
=0D
as a sub-module to provide more seemless integration, but this is=0D
possibly overkill. In libvirt*.git repos we don't bother with git=0D
submodules for libvirt-ci.git since whomever runs it to refresh=0D
containers just has a local checkout regardless.=0D
=0D
Changed in v3:=0D
=0D
 - Drop changes for CentOS 7=0D
 - Catch up with newly added build deps=0D
 - Add git submodule and make target for refresh=0D
=0D
Changed in v2:=0D
=0D
 - Remove more travis stuff from tests/docker/Makefile.include=0D
 - Convert opensuse image to be auto-generated=0D
 - Add SDL2_image package=0D
 - QEMU package manifest is now officially merged in libvirt-ci.git=0D
=0D
Daniel P. Berrang=C3=A9 (22):=0D
  hw/usb/ccid: remove references to NSS=0D
  tests/docker: don't use BUILDKIT in GitLab either=0D
  tests/docker: use project specific container registries=0D
  tests/docker: use explicit docker.io registry=0D
  tests/docker: remove FEATURES env var from templates=0D
  tests/docker: fix sorting in package lists=0D
  tests/docker: fix mistakes in centos package lists=0D
  tests/docker: fix mistakes in fedora package list=0D
  tests/docker: fix mistakes in ubuntu package lists=0D
  tests/docker: remove mingw packages from Fedora=0D
  tests/docker: expand centos8 package list=0D
  tests/docker: expand fedora package list=0D
  tests/docker: expand ubuntu1804 package list=0D
  tests/docker: expand ubuntu2004 package list=0D
  tests/docker: expand opensuse-leap package list=0D
  tests/docker: add script for automating container refresh=0D
  tests/docker: auto-generate centos8 with lcitool=0D
  tests/docker: auto-generate fedora with lcitool=0D
  tests/docker: auto-generate ubuntu1804 with lcitool=0D
  tests/docker: auto-generate ubuntu2004 with lcitool=0D
  tests/docker: auto-generate opensuse-leap with lcitool=0D
  tests/docker: remove ubuntu container=0D
=0D
 .gitlab-ci.d/containers.yml                   |   5 -=0D
 .gitmodules                                   |   3 +=0D
 .travis.yml                                   |  12 +-=0D
 docs/ccid.txt                                 |  15 +-=0D
 docs/devel/testing.rst                        |  15 +-=0D
 scripts/coverity-scan/coverity-scan.docker    |   1 -=0D
 tests/docker/Makefile.include                 |  10 +=0D
 tests/docker/common.rc                        |  19 +-=0D
 tests/docker/docker.py                        |   4 +-=0D
 tests/docker/dockerfiles-refresh.py           |  70 +++++=0D
 tests/docker/dockerfiles/centos8.docker       | 165 +++++++++---=0D
 .../dockerfiles/debian-xtensa-cross.docker    |   2 +-=0D
 tests/docker/dockerfiles/debian10.docker      |   4 +-=0D
 tests/docker/dockerfiles/debian11.docker      |   2 +-=0D
 .../dockerfiles/fedora-cris-cross.docker      |   2 +-=0D
 .../dockerfiles/fedora-i386-cross.docker      |   2 +-=0D
 .../dockerfiles/fedora-win32-cross.docker     |   3 +-=0D
 .../dockerfiles/fedora-win64-cross.docker     |   3 +-=0D
 tests/docker/dockerfiles/fedora.docker        | 253 ++++++++++--------=0D
 tests/docker/dockerfiles/opensuse-leap.docker | 180 +++++++++----=0D
 tests/docker/dockerfiles/ubuntu.docker        |  71 -----=0D
 tests/docker/dockerfiles/ubuntu1804.docker    | 195 ++++++++++----=0D
 tests/docker/dockerfiles/ubuntu2004.docker    | 211 ++++++++++-----=0D
 tests/docker/libvirt-ci                       |   1 +=0D
 tests/docker/run                              |   3 -=0D
 tests/docker/test-clang                       |   2 +-=0D
 tests/docker/test-debug                       |   2 +-=0D
 tests/docker/test-mingw                       |   3 +-=0D
 tests/docker/test-misc                        |   2 +-=0D
 tests/docker/test-tsan                        |   2 +-=0D
 30 files changed, 810 insertions(+), 452 deletions(-)=0D
 create mode 100755 tests/docker/dockerfiles-refresh.py=0D
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker=0D
 create mode 160000 tests/docker/libvirt-ci=0D
=0D
--=20=0D
2.31.1=0D
=0D


