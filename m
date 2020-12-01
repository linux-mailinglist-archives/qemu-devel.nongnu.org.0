Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1362CA968
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:20:39 +0100 (CET)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9KQ-0005f8-64
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9IU-0003wt-1t
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9IO-00021t-VI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zBwfNvXJQOTT+gigvmBQJupbV6P0/JditukNZ0ssaTM=;
 b=S4HIHE05q/zEx2qSKcgGRPbvXuNnpK1RuQlFGgw4wMdwe7Bn3MwafepKYwA5T2B6PvfI5j
 y0rAyicdKnl89b6HNURCw64Jw2CafqXm1GLsMSjneqiOYV2xkXKN2DobQ5pD7YUrL3OX4Q
 v6c+oYPP4QGt0i2qiiJG1fC/tBgcxLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-E7Mrk6D8Or-GBndOIhX-iQ-1; Tue, 01 Dec 2020 12:18:30 -0500
X-MC-Unique: E7Mrk6D8Or-GBndOIhX-iQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54BB185E483;
 Tue,  1 Dec 2020 17:18:28 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24FCC5D9C2;
 Tue,  1 Dec 2020 17:18:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/23] tests/docker: start using libvirt-ci's "lcitool" for
 dockerfiles
Date: Tue,  1 Dec 2020 17:18:02 +0000
Message-Id: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
   https://gitlab.com/libvirt-ci/libvirt-ci/=0D
=0D
Despite its name, this repository is not tied to libvirt, and so as well=0D
as the 40+ libvirt git repos, it is also used by the libosinfo and=0D
virt-viewer projects for their CI needs. The idea is that all these=0D
projects can share the burden of libvirt-ci.=0D
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
   https://gitlab.com/berrange/libvirt-ci/-/blob/qemu/guests/lcitool/lcitoo=
l/=3D=0D
ansible/vars/mappings.yml=0D
=0D
A project merely has to have its list of pre-requisites enumerated=0D
=0D
  https://gitlab.com/berrange/libvirt-ci/-/blob/qemu/guests/lcitool/lcitool=
/a=3D=0D
nsible/vars/projects/qemu.yml=0D
=0D
The combination of these two files is enough to generate accurate=0D
package lists for any supported distro. Currently supported distros=0D
are Debian (10, sid), Ubuntu (18.04, 20.04), CentOS (7, 8, stream),=0D
Fedora (32, 33, rawhide), OpenSUSE (151) macOS (homebrew),=0D
FreeBSD (11, 12, current).=0D
=0D
At the end of this series, I have dockerfiles auto-generated for QEMU=0D
covering Ubuntu 18.04 & 20.04, CentOS 7 & 8 and Fedora 32.=0D
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
mappings.yml to covert openbsd, netbsd, haiku since libvirt does not=0D
target those distros itself.=0D
=0D
Finally I wondered about the approach to integrating with lcitool.=0D
=0D
I have provided a tests/docker/dockerfiles/refresh script that needs=0D
to be invoked periodically to re-generate them. eg when adding a=0D
new distro, or when the package lists change. I could add libvirt-ci.git=0D
as a sub-module and provide a more seemless integration, but open to=0D
suggestions. In libvirt*.git repos we don't bother with git submodules=0D
for libvirt-ci.git since whomever runs it to refresh containers just=0D
has a local checkout regardless.=0D
=0D
Note since this is a proof of concept, the additions to libvirt-ci for=0D
QEMU are not part of the main git repo yet, they're just in my own fork=0D
on the "qemu" branch=0D
=0D
  https://gitlab.com/berrange/libvirt-ci/-/tree/qemu=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (23):=0D
  hw/usb/ccid: remove references to NSS=0D
  tests/docker: don't use BUILDKIT in GitLab either=0D
  tests/docker: use project specific container registries=0D
  tests/docker: use explicit docker.io registry=0D
  tests/docker: remove travis container=0D
  tests/docker: remove FEATURES env var from templates=0D
  tests/docker: fix sorting in package lists=0D
  tests/docker: fix mistakes in centos package lists=0D
  tests/docker: fix mistakes in fedora package list=0D
  tests/docker: fix mistakes in ubuntu package lists=0D
  tests/docker: remove mingw packages from Fedora=0D
  tests/docker: add script for automating container refresh=0D
  tests/docker: expand centos7 package list=0D
  tests/docker: expand centos8 package list=0D
  tests/docker: expand fedora package list=0D
  tests/docker: expand ubuntu1804 package list=0D
  tests/docker: expand ubuntu2004 package list=0D
  tests/docker: auto-generate centos7 with lcitool=0D
  tests/docker: auto-generate centos8 with lcitool=0D
  tests/docker: auto-generate fedora with lcitool=0D
  tests/docker: auto-generate ubuntu1804 with lcitool=0D
  tests/docker: auto-generate ubuntu2004 with lcitool=0D
  tests/docker: remove ubuntu container=0D
=0D
 .gitlab-ci.d/containers.yml                   |   5 -=0D
 .travis.yml                                   |  14 +-=0D
 docs/ccid.txt                                 |  15 +-=0D
 scripts/coverity-scan/coverity-scan.docker    |   1 -=0D
 tests/docker/common.rc                        |  19 +-=0D
 tests/docker/docker.py                        |   4 +-=0D
 tests/docker/dockerfiles/centos7.docker       | 157 +++++++++---=0D
 tests/docker/dockerfiles/centos8.docker       | 153 ++++++++---=0D
 .../dockerfiles/debian-xtensa-cross.docker    |   2 +-=0D
 tests/docker/dockerfiles/debian10.docker      |   4 +-=0D
 tests/docker/dockerfiles/debian11.docker      |   2 +-=0D
 .../dockerfiles/fedora-cris-cross.docker      |   2 +-=0D
 .../dockerfiles/fedora-i386-cross.docker      |   2 +-=0D
 .../dockerfiles/fedora-win32-cross.docker     |   3 +-=0D
 .../dockerfiles/fedora-win64-cross.docker     |   3 +-=0D
 tests/docker/dockerfiles/fedora.docker        | 241 ++++++++++--------=0D
 tests/docker/dockerfiles/refresh              |  67 +++++=0D
 tests/docker/dockerfiles/travis.docker        |  17 --=0D
 tests/docker/dockerfiles/ubuntu.docker        |  71 ------=0D
 tests/docker/dockerfiles/ubuntu1804.docker    | 185 +++++++++-----=0D
 tests/docker/dockerfiles/ubuntu2004.docker    | 197 +++++++++-----=0D
 tests/docker/run                              |   3 -=0D
 tests/docker/test-clang                       |   2 +-=0D
 tests/docker/test-debug                       |   2 +-=0D
 tests/docker/test-mingw                       |   3 +-=0D
 tests/docker/test-misc                        |   2 +-=0D
 tests/docker/test-tsan                        |   2 +-=0D
 tests/docker/travis                           |  22 --=0D
 tests/docker/travis.py                        |  47 ----=0D
 29 files changed, 732 insertions(+), 515 deletions(-)=0D
 create mode 100755 tests/docker/dockerfiles/refresh=0D
 delete mode 100644 tests/docker/dockerfiles/travis.docker=0D
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker=0D
 delete mode 100755 tests/docker/travis=0D
 delete mode 100755 tests/docker/travis.py=0D
=0D
--=3D20=0D
2.28.0=0D
=0D


