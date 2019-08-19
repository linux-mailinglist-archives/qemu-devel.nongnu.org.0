Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE594ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:22:43 +0200 (CEST)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzoAM-0004w7-T2
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzo7K-00010d-0b
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzo7I-0004JA-OQ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:19:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50698)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzo7F-0004I4-CL; Mon, 19 Aug 2019 16:18:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DDB6315C01E;
 Mon, 19 Aug 2019 20:18:56 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20D421F4;
 Mon, 19 Aug 2019 20:18:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 22:18:43 +0200
Message-Id: <20190819201851.24418-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 19 Aug 2019 20:18:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/8] iotests: Selfish patches
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Nothing has changed too much since the previous version, thus I=E2=80=99l=
l start
with a link to its cover letter:

https://lists.nongnu.org/archive/html/qemu-block/2019-06/msg01102.html


What has changed is this:

v3:
- Patches 2 and 3: Resolved rebase conflicts

- Added patch 4.  It seems useful to support the new case-skipping
  method in @iotests.skip_if_unsupported so that annotation works even
  with setUp().

- Added patch 5.  This has been proposed by Kevin back in v1 (for a
  slightly different reason, though).
  Now that I added patch 4, it would be nice if I could make use of it
  for patches 6 and 7, but the problem is that both tests store the
  driver name in a class attribute.  Therefore, we need patch 5 that
  allows us to query that attribute=E2=80=99s value in skip_if_unsupporte=
d().

- Patches 6 and 7: Make use of the fact that the annotation works now
  (Also, I dropped supported_null_drivers, because there is no point in
  having it =E2=80=93 especially with patch 8.)
  ((Also, resolved rebase conflicts.))

- Added patch 8.  It just itches me that we call qemu every time we
  inquire the list of supported formats, and this patch eases that itch.


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream pat=
ch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively

001/8:[----] [--] 'iotests: Add -display none to the qemu options'
002/8:[0004] [FC] 'iotests: Prefer null-co over null-aio'
003/8:[0003] [FC] 'iotests: Allow skipping test cases'
004/8:[down] 'iotests: Use case_skip() in skip_if_unsupported()'
005/8:[down] 'iotests: Let skip_if_unsupported() accept a method'
006/8:[0014] [FC] 'iotests: Test driver whitelisting in 093'
007/8:[0010] [FC] 'iotests: Test driver whitelisting in 136'
008/8:[down] 'iotests: Cache supported_formats()'


Max Reitz (8):
  iotests: Add -display none to the qemu options
  iotests: Prefer null-co over null-aio
  iotests: Allow skipping test cases
  iotests: Use case_skip() in skip_if_unsupported()
  iotests: Let skip_if_unsupported() accept a method
  iotests: Test driver whitelisting in 093
  iotests: Test driver whitelisting in 136
  iotests: Cache supported_formats()

 tests/qemu-iotests/093        | 19 +++++++++------
 tests/qemu-iotests/136        | 14 +++++++----
 tests/qemu-iotests/245        |  2 +-
 tests/qemu-iotests/check      |  6 ++---
 tests/qemu-iotests/iotests.py | 45 ++++++++++++++++++++++++++++-------
 5 files changed, 62 insertions(+), 24 deletions(-)

--=20
2.21.0


