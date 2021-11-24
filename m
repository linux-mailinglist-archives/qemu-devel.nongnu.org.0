Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C545C14E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:13:38 +0100 (CET)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mps5g-0004TY-Tf
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpruf-0004pB-UE
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprub-0005hi-0E
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+DR4//oqfy9Rd2BaxYX7oVxD+tp19QYT1GtDD0Bsxs=;
 b=gDkvqx8V/u0+X+z9ErLe5i7bQcmbCWwR2YjIsibvXkUfijLDdElQBuuccKuw7rA/KtIJU6
 mU8waJFshC8AztIoNFQNzHAY9vRHHpHjYVpfNRzADSQ0N3nhoHuW9Q9Cb+Nog1XWH5ou15
 OyGXlu5QPGIKx584VZrQ1fTau0OQpnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-476-rG1wqLGONIWmAV7OilDB_Q-1; Wed, 24 Nov 2021 08:01:54 -0500
X-MC-Unique: rG1wqLGONIWmAV7OilDB_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A391D185302A;
 Wed, 24 Nov 2021 13:01:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8AA79457;
 Wed, 24 Nov 2021 13:01:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/18] tests/docker: start using libvirt-ci's "lcitool" for
 dockerfiles
Date: Wed, 24 Nov 2021 13:01:32 +0000
Message-Id: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
dockerfiles and Cirrus CI variables, since that is where the most=0D
immediate value lies for QEMU.=0D
=0D
The key concept in lcitool that brings a huge win in maintainability=0D
is that there is a single file which defines a mapping between a=0D
build pre-requisite and the native package on each targetted distro.=0D
=0D
   https://gitlab.com/libvirt/libvirt-ci/-/blob/master/guests/lcitool/lcito=
ol/ansible/vars/mappings.yml=0D
=0D
A project merely then to have its list of pre-requisites enumerated=0D
For example:=0D
=0D
   https://gitlab.com/libvirt/libvirt-ci/-/blob/master/guests/lcitool/lcito=
ol/ansible/vars/projects/qemu.yml=0D
=0D
The combination of these two files is enough to generate accurate=0D
package lists for any supported distro. Currently supported distro=0D
targets are=0D
=0D
 $ lcitool targets=0D
  alpine-314=0D
  alpine-edge=0D
  centos-8=0D
  centos-stream-8=0D
  centos-stream-9=0D
  debian-10=0D
  debian-11=0D
  debian-sid=0D
  fedora-34=0D
  fedora-35=0D
  fedora-rawhide=0D
  freebsd-12=0D
  freebsd-13=0D
  freebsd-current=0D
  macos-11=0D
  opensuse-leap-152=0D
  opensuse-tumbleweed=0D
  ubuntu-1804=0D
  ubuntu-2004=0D
=0D
At the end of this series, I have dockerfiles auto-generated for QEMU=0D
covering Ubuntu 18.04 & 20.04, CentOS 8, Fedora 35 and OpenSUSE 15.2=0D
and Alpine Edge=0D
=0D
lcitool is also capable of generating dockerfiles for cross-compiled=0D
non-x86 architectures for Debian, and for mingw32/64 for Fedora. This=0D
is driven from the very same mapping.yml file listed above, which has=0D
attributes to indicate whether a given dependancy should be pulled from=0D
the native or cross build target. Again this means that we have strong=0D
guarantee of consistent deps being used between cross containers.=0D
=0D
I have not converted cross containers in this series though, because=0D
the way lcitool generated cross dockerfiles is different from how QEMU=0D
does it. lcitool will always generate fully self-contained dockerfiles,=0D
but QEMU currently uses layered dockerfiles for cross-builds, so all=0D
cross builds share a common intermediate container.=0D
=0D
I've got a pending enhancement to lcitool to support split layers=0D
for the cross-buld dockerfiles. An alternative is to just use fully=0D
self-contained dockerfiles for cross builds too though.=0D
=0D
There is also scope for auto-generating the package lists for tests/vm,=0D
but I've not attempted that yet. The same general idea appies - we just=0D
call lcitool to spit out a yml file containing a list of native packages=0D
for each VM target.=0D
=0D
If converting tests/vm, we would need to add more distros to lcitool=0D
mappings.yml to convert openbsd, netbsd, haiku since libvirt does not=0D
target those distros itself.=0D
=0D
I have provided a 'make lcitool-refresh' target that needs to be=0D
invoked whenever the local files need re-generating with updated=0D
package lists. This can be either when adding a new distro target=0D
or when some build pre-requisite is added. This make target will=0D
checkout the libvirt-ci.git submodule to do its work.=0D
=0D
=0D
One unsolved problem here is that the rebase to Fedora 35 has=0D
caused the oss-fuzz job in CI to reliably fail with a timeout.=0D
Running locally on F35 the fuzz script never finishes even after=0D
24 hours. There's a genuine problem hiding in there in the=0D
tests or code itself, that newer clang has likely exposed.=0D
=0D
Changed in v5:=0D
=0D
 - Re-introduce use of git submodule=0D
 - Pull qemu.yml package list into qemu.git not libvirt-ci.git=0D
 - Improved make trget integration for refreshing files=0D
 - Also convert Alpine dockerfile=0D
 - Also generate cirrus CI variables files=0D
 - Rebase fedora dockerfile to F35, since F33 is no longer=0D
   supported by libvirt-ci as it is end of life by Fedora.=0D
