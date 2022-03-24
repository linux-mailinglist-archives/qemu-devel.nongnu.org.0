Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C660C4E68D6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:47:01 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSU8-0008WS-Qp
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:47:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSED-0000Dd-W1
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSE8-0005b6-8V
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ujNBzYeM06P8DwrtucEd2RrdFtL6/O4aD8QYIlm6Oog=;
 b=Ohee1zmpbxpol4ccqqgbh3Jevfkoij7hqNSEt1ke2Uielbr+OwPgoCU/M1kNUhv9D5Xvmh
 QUiT3MJwlS/ByY0gAJaG64I+ALSekd8NcUtcfAqqUcP5ywYHVwAuBGdOQgYUNQOFcMdLic
 Xg54ISC4umytpRPz0GAFwmSR+3u02mM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-8m2Xny6rMcq5zCYvXGoZNA-1; Thu, 24 Mar 2022 14:30:20 -0400
X-MC-Unique: 8m2Xny6rMcq5zCYvXGoZNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877763801ED2;
 Thu, 24 Mar 2022 18:30:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93C9DC26EA0;
 Thu, 24 Mar 2022 18:30:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] iotests: add enhanced debugging info to qemu-io
 failures
Date: Thu, 24 Mar 2022 14:30:01 -0400
Message-Id: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

GitLab: https://gitlab.com/jsnow/qemu/-/commits/iotests_qemu_io_diagnostics=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/499624472=0D
=0D
Howdy,=0D
=0D
This series does for qemu_io() what we've done for qemu_img() and makes=0D
it a function that checks the return code by default and raises an=0D
Exception when things do not go according to plan.=0D
=0D
This series removes qemu_io_pipe_and_status(), qemu_io_silent(), and=0D
qemu_io_silent_check() in favor of just qemu_io().=0D
=0D
V2:=0D
=0D
- Fixed 040=0D
- Fixed 245 on tmpfs=0D
- Fixed tests/image-fleecing=0D
=0D
- I expect to respin a v3 to:=0D
  (A) Fix the commit message on the 040 fix=0D
  (B) Squash patches 7-12.=0D
=0D
001/17:[0004] [FC] 'iotests: replace calls to log(qemu_io(...)) with qemu_i=
o_log()'=0D
  rebased on master, changed imports.=0D
  Kept RB from Eric.=0D
=0D
005/17:[down] 'iotests/040: Fix TestCommitWithFilters test'=0D
  New patch, based on feedback from hreitz. Thank you ;_;=0D
=0D
006/17:[0013] [FC] 'iotests: create generic qemu_tool() function'=0D
  Quoted return types (Needed for older Python versions)=0D
  Changed phrasing of "args" param docstring (Hanna)=0D
  Removed docstring reflow (It's upstream already)=0D
  Kept RBs.=0D
=0D
007/17:[0004] [FC] 'iotests: rebase qemu_io() on top of qemu_tool()'=0D
  Quoted return types (Needed for older Python versions)=0D
=0D
011/17:[0019] [FC] 'iotests/245: fixup'=0D
  Rewrite to fix this test on tmpfs (Hanna)=0D
=0D
014/17:[down] 'iotests/image-fleecing: switch to qemu_io()'=0D
  New, this test needed to be explicitly migrated away from pipe_and_status=
.=0D
=0D
015/17:[0012] [FC] 'iotests: remove qemu_io_pipe_and_status()'=0D
  This patch is basically empty after the new 014.=0D
=0D
016/17:[0006] [FC] 'iotests: remove qemu_io_silent() and qemu_io_silent_che=
ck().'=0D
  Reflow some lines (Eric)=0D
  Added RBs.=0D
=0D
017/17:[0004] [FC] 'iotests: make qemu_io_log() check return codes by defau=
lt'=0D
  Changed commit message phrasing (Hanna, IIRC)=0D
  Added RBs.=0D
=0D
Notes:=0D
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
(Maybe I'll bring these in under the fold the next time I get bored, but=0D
I think it's not worth the trouble right now, there are very few=0D
users. I did try, but the benefit to VerboseProcessError is that it=0D
includes stdout/stderr. When using Popen with pipes you lose access to=0D
that information in the management context. Popen does not natively=0D
buffer stdout/stderr, so we'd have to fall back to just using a regular=0D
CalledProcessError. I think I'd have to extend Popen and add=0D
buffering. I think that's something for later. Anyway, that's my=0D
story. How are you today? I hope you are well.)=0D
=0D
John Snow (17):=0D
  iotests: replace calls to log(qemu_io(...)) with qemu_io_log()=0D
  iotests/163: Fix broken qemu-io invocation=0D
  iotests: Don't check qemu_io() output for specific error strings=0D
  iotests/040: Don't check image pattern on zero-length image=0D
  iotests/040: Fix TestCommitWithFilters test=0D
  iotests: create generic qemu_tool() function=0D
  iotests: rebase qemu_io() on top of qemu_tool()=0D
  iotests/030: fixup=0D
  iotests/149: fixup=0D
  iotests/205: fixup=0D
  iotests/245: fixup=0D
  iotests/migration-permissions: fixup=0D
  iotests/migration-permissions: use assertRaises() for qemu_io()=0D
    negative test=0D
  iotests/image-fleecing: switch to qemu_io()=0D
  iotests: remove qemu_io_pipe_and_status()=0D
  iotests: remove qemu_io_silent() and qemu_io_silent_check().=0D
  iotests: make qemu_io_log() check return codes by default=0D
=0D
 tests/qemu-iotests/030                        | 85 +++++++++++--------=0D
 tests/qemu-iotests/040                        | 53 +++++++-----=0D
 tests/qemu-iotests/056                        |  2 +-=0D
 tests/qemu-iotests/149                        |  6 +-=0D
 tests/qemu-iotests/163                        |  5 +-=0D
 tests/qemu-iotests/205                        |  4 +-=0D
 tests/qemu-iotests/216                        | 12 +--=0D
 tests/qemu-iotests/218                        |  5 +-=0D
 tests/qemu-iotests/224                        |  4 +-=0D
 tests/qemu-iotests/242                        |  6 +-=0D
 tests/qemu-iotests/245                        | 17 ++--=0D
 tests/qemu-iotests/255                        |  4 +-=0D
 tests/qemu-iotests/258                        | 11 ++-=0D
 tests/qemu-iotests/298                        | 15 ++--=0D
 tests/qemu-iotests/303                        |  4 +-=0D
 tests/qemu-iotests/310                        | 22 ++---=0D
 tests/qemu-iotests/iotests.py                 | 69 ++++++++-------=0D
 tests/qemu-iotests/tests/image-fleecing       | 30 ++++---=0D
 .../qemu-iotests/tests/migration-permissions  | 28 +++---=0D
 .../tests/mirror-ready-cancel-error           |  2 +-=0D
 .../qemu-iotests/tests/nbd-reconnect-on-open  |  2 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |  4 +-=0D
 22 files changed, 210 insertions(+), 180 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


