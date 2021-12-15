Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD5476443
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:09:05 +0100 (CET)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbWK-0002hV-CJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbV7-0001sc-16
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbV4-0006TU-QO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mApSt98ss/YebzUuXAdXjpsNINULVbDJE2wn8OAx2qQ=;
 b=Yi1G83IZUVnx6mrejRMI7pWoMQWj84fZGV4aZs96KItMh2ojzP10aSOSvnEF3O8sHQs6b3
 L34rRAY92m+3fPGVpcdBpe/q/DafpkeCPQst8CoqretXnSfFye/dkgsWUNVp+bxNgHDrx6
 q4yCeYomaBqg/sUXt/GZfLdxfQGRlgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-N7YXEuwjMFiexy0P6sBNIQ-1; Wed, 15 Dec 2021 16:07:41 -0500
X-MC-Unique: N7YXEuwjMFiexy0P6sBNIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818AB835E24;
 Wed, 15 Dec 2021 21:07:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B48095BE35;
 Wed, 15 Dec 2021 21:06:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 00/24] Python: Fork qemu.qmp Python lib into
 independent repo
Date: Wed, 15 Dec 2021 16:06:10 -0500
Message-Id: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series is part of an effort to publish the qemu.qmp package on=0D
PyPI. It is the second of three series to complete this work:=0D
=0D
    (1) Switch the new Async QMP library in to python/qemu/qmp=0D
--> (2) Fork python/qemu/qmp out into its own repository,=0D
        with updated GitLab CI/CD targets to build packages.=0D
    (3) Update qemu.git to install qemu.qmp from PyPI,=0D
        and then delete python/qemu/qmp.=0D
=0D
This series is not meant to apply to qemu.git, rather -- it's the series=0D
that performs the split and would apply to a brand new repository.=0D
=0D
I am submitting it to the QEMU mailing list for these reasons:=0D
=0D
(1) To more broadly announce my intentions, and as reference alongside=0D
series #1 and #3 detailed above.=0D
=0D
(2) To ask for permission to become the maintainer of a=0D
'qemu-project/qemu.qmp' repository, where I would like to host this=0D
subproject.=0D
=0D
(3) To ask for review on the README.rst file which details my intended=0D
contribution guidelines for this subproject.=0D
=0D
(4) To ask for review on the .gitlab-ci.d/ files and other repo-level=0D
CI/CD ephemera, including and especially the docs-building process.  I=0D
think the generated docs are still ugly, and I'd like to upload them to=0D
readthedocs, among other things -- hence the RFC quality of this series.=0D
=0D
Some review/RFC notes:=0D
=0D
- I use jsnow/qemu.qmp as the repo name throughout the series; that will=0D
  have to be changed eventually, but for the purposes of prototyping, it=0D
  was nicer to have a fully working series.=0D
=0D
- I'm planning on using gitlab issues and MRs for the subproject.=0D
=0D
- I plan to version this lib independently, starting at 0.0.1 for the=0D
  initial public release and bumping only the micro version for every=0D
  last release. I plan to bump the minor version once it hits a "beta"=0D
  state. There will be no cross-versioning against QEMU. I don't plan to=0D
  publish new releases during QEMU freezes.=0D
=0D
- Check out a completed pipeline here:=0D
  https://gitlab.com/jsnow/qemu.qmp/-/pipelines/430528258=0D
=0D
  It offers build artifacts, junit xml artifacts and GitLab=0D
  test-level-view into the avocado unit tests. The build container is=0D
  uploaded to GitLab's container registry and can be used to reproduce=0D
  potential build/packaging errors.=0D
=0D
  Every pipeline will produce built python packages and upload them to=0D
  the GitLab package repository, see=0D
  https://gitlab.com/jsnow/qemu.qmp/-/packages=0D
=0D
Known problems:=0D
=0D
- Sphinx output is still subjectively ugly, with too many layers of=0D
  nesting=0D
=0D
- Docs are not yet uploaded anywhere (GitLab pages, readthedocs?)=0D
=0D
- Tags on a commit trigger two pipelines; this causes one of the package=0D
  builds to fail as the version number will be duplicated in this=0D
  case. Not entirely sure how I want to fix this yet ...=0D
