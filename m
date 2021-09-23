Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC034154D6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:52:45 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCyi-0004CM-Db
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvt-0000wc-UP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCvq-0006E1-5S
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UF49pZQr/AL6S9DjWsyYbeciSPyHuti7anXxnQwO3Co=;
 b=OZ26D3QjB2++XjdH+E5ns8ZHBv4RoXfD11bogahgEXQB6o6KkYzAu8GSRUrwoeasnHHU3I
 cxgfpp+2KqIpireyBheQpxRiQKjI53mxwZNPkz+l/2elK2QToS+uDDr7e7D0+3Mucd0VGl
 Ay+b7bVJjRMRsy1UJOStFqjU3DyqjKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-cT9BfFGYPbGK8fQVqNR0xA-1; Wed, 22 Sep 2021 20:49:43 -0400
X-MC-Unique: cT9BfFGYPbGK8fQVqNR0xA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 105AE1084687;
 Thu, 23 Sep 2021 00:49:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A30160BF1;
 Thu, 23 Sep 2021 00:49:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] Switch iotests to using Async QMP
Date: Wed, 22 Sep 2021 20:49:21 -0400
Message-Id: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210915162955.333025-1-jsnow@redhat.com>=0D
          [PATCH v4 00/27] python: introduce Asynchronous QMP package=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/375637927=0D
