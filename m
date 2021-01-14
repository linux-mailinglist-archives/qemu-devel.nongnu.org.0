Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169512F6777
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:25:06 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Mr-0004Tj-3k
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061y-0007MN-C2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061q-0006tU-Lk
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EgXF4MSPE/BlMSTcq0D25Z9/uhJ1QYk6ndI1jkNdXfU=;
 b=f6Eg8Ys8HV7Ansg2lBt+JXLESVHl+W/gM1UB0E3pY7Q9N66tR4CMrn6PZqliq1ZvrIV1O3
 znepxipE5SKS0ITL6q7vUI/FxpAFqmP5JYLvw8QW4rxf9cIkWRH0EFROY2g4PqjAx3tOXW
 M77IjYVZ6t9V2TZsl3Qmm4iIO0oH9ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-fFgvN41iO8mozby1DVX_CQ-1; Thu, 14 Jan 2021 12:03:07 -0500
X-MC-Unique: fFgvN41iO8mozby1DVX_CQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5CC1CC621;
 Thu, 14 Jan 2021 17:03:06 +0000 (UTC)
Received: from localhost (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CD260C47;
 Thu, 14 Jan 2021 17:03:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: =?UTF-8?q?=5BPATCH=20v3=2000/10=5D=20iotests=3A=20Fix=20129=20and=20expand=20297=E2=80=99s=20reach?=
Date: Thu, 14 Jan 2021 18:02:54 +0100
Message-Id: <20210114170304.87507-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover letters:
v1: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00254.html
v2: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00296.html

git:
https://github.com/XanClic/qemu.git fix-129-2-v3
https://git.xanclic.moe/XanClic/qemu.git fix-129-2-v3


Hi,

See the v1 cover letter above for the main point of this series (it’s
just that all patch indices are shifted up by two).


The main change in v2 is the extension of iotest 297 to run pylint and
mypy not only on iotests.py, but on every Python file in the
qemu-iotests/ directory that isn’t part of a skip list.

The main changes in v3 are that 297 is rewritten in Python, that patch 1
is added (which helps tests to pass mypy scrutiny without having to
assert that vital variables such as iotests.test_dir are not None), and
that patch 10 is added (because I was already modifying 300 in patch 1,
so I thought i might as well).


Changes in v3 (from v2):
- Patch 1: Some vital environment variables such as TEST_DIR are
  currently fetched with os.environ.get(), which returns an
  Optional[str] type.  Every test wanting to use them has to assert they
  are not None, or mypy will complain.
  This new patch makes iotests.py use os.environ[] for those vital
  variables instead, which makes them of plain str type.

- Patch 2:
  - Rewrite 297 in Python
  - As in v2, make it check all Python files in qemu-iotests/ by
    default, skipping “only” files given in an explicit list.  This list
    is extremely long right now, but at least patches 9 and 10 make it
    one entry shorter each.
  - Drop the list of checked files from the reference output, because
    that may lead to conflicts when backporting patches etc.

- Patch 9: Drop 'assert iotests.test_dir is not None', because patch 1
  makes that unnecessary.  (Also, some changes in how 297 is treated,
  thanks to the changes in patch 2.)

- Patch 10: When writing patch 1, I looked for iotests that contained
  such 'assert iotests.* is not None' lines, and 300 was the one I
  found.  That made it look to me like it was already written with mypy
  acceptance in mind.  Turned out there were still a couple of things to
  fix, but then I was already working on it and decided there’s no point
  in not making a patch out of it.


git-backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[down] 'iotests.py: Assume a couple of variables as given'
002/10:[down] 'iotests/297: Rewrite in Python and extend reach'
003/10:[----] [--] 'iotests: Move try_remove to iotests.py'
004/10:[----] [--] 'iotests/129: Remove test images in tearDown()'
005/10:[----] [--] 'iotests/129: Do not check @busy'
006/10:[----] [--] 'iotests/129: Use throttle node'
007/10:[----] [--] 'iotests/129: Actually test a commit job'
008/10:[----] [--] 'iotests/129: Limit mirror job's buffer size'
009/10:[0007] [FC] 'iotests/129: Clean up pylint and mypy complaints'
010/10:[down] 'iotests/300: Clean up pylint and mypy complaints'


Max Reitz (10):
  iotests.py: Assume a couple of variables as given
  iotests/297: Rewrite in Python and extend reach
  iotests: Move try_remove to iotests.py
  iotests/129: Remove test images in tearDown()
  iotests/129: Do not check @busy
  iotests/129: Use throttle node
  iotests/129: Actually test a commit job
  iotests/129: Limit mirror job's buffer size
  iotests/129: Clean up pylint and mypy complaints
  iotests/300: Clean up pylint and mypy complaints

 tests/qemu-iotests/124        |   8 +--
 tests/qemu-iotests/129        |  72 +++++++++++++---------
 tests/qemu-iotests/297        | 109 +++++++++++++++++++++++++++-------
 tests/qemu-iotests/297.out    |   5 +-
 tests/qemu-iotests/300        |  19 ++++--
 tests/qemu-iotests/iotests.py |  37 ++++++------
 6 files changed, 168 insertions(+), 82 deletions(-)

-- 
2.29.2


