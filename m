Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16504478330
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:32:33 +0100 (CET)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my32t-0003rH-MQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:32:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30F-00012N-Sq
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30C-0000Xm-Tl
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I/0sfDMAYWioTBd7DsT3bPtEJgR872iWkXaLYN8sQMo=;
 b=AbREIEgNE7OfRK1Is9E/zRyNkowBMVXEYZc8GLMDO/Cp3a+s+borPujpSBc1CkpAKQRkNf
 nMeQCovHPW0ZS6Vi0eqpEHi+MfN8XmJ/djBL9TeXkWWBYR/P8N4WrBy87Wj4dwZBjCdcCO
 aHq2zio9Oh3qCjLepS3fGkunD4nDSM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-Stdg7FRFO_eA_NSTKQtVZw-1; Thu, 16 Dec 2021 21:29:42 -0500
X-MC-Unique: Stdg7FRFO_eA_NSTKQtVZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF96D5F9CA;
 Fri, 17 Dec 2021 02:29:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90B122DF1;
 Fri, 17 Dec 2021 02:29:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/9] Python: Switch to externally hosted qemu.qmp
 dependency
Date: Thu, 16 Dec 2021 21:29:30 -0500
Message-Id: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20211215193939.3768033-1-jsnow@redhat.com>=0D
=0D
Hi, this series is part of an effort to publish the qemu.qmp package on=0D
PyPI. It is the last of three series to complete this work:=0D
=0D
    (1) Switch the new Async QMP library in to python/qemu/qmp=0D
    (2) Fork python/qemu/qmp out into its own repository,=0D
        with updated GitLab CI/CD targets to build packages.=0D
--> (3) Update qemu.git to install qemu.qmp from PyPI,=0D
        and then delete python/qemu/qmp.=0D
=0D
This series is meant to apply to qemu.git after the standalone=0D
repository for qemu.qmp is established and the library is uploaded to=0D
PyPI.=0D
=0D
However, I thought I'd share it now so that everyone can see what kind=0D
of work is involved post-split on the qemu.git end.=0D
=0D
RFC notes:=0D
=0D
- The version pinning and Pipenv patches will have to be redone later=0D
  with proper versions and checksums and so on, but this is a workable=0D
  example you can experiment with in the meantime.=0D
=0D
- The testenv.py changes to use a VENV could be bolstered even further=0D
  to use a checksum of requirements.txt to make that system a little bit=0D
  more robust, but I wanted to share the WIP draft to get some early=0D
  impressions.=0D
=0D
... And that's it! These three series complete the split and leave us=0D
with a published QMP library on PyPI.=0D
=0D
Happy New Years, everyone. See you in 2022 :)=0D
=0D
John Snow (9):=0D
  Python: Update mypy dependency to >=3D 0.780=0D
  Python: update isort dependency=0D
  scripts/qmp: Update 'qmp-shell' forwarder stub=0D
  scripts/qmp: update remaining forwarder stubs=0D
  scripts/qmp: delete qmp.py script stub=0D
  scripts: remove sys.path hacks for qemu/qemu.qmp=0D
  iotests/testenv: initialize an iotests venv=0D
  Python: delete qemu.qmp=0D
  (WIP) Python: update Pipfile=0D
=0D
 python/Pipfile.lock                    |  86 ++-=0D
 python/qemu/qmp/__init__.py            |  59 --=0D
 python/qemu/qmp/aqmp_tui.py            | 652 -----------------=0D
 python/qemu/qmp/error.py               |  50 --=0D
 python/qemu/qmp/events.py              | 717 -------------------=0D
 python/qemu/qmp/legacy.py              | 319 ---------=0D
 python/qemu/qmp/message.py             | 209 ------=0D
 python/qemu/qmp/models.py              | 146 ----=0D
 python/qemu/qmp/protocol.py            | 922 -------------------------=0D
 python/qemu/qmp/py.typed               |   0=0D
 python/qemu/qmp/qmp_client.py          | 655 ------------------=0D
 python/qemu/qmp/qmp_shell.py           | 537 --------------=0D
 python/qemu/qmp/util.py                | 217 ------=0D
 python/qemu/utils/qom_fuse.py          |   1 -=0D
 python/setup.cfg                       |  31 +-=0D
 python/tests/protocol.py               | 583 ----------------=0D
 scripts/device-crash-test              |  11 +-=0D
 scripts/qmp/qemu-ga-client             |  40 +-=0D
 scripts/qmp/qmp                        |  11 -=0D
 scripts/qmp/qmp-shell                  |  39 +-=0D
 scripts/qmp/qom-fuse                   |  40 +-=0D
 scripts/qmp/qom-get                    |  40 +-=0D
 scripts/qmp/qom-list                   |  40 +-=0D
 scripts/qmp/qom-set                    |  40 +-=0D
 scripts/qmp/qom-tree                   |  41 +-=0D
 scripts/render_block_graph.py          |  13 +-=0D
 scripts/simplebench/bench_block_job.py |  11 +-=0D
 tests/qemu-iotests/requirements.txt    |   3 +=0D
 tests/qemu-iotests/testenv.py          |  74 +-=0D
 29 files changed, 412 insertions(+), 5175 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/__init__.py=0D
 delete mode 100644 python/qemu/qmp/aqmp_tui.py=0D
 delete mode 100644 python/qemu/qmp/error.py=0D
 delete mode 100644 python/qemu/qmp/events.py=0D
 delete mode 100644 python/qemu/qmp/legacy.py=0D
 delete mode 100644 python/qemu/qmp/message.py=0D
 delete mode 100644 python/qemu/qmp/models.py=0D
 delete mode 100644 python/qemu/qmp/protocol.py=0D
 delete mode 100644 python/qemu/qmp/py.typed=0D
 delete mode 100644 python/qemu/qmp/qmp_client.py=0D
 delete mode 100644 python/qemu/qmp/qmp_shell.py=0D
 delete mode 100644 python/qemu/qmp/util.py=0D
 delete mode 100644 python/tests/protocol.py=0D
 delete mode 100755 scripts/qmp/qmp=0D
 create mode 100644 tests/qemu-iotests/requirements.txt=0D
=0D
--=20=0D
2.31.1=0D
=0D