=0D
Hiya,=0D
=0D
This series continues where the first AQMP series left off and adds a=0D
synchronous 'legacy' wrapper around the new AQMP interface, then drops=0D
it straight into iotests to prove that AQMP is functional and totally=0D
cool and fine. The disruption and churn to iotests is extremely minimal.=0D
(There's actually a net negative SLOC in tests/qemu-iotests.)=0D
=0D
In the event that a regression happens and I am not physically proximate=0D
to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable=0D
to any non-empty string as it pleases you to engage the QMP machinery=0D
you are used to.=0D
=0D
I'd like to try and get this committed early in the 6.2 development=0D
cycle to give ample time to smooth over any possible regressions. I've=0D
tested it locally and via gitlab CI, across Python versions 3.6 through=0D
3.10, and "worksforme". If something bad happens, we can revert the=0D
actual switch-flip very trivially.=0D
=0D
Layout:=0D
=0D
Patches 1-7: ./python/qemu/aqmp changes that serve as pre-requisites.=0D
Patches 8-12: other ./python changes that ease the transition.=0D
Patches 13-14: iotest changes to support the new QMP backend.=0D
Patches 15-17: Make the switch.=0D
=0D
V2:=0D
=0D
001/17:[----] [--] 'python/aqmp: add greeting property to QMPClient'=0D
002/17:[----] [--] 'python/aqmp: add .empty() method to EventListener'=0D
003/17:[----] [--] 'python/aqmp: Return cleared events from EventListener.c=
lear()'=0D
004/17:[0007] [FC] 'python/aqmp: add send_fd_scm'=0D
005/17:[down] 'python/aqmp: Add dict conversion method to Greeting object'=
=0D
006/17:[down] 'python/aqmp: Reduce severity of EOFError-caused loop termina=
tions'=0D
007/17:[down] 'python/aqmp: Disable logging messages by default'=0D
=0D
008/17:[0002] [FC] 'python/qmp: clear events on get_events() call'=0D
009/17:[----] [--] 'python/qmp: add send_fd_scm directly to QEMUMonitorProt=
ocol'=0D
010/17:[----] [--] 'python, iotests: remove socket_scm_helper'=0D
011/17:[0013] [FC] 'python/machine: remove has_quit argument'=0D
012/17:[down] 'python/machine: Handle QMP errors on close more meticulously=
'=0D
=0D
013/17:[0009] [FC] 'iotests: Accommodate async QMP Exception classes'=0D
014/17:[down] 'iotests: Conditionally silence certain AQMP errors'=0D
=0D
015/17:[0016] [FC] 'python/aqmp: Create sync QMP wrapper for iotests'=0D
016/17:[0002] [FC] 'python/aqmp: Remove scary message'=0D
017/17:[----] [--] 'python, iotests: replace qmp with aqmp'=0D
=0D
- Rebased on jsnow/python, which was recently rebased on origin/master.=0D
- Make aqmp's send_fd_scm method bark if the socket isn't AF_UNIX (Hanna)=
=0D
- Uh... modify send_fd_scm so it doesn't break when Python 3.11 comes out .=
..=0D
  See the commit message for more detail.=0D
- Drop the "python/aqmp: Create MessageModel and StandaloneModel class"=0D
  patch and replace with a far simpler method that just adds an=0D
  _asdict() method.=0D
- Add patches 06 and 07 to change how the AQMP library handles logging.=0D
- Adjust docstring in patch 08 (Hanna)=0D
- Rename "_has_quit" attribute to "_quid_issued" (Hanna)=0D
- Renamed patch 12, simplified the logic in _soft_shutdown a tiny bit.=0D
- Fixed bad exception handling logic in 13 (Hanna)=0D
- Introduce a helper in patch 14 to silence log output when it's unwanted.=
=0D
- Small addition of _get_greeting() helper in patch 15, coinciding with the=
=0D
  new patch 05 here.=0D
- Contextual changes in 16.=0D
=0D
John Snow (17):=0D
  python/aqmp: add greeting property to QMPClient=0D
  python/aqmp: add .empty() method to EventListener=0D
  python/aqmp: Return cleared events from EventListener.clear()=0D
  python/aqmp: add send_fd_scm=0D
  python/aqmp: Add dict conversion method to Greeting object=0D
  python/aqmp: Reduce severity of EOFError-caused loop terminations=0D
  python/aqmp: Disable logging messages by default=0D
  python/qmp: clear events on get_events() call=0D
  python/qmp: add send_fd_scm directly to QEMUMonitorProtocol=0D
  python, iotests: remove socket_scm_helper=0D
  python/machine: remove has_quit argument=0D
  python/machine: Handle QMP errors on close more meticulously=0D
  iotests: Accommodate async QMP Exception classes=0D
  iotests: Conditionally silence certain AQMP errors=0D
  python/aqmp: Create sync QMP wrapper for iotests=0D
  python/aqmp: Remove scary message=0D
  python, iotests: replace qmp with aqmp=0D
=0D
 tests/qemu-iotests/socket_scm_helper.c    | 136 ----------------------=0D
 python/qemu/aqmp/__init__.py              |  14 +--=0D
 python/qemu/aqmp/events.py                |  15 ++-=0D
 python/qemu/aqmp/legacy.py                | 135 +++++++++++++++++++++=0D
 python/qemu/aqmp/models.py                |  13 +++=0D
 python/qemu/aqmp/protocol.py              |   7 +-=0D
 python/qemu/aqmp/qmp_client.py            |  27 +++++=0D
 python/qemu/machine/machine.py            | 133 +++++++++++----------=0D
 python/qemu/machine/qtest.py              |   2 -=0D
 python/qemu/qmp/__init__.py               |  27 +++--=0D
 python/qemu/qmp/qmp_shell.py              |   1 -=0D
 scripts/simplebench/bench_block_job.py    |   3 +-=0D
 tests/Makefile.include                    |   1 -=0D
 tests/meson.build                         |   4 -=0D
 tests/qemu-iotests/040                    |   7 +-=0D
 tests/qemu-iotests/218                    |   2 +-=0D
 tests/qemu-iotests/255                    |   2 +-=0D
 tests/qemu-iotests/iotests.py             |  23 +++-=0D
 tests/qemu-iotests/meson.build            |   5 -=0D
 tests/qemu-iotests/testenv.py             |   8 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  12 +-=0D
 21 files changed, 315 insertions(+), 262 deletions(-)=0D
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c=0D
 create mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 tests/qemu-iotests/meson.build=0D
=0D
--=20=0D
2.31.1=0D
=0D