=0D
~ Happy Holidays ~, --js.=0D
=0D
John Snow (24):=0D
  Fork qemu.qmp from qemu.git=0D
  Update VERSION to 0.0.0a1=0D
  Update maintainer metadata=0D
  Update project description=0D
  Update project URLs=0D
  Move README.rst to INDEX.rst and update=0D
  Move PACKAGE.rst to README.rst and update=0D
  Update Pipfile.lock=0D
  Remove sub-dependency pins from Pipfile=0D
  Add build and test container to gitlab CI configuration=0D
  Add package build step to GitLab CI=0D
  GitLab CI: Add check-dco script=0D
  GitLab CI: Add pipenv and tox tests=0D
  GitLab CI: Add avocado junit XML output to tests=0D
  GitLab CI: Publish python packages to GitLab package repo=0D
  Add setuptools_scm package versioning=0D
  Makefile: add build and publish targets=0D
  add Sphinx documentation config stub=0D
  python: configure sphinx=0D
  python: adjust apidoc stubs=0D
  Fix doc cross-reference regressions=0D
  docs: add Makefile target=0D
  docs: add doc build to GitLab CI build step=0D
  v0.0.1=0D
=0D
 .gitignore                     |   2 +-=0D
 .gitlab-ci.d/build.yml         |  14 ++=0D
 .gitlab-ci.d/check-dco.py      |  98 ++++++++++=0D
 .gitlab-ci.d/containers.yml    |  28 +++=0D
 .gitlab-ci.d/index.yml         |  14 ++=0D
 .gitlab-ci.d/publish.yml       |  11 ++=0D
 .gitlab-ci.d/python.Dockerfile |  35 ++++=0D
 .gitlab-ci.d/test.yml          |  74 ++++++++=0D
 .gitlab-ci.yml                 |   3 +=0D
 INDEX.rst                      |  64 +++++++=0D
 MANIFEST.in                    |   4 +-=0D
 Makefile                       |  54 +++++-=0D
 PACKAGE.rst                    |  43 -----=0D
 Pipfile                        |   4 +-=0D
 Pipfile.lock                   | 314 ++++++++++++++++++---------------=0D
 README.rst                     | 219 ++++++++++++++---------=0D
 VERSION                        |   1 -=0D
 avocado.cfg                    |   7 +=0D
 docs/Makefile                  |  20 +++=0D
 docs/conf.py                   | 107 +++++++++++=0D
 docs/index.rst                 |  21 +++=0D
 docs/make.bat                  |  35 ++++=0D
 docs/qemu.qmp.error.rst        |   8 +=0D
 docs/qemu.qmp.events.rst       |   7 +=0D
 docs/qemu.qmp.legacy.rst       |   7 +=0D
 docs/qemu.qmp.message.rst      |   8 +=0D
 docs/qemu.qmp.models.rst       |   8 +=0D
 docs/qemu.qmp.protocol.rst     |   9 +=0D
 docs/qemu.qmp.qmp_client.rst   |   8 +=0D
 docs/qemu.qmp.rst              |  24 +++=0D
 docs/qemu.qmp.util.rst         |   8 +=0D
 qemu/qmp/legacy.py             |   4 +-=0D
 setup.cfg                      |  41 ++---=0D
 setup.py                       |  13 +-=0D
 34 files changed, 1000 insertions(+), 317 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/build.yml=0D
 create mode 100755 .gitlab-ci.d/check-dco.py=0D
 create mode 100644 .gitlab-ci.d/containers.yml=0D
 create mode 100644 .gitlab-ci.d/index.yml=0D
 create mode 100644 .gitlab-ci.d/publish.yml=0D
 create mode 100644 .gitlab-ci.d/python.Dockerfile=0D
 create mode 100644 .gitlab-ci.d/test.yml=0D
 create mode 100644 .gitlab-ci.yml=0D
 create mode 100644 INDEX.rst=0D
 delete mode 100644 PACKAGE.rst=0D
 delete mode 100644 VERSION=0D
 create mode 100644 docs/Makefile=0D
 create mode 100644 docs/conf.py=0D
 create mode 100644 docs/index.rst=0D
 create mode 100644 docs/make.bat=0D
 create mode 100644 docs/qemu.qmp.error.rst=0D
 create mode 100644 docs/qemu.qmp.events.rst=0D
 create mode 100644 docs/qemu.qmp.legacy.rst=0D
 create mode 100644 docs/qemu.qmp.message.rst=0D
 create mode 100644 docs/qemu.qmp.models.rst=0D
 create mode 100644 docs/qemu.qmp.protocol.rst=0D
 create mode 100644 docs/qemu.qmp.qmp_client.rst=0D
 create mode 100644 docs/qemu.qmp.rst=0D
 create mode 100644 docs/qemu.qmp.util.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


