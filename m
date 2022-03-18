Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC714DE2B0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:42:18 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJQP-0002h3-4R
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:42:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0002GG-Df
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLH-0005VS-1j
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CYf1ySiwDc/HTh6r1Py76kHyELYMIXTmM0btF7ussdk=;
 b=LjmyF0Amwz8h9wMApZaAExDuTs6VJanh2FSb1HHzF2e00dSNyi7sDPN48nIWtmKt2g6AqI
 k7iGaBn6P4HSbjudNet1biJU+m1Z5rbVOww72I86NPJX2gzH2AmM7YKaTpZRvTAZ1K/o0k
 AFtVHBI+DostPT2jLAomHaPePMIdgdA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-2V-q5hL6PHumsIB_quTP0w-1; Fri, 18 Mar 2022 16:36:56 -0400
X-MC-Unique: 2V-q5hL6PHumsIB_quTP0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B939E1C05ED4;
 Fri, 18 Mar 2022 20:36:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78973403373;
 Fri, 18 Mar 2022 20:36:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] iotests: add enhanced debugging info to qemu-io failures
Date: Fri, 18 Mar 2022 16:36:40 -0400
Message-Id: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Howdy,=0D
=0D
This series does for qemu_io() what we've done for qemu_img() and makes=0D
this a function that checks the return code by default and raises an=0D
Exception when things do not go according to plan.=0D
=0D
This series removes qemu_io_pipe_and_status(), qemu_io_silent(), and=0D
qemu_io_silent_check() in favor of just qemu_io().=0D
=0D
RFC:=0D
=0D
- There are a few remaining uses of qemu-io that don't go through qemu_io;=
=0D
QemuIoInteractive is a user that is used in 205, 298, 299, and 307. It=0D
... did not appear worth it to morph qemu_tool_popen into something that=0D
could be used by both QemuIoInteractive *and* qemu_io(), so I left it=0D
alone. It's probably fine for now. (But it does bother me, a little.)=0D
=0D
- qemu_io_popen itself is used by the nbd-reconnect-on-open test, and it=0D
seems like a legitimate use -- it wants concurrency. Like the above=0D
problem, I couldn't find a way to bring it into the fold, so I=0D
didn't. (Meh.) I eventually plan to add asyncio subprocess management to=0D
machine.py, and I could tackle stuff like this then. It's not worth it=0D
now.=0D
=0D
- Several patches in this patchset ("fixup" in the title) are designed to=
=0D
be merged-on-commit. I know that's not usually how we do things, but I=0D
thought it was actually nicer than pre-squashing it because it gives me=0D
more flexibility on re-spin.=0D
=0D
- Uh, actually, test 040 fails with this patchset and I don't understand=0D
  if it's intentional, harmless, a test design problem, or worse:=0D
=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
ERROR: test_filterless_commit (__main__.TestCommitWithFilters)=0D
----------------------------------------------------------------------=0D
Traceback (most recent call last):=0D
  File "/home/jsnow/src/qemu/tests/qemu-iotests/040", line 822, in tearDown=
=0D
    self.do_test_io('read')=0D
  File "/home/jsnow/src/qemu/tests/qemu-iotests/040", line 751, in do_test_=
io=0D
    qemu_io('-f', iotests.imgfmt,=0D
  File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 365, in q=
emu_io=0D
    return qemu_tool(*qemu_io_wrap_args(args),=0D
  File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 242, in q=
emu_tool=0D
    raise VerboseProcessError(=0D
=0D
qemu.utils.VerboseProcessError: Command=0D
  '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',=0D
  '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',=0D
  'read -P 4 3M 1M',=0D
  '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'=0D
  returned non-zero exit status 1.=0D
  =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=0D
  =E2=94=83 qemu-io: can't open device=0D
  =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img:=
=0D
  =E2=94=83 Could not open backing file: Could not open backing file: Throt=
tle=0D
  =E2=94=83 group 'tg' does not exist=0D
  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=0D
=0D
It looks like we start with the img chain 3->2->1->0, then we commit 2=0D
down into 1, but checking '3' fails somewhere in the backing=0D
chain. Maybe a real bug?=0D
=0D
John Snow (15):=0D
  iotests: replace calls to log(qemu_io(...)) with qemu_io_log()=0D
  iotests/163: Fix broken qemu-io invocation=0D
  iotests: Don't check qemu_io() output for specific error strings=0D
  iotests/040: Don't check image pattern on zero-length image=0D
  iotests: create generic qemu_tool() function=0D
  iotests: rebase qemu_io() on top of qemu_tool()=0D
  iotests/030: fixup=0D
  iotests/149: fixup=0D
  iotests/205: fixup=0D
  iotests/245: fixup=0D
  iotests/migration-permissions: fixup=0D
  iotests/migration-permissions: use assertRaises() for qemu_io()=0D
    negative test=0D
  iotests: remove qemu_io_pipe_and_status()=0D
  iotests: remove qemu_io_silent() and qemu_io_silent_check().=0D
  iotests: make qemu_io_log() check return codes by default=0D
=0D
 tests/qemu-iotests/030                        | 85 +++++++++++--------=0D
 tests/qemu-iotests/040                        | 47 +++++-----=0D
 tests/qemu-iotests/056                        |  2 +-=0D
 tests/qemu-iotests/149                        |  6 +-=0D
 tests/qemu-iotests/163                        |  5 +-=0D
 tests/qemu-iotests/205                        |  4 +-=0D
 tests/qemu-iotests/216                        | 12 +--=0D
 tests/qemu-iotests/218                        |  5 +-=0D
 tests/qemu-iotests/224                        |  4 +-=0D
 tests/qemu-iotests/242                        |  4 +-=0D
 tests/qemu-iotests/245                        |  2 +-=0D
 tests/qemu-iotests/255                        |  4 +-=0D
 tests/qemu-iotests/258                        | 12 +--=0D
 tests/qemu-iotests/298                        | 16 ++--=0D
 tests/qemu-iotests/303                        |  4 +-=0D
 tests/qemu-iotests/310                        | 22 ++---=0D
 tests/qemu-iotests/iotests.py                 | 74 ++++++++--------=0D
 tests/qemu-iotests/tests/image-fleecing       | 14 +--=0D
 .../qemu-iotests/tests/migration-permissions  | 28 +++---=0D
 .../tests/mirror-ready-cancel-error           |  2 +-=0D
 .../qemu-iotests/tests/nbd-reconnect-on-open  |  2 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |  4 +-=0D
 22 files changed, 184 insertions(+), 174 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


