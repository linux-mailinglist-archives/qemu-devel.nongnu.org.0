Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC385476208
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:44:31 +0100 (CET)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaCU-0005ig-GN
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxa92-0002tP-4n
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:40:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxa90-0004sE-Dp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6VcyktNlq8PuzUYtc8I+BPmTzf9mMvsL9FCnICqnMcQ=;
 b=KVerFYI1po4YdvQZSwcEPLCMXBPGD85qgNYzYXeXB2XeELYu3r1gS/TW2/7UZXq0UQKKBu
 W1ZXibC+mEUvygihb56ZADgAjzM3kMtucBKWbJzDFOYh/P4hdtfEcIGUcfVQzbvJ9oiupz
 /ljN3gF6f/1b1/F1xTcyPdjIe0mrUqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-wCOYVzniPLymSpkwER6Jqw-1; Wed, 15 Dec 2021 14:40:50 -0500
X-MC-Unique: wCOYVzniPLymSpkwER6Jqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBCC5100C660;
 Wed, 15 Dec 2021 19:40:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D637710074FD;
 Wed, 15 Dec 2021 19:39:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/25] Python: delete synchronous qemu.qmp package
Date: Wed, 15 Dec 2021 14:39:14 -0500
Message-Id: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/430491195=0D
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
Who should review what?=0D
  - iotests/block maintainers (Hanna, Vladimir, and Kevin):=0D
    please look at patches 15-18.=0D
  - Dan, please glance at patches 13-14.=0D
  - Anyone who cares about Python: whatever you're willing to=0D
    stomach. We're recently down Willian and Eduardo, so there's not=0D
    many dedicated Python reviewers...=0D
=0D
I suspect the most potential disruption to iotest and avocado=0D
maintainers, as those two subsystems rely on the QMP features the=0D
most. Would appreciate at least an ACK from each of those camps if=0D
you're willing to give benefit-of-the-doubt on the actual Python code.=0D
=0D
V2:=0D
 - Integrate the renaming of qemu.aqmp to qemu.qmp in this series=0D
 - Minor bits and pieces.=0D
=0D
John Snow (25):=0D
  python/aqmp: add __del__ method to legacy interface=0D
  python/aqmp: handle asyncio.TimeoutError on execute()=0D
  python/aqmp: copy type definitions from qmp=0D
  python/aqmp: add SocketAddrT to package root=0D
  python/aqmp: rename AQMPError to QMPError=0D
  python/qemu-ga-client: update instructions to newer CLI syntax=0D
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
=0D
 python/qemu/qmp/README.rst                   |   9 -=0D
 python/qemu/aqmp/__init__.py                 |  51 ---=0D
 python/qemu/aqmp/legacy.py                   | 138 ------=0D
 python/qemu/aqmp/py.typed                    |   0=0D
 python/qemu/machine/machine.py               |  18 +-=0D
 python/qemu/machine/qtest.py                 |   2 +-=0D
 python/qemu/qmp/__init__.py                  | 441 ++-----------------=0D
 python/qemu/{aqmp =3D> qmp}/aqmp_tui.py        |   2 +-=0D
 python/qemu/{aqmp =3D> qmp}/error.py           |  12 +-=0D
 python/qemu/{aqmp =3D> qmp}/events.py          |   6 +-=0D
 python/qemu/qmp/legacy.py                    | 319 ++++++++++++++=0D
 python/qemu/{aqmp =3D> qmp}/message.py         |   0=0D
 python/qemu/{aqmp =3D> qmp}/models.py          |   0=0D
 python/qemu/{aqmp =3D> qmp}/protocol.py        |  28 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_client.py      |  32 +-=0D
 python/qemu/qmp/qmp_shell.py                 |  31 +-=0D
 python/qemu/{aqmp =3D> qmp}/util.py            |   0=0D
 python/qemu/{qmp =3D> utils}/qemu_ga_client.py |  24 +-=0D
 python/qemu/{qmp =3D> utils}/qom.py            |   5 +-=0D
 python/qemu/{qmp =3D> utils}/qom_common.py     |   3 +-=0D
 python/qemu/{qmp =3D> utils}/qom_fuse.py       |  11 +-=0D
 python/setup.cfg                             |  21 +-=0D
 python/tests/protocol.py                     |  14 +-=0D
 scripts/cpu-x86-uarch-abi.py                 |   7 +-=0D
 scripts/device-crash-test                    |   4 +-=0D
 scripts/qmp/qemu-ga-client                   |   2 +-=0D
 scripts/qmp/qom-fuse                         |   2 +-=0D
 scripts/qmp/qom-get                          |   2 +-=0D
 scripts/qmp/qom-list                         |   2 +-=0D
 scripts/qmp/qom-set                          |   2 +-=0D
 scripts/qmp/qom-tree                         |   2 +-=0D
 scripts/render_block_graph.py                |   8 +-=0D
 scripts/simplebench/bench_block_job.py       |   5 +-=0D
 tests/qemu-iotests/iotests.py                |   2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms    |  13 +-=0D
 35 files changed, 490 insertions(+), 728 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/README.rst=0D
 delete mode 100644 python/qemu/aqmp/__init__.py=0D
 delete mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 python/qemu/aqmp/py.typed=0D
 rename python/qemu/{aqmp =3D> qmp}/aqmp_tui.py (99%)=0D
 rename python/qemu/{aqmp =3D> qmp}/error.py (87%)=0D
 rename python/qemu/{aqmp =3D> qmp}/events.py (99%)=0D
 create mode 100644 python/qemu/qmp/legacy.py=0D
 rename python/qemu/{aqmp =3D> qmp}/message.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/models.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/protocol.py (97%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_client.py (96%)=0D
 rename python/qemu/{aqmp =3D> qmp}/util.py (100%)=0D
 rename python/qemu/{qmp =3D> utils}/qemu_ga_client.py (94%)=0D
 rename python/qemu/{qmp =3D> utils}/qom.py (99%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_common.py (98%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_fuse.py (97%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


