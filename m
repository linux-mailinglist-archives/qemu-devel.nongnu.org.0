Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD732010D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:00:45 +0100 (CET)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDpM-0002Hk-Fs
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDDnb-00014u-VN
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:58:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDDnW-0004ly-5Z
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UoSU2fHS88b9K/Shcs7BuKqStjuuQnWrcbE3ccBUgT4=;
 b=Hy21e4jDOt+gibaB0L4swfpKwdrpElfoCO0dSTtX4I7MJvbfnrPkuKFNJwobhq3gdb7Ro4
 XpXvMuQCjytGllxhjdCFP7Ou5qByLH6IewpO5ZQiwQn0q0n3D1KB5d/1BVTZ6FoA7RCEHS
 nbvYu5QdbnQLeegHx5xYcmxxRByll7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-kqYEQBEYPveXWQZusasI0Q-1; Fri, 19 Feb 2021 16:58:46 -0500
X-MC-Unique: kqYEQBEYPveXWQZusasI0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8A31020C20;
 Fri, 19 Feb 2021 21:58:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5592E6F989;
 Fri, 19 Feb 2021 21:58:40 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating CI)
Date: Fri, 19 Feb 2021 16:58:34 -0500
Message-Id: <20210219215838.752547-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TL;DR: this should allow the QEMU maintainer to push to the staging=0D
branch, and have custom jobs running on the project's aarch64 and=0D
s390x machines.  Jobs in this version are allowed to fail, to allow=0D
for the inclusion of the novel machines/jobs without CI disruption.=0D
Simple usage looks like:=0D
=0D
   git push remote staging=0D
   ./scripts/ci/gitlab-pipeline-status --verbose --wait=0D
=0D
Long version:=0D
=0D
The idea about a public facing Gating CI for QEMU was summarized in an=0D
RFC[1].  Since then, it was decided that a simpler version should be=0D
attempted first.=0D
=0D
At this point, there are two specific runners (an aarch64 and an s390x)=0D
registered with GitLab, at https://gitlab.com/qemu-project, currently=0D
setup to the "qemu" repository.=0D
=0D
Changes from v4:=0D
=0D
 - Fixed typo in docs/devel/ci.rst, s/maintanance/maintenance/ (Thomas)=0D
 - Removed "[local]" group from inventory file (Erik)=0D
 - Removed sections from the playbooks which *would* be applied on=0D
   hardware/OS that are currently not available to QEMU=0D
 - Removed duplicated "here" on documentation (Thomas)=0D
 - Moved description of current jobs, and possible direction of future=0D
   jobs to the patch description (Thomas)=0D
 - Remove comments around "when" conditions (Andrea)=0D
 - Switch to always use explicit lists on "when" blocks (Andrea)=0D
 - Switch from using module "apt" to using generic action module "package",=
=0D
   which involved adding a new task to update the apt cache (Andrea)=0D
 - Fix playbook indentation in the non-s390x package installation task (And=
rea)=0D
 - Changed gitlab-runner tags examples from FreeBSD to Ubuntu, which is=0D
   covered by jobs added on this version=0D
 - Fixed typo in commit message s/s390/s390x/ (Phil)=0D
 - Allow all custom-runner jobs to fail at this time=0D
 - Cleared "Reviewed-by" in one patch due to large changes=0D
=0D
  Changes requested in v4 but *not* seen here due to sections of the=0D
  playbook being removed:=0D
=0D
 - Replace SDL-devel for SDL2-devel on CentOS, according to 5ed7ca3 (Thomas=
)=0D
 - Correct missing step 10 on the FreeBSD gitlab-runner installation=0D
   instructions (Erik)=0D
=0D
Changes from v3:=0D
=0D
- Applied changes to match <20201014135416.1290679-1-pbonzini@redhat.com>,=
=0D
  that is, added ninja-build to "build-environment.yml" list of packages=0D
  and enabled PowerTools repository on CentOS 8.=0D
=0D
Changes from v2:=0D
=0D
- The overall idea of "Gating CI" has been re-worded "custom runners",=0D
  given that the other jobs running on shared runners are also=0D
  considered gating (Daniel)=0D
=0D
- Fixed wording and typos on the documentation, including:=0D
 * update -> up to date (Erik)=0D
 * a different set of CI jobs -> different CI jobs (Erik)=0D
 * Pull requests will only be merged -> code will only be merged (Stefan)=
=0D
 * Setup -> set up (Stefan)=0D
 * them -> they (Stefan)=0D
 * the -> where the (Stefan)=0D
 * dropped "in the near future" (Stefan)=0D
=0D
- Changed comment on "build-environment.yml" regarding the origin of=0D
  the package list (Stefan)=0D
=0D
- Removed inclusion of "vars.yml" from "build-environment.yml", given that=
=0D
  no external variable is used there=0D
=0D
- Updated package list in "build-environment.yml" from current=0D
  dockerfiles=0D
=0D
- Tested "build-environment" on Fedora 31 and 32 (in addition to Fedora 30)=
,=0D
  and noted that it's possible to use it on those distros=0D
