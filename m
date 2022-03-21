Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80B4E3229
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:11:06 +0100 (CET)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPIv-0005Ux-NE
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:11:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGp-0002Jh-Eu
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGl-0006OI-Jk
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647896931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+GeWSByHdozOmEfAcyiCBg7rYPSKuyCtrHH9Uk53icA=;
 b=d9aayJz2TjKByOAbnDmRZwlZw/OjuvWk4HBCQuY3EnR/JM4zJbrx8pGjQvVTDK3hE4VmN7
 kk18qBKYXYlRJ+Sc6yPLfEPUAe/1BjILc5wacEMNe5YYrS2IsN4GiYZaifHiNXGfgu2l06
 acvV2UTjTOIsfMn6v2uQvZ/fbQ5Gp+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-vg92NfR-PFGkZ2Pptz_d3w-1; Mon, 21 Mar 2022 17:08:48 -0400
X-MC-Unique: vg92NfR-PFGkZ2Pptz_d3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F62F801585;
 Mon, 21 Mar 2022 21:08:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC5261121314;
 Mon, 21 Mar 2022 21:08:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Python: Remove synchronous QMP library
Date: Mon, 21 Mar 2022 17:08:37 -0400
Message-Id: <20220321210847.914787-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-On: <20220321203315.909411-1-jsnow@redhat.com>=0D
GitLab: https://gitlab.com/jsnow/qemu/-/tree/python-qmp-legacy-switch-pt1c=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/497561638=0D
=0D
This series finalizes swapping out the old QMP library for the new=0D
one. It's been through about two release cycles now, it's time.=0D
=0D
John Snow (10):=0D
  python/aqmp: add explicit GPLv2 license to legacy.py=0D
  python/aqmp: relicense as GPLv2+=0D
  python: temporarily silence pylint duplicate-code warnings=0D
  python/aqmp: take QMPBadPortError and parse_address from qemu.qmp=0D
  python/aqmp: fully separate from qmp.QEMUMonitorProtocol=0D
  python/aqmp: copy qmp docstrings to qemu.aqmp.legacy=0D
  python: remove the old QMP package=0D
  python: re-enable pylint duplicate-code warnings=0D
  python: rename qemu.aqmp to qemu.qmp=0D
  python: rename 'aqmp-tui' to 'qmp-tui'=0D
=0D
 python/README.rst                             |   2 +-=0D
 python/qemu/qmp/README.rst                    |   9 -=0D
 python/qemu/aqmp/__init__.py                  |  59 ---=0D
 python/qemu/aqmp/legacy.py                    | 177 -------=0D
 python/qemu/aqmp/py.typed                     |   0=0D
 python/qemu/machine/machine.py                |   4 +-=0D
 python/qemu/machine/qtest.py                  |   2 +-=0D
 python/qemu/qmp/__init__.py                   | 445 ++----------------=0D
 python/qemu/{aqmp =3D> qmp}/error.py            |   0=0D
 python/qemu/{aqmp =3D> qmp}/events.py           |   2 +-=0D
 python/qemu/qmp/legacy.py                     | 321 +++++++++++++=0D
 python/qemu/{aqmp =3D> qmp}/message.py          |   0=0D
 python/qemu/{aqmp =3D> qmp}/models.py           |   0=0D
 python/qemu/{aqmp =3D> qmp}/protocol.py         |   4 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_client.py       |  16 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_shell.py        |   4 +-=0D
 .../qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} |  15 +-=0D
 python/qemu/{aqmp =3D> qmp}/util.py             |   0=0D
 python/qemu/utils/qemu_ga_client.py           |   4 +-=0D
 python/qemu/utils/qom.py                      |   2 +-=0D
 python/qemu/utils/qom_common.py               |   4 +-=0D
 python/qemu/utils/qom_fuse.py                 |   2 +-=0D
 python/setup.cfg                              |  11 +-=0D
 python/tests/protocol.py                      |  14 +-=0D
 scripts/cpu-x86-uarch-abi.py                  |   2 +-=0D
 scripts/device-crash-test                     |   4 +-=0D
 scripts/qmp/qmp-shell                         |   2 +-=0D
 scripts/qmp/qmp-shell-wrap                    |   2 +-=0D
 scripts/render_block_graph.py                 |   4 +-=0D
 scripts/simplebench/bench_block_job.py        |   2 +-=0D
 tests/qemu-iotests/iotests.py                 |   2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   2 +-=0D
 32 files changed, 414 insertions(+), 703 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/README.rst=0D
 delete mode 100644 python/qemu/aqmp/__init__.py=0D
 delete mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 python/qemu/aqmp/py.typed=0D
 rename python/qemu/{aqmp =3D> qmp}/error.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/events.py (99%)=0D
 create mode 100644 python/qemu/qmp/legacy.py=0D
 rename python/qemu/{aqmp =3D> qmp}/message.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/models.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/protocol.py (99%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_client.py (97%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_shell.py (99%)=0D
 rename python/qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} (98%)=0D
 rename python/qemu/{aqmp =3D> qmp}/util.py (100%)=0D
=0D
--=20=0D
2.34.1=0D
=0D


