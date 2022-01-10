Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1348A3BD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:37:32 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74EF-0000uL-Ve
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746T-0008J6-Hn
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746R-00087z-Fo
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NjzdbzDhs/tX2EsLViBzlNG2/hKKjLc3gev/Jjk1PIc=;
 b=ZDxEeowLSaKAAao8AZUINMixvKL7PgoIQLx0MGhl01bFapfXfXccWJE7x4elGMAcWedVdQ
 F27W8I4nw8aVYLpxx1O3vVx6FMyNgD9MyhudaWFxMD3YzoiemDY4zupljAbJO60nVA3AI7
 WpMx6DWlulAdvOqlNAmo5G11+ZJCAtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Sa8zmLqoPJaeZO4flhehOw-1; Mon, 10 Jan 2022 18:29:19 -0500
X-MC-Unique: Sa8zmLqoPJaeZO4flhehOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE891006AA5;
 Mon, 10 Jan 2022 23:29:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCA987B028;
 Mon, 10 Jan 2022 23:29:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/31] Python: delete synchronous qemu.qmp package
Date: Mon, 10 Jan 2022 18:28:39 -0500
Message-Id: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220110232521.1922962-1-jsnow@redhat.com>=0D
          (jsnow/python staging branch)=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/445163212=0D
=0D
Hi, this series is part of an effort to publish the qemu.qmp package on=0D
PyPI. It is the first of three series to complete this work:=0D
=0D
--> (1) Switch the new Async QMP library in to python/qemu/qmp=0D
    (2) Fork python/qemu/qmp out into its own repository,=0D
        with updated GitLab CI/CD targets to build packages.=0D
    (3) Update qemu.git to install qemu.qmp from PyPI,=0D
        and then delete python/qemu/qmp.=0D
=0D
This series swaps out qemu.qmp for qemu.aqmp permanently, instead of=0D
hiding it behind an environment variable toggle. This leaves us with=0D
just one QMP library to worry about. It also implements the rename of=0D
"qemu.aqmp" to "qemu.qmp".=0D
=0D
I suspect the most potential disruption to iotest and avocado=0D
maintainers, as those two subsystems rely on the QMP features the=0D
most. Would appreciate at least an ACK from each of those camps if=0D
you're willing to give benefit-of-the-doubt on the actual Python code.=0D
=0D
V3:=0D
 - Rebased on top of jsnow/python (For GitLab CI fixes)=0D
 - Added a new patch 001 to fix a typo Vladimir found.=0D
 - Tiny change in 006 due to the new patch 001=0D
 - Reworded subject of patch 007=0D
 - Changed import statement in patch 013 (Vladimir)=0D
 - Rebase-related changes in patch 021=0D
 - Removed 'aqmp' from internal variable names in 026=0D
 - Added new patch to rename aqmp-tui to qmp-tui in 027=0D
=0D
V2:=0D
 - Integrate the renaming of qemu.aqmp to qemu.qmp in this series=0D
 - Minor bits and pieces.=0D
=0D
John Snow (30):=0D
  python/aqmp: use absolute import statement=0D
  Python/aqmp: fix type definitions for mypy 0.920=0D
  python: update type hints for mypy 0.930=0D
  python/aqmp: fix docstring typo=0D
  python/aqmp: add __del__ method to legacy interface=0D
  python/aqmp: handle asyncio.TimeoutError on execute()=0D
  python/aqmp: copy type definitions from qmp=0D
  python/aqmp: add SocketAddrT to package root=0D
  python/aqmp: rename AQMPError to QMPError=0D
  python/qemu-ga-client: don't use deprecated CLI syntax in usage=0D
    comment=0D
  python/qmp: switch qemu-ga-client to AQMP=0D
  python/qmp: switch qom tools to AQMP=0D
  python/qmp: switch qmp-shell to AQMP=0D
  python: move qmp utilities to python/qemu/utils=0D
  python: move qmp-shell under the AQMP package=0D
  python/machine: permanently switch to AQMP=0D
  scripts/cpu-x86-uarch-abi: fix CLI parsing=0D
  scripts/cpu-x86-uarch-abi: switch to AQMP=0D
  scripts/render-block-graph: switch to AQMP=0D
  scripts/bench-block-job: switch to AQMP=0D
  iotests/mirror-top-perms: switch to AQMP=0D
  iotests: switch to AQMP=0D
  python: temporarily silence pylint duplicate-code warnings=0D
  python/aqmp: take QMPBadPortError and parse_address from qemu.qmp=0D
  python/aqmp: fully separate from qmp.QEMUMonitorProtocol=0D
  python/aqmp: copy qmp docstrings to qemu.aqmp.legacy=0D
  python: remove the old QMP package=0D
  python: re-enable pylint duplicate-code warnings=0D
  python: rename qemu.aqmp to qemu.qmp=0D
  python: rename 'aqmp-tui' to 'qmp-tui'=0D