=0D
- Moved CI documentation from "testing.rst" to its own file (Phillipe)=0D
=0D
- Split "GitLab Gating CI: initial set of jobs, documentation and scripts"=
=0D
  into (Phillipe):=0D
  1) Basic documentation and configuration (gitlab-ci.yml) placeholder=0D
  2) Playbooks for setting up a build environment=0D
  3) Playbooks for setting up gitlab-runner=0D
  4) Actual GitLab CI jobs configuration=0D
=0D
- Set custom jobs to be on the "build" stage, given that they combine=0D
  build and test.=0D
=0D
- Set custom jobs to not depend on any other job, so they can start=0D
  right away.=0D
=0D
- Set rules for starting jobs so that all pushing to any branch that=0D
  start with name "staging".  This allows the project maintainer to=0D
  use the "push to staging" workflow, while also allowing others to=0D
  generate similar jobs.  If this project has configured custom=0D
  runners, the jobs will run, if not, the pipeline will be marked as=0D
  "stuck".=0D
=0D
- Changed "scripts" on custom jobs to follow the now common pattern=0D
  (on other jobs) of creating a "build" directory.=0D
=0D
Changes from v1:=0D
=0D
- Added jobs that require specific GitLab runners already available=0D
  (Ubuntu 20.04 on aarch64, and Ubuntu 18.04 on s390x)=0D
- Removed jobs that require specific GitLab runners not yet available=0D
  (Fedora 30, FreeBSD 12.1)=0D
- Updated documentation=0D
- Added copyright and license to new scripts=0D
- Moved script to from "contrib" to "scripts/ci/"=0D
- Moved setup playbooks form "contrib" to "scripts/ci/setup"=0D
- Moved "gating.yml" to ".gitlab-ci.d" directory=0D
- Removed "staging" only branch restriction on jobs defined in=0D
  ".gitlab-ci.yml", assumes that the additional jobs on the staging=0D
  branch running on the freely available gitlab shared runner are=0D
  positive=0D
- Dropped patches 1-3 (already merged)=0D
- Simplified amount of version specifity on Ubuntu, from 18.04.3 to=0D
  simply 18.04 (assumes no diverse minor levels will be used or=0D
  specific runners)=0D
=0D
Changes from the RFC patches[2] accompanying the RFC document:=0D
=0D
- Moved gating job definitions to .gitlab-ci-gating.yml=0D
- Added info on "--disable-libssh" build option requirement=0D
  (https://bugs.launchpad.net/qemu/+bug/1838763) to Ubuntu 18.04 jobs=0D
- Added info on "--disable-glusterfs" build option requirement=0D
  (there's no static version of those libs in distro supplied=0D
  packages) to one=0D
- Dropped ubuntu-18.04.3-x86_64-notools job definition, because it=0D
  doesn't fall into the general scope of gating job described by PMM=0D
  (and it did not run any test)=0D
- Added w32 and w64 cross builds based on Fedora 30=0D
- Added a FreeBSD based job that builds all targets and runs `make=0D
  check`=0D
- Added "-j`nproc`" and "-j`sysctl -n hw.ncpu`" options to make as a=0D
  simple but effective way of speeding up the builds and tests by=0D
  using a number of make jobs matching the number of CPUs=0D
- Because the Ansible playbooks reference the content on Dockerfiles,=0D
  some fixes to some Dockerfiles caught in the process were included=0D
- New patch with script to check or wait on a pipeline execution=0D
=0D
[1] - https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00231.html=
=0D
[2] - https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg00154.html=
=0D
=0D
Cleber Rosa (4):=0D
  Jobs based on custom runners: documentation and configuration=0D
    placeholder=0D
  Jobs based on custom runners: build environment docs and playbook=0D
  Jobs based on custom runners: docs and gitlab-runner setup playbook=0D
  Jobs based on custom runners: add job definitions for QEMU's machines=0D
=0D
 .gitlab-ci.d/custom-runners.yml        | 218 +++++++++++++++++++++++++=0D
 .gitlab-ci.yml                         |   1 +=0D
 docs/devel/ci.rst                      | 116 +++++++++++++=0D
 docs/devel/index.rst                   |   1 +=0D
 scripts/ci/setup/.gitignore            |   1 +=0D
 scripts/ci/setup/build-environment.yml |  76 +++++++++=0D
 scripts/ci/setup/gitlab-runner.yml     |  65 ++++++++=0D
 scripts/ci/setup/inventory             |   1 +=0D
 scripts/ci/setup/vars.yml.template     |  13 ++=0D
 9 files changed, 492 insertions(+)=0D
 create mode 100644 .gitlab-ci.d/custom-runners.yml=0D
 create mode 100644 docs/devel/ci.rst=0D
 create mode 100644 scripts/ci/setup/.gitignore=0D
 create mode 100644 scripts/ci/setup/build-environment.yml=0D
 create mode 100644 scripts/ci/setup/gitlab-runner.yml=0D
 create mode 100644 scripts/ci/setup/inventory=0D
 create mode 100644 scripts/ci/setup/vars.yml.template=0D
=0D
--=20=0D
2.25.4=0D
=0D


