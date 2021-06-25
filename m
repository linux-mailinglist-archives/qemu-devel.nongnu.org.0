Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65F3B482C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:24:41 +0200 (CEST)
Received: from localhost ([::1]:45672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpZI-0003SB-Cx
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpXC-0001Yr-2H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpX9-00024f-Br
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624641745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+LDWtmArDb3ThSwYAO8uSeJffUZnwTUFeEKJQrWDBk=;
 b=Lrqudc/8xGbnLj2X7RVTV8atxx2/tm4tins8LzdNgnIRfOVRYx+F/QCgOEdt3Iqumlqj10
 1AGpN1oiywEbTJ/nIlXVDxP8GMfMNJhxKbkqcMOLJZslkp7yvj44jnWqKcwR8bbJcG/4Fo
 g9xJvACy/lCUcsO0ON1q1j2UnrjpfW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-fycCa_8AM9-zd5N_VYWqaw-1; Fri, 25 Jun 2021 13:22:22 -0400
X-MC-Unique: fycCa_8AM9-zd5N_VYWqaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497701835AC4;
 Fri, 25 Jun 2021 17:22:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-183.ams2.redhat.com
 [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BAC91007623;
 Fri, 25 Jun 2021 17:22:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] ci: use cirrus-run to utilize Cirrus CI from GitLab CI
Date: Fri, 25 Jun 2021 18:22:08 +0100
Message-Id: <20210625172211.451010-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the Cirrus CI pipelines are completely separate from the=0D
GitLab CI pipelines. This means contributors/maintainers have to=0D
monitor two distinct places.=0D
=0D
This series uses the 'cirrus-run' tool from within a GitLab CI job=0D
to invoke a Cirrus CI job. Effectively Cirrus CI becomes a custom=0D
runner for GitLab in this way.=0D
=0D
The GitLab CI pipeline nows shows a complete picture for CI results=0D
covering GitLab, Travis and Cirrus jobs.=0D
=0D
The implementation used here is a direct copy of what is done in=0D
libvirt with cirrus-run. In fact the jobs are using the container=0D
image published by https://gitlab.com/libvirt/libvirt-ci for=0D
getting the 'cirrus-run' tool.=0D
=0D
Second, we use the 'lcitool' program to generate the=0D
.gitlab-ci.d/cirrus/*.vars files which hold the package lists to=0D
be installed on FreeBSD and macOS. As a result of the work done=0D
with lcitool to generate the dockerfiles, this was easy to extend=0D
to Cirrus CI, and as a result this new Cirrus config installs a=0D
massively larger set of packages. Thus our testing coverage on=0D
macOS and FreeBSD improves.=0D
=0D
The MSys Windows job still remains in the .cirrus.yml file. This=0D
can be addressed to, if we extend libvirt-ci to have package=0D
mapping information for MSys.=0D
=0D
Using this setup does require the contributor to do a one time=0D
configuration task. They need to modify gitlab CI settings to=0D
add two environment variables, providing the API token for the=0D
Cirrus CI REST API.=0D
=0D
I have a demo pipeline here showing the 4 cirrus CI jobs:=0D
=0D
  https://gitlab.com/berrange/qemu/-/pipelines/327362404=0D
=0D
Note in this pipeline above, I temporarily disabled all the=0D
normal GitLab CI jobs to reduce burden when I was debugging.=0D
An earlier pipeline shows the full set of jobs:=0D
=0D
  https://gitlab.com/berrange/qemu/-/pipelines/327324780=0D
=0D
This series adds cirrus as always on jobs, but we should probably=0D
use 'allow_failure: true' for a few weeks to demonstrate that=0D
they are stable enough to be part of the main gating set.=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  build: validate that system capstone works before using it=0D
  gitlab: support for FreeBSD 12, 13 and macOS 11 via cirrus-run=0D
  cirrus: delete FreeBSD and macOS jobs=0D
=0D
 .cirrus.yml                         |  55 ---------------=0D
 .gitlab-ci.d/cirrus.yml             | 103 ++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/cirrus/README.rst      |  54 +++++++++++++++=0D
 .gitlab-ci.d/cirrus/build.yml       |  35 ++++++++++=0D
 .gitlab-ci.d/cirrus/freebsd-12.vars |  13 ++++=0D
 .gitlab-ci.d/cirrus/freebsd-13.vars |  13 ++++=0D
 .gitlab-ci.d/cirrus/macos-11.vars   |  15 ++++=0D
 .gitlab-ci.d/qemu-project.yml       |   1 +=0D
 meson.build                         |  13 ++++=0D
 9 files changed, 247 insertions(+), 55 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/cirrus.yml=0D
 create mode 100644 .gitlab-ci.d/cirrus/README.rst=0D
 create mode 100644 .gitlab-ci.d/cirrus/build.yml=0D
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars=0D
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars=0D
 create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars=0D
=0D
--=20=0D
2.31.1=0D
=0D


