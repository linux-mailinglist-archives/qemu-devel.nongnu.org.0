Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF62F82C3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:46:21 +0100 (CET)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TAy-0005TB-2k
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8C-0003ix-RY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T88-0001O8-Pg
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610732603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5sOOL7NOxs3IRo72v/x+wBz1i/gH7zb6rJvQEGrRqV4=;
 b=OgreI2X40xB2hB+RNJMqN0Z+yx7K6Gc7/ncQwRDDgwla6cVYw1aN9i0prr4UMWn7a6V0rs
 X/lNVERz/5cZIs+fsw0GiY+B8ryF1mdgGyNqTtmFS4j37rHyjKP95KhP6P4O2QB4eoJHxJ
 IRJCERrDauRcFedfH9GPWF6lLDDLXz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-4m-mYQG9Msqi8aVUOXs6FQ-1; Fri, 15 Jan 2021 12:43:19 -0500
X-MC-Unique: 4m-mYQG9Msqi8aVUOXs6FQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D826879500;
 Fri, 15 Jan 2021 17:43:18 +0000 (UTC)
Received: from localhost (ovpn-114-144.ams2.redhat.com [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B2A19C45;
 Fri, 15 Jan 2021 17:43:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: =?UTF-8?q?=5BPATCH=20v4=2000/10=5D=20iotests=3A=20Fix=20129=20and=20expand=20297=E2=80=99s=20reach?=
Date: Fri, 15 Jan 2021 18:43:05 +0100
Message-Id: <20210115174315.30949-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover letters:
v1: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00254.html
v2: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00296.html
v3: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00371.html

git:
https://github.com/XanClic/qemu.git fix-129-2-v4
https://git.xanclic.moe/XanClic/qemu.git fix-129-2-v4


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


Change in v4 (from v3):
- Patch 2:
  - Fix flake8 complaints (PEP8 violations)
  - Modify only a copy of os.environ, and pass that down to pylint and
    mypy (instead of accidentally modifying os.environ itself)
  - s/text=True/universal_newlines=True/
    (@text was added in Python 3.7, but qemu requires only 3.6)

- Patch 6:
  - Fix flake8 complaints (PEP8 violations); kept R-bs, it’s just a
    question of indentation

- Patch 9:
  - Mention modification to 297 in the commit message

- Patch 10:
  - Mention modification to 297 in the commit message
  - s/PYTHONPATH/sys.path/
  - Fix flake8 complaints (PEP8 violations)


git-backport-diff of v3 <-> v4:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[----] [--] 'iotests.py: Assume a couple of variables as given'
002/10:[0007] [FC] 'iotests/297: Rewrite in Python and extend reach'
003/10:[----] [--] 'iotests: Move try_remove to iotests.py'
004/10:[----] [--] 'iotests/129: Remove test images in tearDown()'
005/10:[----] [--] 'iotests/129: Do not check @busy'
006/10:[0004] [FC] 'iotests/129: Use throttle node'
007/10:[----] [-C] 'iotests/129: Actually test a commit job'
008/10:[----] [--] 'iotests/129: Limit mirror job's buffer size'
009/10:[----] [--] 'iotests/129: Clean up pylint and mypy complaints'
010/10:[0006] [FC] 'iotests/300: Clean up pylint and mypy complaints'


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
 tests/qemu-iotests/297        | 110 +++++++++++++++++++++++++++-------
 tests/qemu-iotests/297.out    |   5 +-
 tests/qemu-iotests/300        |  19 ++++--
 tests/qemu-iotests/iotests.py |  37 ++++++------
 6 files changed, 169 insertions(+), 82 deletions(-)

-- 
2.29.2