=0D
Changed in v4:=0D
=0D
 - Refresh to cope with new libbpf, libffi & rtd theme packages=0D
 - Drop use of git submodule=0D
 - Improve documentation=0D
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
Daniel P. Berrang=C3=A9 (17):=0D
  ui: avoid compiler warnings from unused clipboard info variable=0D
  meson: require liburing >=3D 0.3=0D
  ui: avoid warnings about directdb on Alpine / musl libc=0D
  ci: explicitly skip I/O tests on alpine=0D
  tests/docker: switch fedora image to release 35=0D
  tests: integrate lcitool for generating build env manifests=0D
  tests/docker: auto-generate centos8.docker with lcitool=0D
  tests/docker: auto-generate fedora.docker with lcitool=0D
  tests/docker: auto-generate ubuntu1804.docker with lcitool=0D
  tests/docker: auto-generate ubuntu2004.docker with lcitool=0D
  tests/docker: auto-generate opensuse-leap.docker with lcitool=0D
  tests/docker: remove ubuntu.docker container=0D
  .gitlab-ci.d/cirrus: auto-generate variables with lcitool=0D
  tests/docker: updates to alpine package list=0D
  tests/docker: fix sorting of alpine image package lists=0D
  tests/docker: fully expand the alpine package list=0D
  tests/docker: auto-generate alpine.docker with lcitool=0D
=0D
John Snow (1):=0D
  spice: Update QXLInterface for spice >=3D 0.15.0=0D
=0D
 .gitlab-ci.d/buildtest.yml                    |   2 +-=0D
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  11 +-=0D
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  11 +-=0D
 .gitlab-ci.d/cirrus/macos-11.vars             |  11 +-=0D
 .gitlab-ci.d/containers.yml                   |   5 -=0D
 .gitmodules                                   |   3 +=0D
 Makefile                                      |   2 +=0D
 docs/devel/testing.rst                        | 104 ++++++-=0D
 hw/display/qxl.c                              |  14 +-=0D
 include/ui/qemu-spice.h                       |   6 +=0D
 include/ui/sdl2.h                             |  11 +=0D
 meson.build                                   |   3 +-=0D
 tests/docker/dockerfiles/alpine.docker        | 175 ++++++++----=0D
 tests/docker/dockerfiles/centos8.docker       | 243 ++++++++--------=0D
 tests/docker/dockerfiles/fedora.docker        | 262 ++++++++++--------=0D
 tests/docker/dockerfiles/opensuse-leap.docker | 245 ++++++++--------=0D
 tests/docker/dockerfiles/ubuntu.docker        |  71 -----=0D
 tests/docker/dockerfiles/ubuntu1804.docker    | 255 +++++++++--------=0D
 tests/docker/dockerfiles/ubuntu2004.docker    | 257 +++++++++--------=0D
 tests/lcitool/Makefile.include                |  17 ++=0D
 tests/lcitool/libvirt-ci                      |   1 +=0D
 tests/lcitool/projects/qemu.yml               | 115 ++++++++=0D
 tests/lcitool/refresh                         |  96 +++++++=0D
 ui/clipboard.c                                |   3 +-=0D
 ui/spice-display.c                            |  11 +=0D
 25 files changed, 1217 insertions(+), 717 deletions(-)=0D
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker=0D
 create mode 100644 tests/lcitool/Makefile.include=0D
 create mode 160000 tests/lcitool/libvirt-ci=0D
 create mode 100644 tests/lcitool/projects/qemu.yml=0D
 create mode 100755 tests/lcitool/refresh=0D
=0D
--=20=0D
2.33.1=0D
=0D