=0D
Stefan Weil (1):=0D
  simplebench: Fix Python syntax error (reported by LGTM)=0D
=0D
 python/qemu/qmp/README.rst                    |   9 -=0D
 python/qemu/aqmp/__init__.py                  |  51 --=0D
 python/qemu/aqmp/legacy.py                    | 138 ------=0D
 python/qemu/aqmp/py.typed                     |   0=0D
 python/qemu/machine/machine.py                |  18 +-=0D
 python/qemu/machine/qtest.py                  |   2 +-=0D
 python/qemu/qmp/__init__.py                   | 441 ++----------------=0D
 python/qemu/{aqmp =3D> qmp}/error.py            |  12 +-=0D
 python/qemu/{aqmp =3D> qmp}/events.py           |   6 +-=0D
 python/qemu/qmp/legacy.py                     | 319 +++++++++++++=0D
 python/qemu/{aqmp =3D> qmp}/message.py          |   0=0D
 python/qemu/{aqmp =3D> qmp}/models.py           |   0=0D
 python/qemu/{aqmp =3D> qmp}/protocol.py         |  33 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_client.py       |  32 +-=0D
 python/qemu/qmp/qmp_shell.py                  |  31 +-=0D
 .../qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} |  14 +-=0D
 python/qemu/{aqmp =3D> qmp}/util.py             |   0=0D
 python/qemu/{qmp =3D> utils}/qemu_ga_client.py  |  24 +-=0D
 python/qemu/{qmp =3D> utils}/qom.py             |   5 +-=0D
 python/qemu/{qmp =3D> utils}/qom_common.py      |   9 +-=0D
 python/qemu/{qmp =3D> utils}/qom_fuse.py        |  11 +-=0D
 python/setup.cfg                              |  23 +-=0D
 python/tests/protocol.py                      |  14 +-=0D
 scripts/cpu-x86-uarch-abi.py                  |   7 +-=0D
 scripts/device-crash-test                     |   4 +-=0D
 scripts/qmp/qemu-ga-client                    |   2 +-=0D
 scripts/qmp/qom-fuse                          |   2 +-=0D
 scripts/qmp/qom-get                           |   2 +-=0D
 scripts/qmp/qom-list                          |   2 +-=0D
 scripts/qmp/qom-set                           |   2 +-=0D
 scripts/qmp/qom-tree                          |   2 +-=0D
 scripts/render_block_graph.py                 |   8 +-=0D
 scripts/simplebench/bench-example.py          |   2 +-=0D
 scripts/simplebench/bench_block_job.py        |   5 +-=0D
 tests/qemu-iotests/iotests.py                 |   2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |  13 +-=0D
 36 files changed, 502 insertions(+), 743 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/README.rst=0D
 delete mode 100644 python/qemu/aqmp/__init__.py=0D
 delete mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 python/qemu/aqmp/py.typed=0D
 rename python/qemu/{aqmp =3D> qmp}/error.py (87%)=0D
 rename python/qemu/{aqmp =3D> qmp}/events.py (99%)=0D
 create mode 100644 python/qemu/qmp/legacy.py=0D
 rename python/qemu/{aqmp =3D> qmp}/message.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/models.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/protocol.py (97%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_client.py (96%)=0D
 rename python/qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} (98%)=0D
 rename python/qemu/{aqmp =3D> qmp}/util.py (100%)=0D
 rename python/qemu/{qmp =3D> utils}/qemu_ga_client.py (94%)=0D
 rename python/qemu/{qmp =3D> utils}/qom.py (99%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_common.py (95%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_fuse.py (97%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


