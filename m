Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4750BFF5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:52:14 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyO5-0002uM-Em
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLj-0000SX-Ff
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLg-0007si-Kr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pSemd3IzH0dhkbEE6Wb3688wVML1EjSqvnwyF8sf3AQ=;
 b=Eumi7MvrR2qs2jMWRRh6/jBstVYZUS3hwIUkSyV/DXPGOrdiATstN+GNs1NsF5DaaWDyi9
 3DXuwY4gtL+sHQVSOYZcMgBwJ7FixVqmgN2bo4XthwqoQP5cl/ZnWhUuVg8N2WD4+sAaL6
 v/b8Hwv9zwBYpg2Gvj5fc2OjzQddzNc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-YLoJS2T3Nc64kM1gOTxBUw-1; Fri, 22 Apr 2022 14:49:41 -0400
X-MC-Unique: YLoJS2T3Nc64kM1gOTxBUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58CA03C172CB
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17E8D145BEF8;
 Fri, 22 Apr 2022 18:49:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 00/12] python: fork qemu.qmp python lib into
 independent repo
Date: Fri, 22 Apr 2022 14:49:28 -0400
Message-Id: <20220422184940.1763958-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu.qmp/-/commits/initial-checkin=0D
=0D
Hi, this series is part of an effort to publish the qemu.qmp package on=0D
PyPI. It is part of the second of three phases to complete this work:=0D
=0D
    (1) Switch the new Async QMP library in to python/qemu/qmp [merged!]=0D
    (2) Fork python/qemu/qmp out into its own repository.=0D
-->    (2a) Do the bare minimum to be consistent.=0D
       (2b) Add most GitLab CI/CD targets.=0D
       (2c) Add Sphinx doc builds, update docs, and publish to GitLab pages=
.=0D
       (2d) Add dynamic git versioning and GitLab package builds.=0D
    (3) Update qemu.git to install qemu.qmp from PyPI,=0D
        and then delete python/qemu/qmp.=0D
=0D
This series is not meant to apply to qemu.git, rather -- it's the series=0D
that performs the split and applies to the brand new repository.=0D
=0D
If there are no objections, I intend to push the content of this branch=0D
to https://gitlab.com/qemu-project/python-qemu-qmp within a week or so.=0D
=0D
Most URLs in this series have been updated to point to the new repo URL,=0D
except one link to https://jsnow.gitlab.io/qemu.qmp/ which will be=0D
updated when step (2c) above is handled.=0D
=0D
John Snow (12):=0D
  fork qemu.qmp from qemu.git=0D
  update maintainer metadata=0D
  update project description=0D
  update project URLs=0D
  add a couple new trove classifiers=0D
  move README.rst to FILES.rst and update=0D
  move PACKAGE.rst to README.rst and update=0D
  docs: add versioning policy to README=0D
  add LGPLv2+ and GPLv2 LICENSE files=0D
  update Pipfile=0D
  remove sub-dependency pins from Pipfile=0D
  update VERSION to 0.0.0a1=0D
=0D
 .gitignore            |   2 +-=0D
 FILES.rst             |  67 ++++++=0D
 LICENSE               | 481 ++++++++++++++++++++++++++++++++++++++++++=0D
 LICENSE_GPL2          | 339 +++++++++++++++++++++++++++++=0D
 MANIFEST.in           |   3 +-=0D
 Makefile              |  16 +-=0D
 PACKAGE.rst           |  43 ----=0D
 Pipfile               |   4 +-=0D
 Pipfile.lock          | 288 ++++++++++++++-----------=0D
 README.rst            | 272 ++++++++++++++++--------=0D
 VERSION               |   2 +-=0D
 qemu/qmp/__init__.py  |   2 +-=0D
 qemu/qmp/legacy.py    |   2 +-=0D
 qemu/qmp/qmp_shell.py |   2 +-=0D
 qemu/qmp/qmp_tui.py   |   2 +-=0D
 setup.cfg             |  41 ++--=0D
 setup.py              |   2 +-=0D
 17 files changed, 1262 insertions(+), 306 deletions(-)=0D
 create mode 100644 FILES.rst=0D
 create mode 100644 LICENSE=0D
 create mode 100644 LICENSE_GPL2=0D
 delete mode 100644 PACKAGE.rst=0D
=0D
-- =0D
2.34.1=0D
=0D


